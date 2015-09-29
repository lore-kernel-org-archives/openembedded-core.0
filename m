Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B673D74242
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:03:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 29 Sep 2015 06:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,608,1437462000"; d="scan'208";a="654314854"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 29 Sep 2015 06:02:47 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 544D36A4005;
	Tue, 29 Sep 2015 06:01:51 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 16:04:04 +0300
Message-Id: <1443531844-17106-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest/wic: Added testcase decorator to all testcases + fixed minor typos.
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
X-List-Received-Date: Tue, 29 Sep 2015 13:03:09 -0000

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3dc54a4..9425dc0 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -31,6 +31,8 @@ from shutil import rmtree
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
+
 
 class Wic(oeSelfTest):
     """Wic test class."""
@@ -56,24 +58,29 @@ class Wic(oeSelfTest):
 
         rmtree(self.resultdir, ignore_errors=True)
 
+    @testcase(1208)
     def test01_help(self):
         """Test wic --help"""
         self.assertEqual(0, runCmd('wic --help').status)
 
+    @testcase(1209)
     def test02_createhelp(self):
         """Test wic create --help"""
         self.assertEqual(0, runCmd('wic create --help').status)
 
+    @testcase(1210)
     def test03_listhelp(self):
         """Test wic list --help"""
         self.assertEqual(0, runCmd('wic list --help').status)
 
+    @testcase(1211)
     def test04_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
+    @testcase(1212)
     def test05_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
@@ -87,33 +94,40 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
+    @testcase(1157)
     def test06_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
+    @testcase(1213)
     def test07_unsupported_subcommand(self):
         """Test unsupported subcommand"""
         self.assertEqual(1, runCmd('wic unsupported',
                          ignore_status=True).status)
 
+    @testcase(1214)
     def test08_no_command(self):
         """Test wic without command"""
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
-    def test09_help_kickstart(self):
+    @testcase(1215)
+    def test09_help_overview(self):
         """Test wic help overview"""
         self.assertEqual(0, runCmd('wic help overview').status)
 
+    @testcase(1216)
     def test10_help_plugins(self):
         """Test wic help plugins"""
         self.assertEqual(0, runCmd('wic help plugins').status)
 
+    @testcase(1217)
     def test11_help_kickstart(self):
         """Test wic help kickstart"""
         self.assertEqual(0, runCmd('wic help kickstart').status)
 
+    @testcase(1264)
     def test12_compress_gzip(self):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -122,7 +136,8 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.gz")))
 
-    def test13_compress_gzip(self):
+    @testcase(1265)
+    def test13_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
@@ -130,7 +145,8 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.bz2")))
 
-    def test14_compress_gzip(self):
+    @testcase(1266)
+    def test14_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
@@ -138,12 +154,14 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.xz")))
 
+    @testcase(1267)
     def test15_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c wrong", ignore_status=True).status)
 
+    @testcase(1268)
     def test16_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         wks = "directdisk-multi-rootfs"
@@ -154,6 +172,7 @@ class Wic(oeSelfTest):
                                    % wks).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
 
+    @testcase(1269)
     def test17_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
@@ -171,13 +190,15 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + \
                                      "%(wks)s-*.direct" % vars)))
 
+    @testcase(1264)
     def test18_iso_image(self):
-        """Test creation of hybrid iso imagewith legacy and EFI boot"""
+        """Test creation of hybrid iso image with legacy and EFI boot"""
         self.assertEqual(0, runCmd("wic create mkhybridiso "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
+    @testcase(1347)
     def test19_image_env(self):
         """Test generation of <image>.env files."""
         image = 'core-image-minimal'
@@ -200,6 +221,7 @@ class Wic(oeSelfTest):
                 self.assertTrue(var in content, "%s is not in .env file" % var)
                 self.assertTrue(content[var])
 
+    @testcase(1351)
     def test20_wic_image_type(self):
         """Test building wic images by bitbake"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
@@ -214,6 +236,7 @@ class Wic(oeSelfTest):
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
+    @testcase(1348)
     def test21_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         image = "qemux86-directdisk"
@@ -221,6 +244,7 @@ class Wic(oeSelfTest):
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
+    @testcase(1349)
     def test22_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
         image = "mkgummidisk"
@@ -228,6 +252,7 @@ class Wic(oeSelfTest):
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
+    @testcase(1350)
     def test23_mkefidisk(self):
         """Test creation of mkefidisk image"""
         image = "mkefidisk"
-- 
2.1.0


