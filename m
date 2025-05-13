Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A16AC3ABDE
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:40:45 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.88517.1747172437896992900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 14:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=PC+wV5Cl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20250513214036d8700968b9147c4947-_bagfx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250513214036d8700968b9147c4947
        for <openembedded-core@lists.openembedded.org>;
        Tue, 13 May 2025 23:40:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cv2MAUXgEgD5BRr9mmy5xkazaT7T3x/5mXdYNfTknjs=;
 b=PC+wV5ClABUr/yy7YV/reJlUf5mJ644iDwFrG3KNdaOxR9abrmsJCqnugVwInd4w2Ze8FJ
 IZrwNMSexEJuV6+kz+qSf7VTI4qHYi0lcqti4mykq5hEaoKcMHq4QRl7FptYDC7Zh9fY/zU4
 h/8bXdVadiLExrz4uJa8wFqWKC6S28rYJbbl/tDAWSa6Z6p/qbWR/b0neaqlCq60CLJ0OEDm
 L9nmU/RmTQ3dYJb1Vip2+kfCreia43cOoQpbZr/8+BDBb7cNSAq+gABlWSbUuIMSXIECx9Wa
 HteMb2yLSCXzrwOyzLm7g5wEPVg1FQtflPtNs4hm4jPb9ZrSkFZwG2FA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 21/22] oe-selftest: fitimage: drop initramfs bundle test
Date: Tue, 13 May 2025 23:37:03 +0200
Message-ID: <20250513213834.87830-22-adrian.freihofer@siemens.com>
In-Reply-To: <20250513213834.87830-1-adrian.freihofer@siemens.com>
References: <20250513213834.87830-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 21:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216470

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This test case is no longer useful. Sure, it is possible to build a
kernel with an initramfs bundled. But since this is not the kernel
which gets included into the FIT image, there is no need for testing
this as part of the FIT image test suite.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 42 ------------------------
 1 file changed, 42 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index d204a07bf0c..80aa63bb91a 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -925,48 +925,6 @@ FIT_HASH_ALG = "sha256"
 
         self._test_fitimage(bb_vars)
 
-    def test_fit_image_sign_initramfs_bundle(self):
-        """
-        Summary:     Verifies the content of the initramfs bundle node in the FIT Image Tree Source (its)
-                     The FIT settings are set by the test case.
-                     The machine used is beaglebone-yocto.
-        Expected:    1. The ITS is generated with initramfs bundle support
-                     2. All the fields in the kernel node are as expected (matching the
-                        conf settings)
-                     3. The kernel is included in all the available configurations and
-                        its hash is included in the configuration signature
-
-        Product:     oe-core
-        Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-        """
-
-        config = """
-DISTRO="poky"
-MACHINE = "beaglebone-yocto"
-INITRAMFS_IMAGE_BUNDLE = "1"
-INITRAMFS_IMAGE = "core-image-minimal-initramfs"
-INITRAMFS_SCRIPTS = ""
-UBOOT_MACHINE = "am335x_evm_defconfig"
-UBOOT_SIGN_ENABLE = "1"
-UBOOT_SIGN_KEYNAME = "beaglebonekey"
-UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
-UBOOT_DTB_BINARY = "u-boot.dtb"
-UBOOT_ENTRYPOINT  = "0x80000000"
-UBOOT_LOADADDRESS = "0x80000000"
-UBOOT_DTB_LOADADDRESS = "0x82000000"
-UBOOT_ARCH = "arm"
-UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-UBOOT_MKIMAGE_KERNEL_TYPE = "kernel"
-UBOOT_EXTLINUX = "0"
-FIT_GENERATE_KEYS = "1"
-KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
-FIT_KERNEL_COMP_ALG = "none"
-FIT_HASH_ALG = "sha256"
-"""
-        config = self._config_add_uboot_env(config)
-        self.write_config(config)
-        bb_vars = self._fit_get_bb_vars()
-        self._test_fitimage(bb_vars)
 
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
-- 
2.49.0


