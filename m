Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC9076324
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926456"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:04:05 +0100
Message-Id: <74d042c4db86c800ed74be1668f8cc2c996dfb1d.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/11] oeqa/selftest/imagefeatures: remove gummiboot tests
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:16 -0000

These tests were _deleting_ meta-intel if it happened to appear under
COREBASE, which could have been catastrophic if there was any work in
progress in that directory. It turns out we don't even need meta-intel,
but we do need a machine that's set up appropriately (e.g.
genericx86-64). Tests that involve layers outside of OE-Core don't
really belong in OE-Core, and genericx86-64 is in meta-yocto-bsp;
however we will soon have the capability to have selftest tests in other
layers, so remove this here so we can add a fixed version in
meta-yocto-bsp after that happens.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 75 ---------------------------------
 1 file changed, 75 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index a370d1e..fcffc42 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -2,9 +2,6 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
 from oeqa.utils.sshcontrol import SSHControl
-from os.path import isfile
-from os import system
-import glob
 import os
 import sys
 import logging
@@ -169,75 +166,3 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-weston
         bitbake('core-image-weston')
 
-
-class Gummiboot(oeSelfTest):
-
-    meta_intel_dir = ''
-
-    def setUpLocal(self):
-        """
-        Common setup for test cases: 1101, 1103
-        """
-
-        self.meta_intel_dir = get_bb_var('COREBASE') + '/meta-intel'
-        meta_nuc_dir = self.meta_intel_dir + '/meta-nuc'
-        meta_intel_repo = 'http://git.yoctoproject.org/git/meta-intel'
-
-        # Delete meta_intel_dir
-        system('rm -rf ' + self.meta_intel_dir)
-
-        # Delete meta-intel dir even if the setUp fails
-        self.add_command_to_tearDown('rm -rf ' + self.meta_intel_dir)
-
-        # Clone meta-intel
-        runCmd('git clone ' + meta_intel_repo + ' ' + self.meta_intel_dir)
-
-        # Add meta-intel and meta-nuc layers in conf/bblayers.conf
-        features = 'BBLAYERS += "' + self.meta_intel_dir + ' ' + meta_nuc_dir + '"'
-        self.append_bblayers_config(features)
-
-        # Set EFI_PROVIDER = "gummiboot" and MACHINE = "nuc" in conf/local.conf
-        features = 'EFI_PROVIDER = "gummiboot"\n'
-        features += 'MACHINE = "nuc"'
-        self.append_config(features)
-
-        # Run "bitbake syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal "
-        # to build a nuc/efi gummiboot image
-
-        bitbake('syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal')
-
-    @testcase(1101)
-    def test_efi_gummiboot_images_can_be_build(self):
-        """
-        Summary:     Check if efi/gummiboot images can be buit
-        Expected:    1. File gummibootx64.efi should be available in build/tmp/deploy/images/nuc
-                     2. Efi/gummiboot images can be built
-        Product:     oe-core
-        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-
-        look_for_file = 'gummibootx64.efi'
-        file_location = get_bb_var('COREBASE') + '/build/tmp/deploy/images/nuc/'
-
-        found = isfile(file_location + look_for_file)
-        self.assertTrue(found, 'File {} not found under {}.'.format(look_for_file, file_location))
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
-        # Create efi/gummiboot installation images
-        wic_create_cmd = 'wic create mkgummidisk -e core-image-minimal'
-        runCmd(wic_create_cmd)
-
-        # Verify that a .direct file was created
-        direct_file = '/var/tmp/wic/build/*.direct'
-        ret = glob.glob(direct_file)
-        self.assertEqual(1, len(ret), 'Failed to find the .direct file')
-- 
2.1.0


