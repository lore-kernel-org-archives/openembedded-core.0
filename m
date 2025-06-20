Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EFCC71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:08:55 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.2770.1750406928871294159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=v5QtYnfn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250620080845b516e89ea1b75a7bf0-ctc97x@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250620080845b516e89ea1b75a7bf0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Jun 2025 10:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=806lQhIWTfZSWzmRvWVnEy6kxtGm15j0hSzWIaZuSK8=;
 b=v5QtYnfnj7NpS9XrMfNDyRbGdIu9Vz3T+nTCNUnfPs9l8IY3NjlvqQW9jhRcsZEoA5uVWN
 dzjeCjsqkHgFQjo69u1Ulf1tNJ/k7fKlO2zqh0VO7k2fqFl4PborQoP7bXKayAjFcLld2Fj+
 s9LxCjjlreg0z6T8pAMXSu8B3jLNfz/pyKNtzzuJHoMFW/4YeAi7KQMTLf/QkJe8/WaBZPAo
 hcw+FfCuiCS95kQghz4o+yl2SbySN8wzlN2s5Rua9m05Qr32DNXr+JiI9p/lhey+9yq8QGEx
 SL/IaLoOcLSehx659llJSpz+PdMfyxRf56XGmyyMlOTKbs69Hcgfms3Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/5] beaglebone-yocto: support FIT images
Date: Fri, 20 Jun 2025 10:08:19 +0200
Message-ID: <20250620080840.562802-3-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219105

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Introduce the FIT_IMAGE_KERNEL variable, which allows switching from the
zImage kernel to a FIT image kernel. This variable is not intended to be
officially documented; the goal is for the beaglebone-yocto MACHINE to
serve as an example for both use cases: zImage and FIT image.

The following tests have been performed on a beaglebone-black device
with poky and core-image-minimal running from SDCard:

* MACHINE = "beaglebone-yocto"
  Still boots the zImage kernel as before this commit

* MACHINE = "beaglebone-yocto"
  FIT_IMAGE_KERNEL = "1"
  Boots a FIT image kernel as expected

* MACHINE = "beaglebone-yocto"
  INITRAMFS_IMAGE = "core-image-initramfs-boot"
  FIT_IMAGE_KERNEL = "1"
  Boots a FIT image kernel with initramfs as expected

  Also booting like that behaves as expected:
   fatload mmc 0:1 $loadaddr /kernel
   iminfo $loadaddr
   setenv bootargs console=ttyS0,115200n8 root=/dev/mmcblk0p2 ro \
          rootfstype=ext4 rootwait shell_debug=true
   bootm ${loadaddr}#conf-am335x-boneblack.dtb

All the tested configurations just boot from the SDCard without manual
tweaks.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../conf/machine/beaglebone-yocto.conf        | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index d4b72361650..321d2c27c2a 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -14,8 +14,20 @@ include conf/machine/include/arm/armv7a/tune-cortexa8.inc
 IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
 EXTRA_IMAGECMD:jffs2 = "-lnp "
 WKS_FILE ?= "beaglebone-yocto.wks"
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image kernel-devicetree"
-do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot virtual/bootloader:do_deploy"
+
+# Setting this variable to "1" switches from zImage kernel to FIT image kernel
+FIT_IMAGE_KERNEL ?= "0"
+
+# Note: This is redundant if wic creates a separate /boot partition
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "${@'linux-yocto-fitimage' if d.getVar('FIT_IMAGE_KERNEL') == '1' else 'kernel-image kernel-devicetree'}"
+
+KERNEL_CLASSES += "${@'kernel-fit-extra-artifacts' if d.getVar('FIT_IMAGE_KERNEL') == '1' else ''}"
+do_image_wic[depends] += "\
+    mtools-native:do_populate_sysroot \
+    dosfstools-native:do_populate_sysroot \
+    virtual/bootloader:do_deploy \
+    ${@'linux-yocto-fitimage:do_deploy' if d.getVar('FIT_IMAGE_KERNEL') == '1' else ''} \
+"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
 
@@ -26,15 +38,28 @@ KERNEL_IMAGETYPE = "zImage"
 DTB_FILES = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
 KERNEL_DEVICETREE = '${@' '.join('ti/omap/%s' % d for d in '${DTB_FILES}'.split())}'
 
+# Configure the image.bbclass to depend on the fitImage instead of only
+# the kernel to ensure the fitImage is built with the image
+KERNEL_DEPLOY_DEPEND = "${@'linux-yocto-fitimage:do_deploy' if d.getVar('FIT_IMAGE_KERNEL') == '1' else 'virtual/kernel:do_deploy'}"
+
 PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 UBOOT_MACHINE = "am335x_evm_defconfig"
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+UBOOT_DTB_LOADADDRESS = "0x88000000"
+UBOOT_DTBO_LOADADDRESS = "0x88080000"
+UBOOT_RD_LOADADDRESS = "0x89000000"
+UBOOT_RD_ENTRYPOINT = "0x89000000"
 
 MACHINE_FEATURES = "usbgadget usbhost vfat alsa"
 
-IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY} ${KERNEL_IMAGETYPE} ${DTB_FILES}"
+# Configure wic to create a /boot partition with either zImage or fitImage
+IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY} \
+    ${@'fitImage' if d.getVar('FIT_IMAGE_KERNEL') == '1' else '${KERNEL_IMAGETYPE} ${DTB_FILES}'} \
+"
 
 # support runqemu
 EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
-- 
2.49.0


