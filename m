Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A9AE1757C2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 13:17:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jun 2015 06:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,558,1427785200"; d="scan'208";a="737702340"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2015 06:17:31 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id BBA2F6A4083;
	Fri,  5 Jun 2015 06:16:57 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 16:27:19 +0300
Message-Id: <1433510839-4786-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest: added auto-test for btrfs image type
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
X-List-Received-Date: Fri, 05 Jun 2015 13:17:43 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 926ffe9..e48bd04 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -2,6 +2,10 @@ import unittest
 import os
 import logging
 import re
+from time import sleep
+import pexpect as p
+import glob as g
+
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
@@ -119,8 +123,27 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
-
-
-
-
-
+class BuildImagesTest(oeSelfTest):
+    @testcase(283)
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
\ No newline at end of file
-- 
2.1.4


