Return-Path: <ptsneves@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6537949D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 17:49:59 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id p6-v6so7984762ljc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=67zPy/t85JMbPOQAJT9aAlu84tB+dtux/czQYj2sIpw=;
	b=h8Gf9wQZ2MU0mTLc7iKlMgb3hreLzQkbI3PIenddcQoFw547U7/Z+UTnd0yqjqPIXk
	bP16oZeOQqDu0m/N01s8NgZudeAcj5yL+QEPZIj0oi0xq08ibSiwA3GocI+o0cGQRz4O
	zyaPCVN3ft9FLmuEai0lHtIrrdC9KlDNJlcE98yqXlAg7551CJR25DzUqQJJTVxeyUWh
	Xt5SEotNr0KY5/sW9Vp5aqz/jeNHmhm/CNBhB/9m8zjTbND4bXkDYlYAuRx/hXBfy6EN
	LyACiWw3oCoaIGG32xHNMuF9/wAnDdy3p4ras4giZ+vHhQJ9ClKiakDt8m5I9m8qBY/5
	uQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=67zPy/t85JMbPOQAJT9aAlu84tB+dtux/czQYj2sIpw=;
	b=mElygDV3UR1o9etm3/VvrgSStyFZbAKui+tzgcpktgu2pirKLeh8Kf/RkyTBxYfU4E
	fcJH7FYmnro7JVQWMV0N3PxPW1tCSRBioItQQns05bfbez5Gs0D6ENOrnGkcSXSzlPo3
	zGyzXoTJDFH8qBvUexw+rUWuRgnzZKyDtTjSS7hlQ6wVx4FwKsR+TVzfDxWn/a8x+Nss
	f1cywmhUEuQxQyLiJNakDos+Ibe1aR/r6R8eT0sp+3E6nB3GasraNYYHlnUxG7/M/N7Q
	fayjZ5RvNlb2QOiR18uYdwavlx3fkJTFKWtwBN6OqwrrlyotP4IFEal5ysdZQA/n+Xr+
	hScw==
X-Gm-Message-State: APzg51At+KdvCKfrCxIld53QYn17Nm+iEJZr6qW+A4xCbc/DzQUZhcXu
	PU8iL4zc5/HHUmHeY+BxWlC4aKg=
X-Google-Smtp-Source: ANB0VdbT1lldZAs17PENVpSnNCdS8xy1bj5wLYkjG76pbBe2a24lo4HY0wCVIFhXgDOlRmWDpWzjJw==
X-Received: by 2002:a2e:8807:: with SMTP id x7-v6mr7782522ljh.98.1535651399931;
	Thu, 30 Aug 2018 10:49:59 -0700 (PDT)
Received: from pneves-XPS-15-9550.home
	(dynamic-62-87-243-12.ssp.dialog.net.pl. [62.87.243.12])
	by smtp.gmail.com with ESMTPSA id
	t25-v6sm1368907ljb.89.2018.08.30.10.49.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Aug 2018 10:49:59 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 19:49:36 +0200
Message-Id: <1535651376-25467-4-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
References: <1535651376-25467-1-git-send-email-ptsneves@gmail.com>
Subject: [meta-oe][PATCH v2 4/4] testimage: Moved write_image_test_data to testimage bbclass.
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
X-List-Received-Date: Thu, 30 Aug 2018 17:50:00 -0000

Previously the write_image_test_data was a rootfs post
process command. This function ran only when the rootfs
task was ran. Due to this if a variable was changed
or added to the datastore that would not trigger the do_rootfs
task, the variable would never be written into the json
file. Consequently the do_testimage task was potentially
unreproduceable and could fail if for some reason this
variable was then used.

In this commit we move the recording of the datastore to the
start of the do_testimage task. The do_testimage
task then reads this freshly generated json and passes it into
the normal test machinery. This approach allows for the test
machinery to still be loosely coupled to bitbake, and thus
still allows for the tests to be exported and used independently
from bitbake. The caveat is, if there are datastore changes
then the bitbake testimage task should be run before the tests
can be ran independently again.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 22 ----------------------
 meta/classes/testimage.bbclass           | 19 ++++++++++++++++++-
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e816824..a396c04 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -25,9 +25,6 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
 # and we don't want to disable such a default that by setting a value here.
 APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
 
-# Generates test data file with data store variables expanded in json format
-ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
-
 # Write manifest
 IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
@@ -312,25 +309,6 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-# Generated test data json file
-python write_image_test_data() {
-    from oe.data import export2json
-
-    deploy_dir = d.getVar('IMGDEPLOYDIR')
-    link_name = d.getVar('IMAGE_LINK_NAME')
-    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" % d.getVar('IMAGE_NAME'))
-
-    searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
-    export2json(d, testdata_name, searchString=searchString, replaceString="")
-
-    if os.path.exists(testdata_name):
-        testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
-        if os.path.lexists(testdata_link):
-            os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata_name), testdata_link)
-}
-write_image_test_data[vardepsexclude] += "TOPDIR"
-
 # Check for unsatisfied recommendations (RRECOMMENDS)
 python rootfs_log_check_recommends() {
     log_path = d.expand("${T}/log.do_rootfs")
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index f58d11d..192febd 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -137,6 +137,21 @@ def testimage_sanity(d):
         bb.fatal('When TEST_TARGET is set to "simpleremote" '
                  'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
 
+# Generated test data json file
+def write_image_test_data(d):
+    from oe.data import export2json
+
+    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_NAME'))
+    testdata_link = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
+
+    bb.utils.mkdirhier(os.path.dirname(testdata))
+    searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
+    export2json(d, testdata,searchString=searchString,replaceString="")
+    if testdata_link != testdata:
+        if os.path.lexists(testdata_link):
+           os.remove(testdata_link)
+        os.symlink(os.path.basename(testdata), testdata_link)
+
 def testimage_main(d):
     import os
     import json
@@ -170,12 +185,14 @@ def testimage_main(d):
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
                              d.getVar('IMAGE_LINK_NAME')))
 
+
+    write_image_test_data(d)
+
     tdname = "%s.testdata.json" % image_name
     try:
         td = json.load(open(tdname, "r"))
     except (FileNotFoundError) as err:
          bb.fatal('File %s Not Found. Have you built the image with INHERIT+="testimage" in the conf/local.conf?' % tdname)
-
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
     updateTestData(d, td, d.getVar('TESTIMAGE_UPDATE_VARS').split())
-- 
2.7.4


