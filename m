Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067D4C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:07:15 +0000 (UTC)
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web12.7154.1634126833224502432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 19DC76BE001099
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Oct 2021 14:07:06 +0200
Received: from md3hr6tc.ad001.com ([139.22.46.143])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 19DC76L4002229;
	Wed, 13 Oct 2021 14:07:06 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Abdellatif.ElKhlifi@arm.com, alexandre.belloni@bootlin.com,
        Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v3 1/2] featimage: refactor style
Date: Wed, 13 Oct 2021 14:06:38 +0200
Message-Id: <20211013120639.58668-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005202256.54023-1-andrej.valek@siemens.com>
References: <20211005202256.54023-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 12:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156901

- use bash variable notation without {} where possible
  - just to make sure it looks like bash variable not bitbake variable one
- fix indent style in "cat" commands
- replace "! -z" -> "-n"
- make debug info in ramdisk section creation more verbose

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/kernel-fitimage.bbclass | 297 ++++++++++++++-------------
 meta/classes/uboot-sign.bbclass      |  56 ++---
 2 files changed, 178 insertions(+), 175 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 38e05153e3..886ed13029 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -73,7 +73,7 @@ FIT_SIGN_INDIVIDUAL ?= "0"
 #
 # $1 ... .its filename
 fitimage_emit_fit_header() {
-	cat << EOF >> ${1}
+	cat << EOF >> $1
 /dts-v1/;
 
 / {
@@ -94,24 +94,24 @@ EOF
 fitimage_emit_section_maint() {
 	case $2 in
 	imagestart)
-		cat << EOF >> ${1}
+		cat << EOF >> $1
 
         images {
 EOF
 	;;
 	confstart)
-		cat << EOF >> ${1}
+		cat << EOF >> $1
 
         configurations {
 EOF
 	;;
 	sectend)
-		cat << EOF >> ${1}
+		cat << EOF >> $1
 	};
 EOF
 	;;
 	fitend)
-		cat << EOF >> ${1}
+		cat << EOF >> $1
 };
 EOF
 	;;
@@ -137,28 +137,28 @@ fitimage_emit_section_kernel() {
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	cat << EOF >> ${1}
-                kernel-${2} {
+	cat << EOF >> $1
+                kernel-$2 {
                         description = "Linux kernel";
-                        data = /incbin/("${3}");
+                        data = /incbin/("$3");
                         type = "kernel";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "${4}";
+                        compression = "$4";
                         load = <${UBOOT_LOADADDRESS}>;
-                        entry = <${ENTRYPOINT}>;
+                        entry = <$ENTRYPOINT>;
                         hash-1 {
-                                algo = "${kernel_csum}";
+                                algo = "$kernel_csum";
                         };
                 };
 EOF
 
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${kernel_sign_keyname}" ] ; then
-		sed -i '$ d' ${1}
-		cat << EOF >> ${1}
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$kernel_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
                         signature-1 {
-                                algo = "${kernel_csum},${kernel_sign_algo}";
-                                key-name-hint = "${kernel_sign_keyname}";
+                                algo = "$kernel_csum,$kernel_sign_algo";
+                                key-name-hint = "$kernel_sign_keyname";
                         };
                 };
 EOF
@@ -186,26 +186,26 @@ fitimage_emit_section_dtb() {
 	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
 		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
 	fi
-	cat << EOF >> ${1}
-                fdt-${2} {
+	cat << EOF >> $1
+                fdt-$2 {
                         description = "Flattened Device Tree blob";
-                        data = /incbin/("${3}");
+                        data = /incbin/("$3");
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
-                        ${dtb_loadline}
+                        $dtb_loadline
                         hash-1 {
-                                algo = "${dtb_csum}";
+                                algo = "$dtb_csum";
                         };
                 };
 EOF
 
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${dtb_sign_keyname}" ] ; then
-		sed -i '$ d' ${1}
-		cat << EOF >> ${1}
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$dtb_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
                         signature-1 {
-                                algo = "${dtb_csum},${dtb_sign_algo}";
-                                key-name-hint = "${dtb_sign_keyname}";
+                                algo = "$dtb_csum,$dtb_sign_algo";
+                                key-name-hint = "$dtb_sign_keyname";
                         };
                 };
 EOF
@@ -220,29 +220,29 @@ EOF
 # $3 ... Path to boot script image
 fitimage_emit_section_boot_script() {
 
-        bootscr_csum="${FIT_HASH_ALG}"
+	bootscr_csum="${FIT_HASH_ALG}"
 	bootscr_sign_algo="${FIT_SIGN_ALG}"
 	bootscr_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
 
-        cat << EOF >> ${1}
-                bootscr-${2} {
+        cat << EOF >> $1
+                bootscr-$2 {
                         description = "U-boot script";
-                        data = /incbin/("${3}");
+                        data = /incbin/("$3");
                         type = "script";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
                         hash-1 {
-                                algo = "${bootscr_csum}";
+                                algo = "$bootscr_csum";
                         };
                 };
 EOF
 
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${bootscr_sign_keyname}" ] ; then
-		sed -i '$ d' ${1}
-		cat << EOF >> ${1}
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$bootscr_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
                         signature-1 {
-                                algo = "${bootscr_csum},${bootscr_sign_algo}";
-                                key-name-hint = "${bootscr_sign_keyname}";
+                                algo = "$bootscr_csum,$bootscr_sign_algo";
+                                key-name-hint = "$bootscr_sign_keyname";
                         };
                 };
 EOF
@@ -259,10 +259,10 @@ fitimage_emit_section_setup() {
 
 	setup_csum="${FIT_HASH_ALG}"
 
-	cat << EOF >> ${1}
-                setup-${2} {
+	cat << EOF >> $1
+                setup-$2 {
                         description = "Linux setup.bin";
-                        data = /incbin/("${3}");
+                        data = /incbin/("$3");
                         type = "x86_setup";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
@@ -270,7 +270,7 @@ fitimage_emit_section_setup() {
                         load = <0x00090000>;
                         entry = <0x00090000>;
                         hash-1 {
-                                algo = "${setup_csum}";
+                                algo = "$setup_csum";
                         };
                 };
 EOF
@@ -297,28 +297,28 @@ fitimage_emit_section_ramdisk() {
 		ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
 	fi
 
-	cat << EOF >> ${1}
-                ramdisk-${2} {
+	cat << EOF >> $1
+                ramdisk-$2 {
                         description = "${INITRAMFS_IMAGE}";
-                        data = /incbin/("${3}");
+                        data = /incbin/("$3");
                         type = "ramdisk";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
                         compression = "none";
-                        ${ramdisk_loadline}
-                        ${ramdisk_entryline}
+                        $ramdisk_loadline
+                        $ramdisk_entryline
                         hash-1 {
-                                algo = "${ramdisk_csum}";
+                                algo = "$ramdisk_csum";
                         };
                 };
 EOF
 
-	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${ramdisk_sign_keyname}" ] ; then
-		sed -i '$ d' ${1}
-		cat << EOF >> ${1}
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$ramdisk_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
                         signature-1 {
-                                algo = "${ramdisk_csum},${ramdisk_sign_algo}";
-                                key-name-hint = "${ramdisk_sign_keyname}";
+                                algo = "$ramdisk_csum,$ramdisk_sign_algo";
+                                key-name-hint = "$ramdisk_sign_keyname";
                         };
                 };
 EOF
@@ -343,13 +343,13 @@ fitimage_emit_section_config() {
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
 
-	its_file="${1}"
-	kernel_id="${2}"
-	dtb_image="${3}"
-	ramdisk_id="${4}"
-	bootscr_id="${5}"
-	config_id="${6}"
-	default_flag="${7}"
+	its_file="$1"
+	kernel_id="$2"
+	dtb_image="$3"
+	ramdisk_id="$4"
+	bootscr_id="$5"
+	config_id="$6"
+	default_flag="$7"
 
 	# Test if we have any DTBs at all
 	sep=""
@@ -364,106 +364,106 @@ fitimage_emit_section_config() {
 
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
-	if [ -n "${dtb_image}" ]; then
-		conf_node=$conf_node${dtb_image}
+	if [ -n "$dtb_image" ]; then
+		conf_node=$conf_node$dtb_image
 	else
-		conf_node=$conf_node${kernel_id}
+		conf_node=$conf_node$kernel_id
 	fi
 
-	if [ -n "${kernel_id}" ]; then
+	if [ -n "$kernel_id" ]; then
 		conf_desc="Linux kernel"
 		sep=", "
-		kernel_line="kernel = \"kernel-${kernel_id}\";"
+		kernel_line="kernel = \"kernel-$kernel_id\";"
 	fi
 
-	if [ -n "${dtb_image}" ]; then
-		conf_desc="${conf_desc}${sep}FDT blob"
+	if [ -n "$dtb_image" ]; then
+		conf_desc="$conf_desc${sep}FDT blob"
 		sep=", "
-		fdt_line="fdt = \"fdt-${dtb_image}\";"
+		fdt_line="fdt = \"fdt-$dtb_image\";"
 	fi
 
-	if [ -n "${ramdisk_id}" ]; then
-		conf_desc="${conf_desc}${sep}ramdisk"
+	if [ -n "$ramdisk_id" ]; then
+		conf_desc="$conf_desc${sep}ramdisk"
 		sep=", "
-		ramdisk_line="ramdisk = \"ramdisk-${ramdisk_id}\";"
+		ramdisk_line="ramdisk = \"ramdisk-$ramdisk_id\";"
 	fi
 
-	if [ -n "${bootscr_id}" ]; then
-		conf_desc="${conf_desc}${sep}u-boot script"
+	if [ -n "$bootscr_id" ]; then
+		conf_desc="$conf_desc${sep}u-boot script"
 		sep=", "
-		bootscr_line="bootscr = \"bootscr-${bootscr_id}\";"
+		bootscr_line="bootscr = \"bootscr-$bootscr_id\";"
 	fi
 
-	if [ -n "${config_id}" ]; then
-		conf_desc="${conf_desc}${sep}setup"
-		setup_line="setup = \"setup-${config_id}\";"
+	if [ -n "$config_id" ]; then
+		conf_desc="$conf_desc${sep}setup"
+		setup_line="setup = \"setup-$config_id\";"
 	fi
 
-	if [ "${default_flag}" = "1" ]; then
+	if [ "$default_flag" = "1" ]; then
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
-		if [ -n "${dtb_image}" ]; then
-			default_line="default = \"conf-${dtb_image}\";"
+		if [ -n "$dtb_image" ]; then
+			default_line="default = \"conf-$dtb_image\";"
 		else
-			default_line="default = \"conf-${kernel_id}\";"
+			default_line="default = \"conf-$kernel_id\";"
 		fi
 	fi
 
-	cat << EOF >> ${its_file}
-                ${default_line}
+	cat << EOF >> $its_file
+                $default_line
                 $conf_node {
-			description = "${default_flag} ${conf_desc}";
-			${kernel_line}
-			${fdt_line}
-			${ramdisk_line}
-			${bootscr_line}
-			${setup_line}
+                        description = "$default_flag $conf_desc";
+                        $kernel_line
+                        $fdt_line
+                        $ramdisk_line
+                        $bootscr_line
+                        $setup_line
                         hash-1 {
-                                algo = "${conf_csum}";
+                                algo = "$conf_csum";
                         };
 EOF
 
-	if [ ! -z "${conf_sign_keyname}" ] ; then
+	if [ -n "$conf_sign_keyname" ] ; then
 
 		sign_line="sign-images = "
 		sep=""
 
-		if [ -n "${kernel_id}" ]; then
-			sign_line="${sign_line}${sep}\"kernel\""
+		if [ -n "$kernel_id" ]; then
+			sign_line="$sign_line${sep}\"kernel\""
 			sep=", "
 		fi
 
-		if [ -n "${dtb_image}" ]; then
-			sign_line="${sign_line}${sep}\"fdt\""
+		if [ -n "$dtb_image" ]; then
+			sign_line="$sign_line${sep}\"fdt\""
 			sep=", "
 		fi
 
-		if [ -n "${ramdisk_id}" ]; then
-			sign_line="${sign_line}${sep}\"ramdisk\""
+		if [ -n "$ramdisk_id" ]; then
+			sign_line="$sign_line${sep}\"ramdisk\""
 			sep=", "
 		fi
 
-		if [ -n "${bootscr_id}" ]; then
-			sign_line="${sign_line}${sep}\"bootscr\""
+		if [ -n "$bootscr_id" ]; then
+			sign_line="$sign_line${sep}\"bootscr\""
 			sep=", "
 		fi
 
-		if [ -n "${config_id}" ]; then
-			sign_line="${sign_line}${sep}\"setup\""
+		if [ -n "$config_id" ]; then
+			sign_line="$sign_line${sep}\"setup\""
 		fi
 
-		sign_line="${sign_line};"
+		sign_line="$sign_line;"
 
-		cat << EOF >> ${its_file}
+		cat << EOF >> $its_file
                         signature-1 {
-                                algo = "${conf_csum},${conf_sign_algo}";
-                                key-name-hint = "${conf_sign_keyname}";
-				${sign_line}
+                                algo = "$conf_csum,$conf_sign_algo";
+                                key-name-hint = "$conf_sign_keyname";
+                                $sign_line
                         };
 EOF
 	fi
 
-	cat << EOF >> ${its_file}
+	cat << EOF >> $its_file
                 };
 EOF
 }
@@ -478,38 +478,38 @@ fitimage_assemble() {
 	kernelcount=1
 	dtbcount=""
 	DTBS=""
-	ramdiskcount=${3}
+	ramdiskcount=$3
 	setupcount=""
 	bootscr_id=""
-	rm -f ${1} arch/${ARCH}/boot/${2}
+	rm -f $1 arch/${ARCH}/boot/$2
 
-	if [ ! -z "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
+	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
 		bbfatal "Keys used to sign images and configuration nodes must be different."
 	fi
 
-	fitimage_emit_fit_header ${1}
+	fitimage_emit_fit_header $1
 
 	#
 	# Step 1: Prepare a kernel image section.
 	#
-	fitimage_emit_section_maint ${1} imagestart
+	fitimage_emit_section_maint $1 imagestart
 
 	uboot_prep_kimage
 
 	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
 		initramfs_bundle_path="arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE_REPLACEMENT}".initramfs"
-		if [ -e "${initramfs_bundle_path}" ]; then
+		if [ -e "$initramfs_bundle_path" ]; then
 
 			#
 			# Include the kernel/rootfs bundle.
 			#
 
-			fitimage_emit_section_kernel ${1} "${kernelcount}" "${initramfs_bundle_path}" "${linux_comp}"
+			fitimage_emit_section_kernel $1 $kernelcount "$initramfs_bundle_path" "$linux_comp"
 		else
-			bbwarn "${initramfs_bundle_path} not found."
+			bbwarn "$initramfs_bundle_pat not found."
 		fi
 	else
-		fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
+		fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
 	fi
 
 	#
@@ -519,9 +519,9 @@ fitimage_assemble() {
 	if [ -n "${KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
 		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q '/dts/'; then
-				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+			if echo $DTB | grep -q '/dts/'; then
+				bbwarn "$DTB contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename $DTB | sed 's,\.dts$,.dtb,g'`
 			fi
 
 			# Skip ${DTB} if it's also provided in ${EXTERNAL_KERNEL_DEVICETREE}
@@ -529,23 +529,23 @@ fitimage_assemble() {
 				continue
 			fi
 
-			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
-			if [ ! -e "${DTB_PATH}" ]; then
-				DTB_PATH="arch/${ARCH}/boot/${DTB}"
+			DTB_PATH="arch/${ARCH}/boot/dts/$DTB"
+			if [ ! -e "$DTB_PATH" ]; then
+				DTB_PATH="arch/${ARCH}/boot/$DTB"
 			fi
 
-			DTB=$(echo "${DTB}" | tr '/' '_')
-			DTBS="${DTBS} ${DTB}"
-			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
+			DTB=$(echo "$DTB" | tr '/' '_')
+			DTBS="$DTBS $DTB"
+			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
 		done
 	fi
 
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
-			DTB=$(echo "${DTB}" | tr '/' '_')
-			DTBS="${DTBS} ${DTB}"
-			fitimage_emit_section_dtb ${1} ${DTB} "${EXTERNAL_KERNEL_DEVICETREE}/${DTB}"
+			DTB=$(echo "$DTB" | tr '/' '_')
+			DTBS="$DTBS $DTB"
+			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
 	fi
 
@@ -557,7 +557,7 @@ fitimage_assemble() {
 		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
 			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
 			bootscr_id="${UBOOT_ENV_BINARY}"
-			fitimage_emit_section_boot_script ${1} "${bootscr_id}" ${UBOOT_ENV_BINARY}
+			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY}
 		else
 			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
 		fi
@@ -568,7 +568,7 @@ fitimage_assemble() {
 	#
 	if [ -e arch/${ARCH}/boot/setup.bin ]; then
 		setupcount=1
-		fitimage_emit_section_setup ${1} "${setupcount}" arch/${ARCH}/boot/setup.bin
+		fitimage_emit_section_setup $1 $setupcount arch/${ARCH}/boot/setup.bin
 	fi
 
 	#
@@ -577,27 +577,30 @@ fitimage_assemble() {
 	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio; do
-			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
-			echo "Using $initramfs_path"
-			if [ -e "${initramfs_path}" ]; then
-				fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" "${initramfs_path}"
+			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
+			echo -n "Searching for $initramfs_path..."
+			if [ -e "$initramfs_path" ]; then
+				echo "found"
+				fitimage_emit_section_ramdisk $1 "$ramdiskcount" "$initramfs_path"
 				break
+			else
+				echo "not found"
 			fi
 		done
 	fi
 
-	fitimage_emit_section_maint ${1} sectend
+	fitimage_emit_section_maint $1 sectend
 
 	# Force the first Kernel and DTB in the default config
 	kernelcount=1
-	if [ -n "${dtbcount}" ]; then
+	if [ -n "$dtbcount" ]; then
 		dtbcount=1
 	fi
 
 	#
 	# Step 6: Prepare a configurations section
 	#
-	fitimage_emit_section_maint ${1} confstart
+	fitimage_emit_section_maint $1 confstart
 
 	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
 	# more) to be added to the FIT image along with 0 or more device trees and
@@ -608,33 +611,33 @@ fitimage_assemble() {
 	# the default configuration to be used is based on the dtbcount. If there is
 	# no dtb present than select the default configuation to be based on
 	# the kernelcount.
-	if [ -n "${DTBS}" ]; then
+	if [ -n "$DTBS" ]; then
 		i=1
 		for DTB in ${DTBS}; do
 			dtb_ext=${DTB##*.}
-			if [ "${dtb_ext}" = "dtbo" ]; then
-				fitimage_emit_section_config ${1} "" "${DTB}" "" "${bootscr_id}" "" "`expr ${i} = ${dtbcount}`"
+			if [ "$dtb_ext" = "dtbo" ]; then
+				fitimage_emit_section_config $1 "" "$DTB" "" "$bootscr_id" "" "`expr $i = $dtbcount`"
 			else
-				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
+				fitimage_emit_section_config $1 $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i = $dtbcount`"
 			fi
-			i=`expr ${i} + 1`
+			i=`expr $i + 1`
 		done
 	else
 		defaultconfigcount=1
-		fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${bootscr_id}"  "${setupcount}" "${defaultconfigcount}"
+		fitimage_emit_section_config $1 $kernelcount "" "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount
 	fi
 
-	fitimage_emit_section_maint ${1} sectend
+	fitimage_emit_section_maint $1 sectend
 
-	fitimage_emit_section_maint ${1} fitend
+	fitimage_emit_section_maint $1 fitend
 
 	#
 	# Step 7: Assemble the image
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-		-f ${1} \
-		arch/${ARCH}/boot/${2}
+		-f $1 \
+		arch/${ARCH}/boot/$2
 
 	#
 	# Step 8: Sign the image and add public key to U-Boot dtb
@@ -651,7 +654,7 @@ fitimage_assemble() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			$add_key_to_u_boot \
-			-r arch/${ARCH}/boot/${2} \
+			-r arch/${ARCH}/boot/$2 \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
 	fi
 }
@@ -659,7 +662,7 @@ fitimage_assemble() {
 do_assemble_fitimage() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
-		fitimage_assemble fit-image.its fitImage
+		fitimage_assemble fit-image.its fitImage ""
 	fi
 }
 
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index fdf153248c..bae8cada0a 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -162,8 +162,8 @@ concat_dtb() {
 		mkdir -p ${DEPLOYDIR}
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
-				CONFIG_B_PATH="${config}"
-				cd ${B}/${config}
+				CONFIG_B_PATH="$config"
+				cd ${B}/$config
 				concat_dtb_helper
 			done
 		else
@@ -179,8 +179,8 @@ concat_spl_dtb() {
 		mkdir -p ${DEPLOYDIR}
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
-				CONFIG_B_PATH="${config}"
-				cd ${B}/${config}
+				CONFIG_B_PATH="$config"
+				cd ${B}/$config
 				concat_spl_dtb_helper
 			done
 		else
@@ -231,7 +231,7 @@ do_install:append() {
 	if [ "${PN}" = "${UBOOT_PN}" ]; then
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
-				cd ${B}/${config}
+				cd ${B}/$config
 				if [ "${UBOOT_SIGN_ENABLE}" = "1" -o "${UBOOT_FITIMAGE_ENABLE}" = "1" ] && \
 					[ -n "${UBOOT_DTB_BINARY}" ]; then
 					install_helper
@@ -286,19 +286,19 @@ addtask uboot_generate_rsa_keys before do_uboot_assemble_fitimage after do_compi
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
-	uboot_its="${1}"
-	uboot_nodtb_bin="${2}"
-	uboot_dtb="${3}"
-	uboot_bin="${4}"
-	spl_dtb="${5}"
+	uboot_its="$1"
+	uboot_nodtb_bin="$2"
+	uboot_dtb="$3"
+	uboot_bin="$4"
+	spl_dtb="$5"
 	uboot_csum="${UBOOT_FIT_HASH_ALG}"
 	uboot_sign_algo="${UBOOT_FIT_SIGN_ALG}"
 	uboot_sign_keyname="${SPL_SIGN_KEYNAME}"
 
-	rm -f ${uboot_its} ${uboot_bin}
+	rm -f $uboot_its $uboot_bin
 
 	# First we create the ITS script
-	cat << EOF >> ${uboot_its}
+	cat << EOF >> $uboot_its
 /dts-v1/;
 
 / {
@@ -308,7 +308,7 @@ uboot_fitimage_assemble() {
     images {
         uboot {
             description = "U-Boot image";
-            data = /incbin/("${uboot_nodtb_bin}");
+            data = /incbin/("$uboot_nodtb_bin");
             type = "standalone";
             os = "u-boot";
             arch = "${UBOOT_ARCH}";
@@ -318,34 +318,34 @@ uboot_fitimage_assemble() {
 EOF
 
 	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
-		cat << EOF >> ${uboot_its}
+		cat << EOF >> $uboot_its
             signature {
-                algo = "${uboot_csum},${uboot_sign_algo}";
-                key-name-hint = "${uboot_sign_keyname}";
+                algo = "$uboot_csum,$uboot_sign_algo";
+                key-name-hint = "$uboot_sign_keyname";
             };
 EOF
 	fi
 
-	cat << EOF >> ${uboot_its}
+	cat << EOF >> $uboot_its
         };
         fdt {
             description = "U-Boot FDT";
-            data = /incbin/("${uboot_dtb}");
+            data = /incbin/("$uboot_dtb");
             type = "flat_dt";
             arch = "${UBOOT_ARCH}";
             compression = "none";
 EOF
 
 	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
-		cat << EOF >> ${uboot_its}
+		cat << EOF >> $uboot_its
             signature {
-                algo = "${uboot_csum},${uboot_sign_algo}";
-                key-name-hint = "${uboot_sign_keyname}";
+                algo = "$uboot_csum,$uboot_sign_algo";
+                key-name-hint = "$uboot_sign_keyname";
             };
 EOF
 	fi
 
-	cat << EOF >> ${uboot_its}
+	cat << EOF >> $uboot_its
         };
     };
 
@@ -365,8 +365,8 @@ EOF
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
-		-f ${uboot_its} \
-		${uboot_bin}
+		-f $uboot_its \
+		$uboot_bin
 
 	if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
 		#
@@ -375,8 +375,8 @@ EOF
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${SPL_SIGN_KEYDIR}" \
-			-K "${spl_dtb}" \
-			-r ${uboot_bin} \
+			-K "$spl_dtb" \
+			-r $uboot_bin \
 			${SPL_MKIMAGE_SIGN_ARGS}
 	fi
 
@@ -408,8 +408,8 @@ do_uboot_assemble_fitimage() {
 		kernel_uboot_fitimage_name=`basename ${STAGING_DATADIR}/u-boot-fitImage-*`
 		kernel_uboot_its_name=`basename ${STAGING_DATADIR}/u-boot-its-*`
 		cd ${B}
-		uboot_fitimage_assemble ${kernel_uboot_its_name} ${UBOOT_NODTB_BINARY} \
-					${UBOOT_DTB_BINARY} ${kernel_uboot_fitimage_name} \
+		uboot_fitimage_assemble $kernel_uboot_its_name ${UBOOT_NODTB_BINARY} \
+					${UBOOT_DTB_BINARY} $kernel_uboot_fitimage_name \
 					${SPL_DTB_BINARY}
 	fi
 }
-- 
2.31.1


