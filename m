Return-Path: <rpeuvergne@free.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E87EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 13:03:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by mx.groups.io with SMTP id smtpd.web10.17593.1686834191691003740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 06:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: non.se.com, ip: 212.27.42.3, mailfrom: remi.peuvergne@non.se.com)
Received: from localhost.localdomain (unknown [80.214.152.232])
	(Authenticated sender: rpeuvergne@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id CFB2813F8A2;
	Thu, 15 Jun 2023 15:03:05 +0200 (CEST)
From: Remi Peuvergne <remi.peuvergne@non.se.com>
To: openembedded-core@lists.openembedded.org
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Remi Peuvergne <remi.peuvergne@non.se.com>
Subject: [dunfell][PATCH 1/2] kernel-fitimage: adding support for Initramfs bundle and u-boot script
Date: Thu, 15 Jun 2023 15:02:00 +0200
Message-Id: <20230615130201.1875914-2-remi.peuvergne@non.se.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615130201.1875914-1-remi.peuvergne@non.se.com>
References: <20230615130201.1875914-1-remi.peuvergne@non.se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 13:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182859

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds Initramfs bundle support to the FIT image in addition
to u-boot boot script capability.

These new features are selectable.

In case of Initramfs, the kernel is configured to be bundled with the roo=
tfs
in the same binary (ie: zImage-initramfs-<machine>.bin). When the kernel =
is
copied to RAM and executed, it unpacks the Initramfs rootfs.

For more information about Initramfs please read:

https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initram=
fs.txt

For more details about the Initramfs bundle and boot script implementatio=
n
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
---
 meta/classes/kernel-fitimage.bbclass | 157 +++++++++++++++++++++++----
 1 file changed, 134 insertions(+), 23 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 5f5e9dd444..945914af44 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,5 +1,7 @@
 inherit kernel-uboot kernel-artifact-names uboot-sign
=20
+KERNEL_IMAGETYPE_REPLACEMENT =3D ""
+
 python __anonymous () {
     kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or ""
     if 'fitImage' in kerneltypes.split():
@@ -21,6 +23,8 @@ python __anonymous () {
         else:
             replacementtype =3D "zImage"
=20
+        d.setVar("KERNEL_IMAGETYPE_REPLACEMENT", replacementtype)
+
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
         # to kernel.bbclass . We have to override it, since we pack zIma=
ge
         # (at least for now) into the fitImage .
@@ -45,6 +49,8 @@ python __anonymous () {
         if d.getVar('UBOOT_SIGN_ENABLE') =3D=3D "1" and d.getVar('UBOOT_=
DTB_BINARY'):
             uboot_pn =3D d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boo=
t'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_p=
opulate_sysroot' % uboot_pn)
+            if d.getVar('INITRAMFS_IMAGE_BUNDLE') =3D=3D "1":
+                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depen=
ds', ' %s:do_populate_sysroot' % uboot_pn)
 }
=20
 # Options for the device tree compiler passed to mkimage '-D' feature:
@@ -174,6 +180,43 @@ fitimage_emit_section_dtb() {
 EOF
 }
=20
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
 #
 # Emit the fitImage ITS setup section
 #
@@ -244,8 +287,9 @@ EOF
 # $2 ... Linux kernel ID
 # $3 ... DTB image name
 # $4 ... ramdisk ID
-# $5 ... config ID
-# $6 ... default flag
+# $5 ... u-boot script ID
+# $6 ... config ID
+# $7 ... default flag
 fitimage_emit_section_config() {
=20
 	conf_csum=3D"${FIT_HASH_ALG}"
@@ -260,6 +304,7 @@ fitimage_emit_section_config() {
 	kernel_line=3D""
 	fdt_line=3D""
 	ramdisk_line=3D""
+	bootscr_line=3D""
 	setup_line=3D""
 	default_line=3D""
=20
@@ -282,21 +327,28 @@ fitimage_emit_section_config() {
 	fi
=20
 	if [ -n "${5}" ]; then
+		conf_desc=3D"${conf_desc}${sep}u-boot script"
+		sep=3D", "
+		bootscr_line=3D"bootscr =3D \"bootscr-${5}\";"
+	fi
+
+	if [ -n "${6}" ]; then
 		conf_desc=3D"${conf_desc}${sep}setup"
-		setup_line=3D"setup =3D \"setup-${5}\";"
+		setup_line=3D"setup =3D \"setup-${6}\";"
 	fi
=20
-	if [ "${6}" =3D "1" ]; then
+	if [ "${7}" =3D "1" ]; then
 		default_line=3D"default =3D \"conf-${3}\";"
 	fi
=20
 	cat << EOF >> ${1}
                 ${default_line}
                 conf-${3} {
-			description =3D "${6} ${conf_desc}";
+			description =3D "${7} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
+			${bootscr_line}
 			${setup_line}
                         hash-1 {
                                 algo =3D "${conf_csum}";
@@ -324,6 +376,11 @@ EOF
 		fi
=20
 		if [ -n "${5}" ]; then
+			sign_line=3D"${sign_line}${sep}\"bootscr\""
+			sep=3D", "
+		fi
+
+		if [ -n "${6}" ]; then
 			sign_line=3D"${sign_line}${sep}\"setup\""
 		fi
=20
@@ -355,6 +412,7 @@ fitimage_assemble() {
 	DTBS=3D""
 	ramdiskcount=3D${3}
 	setupcount=3D""
+	bootscr_id=3D""
 	rm -f ${1} arch/${ARCH}/boot/${2}
=20
 	fitimage_emit_fit_header ${1}
@@ -365,7 +423,22 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} imagestart
=20
 	uboot_prep_kimage
-	fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_c=
omp}"
+
+	if [ "${INITRAMFS_IMAGE_BUNDLE}" =3D "1" ]; then
+		initramfs_bundle_path=3D"arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE=
_REPLACEMENT}".initramfs"
+		if [ -e "${initramfs_bundle_path}" ]; then
+
+			#
+			# Include the kernel/rootfs bundle.
+			#
+
+			fitimage_emit_section_kernel ${1} "${kernelcount}" "${initramfs_bundl=
e_path}" "${linux_comp}"
+		else
+			bbwarn "${initramfs_bundle_path} not found."
+		fi
+	else
+		fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_=
comp}"
+	fi
=20
 	#
 	# Step 2: Prepare a DTB image section
@@ -399,7 +472,21 @@ fitimage_assemble() {
 	fi
=20
 	#
-	# Step 3: Prepare a setup section. (For x86)
+	# Step 3: Prepare a u-boot script section
+	#
+
+	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
+		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
+			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
+			bootscr_id=3D"${UBOOT_ENV_BINARY}"
+			fitimage_emit_section_boot_script ${1} "${bootscr_id}" ${UBOOT_ENV_BI=
NARY}
+		else
+			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
+		fi
+	fi
+
+	#
+	# Step 4: Prepare a setup section. (For x86)
 	#
 	if [ -e arch/${ARCH}/boot/setup.bin ]; then
 		setupcount=3D1
@@ -407,9 +494,9 @@ fitimage_assemble() {
 	fi
=20
 	#
-	# Step 4: Prepare a ramdisk section.
+	# Step 5: Prepare a ramdisk section.
 	#
-	if [ "x${ramdiskcount}" =3D "x1" ] ; then
+	if [ "x${ramdiskcount}" =3D "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D=
 "1" ]; then
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; d=
o
 			initramfs_path=3D"${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
@@ -430,7 +517,7 @@ fitimage_assemble() {
 	fi
=20
 	#
-	# Step 5: Prepare a configurations section
+	# Step 6: Prepare a configurations section
 	#
 	fitimage_emit_section_maint ${1} confstart
=20
@@ -441,7 +528,7 @@ fitimage_assemble() {
 			if [ "${dtb_ext}" =3D "dtbo" ]; then
 				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} =3D =
${dtbcount}`"
 			else
-				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdi=
skcount}" "${setupcount}" "`expr ${i} =3D ${dtbcount}`"
+				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdi=
skcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} =3D ${dtbcount}`"
 			fi
 			i=3D`expr ${i} + 1`
 		done
@@ -452,7 +539,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} fitend
=20
 	#
-	# Step 6: Assemble the image
+	# Step 7: Assemble the image
 	#
 	uboot-mkimage \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') =
else ''} \
@@ -460,7 +547,7 @@ fitimage_assemble() {
 		arch/${ARCH}/boot/${2}
=20
 	#
-	# Step 7: Sign the image and add public key to U-Boot dtb
+	# Step 8: Sign the image and add public key to U-Boot dtb
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" =3D "x1" ] ; then
 		add_key_to_u_boot=3D""
@@ -491,7 +578,11 @@ do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
 		test -n "${INITRAMFS_IMAGE}" ; then
 		cd ${B}
-		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMF=
S_IMAGE} 1
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" =3D "1" ]; then
+			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage ""
+		else
+			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAM=
FS_IMAGE} 1
+		fi
 	fi
 }
=20
@@ -502,22 +593,32 @@ kernel_do_deploy[vardepsexclude] =3D "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		echo "Copying fit-image.its source file..."
-		install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_F=
IT_NAME}.its"
-		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-$=
{KERNEL_FIT_LINK_NAME}"
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
+			echo "Copying fit-image.its source file..."
+			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_=
FIT_NAME}.its"
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its=
-${KERNEL_FIT_LINK_NAME}"
+			fi
=20
-		echo "Copying linux.bin file..."
-		install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_=
FIT_NAME}.bin
-		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage=
-linux.bin-${KERNEL_FIT_LINK_NAME}"
+			echo "Copying linux.bin file..."
+			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL=
_FIT_NAME}.bin
+			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+				ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitIma=
ge-linux.bin-${KERNEL_FIT_LINK_NAME}"
+			fi
+		fi
=20
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fit=
Image-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
 			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "=
$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
=20
-			echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
-			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$=
deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
-			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$dep=
loyDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
+				echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
+				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "=
$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
+				if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
+					ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$d=
eployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+				fi
+			fi
 		fi
 		if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a -n "${UBOOT_DTB_BINARY}" ] ; th=
en
 			# UBOOT_DTB_IMAGE is a realfile, but we can't use
@@ -527,3 +628,13 @@ kernel_do_deploy_append() {
 		fi
 	fi
 }
+
+# The function below performs the following in case of initramfs bundles=
:
+# - Removes do_assemble_fitimage. FIT generation is done through
+#   do_assemble_fitimage_initramfs. do_assemble_fitimage is not needed
+#   and should not be part of the tasks to be executed.
+python () {
+    d.appendVarFlag('do_compile', 'vardeps', ' INITRAMFS_IMAGE_BUNDLE')
+    if d.getVar('INITRAMFS_IMAGE_BUNDLE') =3D=3D "1":
+        bb.build.deltask('do_assemble_fitimage', d)
+}
--=20
2.25.1


