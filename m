Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 44CCA734D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 11:18:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2015 04:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="723795893"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2015 04:18:19 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id AB9DD6A4083;
	Tue,  9 Jun 2015 04:17:44 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 14:28:13 +0300
Message-Id: <1433849293-21754-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lib/oeqa/selftest/buildoptions.py: added auto test for btrfs based images
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
X-List-Received-Date: Tue, 09 Jun 2015 11:18:21 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index c69da68..a3297fd 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -131,5 +131,28 @@ class BuildImagesTest(oeSelfTest):
         self.write_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
         self.res = bitbake("core-image-directfb").status
         self.remove_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
-        self.assertEqual(self.res, 0, "\ndirectfb image couldn't be built\n")
-        self.assertEqual(self.res, 0, "\ncore-image-directfb failed to build. Please check logs for further details.\n")
\ No newline at end of file
+        self.assertEqual(self.res, 0, "\ncore-image-directfb failed to build. Please check logs for further details.\n")
+
+   @testcase(283)
+    def test_btrfs(self):
+        """
+        This method is used to test the build of an image with btrfs file system. After building it, qemu is launched
+        and the test searches for the "login" keyword that it expects in order to consider an image as functional.
+        Please note that "runquemu" requires sudo access. In order to solve this please add to visudo (sudo visudo)
+        the following line:  your_username  ALL=NOPASSWD:       ALL
+        The above setting was tested in Ubuntu
+        """
+        self.add_command_to_tearDown('cleanup-workdir')
+        self.write_config("MACHINE = \"qemux86\"\nIMAGE_FSTYPES = \"btrfs\"\nKERNEL_FEATURES_append = \" cfg/fs/btrfs \"")
+        self.res = bitbake("core-image-sato").status
+        self.remove_config("MACHINE = \"qemux86\"\nIMAGE_FSTYPES = \"btrfs\"\nKERNEL_FEATURES_append = \" cfg/fs/btrfs \"")
+        self.assertEqual(self.res, 0, "\nbtrfs core-image-sato failed to build. Please check logs for further details.\n")
+        self.prc = p.spawn("runqemu qemux86 core-image-sato nographic")
+        try:
+          self.prc.expect("login", timeout=150)
+          self.prc.kill(9)
+          self.assertTrue(True, "couldn't start qemu")
+        except:
+          self.prc.kill(9)
+          self.log.error("It is possible that runquemu didn't start correctly. Add this line your_username  ALL=NOPASSWD:       ALL\nto your visudo")
+          self.assertTrue(False, "Couldn't start qemu")
-- 
2.1.4


