Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D564E7712D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 09:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u339ELvJ013007 for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Apr 2016 10:14:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ULuQPl1o_pDQ
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 10:14:21 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u339EF0Q012997
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Apr 2016 10:14:17 +0100
Message-ID: <1459674855.7348.137.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 03 Apr 2016 10:14:15 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] build-appliance-image: Exclude DDATETIME from task signature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Apr 2016 09:14:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise the task hash changes between server and worker context
leading to changing task checksums.  

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/images/build-appliance-image_14.0.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
index 1086949..5959a1a 100644
--- a/meta/recipes-core/images/build-appliance-image_14.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
@@ -96,6 +96,7 @@ create_bundle_files () {
 	zip -r ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
 	ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${DEPLOY_DIR_IMAGE}/Yocto_Build_Appliance.zip 
 }
+create_bundle_files[vardepsexclude] = "DATETIME"
 
 python do_bundle_files() {
     bb.build.exec_func('create_bundle_files', d)



