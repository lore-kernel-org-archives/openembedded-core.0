Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340BCEB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:18 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.14567.1687447932723798608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ntqgc43+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-553a998bca3so4078558a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447932; x=1690039932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDuWe8osTBOoJ2L1ytvZrK/AjPFc0WsFldxoo9/6Cz4=;
        b=Ntqgc43+GUKqsRknpbmiDO2geProWHmpwj44IR9sdJK7AWkOTIj3ho6NfsyZwKRnRy
         Y/lPg+m8NR/auxriSS42FEqjqWBT5XOKJZlHH5l6X/sZMvIOPo/nulSjHY0hy5XNvHKI
         6eQ9kLcQfkDyvGA9m+agxUju0iv5mxsuvEuluSX3veWrJ7g/Wy9i0IwyHRVI3JoP7wm7
         LJ+bq8l92B+rAa2AGZROgR5O/M+aKEPi9Hg7/JpG+LWvRnfAMUW2dmMnpQZa3LFitmj7
         0AYZAh7E3HyNbXX6WqGQIyLTsIOqLS/g8wSafVnS+d3SgfmX6s2S8PJKONWceiG4nvkg
         KQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447932; x=1690039932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDuWe8osTBOoJ2L1ytvZrK/AjPFc0WsFldxoo9/6Cz4=;
        b=Zpwqus7OrFkIbad0PowjH6Uchmb1IiuuVZffnip3q3W+GpBiUvqWK1DSeSHbPzBXJB
         hiPPf8kBCgOxSFVeKdr3FEl2y+YEWSsxBUUyA4adzwm7nYgxVxeoV0C1aM85xw2jjmyl
         esHyU2egwAfzDamSpEdVqUS1JMUrXfz7zbhjI8mNvYDQcOHLn9Pt75ZxEcj/RcVte+Lp
         hmGjL0xqO8Pb3OLcnc16HFUvqJ6t0Hd2ESw0139hGUXjtLaEkB+QoO2NjeFdk8t9GIQl
         aU8ux8cmL1NAjLud0SZjjGRql50+Ha07c2YFLwG0LO+2P/keqJgHITlRzey2pHd6rORb
         P8uw==
X-Gm-Message-State: AC+VfDwLy8J1iS8uiNsXcGO7/rYnJrVem1sAEOiogBDWq3XfKRLITuhW
	zIW0aDCYA2deKQa0Q7UHLm0jupw6bayV8bnjxK4=
X-Google-Smtp-Source: ACHHUZ57D9FonJJVbMlX0U/j0L+6oMGXnRgY/rVre65ZBCDm9yIhrdj4bihzESDQ0vESa78rqQ25Sw==
X-Received: by 2002:a05:6a20:4328:b0:125:377c:831d with SMTP id h40-20020a056a20432800b00125377c831dmr1769481pzk.3.1687447931415;
        Thu, 22 Jun 2023 08:32:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] kernel-fitimage: adding support for Initramfs bundle and u-boot script
Date: Thu, 22 Jun 2023 05:31:40 -1000
Message-Id: <e3eb79c0a11e9f67af3161361fb88b00123ecbac.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183258

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport of 19fa415c8769a67b52babd80f71d68bf36a21db2 in master branch
Signed-off-by: Remi Peuvergne <remi.peuvergne@non.se.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 157 +++++++++++++++++++++++----
 1 file changed, 134 insertions(+), 23 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index e0dd215167..3b23138628 100644
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
@@ -180,6 +186,43 @@ fitimage_emit_section_dtb() {
 EOF
 }
 
+#
+# Emit the fitImage ITS u-boot script section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to boot script image
+fitimage_emit_section_boot_script() {
+
+	bootscr_csum="${FIT_HASH_ALG}"
+	bootscr_sign_algo="${FIT_SIGN_ALG}"
+	bootscr_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
+
+        cat << EOF >> $1
+                bootscr-$2 {
+                        description = "U-boot script";
+                        data = /incbin/("$3");
+                        type = "script";
+                        arch = "${UBOOT_ARCH}";
+                        compression = "none";
+                        hash-1 {
+                                algo = "$bootscr_csum";
+                        };
+                };
+EOF
+
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "$bootscr_sign_keyname" ] ; then
+		sed -i '$ d' $1
+		cat << EOF >> $1
+                        signature-1 {
+                                algo = "$bootscr_csum,$bootscr_sign_algo";
+                                key-name-hint = "$bootscr_sign_keyname";
+                        };
+                };
+EOF
+	fi
+}
+
 #
 # Emit the fitImage ITS setup section
 #
@@ -250,8 +293,9 @@ EOF
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
@@ -267,6 +311,7 @@ fitimage_emit_section_config() {
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
+	bootscr_line=""
 	setup_line=""
 	default_line=""
 
@@ -289,21 +334,28 @@ fitimage_emit_section_config() {
 	fi
 
 	if [ -n "${5}" ]; then
+		conf_desc="${conf_desc}${sep}u-boot script"
+		sep=", "
+		bootscr_line="bootscr = \"bootscr-${5}\";"
+	fi
+
+	if [ -n "${6}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
-		setup_line="setup = \"setup-${5}\";"
+		setup_line="setup = \"setup-${6}\";"
 	fi
 
-	if [ "${6}" = "1" ]; then
+	if [ "${7}" = "1" ]; then
 		default_line="default = \"conf-${3}\";"
 	fi
 
 	cat << EOF >> ${1}
                 ${default_line}
                 conf-${3} {
-			description = "${6} ${conf_desc}";
+			description = "${7} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
+			${bootscr_line}
 			${setup_line}
                         hash-1 {
                                 algo = "${conf_csum}";
@@ -331,6 +383,11 @@ EOF
 		fi
 
 		if [ -n "${5}" ]; then
+			sign_line="${sign_line}${sep}\"bootscr\""
+			sep=", "
+		fi
+
+		if [ -n "${6}" ]; then
 			sign_line="${sign_line}${sep}\"setup\""
 		fi
 
@@ -363,6 +420,7 @@ fitimage_assemble() {
 	DTBS=""
 	ramdiskcount=${3}
 	setupcount=""
+	bootscr_id=""
 	rm -f ${1} arch/${ARCH}/boot/${2}
 
 	fitimage_emit_fit_header ${1}
@@ -373,7 +431,22 @@ fitimage_assemble() {
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
@@ -407,7 +480,21 @@ fitimage_assemble() {
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
@@ -415,9 +502,9 @@ fitimage_assemble() {
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
@@ -438,7 +525,7 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 5: Prepare a configurations section
+	# Step 6: Prepare a configurations section
 	#
 	fitimage_emit_section_maint ${1} confstart
 
@@ -449,7 +536,7 @@ fitimage_assemble() {
 			if [ "${dtb_ext}" = "dtbo" ]; then
 				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} = ${dtbcount}`"
 			else
-				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
+				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
 			fi
 			i=`expr ${i} + 1`
 		done
@@ -460,7 +547,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} fitend
 
 	#
-	# Step 6: Assemble the image
+	# Step 7: Assemble the image
 	#
 	uboot-mkimage \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
@@ -468,7 +555,7 @@ fitimage_assemble() {
 		arch/${ARCH}/boot/${2}
 
 	#
-	# Step 7: Sign the image and add public key to U-Boot dtb
+	# Step 8: Sign the image and add public key to U-Boot dtb
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
 		add_key_to_u_boot=""
@@ -500,7 +587,11 @@ do_assemble_fitimage_initramfs() {
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
 
@@ -511,22 +602,32 @@ kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		echo "Copying fit-image.its source file..."
-		install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
-		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			echo "Copying fit-image.its source file..."
+			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+			fi
 
-		echo "Copying linux.bin file..."
-		install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
-		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+			echo "Copying linux.bin file..."
+			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+			fi
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
+				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+				fi
+			fi
 		fi
 		if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
 			# UBOOT_DTB_IMAGE is a realfile, but we can't use
@@ -536,3 +637,13 @@ kernel_do_deploy_append() {
 		fi
 	fi
 }
+
+# The function below performs the following in case of initramfs bundles:
+# - Removes do_assemble_fitimage. FIT generation is done through
+#   do_assemble_fitimage_initramfs. do_assemble_fitimage is not needed
+#   and should not be part of the tasks to be executed.
+python () {
+    d.appendVarFlag('do_compile', 'vardeps', ' INITRAMFS_IMAGE_BUNDLE')
+    if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
+        bb.build.deltask('do_assemble_fitimage', d)
+}
-- 
2.34.1


