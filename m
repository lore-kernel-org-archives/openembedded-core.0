Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E72C02196
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:36 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.7678.1738205492373117668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jKz9g4Xa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so361017a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205492; x=1738810292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYJMZfQoFd4jEzcjJ0xXhPrCudnb0RAfOHbVxYVnA+c=;
        b=jKz9g4XarJc3adqJjhw4tuKzOxtsspS9J3wQKlX9ESIkDvGusWtasCQKoWvrQv5afS
         Dxfk/5p4u0nGvHZ4zyPNgphoayq8h5WVcY236sNLEOlx0jZVWKQoMMP7/zZLEms1RYxd
         dvjNuMS8QVyQ1NGah2kIml3bUevh6WRpUWEOTQT+BIkApTN1DCQioPPBKT0EJ+VKg0mY
         vpG+StJ+0HDb5TEJ1Pa3RAXqnguayx5fYLtHnym8NFE2hbNgPru+JkikFozrJ3M8xE5l
         prpugQmFPiOrXktTt08Emtl9BZFEUDuIXYO05At6hlHMMSHUKGgbAGKs87nnEmqQeITW
         g3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205492; x=1738810292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYJMZfQoFd4jEzcjJ0xXhPrCudnb0RAfOHbVxYVnA+c=;
        b=TA7SPa+smdu2vbx0vJwECUrX9AmPqDdr8Y6Pak03RWjCcvKLNTq6BoKKx0jvoYfG/k
         IWKtSiTwFIykA7HAl6BCCdlP+v1hShx92e2IrNnsAiXRp5zDpS5H7xrA3WPDoXdHRuiJ
         hJSAgkSIo6vatLU2zzHRfjtLYKb8XvI2PavEHO1WiyHEM9RRHBRQML7kfhLl8sRIv4cI
         /rulWyZaMJ6fAq6u7qkExLIUWuPnvbmnMK4EchW+cclONoRtAowisPFC1wnslNG5LZFw
         caZTAp5F1kAhp8PNFwfWbcyibbmu8JU9JhcP3WFhPcAxZ/k+a735L6hxS2bOrniYvaFz
         DHaQ==
X-Gm-Message-State: AOJu0Ywz5cy/iYNYa0J3JXaly/+JvjJTZ1n0puVeiT2HVlaZ5Q2cvDZN
	28KSFyoNu0i3HCknRSwmJpuDA0K/XafRqI2QKanV6cJSYUaJAp9u+6VumYJZsOmtFs6AHK/Najy
	QEWQ=
X-Gm-Gg: ASbGncs+gcjXK2Gm9uqIyC2wz8RpncF1q6kQc81aBF+/4tfjeXMT98sZhhsqbHoHbzA
	TIV/fC+mvZ+J8WnrxppCevriyojlJt6GdaQ7aqMQ8OJ4+nrM07OPZTf9Q+qWMblBvbLjhWS65it
	F3FhOd/X14/2FE/Rk7UzRPih2OgfQhBgoeZRxngBCOy3bACXD0KEDxdBD19hY2RLw3Kltxv0oY1
	RO0kHf9aiwPHo52+PJjaEOKzhQhVs1RqAEPrADou1x85pfAa0n7tIifYI9rWJY5JrQaknje59XH
	KfyE
X-Google-Smtp-Source: AGHT+IERd8HJREuj+trJY0cj8VTWP1sdUWvdQwamyDkK0Q0zadSnnkiKsr4TyM3mN86FAl4Z+9KPYQ==
X-Received: by 2002:a05:6a00:8d6:b0:72a:8b90:92e9 with SMTP id d2e1a72fcca58-72fd0bbe0f9mr7250871b3a.5.1738205491403;
        Wed, 29 Jan 2025 18:51:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/12] u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
Date: Wed, 29 Jan 2025 18:51:07 -0800
Message-ID: <d7bd9c6276611c8c8de0c2a24947783eae5d932a.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210427

From: Marek Vasut <marex@denx.de>

In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
kernel-fitimage.bbclass is in use to generate signed kernel
fitImage, there is a circular dependency between uboot-sign
and kernel-fitimage bbclasses . The loop looks like this:

kernel-fitimage.bbclass:
- do_populate_sysroot depends on do_assemble_fitimage
  - do_assemble_fitimage depends on virtual/bootloader:do_populate_sysroot
    - virtual/bootloader:do_populate_sysroot depends on virtual/bootloader:do_install
      => The virtual/bootloader:do_install installs and the
         virtual/bootloader:do_populate_sysroot places into
         sysroot an U-Boot environment script embedded into
         kernel fitImage during do_assemble_fitimage run .

uboot-sign.bbclass:
- DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately
  - do_deploy depends on do_uboot_assemble_fitimage
  - do_install depends on do_uboot_assemble_fitimage
  - do_uboot_assemble_fitimage depends on virtual/kernel:do_populate_sysroot
    => do_install depends on virtual/kernel:do_populate_sysroot

=> virtual/bootloader:do_install depends on virtual/kernel:do_populate_sysroot
   virtual/kernel:do_populate_sysroot depends on virtual/bootloader:do_install

Attempt to resolve the loop. Pull fitimage configuration options into separate
new configuration file image-fitimage.conf so these configuration options can
be shared by both uboot-sign.bbclass and kernel-fitimage.bbclass, and make use
of mkimage -f auto-conf / mkimage -f auto option to insert /signature node key-*
subnode into U-Boot control DT without depending on the layout of kernel fitImage
itself. This is perfectly valid to do, because the U-Boot /signature node key-*
subnodes 'required' property can contain either of two values, 'conf' or 'image'
to authenticate either selected configuration or all of images when booting the
fitImage.

For details of the U-Boot fitImage signing process, see:
https://docs.u-boot.org/en/latest/usage/fit/signature.html
For details of mkimage -f auto-conf and -f auto, see:
https://manpages.debian.org/experimental/u-boot-tools/mkimage.1.en.html#EXAMPLES

(From OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e)

Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies")
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 53 +--------------------
 meta/classes-recipe/uboot-sign.bbclass      | 26 +++++-----
 meta/conf/image-fitimage.conf               | 53 +++++++++++++++++++++
 3 files changed, 68 insertions(+), 64 deletions(-)
 create mode 100644 meta/conf/image-fitimage.conf

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 18ab17bd2c..3e20c3248b 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -5,6 +5,7 @@
 #
 
 inherit kernel-uboot kernel-artifact-names uboot-config
+require conf/image-fitimage.conf
 
 def get_fit_replacement_type(d):
     kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
@@ -52,58 +53,6 @@ python __anonymous () {
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
 }
 
-
-# Description string
-FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
-
-# Kernel fitImage Hash Algo
-FIT_HASH_ALG ?= "sha256"
-
-# Kernel fitImage Signature Algo
-FIT_SIGN_ALG ?= "rsa2048"
-
-# Kernel / U-Boot fitImage Padding Algo
-FIT_PAD_ALG ?= "pkcs-1.5"
-
-# Generate keys for signing Kernel fitImage
-FIT_GENERATE_KEYS ?= "0"
-
-# Size of private keys in number of bits
-FIT_SIGN_NUMBITS ?= "2048"
-
-# args to openssl genrsa (Default is just the public exponent)
-FIT_KEY_GENRSA_ARGS ?= "-F4"
-
-# args to openssl req (Default is -batch for non interactive mode and
-# -new for new certificate)
-FIT_KEY_REQ_ARGS ?= "-batch -new"
-
-# Standard format for public key certificate
-FIT_KEY_SIGN_PKCS ?= "-x509"
-
-# Sign individual images as well
-FIT_SIGN_INDIVIDUAL ?= "0"
-
-FIT_CONF_PREFIX ?= "conf-"
-FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
-
-FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
-
-# Allow user to select the default DTB for FIT image when multiple dtb's exists.
-FIT_CONF_DEFAULT_DTB ?= ""
-
-# length of address in number of <u32> cells
-# ex: 1 32bits address, 2 64bits address
-FIT_ADDRESS_CELLS ?= "1"
-
-# Keys used to sign individually image nodes.
-# The keys to sign image nodes must be different from those used to sign
-# configuration nodes, otherwise the "required" property, from
-# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails on "image".
-# Then the images signature checking will not be mandatory and no error will be
-# raised in case of failure.
-# UBOOT_SIGN_IMG_KEYNAME = "dev2" # keys name in keydir (eg. "dev2.crt", "dev2.key")
-
 #
 # Emit the fitImage ITS header
 #
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index a17be745ce..96c47ab016 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -26,6 +26,7 @@
 
 # We need some variables from u-boot-config
 inherit uboot-config
+require conf/image-fitimage.conf
 
 # Enable use of a U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE ?= "0"
@@ -85,9 +86,6 @@ UBOOT_FIT_KEY_SIGN_PKCS ?= "-x509"
 # ex: 1 32bits address, 2 64bits address
 UBOOT_FIT_ADDRESS_CELLS ?= "1"
 
-# This is only necessary for determining the signing configuration
-KERNEL_PN = "${PREFERRED_PROVIDER_virtual/kernel}"
-
 UBOOT_FIT_UBOOT_LOADADDRESS ?= "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?= "${UBOOT_ENTRYPOINT}"
 
@@ -96,8 +94,6 @@ python() {
     sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
-    if sign:
-        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
 }
 
 concat_dtb() {
@@ -106,16 +102,26 @@ concat_dtb() {
 
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
 		# Re-sign the kernel in order to add the keys to our dtb
+		UBOOT_MKIMAGE_MODE="auto-conf"
+		# Signing individual images is not recommended as that
+		# makes fitImage susceptible to mix-and-match attack.
+		if [ "${FIT_SIGN_INDIVIDUAL}" = "1" ] ; then
+			UBOOT_MKIMAGE_MODE="auto"
+		fi
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-			-F -k "${UBOOT_SIGN_KEYDIR}" \
+			-f $UBOOT_MKIMAGE_MODE \
+			-k "${UBOOT_SIGN_KEYDIR}" \
+			-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
+			-g "${UBOOT_SIGN_IMG_KEYNAME}" \
 			-K "${UBOOT_DTB_BINARY}" \
-			-r ${B}/fitImage-linux \
+			-d /dev/null \
+			-r ${B}/unused.itb \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 		# Verify the kernel image and u-boot dtb
 		${UBOOT_FIT_CHECK_SIGN} \
 			-k "${UBOOT_DTB_BINARY}" \
-			-f ${B}/fitImage-linux
+			-f ${B}/unused.itb
 		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
 
@@ -351,10 +357,6 @@ uboot_assemble_fitimage_helper() {
 }
 
 do_uboot_assemble_fitimage() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
-		cp "${STAGING_DIR_HOST}/sysroot-only/fitImage" "${B}/fitImage-linux"
-	fi
-
 	if [ -n "${UBOOT_CONFIG}" ]; then
 		unset i
 		for config in ${UBOOT_MACHINE}; do
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
new file mode 100644
index 0000000000..be9ae30134
--- /dev/null
+++ b/meta/conf/image-fitimage.conf
@@ -0,0 +1,53 @@
+# Possible options for fitImage generation, mainly
+# related to signing of the fitImage content.
+
+# Description string
+FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
+
+# Kernel fitImage Hash Algo
+FIT_HASH_ALG ?= "sha256"
+
+# Kernel fitImage Signature Algo
+FIT_SIGN_ALG ?= "rsa2048"
+
+# Kernel / U-Boot fitImage Padding Algo
+FIT_PAD_ALG ?= "pkcs-1.5"
+
+# Generate keys for signing Kernel fitImage
+FIT_GENERATE_KEYS ?= "0"
+
+# Size of private keys in number of bits
+FIT_SIGN_NUMBITS ?= "2048"
+
+# args to openssl genrsa (Default is just the public exponent)
+FIT_KEY_GENRSA_ARGS ?= "-F4"
+
+# args to openssl req (Default is -batch for non interactive mode and
+# -new for new certificate)
+FIT_KEY_REQ_ARGS ?= "-batch -new"
+
+# Standard format for public key certificate
+FIT_KEY_SIGN_PKCS ?= "-x509"
+
+# Sign individual images as well
+FIT_SIGN_INDIVIDUAL ?= "0"
+
+FIT_CONF_PREFIX ?= "conf-"
+FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
+
+FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
+
+# Allow user to select the default DTB for FIT image when multiple dtb's exists.
+FIT_CONF_DEFAULT_DTB ?= ""
+
+# length of address in number of <u32> cells
+# ex: 1 32bits address, 2 64bits address
+FIT_ADDRESS_CELLS ?= "1"
+
+# Keys used to sign individually image nodes.
+# The keys to sign image nodes must be different from those used to sign
+# configuration nodes, otherwise the "required" property, from
+# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails on "image".
+# Then the images signature checking will not be mandatory and no error will be
+# raised in case of failure.
+# UBOOT_SIGN_IMG_KEYNAME = "dev2" # keys name in keydir (eg. "dev2.crt", "dev2.key")
-- 
2.43.0


