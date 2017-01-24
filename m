Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D2BB676643
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:07:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Jan 2017 06:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="34763642"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2017 06:07:32 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DF4E76A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:06:34 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:55 +0200
Message-Id: <62b08f3c9c89fa9435eed784e11313855713e888.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485264964.git.ed.bartosh@linux.intel.com>
References: <cover.1485264964.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 7/8] selftest: wic: explicitly specify output directory
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
X-List-Received-Date: Tue, 24 Jan 2017 14:07:58 -0000

wic started to use current directory as a default output dir.
Specified output directory in wic command line to make tests
more predictable and easier to maintain.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 72 +++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 11dc744..7916071 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -36,8 +36,8 @@ from oeqa.utils.decorators import testcase
 class Wic(oeSelfTest):
     """Wic test class."""
 
-    resultdir = "/var/tmp/wic/build/"
     alternate_resultdir = "/var/tmp/wic/build/alt/"
+    resultdir = "/var/tmp/wic.oe-selftest/"
     image_is_ready = False
     wicenv_cache = {}
 
@@ -56,6 +56,10 @@ class Wic(oeSelfTest):
 
         rmtree(self.resultdir, ignore_errors=True)
 
+    def tearDownLocal(self):
+        """Remove resultdir as it may contain images."""
+        rmtree(self.resultdir, ignore_errors=True)
+
     @testcase(1552)
     def test_version(self):
         """Test wic --version"""
@@ -134,14 +138,14 @@ class Wic(oeSelfTest):
     @testcase(1211)
     def test_build_image_name(self):
         """Test wic create directdisk --image-name=core-image-minimal"""
-        cmd = "wic create directdisk --image-name=core-image-minimal"
+        cmd = "wic create directdisk --image-name=core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1157)
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
-        cmd = "wic create directdisk-gpt --image-name core-image-minimal"
+        cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
@@ -152,7 +156,7 @@ class Wic(oeSelfTest):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create mkhybridiso --image-name core-image-minimal"
+        cmd = "wic create mkhybridiso --image-name core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
@@ -160,21 +164,21 @@ class Wic(oeSelfTest):
     @testcase(1348)
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
-        cmd = "wic create qemux86-directdisk -e core-image-minimal"
+        cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
     @testcase(1350)
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
-        cmd = "wic create mkefidisk -e core-image-minimal"
+        cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
     @testcase(1385)
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
-        cmd = "wic create directdisk-bootloader-config -e core-image-minimal"
+        cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
@@ -185,14 +189,14 @@ class Wic(oeSelfTest):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-        cmd = "wic create systemd-bootdisk -e core-image-minimal"
+        cmd = "wic create systemd-bootdisk -e core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
     @testcase(1561)
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
-        cmd = "wic create sdimage-bootpart -e core-image-minimal"
+        cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
         self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
@@ -219,11 +223,13 @@ class Wic(oeSelfTest):
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
                       for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'))
         bbvars['recipe_sysroot_native'] = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        bbvars['resultdir'] = self.resultdir
         status = runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(recipe_sysroot_native)s "
-                        "-r %(image_rootfs)s" % bbvars).status
+                        "-r %(image_rootfs)s "
+                        "-o %(resultdir)s" % bbvars).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
@@ -232,7 +238,7 @@ class Wic(oeSelfTest):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
-                                   "-c gzip").status)
+                                   "-c gzip -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.gz")))
 
     @testcase(1265)
@@ -240,7 +246,7 @@ class Wic(oeSelfTest):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "-c bzip2").status)
+                                   "-c bzip2 -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.bz2")))
 
     @testcase(1266)
@@ -248,7 +254,7 @@ class Wic(oeSelfTest):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "--compress-with=xz").status)
+                                   "--compress-with=xz -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.xz")))
 
     @testcase(1267)
@@ -256,18 +262,19 @@ class Wic(oeSelfTest):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "-c wrong", ignore_status=True).status)
+                                   "-c wrong -o %s" % self.resultdir,
+                                   ignore_status=True).status)
 
     @testcase(1558)
     def test_debug(self):
         """Test debug"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "-D").status)
+                                   "-D -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "--debug").status)
+                                   "--debug -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1563)
@@ -275,11 +282,12 @@ class Wic(oeSelfTest):
         """Test skip build check"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "-s").status)
+                                   "-s -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "--skip-build-check").status)
+                                   "--skip-build-check "
+                                   "--outdir %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1564)
@@ -287,11 +295,12 @@ class Wic(oeSelfTest):
         """Test build rootfs"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "-f").status)
+                                   "-f -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=core-image-minimal "
-                                   "--build-rootfs").status)
+                                   "--build-rootfs "
+                                   "--outdir %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1268)
@@ -300,7 +309,8 @@ class Wic(oeSelfTest):
         status = runCmd("wic create directdisk-multi-rootfs "
                         "--image-name=core-image-minimal "
                         "--rootfs rootfs1=core-image-minimal "
-                        "--rootfs rootfs2=core-image-minimal").status
+                        "--rootfs rootfs2=core-image-minimal "
+                        "--outdir %s" % self.resultdir).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
@@ -311,25 +321,27 @@ class Wic(oeSelfTest):
                       for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'))
         bbvars['recipe_sysroot_native'] = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         bbvars['wks'] = "directdisk-multi-rootfs"
+        bbvars['resultdir'] = self.resultdir
         status = runCmd("wic create %(wks)s "
                         "--bootimg-dir=%(staging_datadir)s "
                         "--kernel-dir=%(deploy_dir_image)s "
                         "--native-sysroot=%(recipe_sysroot_native)s "
                         "--rootfs-dir rootfs1=%(image_rootfs)s "
-                        "--rootfs-dir rootfs2=%(image_rootfs)s"
-                        % bbvars).status
+                        "--rootfs-dir rootfs2=%(image_rootfs)s "
+                        "--outdir %(resultdir)s" % bbvars).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
     @testcase(1496)
     def test_bmap(self):
         """Test generation of .bmap file"""
-        cmd = "wic create directdisk -e core-image-minimal -m"
+        cmd = "wic create directdisk -e core-image-minimal -m -o %s" % self.resultdir
         status = runCmd(cmd).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
-        cmd = "wic create directdisk -e core-image-minimal --bmap"
+        rmtree(self.resultdir)
+        cmd = "wic create directdisk -e core-image-minimal --bmap -o %s" % self.resultdir
         status = runCmd(cmd).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
@@ -372,13 +384,13 @@ class Wic(oeSelfTest):
         imgenvdir = self._get_image_env_path(image)
 
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name=%s "
-                                   "-v %s"
-                                   % (image, imgenvdir)).status)
+                                   "--image-name=%s -v %s -o %s"
+                                   % (image, imgenvdir, self.resultdir)).status)
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name=%s "
-                                   "--vars %s"
-                                   % (image, imgenvdir)).status)
+                                   "--vars %s "
+                                   "--outdir %s"
+                                   % (image, imgenvdir, self.resultdir)).status)
 
     @testcase(1351)
     def test_wic_image_type(self):
-- 
2.1.4


