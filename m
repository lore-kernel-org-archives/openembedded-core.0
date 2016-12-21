Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB4977499
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:08:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 21 Dec 2016 09:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,384,1477983600"; d="scan'208";a="1074896787"
Received: from mlbaldwi-mobl3.amr.corp.intel.com (HELO
	aehernan-MOBL1.amr.corp.intel.com) ([10.252.255.50])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2016 09:08:14 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 11:08:06 -0600
Message-Id: <6870bd0a4805674681f60fe2f12f01e273c1d0b3.1482339995.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <96e26386eebc378d799bdb8dfec73d1ce44c2df1.1482339995.git.alejandro.hernandez@linux.intel.com>
References: <96e26386eebc378d799bdb8dfec73d1ce44c2df1.1482339995.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1482339995.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482339995.git.alejandro.hernandez@linux.intel.com>
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
X-List-Received-Date: Wed, 21 Dec 2016 17:08:46 -0000

Since we replaced gummiboot with systemd-boot
along with its tests, the gummiboot tests are
no longer necessary.

[YOCTO #10332]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py | 83 ---------------------------
 1 file changed, 83 deletions(-)
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
-- 
2.10.1


