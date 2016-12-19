Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B8E3077392
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:07:58 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 19 Dec 2016 13:08:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,375,1477983600"; d="scan'208";a="44344177"
Received: from jairdeje-mobl1.amr.corp.intel.com (HELO
	jairdeje-mobl1.zpn.intel.com) ([10.219.128.79])
	by orsmga005.jf.intel.com with ESMTP; 19 Dec 2016 13:08:00 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:07:33 -0600
Message-Id: <15cddecd10833351b8f74fa57b113f05e935a43b.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Subject: [PATCH v2 3/4] selftest/wic: reorganizing test methods by functionality
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
X-List-Received-Date: Mon, 19 Dec 2016 21:07:58 -0000

Part of the test methods were rearranged to group them by
functionality and identify more easily opportunities to extend
coverage.

Signed-off-by: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 184 +++++++++++++++++++++---------------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index d130ba2..52b9538 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -71,6 +71,32 @@ class Wic(oeSelfTest):
         """Test wic list --help"""
         self.assertEqual(0, runCmd('wic list --help').status)
 
+    @testcase(1215)
+    def test_help_overview(self):
+        """Test wic help overview"""
+        self.assertEqual(0, runCmd('wic help overview').status)
+
+    @testcase(1216)
+    def test_help_plugins(self):
+        """Test wic help plugins"""
+        self.assertEqual(0, runCmd('wic help plugins').status)
+
+    @testcase(1217)
+    def test_help_kickstart(self):
+        """Test wic help kickstart"""
+        self.assertEqual(0, runCmd('wic help kickstart').status)
+
+    @testcase(1213)
+    def test_unsupported_subcommand(self):
+        """Test unsupported subcommand"""
+        self.assertEqual(1, runCmd('wic unsupported',
+                                   ignore_status=True).status)
+
+    @testcase(1214)
+    def test_no_command(self):
+        """Test wic without command"""
+        self.assertEqual(1, runCmd('wic', ignore_status=True).status)
+
     @testcase(1211)
     def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
@@ -78,6 +104,64 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
+    @testcase(1157)
+    def test_gpt_image(self):
+        """Test creation of core-image-minimal with gpt table and UUID boot"""
+        cmd = "wic create directdisk-gpt --image-name core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+
+    @testcase(1346)
+    def test_iso_image(self):
+        """Test creation of hybrid iso image with legacy and EFI boot"""
+        cmd = "wic create mkhybridiso --image-name core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
+
+    @testcase(1348)
+    def test_qemux86_directdisk(self):
+        """Test creation of qemux-86-directdisk image"""
+        cmd = "wic create qemux86-directdisk -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
+
+    @testcase(1349)
+    def test_mkgummidisk(self):
+        """Test creation of mkgummidisk image"""
+        cmd = "wic create mkgummidisk --image-name core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "mkgummidisk-*direct")))
+
+    @testcase(1350)
+    def test_mkefidisk(self):
+        """Test creation of mkefidisk image"""
+        cmd = "wic create mkefidisk -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
+
+    @testcase(1385)
+    def test_directdisk_bootloader_config(self):
+        """Test creation of directdisk-bootloader-config image"""
+        cmd = "wic create directdisk-bootloader-config -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
+
+    @testcase(1560)
+    def test_systemd_bootdisk(self):
+        """Test creation of systemd-bootdisk image"""
+        cmd = "wic create systemd-bootdisk -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
+
+    @testcase(1561)
+    def test_sdimage_bootpart(self):
+        """Test creation of sdimage-bootpart image"""
+        cmd = "wic create sdimage-bootpart -e core-image-minimal"
+        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
+
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
@@ -92,39 +176,6 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
-    @testcase(1157)
-    def test_gpt_image(self):
-        """Test creation of core-image-minimal with gpt table and UUID boot"""
-        cmd = "wic create directdisk-gpt --image-name core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
-
-    @testcase(1213)
-    def test_unsupported_subcommand(self):
-        """Test unsupported subcommand"""
-        self.assertEqual(1, runCmd('wic unsupported',
-                                   ignore_status=True).status)
-
-    @testcase(1214)
-    def test_no_command(self):
-        """Test wic without command"""
-        self.assertEqual(1, runCmd('wic', ignore_status=True).status)
-
-    @testcase(1215)
-    def test_help_overview(self):
-        """Test wic help overview"""
-        self.assertEqual(0, runCmd('wic help overview').status)
-
-    @testcase(1216)
-    def test_help_plugins(self):
-        """Test wic help plugins"""
-        self.assertEqual(0, runCmd('wic help plugins').status)
-
-    @testcase(1217)
-    def test_help_kickstart(self):
-        """Test wic help kickstart"""
-        self.assertEqual(0, runCmd('wic help kickstart').status)
-
     @testcase(1264)
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
@@ -183,13 +234,14 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
-    @testcase(1346)
-    def test_iso_image(self):
-        """Test creation of hybrid iso image with legacy and EFI boot"""
-        cmd = "wic create mkhybridiso --image-name core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
-        self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
+    @testcase(1496)
+    def test_bmap(self):
+        """Test generation of .bmap file"""
+        cmd = "wic create directdisk -e core-image-minimal --bmap"
+        status = runCmd(cmd).status
+        self.assertEqual(0, status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
 
     @testcase(1347)
     def test_image_env(self):
@@ -230,34 +282,6 @@ class Wic(oeSelfTest):
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
-    @testcase(1348)
-    def test_qemux86_directdisk(self):
-        """Test creation of qemux-86-directdisk image"""
-        cmd = "wic create qemux86-directdisk -e core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
-
-    @testcase(1349)
-    def test_mkgummidisk(self):
-        """Test creation of mkgummidisk image"""
-        cmd = "wic create mkgummidisk --image-name core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "mkgummidisk-*direct")))
-
-    @testcase(1350)
-    def test_mkefidisk(self):
-        """Test creation of mkefidisk image"""
-        cmd = "wic create mkefidisk -e core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
-
-    @testcase(1385)
-    def test_directdisk_bootloader_config(self):
-        """Test creation of directdisk-bootloader-config image"""
-        cmd = "wic create directdisk-bootloader-config -e core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
-
     @testcase(1422)
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
@@ -268,27 +292,3 @@ class Wic(oeSelfTest):
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
-
-    @testcase(1496)
-    def test_bmap(self):
-        """Test generation of .bmap file"""
-        cmd = "wic create directdisk -e core-image-minimal --bmap"
-        status = runCmd(cmd).status
-        self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
-
-    @testcase(1560)
-    def test_systemd_bootdisk(self):
-        """Test creation of systemd-bootdisk image"""
-        cmd = "wic create systemd-bootdisk -e core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
-
-    @testcase(1561)
-    def test_sdimage_bootpart(self):
-        """Test creation of sdimage-bootpart image"""
-        cmd = "wic create sdimage-bootpart -e core-image-minimal"
-        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
-- 
2.7.4


