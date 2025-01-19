Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7FBC02183
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 14:04:15 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.15659.1737295449519849432
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 06:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=Mw5o5KoW;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4131D1047DC3B;
	Sun, 19 Jan 2025 15:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737295447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V/rqpa+AbSwLzdQVkB/zEuoq6Om9lcSlf+pz6Qgr4Lc=;
	b=Mw5o5KoW/EPUnefSnRPwyea5uyL6yIegc79GllNU0VjIo9evy46lwEKiIWWiEivQ/ONsnC
	arFCb6MDlDSuL2LkdPTPKLPOnJUm9CmVjJsD2Wp9DWQ97QiEQ1h8NQckYw9DszheYAGR8b
	UqOWhTgCe7rJWMJUyvv0YZexcOVL4inxpOOEJf0CibCO3kgqXASoERE33dDRZBrg46/FSb
	nfHa/oNV+tHzisBrtqx0e3wH7nSUsuD0SqJ143nmkvKP7ySEocVupN6IHZjKDDC1kubTrp
	5BX64AyFj1QxFOoQ+/D8vDgH4hN8wGEDlKaWSQfrxszLT6El0vmlSb1n1m5CoQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v4] u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
Date: Sun, 19 Jan 2025 15:03:35 +0100
Message-ID: <20250119140349.21919-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 14:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210008

In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
kernel-fitimage.bbclass is in use to generate signed kernel
fitImage, there is a circular dependency between uboot-sign
and kernel-fitimage bbclasses . The loop looks like this:

kernel-fitimage.bbclass:
- do_populate_sysroot depends on do_assemble_fitimage
  - do_assemble_fitimage depends on virtual/bootloader:do_populate_sysroo=
t
    - virtual/bootloader:do_populate_sysroot depends on virtual/bootloade=
r:do_install
      =3D> The virtual/bootloader:do_install installs and the
         virtual/bootloader:do_populate_sysroot places into
         sysroot an U-Boot environment script embedded into
         kernel fitImage during do_assemble_fitimage run .

uboot-sign.bbclass:
- DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately
  - do_deploy depends on do_uboot_assemble_fitimage
  - do_install depends on do_uboot_assemble_fitimage
  - do_uboot_assemble_fitimage depends on virtual/kernel:do_populate_sysr=
oot
    =3D> do_install depends on virtual/kernel:do_populate_sysroot

=3D> virtual/bootloader:do_install depends on virtual/kernel:do_populate_=
sysroot
   virtual/kernel:do_populate_sysroot depends on virtual/bootloader:do_in=
stall

Attempt to resolve the loop. Pull fitimage configuration options into sep=
arate
new bbclass kernel-fitimage-config.bbclass so these configuration options=
 can
be shared by both uboot-sign.bbclass and kernel-fitimage.bbclass, and mak=
e use
of mkimage -f auto-conf / mkimage -f auto option to insert /signature nod=
e key-*
subnode into U-Boot control DT without depending on the layout of kernel =
fitImage
itself. This is perfectly valid to do, because the U-Boot /signature node=
 key-*
subnodes 'required' property can contain either of two values, 'conf' or =
'image'
to authenticate either selected configuration or all of images when booti=
ng the
fitImage.

For details of the U-Boot fitImage signing process, see:
https://docs.u-boot.org/en/latest/usage/fit/signature.html
For details of mkimage -f auto-conf and -f auto, see:
https://manpages.debian.org/experimental/u-boot-tools/mkimage.1.en.html#E=
XAMPLES

Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies"=
)
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@seco.com>
---
V2: Take a different approach, split the kernel-fitimage.bbclass and
    use it to generate dummy fitImage on demand
V3: Use mkimage -f auto-conf and mkimage -f auto to break the loop,
    the fitImage .its source is not even needed because the 'required'
    property can only have two values, 'conf' or 'image' .
V4: Restore CC list
---
 .../kernel-fitimage-config.bbclass            | 50 +++++++++++++++++
 meta/classes-recipe/kernel-fitimage.bbclass   | 54 +------------------
 meta/classes-recipe/uboot-sign.bbclass        | 26 ++++-----
 3 files changed, 64 insertions(+), 66 deletions(-)
 create mode 100644 meta/classes-recipe/kernel-fitimage-config.bbclass

diff --git a/meta/classes-recipe/kernel-fitimage-config.bbclass b/meta/cl=
asses-recipe/kernel-fitimage-config.bbclass
new file mode 100644
index 00000000000..1f665f7d47c
--- /dev/null
+++ b/meta/classes-recipe/kernel-fitimage-config.bbclass
@@ -0,0 +1,50 @@
+# Description string
+FIT_DESC ?=3D "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
+
+# Kernel fitImage Hash Algo
+FIT_HASH_ALG ?=3D "sha256"
+
+# Kernel fitImage Signature Algo
+FIT_SIGN_ALG ?=3D "rsa2048"
+
+# Kernel / U-Boot fitImage Padding Algo
+FIT_PAD_ALG ?=3D "pkcs-1.5"
+
+# Generate keys for signing Kernel fitImage
+FIT_GENERATE_KEYS ?=3D "0"
+
+# Size of private keys in number of bits
+FIT_SIGN_NUMBITS ?=3D "2048"
+
+# args to openssl genrsa (Default is just the public exponent)
+FIT_KEY_GENRSA_ARGS ?=3D "-F4"
+
+# args to openssl req (Default is -batch for non interactive mode and
+# -new for new certificate)
+FIT_KEY_REQ_ARGS ?=3D "-batch -new"
+
+# Standard format for public key certificate
+FIT_KEY_SIGN_PKCS ?=3D "-x509"
+
+# Sign individual images as well
+FIT_SIGN_INDIVIDUAL ?=3D "0"
+
+FIT_CONF_PREFIX ?=3D "conf-"
+FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configuration node name"
+
+FIT_SUPPORTED_INITRAMFS_FSTYPES ?=3D "cpio.lz4 cpio.lzo cpio.lzma cpio.x=
z cpio.zst cpio.gz ext2.gz cpio"
+
+# Allow user to select the default DTB for FIT image when multiple dtb's=
 exists.
+FIT_CONF_DEFAULT_DTB ?=3D ""
+
+# length of address in number of <u32> cells
+# ex: 1 32bits address, 2 64bits address
+FIT_ADDRESS_CELLS ?=3D "1"
+
+# Keys used to sign individually image nodes.
+# The keys to sign image nodes must be different from those used to sign
+# configuration nodes, otherwise the "required" property, from
+# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails on "i=
mage".
+# Then the images signature checking will not be mandatory and no error =
will be
+# raised in case of failure.
+# UBOOT_SIGN_IMG_KEYNAME =3D "dev2" # keys name in keydir (eg. "dev2.crt=
", "dev2.key")
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-r=
ecipe/kernel-fitimage.bbclass
index 67c98adb232..33dae750672 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit kernel-uboot kernel-artifact-names uboot-config
+inherit kernel-uboot kernel-artifact-names uboot-config kernel-fitimage-=
config
=20
 def get_fit_replacement_type(d):
     kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
@@ -52,58 +52,6 @@ python __anonymous () {
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/d=
evicetree")
 }
=20
-
-# Description string
-FIT_DESC ?=3D "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
-
-# Kernel fitImage Hash Algo
-FIT_HASH_ALG ?=3D "sha256"
-
-# Kernel fitImage Signature Algo
-FIT_SIGN_ALG ?=3D "rsa2048"
-
-# Kernel / U-Boot fitImage Padding Algo
-FIT_PAD_ALG ?=3D "pkcs-1.5"
-
-# Generate keys for signing Kernel fitImage
-FIT_GENERATE_KEYS ?=3D "0"
-
-# Size of private keys in number of bits
-FIT_SIGN_NUMBITS ?=3D "2048"
-
-# args to openssl genrsa (Default is just the public exponent)
-FIT_KEY_GENRSA_ARGS ?=3D "-F4"
-
-# args to openssl req (Default is -batch for non interactive mode and
-# -new for new certificate)
-FIT_KEY_REQ_ARGS ?=3D "-batch -new"
-
-# Standard format for public key certificate
-FIT_KEY_SIGN_PKCS ?=3D "-x509"
-
-# Sign individual images as well
-FIT_SIGN_INDIVIDUAL ?=3D "0"
-
-FIT_CONF_PREFIX ?=3D "conf-"
-FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configuration node name"
-
-FIT_SUPPORTED_INITRAMFS_FSTYPES ?=3D "cpio.lz4 cpio.lzo cpio.lzma cpio.x=
z cpio.zst cpio.gz ext2.gz cpio"
-
-# Allow user to select the default DTB for FIT image when multiple dtb's=
 exists.
-FIT_CONF_DEFAULT_DTB ?=3D ""
-
-# length of address in number of <u32> cells
-# ex: 1 32bits address, 2 64bits address
-FIT_ADDRESS_CELLS ?=3D "1"
-
-# Keys used to sign individually image nodes.
-# The keys to sign image nodes must be different from those used to sign
-# configuration nodes, otherwise the "required" property, from
-# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails on "i=
mage".
-# Then the images signature checking will not be mandatory and no error =
will be
-# raised in case of failure.
-# UBOOT_SIGN_IMG_KEYNAME =3D "dev2" # keys name in keydir (eg. "dev2.crt=
", "dev2.key")
-
 #
 # Emit the fitImage ITS header
 #
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
index a17be745cec..d23ae4d8d15 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -25,7 +25,7 @@
 # For more details on signature process, please refer to U-Boot document=
ation.
=20
 # We need some variables from u-boot-config
-inherit uboot-config
+inherit uboot-config kernel-fitimage-config
=20
 # Enable use of a U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE ?=3D "0"
@@ -85,9 +85,6 @@ UBOOT_FIT_KEY_SIGN_PKCS ?=3D "-x509"
 # ex: 1 32bits address, 2 64bits address
 UBOOT_FIT_ADDRESS_CELLS ?=3D "1"
=20
-# This is only necessary for determining the signing configuration
-KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
-
 UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
=20
@@ -96,8 +93,6 @@ python() {
     sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
-    if sign:
-        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
 }
=20
 concat_dtb() {
@@ -106,16 +101,25 @@ concat_dtb() {
=20
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
 		# Re-sign the kernel in order to add the keys to our dtb
+		UBOOT_MKIMAGE_MODE=3D"auto-conf"
+		# Signing individual images is not recommended as that
+		# makes fitImage susceptible to mix-and-match attack.
+		if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
+			UBOOT_MKIMAGE_MODE=3D"auto"
+		fi
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}')=
 else ''} \
-			-F -k "${UBOOT_SIGN_KEYDIR}" \
+			-f ${UBOOT_MKIMAGE_MODE} -d /dev/null \
+			-k "${UBOOT_SIGN_KEYDIR}" \
+			-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
+			-g "${UBOOT_SIGN_IMG_KEYNAME}" \
 			-K "${UBOOT_DTB_BINARY}" \
-			-r ${B}/fitImage-linux \
+			-r ${B}/unused.itb
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 		# Verify the kernel image and u-boot dtb
 		${UBOOT_FIT_CHECK_SIGN} \
 			-k "${UBOOT_DTB_BINARY}" \
-			-f ${B}/fitImage-linux
+			-f ${B}/unused.itb
 		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
=20
@@ -351,10 +355,6 @@ uboot_assemble_fitimage_helper() {
 }
=20
 do_uboot_assemble_fitimage() {
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
-		cp "${STAGING_DIR_HOST}/sysroot-only/fitImage" "${B}/fitImage-linux"
-	fi
-
 	if [ -n "${UBOOT_CONFIG}" ]; then
 		unset i
 		for config in ${UBOOT_MACHINE}; do
--=20
2.45.2


