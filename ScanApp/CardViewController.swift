//
//  CardViewController.swift
//  ScanApp
//
//  Created by 板垣有祐 on 2019/09/25.
//  Copyright © 2019 Yusuke Itagaki. All rights reserved.
//

import UIKit
import SDWebImage

class CardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var displayName = String()
    var pictureURLString = String()
    
    @IBOutlet weak var myProfileImageView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    
    let refleshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ログインをしたことを残す
        UserDefaults.standard.setValue(1, forKey: "loginOK")
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        //インジケーターの下に表示する文字列を設定する。
        refleshControl.attributedTitle = NSAttributedString(string: "引っ張って更新！")
        
        //インジケーターの色を設定する。
        refleshControl.tintColor = UIColor.red
        
        // 引っ張った時に呼ばれるメソッドをvalueChangedイベントを使って設定。
        refleshControl.addTarget(self, action: #selector(refleshContents), for: .valueChanged)

        // ビューを追加する
        tableView.addSubview(refleshControl)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        displayName = UserDefaults.standard.object(forKey: "displayName") as! String
        pictureURLString = UserDefaults.standard.object(forKey: "pictureURLString") as! String
        
        displayNameLabel.text = displayName
        
        let url = URL(string: pictureURLString)
        myProfileImageView.sd_setImage(with: url, completed: nil)
    }
    
    // 実際に呼ばれるメソッド
    @objc func refleshContents() {
        
        
        
        //テーブルを再読み込みする。
        tableView.reloadData()
        
        //読込中の表示を消す。
        refleshControl.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return 
    }


}
