Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 874CA605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 23:26:17 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id r64so7526426oie.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X5PwOONNRJoN5AS5dtFkWaeL0sSNV2TSpmRr2+wmx7E=;
	b=vA92+buQkSodfSgHcP0hfeS+2M7uu4r+TSiGX+sz+p0/fFq3qfK+ZRTUt9KK3kNyTI
	x61Q6ioFH54nWiAvaRiiY/NF9ogwoWXK6fiRk/VAg2YoD01TjNQvrXmSmGfBJjZZxopd
	3ZsACYxP+vva05H9umh/kWWQwuaCscPJdhLF1AxjaH1YiSPn6eSrwKkk8YfBUw/sjFIA
	3/RG13BRKJEE5x9zqOyGkvPiw6usV3DyhEoD3P0zaifBvOK46sFIiIQ/SjMT5nVsjli/
	ilhPxSxThKmbbdhVnQgSZFYFIeX1nfcAddSfMe7IOV4TzhcoCAPDeEEfdrIeOCy+4I3n
	8NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X5PwOONNRJoN5AS5dtFkWaeL0sSNV2TSpmRr2+wmx7E=;
	b=iDXaL3USUIzI2+8bO/K1dJbbygLfjiKKSS9vLBSw10Ifbm4TpXP81thn1UFDE7uJsW
	GZszOorGouCPs2UXbAlw32304wNNbJk9732W/M+CYLHETA7PJwrgB3wATknjsQkQ471W
	7s+TlnJVo/2wI/TFy0ylQZCNcAYgfhyOWWEzRJAtistqU+YeNyFEzHMc2uE7a8uO/7DR
	anvqXMh32M8kgtJkuDDpfKYIXnOr1bX0u7Nl4sPVcTq+LY2N1WYDhp+zfmINqDMM3C8z
	1jGTbO5WJsz+ryMuJ3BINyOS0ljC128sRHV8770+98Dq1DSj8y0KCzn/46qhXItONFEG
	2f5w==
X-Gm-Message-State: ALyK8tIHNBp6eY0AeVi/blSmt9as2R98RVBynxWfACsN4N/186tofYPKJrBpgpP5boLVAw==
X-Received: by 10.202.60.131 with SMTP id j125mr447180oia.42.1464132378331;
	Tue, 24 May 2016 16:26:18 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m52sm2587091otd.8.2016.05.24.16.26.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 May 2016 16:26:17 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 18:25:51 -0500
Message-Id: <1464132351-7955-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: marex@denx.de
Subject: [PATCH] kernel-fitimage: add initramfs support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 23:26:19 -0000

If INITRAMFS_IMAGE is set, build an additional fitImage containing the
initramfs. Copy the additional fitImage and the source .its file used to
create it to DEPLOYDIR. The fitImage containing the initramfs must be
built before do_deploy and after do_install to avoid circular dependencies.

UBOOT_RD_LOADADDRESS - Specifies the load address used by u-boot for the
                       initramfs.
UBOOT_RD_ENTRYPOINT  - Specifies the entry point used by u-boot for the
                       initramfs.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 275 +++++++++++++++++++++++------------
 1 file changed, 180 insertions(+), 95 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 298eda2..2c2a642 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -14,7 +14,7 @@ python __anonymous () {
 
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
         # Verified boot will sign the fitImage and append the public key to
         # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
@@ -30,8 +30,9 @@ UBOOT_MKIMAGE_DTCOPTS ??= ""
 #
 # Emit the fitImage ITS header
 #
+# $1 ... .its filename
 fitimage_emit_fit_header() {
-	cat << EOF >> fit-image.its
+	cat << EOF >> ${1}
 /dts-v1/;
 
 / {
@@ -43,32 +44,33 @@ EOF
 #
 # Emit the fitImage section bits
 #
-# $1 ... Section bit type: imagestart - image section start
+# $1 ... .its filename
+# $2 ... Section bit type: imagestart - image section start
 #                          confstart  - configuration section start
 #                          sectend    - section end
 #                          fitend     - fitimage end
 #
 fitimage_emit_section_maint() {
-	case $1 in
+	case $2 in
 	imagestart)
-		cat << EOF >> fit-image.its
+		cat << EOF >> ${1}
 
         images {
 EOF
 	;;
 	confstart)
-		cat << EOF >> fit-image.its
+		cat << EOF >> ${1}
 
         configurations {
 EOF
 	;;
 	sectend)
-		cat << EOF >> fit-image.its
+		cat << EOF >> ${1}
 	};
 EOF
 	;;
 	fitend)
-		cat << EOF >> fit-image.its
+		cat << EOF >> ${1}
 };
 EOF
 	;;
@@ -78,9 +80,10 @@ EOF
 #
 # Emit the fitImage ITS kernel section
 #
-# $1 ... Image counter
-# $2 ... Path to kernel image
-# $3 ... Compression type
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to kernel image
+# $4 ... Compression type
 fitimage_emit_section_kernel() {
 
 	kernel_csum="sha1"
@@ -88,17 +91,17 @@ fitimage_emit_section_kernel() {
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if test -n "${UBOOT_ENTRYSYMBOL}"; then
 		ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+			awk '$4=="${UBOOT_ENTRYSYMBOL}" {print $2}'`
 	fi
 
-	cat << EOF >> fit-image.its
-                kernel@${1} {
+	cat << EOF >> ${1}
+                kernel@${2} {
                         description = "Linux kernel";
-                        data = /incbin/("${2}");
+                        data = /incbin/("${3}");
                         type = "kernel";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "${3}";
+                        compression = "${4}";
                         load = <${UBOOT_LOADADDRESS}>;
                         entry = <${ENTRYPOINT}>;
                         hash@1 {
@@ -111,16 +114,17 @@ EOF
 #
 # Emit the fitImage ITS DTB section
 #
-# $1 ... Image counter
-# $2 ... Path to DTB image
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to DTB image
 fitimage_emit_section_dtb() {
 
 	dtb_csum="sha1"
 
-	cat << EOF >> fit-image.its
-                fdt@${1} {
+	cat << EOF >> ${1}
+                fdt@${2} {
                         description = "Flattened Device Tree blob";
-                        data = /incbin/("${2}");
+                        data = /incbin/("${3}");
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
@@ -132,10 +136,39 @@ EOF
 }
 
 #
+# Emit the fitImage ITS ramdisk section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to ramdisk image
+fitimage_emit_section_ramdisk() {
+
+	ramdisk_csum="sha1"
+
+	cat << EOF >> ${1}
+                ramdisk@${2} {
+                        description = "ramdisk image";
+                        data = /incbin/("${3}");
+                        type = "ramdisk";
+                        arch = "${UBOOT_ARCH}";
+                        os = "linux";
+                        compression = "none";
+                        load = <${UBOOT_RD_LOADADDRESS}>;
+                        entry = <${UBOOT_RD_ENTRYPOINT}>;
+                        hash@1 {
+                                algo = "${ramdisk_csum}";
+                        };
+                };
+EOF
+}
+
+#
 # Emit the fitImage ITS configuration section
 #
-# $1 ... Linux kernel ID
-# $2 ... DTB image ID
+# $1 ... .its filename
+# $2 ... Linux kernel ID
+# $3 ... DTB image ID
+# $4 ... ramdisk ID
 fitimage_emit_section_config() {
 
 	conf_csum="sha1"
@@ -144,21 +177,29 @@ fitimage_emit_section_config() {
 	fi
 
 	# Test if we have any DTBs at all
-	if [ -z "${2}" ] ; then
+	if [ -z "${3}" ] ; then
 		conf_desc="Boot Linux kernel"
 		fdt_line=""
-	else
+		ramdisk_line=""
+	elif [ -z "${4}" ]; then
 		conf_desc="Boot Linux kernel with FDT blob"
-		fdt_line="fdt = \"fdt@${2}\";"
+		fdt_line="fdt = \"fdt@${3}\";"
+		ramdisk_line=""
+	else
+		# TODO - handle ramdisk without FDT blob
+		conf_desc="Boot Linux kernel with FDT blob, ramdisk"
+		fdt_line="fdt = \"fdt@${3}\";"
+		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
 	fi
-	kernel_line="kernel = \"kernel@${1}\";"
+	kernel_line="kernel = \"kernel@${2}\";"
 
-	cat << EOF >> fit-image.its
+	cat << EOF >> ${1}
                 default = "conf@1";
                 conf@1 {
                         description = "${conf_desc}";
 			${kernel_line}
 			${fdt_line}
+			${ramdisk_line}
                         hash@1 {
                                 algo = "${conf_csum}";
                         };
@@ -166,102 +207,131 @@ EOF
 
 	if [ ! -z "${conf_sign_keyname}" ] ; then
 
-		if [ -z "${2}" ] ; then
+		if [ -z "${3}" ] ; then
 			sign_line="sign-images = \"kernel\";"
-		else
+		elif [ -z "${4}" ]; then
 			sign_line="sign-images = \"fdt\", \"kernel\";"
+		else
+			sign_line="sign-images = \"ramdisk\", \"fdt\", \"kernel\";"
 		fi
 
-		cat << EOF >> fit-image.its
+		cat << EOF >> ${1}
                         signature@1 {
                                 algo = "${conf_csum},rsa2048";
                                 key-name-hint = "${conf_sign_keyname}";
-                                sign-images = "fdt", "kernel";
+                                ${sign_line}
                         };
 EOF
 	fi
 
-	cat << EOF >> fit-image.its
+	cat << EOF >> ${1}
                 };
 EOF
 }
 
-do_assemble_fitimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
-		kernelcount=1
-		dtbcount=""
-		rm -f fit-image.its arch/${ARCH}/boot/fitImage
-
-		fitimage_emit_fit_header
-
-		#
-		# Step 1: Prepare a kernel image section.
-		#
-		fitimage_emit_section_maint imagestart
-
-		uboot_prep_kimage
-		fitimage_emit_section_kernel "${kernelcount}" linux.bin "${linux_comp}"
-
-		#
-		# Step 2: Prepare a DTB image section
-		#
-		if test -n "${KERNEL_DEVICETREE}"; then
-			dtbcount=1
-			for DTB in ${KERNEL_DEVICETREE}; do
-				if echo ${DTB} | grep -q '/dts/'; then
-					bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-					DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-				fi
-				DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
-				if [ ! -e "${DTB_PATH}" ]; then
-					DTB_PATH="arch/${ARCH}/boot/${DTB}"
-				fi
-
-				fitimage_emit_section_dtb ${dtbcount} ${DTB_PATH}
-				dtbcount=`expr ${dtbcount} + 1`
-			done
-		fi
+#
+# Assemble fitImage
+#
+# $1 ... .its filename
+# $2 ... fitImage name
+# $3 ... include ramdisk
+fitimage_assemble() {
+	kernelcount=1
+	dtbcount=""
+	ramdiskcount=${3}
+	rm -f ${1} arch/${ARCH}/boot/${2}
+
+	fitimage_emit_fit_header ${1}
+
+	#
+	# Step 1: Prepare a kernel image section.
+	#
+	fitimage_emit_section_maint ${1} imagestart
+
+	uboot_prep_kimage
+	fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
+
+	#
+	# Step 2: Prepare a DTB image section
+	#
+	if test -n "${KERNEL_DEVICETREE}"; then
+		dtbcount=1
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+			fi
+			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
+			if [ ! -e "${DTB_PATH}" ]; then
+				DTB_PATH="arch/${ARCH}/boot/${DTB}"
+			fi
+
+			fitimage_emit_section_dtb ${1} ${dtbcount} ${DTB_PATH}
+			dtbcount=`expr ${dtbcount} + 1`
+		done
+	fi
 
-		fitimage_emit_section_maint sectend
+	#
+	# Step 3: Prepare a ramdisk section.
+	#
+	if [ "x${ramdiskcount}" = "x1" ] ; then
+		copy_initramfs
+		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+	fi
 
-		# Force the first Kernel and DTB in the default config
-		kernelcount=1
-		dtbcount=1
+	fitimage_emit_section_maint ${1} sectend
+
+	# Force the first Kernel and DTB in the default config
+	kernelcount=1
+	dtbcount=1
 
-		#
-		# Step 3: Prepare a configurations section
-		#
-		fitimage_emit_section_maint confstart
+	#
+	# Step 4: Prepare a configurations section
+	#
+	fitimage_emit_section_maint ${1} confstart
 
-		fitimage_emit_section_config ${kernelcount} ${dtbcount}
+	fitimage_emit_section_config ${1} ${kernelcount} ${dtbcount} ${ramdiskcount}
 
-		fitimage_emit_section_maint sectend
+	fitimage_emit_section_maint ${1} sectend
 
-		fitimage_emit_section_maint fitend
+	fitimage_emit_section_maint ${1} fitend
 
-		#
-		# Step 4: Assemble the image
-		#
+	#
+	# Step 5: Assemble the image
+	#
+	uboot-mkimage \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-f ${1} \
+		arch/${ARCH}/boot/${2}
+
+	#
+	# Step 6: Sign the image and add public key to U-Boot dtb
+	#
+	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
 		uboot-mkimage \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-			-f fit-image.its \
-			arch/${ARCH}/boot/fitImage
-
-		#
-		# Step 5: Sign the image and add public key to U-Boot dtb
-		#
-		if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
-			uboot-mkimage \
-				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-				-F -k "${UBOOT_SIGN_KEYDIR}" \
-				-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}" \
-				-r arch/${ARCH}/boot/fitImage
-		fi
+			-F -k "${UBOOT_SIGN_KEYDIR}" \
+			-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}" \
+			-r arch/${ARCH}/boot/${2}
+	fi
+}
+
+do_assemble_fitimage() {
+	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+		fitimage_assemble fit-image.its fitImage
 	fi
 }
 
 addtask assemble_fitimage before do_install after do_compile
 
+do_assemble_fitimage_initramfs() {
+	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" -a -n "${INITRAMFS_IMAGE}" ; then
+		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+	fi
+}
+
+addtask assemble_fitimage_initramfs before do_deploy after do_install
+
 kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
@@ -275,8 +345,23 @@ kernel_do_deploy_append() {
 		linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
 		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
 
+		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
+			its_initramfs_base_name="${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+			its_initramfs_symlink_name=${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${MACHINE}
+			install -m 0644 fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/${its_initramfs_base_name}.its
+			fit_initramfs_base_name="${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+			fit_initramfs_symlink_name=${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${MACHINE}
+			install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin
+		fi
+
 		cd ${DEPLOYDIR}
 		ln -sf ${its_base_name}.its ${its_symlink_name}.its
 		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
+
+		if [ -n "${INITRAMFS_IMAGE}" ]; then
+			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
+			ln -sf ${fit_initramfs_base_name}.bin ${fit_initramfs_symlink_name}.bin
+		fi
 	fi
 }
-- 
2.8.0


