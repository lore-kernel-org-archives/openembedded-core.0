Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 548A578218
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:46:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 05:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="286891784"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2017 05:46:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B898C5803B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:46:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:33:07 +0300
Message-Id: <9c1523cd5966bcb42016498be1f5aba5d71c362d.1500035131.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500035131.git.ed.bartosh@linux.intel.com>
References: <cover.1500035131.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 8/8] selftest: fixed 5 wic test cases
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
X-List-Received-Date: Fri, 14 Jul 2017 12:46:05 -0000

Added core-image-minimal -> syslinux dependency to ensure
syslinux artifacts are available from core-image-minimal
build. This should fix test_iso_image, test_bootloader_config and
test_default_output_dir test cases.

Used --native-sysroot in test_image_vars_dir_long and
test_image_vars_dir_short test cases to point out to wic-tools
native sysrtoot.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 46d626d..f73d810 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -188,7 +188,8 @@ class Wic(OESelftestTestCase):
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         config = 'INITRAMFS_IMAGE = "core-image-minimal-initramfs"\n'\
-                 'MACHINE_FEATURES_append = " efi"\n'
+                 'MACHINE_FEATURES_append = " efi"\n'\
+                 'DEPENDS_pn-core-image-minimal += "syslinux"\n'
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
@@ -217,6 +218,10 @@ class Wic(OESelftestTestCase):
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
+        config = 'DEPENDS_pn-core-image-minimal += "syslinux"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
         cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
@@ -248,6 +253,10 @@ class Wic(OESelftestTestCase):
         """Test default output location"""
         for fname in glob("directdisk-*.direct"):
             os.remove(fname)
+        config = 'DEPENDS_pn-core-image-minimal += "syslinux"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
         cmd = "wic create directdisk -e core-image-minimal"
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob("directdisk-*.direct")))
@@ -569,10 +578,12 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         """Test image vars directory selection -v option"""
         image = 'core-image-minimal'
         imgenvdir = self._get_image_env_path(image)
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
         self.assertEqual(0, runCmd("wic create wictestdisk "
-                                   "--image-name=%s -v %s -o %s"
-                                   % (image, imgenvdir, self.resultdir)).status)
+                                   "--image-name=%s -v %s -n %s -o %s"
+                                   % (image, imgenvdir, native_sysroot,
+                                      self.resultdir)).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     @OETestID(1665)
@@ -580,11 +591,15 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         """Test image vars directory selection --vars option"""
         image = 'core-image-minimal'
         imgenvdir = self._get_image_env_path(image)
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
         self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=%s "
                                    "--vars %s "
+                                   "--native-sysroot %s "
                                    "--outdir %s"
-                                   % (image, imgenvdir, self.resultdir)).status)
+                                   % (image, imgenvdir, native_sysroot,
+                                      self.resultdir)).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     @OETestID(1351)
-- 
2.1.4


