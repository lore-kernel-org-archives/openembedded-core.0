Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 230A6776BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 17:39:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 Dec 2016 09:39:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,389,1477983600"; d="scan'208";a="801362116"
Received: from mavelasc-mobl.amr.corp.intel.com (HELO
	aehernan-MOBL1.amr.corp.intel.com) ([10.252.251.108])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2016 09:39:04 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 11:39:02 -0600
Message-Id: <1762e913054945fd6d252740bef35499d2207100.1482428220.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1482428220.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482428220.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/3] gummiboot: Remove gummiboot tests
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
X-List-Received-Date: Thu, 22 Dec 2016 17:39:12 -0000

Since we replaced gummiboot with systemd-boot
along with its tests, the gummiboot tests are
no longer necessary.

[YOCTO #10332]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py | 83 ---------------------------
 meta/lib/oeqa/selftest/wic.py                 |  7 ---
 2 files changed, 90 deletions(-)
 delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py

diff --git a/meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py b/meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
deleted file mode 100644
index 00aa36f..0000000
--- a/meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
+++ /dev/null
@@ -1,83 +0,0 @@
-from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
-from oeqa.utils.decorators import testcase
-import re
-import os
-import sys
-import logging
-
-
-class Gummiboot(oeSelfTest):
-
-    def _common_setup(self):
-        """
-        Common setup for test cases: 1101, 1103
-        """
-
-        # Set EFI_PROVIDER = "gummiboot" and MACHINE = "genericx86-64" in conf/local.conf
-        features = 'EFI_PROVIDER = "gummiboot"\n'
-        features += 'MACHINE = "genericx86-64"'
-        self.append_config(features)
-
-    def _common_build(self):
-        """
-        Common build for test cases: 1101, 1103
-        """
-
-        # Build a genericx86-64/efi gummiboot image
-        bitbake('syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal')
-
-
-    @testcase(1101)
-    def test_efi_gummiboot_images_can_be_built(self):
-        """
-        Summary:     Check if efi/gummiboot images can be built
-        Expected:    1. File gummibootx64.efi should be available in build/tmp/deploy/images/genericx86-64
-                     2. Efi/gummiboot images can be built
-        Product:     oe-core
-        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-
-        # We'd use DEPLOY_DIR_IMAGE here, except that we need its value for
-        # MACHINE="genericx86-64 which is probably not the one configured
-        gummibootfile = os.path.join(get_bb_var('DEPLOY_DIR'), 'images', 'genericx86-64', 'gummibootx64.efi')
-
-        self._common_setup()
-
-        # Ensure we're actually testing that this gets built and not that
-        # it was around from an earlier build
-        bitbake('-c cleansstate gummiboot')
-        runCmd('rm -f %s' % gummibootfile)
-
-        self._common_build()
-
-        found = os.path.isfile(gummibootfile)
-        self.assertTrue(found, 'Gummiboot file %s not found' % gummibootfile)
-
-    @testcase(1103)
-    def test_wic_command_can_create_efi_gummiboot_installation_images(self):
-        """
-        Summary:     Check that wic command can create efi/gummiboot installation images
-        Expected:    A .direct file in folder /var/tmp/wic/ must be created.
-        Product:     oe-core
-        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-
-        self._common_setup()
-        self._common_build()
-
-        # Create efi/gummiboot installation images
-        wic_create_cmd = 'wic create mkgummidisk -e core-image-minimal'
-        result = runCmd(wic_create_cmd)
-
-        # Find file written by wic from output
-        res = re.search('(/var/tmp/wic/.*\.direct)', result.output)
-        if res:
-            direct_file = res.group(1)
-            # Check it actually exists
-            if not os.path.exists(direct_file):
-                self.fail('wic reported direct file "%s" does not exist; wic output:\n%s' % (direct_file, result.output))
-        else:
-            self.fail('No .direct file reported in wic output:\n%s' % result.output)
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3db00a6..49bbfe3 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -162,13 +162,6 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
-    @testcase(1349)
-    def test_mkgummidisk(self):
-        """Test creation of mkgummidisk image"""
-        cmd = "wic create mkgummidisk --image-name core-image-minimal"
-        self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "mkgummidisk-*direct")))
-
     @testcase(1350)
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
-- 
2.10.1


