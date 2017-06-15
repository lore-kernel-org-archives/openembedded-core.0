Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3D527782DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:49:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 15 Jun 2017 05:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="868264787"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2017 05:49:07 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 05:49:06 -0700
Message-Id: <20170615124906.46207-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 1/2] systemdboot: Add Test to check boot file is created correctly
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
X-List-Received-Date: Thu, 15 Jun 2017 12:49:07 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Add Test case to verify if EFI bootloader for
systemd boot is correctly build inside of image.

[YOCTO #9903]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 .../lib/oeqa/selftest/cases/systemd_boot.py        | 54 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py b/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
index 848cdf78524..dd5eeec1633 100644
--- a/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
+++ b/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
@@ -2,25 +2,26 @@ import os
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.depends import OETestDepends
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 
 class Systemdboot(OESelftestTestCase):
     def _common_setup(self):
         """
-        Common setup for test cases: 1445, XXXX
+        Common setup for test cases: 1445, 1528
         """
 
-        # Set EFI_PROVIDER = "gummiboot" and MACHINE = "genericx86-64" in conf/local.conf
+        # Set EFI_PROVIDER = "systemdboot" and MACHINE = "genericx86-64" in conf/local.conf
         features = 'EFI_PROVIDER = "systemd-boot"\n'
         features += 'MACHINE = "genericx86-64"'
         self.append_config(features)
 
     def _common_build(self):
         """
-        Common build for test cases: 1445 , XXXX
+        Common build for test cases: 1445 , 1528
         """
 
-        # Build a genericx86-64/efi gummiboot image
+        # Build a genericx86-64/efi systemdboot image
         bitbake('mtools-native core-image-minimal')
 
 
@@ -50,3 +51,48 @@ class Systemdboot(OESelftestTestCase):
 
         found = os.path.isfile(systemdbootfile)
         self.assertTrue(found, 'Systemd-Boot file %s not found' % systemdbootfile)
+
+    @OETestID(1528)
+    @OETestDepends(['systemd_boot.Systemdboot.test_efi_systemdboot_images_can_be_built'])
+    def test_image_efi_file(self):
+
+        """
+        Summary:      Check if EFI bootloader for systemd is correctly build
+        Dependencies: Image was built correctly on testcase 1445
+        Steps:        1. Copy bootx64.efi file form the hddimg created
+                      under build/tmp/deploy/images/genericx86-64
+                      2. Check bootx64.efi was copied form hddimg
+                      3. Verify the checksums from the copied and previously
+                      created file are equal.
+        Expected :    Systemd-bootx64.efi and bootx64.efi should be the same
+                      hence checksums should be equal.
+        Product:      oe-core
+        Author:       Jose Perez Carranza <jose.perez.carranza at linux-intel.com>
+        AutomatedBy:  Jose Perez Carranza <jose.perez.carranza at linux-intel.com>
+        """
+
+        systemdbootfile = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
+                                           'systemd-bootx64.efi')
+        systemdbootimage = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
+                                                'core-image-minimal-genericx86-64.hddimg')
+        imagebootfile = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64',
+                                                            'bootx64.efi')
+        mcopynative = os.path.join(get_bb_var('STAGING_BINDIR_NATIVE'), 'mcopy')
+
+        #Clean environment before start the test
+        if os.path.isfile(imagebootfile):
+            runCmd('rm -f %s' % imagebootfile)
+
+            #Step 1
+            runCmd('%s -i %s ::EFI/BOOT/bootx64.efi %s' % (mcopynative ,systemdbootimage,
+                                                           imagebootfile))
+
+            #Step 2
+            found = os.path.isfile(imagebootfile)
+            self.assertTrue(found, 'bootx64.efi file %s was not copied from image'
+                            % imagebootfile)
+
+            #Step 3
+            result = runCmd('md5sum %s %s' % (systemdbootfile, imagebootfile))
+            self.assertEqual(result.output.split()[0], result.output.split()[2],
+                             '%s was not correclty generated' % imagebootfile)
-- 
2.12.0


