Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6A41771AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316038"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:07 -0700
Message-Id: <1d31183647c7567646a2804ad8f239a722853789.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 19/20] oeqa.selftest.wic: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:25 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/wic.conf |  10 +++
 meta/lib/oeqa/selftest/wic.py        | 150 ++++++++++++++++++++---------------
 2 files changed, 98 insertions(+), 62 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/wic.conf

diff --git a/meta/lib/oeqa/selftest/conf/wic.conf b/meta/lib/oeqa/selftest/conf/wic.conf
new file mode 100644
index 0000000..e2afb8d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/wic.conf
@@ -0,0 +1,10 @@
+[Wic]
+setUpClass_image1 = core-image-minimal
+setUpClass_image2 = minimal
+setUpClass_image3 = qemux86-directdisk
+setUpClass_image4 = directdisk
+setUpClass_image5 = wic-image-minimal
+setUpClass_features = IMAGE_FSTYPES += " hddimg"
+                      MACHINE_FEATURES_append = " efi"
+setUpClass_recipes = syslinux syslinux-native parted-native gptfdisk-native dosfstools-native mtools-native bmap-tools-native
+
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index e550785..dc81457 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -31,6 +31,7 @@ from shutil import rmtree
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
 
 
 class Wic(oeSelfTest):
@@ -39,6 +40,18 @@ class Wic(oeSelfTest):
     resultdir = "/var/tmp/wic/build/"
     image_is_ready = False
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.image1 = cls.config.get('Wic', 'setUpClass_image1')
+        cls.image2 = cls.config.get('Wic', 'setUpClass_image2')
+        cls.image3 = cls.config.get('Wic', 'setUpClass_image3')
+        cls.image4 = cls.config.get('Wic', 'setUpClass_image4')
+        cls.image5 = cls.config.get('Wic', 'setUpClass_image5')
+        cls.features = cls.config.get('Wic', 'setUpClass_features')
+        cls.recipes = cls.config.get('Wic', 'setUpClass_recipes')
+
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.write_config('IMAGE_FSTYPES += " hddimg"\n'
@@ -48,9 +61,8 @@ class Wic(oeSelfTest):
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
         if not Wic.image_is_ready:
-            bitbake('syslinux syslinux-native parted-native gptfdisk-native '
-                    'dosfstools-native mtools-native bmap-tools-native')
-            bitbake('core-image-minimal')
+            bitbake(self.recipes)
+            bitbake(self.image1)
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
@@ -73,30 +85,35 @@ class Wic(oeSelfTest):
     @testcase(1211)
     def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(
+            0, runCmd("wic create %s --image-name %s"
+                      % (self.image4, self.image1)).status)
+        self.assertEqual(
+            1, len(glob(self.resultdir + "%s-*.direct" % self.image4)))
 
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
-                        for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
-                                    'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
+        bbvars = dict((var.lower(), get_bb_var(var, self.image1))
+                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
+                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         status = runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(staging_dir_native)s "
                         "-r %(image_rootfs)s" % bbvars).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*.direct"
+                         % self.image4)))
 
     @testcase(1157)
     def test_gpt_image(self):
-        """Test creation of core-image-minimal with gpt table and UUID boot"""
-        self.assertEqual(0, runCmd("wic create directdisk-gpt "
-                                   "--image-name core-image-minimal").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        """Test creation of %s with gpt table and UUID boot""" % self.image1
+        self.assertEqual(0, runCmd("wic create %s-gpt "
+                                   "--image-name %s"
+                                   % (self.image4, self.image1)).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*.direct"
+                                     % self.image4)))
 
     @testcase(1213)
     def test_unsupported_subcommand(self):
@@ -127,55 +144,63 @@ class Wic(oeSelfTest):
     @testcase(1264)
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c gzip").status)
-        self.assertEqual(1, len(glob(self.resultdir + \
-                                         "directdisk-*.direct.gz")))
+        self.assertEqual(0, runCmd("wic create %s "
+                                   "--image-name %s "
+                                   "-c gzip"
+                                   % (self.image4, self.image1)).status)
+        self.assertEqual(1, len(glob(
+                                self.resultdir + "%s-*.direct.gz"
+                                % self.image4)))
 
     @testcase(1265)
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c bzip2").status)
-        self.assertEqual(1, len(glob(self.resultdir + \
-                                         "directdisk-*.direct.bz2")))
+        self.assertEqual(0, runCmd("wic create %s "
+                                   "--image-name %s "
+                                   "-c bzip2"
+                                   % (self.image4, self.image1)).status)
+        self.assertEqual(1, len(glob(
+                                self.resultdir + "%s-*.direct.bz2"
+                                % self.image4)))
 
     @testcase(1266)
     def test_compress_xz(self):
         """Test compressing an image with xz"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c xz").status)
-        self.assertEqual(1, len(glob(self.resultdir + \
-                                         "directdisk-*.direct.xz")))
+        self.assertEqual(0, runCmd("wic create %s "
+                                   "--image-name %s "
+                                   "-c xz"
+                                   % (self.image4, self.image1)).status)
+        self.assertEqual(1, len(glob(
+                                self.resultdir + "%s-*.direct.xz"
+                                % self.image4)))
 
     @testcase(1267)
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
-        self.assertEqual(2, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c wrong", ignore_status=True).status)
+        self.assertEqual(2, runCmd("wic create %s "
+                                   "--image-name %s "
+                                   "-c wrong" % (self.image4, self.image1),
+                                   ignore_status=True).status)
 
     @testcase(1268)
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         wks = "directdisk-multi-rootfs"
         self.assertEqual(0, runCmd("wic create %s "
-                                   "--image-name core-image-minimal "
-                                   "--rootfs rootfs1=core-image-minimal "
-                                   "--rootfs rootfs2=core-image-minimal" \
-                                   % wks).status)
+                                   "--image-name %s "
+                                   "--rootfs rootfs1=%s "
+                                   "--rootfs rootfs2=%s"
+                                   % (wks, self.image1, self.image1,
+                                      self.image1)).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
 
     @testcase(1269)
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
-                        for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
-                                    'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
-        bbvars['wks'] = "directdisk-multi-rootfs"
+        bbvars = dict((var.lower(), get_bb_var(var, self.image1))
+                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
+                                  'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
+        bbvars['wks'] = "%s-multi-rootfs" % self.image4
         status = runCmd("wic create %(wks)s "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
@@ -191,14 +216,14 @@ class Wic(oeSelfTest):
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         self.assertEqual(0, runCmd("wic create mkhybridiso "
-                                   "--image-name core-image-minimal").status)
+                                   "--image-name %s" % self.image1).status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
     @testcase(1347)
     def test_image_env(self):
         """Test generation of <image>.env files."""
-        image = 'core-image-minimal'
+        image = self.image1
         self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
         stdir = get_bb_var('STAGING_DIR_TARGET', image)
         imgdatadir = os.path.join(stdir, 'imgdata')
@@ -222,11 +247,11 @@ class Wic(oeSelfTest):
     @testcase(1351)
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
-        self.assertEqual(0, bitbake('wic-image-minimal').status)
+        self.assertEqual(0, bitbake(self.image5).status)
 
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
         machine = get_bb_var('MACHINE')
-        prefix = os.path.join(deploy_dir, 'wic-image-minimal-%s.' % machine)
+        prefix = os.path.join(deploy_dir, '%s-%s.' % (self.image5, machine))
         # check if we have result image and manifests symlinks
         # pointing to existing files
         for suffix in ('wic', 'manifest'):
@@ -236,42 +261,42 @@ class Wic(oeSelfTest):
 
     @testcase(1348)
     def test_qemux86_directdisk(self):
-        """Test creation of qemux-86-directdisk image"""
-        image = "qemux86-directdisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
-        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+        """Test creation of %s image""" % self.image3
+        self.assertEqual(0, runCmd("wic create %s -e %s"
+                                   % (self.image3, self.image1)).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct"
+                                     % self.image3)))
 
     @testcase(1349)
     def test_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
         image = "mkgummidisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        self.assertEqual(0, runCmd("wic create %s -e %s"
+                                   % (image, self.image1)).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1350)
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         image = "mkefidisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        self.assertEqual(0, runCmd("wic create %s -e %s"
+                                   % (image, self.image1)).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1385)
     def test_directdisk_bootloader_config(self):
-        """Test creation of directdisk-bootloader-config image"""
-        image = "directdisk-bootloader-config"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        """Test creation of %s-bootloader-config image""" % self.image4
+        image = "%s-bootloader-config" % self.image4
+        self.assertEqual(0, runCmd("wic create %s -e %s"
+                                   % (image, self.image1)).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1422)
     def test_qemu(self):
-        """Test wic-image-minimal under qemu"""
-        self.assertEqual(0, bitbake('wic-image-minimal').status)
+        """Test %s under qemu""" % self.image5
+        self.assertEqual(0, bitbake(self.image5).status)
 
-        with runqemu('wic-image-minimal', ssh=False) as qemu:
+        with runqemu(self.image5, ssh=False) as qemu:
             command = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
             status, output = qemu.run_serial(command)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
@@ -279,8 +304,9 @@ class Wic(oeSelfTest):
 
     def test_bmap(self):
         """Test generation of .bmap file"""
-        image = "directdisk"
-        status = runCmd("wic create %s -e core-image-minimal --bmap" % image).status
+        image = self.image4
+        status = runCmd("wic create %s -e %s --bmap"
+                        % (image, self.image1)).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
-- 
1.8.3.1


