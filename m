Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E368C54795
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:43 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.109901.1747248814197199931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=NAorV5vM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202505141853346749c19343ae7e6a9d-eb13ih@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202505141853346749c19343ae7e6a9d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1Ab1+zaAhqeOH76ZDlF+LXUJi8CaThinRsa9/UPbzN0=;
 b=NAorV5vM1/No+NDzEr6ux6KrDbReoMhgXHAft33yYtU3YiKKxpJkXf3LfsckvX7Gsc1PjZ
 SHauylHkBXmuFCiJ+K7Kqw5SVod/n1b7B0xX12PXGpcFizH8wEaWHchbXZaYfl/U19RMeddK
 tEn9CUUqq0IGOsVFmprXc5x6hLi8uEA5h8j7rM0HAsbDsDNQX2/79CGC0xR6wDAfWbcqFjtF
 wzD3ucFeAEPe2VIWZgbq5ZNSCexoiq13fuzO8Wa7bLnP0rDHv4QsNl3LwbjMGboS1U5SLups
 C2NIpnu/GwoxI4bzEKspkge13IBqnYhqUtlHVvzL4bkCP2P05GKYUMzQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 21/22] ref-manual: replace kernel-fitimage.bbclass by kernel-fit-image.bbclass
Date: Wed, 14 May 2025 20:51:05 +0200
Message-ID: <20250514185225.162998-22-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216541

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/classes.rst   | 103 +++++++++++++++----------
 documentation/ref-manual/variables.rst |  60 +++++++-------
 2 files changed, 92 insertions(+), 71 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 59efcbe19a7..4ea8677a1b2 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1732,77 +1732,100 @@ Its behavior is mainly controlled by the following variables:
 -  :term:`KERNEL_DTC_FLAGS`: flags for ``dtc``, the Device Tree Compiler
 -  :term:`KERNEL_PACKAGE_NAME`: base name of the kernel packages
 
-.. _ref-classes-kernel-fitimage:
+.. _ref-classes-kernel-fit-image:
 
-``kernel-fitimage``
-===================
+``kernel-fit-image``
+====================
 
-The :ref:`ref-classes-kernel-fitimage` class provides support to pack a kernel image,
-device trees, a U-boot script, an :term:`Initramfs` bundle and a RAM disk
-into a single FIT image. In theory, a FIT image can support any number
-of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and device-trees.
-However, :ref:`ref-classes-kernel-fitimage` currently only supports
+The :ref:`ref-classes-kernel-fit-image` class provides support to pack a kernel image,
+device trees, a U-boot script, an :term:`Initramfs` into a single FIT image.
+In theory, a FIT image can support any number of kernels, U-boot scripts,
+:term:`Initramfs`, device-trees.
+However, :ref:`ref-classes-kernel-fit-image` currently only supports
 limited usecases: just one kernel image, an optional U-boot script,
-an optional :term:`Initramfs` bundle, an optional RAM disk, and any number of
-device trees.
+an optional :term:`Initramfs`, and any number of device trees.
 
-To create a FIT image, it is required that :term:`KERNEL_CLASSES`
-is set to include ":ref:`ref-classes-kernel-fitimage`" and one of :term:`KERNEL_IMAGETYPE`,
-:term:`KERNEL_ALT_IMAGETYPE` or :term:`KERNEL_IMAGETYPES` to include "fitImage".
+The FIT image is created by a recipe which inherits the
+:ref:`ref-classes-kernel-fit-image` class.
+One such example is the ``linux-yocto-fitimage`` recipe which creates a FIT
+image for the Linux Yocto kernel.
+Additionally, it is required that :term:`KERNEL_CLASSES` is set to include
+":ref:`ref-classes-kernel-uimage`", which is the default.
+The :ref:`ref-classes-kernel-uimage` exposes the required kernel and device
+tree artifacts to the recipe-sysroot which are used by the
+:ref:`ref-classes-kernel-fit-image` class to create the FIT image.
 
 The options for the device tree compiler passed to ``mkimage -D``
 when creating the FIT image are specified using the
 :term:`UBOOT_MKIMAGE_DTCOPTS` variable.
 
 Only a single kernel can be added to the FIT image created by
-:ref:`ref-classes-kernel-fitimage` and the kernel image in FIT is mandatory. The
-address where the kernel image is to be loaded by U-Boot is
+:ref:`ref-classes-kernel-fit-image` and the kernel image in FIT is mandatory.
+The address where the kernel image is to be loaded by U-Boot is
 specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_ENTRYPOINT`. Setting :term:`FIT_ADDRESS_CELLS` to "2"
 is necessary if such addresses are 64 bit ones.
 
 Multiple device trees can be added to the FIT image created by
-:ref:`ref-classes-kernel-fitimage` and the device tree is optional.
+:ref:`ref-classes-kernel-fit-image` and the device tree is optional.
 The address where the device tree is to be loaded by U-Boot is
 specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
 and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
 
-Only a single RAM disk can be added to the FIT image created by
-:ref:`ref-classes-kernel-fitimage` and the RAM disk in FIT is optional.
+Only a single :term:`Initramfs` can be added to the FIT image created by
+:ref:`ref-classes-kernel-fit-image`. The :term:`Initramfs` in FIT is optional.
 The address where the RAM disk image is to be loaded by U-Boot
 is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
-:term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to the FIT image when
-:term:`INITRAMFS_IMAGE` is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE`
-is not set to 1.
+:term:`UBOOT_RD_ENTRYPOINT`. The :term:`Initramfs` is added to the FIT image
+when :term:`INITRAMFS_IMAGE` is specified.
 
-Only a single :term:`Initramfs` bundle can be added to the FIT image created by
-:ref:`ref-classes-kernel-fitimage` and the :term:`Initramfs` bundle in FIT is optional.
-In case of :term:`Initramfs`, the kernel is configured to be bundled with the root filesystem
-in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
-When the kernel is copied to RAM and executed, it unpacks the :term:`Initramfs` root filesystem.
-The :term:`Initramfs` bundle can be enabled when :term:`INITRAMFS_IMAGE`
-is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE` is set to 1.
-The address where the :term:`Initramfs` bundle is to be loaded by U-boot is specified
-by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOINT`.
+Note that (in contradiction to the previous `kernel-fitimage.bbclass`) the
+:term:`INITRAMFS_IMAGE_BUNDLE` variable is not evaluated by the
+:ref:`ref-classes-kernel-fit-image` class.
+The :term:`Initramfs` and the kernel image are added as independent image
+nodes to the FIT image.
+Bundling a RAM disk image with the kernel image and including the bundle in the
+FIT image would be possible. However, this approach has the disadvantage that
+any change to the RAM disk image would necessitate rebuilding the kernel image.
+This process requires the full kernel build directory, which is kind of
+incompatible with the `sstate-cache` and, consequently, with SDKs.
 
 Only a single U-boot boot script can be added to the FIT image created by
-:ref:`ref-classes-kernel-fitimage` and the boot script is optional.
+:ref:`ref-classes-kernel-fit-image`. The boot script is optional.
 The boot script is specified in the ITS file as a text file containing
-U-boot commands. When using a boot script the user should configure the
-U-boot :ref:`ref-tasks-install` task to copy the script to sysroot.
-So the script can be included in the FIT image by the :ref:`ref-classes-kernel-fitimage`
-class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
-load the boot script from the FIT image and execute it.
+U-boot commands. When using a boot script the recipe which inherits the
+:ref:`ref-classes-kernel-fit-image` class should add the script to
+:term:`SRC_URI` and set the :term:`FIT_UBOOT_ENV` variable to the name of the
+like the following::
 
-The FIT image generated by the :ref:`ref-classes-kernel-fitimage` class is signed when the
+   FIT_UBOOT_ENV = "boot.txt"
+   SRC_URI += "file://${FIT_UBOOT_ENV}"
+
+At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
+load the boot script from the FIT image and source it.
+
+The FIT image generated by the :ref:`ref-classes-kernel-fit-image` class is signed when the
 variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
 :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
 appropriately. The default values used for :term:`FIT_HASH_ALG` and
-:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fitimage` are "sha256" and
+:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fit-image` are "sha256" and
 "rsa2048" respectively. The keys for signing the FIT image can be generated using
-the :ref:`ref-classes-kernel-fitimage` class when both :term:`FIT_GENERATE_KEYS` and
+the :ref:`ref-classes-kernel-fit-image` class when both :term:`FIT_GENERATE_KEYS` and
 :term:`UBOOT_SIGN_ENABLE` are set to "1".
 
+If the FIT image should be used as a replacement for the kernel image which
+is installed in the root filesystem, then the following variables can be set
+e.g. in the machine configuration file::
+
+   # Do not install the kernel image package
+   RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base = ""
+
+   # Install the FIT image package
+   MACHINE_EXTRA_RDEPENDS += "${PREFERRED_PROVIDER_virtual/kernel}-fitimage"
+
+   # Configure the image.bbclass to depend on the fitImage instead of only
+   # the kernel to ensure the fitImage is built with the image
+   KERNEL_DEPLOY_DEPEND = "${PREFERRED_PROVIDER_virtual/kernel}-fitimage:do_deploy"
 
 .. _ref-classes-kernel-grub:
 
@@ -3434,7 +3457,7 @@ See U-Boot's documentation for details about `verified boot
 and the `signature process
 <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/signature.txt>`__.
 
-See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
+See also the description of :ref:`ref-classes-kernel-fit-image` class, which this class
 imitates.
 
 .. _ref-classes-uki:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c22abd4a8e5..5612c1487d2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2790,7 +2790,7 @@ system and gives an overview of their function and contents.
       ``meta/classes-recipe`` to see how the variable is used.
 
    :term:`EXTERNAL_KERNEL_DEVICETREE`
-      When inheriting :ref:`ref-classes-kernel-fitimage` and a
+      When inheriting :ref:`ref-classes-kernel-fit-image` and a
       :term:`PREFERRED_PROVIDER` for ``virtual/dtb`` set to ``devicetree``, the
       variable :term:`EXTERNAL_KERNEL_DEVICETREE` can be used to specify a
       directory containing one or more compiled device tree or device tree
@@ -3318,7 +3318,7 @@ system and gives an overview of their function and contents.
       Specifies the value of the ``#address-cells`` value for the
       description of the FIT image.
 
-      The default value is set to "1" by the :ref:`ref-classes-kernel-fitimage`
+      The default value is set to "1" by the :ref:`ref-classes-kernel-fit-image`
       class, which corresponds to 32 bit addresses.
 
       For platforms that need to set 64 bit addresses, for example in
@@ -3337,11 +3337,11 @@ system and gives an overview of their function and contents.
       Specifies the default device tree binary (dtb) file for a FIT image
       when multiple ones are provided.
 
-      This variable is used in the :ref:`ref-classes-kernel-fitimage` class.
+      This variable is used in the :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_DESC`
       Specifies the description string encoded into a FIT image. The
-      default value is set by the :ref:`ref-classes-kernel-fitimage` class as
+      default value is set by the :ref:`ref-classes-kernel-fit-image` class as
       follows::
 
          FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
@@ -3350,12 +3350,12 @@ system and gives an overview of their function and contents.
       Decides whether to generate the keys for signing the FIT image if
       they don't already exist. The keys are created in
       :term:`UBOOT_SIGN_KEYDIR`. The default value is set to "0"
-      by the :ref:`ref-classes-kernel-fitimage` class.
+      by the :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_HASH_ALG`
       Specifies the hash algorithm used in creating the FIT Image.
       This variable is set by default to "sha256" by the
-      :ref:`ref-classes-kernel-fitimage` class.
+      :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_KERNEL_COMP_ALG`
       The compression algorithm to use for the kernel image inside the FIT Image.
@@ -3374,31 +3374,31 @@ system and gives an overview of their function and contents.
    :term:`FIT_KEY_GENRSA_ARGS`
       Arguments to ``openssl genrsa`` for generating a RSA private key for
       signing the FIT image. The default value is set to "-F4" by the
-      :ref:`ref-classes-kernel-fitimage` class.
+      :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_KEY_REQ_ARGS`
       Arguments to ``openssl req`` for generating a certificate for signing
       the FIT image. The default value is "-batch -new" by the
-      :ref:`ref-classes-kernel-fitimage` class, "batch" for
+      :ref:`ref-classes-kernel-fit-image` class, "batch" for
       non interactive mode and "new" for generating new keys.
 
    :term:`FIT_KEY_SIGN_PKCS`
       Format for the public key certificate used for signing the FIT image.
       The default value is set to "x509" by the
-      :ref:`ref-classes-kernel-fitimage` class.
+      :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_SIGN_ALG`
       Specifies the signature algorithm used in creating the FIT Image.
       This variable is set by default to "rsa2048" by the
-      :ref:`ref-classes-kernel-fitimage` class.
+      :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
       The default value is set to "pkcs-1.5" by the
-      :ref:`ref-classes-kernel-fitimage` class.
+      :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_SIGN_INDIVIDUAL`
-      If set to "1", the :ref:`ref-classes-kernel-fitimage` class signs each
+      If set to "1", the :ref:`ref-classes-kernel-fit-image` class signs each
       image node individually, including the kernel, DTB, RAM disk, and any
       other image types present in the FIT image, in addition to signing the
       configuration nodes.
@@ -3431,13 +3431,13 @@ system and gives an overview of their function and contents.
    :term:`FIT_SIGN_NUMBITS`
       Size of the private key used in the FIT image, in number of bits.
       The default value for this variable is set to "2048"
-      by the :ref:`ref-classes-kernel-fitimage` class.
+      by the :ref:`ref-classes-kernel-fit-image` class.
 
    :term:`FIT_UBOOT_ENV`
       This variable allows to add a U-Boot script as a text file to the
       FIT image. Such a script can be sourced from the U-Boot shell.
 
-      When inheriting the :ref:`ref-classes-kernel-fitimage` class a
+      When inheriting the :ref:`ref-classes-kernel-fit-image` class a
       script file should be included in the :term:`SRC_URI` of the Linux
       kernel recipe.
 
@@ -4990,9 +4990,7 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_CLASSES`
       A list of classes defining kernel image types that the
       :ref:`ref-classes-kernel` class should inherit. You typically
-      append this variable to enable extended image types. An example is
-      ":ref:`ref-classes-kernel-fitimage`", which enables
-      FIT image support and resides in ``meta/classes-recipe/kernel-fitimage.bbclass``.
+      append this variable to enable extended image types.
       You can register custom kernel image types with the
       :ref:`ref-classes-kernel` class using this variable.
 
@@ -10221,13 +10219,13 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_DTB_LOADADDRESS`
       Specifies the load address for the dtb image used by U-Boot. During FIT
       image creation, the :term:`UBOOT_DTB_LOADADDRESS` variable is used in
-      :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
+      :ref:`ref-classes-kernel-fit-image` class to specify the load address to be
       used in creating the dtb sections of Image Tree Source for the FIT image.
 
    :term:`UBOOT_DTBO_LOADADDRESS`
       Specifies the load address for the dtbo image used by U-Boot.  During FIT
       image creation, the :term:`UBOOT_DTBO_LOADADDRESS` variable is used in
-      :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
+      :ref:`ref-classes-kernel-fit-image` class to specify the load address to be
       used in creating the dtbo sections of Image Tree Source for the FIT image.
 
    :term:`UBOOT_ENTRYPOINT`
@@ -10239,7 +10237,7 @@ system and gives an overview of their function and contents.
       -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
       -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT image creation.
 
-      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
+      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
       :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
       :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
       classes.
@@ -10507,7 +10505,7 @@ system and gives an overview of their function and contents.
       -  The :term:`FIT_ADDRESS_CELLS` variable for FIT image creation.
       -  The :term:`UBOOT_FIT_ADDRESS_CELLS` variable for U-Boot FIT image creation.
 
-      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
+      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
       :ref:`ref-classes-kernel-uimage`, :ref:`ref-classes-kernel`,
       :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
       classes.
@@ -10535,15 +10533,15 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_MKIMAGE`
       Specifies the name of the mkimage command as used by the
-      :ref:`ref-classes-kernel-fitimage` class to assemble
+      :ref:`ref-classes-kernel-fit-image` class to assemble
       the FIT image. This can be used to substitute an alternative command, wrapper
       script or function if desired. The default is "uboot-mkimage".
 
    :term:`UBOOT_MKIMAGE_DTCOPTS`
       Options for the device tree compiler passed to ``mkimage -D`` feature
-      while creating a FIT image with the :ref:`ref-classes-kernel-fitimage`
+      while creating a FIT image with the :ref:`ref-classes-kernel-fit-image`
       class. If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then the
-      :ref:`ref-classes-kernel-fitimage` class will not pass the ``-D`` option
+      :ref:`ref-classes-kernel-fit-image` class will not pass the ``-D`` option
       to ``mkimage``.
 
       This variable is also used by the :ref:`ref-classes-uboot-sign` class.
@@ -10554,42 +10552,42 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_MKIMAGE_SIGN`
       Specifies the name of the mkimage command as used by the
-      :ref:`ref-classes-kernel-fitimage` class to sign
+      :ref:`ref-classes-kernel-fit-image` class to sign
       the FIT image after it has been assembled (if enabled). This can be used
       to substitute an alternative command, wrapper script or function if
       desired. The default is "${:term:`UBOOT_MKIMAGE`}".
 
    :term:`UBOOT_MKIMAGE_SIGN_ARGS`
       Optionally specifies additional arguments for the
-      :ref:`ref-classes-kernel-fitimage` class to pass to the
+      :ref:`ref-classes-kernel-fit-image` class to pass to the
       mkimage command when signing the FIT image.
 
    :term:`UBOOT_RD_ENTRYPOINT`
       Specifies the entrypoint for the RAM disk image. During FIT image
       creation, the :term:`UBOOT_RD_ENTRYPOINT` variable is used in
-      :ref:`ref-classes-kernel-fitimage` class to specify the entrypoint to be
+      :ref:`ref-classes-kernel-fit-image` class to specify the entrypoint to be
       used in creating the Image Tree Source for the FIT image.
 
    :term:`UBOOT_RD_LOADADDRESS`
       Specifies the load address for the RAM disk image. During FIT image
       creation, the :term:`UBOOT_RD_LOADADDRESS` variable is used in
-      :ref:`ref-classes-kernel-fitimage` class to specify the load address to
+      :ref:`ref-classes-kernel-fit-image` class to specify the load address to
       be used in creating the Image Tree Source for the FIT image.
 
    :term:`UBOOT_SIGN_ENABLE`
       Enable signing of FIT image. The default value is "0".
 
-      This variable is used by the :ref:`ref-classes-kernel-fitimage`,
+      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
       :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
       classes.
 
    :term:`UBOOT_SIGN_KEYDIR`
       Location of the directory containing the RSA key and certificate used for
-      signing FIT image, used by the :ref:`ref-classes-kernel-fitimage` and
+      signing FIT image, used by the :ref:`ref-classes-kernel-fit-image` and
       :ref:`ref-classes-uboot-sign` classes.
 
    :term:`UBOOT_SIGN_KEYNAME`
-      The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
+      The name of keys used by the :ref:`ref-classes-kernel-fit-image` class
       for signing U-Boot FIT image stored in the :term:`UBOOT_SIGN_KEYDIR`
       directory. If we have for example a ``dev.key`` key and a ``dev.crt``
       certificate stored in the :term:`UBOOT_SIGN_KEYDIR` directory, you will
-- 
2.49.0


