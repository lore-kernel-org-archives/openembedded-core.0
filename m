Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29D146FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 17:58:19 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id c199so16763017oig.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BG9E7Cnx8KPrM+X80lJCu0KqlOUEoHEHRyCxBo1yPnk=;
	b=ArRJnKq2tbiaotFqMQEkJpicIJ4vFeD9FZgQai1G0f2lANV5tMm0yM/X8x2AlN5O9G
	j4QtvuJipdnUd836HXg9K1TIsrmwFPj60SRqYIcYDGPa5ETZXfpIwxcDLYFL5V/Oxgkp
	Mh7IpozkWUeC8Zwqe5uJEYj4q1krnOz2j/xj1DMfrjtkKdcXBqIJSf2kLQsWKS1S2UEU
	tXQc5Zk0QPvKqccRRAv1vMpv69npyptjb49iwE0CUPwzuRNPWYyj9h+J3sE2tfsS6WeI
	P5idqhe28su3RL5KqQ2jnsr60Jm9dmFFoW6hZ33f08Y3VnjQc2Q8pguYn6T+sc+9oeDF
	KW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BG9E7Cnx8KPrM+X80lJCu0KqlOUEoHEHRyCxBo1yPnk=;
	b=hL48DOa1fTxBMylLj7g9YVF0jGT6043XPkZDmasMrNP1zyk3rgH40GYUNWnjBSxp5C
	xk8k2aFarQRuZI8J0Jx+552a4nqH5FqrYz1enE2mWN6WsrmEMHsYiIpZDllWI88OFP12
	vo9E2SvGPEC/C22dIWiqxYWcVexwC6Qj1DTaX1nCdCdSh+0emgdex+F/E7dyH7BdjP2Y
	uck/WlQDh0odBlUP9QtyjXL1sx7bMgQf4yZ5+OT8fPCAieoFv/4zHCdfCljSKVqjuSwc
	FevPapY/yt6U80XUNUV+W7wKFq12M+uFjEQJqYYU29TWLDcr7M+pgNyFDChM5/MbN97/
	6tDw==
X-Gm-Message-State: ALyK8tI/Q5Uxhhl/9l2cYJX59Ie9b+NV7B5RFhB3p5nxSoP76N/+0GRuy7dbslpmNIWOnA==
X-Received: by 10.202.219.213 with SMTP id s204mr16761596oig.151.1468864699857;
	Mon, 18 Jul 2016 10:58:19 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	s20sm9402275ota.25.2016.07.18.10.58.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jul 2016 10:58:19 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 12:57:55 -0500
Message-Id: <1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1468862824.git.george.mccollister@gmail.com>
References: <cover.1468862824.git.george.mccollister@gmail.com>
Cc: marex@denx.de
Subject: [PATCH v2 1/3] kernel-fitimage: add initramfs support
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
X-List-Received-Date: Mon, 18 Jul 2016 17:58:20 -0000

If INITRAMFS_IMAGE is set, build an additional fitImage containing the
initramfs. Copy the additional fitImage and the source (*.its) file, used
to create it to DEPLOYDIR. The fitImage containing the initramfs must be
built before do_deploy and after do_install to avoid circular dependencies.

UBOOT_RD_LOADADDRESS - Specifies the load address used by u-boot for the
                       initramfs.
UBOOT_RD_ENTRYPOINT  - Specifies the entry point used by u-boot for the
                       initramfs.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 282 +++++++++++++++++++++++------------
 1 file changed, 187 insertions(+), 95 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9a3caf5..ede69e7 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -16,7 +16,7 @@ python __anonymous () {
 
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
         # Verified boot will sign the fitImage and append the public key to
         # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
@@ -32,8 +32,9 @@ UBOOT_MKIMAGE_DTCOPTS ??= ""
 #
 # Emit the fitImage ITS header
 #
+# $1 ... .its filename
 fitimage_emit_fit_header() {
-	cat << EOF >> fit-image.its
+	cat << EOF >> ${1}
 /dts-v1/;
 
 / {
@@ -45,32 +46,33 @@ EOF
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
@@ -80,9 +82,10 @@ EOF
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
@@ -90,17 +93,17 @@ fitimage_emit_section_kernel() {
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
@@ -113,16 +116,17 @@ EOF
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
@@ -134,10 +138,39 @@ EOF
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
@@ -146,21 +179,32 @@ fitimage_emit_section_config() {
 	fi
 
 	# Test if we have any DTBs at all
-	if [ -z "${2}" ] ; then
+	if [ -z "${3}" -a -z "${4}" ] ; then
 		conf_desc="Boot Linux kernel"
 		fdt_line=""
-	else
+		ramdisk_line=""
+	elif [ -z "${4}" ]; then
 		conf_desc="Boot Linux kernel with FDT blob"
-		fdt_line="fdt = \"fdt@${2}\";"
+		fdt_line="fdt = \"fdt@${3}\";"
+		ramdisk_line=""
+	elif [ -z "${3}" ]; then
+		conf_desc="Boot Linux kernel with ramdisk"
+		fdt_line=""
+		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
+	else
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
@@ -168,102 +212,135 @@ EOF
 
 	if [ ! -z "${conf_sign_keyname}" ] ; then
 
-		if [ -z "${2}" ] ; then
+		if [ -z "${3}" -a -z "${4}" ] ; then
 			sign_line="sign-images = \"kernel\";"
-		else
+		elif [ -z "${4}" ]; then
 			sign_line="sign-images = \"fdt\", \"kernel\";"
+		elif [ -z "${3}" ]; then
+			sign_line="sign-images = \"ramdisk\", \"kernel\";"
+		else
+			sign_line="sign-images = \"ramdisk\", \"fdt\", \"kernel\";"
 		fi
 
-		cat << EOF >> fit-image.its
+		cat << EOF >> ${1}
                         signature@1 {
                                 algo = "${conf_csum},rsa2048";
                                 key-name-hint = "${conf_sign_keyname}";
-                                sign-images = "fdt", "kernel";
+				${sign_line}
                         };
 EOF
 	fi
 
-	cat << EOF >> fit-image.its
+	cat << EOF >> ${1}
                 };
 EOF
 }
 
-do_assemble_fitimage() {
-	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
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
+
+	#
+	# Step 3: Prepare a ramdisk section.
+	#
+	if [ "x${ramdiskcount}" = "x1" ] ; then
+		copy_initramfs
+		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+	fi
 
-		fitimage_emit_section_maint sectend
+	fitimage_emit_section_maint ${1} sectend
 
-		# Force the first Kernel and DTB in the default config
-		kernelcount=1
-		dtbcount=1
+	# Force the first Kernel and DTB in the default config
+	kernelcount=1
+	dtbcount=1
+
+	#
+	# Step 4: Prepare a configurations section
+	#
+	fitimage_emit_section_maint ${1} confstart
 
-		#
-		# Step 3: Prepare a configurations section
-		#
-		fitimage_emit_section_maint confstart
+	fitimage_emit_section_config ${1} ${kernelcount} ${dtbcount} ${ramdiskcount}
 
-		fitimage_emit_section_config ${kernelcount} ${dtbcount}
+	fitimage_emit_section_maint ${1} sectend
 
-		fitimage_emit_section_maint sectend
+	fitimage_emit_section_maint ${1} fitend
 
-		fitimage_emit_section_maint fitend
+	#
+	# Step 5: Assemble the image
+	#
+	uboot-mkimage \
+		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+		-f ${1} \
+		arch/${ARCH}/boot/${2}
 
-		#
-		# Step 4: Assemble the image
-		#
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
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
+		fitimage_assemble fit-image.its fitImage
 	fi
 }
 
 addtask assemble_fitimage before do_install after do_compile
 
+do_assemble_fitimage_initramfs() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
+		test -n "${INITRAMFS_IMAGE}" ; then
+		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+	fi
+}
+
+addtask assemble_fitimage_initramfs before do_deploy after do_install
+
+
 kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
@@ -277,8 +354,23 @@ kernel_do_deploy_append() {
 		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
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


