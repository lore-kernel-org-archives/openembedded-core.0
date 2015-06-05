Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3496AC43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 13:28:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jun 2015 06:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,558,1427785200"; d="scan'208";a="741592787"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 05 Jun 2015 06:28:49 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id D09026A4083;
	Fri,  5 Jun 2015 06:28:14 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 16:38:38 +0300
Message-Id: <1433511518-5113-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest: added an auto-test to filter packages by license
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
X-List-Received-Date: Fri, 05 Jun 2015 13:28:48 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 36 ++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 8cacd1e..257122a 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -124,18 +124,30 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
 class ArchiverTest(oeSelfTest):
-    @testcase(926)
-    def test_arch_work_dir_and_export_source(self):
+    @testcase(929)
+    def test_gpl_licenses(self):
         """
-        Test for archiving the work directory and exporting the source files.
+        Test for checking that correct GPL licenses are used when explicitly required.
         """
         self.add_command_to_tearDown('cleanup-workdir')
-        self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
-        self.res = bitbake("xcursor-transparent-theme").status
-        self.remove_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
-        self.assertEqual(self.res, 0, "\nCouldn't build xcursor-transparent-theme.\n")
-        self.pkgs_path = g.glob(str(self.builddir) + "/tmp/deploy/sources/allarch*/xcurs*")
-        self.src_file_glob = str(self.pkgs_path[0]) + "/xcursor*.src.rpm"
-        self.tar_file_glob = str(self.pkgs_path[0]) + "/xcursor*.tar.gz"
-        if (g.glob(self.src_file_glob) and g.glob(self.tar_file_glob)):
-            self.assertTrue(True, "Couldn't find .src.rpm and .tar.gz files under tmp/deploy/sources/allarch*/xcursor*")
\ No newline at end of file
+        self.write_config("MACHINE = \"qemux86\"\nINHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nCOPYLEFT_LICENSE_INCLUDE = \"GPLv2* GPLv3*\"")
+        self.res = bitbake("core-image-minimal").status
+        self.remove_config("MACHINE = \"qemux86\"\nINHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nCOPYLEFT_LICENSE_INCLUDE = \"GPLv2* GPLv3*\"")
+        self.assertEqual(self.res, 0, "core-image-minimal didn't build. Please check logs for further details")
+        self.built_pkgs_list = os.listdir(self.builddir + "/tmp/deploy/sources/i586-poky-linux/")# the list containing built pkgs with ver.
+        self.pkg_name_split = [i.split("-") for i in self.built_pkgs_list]
+        self.pkgs = [] # this will contain the pkgs name as found in tmp/deploy/licenses
+        for i in self.pkg_name_split:
+          self.name = ""
+          for j in i:
+            if i.index(j) == 0:
+              self.name = j
+            elif j.isalpha() and i.index(j) != 0:
+              self.name = self.name + "-" + j
+            else:
+              self.pkgs.append(self.name)
+              break
+        self.license_dir = self.builddir + "/tmp/deploy/licenses/"
+        for i in self.pkgs:
+          if os.path.isdir(self.license_dir + i):
+            self.assertTrue(g.glob(self.license_dir + i + "/*GPL*"), "couldn't find GPL license in " + self.license_dir + i)
\ No newline at end of file
-- 
2.1.4


