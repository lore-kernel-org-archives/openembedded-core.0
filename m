Return-Path: <costin.c.constantin@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BCBDC6AC43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 13:26:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jun 2015 06:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,558,1427785200"; d="scan'208";a="582697490"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 05 Jun 2015 06:26:17 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 80B236A4083;
	Fri,  5 Jun 2015 06:25:43 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 16:36:07 +0300
Message-Id: <1433511367-4995-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest: added auto-test for archiving working dir and expeort source package
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
X-List-Received-Date: Fri, 05 Jun 2015 13:26:17 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 620fd77..8cacd1e 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -123,16 +123,19 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
-class BuildImagesTest(oeSelfTest):
-    @testcase(563)
-    def test_directfb(self):
+class ArchiverTest(oeSelfTest):
+    @testcase(926)
+    def test_arch_work_dir_and_export_source(self):
         """
-        This method is used to test the build of directfb image for arm arch.
-        In essence we build a core-image-directfb and test the exitcode of bitbake that in case of success is 0.
+        Test for archiving the work directory and exporting the source files.
         """
         self.add_command_to_tearDown('cleanup-workdir')
-        self.write_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
-        self.res = bitbake("core-image-directfb").status
-        self.remove_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
-        self.assertEqual(self.res, 0, "\ndirectfb image couldn't be built\n")
-        self.assertEqual(self.res, 0, "\ncore-image-directfb failed to build. Please check logs for further details.\n")
\ No newline at end of file
+        self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
+        self.res = bitbake("xcursor-transparent-theme").status
+        self.remove_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
+        self.assertEqual(self.res, 0, "\nCouldn't build xcursor-transparent-theme.\n")
+        self.pkgs_path = g.glob(str(self.builddir) + "/tmp/deploy/sources/allarch*/xcurs*")
+        self.src_file_glob = str(self.pkgs_path[0]) + "/xcursor*.src.rpm"
+        self.tar_file_glob = str(self.pkgs_path[0]) + "/xcursor*.tar.gz"
+        if (g.glob(self.src_file_glob) and g.glob(self.tar_file_glob)):
+            self.assertTrue(True, "Couldn't find .src.rpm and .tar.gz files under tmp/deploy/sources/allarch*/xcursor*")
\ No newline at end of file
-- 
2.1.4


