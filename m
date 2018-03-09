Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 174CB71A70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 13:00:02 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id n7so8941705wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 05:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ClOWWF6fj+7wN2nSxXLld9V+qPdu1Ft8NuXq8A5jEx0=;
	b=XzddK08dd5DzteI6bpoWc5xfehLuyC4428vGT8085AKop7Ch8cAdvlvP30VOUEtZIn
	z3gtlW/3krol21wtn/tF08+oaG+haH1zBT823aYbeQKZrT5cGtoeHeYIR4xsRzyiSjy6
	dQTttUucuMsasFJsjtY4G7xqNj//qasAazKi2rZRckt5ksGToYwCDLTPhAAUh9pBcplG
	lbTykDB18XgublVV7yDLjh/f6wkUWLxO1tmoPuxTAtWtRLA0VKU+Ma65WikRBgmW7KF9
	7oCm2PFsUhMKwL2iN+6Jh/LsE14C2oHwEEsse9eS3Q2pMhzZcl84373Oz2io/kZsAsVe
	8UwA==
X-Gm-Message-State: APf1xPAMSA2qbcU3f4/47LbEvEy3gl5/PB9SnQ54JQuw6QujqyNo+xYW
	/8i/MtlOEsa/3uijLf6A1UIwYyCs
X-Google-Smtp-Source: AG47ELubRHbFZ7quzTafS/UcSaMmVVYLLm3Gq+Cfzd9/NxPJsSdScVCNfldRCBMqr/WCEKtCVANPDA==
X-Received: by 10.223.196.250 with SMTP id o55mr27057624wrf.200.1520600402694; 
	Fri, 09 Mar 2018 05:00:02 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id m3sm974674wri.25.2018.03.09.05.00.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 05:00:01 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 13:00:00 +0000
Message-Id: <20180309130000.1937-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [PATCH] rootfs-postcommaneds: put image testdata under sstate control
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
X-List-Received-Date: Fri, 09 Mar 2018 13:00:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The testdata.json is being written to DEPLOY_DIR_IMAGE directly,
thus bypassing sstate, which results in an ever growing list
of files.

Write them to IMGDEPLOYDIR instead, so as to benefit from the
automatic management via sstate.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/rootfs-postcommands.bbclass | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a4e627fef8..01eee350b8 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -303,17 +303,18 @@ rootfs_sysroot_relativelinks () {
 python write_image_test_data() {
     from oe.data import export2json
 
-    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_NAME'))
-    testdata_link = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
+    deploy_dir = d.getVar('IMGDEPLOYDIR')
+    link_name = d.getVar('IMAGE_LINK_NAME')
+    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" % d.getVar('IMAGE_NAME'))
 
-    bb.utils.mkdirhier(os.path.dirname(testdata))
     searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
-    export2json(d, testdata,searchString=searchString,replaceString="")
+    export2json(d, testdata_name, searchString=searchString, replaceString="")
 
-    if testdata_link != testdata:
+    if os.path.exists(testdata_name):
+        testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
         if os.path.lexists(testdata_link):
-           os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata), testdata_link)
+            os.remove(testdata_link)
+        os.symlink(os.path.basename(testdata_name), testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
-- 
2.16.2


