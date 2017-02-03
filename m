Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CDBE0606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 15:44:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 03 Feb 2017 07:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,329,1477983600"; d="scan'208";a="1121703263"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2017 07:44:33 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 14BC96A4006;
	Fri,  3 Feb 2017 07:43:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 17:22:08 +0200
Message-Id: <1486135328-19229-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] selftest: wic: stop using iso image type
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
X-List-Received-Date: Fri, 03 Feb 2017 15:44:34 -0000

Removed 'IMAGE_FSTYPES = "iso" as this functionality depends on
do_bootimg, which is going to be obsoleted soon.

As wic doesn't depend on bootimg it's safe to remove this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 07b8312..417ba3d 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -42,8 +42,7 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('IMAGE_FSTYPES = "iso"\n'
-                          'MACHINE_FEATURES_append = " efi"\n')
+        self.write_config('MACHINE_FEATURES_append = " efi"\n')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
@@ -151,7 +150,8 @@ class Wic(oeSelfTest):
     @testcase(1346)
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
-        config = 'MACHINE_FEATURES_append = " efi"\n'
+        config = 'INITRAMFS_IMAGE = "core-image-minimal-initramfs"\n'\
+                 'MACHINE_FEATURES_append = " efi"\n'
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
-- 
2.1.4


