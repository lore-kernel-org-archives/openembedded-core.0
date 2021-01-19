Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9760.1611053595651990811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 02:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D1BF113E;
	Tue, 19 Jan 2021 02:53:15 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.9.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03F7B3F68F;
	Tue, 19 Jan 2021 02:53:13 -0800 (PST)
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: openembedded-core@lists.openembedded.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [meta-oe][PATCH v2 1/3] kernel-fitimage: adding support for Initramfs bundle and u-boot script
Date: Tue, 19 Jan 2021 10:53:01 +0000
Message-Id: <20210119105303.20592-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>
References: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds Initramfs bundle support to the FIT image in addition
to u-boot boot script capability.

These new features are selectable.

In case of Initramfs, the kernel is configured to be bundled with the rootfs
in the same binary (ie: zImage-initramfs-<machine>.bin). When the kernel is
copied to RAM and executed, it unpacks the Initramfs rootfs.

For more information about Initramfs please read:

https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt

For more details about the Initramfs bundle and boot script implementation
please check the kernel-fitimage.bbclass paragraph in Yocto reference
or mega manual.

Current limitations:

- Initramfs bundle FIT support has been tested on ARM 32-bit
- The kernel image type in case of ARM 32-bit is zImage

Change-Id: I901bfd899e8d733c5b9a2b6645b1d4748f4b1fda
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta/classes/kernel-fitimage.bbclass | 160 +++++++++++++++++++++++----
 1 file changed, 137 insertions(+), 23 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9fa302a5c8..87ed8bd892 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,5 +1,7 @@
 inherit kernel-uboot kernel-artifact-names uboot-sign
 
+KERNEL_IMAGETYPE_REPLACEMENT = ""
+
 python __anonymous () {
     kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
     if 'fitImage' in kerneltypes.split():
@@ -21,6 +23,8 @@ python __anonymous () {
         else:
             replacementtype = "zImage"
 
+        d.setVar("KERNEL_IMAGETYPE_REPLACEMENT", replacementtype)
+
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
         # to kernel.bbclass . We have to override it, since we pack zImage
         # (at least for now) into the fitImage .
@@ -45,6 +49,8 @@ python __anonymous () {
         if d.getVar('UBOOT_SIGN_ENABLE') == "1" and d.getVar('UBOOT_DTB_BINARY'):
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
+            if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
+                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
@@ -229,6 +235,43 @@ EOF
 	fi
 }
 
+#
+# Emit the fitImage ITS u-boot script section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to boot script image
+fitimage_emit_section_boot_script() {
+
+        bootscr_csum="${FIT_HASH_ALG}"
+	bootscr_sign_algo="${FIT_SIGN_ALG}"
+	bootscr_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+
+        cat << EOF >> ${1}
+                bootscr@${2} {
+                        description = "U-boot script";
+                        data = /incbin/("${3}");
+                        type = "script";
+                        arch = "${UBOOT_ARCH}";
+                        compression = "none";
+                        hash@1 {
+                                algo = "${bootscr_csum}";
+                        };
+                };
+EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${bootscr_sign_keyname}" ] ; then
+		sed -i '$ d' ${1}
+		cat << EOF >> ${1}
+                        signature@1 {
+                                algo = "${bootscr_csum},${bootscr_sign_algo}";
+                                key-name-hint = "${bootscr_sign_keyname}";
+                        };
+                };
+EOF
+	fi
+}
+
 #
 # Emit the fitImage ITS setup section
 #
@@ -312,8 +355,9 @@ EOF
 # $2 ... Linux kernel ID
 # $3 ... DTB image name
 # $4 ... ramdisk ID
-# $5 ... config ID
-# $6 ... default flag
+# $5 ... u-boot script ID
+# $6 ... config ID
+# $7 ... default flag
 fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
@@ -326,8 +370,9 @@ fitimage_emit_section_config() {
 	kernel_id="${2}"
 	dtb_image="${3}"
 	ramdisk_id="${4}"
-	config_id="${5}"
-	default_flag="${6}"
+	bootscr_id="${5}"
+	config_id="${6}"
+	default_flag="${7}"
 
 	# Test if we have any DTBs at all
 	sep=""
@@ -336,6 +381,7 @@ fitimage_emit_section_config() {
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
+	bootscr_line=""
 	setup_line=""
 	default_line=""
 
@@ -365,6 +411,12 @@ fitimage_emit_section_config() {
 		ramdisk_line="ramdisk = \"ramdisk@${ramdisk_id}\";"
 	fi
 
+	if [ -n "${bootscr_id}" ]; then
+		conf_desc="${conf_desc}${sep}u-boot script"
+		sep=", "
+		bootscr_line="bootscr = \"bootscr@${bootscr_id}\";"
+	fi
+
 	if [ -n "${config_id}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
 		setup_line="setup = \"setup@${config_id}\";"
@@ -387,6 +439,7 @@ fitimage_emit_section_config() {
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
+			${bootscr_line}
 			${setup_line}
                         hash@1 {
                                 algo = "${conf_csum}";
@@ -413,6 +466,11 @@ EOF
 			sep=", "
 		fi
 
+		if [ -n "${bootscr_id}" ]; then
+			sign_line="${sign_line}${sep}\"bootscr\""
+			sep=", "
+		fi
+
 		if [ -n "${config_id}" ]; then
 			sign_line="${sign_line}${sep}\"setup\""
 		fi
@@ -445,6 +503,7 @@ fitimage_assemble() {
 	DTBS=""
 	ramdiskcount=${3}
 	setupcount=""
+	bootscr_id=""
 	rm -f ${1} arch/${ARCH}/boot/${2}
 
 	fitimage_emit_fit_header ${1}
@@ -455,7 +514,22 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} imagestart
 
 	uboot_prep_kimage
-	fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
+
+	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+		initramfs_bundle_path="arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE_REPLACEMENT}".initramfs"
+		if [ -e "${initramfs_bundle_path}" ]; then
+
+			#
+			# Include the kernel/rootfs bundle.
+			#
+
+			fitimage_emit_section_kernel ${1} "${kernelcount}" "${initramfs_bundle_path}" "${linux_comp}"
+		else
+			bbwarn "${initramfs_bundle_path} not found."
+		fi
+	else
+		fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
+	fi
 
 	#
 	# Step 2: Prepare a DTB image section
@@ -489,7 +563,21 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 3: Prepare a setup section. (For x86)
+	# Step 3: Prepare a u-boot script section
+	#
+
+	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
+		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
+			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
+			bootscr_id="${UBOOT_ENV_BINARY}"
+			fitimage_emit_section_boot_script ${1} "${bootscr_id}" ${UBOOT_ENV_BINARY}
+		else
+			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
+		fi
+	fi
+
+	#
+	# Step 4: Prepare a setup section. (For x86)
 	#
 	if [ -e arch/${ARCH}/boot/setup.bin ]; then
 		setupcount=1
@@ -497,9 +585,9 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 4: Prepare a ramdisk section.
+	# Step 5: Prepare a ramdisk section.
 	#
-	if [ "x${ramdiskcount}" = "x1" ] ; then
+	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
@@ -520,13 +608,15 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 5: Prepare a configurations section
+	# Step 6: Prepare a configurations section
 	#
 	fitimage_emit_section_maint ${1} confstart
 
 	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
 	# more) to be added to the FIT image along with 0 or more device trees and
 	# 0 or 1 ramdisk.
+        # It is also possible to include an initramfs bundle (kernel and rootfs in one binary)
+        # When the initramfs bundle is used ramdisk is disabled.
 	# If a device tree is to be part of the FIT image, then select
 	# the default configuration to be used is based on the dtbcount. If there is
 	# no dtb present than select the default configuation to be based on
@@ -538,13 +628,13 @@ fitimage_assemble() {
 			if [ "${dtb_ext}" = "dtbo" ]; then
 				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} = ${dtbcount}`"
 			else
-				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
+				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
 			fi
 			i=`expr ${i} + 1`
 		done
 	else
 		defaultconfigcount=1
-		fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${setupcount}" "${defaultconfigcount}"
+		fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${bootscr_id}"  "${setupcount}" "${defaultconfigcount}"
 	fi
 
 	fitimage_emit_section_maint ${1} sectend
@@ -552,7 +642,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} fitend
 
 	#
-	# Step 6: Assemble the image
+	# Step 7: Assemble the image
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
@@ -560,7 +650,7 @@ fitimage_assemble() {
 		arch/${ARCH}/boot/${2}
 
 	#
-	# Step 7: Sign the image and add public key to U-Boot dtb
+	# Step 8: Sign the image and add public key to U-Boot dtb
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
 		add_key_to_u_boot=""
@@ -592,7 +682,11 @@ do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
 		test -n "${INITRAMFS_IMAGE}" ; then
 		cd ${B}
-		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage ""
+		else
+			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+		fi
 	fi
 }
 
@@ -631,22 +725,27 @@ kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		echo "Copying fit-image.its source file..."
-		install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
-		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
 
-		echo "Copying linux.bin file..."
-		install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
-		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			echo "Copying fit-image.its source file..."
+			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
+			ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+
+			echo "Copying linux.bin file..."
+			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
+			ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
 			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 
-			echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
-			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
-			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+				echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
+				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
+				ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			fi
 		fi
 		if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
 			# UBOOT_DTB_IMAGE is a realfile, but we can't use
@@ -656,3 +755,18 @@ kernel_do_deploy_append() {
 		fi
 	fi
 }
+
+# The function below performs the following in case of initramfs bundles:
+# - Removes do_assemble_fitimage. FIT generation is done through
+#   do_assemble_fitimage_initramfs. do_assemble_fitimage is not needed
+#   and should not be part of the tasks to be executed.
+# - Since do_generate_rsa_keys is inserted by default
+#   between do_compile and do_assemble_fitimage, this is
+#   not suitable in case of initramfs bundles.  do_generate_rsa_keys
+#   should be between do_bundle_initramfs and do_assemble_fitimage_initramfs.
+python () {
+    if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
+        bb.build.deltask('do_assemble_fitimage', d)
+        bb.build.deltask('generate_rsa_keys', d)
+        bb.build.addtask('generate_rsa_keys', 'do_assemble_fitimage_initramfs', 'do_bundle_initramfs', d)
+}
\ No newline at end of file
-- 
2.17.1

