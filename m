Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC7377305
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 16:22:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 01 Feb 2017 08:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="38325528"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 01 Feb 2017 08:22:31 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2E0506A4006;
	Wed,  1 Feb 2017 08:21:30 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 18:00:05 +0200
Message-Id: <1485964805-14763-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] selftest: wic: stop using hddimg in FSTYPES
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
X-List-Received-Date: Wed, 01 Feb 2017 16:22:34 -0000

Removed hddimg from FSTYPES in wic test suite as
wic doesn't depend on hddimg anymore.

[YOCTO #10835]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 6a6b54c..ebf3d18 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -151,7 +151,7 @@ class Wic(oeSelfTest):
     @testcase(1346)
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
-        config = 'IMAGE_FSTYPES += " hddimg "\nMACHINE_FEATURES_append = " efi"\n'
+        config = 'MACHINE_FEATURES_append = " efi"\n'
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
@@ -184,7 +184,7 @@ class Wic(oeSelfTest):
     @testcase(1560)
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
-        config = 'IMAGE_FSTYPES += " hddimg "\nMACHINE_FEATURES_append = " efi"\n'
+        config = 'MACHINE_FEATURES_append = " efi"\n'
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
@@ -406,7 +406,7 @@ class Wic(oeSelfTest):
     @testcase(1351)
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
-        config = 'IMAGE_FSTYPES += " hddimg wic"\nWKS_FILE = "wic-image-minimal"\n'\
+        config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
                  'MACHINE_FEATURES_append = " efi"\n'
         self.append_config(config)
         self.assertEqual(0, bitbake('wic-image-minimal').status)
@@ -425,7 +425,7 @@ class Wic(oeSelfTest):
     @testcase(1422)
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
-        config = 'IMAGE_FSTYPES += " hddimg wic"\nWKS_FILE = "wic-image-minimal"\n'\
+        config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
                  'MACHINE_FEATURES_append = " efi"\n'
         self.append_config(config)
         self.assertEqual(0, bitbake('wic-image-minimal').status)
-- 
2.1.4


