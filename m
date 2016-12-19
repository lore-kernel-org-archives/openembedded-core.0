Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 14A287736F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:07:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 19 Dec 2016 13:07:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,375,1477983600"; d="scan'208";a="44344169"
Received: from jairdeje-mobl1.amr.corp.intel.com (HELO
	jairdeje-mobl1.zpn.intel.com) ([10.219.128.79])
	by orsmga005.jf.intel.com with ESMTP; 19 Dec 2016 13:07:58 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:07:32 -0600
Message-Id: <b6075dee1adf531a2361ae2a8ac0292bc15abbfc.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Subject: [PATCH v2 2/4] selftest/wic: code cleanup
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
X-List-Received-Date: Mon, 19 Dec 2016 21:07:57 -0000

The following changes were added to improve the code readability:

- Removed redundant backlashes between brackets
- Aligned continuation lines according to PEP8 style
- Refactored command execution in the next methods for enhanced
  legibility:

  - test_build_image_name(self)
  - test_gpt_image(self)
  - test_qemux86_directdisk(self)
  - test_rootfs_indirect_recipes(self)
  - test_iso_image(self)
  - test_mkgummidisk(self)
  - test_mkefidisk(self)
  - test_directdisk_bootloader_config(self)
  - test_qemu(self)
  - test_bmap(self)
  - test_systemd_bootdisk(self)
  - test_sdimage_bootpart(self)

Signed-off-by: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 107 +++++++++++++++++++-----------------------
 1 file changed, 48 insertions(+), 59 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 8c7aefa..d130ba2 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -74,16 +74,16 @@ class Wic(oeSelfTest):
     @testcase(1211)
     def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal").status)
+        cmd = "wic create directdisk --image-name core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
-                        for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
-                                    'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
+        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
+                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
+                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         status = runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
@@ -95,8 +95,8 @@ class Wic(oeSelfTest):
     @testcase(1157)
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
-        self.assertEqual(0, runCmd("wic create directdisk-gpt "
-                                   "--image-name core-image-minimal").status)
+        cmd = "wic create directdisk-gpt --image-name core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1213)
@@ -131,8 +131,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c gzip").status)
-        self.assertEqual(1, len(glob(self.resultdir + \
-                                         "directdisk-*.direct.gz")))
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.gz")))
 
     @testcase(1265)
     def test_compress_bzip2(self):
@@ -140,8 +139,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c bzip2").status)
-        self.assertEqual(1, len(glob(self.resultdir + \
-                                         "directdisk-*.direct.bz2")))
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.bz2")))
 
     @testcase(1266)
     def test_compress_xz(self):
@@ -149,8 +147,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c xz").status)
-        self.assertEqual(1, len(glob(self.resultdir + \
-                                         "directdisk-*.direct.xz")))
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.xz")))
 
     @testcase(1267)
     def test_wrong_compressor(self):
@@ -162,37 +159,35 @@ class Wic(oeSelfTest):
     @testcase(1268)
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
-        wks = "directdisk-multi-rootfs"
-        self.assertEqual(0, runCmd("wic create %s "
-                                   "--image-name core-image-minimal "
-                                   "--rootfs rootfs1=core-image-minimal "
-                                   "--rootfs rootfs2=core-image-minimal" \
-                                   % wks).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
+        status = runCmd("wic create directdisk-multi-rootfs "
+                        "--image-name core-image-minimal "
+                        "--rootfs rootfs1=core-image-minimal "
+                        "--rootfs rootfs2=core-image-minimal").status
+        self.assertEqual(0, status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
     @testcase(1269)
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
-                        for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
-                                    'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
+        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
+                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
+                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         bbvars['wks'] = "directdisk-multi-rootfs"
         status = runCmd("wic create %(wks)s "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(staging_dir_native)s "
                         "--rootfs-dir rootfs1=%(image_rootfs)s "
-                        "--rootfs-dir rootfs2=%(image_rootfs)s" \
+                        "--rootfs-dir rootfs2=%(image_rootfs)s"
                         % bbvars).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + \
-                                     "%(wks)s-*.direct" % bbvars)))
+        self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
     @testcase(1346)
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
-        self.assertEqual(0, runCmd("wic create mkhybridiso "
-                                   "--image-name core-image-minimal").status)
+        cmd = "wic create mkhybridiso --image-name core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
@@ -238,34 +233,30 @@ class Wic(oeSelfTest):
     @testcase(1348)
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
-        image = "qemux86-directdisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        cmd = "wic create qemux86-directdisk -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
     @testcase(1349)
     def test_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
-        image = "mkgummidisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        cmd = "wic create mkgummidisk --image-name core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "mkgummidisk-*direct")))
 
     @testcase(1350)
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
-        image = "mkefidisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        cmd = "wic create mkefidisk -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
     @testcase(1385)
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
-        image = "directdisk-bootloader-config"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        cmd = "wic create directdisk-bootloader-config -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
     @testcase(1422)
     def test_qemu(self):
@@ -273,33 +264,31 @@ class Wic(oeSelfTest):
         self.assertEqual(0, bitbake('wic-image-minimal').status)
 
         with runqemu('wic-image-minimal', ssh=False) as qemu:
-            command = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
-            status, output = qemu.run_serial(command)
-            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
+            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
 
     @testcase(1496)
     def test_bmap(self):
         """Test generation of .bmap file"""
-        image = "directdisk"
-        status = runCmd("wic create %s -e core-image-minimal --bmap" % image).status
+        cmd = "wic create directdisk -e core-image-minimal --bmap"
+        status = runCmd(cmd).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
 
     @testcase(1560)
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
-        image = "systemd-bootdisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        cmd = "wic create systemd-bootdisk -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
     @testcase(1561)
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
-        image = "sdimage-bootpart"
+        cmd = "wic create sdimage-bootpart -e core-image-minimal"
         self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
-- 
2.7.4


