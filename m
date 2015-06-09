Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 123946AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 11:59:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2015 04:59:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="723815204"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2015 04:59:19 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 08B9D6A4083;
	Tue,  9 Jun 2015 04:58:43 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 15:09:13 +0300
Message-Id: <1433851753-1117-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lib/oeqa/selftest/buildoptions.py: added auto test for archiving the work directory and exporting the source files
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
X-List-Received-Date: Tue, 09 Jun 2015 11:59:22 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index cddfa48..be75311 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -2,6 +2,8 @@ import unittest
 import os
 import logging
 import re
+import glob as g
+import pexpect as p
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.selftest.buildhistory import BuildhistoryBase
@@ -9,6 +11,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
 from oeqa.utils.decorators import testcase
 
+
 class ImageOptionsTests(oeSelfTest):
 
     @testcase(761)
@@ -133,7 +136,7 @@ class BuildImagesTest(oeSelfTest):
         self.remove_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
         self.assertEqual(self.res, 0, "\ncore-image-directfb failed to build. Please check logs for further details.\n")
 
-   @testcase(283)
+    @testcase(283)
     def test_btrfs(self):
         """
         This method is used to test the build of an image with btrfs file system. After building it, qemu is launched
@@ -184,4 +187,19 @@ class ArchiverTest(oeSelfTest):
         self.license_dir = self.builddir + "/tmp/deploy/licenses/"
         for i in self.pkgs:
           if os.path.isdir(self.license_dir + i):
-            self.assertTrue(g.glob(self.license_dir + i + "/*GPL*"), "couldn't find GPL license in " + self.license_dir + i)
\ No newline at end of file
+            self.assertTrue(g.glob(self.license_dir + i + "/*GPL*"), "couldn't find GPL license in " + self.license_dir + i)
+
+    @testcase(926)
+    def test_arch_work_dir_and_export_source(self):
+        """
+        Test for archiving the work directory and exporting the source files.
+        """
+        self.add_command_to_tearDown('cleanup-workdir')
+        self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
+        self.res = bitbake("xcursor-transparent-theme").status
+        self.remove_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
+        self.assertEqual(self.res, 0, "\nCouldn't build xcursor-transparent-theme.\n")
+        self.pkgs_path = g.glob(str(self.builddir) + "/tmp/deploy/sources/allarch*/xcurs*")
+        self.src_file_glob = str(self.pkgs_path[0]) + "/xcursor*.src.rpm"
+        self.tar_file_glob = str(self.pkgs_path[0]) + "/xcursor*.tar.gz"
+        self.assertTrue((g.glob(self.src_file_glob) and g.glob(self.tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under tmp/deploy/sources/allarch*/xcursor*")
\ No newline at end of file
-- 
2.1.4


