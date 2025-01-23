Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3197AC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 20:00:53 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.21330.1737662443295063340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 12:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=XETcprs7;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13A01101D23B1;
	Thu, 23 Jan 2025 21:00:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737662440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8RfqZ7WqOW/7u1LZfafnyX1AemP2p0FSCt5zRL09kSY=;
	b=XETcprs73pLFfGT/4Xlkcb7RconsFDf7PXR3JYB0kassR8ZkO4304ca/oKYP7DCkF98352
	jMGgJMQmVSTh5Q0H0hnBgo76Ko3MsnoZIHac4d97iCJekBl0h7A1Vt3V1KFEs76CHveMWu
	GqqYzRygeuZ1Xt52ViDm8FtUGXLMZ952/3ZjGAfLJNrSEPJz8qoVN5A53IdNz2TocS1uO1
	YBQTlTo7whQUjXKOU9xesE2h5NXA9O39XtdVnJsRX2vKt3IdQLwNwqsjdfv4XLTgH5G2BY
	YLpthKmskJeOZCmJUubq3IsG+qmC8IDFG3/csZ8bW76/+eA8IBlq8FKDppSAeg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Marek Vasut <marex@denx.de>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
Date: Thu, 23 Jan 2025 20:59:21 +0100
Message-ID: <20250123200023.181817-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 20:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210211

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
new configuration file image-fitimage.conf so these configuration options=
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

(From OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e)

Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies"=
)
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 53 +--------------------
 meta/classes-recipe/uboot-sign.bbclass      | 26 +++++-----
 meta/conf/image-fitimage.conf               | 53 +++++++++++++++++++++
 3 files changed, 68 insertions(+), 64 deletions(-)
 create mode 100644 meta/conf/image-fitimage.conf

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-r=
ecipe/kernel-fitimage.bbclass
index 18ab17bd2c4..3e20c3248be 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -5,6 +5,7 @@
 #
=20
 inherit kernel-uboot kernel-artifact-names uboot-config
+require conf/image-fitimage.conf
=20
 def get_fit_replacement_type(d):
     kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
@@ -52,58 +53,6 @@ python __anonymous () {
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
index a17be745cec..96c47ab0165 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -26,6 +26,7 @@
=20
 # We need some variables from u-boot-config
 inherit uboot-config
+require conf/image-fitimage.conf
=20
 # Enable use of a U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE ?=3D "0"
@@ -85,9 +86,6 @@ UBOOT_FIT_KEY_SIGN_PKCS ?=3D "-x509"
 # ex: 1 32bits address, 2 64bits address
 UBOOT_FIT_ADDRESS_CELLS ?=3D "1"
=20
-# This is only necessary for determining the signing configuration
-KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
-
 UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
=20
@@ -96,8 +94,6 @@ python() {
     sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
-    if sign:
-        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
 }
=20
 concat_dtb() {
@@ -106,16 +102,26 @@ concat_dtb() {
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
=20
@@ -351,10 +357,6 @@ uboot_assemble_fitimage_helper() {
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
diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.con=
f
new file mode 100644
index 00000000000..be9ae301346
--- /dev/null
+++ b/meta/conf/image-fitimage.conf
@@ -0,0 +1,53 @@
+# Possible options for fitImage generation, mainly
+# related to signing of the fitImage content.
+
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
--=20
2.45.2


