Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A4CC3ABB8
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:07:09 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.28208.1746364019754644020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Ik1eIA8H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250504130657fddddcf63aa4e7bc83-_a6zrl@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250504130657fddddcf63aa4e7bc83
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ihDxaaFMr0HwRn+obGmgHMkuKpvJl6z2c5CsVwn+Fg4=;
 b=Ik1eIA8H/MYA5DDDxgDQBp8wyHIwmYr086Eebb2b1ic6iP39l+9IYy9+1/4ViJ38YWxxET
 9hOYtWCQPwfIiT3Fd0xU2Iyrs5tV6d+zX/8nxcp/hrro4ejJVjQJwtQu1aoqZojYxPq7nyY/
 7GwIjahoAvtmMc3BLfOgpdt1/WLAvAhY3PrwBCDc1SXwVXptjeOyb/lSmcXAk6MY1OOfjT8K
 21SII5KWHI2zOPK/IirRC5smEVjSjTaKWZKimrlXLFQqKtTPzueApLu+7lnBK+ziLoCk883n
 y0MbsSJtLFU5BNbwGELvVpBdnftQDSYOSeSXWzNZQzUmopdqGW6iiKBQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 14/20] kernel-fitimage: re-write its code in Python
Date: Sun,  4 May 2025 15:05:01 +0200
Message-ID: <20250504130507.717954-14-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215962

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Rewrite the kernel-fitimage.bbclass file in Python. This allows the
reuse of the new fitimage Python library and a clear alignment of the
two implementations.

Actually, the motivation for an implementation in Python was different.
During the transition from the kernel-fitimage.bbclass to the new
linux-yocto-fitimage.bb, the existing shell code was rewritten in Python
so that the fitimage.py library could be extracted. The new
kernel-fit-image.bbclass and linux-yocto-fitimage.bb were then developed
on this basis.
This approach makes it possible to run the same tests for all different
implementations:
- kernel-fitimage.bbclass in Shell
- kernel-fitimage.bbclass in Python
- linux-yocto-fitimage.bb

Changing the commit order now enables a smooth transition. The two
implementations can coexist. Maintenance and testing should be feasible
for a few months with reasonable effort as they share most of the code.
But of course, the goal is to remove the kernel-fitimage.bbclass as soon
as possible.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 924 +++++---------------
 meta/classes-recipe/kernel-uboot.bbclass    |  45 +
 2 files changed, 243 insertions(+), 726 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 1ef7b1b4483..ba90bddb5f4 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -53,680 +53,170 @@ python __anonymous () {
         d.setVar('EXTERNAL_KERNEL_DEVICETREE', "${RECIPE_SYSROOT}/boot/devicetree")
 }
 
-#
-# Emit the fitImage ITS header
-#
-# $1 ... .its filename
-fitimage_emit_fit_header() {
-	cat << EOF >> $1
-/dts-v1/;
-
-/ {
-        description = "${FIT_DESC}";
-        #address-cells = <${FIT_ADDRESS_CELLS}>;
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
-	kernel_csum="${FIT_HASH_ALG}"
-	kernel_sign_algo="${FIT_SIGN_ALG}"
-	kernel_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
-
-	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
-	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
-		ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
-			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
-	fi
-
-	cat << EOF >> $1
-                kernel-$2 {
-                        description = "Linux kernel";
-                        type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
-                        compression = "$4";
-                        data = /incbin/("$3");
-                        arch = "${UBOOT_ARCH}";
-                        os = "linux";
-                        load = <${UBOOT_LOADADDRESS}>;
-                        entry = <$ENTRYPOINT>;
-                        hash-1 {
-                                algo = "$kernel_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$kernel_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo = "$kernel_csum,$kernel_sign_algo";
-                                key-name-hint = "$kernel_sign_keyname";
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
-	dtb_csum="${FIT_HASH_ALG}"
-	dtb_sign_algo="${FIT_SIGN_ALG}"
-	dtb_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
-
-	dtb_loadline=""
-	dtb_ext=${DTB##*.}
-	if [ "${dtb_ext}" = "dtbo" ]; then
-		if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
-			dtb_loadline="load = <${UBOOT_DTBO_LOADADDRESS}>;"
-		fi
-	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
-		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
-	fi
-	cat << EOF >> $1
-                fdt-$2 {
-                        description = "Flattened Device Tree blob";
-                        type = "flat_dt";
-                        compression = "none";
-                        data = /incbin/("$3");
-                        arch = "${UBOOT_ARCH}";
-                        $dtb_loadline
-                        hash-1 {
-                                algo = "$dtb_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$dtb_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo = "$dtb_csum,$dtb_sign_algo";
-                                key-name-hint = "$dtb_sign_keyname";
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
-	bootscr_csum="${FIT_HASH_ALG}"
-	bootscr_sign_algo="${FIT_SIGN_ALG}"
-	bootscr_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
-
-        cat << EOF >> $1
-                bootscr-$2 {
-                        description = "U-boot script";
-                        type = "script";
-                        compression = "none";
-                        data = /incbin/("$3");
-                        arch = "${UBOOT_ARCH}";
-                        hash-1 {
-                                algo = "$bootscr_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$bootscr_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo = "$bootscr_csum,$bootscr_sign_algo";
-                                key-name-hint = "$bootscr_sign_keyname";
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
-	setup_csum="${FIT_HASH_ALG}"
-	setup_sign_algo="${FIT_SIGN_ALG}"
-	setup_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
-
-	cat << EOF >> $1
-                setup-$2 {
-                        description = "Linux setup.bin";
-                        type = "x86_setup";
-                        compression = "none";
-                        data = /incbin/("$3");
-                        arch = "${UBOOT_ARCH}";
-                        os = "linux";
-                        load = <0x00090000>;
-                        entry = <0x00090000>;
-                        hash-1 {
-                                algo = "$setup_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$setup_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo = "$setup_csum,$setup_sign_algo";
-                                key-name-hint = "$setup_sign_keyname";
-                        };
-                };
-EOF
-	fi
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
-	ramdisk_csum="${FIT_HASH_ALG}"
-	ramdisk_sign_algo="${FIT_SIGN_ALG}"
-	ramdisk_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
-	ramdisk_loadline=""
-	ramdisk_entryline=""
-
-	if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
-		ramdisk_loadline="load = <${UBOOT_RD_LOADADDRESS}>;"
-	fi
-	if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
-		ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
-	fi
-
-	cat << EOF >> $1
-                ramdisk-$2 {
-                        description = "${INITRAMFS_IMAGE}";
-                        type = "ramdisk";
-                        compression = "none";
-                        data = /incbin/("$3");
-                        arch = "${UBOOT_ARCH}";
-                        os = "linux";
-                        $ramdisk_loadline
-                        $ramdisk_entryline
-                        hash-1 {
-                                algo = "$ramdisk_csum";
-                        };
-                };
-EOF
-
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$ramdisk_sign_keyname" ] ; then
-		sed -i '$ d' $1
-		cat << EOF >> $1
-                        signature-1 {
-                                algo = "$ramdisk_csum,$ramdisk_sign_algo";
-                                key-name-hint = "$ramdisk_sign_keyname";
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
-	file="$2/$1"
-	dir=$2
-
-	if ! [ -L "$file" ]; then
-		return
-	fi
-
-	realpath="$(realpath --relative-to=$dir $file)"
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
-	conf_csum="${FIT_HASH_ALG}"
-	conf_sign_algo="${FIT_SIGN_ALG}"
-	conf_padding_algo="${FIT_PAD_ALG}"
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
-		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
-	fi
-
-	its_file="$1"
-	kernel_id="$2"
-	dtb_image="$3"
-	ramdisk_id="$4"
-	bootscr_id="$5"
-	config_id="$6"
-	default_flag="$7"
-	default_dtb_image="$8"
-
-	# Test if we have any DTBs at all
-	sep=""
-	conf_desc=""
-	conf_node="${FIT_CONF_PREFIX}"
-	kernel_line=""
-	fdt_line=""
-	ramdisk_line=""
-	bootscr_line=""
-	setup_line=""
-	default_line=""
-	compatible_line=""
-
-	dtb_image_sect=$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEVICETREE}")
-	if [ -z "$dtb_image_sect" ]; then
-		dtb_image_sect=$dtb_image
-	fi
-
-	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	if [ -f "$dtb_path" ] || [ -L "$dtb_path" ]; then
-		compat=$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
-		if [ -n "$compat" ]; then
-			compatible_line="compatible = \"$compat\";"
-		fi
-	fi
-
-	dtb_image=$(echo $dtb_image | tr '/' '_')
-	dtb_image_sect=$(echo "${dtb_image_sect}" | tr '/' '_')
-
-	# conf node name is selected based on dtb ID if it is present,
-	# otherwise its selected based on kernel ID
-	if [ -n "$dtb_image" ]; then
-		conf_node=$conf_node$dtb_image
-	else
-		conf_node=$conf_node$kernel_id
-	fi
-
-	if [ -n "$kernel_id" ]; then
-		conf_desc="Linux kernel"
-		sep=", "
-		kernel_line="kernel = \"kernel-$kernel_id\";"
-	fi
-
-	if [ -n "$dtb_image" ]; then
-		conf_desc="$conf_desc${sep}FDT blob"
-		sep=", "
-		fdt_line="fdt = \"fdt-$dtb_image_sect\";"
-	fi
-
-	if [ -n "$ramdisk_id" ]; then
-		conf_desc="$conf_desc${sep}ramdisk"
-		sep=", "
-		ramdisk_line="ramdisk = \"ramdisk-$ramdisk_id\";"
-	fi
-
-	if [ -n "$bootscr_id" ]; then
-		conf_desc="$conf_desc${sep}u-boot script"
-		sep=", "
-		bootscr_line="bootscr = \"bootscr-$bootscr_id\";"
-	fi
-
-	if [ -n "$config_id" ]; then
-		conf_desc="$conf_desc${sep}setup"
-		setup_line="setup = \"setup-$config_id\";"
-	fi
-
-	if [ "$default_flag" = "1" ]; then
-		# default node is selected based on dtb ID if it is present,
-		# otherwise its selected based on kernel ID
-		if [ -n "$dtb_image" ]; then
-			# Select default node as user specified dtb when
-			# multiple dtb exists.
-			if [ -n "$default_dtb_image" ]; then
-				default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
-			else
-				default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
-			fi
-		else
-			default_line="default = \"${FIT_CONF_PREFIX}$kernel_id\";"
-		fi
-	fi
-
-	cat << EOF >> $its_file
-                $default_line
-                $conf_node {
-                        description = "$default_flag $conf_desc";
-                        $compatible_line
-                        $kernel_line
-                        $fdt_line
-                        $ramdisk_line
-                        $bootscr_line
-                        $setup_line
-                        hash-1 {
-                                algo = "$conf_csum";
-                        };
-EOF
-
-	if [ -n "$conf_sign_keyname" ] ; then
-
-		sign_line="sign-images = "
-		sep=""
-
-		if [ -n "$kernel_id" ]; then
-			sign_line="$sign_line${sep}\"kernel\""
-			sep=", "
-		fi
-
-		if [ -n "$dtb_image" ]; then
-			sign_line="$sign_line${sep}\"fdt\""
-			sep=", "
-		fi
-
-		if [ -n "$ramdisk_id" ]; then
-			sign_line="$sign_line${sep}\"ramdisk\""
-			sep=", "
-		fi
-
-		if [ -n "$bootscr_id" ]; then
-			sign_line="$sign_line${sep}\"bootscr\""
-			sep=", "
-		fi
-
-		if [ -n "$config_id" ]; then
-			sign_line="$sign_line${sep}\"setup\""
-		fi
-
-		sign_line="$sign_line;"
-
-		cat << EOF >> $its_file
-                        signature-1 {
-                                algo = "$conf_csum,$conf_sign_algo";
-                                key-name-hint = "$conf_sign_keyname";
-                                padding = "$conf_padding_algo";
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
-	kernelcount=1
-	dtbcount=""
-	DTBS=""
-	ramdiskcount=$3
-	setupcount=""
-	bootscr_id=""
-	default_dtb_image=""
-	rm -f $1 arch/${ARCH}/boot/$2
-
-	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
-		bbfatal "Keys used to sign images and configuration nodes must be different."
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
-		dtbcount=1
-		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo $DTB | grep -q '/dts/'; then
-				bbwarn "$DTB contains the full path to the the dts file, but only the dtb name should be used."
-				DTB=`basename $DTB | sed 's,\.dts$,.dtb,g'`
-			fi
-
-			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
-			if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ] && [ -s ${EXTERNAL_KERNEL_DEVICETREE}/${DTB} ]; then
-				continue
-			fi
-
-			DTB_PATH="${KERNEL_OUTPUT_DIR}/dts/$DTB"
-			if [ ! -e "$DTB_PATH" ]; then
-				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
-			fi
-
-			# Strip off the path component from the filename
-			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
-				DTB=`basename $DTB`
-			fi
-
-			# Set the default dtb image if it exists in the devicetree.
-			if [ "${FIT_CONF_DEFAULT_DTB}" = "$DTB" ];then
-				default_dtb_image=$(echo "$DTB" | tr '/' '_')
-			fi
-
-			DTB=$(echo "$DTB" | tr '/' '_')
-
-			# Skip DTB if we've picked it up previously
-			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
-
-			DTBS="$DTBS $DTB"
-			DTB=$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
-		done
-	fi
-
-	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
-		dtbcount=1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
-		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
-			# Set the default dtb image if it exists in the devicetree.
-			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
-				default_dtb_image=$(echo "$DTB" | tr '/' '_')
-			fi
-
-			DTB=$(echo "$DTB" | tr '/' '_')
-
-			# Skip DTB/DTBO if we've picked it up previously
-			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
-
-			DTBS="$DTBS $DTB"
-
-			# Also skip if a symlink. We'll later have each config section point at it
-			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && continue
-
-			DTB=$(echo $DTB | tr '/' '_')
-			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
-		done
-	fi
-
-	if [ -n "${FIT_CONF_DEFAULT_DTB}" ] && [ -z $default_dtb_image ]; then 
-		bbwarn "${FIT_CONF_DEFAULT_DTB} is not available in the list of device trees."
-	fi
-
-	#
-	# Step 3: Prepare a u-boot script section
-	#
-
-	if [ -n "${FIT_UBOOT_ENV}" ]; then
-		cp ${UNPACKDIR}/${FIT_UBOOT_ENV} ${B}
-		bootscr_id="${FIT_UBOOT_ENV}"
-		fitimage_emit_section_boot_script $1 "$bootscr_id" ${FIT_UBOOT_ENV}
-	fi
-
-	#
-	# Step 4: Prepare a setup section. (For x86)
-	#
-	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
-		setupcount=1
-		fitimage_emit_section_setup $1 $setupcount ${KERNEL_OUTPUT_DIR}/setup.bin
-	fi
-
-	#
-	# Step 5: Prepare a ramdisk section.
-	#
-	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-		# Find and use the first initramfs image archive type we find
-		found=
-		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
-			initramfs_path="${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
-			if [ -e "$initramfs_path" ]; then
-				bbnote "Found initramfs image: $initramfs_path"
-				found=true
-				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
-				break
-			else
-				bbnote "Did not find initramfs image: $initramfs_path"
-			fi
-		done
-
-		if [ -z "$found" ]; then
-			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
-		fi
-	fi
-
-	fitimage_emit_section_maint $1 sectend
-
-	# Force the first Kernel and DTB in the default config
-	kernelcount=1
-	if [ -n "$dtbcount" ]; then
-		dtbcount=1
-	fi
-
-	#
-	# Step 6: Prepare a configurations section
-	#
-	fitimage_emit_section_maint $1 confstart
-
-	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
-	# more) to be added to the FIT image along with 0 or more device trees and
-	# 0 or 1 ramdisk.
-	# It is also possible to include an initramfs bundle (kernel and rootfs in one binary)
-	# When the initramfs bundle is used ramdisk is disabled.
-	# If a device tree is to be part of the FIT image, then select
-	# the default configuration to be used is based on the dtbcount. If there is
-	# no dtb present than select the default configuation to be based on
-	# the kernelcount.
-	if [ -n "$DTBS" ]; then
-		i=1
-		for DTB in ${DTBS}; do
-			dtb_ext=${DTB##*.}
-			if [ "$dtb_ext" = "dtbo" ]; then
-				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`" "$default_dtb_image"
-			else
-				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`" "$default_dtb_image"
-			fi
-			i=`expr $i + 1`
-		done
-	else
-		defaultconfigcount=1
-		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount "$default_dtb_image"
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
-		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-		-f $1 \
-		${KERNEL_OUTPUT_DIR}/$2
-
-	#
-	# Step 8: Sign the image
-	#
-	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
-		${UBOOT_MKIMAGE_SIGN} \
-			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			-r ${KERNEL_OUTPUT_DIR}/$2 \
-			${UBOOT_MKIMAGE_SIGN_ARGS}
-	fi
-}
-
-do_assemble_fitimage() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		cd ${B}
-		fitimage_assemble fit-image.its fitImage-none ""
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
-			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
-		fi
-	fi
+def fitimage_assemble(d, itsfile, fitname, ramdiskcount):
+    import shutil
+    import glob
+    import oe.fitimage
+
+    DTBS=""
+    default_dtb_image=""
+
+    for f in [itsfile, os.path.join("arch", d.getVar("ARCH"), "boot", fitname)]:
+        if os.path.exists(f):
+            os.remove(f)
+
+    root_node = oe.fitimage.ItsNodeRootKernel(
+        d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
+        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),  d.getVar("FIT_CONF_PREFIX"),
+        d.getVar('UBOOT_SIGN_ENABLE') == "1", d.getVar("UBOOT_SIGN_KEYDIR"),
+        d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
+        d.getVar("UBOOT_MKIMAGE_SIGN"), d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
+        d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'), d.getVar('FIT_PAD_ALG'),
+        d.getVar('UBOOT_SIGN_KEYNAME'),
+        d.getVar('FIT_SIGN_INDIVIDUAL') == "1", d.getVar('UBOOT_SIGN_IMG_KEYNAME')
+    )
+
+    #
+    # Step 1: Prepare a kernel image section.
+    #
+    linux_comp = uboot_prep_kimage_py(d)
+    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
+        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
+        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
+
+    #
+    # Step 2: Prepare a DTB image section
+    #
+    if d.getVar("KERNEL_DEVICETREE"):
+        for DTB in d.getVar("KERNEL_DEVICETREE").split():
+            if "/dts/" in DTB:
+                bb.warn(f"{DTB} contains the full path to the dts file, but only the dtb name should be used.")
+                DTB = os.path.basename(DTB).replace(".dts", ".dtb")
+
+            # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE
+            if d.getVar("EXTERNAL_KERNEL_DEVICETREE"):
+                ext_dtb_path = os.path.join(d.getVar("EXTERNAL_KERNEL_DEVICETREE"), DTB)
+                if os.path.exists(ext_dtb_path) and os.path.getsize(ext_dtb_path) > 0:
+                    continue
+
+            DTB_PATH = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), "dts", DTB)
+            if not os.path.exists(DTB_PATH):
+                DTB_PATH = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), DTB)
+
+            # Strip off the path component from the filename
+            if not oe.types.boolean(d.getVar("KERNEL_DTBVENDORED")):
+                DTB = os.path.basename(DTB)
+
+            # Set the default dtb image if it exists in the devicetree.
+            if d.getVar("FIT_CONF_DEFAULT_DTB") == DTB:
+                default_dtb_image = DTB.replace("/", "_")
+
+            DTB = DTB.replace("/", "_")
+
+            # Skip DTB if we've picked it up previously
+            if DTB in DTBS.split():
+                continue
+
+            DTBS += " " + DTB
+
+            root_node.fitimage_emit_section_dtb(DTB, DTB_PATH,
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+
+    if d.getVar("EXTERNAL_KERNEL_DEVICETREE"):
+        dtb_files = []
+        for ext in ['*.dtb', '*.dtbo']:
+            dtb_files.extend(sorted(glob.glob(os.path.join(d.getVar("EXTERNAL_KERNEL_DEVICETREE"), ext))))
+
+        for dtb_path in dtb_files:
+            dtb_name = os.path.relpath(dtb_path, d.getVar("EXTERNAL_KERNEL_DEVICETREE"))
+            dtb_name_underscore = dtb_name.replace('/', '_')
+
+            # Set the default dtb image if it exists in the devicetree.
+            if d.getVar("FIT_CONF_DEFAULT_DTB") == dtb_name:
+                default_dtb_image = dtb_name_underscore
+
+            # Skip DTB/DTBO if we've picked it up previously
+            if dtb_name_underscore in DTBS.split():
+                continue
+
+            DTBS += " " + dtb_name_underscore
+
+            # Also skip if a symlink. We'll later have each config section point at it
+            if oe.fitimage.symlink_points_below(dtb_name, d.getVar("EXTERNAL_KERNEL_DEVICETREE")):
+                continue
+
+            root_node.fitimage_emit_section_dtb(dtb_name_underscore, dtb_path,
+                d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
+
+    if d.getVar("FIT_CONF_DEFAULT_DTB") and not default_dtb_image:
+        bb.warn("%s is not available in the list of device trees." % d.getVar('FIT_CONF_DEFAULT_DTB'))
+
+    #
+    # Step 3: Prepare a u-boot script section
+    #
+    fit_uboot_env = d.getVar("FIT_UBOOT_ENV")
+    if fit_uboot_env:
+        unpack_dir = d.getVar("UNPACKDIR")
+        shutil.copy(os.path.join(unpack_dir, fit_uboot_env), fit_uboot_env)
+        root_node.fitimage_emit_section_boot_script("bootscr-"+fit_uboot_env , fit_uboot_env)
+
+    #
+    # Step 4: Prepare a setup section. (For x86)
+    #
+    setup_bin_path = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), "setup.bin")
+    if os.path.exists(setup_bin_path):
+        root_node.fitimage_emit_section_setup("setup-1", setup_bin_path)
+
+    #
+    # Step 5: Prepare a ramdisk section.
+    #
+    if ramdiskcount == 1 and d.getVar("INITRAMFS_IMAGE_BUNDLE") != "1":
+        # Find and use the first initramfs image archive type we find
+        found = False
+        for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
+            initramfs_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), "%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
+            if os.path.exists(initramfs_path):
+                bb.note("Found initramfs image: " + initramfs_path)
+                found = True
+                root_node.fitimage_emit_section_ramdisk("ramdisk-%d" % ramdiskcount, initramfs_path,
+                    d.getVar('INITRAMFS_IMAGE'),
+                    d.getVar("UBOOT_RD_LOADADDRESS"),
+                    d.getVar("UBOOT_RD_ENTRYPOINT"))
+                break
+            else:
+                bb.note("Did not find initramfs image: " + initramfs_path)
+
+        if not found:
+            bb.fatal("Could not find a valid initramfs type for %s, the supported types are: %s" % (d.getVar('INITRAMFS_IMAGE_NAME'), d.getVar('FIT_SUPPORTED_INITRAMFS_FSTYPES')))
+
+    # Generate the configuration section
+    root_node.fitimage_emit_section_config()
+
+    #
+    # Write the ITS file
+    root_node.write_its_file(itsfile)
+
+    #
+    # Step 7: Assemble the image
+    #
+    fitfile = os.path.join(d.getVar("KERNEL_OUTPUT_DIR"), fitname)
+    root_node.run_mkimage_assemble(itsfile, fitfile)
+
+    #
+    # Step 8: Sign the image if required
+    #
+    root_node.run_mkimage_sign(fitfile)
+
+
+python do_assemble_fitimage() {
+    if "fitImage" in d.getVar("KERNEL_IMAGETYPES").split():
+        os.chdir(d.getVar("B"))
+        fitimage_assemble(d, "fit-image.its", "fitImage-none", "")
+        if d.getVar("INITRAMFS_IMAGE_BUNDLE") != "1":
+            link_name = os.path.join(d.getVar("B"), d.getVar("KERNEL_OUTPUT_DIR"), "fitImage")
+            if os.path.islink(link_name):
+                os.unlink(link_name)
+            os.symlink("fitImage-none", link_name)
 }
 
 addtask assemble_fitimage before do_install after do_compile
@@ -738,64 +228,46 @@ do_install:append() {
 	fi
 }
 
-do_assemble_fitimage_initramfs() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		test -n "${INITRAMFS_IMAGE}" ; then
-		cd ${B}
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-bundle ""
-			ln -sf fitImage-bundle ${B}/${KERNEL_OUTPUT_DIR}/fitImage
-		else
-			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
-		fi
-	fi
+python do_assemble_fitimage_initramfs() {
+    if "fitImage" in d.getVar("KERNEL_IMAGETYPES").split() and d.getVar("INITRAMFS_IMAGE"):
+        os.chdir(d.getVar("B"))
+        if d.getVar("INITRAMFS_IMAGE_BUNDLE") == "1":
+            fitimage_assemble(d, "fit-image-%s.its" % d.getVar("INITRAMFS_IMAGE"), "fitImage-bundle", "")
+            link_name =  os.path.join(d.getVar("B"), d.getVar("KERNEL_OUTPUT_DIR"), "fitImage")
+            if os.path.islink(link_name):
+                os.unlink(link_name)
+            os.symlink("fitImage-bundle", link_name)
+        else:
+            fitimage_assemble(d, "fit-image-%s.its" % d.getVar("INITRAMFS_IMAGE"), "fitImage-%s" % d.getVar("INITRAMFS_IMAGE"), 1)
 }
 
 addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
 
-do_kernel_generate_rsa_keys() {
-	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
-		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
-	fi
+python do_kernel_generate_rsa_keys() {
+    import oe.fitimage
 
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
+    sign_enable = oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE'))
+    fit_generate_keys = oe.types.boolean(d.getVar('FIT_GENERATE_KEYS'))
+    if not sign_enable and fit_generate_keys:
+        bb.warn("FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used.")
+    if sign_enable and fit_generate_keys:
+        sign_keydir = d.getVar('UBOOT_SIGN_KEYDIR')
+        sign_keyname = d.getVar('UBOOT_SIGN_KEYNAME')
+        sign_kc_path = os.path.join(sign_keydir, sign_keyname)
+        if not os.path.exists(sign_kc_path + '.key') or not os.path.exists(sign_kc_path + '.crt'):
+            bb.note("Generating RSA private key and certificate for signing fitImage configurations")
+            oe.fitimage.generate_rsa_key(sign_keydir, sign_keyname,
+                d.getVar('FIT_SIGN_NUMBITS'), d.getVar('FIT_KEY_GENRSA_ARGS'),
+                d.getVar('FIT_KEY_REQ_ARGS'), d.getVar('FIT_KEY_SIGN_PKCS'))
 
-		# Generate keys to sign configuration nodes, only if they don't already exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt ]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			bbnote "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-			"${FIT_SIGN_NUMBITS}"
-
-			bbnote "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt
-		fi
-
-		# Generate keys to sign image nodes, only if they don't already exist
-		if [ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key ] || \
-			[ ! -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt ]; then
-
-			# make directory if it does not already exist
-			mkdir -p "${UBOOT_SIGN_KEYDIR}"
-
-			bbnote "Generating RSA private key for signing fitImage"
-			openssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
-				"${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
-			"${FIT_SIGN_NUMBITS}"
-
-			bbnote "Generating certificate for signing fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
-				-key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".key \
-				-out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_IMG_KEYNAME}".crt
-		fi
-	fi
+        if oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')):
+            sign_img_keyname = d.getVar('UBOOT_SIGN_IMG_KEYNAME')
+            sign_img_kc_path = os.path.join(sign_keydir, sign_img_keyname)
+            if not os.path.exists(sign_img_kc_path + '.key') or not os.path.exists(sign_img_kc_path + '.crt'):
+                bb.note("Generating RSA private key and certificate for signing fitImage individual images")
+                oe.fitimage.generate_rsa_key(sign_keydir, sign_img_keyname,
+                    d.getVar('FIT_SIGN_NUMBITS'), d.getVar('FIT_KEY_GENRSA_ARGS'),
+                    d.getVar('FIT_KEY_REQ_ARGS'), d.getVar('FIT_KEY_SIGN_PKCS'))
 }
 
 addtask kernel_generate_rsa_keys before do_assemble_fitimage after do_compile
diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index 7aafd4757c2..888664678d1 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -67,3 +67,48 @@ do_install:append() {
 		install -D ${B}/${KERNEL_OUTPUT_DIR}/setup.bin ${D}/sysroot-only/setup.bin
 	fi
 }
+
+def uboot_prep_kimage_py(d):
+    import subprocess
+
+    arch = d.getVar('ARCH')
+    initramfs_image_bundle = d.getVar('INITRAMFS_IMAGE_BUNDLE')
+    fit_kernel_comp_alg = d.getVar('FIT_KERNEL_COMP_ALG') or 'gzip'
+    fit_kernel_comp_alg_extension = d.getVar('FIT_KERNEL_COMP_ALG_EXTENSION') or '.gz'
+    kernel_objcopy = d.getVar('KERNEL_OBJCOPY')
+
+    vmlinux_path = ""
+    linux_suffix = ""
+    linux_comp = "none"
+
+    if os.path.exists(f'arch/{arch}/boot/compressed/vmlinux'):
+        vmlinux_path = f'arch/{arch}/boot/compressed/vmlinux'
+    elif os.path.exists(f'arch/{arch}/boot/vmlinuz.bin'):
+        if os.path.exists('linux.bin'):
+            os.remove('linux.bin')
+        os.link(f'arch/{arch}/boot/vmlinuz.bin', 'linux.bin')
+    else:
+        vmlinux_path = 'vmlinux'
+        # Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
+        # As per the implementation in kernel.bbclass.
+        # See do_bundle_initramfs function
+        if initramfs_image_bundle == '1' and os.path.exists('vmlinux.initramfs'):
+            vmlinux_path = 'vmlinux.initramfs'
+        linux_suffix = fit_kernel_comp_alg_extension
+        linux_comp = fit_kernel_comp_alg
+
+    if vmlinux_path:
+        subprocess.run([kernel_objcopy.strip(), '-O', 'binary', '-R', '.note', '-R', '.comment', '-S', os.path.abspath(vmlinux_path), 'linux.bin'], check=True)
+        # if ret.returncode != 0:
+        # bb.fatal(f"Error: stderr: {ret.stderr.decode('utf-8')}   stdout: {ret.stdout.decode('utf-8')}, vmlinux_path: {os.path.abspath(vmlinux_path)}, pwd: {os.getcwd()}, args: {ret.args}")
+
+    if linux_comp != "none":
+        if linux_comp == "gzip":
+            subprocess.run(['gzip', '-9', 'linux.bin'], check=True)
+        elif linux_comp == "lzo":
+            subprocess.run(['lzop', '-9', 'linux.bin'], check=True)
+        elif linux_comp == "lzma":
+            subprocess.run(['xz', '--format=lzma', '-f', '-6', 'linux.bin'], check=True)
+        os.rename(f'linux.bin{linux_suffix}', 'linux.bin')
+
+    return linux_comp
-- 
2.49.0


