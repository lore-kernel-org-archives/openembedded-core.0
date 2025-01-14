Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6FBC02180
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 01:02:20 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.34401.1736816538830787803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 17:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=fkEOvSfr;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AA54101C8563;
	Tue, 14 Jan 2025 02:02:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736816535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gIEUpL2VJzf/AJpY+X+tieraR7M+KfkE0/vLDfuLIKk=;
	b=fkEOvSfrcTAJBirRXXQu3X/ISauZsoO08zEc6CgoaBSBCiWtgBOz/Jc7Jq4WL0EYa6iCVv
	o+5EKGiMvWbjsl2O2OLnHmlByZQtpS4plQHHt/TRBPHzn4ZN7UgTG/4shbZVwCNkjVWEw2
	ZtkZQIHq+4GtGJsDVVn0Fhej3hPQjfnq3l7Z318d0Ov+67vL0y6UoWLbg1ZapjY4vBPLX3
	VftfczY4pBbrD45awvvRgxLIIpHqq9Tvp6kF71hGzyb1/LT3i6lPKHcUcJ8KPE46GbHn2r
	mE7/irBRGiiucv7gqFXpkSBDG2vxoIIZne02xWeE4DXSgJ2Lp7suVPOezNZHyQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v2] u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
Date: Tue, 14 Jan 2025 02:01:44 +0100
Message-ID: <20250114010202.95843-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 01:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209772

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

Attempt to resolve the loop. Pull fitimage_assemble() into separate new b=
bclass
kernel-fitimage-its.bbclass and split fitimage_assemble() into two functi=
ons,
fitimage_assemble_its() to generate the fit-image.its and fitimage_assemb=
le_itb()
to run mkimage on fit-image.its and produce the final fitImage-none fitIm=
age.

Inherit kernel-fitimage-its.bbclass in uboot-sign.bbclass and use these t=
wo
new functions to generate a dummy signed fitImage which, instead of conta=
ining
any meaningful blobs as payloads contains a dummy u-boot.dtb as payload f=
or
every single blob included in the fitImage. The placement of signature {}
nodes in this dummy signed fitImage exactly matches the final signed kern=
el
fitImage, which is very important.

The follow up mkimage invocation which inserts public key material into
u-boot.dtb /signature {} node does not care about the content of the dumm=
y
signed fitImage blobs, that mkimage invocation only cares about the place=
ment
of signature {} nodes in that dummy signed fitImage. That mkimage invocat=
ion
uses the placement of these signature {} nodes to construct u-boot.dtb
/signature/<key> 'required' property content, which is used by U-Boot
when authenticating blobs in the fitImage using the public <key> that
was currently inserted into the u-boot.dtb by mkimage .

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
---
 .../kernel-fitimage-its.bbclass               | 730 ++++++++++++++++++
 meta/classes-recipe/kernel-fitimage.bbclass   | 712 +----------------
 meta/classes-recipe/uboot-sign.bbclass        |  15 +-
 3 files changed, 742 insertions(+), 715 deletions(-)
 create mode 100644 meta/classes-recipe/kernel-fitimage-its.bbclass

diff --git a/meta/classes-recipe/kernel-fitimage-its.bbclass b/meta/class=
es-recipe/kernel-fitimage-its.bbclass
new file mode 100644
index 0000000000..a655941aca
--- /dev/null
+++ b/meta/classes-recipe/kernel-fitimage-its.bbclass
@@ -0,0 +1,730 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit kernel-uboot kernel-artifact-names uboot-config
+
+python __anonymous () {
+    #check if there are any dtb providers
+    providerdtb =3D d.getVar("PREFERRED_PROVIDER_virtual/dtb")
+    if providerdtb:
+        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/d=
evicetree")
+}
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
+
+#
+# Emit the fitImage ITS header
+#
+# $1 ... .its filename
+fitimage_emit_fit_header() {
+	cat << EOF >> $1
+/dts-v1/;
+
+/ {
+        description =3D "${FIT_DESC}";
+        #address-cells =3D <${FIT_ADDRESS_CELLS}>;
+EOF
+}
+
+#
+# Emit the fitImage section bits
+#
+# $1 ... .its filename
+# $2 ... Section bit type: imagestart - image section start
+#                          confstart  - configuration section start
+#                          sectend    - section end
+#                          fitend     - fitimage end
+#
+fitimage_emit_section_maint() {
+	case $2 in
+	imagestart)
+		cat << EOF >> $1
+
+        images {
+EOF
+	;;
+	confstart)
+		cat << EOF >> $1
+
+        configurations {
+EOF
+	;;
+	sectend)
+		cat << EOF >> $1
+	};
+EOF
+	;;
+	fitend)
+		cat << EOF >> $1
+};
+EOF
+	;;
+	esac
+}
+
+#
+# Emit the fitImage ITS kernel section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to kernel image
+# $4 ... Compression type
+fitimage_emit_section_kernel() {
+
+	kernel_csum=3D"${FIT_HASH_ALG}"
+	kernel_sign_algo=3D"${FIT_SIGN_ALG}"
+	kernel_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
+
+	ENTRYPOINT=3D"${UBOOT_ENTRYPOINT}"
+	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
+		ENTRYPOINT=3D`${HOST_PREFIX}nm vmlinux | \
+			awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
+	fi
+
+	cat << EOF >> $1
+                kernel-$2 {
+                        description =3D "Linux kernel";
+                        data =3D /incbin/("$3");
+                        type =3D "${UBOOT_MKIMAGE_KERNEL_TYPE}";
+                        arch =3D "${UBOOT_ARCH}";
+                        os =3D "linux";
+                        compression =3D "$4";
+                        load =3D <${UBOOT_LOADADDRESS}>;
+                        entry =3D <$ENTRYPOINT>;
+                        hash-1 {
+                                algo =3D "$kernel_csum";
+                        };
+                };
+EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$kernel_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
+                        signature-1 {
+                                algo =3D "$kernel_csum,$kernel_sign_algo=
";
+                                key-name-hint =3D "$kernel_sign_keyname"=
;
+                        };
+                };
+EOF
+	fi
+}
+
+#
+# Emit the fitImage ITS DTB section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to DTB image
+fitimage_emit_section_dtb() {
+
+	dtb_csum=3D"${FIT_HASH_ALG}"
+	dtb_sign_algo=3D"${FIT_SIGN_ALG}"
+	dtb_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
+
+	dtb_loadline=3D""
+	dtb_ext=3D${DTB##*.}
+	if [ "${dtb_ext}" =3D "dtbo" ]; then
+		if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
+			dtb_loadline=3D"load =3D <${UBOOT_DTBO_LOADADDRESS}>;"
+		fi
+	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
+		dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
+	fi
+	cat << EOF >> $1
+                fdt-$2 {
+                        description =3D "Flattened Device Tree blob";
+                        data =3D /incbin/("$3");
+                        type =3D "flat_dt";
+                        arch =3D "${UBOOT_ARCH}";
+                        compression =3D "none";
+                        $dtb_loadline
+                        hash-1 {
+                                algo =3D "$dtb_csum";
+                        };
+                };
+EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$dtb_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
+                        signature-1 {
+                                algo =3D "$dtb_csum,$dtb_sign_algo";
+                                key-name-hint =3D "$dtb_sign_keyname";
+                        };
+                };
+EOF
+	fi
+}
+
+#
+# Emit the fitImage ITS u-boot script section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to boot script image
+fitimage_emit_section_boot_script() {
+
+	bootscr_csum=3D"${FIT_HASH_ALG}"
+	bootscr_sign_algo=3D"${FIT_SIGN_ALG}"
+	bootscr_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
+
+        cat << EOF >> $1
+                bootscr-$2 {
+                        description =3D "U-boot script";
+                        data =3D /incbin/("$3");
+                        type =3D "script";
+                        arch =3D "${UBOOT_ARCH}";
+                        compression =3D "none";
+                        hash-1 {
+                                algo =3D "$bootscr_csum";
+                        };
+                };
+EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$bootscr_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
+                        signature-1 {
+                                algo =3D "$bootscr_csum,$bootscr_sign_al=
go";
+                                key-name-hint =3D "$bootscr_sign_keyname=
";
+                        };
+                };
+EOF
+	fi
+}
+
+#
+# Emit the fitImage ITS setup section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to setup image
+fitimage_emit_section_setup() {
+
+	setup_csum=3D"${FIT_HASH_ALG}"
+
+	cat << EOF >> $1
+                setup-$2 {
+                        description =3D "Linux setup.bin";
+                        data =3D /incbin/("$3");
+                        type =3D "x86_setup";
+                        arch =3D "${UBOOT_ARCH}";
+                        os =3D "linux";
+                        compression =3D "none";
+                        load =3D <0x00090000>;
+                        entry =3D <0x00090000>;
+                        hash-1 {
+                                algo =3D "$setup_csum";
+                        };
+                };
+EOF
+}
+
+#
+# Emit the fitImage ITS ramdisk section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to ramdisk image
+fitimage_emit_section_ramdisk() {
+
+	ramdisk_csum=3D"${FIT_HASH_ALG}"
+	ramdisk_sign_algo=3D"${FIT_SIGN_ALG}"
+	ramdisk_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
+	ramdisk_loadline=3D""
+	ramdisk_entryline=3D""
+
+	if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
+		ramdisk_loadline=3D"load =3D <${UBOOT_RD_LOADADDRESS}>;"
+	fi
+	if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
+		ramdisk_entryline=3D"entry =3D <${UBOOT_RD_ENTRYPOINT}>;"
+	fi
+
+	cat << EOF >> $1
+                ramdisk-$2 {
+                        description =3D "${INITRAMFS_IMAGE}";
+                        data =3D /incbin/("$3");
+                        type =3D "ramdisk";
+                        arch =3D "${UBOOT_ARCH}";
+                        os =3D "linux";
+                        compression =3D "none";
+                        $ramdisk_loadline
+                        $ramdisk_entryline
+                        hash-1 {
+                                algo =3D "$ramdisk_csum";
+                        };
+                };
+EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$ramdisk_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
+                        signature-1 {
+                                algo =3D "$ramdisk_csum,$ramdisk_sign_al=
go";
+                                key-name-hint =3D "$ramdisk_sign_keyname=
";
+                        };
+                };
+EOF
+	fi
+}
+
+#
+# echoes symlink destination if it points below directory
+#
+# $1 ... file that's a potential symlink
+# $2 ... expected parent directory
+symlink_points_below() {
+	file=3D"$2/$1"
+	dir=3D$2
+
+	if ! [ -L "$file" ]; then
+		return
+	fi
+
+	realpath=3D"$(realpath --relative-to=3D$dir $file)"
+	if [ -z "${realpath%%../*}" ]; then
+		return
+	fi
+
+	echo "$realpath"
+}
+
+#
+# Emit the fitImage ITS configuration section
+#
+# $1 ... .its filename
+# $2 ... Linux kernel ID
+# $3 ... DTB image name
+# $4 ... ramdisk ID
+# $5 ... u-boot script ID
+# $6 ... config ID
+# $7 ... default flag
+# $8 ... default DTB image name
+fitimage_emit_section_config() {
+
+	conf_csum=3D"${FIT_HASH_ALG}"
+	conf_sign_algo=3D"${FIT_SIGN_ALG}"
+	conf_padding_algo=3D"${FIT_PAD_ALG}"
+	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
+		conf_sign_keyname=3D"${UBOOT_SIGN_KEYNAME}"
+	fi
+
+	its_file=3D"$1"
+	kernel_id=3D"$2"
+	dtb_image=3D"$3"
+	ramdisk_id=3D"$4"
+	bootscr_id=3D"$5"
+	config_id=3D"$6"
+	default_flag=3D"$7"
+	default_dtb_image=3D"$8"
+
+	# Test if we have any DTBs at all
+	sep=3D""
+	conf_desc=3D""
+	conf_node=3D"${FIT_CONF_PREFIX}"
+	kernel_line=3D""
+	fdt_line=3D""
+	ramdisk_line=3D""
+	bootscr_line=3D""
+	setup_line=3D""
+	default_line=3D""
+	compatible_line=3D""
+
+	dtb_image_sect=3D$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_D=
EVICETREE}")
+	if [ -z "$dtb_image_sect" ]; then
+		dtb_image_sect=3D$dtb_image
+	fi
+
+	dtb_path=3D"${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
+	if [ -f "$dtb_path" ] || [ -L "$dtb_path" ]; then
+		compat=3D$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
+		if [ -n "$compat" ]; then
+			compatible_line=3D"compatible =3D \"$compat\";"
+		fi
+	fi
+
+	dtb_image=3D$(echo $dtb_image | tr '/' '_')
+	dtb_image_sect=3D$(echo "${dtb_image_sect}" | tr '/' '_')
+
+	# conf node name is selected based on dtb ID if it is present,
+	# otherwise its selected based on kernel ID
+	if [ -n "$dtb_image" ]; then
+		conf_node=3D$conf_node$dtb_image
+	else
+		conf_node=3D$conf_node$kernel_id
+	fi
+
+	if [ -n "$kernel_id" ]; then
+		conf_desc=3D"Linux kernel"
+		sep=3D", "
+		kernel_line=3D"kernel =3D \"kernel-$kernel_id\";"
+	fi
+
+	if [ -n "$dtb_image" ]; then
+		conf_desc=3D"$conf_desc${sep}FDT blob"
+		sep=3D", "
+		fdt_line=3D"fdt =3D \"fdt-$dtb_image_sect\";"
+	fi
+
+	if [ -n "$ramdisk_id" ]; then
+		conf_desc=3D"$conf_desc${sep}ramdisk"
+		sep=3D", "
+		ramdisk_line=3D"ramdisk =3D \"ramdisk-$ramdisk_id\";"
+	fi
+
+	if [ -n "$bootscr_id" ]; then
+		conf_desc=3D"$conf_desc${sep}u-boot script"
+		sep=3D", "
+		bootscr_line=3D"bootscr =3D \"bootscr-$bootscr_id\";"
+	fi
+
+	if [ -n "$config_id" ]; then
+		conf_desc=3D"$conf_desc${sep}setup"
+		setup_line=3D"setup =3D \"setup-$config_id\";"
+	fi
+
+	if [ "$default_flag" =3D "1" ]; then
+		# default node is selected based on dtb ID if it is present,
+		# otherwise its selected based on kernel ID
+		if [ -n "$dtb_image" ]; then
+			# Select default node as user specified dtb when
+			# multiple dtb exists.
+			if [ -n "$default_dtb_image" ]; then
+				default_line=3D"default =3D \"${FIT_CONF_PREFIX}$default_dtb_image\"=
;"
+			else
+				default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
+			fi
+		else
+			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$kernel_id\";"
+		fi
+	fi
+
+	cat << EOF >> $its_file
+                $default_line
+                $conf_node {
+                        description =3D "$default_flag $conf_desc";
+                        $compatible_line
+                        $kernel_line
+                        $fdt_line
+                        $ramdisk_line
+                        $bootscr_line
+                        $setup_line
+                        hash-1 {
+                                algo =3D "$conf_csum";
+                        };
+EOF
+
+	if [ -n "$conf_sign_keyname" ] ; then
+
+		sign_line=3D"sign-images =3D "
+		sep=3D""
+
+		if [ -n "$kernel_id" ]; then
+			sign_line=3D"$sign_line${sep}\"kernel\""
+			sep=3D", "
+		fi
+
+		if [ -n "$dtb_image" ]; then
+			sign_line=3D"$sign_line${sep}\"fdt\""
+			sep=3D", "
+		fi
+
+		if [ -n "$ramdisk_id" ]; then
+			sign_line=3D"$sign_line${sep}\"ramdisk\""
+			sep=3D", "
+		fi
+
+		if [ -n "$bootscr_id" ]; then
+			sign_line=3D"$sign_line${sep}\"bootscr\""
+			sep=3D", "
+		fi
+
+		if [ -n "$config_id" ]; then
+			sign_line=3D"$sign_line${sep}\"setup\""
+		fi
+
+		sign_line=3D"$sign_line;"
+
+		cat << EOF >> $its_file
+                        signature-1 {
+                                algo =3D "$conf_csum,$conf_sign_algo";
+                                key-name-hint =3D "$conf_sign_keyname";
+                                padding =3D "$conf_padding_algo";
+                                $sign_line
+                        };
+EOF
+	fi
+
+	cat << EOF >> $its_file
+                };
+EOF
+}
+
+#
+# Assemble fitImage .its source
+#
+# $1 ... .its filename
+# $2 ... include ramdisk
+fitimage_assemble_its() {
+	kernelcount=3D1
+	dtbcount=3D""
+	DTBS=3D""
+	ramdiskcount=3D$2
+	setupcount=3D""
+	bootscr_id=3D""
+	default_dtb_image=3D""
+
+	rm -f $1
+
+	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" =3D "${U=
BOOT_SIGN_IMG_KEYNAME}" ]; then
+		bbfatal "Keys used to sign images and configuration nodes must be diff=
erent."
+	fi
+
+	fitimage_emit_fit_header $1
+
+	#
+	# Step 1: Prepare a kernel image section.
+	#
+	fitimage_emit_section_maint $1 imagestart
+
+	uboot_prep_kimage
+	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
+
+	#
+	# Step 2: Prepare a DTB image section
+	#
+
+	if [ -n "${KERNEL_DEVICETREE}" ]; then
+		dtbcount=3D1
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo $DTB | grep -q '/dts/'; then
+				bbwarn "$DTB contains the full path to the the dts file, but only th=
e dtb name should be used."
+				DTB=3D`basename $DTB | sed 's,\.dts$,.dtb,g'`
+			fi
+
+			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
+			if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -s ${EXTERNAL_KERNEL_D=
EVICETREE}/${DTB} ]; then
+				continue
+			fi
+
+			DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/dts/$DTB"
+			if [ ! -e "$DTB_PATH" ]; then
+				DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/$DTB"
+			fi
+
+			# Strip off the path component from the filename
+			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) el=
se 'true'}"; then
+				DTB=3D`basename $DTB`
+			fi
+
+			# Set the default dtb image if it exists in the devicetree.
+			if [ "${FIT_CONF_DEFAULT_DTB}" =3D "$DTB" ];then
+				default_dtb_image=3D$(echo "$DTB" | tr '/' '_')
+			fi
+
+			DTB=3D$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
+			DTBS=3D"$DTBS $DTB"
+			DTB=3D$(echo $DTB | tr '/' '_')
+			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
+		done
+	fi
+
+	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
+		dtbcount=3D1
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -print=
f '%P\n' | sort) \
+		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' |=
 sort); do
+			# Set the default dtb image if it exists in the devicetree.
+			if [ ${FIT_CONF_DEFAULT_DTB} =3D $DTB ];then
+				default_dtb_image=3D$(echo "$DTB" | tr '/' '_')
+			fi
+
+			DTB=3D$(echo "$DTB" | tr '/' '_')
+
+			# Skip DTB/DTBO if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
+			DTBS=3D"$DTBS $DTB"
+
+			# Also skip if a symlink. We'll later have each config section point =
at it
+			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && c=
ontinue
+
+			DTB=3D$(echo $DTB | tr '/' '_')
+			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB=
"
+		done
+	fi
+
+	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then=20
+		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device=
 trees."
+	fi
+
+	#
+	# Step 3: Prepare a u-boot script section
+	#
+
+	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
+		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
+			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
+			bootscr_id=3D"${UBOOT_ENV_BINARY}"
+			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY=
}
+		else
+			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
+		fi
+	fi
+
+	#
+	# Step 4: Prepare a setup section. (For x86)
+	#
+	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
+		setupcount=3D1
+		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.=
bin
+	fi
+
+	#
+	# Step 5: Prepare a ramdisk section.
+	#
+	if [ "x${ramdiskcount}" =3D "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D=
 "1" ]; then
+		# Find and use the first initramfs image archive type we find
+		found=3D
+		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
+			initramfs_path=3D"${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
+			if [ -e "$initramfs_path" ]; then
+				bbnote "Found initramfs image: $initramfs_path"
+				found=3Dtrue
+				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
+				break
+			else
+				bbnote "Did not find initramfs image: $initramfs_path"
+			fi
+		done
+
+		if [ -z "$found" ]; then
+			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_=
NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
+		fi
+	fi
+
+	fitimage_emit_section_maint $1 sectend
+
+	# Force the first Kernel and DTB in the default config
+	kernelcount=3D1
+	if [ -n "$dtbcount" ]; then
+		dtbcount=3D1
+	fi
+
+	#
+	# Step 6: Prepare a configurations section
+	#
+	fitimage_emit_section_maint $1 confstart
+
+	# kernel-fitimage.bbclass currently only supports a single kernel (no l=
ess or
+	# more) to be added to the FIT image along with 0 or more device trees =
and
+	# 0 or 1 ramdisk.
+	# It is also possible to include an initramfs bundle (kernel and rootfs=
 in one binary)
+	# When the initramfs bundle is used ramdisk is disabled.
+	# If a device tree is to be part of the FIT image, then select
+	# the default configuration to be used is based on the dtbcount. If the=
re is
+	# no dtb present than select the default configuation to be based on
+	# the kernelcount.
+	if [ -n "$DTBS" ]; then
+		i=3D1
+		for DTB in ${DTBS}; do
+			dtb_ext=3D${DTB##*.}
+			if [ "$dtb_ext" =3D "dtbo" ]; then
+				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr=
 $i =3D $dtbcount`" "$default_dtb_image"
+			else
+				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" =
"$bootscr_id" "$setupcount" "`expr $i =3D $dtbcount`" "$default_dtb_image=
"
+			fi
+			i=3D`expr $i + 1`
+		done
+	else
+		defaultconfigcount=3D1
+		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$boot=
scr_id"  "$setupcount" $defaultconfigcount "$default_dtb_image"
+	fi
+
+	fitimage_emit_section_maint $1 sectend
+
+	fitimage_emit_section_maint $1 fitend
+}
+
+#
+# Assemble fitImage .itb blob
+#
+# $1 ... .its filename
+# $2 ... .itb filename
+fitimage_assemble_itb() {
+	#
+	# Step 1: Assemble the image
+	#
+	rm -f arch/${ARCH}/boot/$1
+	${UBOOT_MKIMAGE} \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') =
else ''} \
+		-f $1 \
+		${KERNEL_OUTPUT_DIR}/$2
+
+	#
+	# Step 2: Sign the image
+	#
+	if [ "x${UBOOT_SIGN_ENABLE}" =3D "x1" ] ; then
+		${UBOOT_MKIMAGE_SIGN} \
+			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}')=
 else ''} \
+			-F -k "${UBOOT_SIGN_KEYDIR}" \
+			-r ${KERNEL_OUTPUT_DIR}/$2 \
+			${UBOOT_MKIMAGE_SIGN_ARGS}
+	fi
+}
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-r=
ecipe/kernel-fitimage.bbclass
index 67c98adb23..8c039b14f3 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit kernel-uboot kernel-artifact-names uboot-config
+inherit kernel-uboot kernel-artifact-names uboot-config kernel-fitimage-=
its
=20
 def get_fit_replacement_type(d):
     kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
@@ -49,716 +49,6 @@ python __anonymous () {
     if providerdtb:
         d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/dtb=
:do_populate_sysroot')
         d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' v=
irtual/dtb:do_populate_sysroot')
-        d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/d=
evicetree")
-}
-
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
-#
-# Emit the fitImage ITS header
-#
-# $1 ... .its filename
-fitimage_emit_fit_header() {
-	cat << EOF >> $1
-/dts-v1/;
-
-/ {
-        description =3D "${FIT_DESC}";
-        #address-cells =3D <${FIT_ADDRESS_CELLS}>;
-EOF
-}
-
-#
-# Emit the fitImage section bits
-#
-# $1 ... .its filename
-# $2 ... Section bit type: imagestart - image section start
-#                          confstart  - configuration section start
-#                          sectend    - section end
-#                          fitend     - fitimage end
-#
-fitimage_emit_section_maint() {
-	case $2 in
-	imagestart)
-		cat << EOF >> $1
-
-        images {
-EOF
-	;;
-	confstart)
-		cat << EOF >> $1
-
-        configurations {
-EOF
-	;;
-	sectend)
-		cat << EOF >> $1
-	};
-EOF
-	;;
-	fitend)
-		cat << EOF >> $1
-};
-EOF
-	;;
-	esac
-}
-
-#
-# Emit the fitImage ITS kernel section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to kernel image
-# $4 ... Compression type
-fitimage_emit_section_kernel() {
-
-	kernel_csum=3D"${FIT_HASH_ALG}"
-	kernel_sign_algo=3D"${FIT_SIGN_ALG}"
-	kernel_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-
-	ENTRYPOINT=3D"${UBOOT_ENTRYPOINT}"
-	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
-		ENTRYPOINT=3D`${HOST_PREFIX}nm vmlinux | \
-			awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
-	fi
-
-	cat << EOF >> $1
-                kernel-$2 {
-                        description =3D "Linux kernel";
-                        data =3D /incbin/("$3");
-                        type =3D "${UBOOT_MKIMAGE_KERNEL_TYPE}";
-                        arch =3D "${UBOOT_ARCH}";
-                        os =3D "linux";
-                        compression =3D "$4";
-                        load =3D <${UBOOT_LOADADDRESS}>;
-                        entry =3D <$ENTRYPOINT>;
-                        hash-1 {
-                                algo =3D "$kernel_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$kernel_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$kernel_csum,$kernel_sign_algo=
";
-                                key-name-hint =3D "$kernel_sign_keyname"=
;
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# Emit the fitImage ITS DTB section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to DTB image
-fitimage_emit_section_dtb() {
-
-	dtb_csum=3D"${FIT_HASH_ALG}"
-	dtb_sign_algo=3D"${FIT_SIGN_ALG}"
-	dtb_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-
-	dtb_loadline=3D""
-	dtb_ext=3D${DTB##*.}
-	if [ "${dtb_ext}" =3D "dtbo" ]; then
-		if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
-			dtb_loadline=3D"load =3D <${UBOOT_DTBO_LOADADDRESS}>;"
-		fi
-	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
-		dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
-	fi
-	cat << EOF >> $1
-                fdt-$2 {
-                        description =3D "Flattened Device Tree blob";
-                        data =3D /incbin/("$3");
-                        type =3D "flat_dt";
-                        arch =3D "${UBOOT_ARCH}";
-                        compression =3D "none";
-                        $dtb_loadline
-                        hash-1 {
-                                algo =3D "$dtb_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$dtb_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$dtb_csum,$dtb_sign_algo";
-                                key-name-hint =3D "$dtb_sign_keyname";
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# Emit the fitImage ITS u-boot script section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to boot script image
-fitimage_emit_section_boot_script() {
-
-	bootscr_csum=3D"${FIT_HASH_ALG}"
-	bootscr_sign_algo=3D"${FIT_SIGN_ALG}"
-	bootscr_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-
-        cat << EOF >> $1
-                bootscr-$2 {
-                        description =3D "U-boot script";
-                        data =3D /incbin/("$3");
-                        type =3D "script";
-                        arch =3D "${UBOOT_ARCH}";
-                        compression =3D "none";
-                        hash-1 {
-                                algo =3D "$bootscr_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$bootscr_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$bootscr_csum,$bootscr_sign_al=
go";
-                                key-name-hint =3D "$bootscr_sign_keyname=
";
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# Emit the fitImage ITS setup section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to setup image
-fitimage_emit_section_setup() {
-
-	setup_csum=3D"${FIT_HASH_ALG}"
-
-	cat << EOF >> $1
-                setup-$2 {
-                        description =3D "Linux setup.bin";
-                        data =3D /incbin/("$3");
-                        type =3D "x86_setup";
-                        arch =3D "${UBOOT_ARCH}";
-                        os =3D "linux";
-                        compression =3D "none";
-                        load =3D <0x00090000>;
-                        entry =3D <0x00090000>;
-                        hash-1 {
-                                algo =3D "$setup_csum";
-                        };
-                };
-EOF
-}
-
-#
-# Emit the fitImage ITS ramdisk section
-#
-# $1 ... .its filename
-# $2 ... Image counter
-# $3 ... Path to ramdisk image
-fitimage_emit_section_ramdisk() {
-
-	ramdisk_csum=3D"${FIT_HASH_ALG}"
-	ramdisk_sign_algo=3D"${FIT_SIGN_ALG}"
-	ramdisk_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
-	ramdisk_loadline=3D""
-	ramdisk_entryline=3D""
-
-	if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
-		ramdisk_loadline=3D"load =3D <${UBOOT_RD_LOADADDRESS}>;"
-	fi
-	if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
-		ramdisk_entryline=3D"entry =3D <${UBOOT_RD_ENTRYPOINT}>;"
-	fi
-
-	cat << EOF >> $1
-                ramdisk-$2 {
-                        description =3D "${INITRAMFS_IMAGE}";
-                        data =3D /incbin/("$3");
-                        type =3D "ramdisk";
-                        arch =3D "${UBOOT_ARCH}";
-                        os =3D "linux";
-                        compression =3D "none";
-                        $ramdisk_loadline
-                        $ramdisk_entryline
-                        hash-1 {
-                                algo =3D "$ramdisk_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D "1"=
 -a -n "$ramdisk_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo =3D "$ramdisk_csum,$ramdisk_sign_al=
go";
-                                key-name-hint =3D "$ramdisk_sign_keyname=
";
-                        };
-                };
-EOF
-	fi
-}
-
-#
-# echoes symlink destination if it points below directory
-#
-# $1 ... file that's a potential symlink
-# $2 ... expected parent directory
-symlink_points_below() {
-	file=3D"$2/$1"
-	dir=3D$2
-
-	if ! [ -L "$file" ]; then
-		return
-	fi
-
-	realpath=3D"$(realpath --relative-to=3D$dir $file)"
-	if [ -z "${realpath%%../*}" ]; then
-		return
-	fi
-
-	echo "$realpath"
-}
-
-#
-# Emit the fitImage ITS configuration section
-#
-# $1 ... .its filename
-# $2 ... Linux kernel ID
-# $3 ... DTB image name
-# $4 ... ramdisk ID
-# $5 ... u-boot script ID
-# $6 ... config ID
-# $7 ... default flag
-# $8 ... default DTB image name
-fitimage_emit_section_config() {
-
-	conf_csum=3D"${FIT_HASH_ALG}"
-	conf_sign_algo=3D"${FIT_SIGN_ALG}"
-	conf_padding_algo=3D"${FIT_PAD_ALG}"
-	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
-		conf_sign_keyname=3D"${UBOOT_SIGN_KEYNAME}"
-	fi
-
-	its_file=3D"$1"
-	kernel_id=3D"$2"
-	dtb_image=3D"$3"
-	ramdisk_id=3D"$4"
-	bootscr_id=3D"$5"
-	config_id=3D"$6"
-	default_flag=3D"$7"
-	default_dtb_image=3D"$8"
-
-	# Test if we have any DTBs at all
-	sep=3D""
-	conf_desc=3D""
-	conf_node=3D"${FIT_CONF_PREFIX}"
-	kernel_line=3D""
-	fdt_line=3D""
-	ramdisk_line=3D""
-	bootscr_line=3D""
-	setup_line=3D""
-	default_line=3D""
-	compatible_line=3D""
-
-	dtb_image_sect=3D$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_D=
EVICETREE}")
-	if [ -z "$dtb_image_sect" ]; then
-		dtb_image_sect=3D$dtb_image
-	fi
-
-	dtb_path=3D"${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	if [ -f "$dtb_path" ] || [ -L "$dtb_path" ]; then
-		compat=3D$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
-		if [ -n "$compat" ]; then
-			compatible_line=3D"compatible =3D \"$compat\";"
-		fi
-	fi
-
-	dtb_image=3D$(echo $dtb_image | tr '/' '_')
-	dtb_image_sect=3D$(echo "${dtb_image_sect}" | tr '/' '_')
-
-	# conf node name is selected based on dtb ID if it is present,
-	# otherwise its selected based on kernel ID
-	if [ -n "$dtb_image" ]; then
-		conf_node=3D$conf_node$dtb_image
-	else
-		conf_node=3D$conf_node$kernel_id
-	fi
-
-	if [ -n "$kernel_id" ]; then
-		conf_desc=3D"Linux kernel"
-		sep=3D", "
-		kernel_line=3D"kernel =3D \"kernel-$kernel_id\";"
-	fi
-
-	if [ -n "$dtb_image" ]; then
-		conf_desc=3D"$conf_desc${sep}FDT blob"
-		sep=3D", "
-		fdt_line=3D"fdt =3D \"fdt-$dtb_image_sect\";"
-	fi
-
-	if [ -n "$ramdisk_id" ]; then
-		conf_desc=3D"$conf_desc${sep}ramdisk"
-		sep=3D", "
-		ramdisk_line=3D"ramdisk =3D \"ramdisk-$ramdisk_id\";"
-	fi
-
-	if [ -n "$bootscr_id" ]; then
-		conf_desc=3D"$conf_desc${sep}u-boot script"
-		sep=3D", "
-		bootscr_line=3D"bootscr =3D \"bootscr-$bootscr_id\";"
-	fi
-
-	if [ -n "$config_id" ]; then
-		conf_desc=3D"$conf_desc${sep}setup"
-		setup_line=3D"setup =3D \"setup-$config_id\";"
-	fi
-
-	if [ "$default_flag" =3D "1" ]; then
-		# default node is selected based on dtb ID if it is present,
-		# otherwise its selected based on kernel ID
-		if [ -n "$dtb_image" ]; then
-			# Select default node as user specified dtb when
-			# multiple dtb exists.
-			if [ -n "$default_dtb_image" ]; then
-				default_line=3D"default =3D \"${FIT_CONF_PREFIX}$default_dtb_image\"=
;"
-			else
-				default_line=3D"default =3D \"${FIT_CONF_PREFIX}$dtb_image\";"
-			fi
-		else
-			default_line=3D"default =3D \"${FIT_CONF_PREFIX}$kernel_id\";"
-		fi
-	fi
-
-	cat << EOF >> $its_file
-                $default_line
-                $conf_node {
-                        description =3D "$default_flag $conf_desc";
-                        $compatible_line
-                        $kernel_line
-                        $fdt_line
-                        $ramdisk_line
-                        $bootscr_line
-                        $setup_line
-                        hash-1 {
-                                algo =3D "$conf_csum";
-                        };
-EOF
-
-	if [ -n "$conf_sign_keyname" ] ; then
-
-		sign_line=3D"sign-images =3D "
-		sep=3D""
-
-		if [ -n "$kernel_id" ]; then
-			sign_line=3D"$sign_line${sep}\"kernel\""
-			sep=3D", "
-		fi
-
-		if [ -n "$dtb_image" ]; then
-			sign_line=3D"$sign_line${sep}\"fdt\""
-			sep=3D", "
-		fi
-
-		if [ -n "$ramdisk_id" ]; then
-			sign_line=3D"$sign_line${sep}\"ramdisk\""
-			sep=3D", "
-		fi
-
-		if [ -n "$bootscr_id" ]; then
-			sign_line=3D"$sign_line${sep}\"bootscr\""
-			sep=3D", "
-		fi
-
-		if [ -n "$config_id" ]; then
-			sign_line=3D"$sign_line${sep}\"setup\""
-		fi
-
-		sign_line=3D"$sign_line;"
-
-		cat << EOF >> $its_file
-                        signature-1 {
-                                algo =3D "$conf_csum,$conf_sign_algo";
-                                key-name-hint =3D "$conf_sign_keyname";
-                                padding =3D "$conf_padding_algo";
-                                $sign_line
-                        };
-EOF
-	fi
-
-	cat << EOF >> $its_file
-                };
-EOF
-}
-
-#
-# Assemble fitImage
-#
-# $1 ... .its filename
-# $2 ... fitImage name
-# $3 ... include ramdisk
-fitimage_assemble() {
-	kernelcount=3D1
-	dtbcount=3D""
-	DTBS=3D""
-	ramdiskcount=3D$3
-	setupcount=3D""
-	bootscr_id=3D""
-	default_dtb_image=3D""
-	rm -f $1 arch/${ARCH}/boot/$2
-
-	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" =3D "${U=
BOOT_SIGN_IMG_KEYNAME}" ]; then
-		bbfatal "Keys used to sign images and configuration nodes must be diff=
erent."
-	fi
-
-	fitimage_emit_fit_header $1
-
-	#
-	# Step 1: Prepare a kernel image section.
-	#
-	fitimage_emit_section_maint $1 imagestart
-
-	uboot_prep_kimage
-	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
-
-	#
-	# Step 2: Prepare a DTB image section
-	#
-
-	if [ -n "${KERNEL_DEVICETREE}" ]; then
-		dtbcount=3D1
-		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo $DTB | grep -q '/dts/'; then
-				bbwarn "$DTB contains the full path to the the dts file, but only th=
e dtb name should be used."
-				DTB=3D`basename $DTB | sed 's,\.dts$,.dtb,g'`
-			fi
-
-			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
-			if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -s ${EXTERNAL_KERNEL_D=
EVICETREE}/${DTB} ]; then
-				continue
-			fi
-
-			DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/dts/$DTB"
-			if [ ! -e "$DTB_PATH" ]; then
-				DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/$DTB"
-			fi
-
-			# Strip off the path component from the filename
-			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) el=
se 'true'}"; then
-				DTB=3D`basename $DTB`
-			fi
-
-			# Set the default dtb image if it exists in the devicetree.
-			if [ "${FIT_CONF_DEFAULT_DTB}" =3D "$DTB" ];then
-				default_dtb_image=3D$(echo "$DTB" | tr '/' '_')
-			fi
-
-			DTB=3D$(echo "$DTB" | tr '/' '_')
-
-			# Skip DTB if we've picked it up previously
-			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
-
-			DTBS=3D"$DTBS $DTB"
-			DTB=3D$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
-		done
-	fi
-
-	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
-		dtbcount=3D1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -print=
f '%P\n' | sort) \
-		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' |=
 sort); do
-			# Set the default dtb image if it exists in the devicetree.
-			if [ ${FIT_CONF_DEFAULT_DTB} =3D $DTB ];then
-				default_dtb_image=3D$(echo "$DTB" | tr '/' '_')
-			fi
-
-			DTB=3D$(echo "$DTB" | tr '/' '_')
-
-			# Skip DTB/DTBO if we've picked it up previously
-			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
-
-			DTBS=3D"$DTBS $DTB"
-
-			# Also skip if a symlink. We'll later have each config section point =
at it
-			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && c=
ontinue
-
-			DTB=3D$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB=
"
-		done
-	fi
-
-	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then=20
-		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device=
 trees."
-	fi
-
-	#
-	# Step 3: Prepare a u-boot script section
-	#
-
-	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
-		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
-			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
-			bootscr_id=3D"${UBOOT_ENV_BINARY}"
-			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY=
}
-		else
-			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
-		fi
-	fi
-
-	#
-	# Step 4: Prepare a setup section. (For x86)
-	#
-	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
-		setupcount=3D1
-		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.=
bin
-	fi
-
-	#
-	# Step 5: Prepare a ramdisk section.
-	#
-	if [ "x${ramdiskcount}" =3D "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D=
 "1" ]; then
-		# Find and use the first initramfs image archive type we find
-		found=3D
-		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
-			initramfs_path=3D"${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
-			if [ -e "$initramfs_path" ]; then
-				bbnote "Found initramfs image: $initramfs_path"
-				found=3Dtrue
-				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
-				break
-			else
-				bbnote "Did not find initramfs image: $initramfs_path"
-			fi
-		done
-
-		if [ -z "$found" ]; then
-			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_=
NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
-		fi
-	fi
-
-	fitimage_emit_section_maint $1 sectend
-
-	# Force the first Kernel and DTB in the default config
-	kernelcount=3D1
-	if [ -n "$dtbcount" ]; then
-		dtbcount=3D1
-	fi
-
-	#
-	# Step 6: Prepare a configurations section
-	#
-	fitimage_emit_section_maint $1 confstart
-
-	# kernel-fitimage.bbclass currently only supports a single kernel (no l=
ess or
-	# more) to be added to the FIT image along with 0 or more device trees =
and
-	# 0 or 1 ramdisk.
-	# It is also possible to include an initramfs bundle (kernel and rootfs=
 in one binary)
-	# When the initramfs bundle is used ramdisk is disabled.
-	# If a device tree is to be part of the FIT image, then select
-	# the default configuration to be used is based on the dtbcount. If the=
re is
-	# no dtb present than select the default configuation to be based on
-	# the kernelcount.
-	if [ -n "$DTBS" ]; then
-		i=3D1
-		for DTB in ${DTBS}; do
-			dtb_ext=3D${DTB##*.}
-			if [ "$dtb_ext" =3D "dtbo" ]; then
-				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr=
 $i =3D $dtbcount`" "$default_dtb_image"
-			else
-				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" =
"$bootscr_id" "$setupcount" "`expr $i =3D $dtbcount`" "$default_dtb_image=
"
-			fi
-			i=3D`expr $i + 1`
-		done
-	else
-		defaultconfigcount=3D1
-		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$boot=
scr_id"  "$setupcount" $defaultconfigcount "$default_dtb_image"
-	fi
-
-	fitimage_emit_section_maint $1 sectend
-
-	fitimage_emit_section_maint $1 fitend
-
-	#
-	# Step 7: Assemble the image
-	#
-	${UBOOT_MKIMAGE} \
-		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') =
else ''} \
-		-f $1 \
-		${KERNEL_OUTPUT_DIR}/$2
-
-	#
-	# Step 8: Sign the image
-	#
-	if [ "x${UBOOT_SIGN_ENABLE}" =3D "x1" ] ; then
-		${UBOOT_MKIMAGE_SIGN} \
-			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}')=
 else ''} \
-			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			-r ${KERNEL_OUTPUT_DIR}/$2 \
-			${UBOOT_MKIMAGE_SIGN_ARGS}
-	fi
 }
=20
 do_assemble_fitimage() {
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
index a17be745ce..c8bec19ee7 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -25,7 +25,7 @@
 # For more details on signature process, please refer to U-Boot document=
ation.
=20
 # We need some variables from u-boot-config
-inherit uboot-config
+inherit uboot-config kernel-fitimage-its
=20
 # Enable use of a U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE ?=3D "0"
@@ -94,10 +94,10 @@ UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
 python() {
     # We need u-boot-tools-native if we're creating a U-Boot fitImage
     sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
+    if sign:
+        d.setVar('KERNEL_OUTPUT_DIR', d.getVar('B'))
     if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
-    if sign:
-        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
 }
=20
 concat_dtb() {
@@ -352,7 +352,14 @@ uboot_assemble_fitimage_helper() {
=20
 do_uboot_assemble_fitimage() {
 	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
-		cp "${STAGING_DIR_HOST}/sysroot-only/fitImage" "${B}/fitImage-linux"
+		# Sign dummy kernel in order to add the keys to our dtb, the
+		# actual kernel fitImage is signed in kernel-fitimage.bbclass
+		# using the same key material.
+		mkdir -p arch/${ARCH}/boot/
+		touch arch/${ARCH}/boot/vmlinuz.bin
+		fitimage_assemble_its fit-image.its ""
+		sed -i "/incbin/ s@/incbin/.*@/incbin/(\"${B}/u-boot.dtb\");@" fit-ima=
ge.its
+		fitimage_assemble_itb fit-image.its fitImage-linux
 	fi
=20
 	if [ -n "${UBOOT_CONFIG}" ]; then
--=20
2.45.2


