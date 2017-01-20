Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 014687727F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5E7f019641; Fri, 20 Jan 2017 18:05:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5i9ZlhQaK_6U; Fri, 20 Jan 2017 18:05:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI5AGE019623
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:05:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdYk-0000ut-Ki; Fri, 20 Jan 2017 18:05:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:05:03 +0000
Message-Id: <1484935506-3419-11-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484935506-3419-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/14] selftest: fixed 3 wic test cases
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
X-List-Received-Date: Fri, 20 Jan 2017 18:05:15 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Fixed test_systemd_bootdisk, test_wic_image_type and test_qemu
test cases by building core-image-minimal with correct configuration.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 32b7446..11dc744 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -181,6 +181,10 @@ class Wic(oeSelfTest):
     @testcase(1560)
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
+        config = 'IMAGE_FSTYPES += " hddimg "\nMACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
         cmd = "wic create systemd-bootdisk -e core-image-minimal"
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
@@ -379,7 +383,11 @@ class Wic(oeSelfTest):
     @testcase(1351)
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
+        config = 'IMAGE_FSTYPES += " hddimg wic"\nWKS_FILE = "wic-image-minimal"\n'\
+                 'MACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
         self.assertEqual(0, bitbake('wic-image-minimal').status)
+        self.remove_config(config)
 
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
         machine = get_bb_var('MACHINE')
@@ -394,7 +402,11 @@ class Wic(oeSelfTest):
     @testcase(1422)
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
+        config = 'IMAGE_FSTYPES += " hddimg wic"\nWKS_FILE = "wic-image-minimal"\n'\
+                 'MACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
         self.assertEqual(0, bitbake('wic-image-minimal').status)
+        self.remove_config(config)
 
         with runqemu('wic-image-minimal', ssh=False) as qemu:
             cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
-- 
2.7.4


