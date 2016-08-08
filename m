Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id C62D6771A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:38:59 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id w143so35377803oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kGUYBMPj7Y3XwzI1/iizMukvHNCbNhMGB3SPrzFrdv8=;
	b=kSF7Da5fiVrSYBSME7HAOoUn27B5XAwXvTIknJsOvJvH9uuM6qNImUYhnUOGiIxfPn
	RAKvtg2hbCf0RhsjgnbHafj1PgkOX5m6QRf1+rv0WYejj5OYNv9EXIBniV/tMoQJnyE9
	lQDAlXQuldCqUDzhZts8KUiGMsg79rVtnhGkgpzCbIGkrbkZQ2mPhmpKWmHFiws9HZJj
	UztM/jdXqnRM97uqu6OKBh1k8AQbPZGEAc10J4+deKeE6/5f85SLynhbb7eo6t9/D7gJ
	MnNmeTzk0mUD6r67jcMbGxRzAsLjrjWzWkgaUxUcgJu6C7IjVl8zJj+otuofeTZpsFAn
	OMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kGUYBMPj7Y3XwzI1/iizMukvHNCbNhMGB3SPrzFrdv8=;
	b=haczmPZ5ZkWcvvBT0BLx+ZmT0X/dKnzC7dGT3Xc2vW4dE/uYIYhrDkcMdi4Xcfr+N2
	CRl8nve31fi8ADfONaBM17UKMYHEs5b1f/O4QIFxkDNxhmSo8qsZzQBYTgXG/5e+Bi0d
	/2bIlzwU4wWaITuWXitr6uayf+d/8joAlvvA2YCOtmwsCArxwzQutzpYaqdR+nKxKDaL
	W6DfDHCJXH96z8pdy0nmBD85iWS2tdE0Krc6NjxfalUpDPAG+zJQ2rwhwap+RAGAXGNO
	isH/BGZMR8WSd4bYGqNxzD7kvbwvfuddu4l24NVKNTUL2ZXHQga6u4f/jApSHeJNDj9R
	AJNw==
X-Gm-Message-State: AEkoouvSBRXhnwyI0MYPF4AOVbI66g8ZueLdPEQGU9UGgXDpXZbNmR7DBy2LYTQGJ+mEOQ==
X-Received: by 10.157.5.141 with SMTP id 13mr3605334otd.60.1470674339791;
	Mon, 08 Aug 2016 09:38:59 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	e195sm12516486oic.21.2016.08.08.09.38.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:38:59 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 11:37:54 -0500
Message-Id: <c0c6df4a3e245d9d4960fa95036b7da98c4297eb.1470672689.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
Cc: marex@denx.de, trini@konsulko.com, andrew.bradford@kodakalaris.com,
	denys@ti.com
Subject: [PATCH v3 2/5] kernel-fitimage: add initramfs support
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
X-List-Received-Date: Mon, 08 Aug 2016 16:39:00 -0000

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
 meta/classes/kernel-fitimage.bbclass | 285 +++++++++++++++++++++++------------
 1 file changed, 189 insertions(+), 96 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 7cca180..f05d8a5 100644
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
@@ -168,103 +212,137 @@ EOF
 
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
-	cd ${B}
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
 
-		fitimage_emit_section_maint sectend
+	#
+	# Step 3: Prepare a ramdisk section.
+	#
+	if [ "x${ramdiskcount}" = "x1" ] ; then
+		copy_initramfs
+		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+	fi
 
-		# Force the first Kernel and DTB in the default config
-		kernelcount=1
-		dtbcount=1
+	fitimage_emit_section_maint ${1} sectend
 
-		#
-		# Step 3: Prepare a configurations section
-		#
-		fitimage_emit_section_maint confstart
+	# Force the first Kernel and DTB in the default config
+	kernelcount=1
+	dtbcount=1
 
-		fitimage_emit_section_config ${kernelcount} ${dtbcount}
+	#
+	# Step 4: Prepare a configurations section
+	#
+	fitimage_emit_section_maint ${1} confstart
 
-		fitimage_emit_section_maint sectend
+	fitimage_emit_section_config ${1} ${kernelcount} ${dtbcount} ${ramdiskcount}
 
-		fitimage_emit_section_maint fitend
+	fitimage_emit_section_maint ${1} sectend
 
-		#
-		# Step 4: Assemble the image
-		#
+	fitimage_emit_section_maint ${1} fitend
+
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
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
+		cd ${B}
+		fitimage_assemble fit-image.its fitImage
 	fi
 }
 
 addtask assemble_fitimage before do_install after do_compile
 
+do_assemble_fitimage_initramfs() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
+		test -n "${INITRAMFS_IMAGE}" ; then
+		cd ${B}
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
@@ -278,8 +356,23 @@ kernel_do_deploy_append() {
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


