Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CCDC7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:08:55 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.2780.1750406928901358525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=C0bjoJ+F;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20250620080845ad6761252798a47099-fxkgkk@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250620080845ad6761252798a47099
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Jun 2025 10:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Nk4jGrk1eaRVnlV+C72rGFcihTNdn0kxNEhlKxPSDKg=;
 b=C0bjoJ+FgewSAnGu7IvpjbxWOL7B3h0fionzcmzSZ7F7oo/RW1CmTru8UmKZ5URpTmZIof
 TxsbvEDuyUPj+OuasdJJXvbbFKH6muCzcdaam1yWgRTzMZiWoxjF2tdZ+cf/1YTinPV55zj8
 hzBXyo0ZqKiY3X+BNrqbbjEWWH+uTM/c0Zfc1LF4ru+ilW2gt7quLU+Bzgwkb3kZs21WUjd3
 2rbzGzB68ASZDa8cFLFoSRZu/1Ocx/g5DWgDm/nNh3nWmoX2Imf8zbF7SnuDBTARzzEbX6uz
 vbFDBjW07G84r/dbP8fbrabF29QWsQ2FuS6ceV7GBXQbQonLhzyC76ZQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/5] oe-selftest: add a beaglebone-yocto fitimage Qemu test
Date: Fri, 20 Jun 2025 10:08:22 +0200
Message-ID: <20250620080840.562802-6-adrian.freihofer@siemens.com>
In-Reply-To: <20250620080840.562802-1-adrian.freihofer@siemens.com>
References: <20250620080840.562802-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219108

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The kernel configuration of the beaglebone-yocto MACHINE supports booting
on real hardware as well as in Qemu. Add an oe-selftest which tests that
booting in Qemu is possible even when the kernel is a FIT image kernel
with a RAM disk.
Since Qemu does not support FIT images, Qemu boots the zImage in direct
kernel mode. This works with or without initramfs.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 37 ++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3c408577476..9e0db30258e 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -9,13 +9,12 @@ import re
 import shlex
 import logging
 import pprint
-import tempfile
 
 import oe.fitimage
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var
-
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_bb_var, runqemu, runqemu_check_taps
+from oeqa.core.decorator import OETestTag
 
 class BbVarsMockGenKeys:
     def __init__(self, keydir, gen_keys="0", sign_enabled="0", keyname="", sign_ind="0", img_keyname=""):
@@ -1020,6 +1019,38 @@ FIT_HASH_ALG = "sha256"
         self._gen_signing_key(bb_vars)
         self._test_fitimage(bb_vars)
 
+    @OETestTag("runqemu")
+    def test_fit_image_initramfs_qemu(self):
+        """
+        Summary:     Verify building an image including a FIT image kernel and booting in Qemu works.
+        Expected:    1. core-image-minimal including a FIT image in /boot gets built
+                     2. Qemu can boot the zImage and initramfs with direct kernel boot
+                        since Qemu does not support FIT images
+        """
+
+        config = """
+DISTRO = "poky"
+MACHINE = "beaglebone-yocto"
+INITRAMFS_IMAGE = "core-image-initramfs-boot"
+FIT_IMAGE_KERNEL = "1"
+# Do not override kernel command line network configuration
+BAD_RECOMMENDATIONS:append:pn-oe-selftest-image = " init-ifupdown"
+"""
+        self.write_config(config)
+        if not runqemu_check_taps():
+            self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+        testimage = "oe-selftest-image"
+        bitbake(testimage)
+        # Boot the image
+        with runqemu(testimage) as qemu:
+            # Run a test command to see if it was installed properly
+            sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, "ls -1 /boot"))
+            self.logger.debug("ls -1 /boot: %s" % str(result.output))
+            boot_files = result.output.splitlines()
+            self.assertIn("fitImage", boot_files)
+            self.assertNotIn("zImage", boot_files)
+
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
 
-- 
2.49.0


