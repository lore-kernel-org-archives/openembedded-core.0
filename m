Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6C8C77BCD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:09:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 01:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="875385655"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2017 01:09:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 731D7580571
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:09:36 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:56:49 +0300
Message-Id: <a8f774a7c65d2a48c6548363dc01111714d63420.1499326977.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499326977.git.ed.bartosh@linux.intel.com>
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 8/8] selftest: fixed 3 wic test cases
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
X-List-Received-Date: Thu, 06 Jul 2017 08:09:38 -0000

Added core-image-minimal -> syslinux dependency to ensure
syslinux artifacts are available from core-image-minimal
build. This should fix test_iso_image, test_bootloader_config and
test_default_output_dir test cases.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index e27dbe9..b22a038 100644
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
-- 
2.1.4


