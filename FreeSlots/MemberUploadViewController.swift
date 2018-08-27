//
//  MemberUploadViewController.swift
//  FreeSlots
//
//  Created by Tushar Singh on 27/08/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import UIKit
import Alamofire
//#import <ImageIO/CGImageProperties.h>
//#import <ImageIO/CGImageSource.h>

class MemberUploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    //MARK:- Outlets :
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var regnoField: UITextField!
    @IBOutlet weak var phoneNoField: UITextField!
    @IBOutlet weak var blockField: UITextField!
    
    @IBAction func selectButton(_ sender: Any) {

        
    }
    
    @IBAction func uploadButton(_ sender: Any) {
        var imageController = UIImagePickerController()
        imageController.delegate=self
        imageController.sourceType=UIImagePickerControllerSourceType.photoLibrary
        self.present(imageController, animated: true, completion: nil)
        
        
    }
   
    @IBAction func submitButton(_ sender: Any) {
        
        if(nameField.text != "" && emailField.text != "" && regnoField.text != "" && blockField.text != "" && phoneNoField.text != ""){
            let name = nameField.text
            let emailId = emailField.text
            let regNo = regnoField.text
            let blockNo = blockField.text
            let phoneNo = phoneNoField.text
            let userObject = User(name: name!, emailId: emailId!, regNo: regnoField.text!, blockNo: blockField.text!, phoneNo: phoneNoField.text!)
            let postURL=urlGenerator(baseURL: url, name: name!, regNo: regNo!, email: emailId!, phoneNo: phoneNo!, block: blockNo!)
            print("NOT NULL")
        }
        else{
            print("NULL")
        }
        print("sender")
    }
/*******************************************************************************************/

    //MARK:- Properties
    var url = "https://freeslots.herokuapp.com/members"
//    var timeTableImage:UIImage
    
/*******************************************************************************************/


    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    //MARK:- Methods:
    func urlGenerator(baseURL:String,name:String,regNo:String,email:String,phoneNo:String,block:String)->String{
        let finalURL = baseURL+"/"+name+"/"+email+"/"+phoneNo+"/"+regNo+"/"+block+"/"
        print(finalURL)
        
    return finalURL
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let info:NSDictionary = info as NSDictionary
        let img:UIImage = info.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage
        //timeTableImage=img
        
    }


}
