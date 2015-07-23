Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC7E761B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:30:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2015 06:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,530,1432623600"; d="scan'208";a="753082798"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2015 06:30:22 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id BC0856A4083;
	Thu, 23 Jul 2015 06:29:38 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 16:40:44 +0300
Message-Id: <1437658844-12604-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] oeqa/buildoptions.py: automate test case 929: check for correct GPL licenses
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
X-List-Received-Date: Thu, 23 Jul 2015 13:30:26 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index e79be9e..ab009f2 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -132,6 +132,36 @@ class BuildImagesTest(oeSelfTest):
         res = bitbake("core-image-directfb", ignore_status=True)
         self.assertEqual(res.status, 0, "\ncoreimagedirectfb failed to build. Please check logs for further details.\nbitbake output %s" % res.output)
 
+    @testcase(929)
+    def test_gpl_licenses(self):
+        """
+        Test for checking that correct GPL licenses are used when explicitly required.
+        """
+        self.add_command_to_tearDown('cleanup-workdir')
+        self.write_config("MACHINE = \"qemux86\"\nINHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nCOPYLEFT_LICENSE_INCLUDE = \"GPLv2* GPLv3*\"")
+        res = bitbake("core-image-minimal", ignore_status=True)
+        self.remove_config("MACHINE = \"qemux86\"\nINHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nCOPYLEFT_LICENSE_INCLUDE = \"GPLv2* GPLv3*\"")
+        self.assertEqual(res.status, 0, "core-image-minimal didn't build. Please check logs for further details %s" % res.output)
+        built_pkgs_list = os.listdir(self.builddir + "/tmp/deploy/sources/i586-poky-linux/")# the list containing built pkgs with ver.
+        pkg_name_split = [i.split("-") for i in built_pkgs_list]
+        pkgs = [] # this will contain the pkgs name as found in tmp/deploy/licenses
+        for i in pkg_name_split:
+          name = ""
+          for j in i:
+            if i.index(j) == 0:
+              name = j
+            elif j.isalpha() and i.index(j) != 0:
+              name = name + "-" + j
+            else:
+              pkgs.append(name)
+              break
+        license_dir = self.builddir + "/tmp/deploy/licenses/"
+        for i in pkgs:
+          if os.path.isdir(license_dir + i):
+            self.assertTrue(g.glob(license_dir + i + "/*GPL*"), "couldn't find GPL license in " + license_dir + "for package " + i)
+          else:
+            self.log.info("\nNo license dir for %s" % i)
+
 class ArchiverTest(oeSelfTest):
     @testcase(926)
     def test_arch_work_dir_and_export_source(self):
-- 
2.1.4


