Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2326AB9F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 11:36:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2015 04:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,422,1432623600"; d="scan'208";a="742114977"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2015 04:36:45 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id C4C896A4083;
	Tue,  7 Jul 2015 04:36:04 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jul 2015 14:36:58 +0300
Message-Id: <1436269018-24615-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest: Added 2 testcases and updated setup for other two in imagefeatures.
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
X-List-Received-Date: Tue, 07 Jul 2015 11:36:48 -0000

Automated 2 oe-selftest testcases:
- 1116: Check if clutter image can be built
- 1117: Check Wayland support in image

Updated setup for test_efi_gummiboot_images_can_be_build and
test_wic_command_can_create_efi_gummiboot_installation_images
to accomodate latest wic changes.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 41 +++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index e49f498..e0e424d 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -207,6 +207,41 @@ class ImageFeatures(oeSelfTest):
         system('pkill qemu')
         proc_qemu.close()
 
+    @testcase(1116)
+    def test_clutter_image_can_be_built(self):
+        """
+        Summary:     Check if clutter image can be built
+        Expected:    1. core-image-clutter can be built
+        Product:     oe-core
+        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        # Build a core-image-clutter
+        ret = bitbake('core-image-clutter')
+        self.assertEqual(0, ret.status, 'Failed to build core-image-clutter')
+
+    @testcase(1117)
+    def test_wayland_support_in_image(self):
+        """
+        Summary:     Check Wayland support in image
+        Expected:    1. Wayland image can be build
+                     2. Wayland feature can be installed
+        Product:     oe-core
+        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        features = 'DISTRO_FEATURES_append = " wayland"\n'
+        features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
+
+        # Append 'features' to local.conf
+        self.append_config(features)
+
+        # Build a core-image-weston
+        ret = bitbake('core-image-weston')
+        self.assertEqual(0, ret.status, 'Failed to build a core-image-weston')
+
 
 class Gummiboot(oeSelfTest):
 
@@ -240,8 +275,10 @@ class Gummiboot(oeSelfTest):
         features += 'MACHINE = "nuc"'
         self.append_config(features)
 
-        # Run "bitbake core-image-minimal" to build a nuc efi/gummiboot image
-        ret = bitbake('core-image-minimal')
+        # Run "bitbake syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal "
+        # to build a nuc/efi gummiboot image
+
+        ret = bitbake('syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal')
         self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
 
     @testcase(1101)
-- 
2.1.4


