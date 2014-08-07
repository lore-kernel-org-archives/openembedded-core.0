Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id BF7E365F81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:24:44 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTYGk0NJYz3hhwL;
	Thu,  7 Aug 2014 17:17:34 +0200 (CEST)
X-Auth-Info: iKQhNmk3NK0UEitZHtCpN8uywJF1fidLeO/Albb3Hpk=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTYGj6JBvz7S6Rv; 
	Thu,  7 Aug 2014 17:17:33 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 17:17:12 +0200
Message-Id: <1407424632-32649-6-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1407424632-32649-1-git-send-email-marex@denx.de>
References: <1407424632-32649-1-git-send-email-marex@denx.de>
Subject: [PATCH 5/5] Yocto: kernel: Add basic fitImage support
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
X-List-Received-Date: Thu, 07 Aug 2014 15:24:53 -0000

This patch adds support for generating a kernel fitImage, which is
a a successor to the uImage format. Unlike uImage, which could only
contain the kernel image itself, the fitImage can contain all kinds
of artifacts, like the kernel image, device tree blobs, initramfs
images, binary firmwares etc. Furthermore, the fitImage supports
different kinds of checksums, not only CRC32 like the uImage did.
Last, but not least, fitImage supports signatures such that either
the whole image or it's parts can be signed and then in turn can
be verified by the bootloader.

So far we only add support for wrapping the kernel image and DTB
into the fitImage. The fitImage uses the sha1 checksum, which is
the default.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/classes/kernel.bbclass | 189 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 186 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b23e2e0..d0faab3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -13,16 +13,20 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
 
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
-    if kerneltype == 'uImage':
+    if kerneltype == 'uImage' or kerneltype == 'fitImage':
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
 
-    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '', kerneltype))
+    if kerneltype == 'fitImage':
+        d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
+    else:
+        d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '', kerneltype))
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
+        d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
     #       The preferred method is to set INITRAMFS_IMAGE, because
@@ -485,6 +489,164 @@ do_uboot_mkimage() {
 
 addtask uboot_mkimage before do_install after do_compile
 
+#
+# Emit the fitImage ITS header
+#
+fitimage_emit_section_start() {
+	cat << EOF >> fit-image.its
+/dts-v1/;
+
+/ {
+        description = "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}";
+        #address-cells = <1>;
+
+        images {
+EOF
+}
+
+#
+# Emit the fitImage ITS kernel section
+#
+# $1 ... Image counter
+# $2 ... Path to kernel image
+# $3 ... Compression type
+fitimage_emit_section_kernel() {
+
+	kernel_csum="sha1"
+
+	ENTRYPOINT=${UBOOT_ENTRYPOINT}
+	if test -n "${UBOOT_ENTRYSYMBOL}"; then
+		ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+	fi
+
+	cat << EOF >> fit-image.its
+                kernel@${1} {
+                        description = "Linux kernel";
+                        data = /incbin/("${2}");
+                        type = "kernel";
+                        arch = "${UBOOT_ARCH}";
+                        os = "linux";
+                        compression = "${3}";
+                        load = <${UBOOT_LOADADDRESS}>;
+                        entry = <${ENTRYPOINT}>;
+                        hash@1 {
+                                algo = "${kernel_csum}";
+                        };
+                };
+EOF
+}
+
+#
+# Emit the fitImage ITS DTB section
+#
+# $1 ... Image counter
+# $2 ... Path to DTB image
+fitimage_emit_section_dtb() {
+
+	dtb_csum="sha1"
+
+	cat << EOF >> fit-image.its
+                fdt@${1} {
+                        description = "Flattened Device Tree blob";
+                        data = /incbin/("${2}");
+                        type = "flat_dt";
+                        arch = "${UBOOT_ARCH}";
+                        compression = "none";
+                        hash@1 {
+                                algo = "${dtb_csum}";
+                        };
+                };
+EOF
+}
+
+#
+# Emit the fitImage ITS configuration section
+#
+# $1 ... Linux kernel ID
+# $2 ... DTB image ID
+fitimage_emit_section_config() {
+
+	conf_csum="sha1"
+
+	# Test if we have any DTBs at all
+	if [ -z "${2}" ] ; then
+		conf_desc="Boot Linux kernel"
+		fdt_line=""
+	else
+		conf_desc="Boot Linxu kernel with FDT blob"
+		fdt_line="fdt = \"fdt@${2}\";"
+	fi
+	kernel_line="kernel = \"kernel@${1}\";"
+
+	cat << EOF >> fit-image.its
+	};
+
+        configurations {
+                default = "conf@1";
+                conf@1 {
+                        description = "${conf_desc}";
+			${kernel_line}
+			${fdt_line}
+                        hash@1 {
+                                algo = "${conf_csum}";
+                        };
+                };
+        };
+};
+EOF
+}
+
+do_assemble_fitimage () {
+	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+		kernelcount=1
+		dtbcount=""
+		rm -f fit-image.its
+
+		fitimage_emit_section_start
+		#
+		# Step 1: Prepare a kernel image section.
+		#
+		uboot_prep_kimage
+		fitimage_emit_section_kernel "${kernelcount}" linux.bin "${linux_comp}"
+
+		#
+		# Step 2: Prepare a DTB image section
+		#
+		if test -n "${KERNEL_DEVICETREE}"; then
+			dtbcount=1
+			for DTB in ${KERNEL_DEVICETREE}; do
+				if echo ${DTB} | grep -q '/dts/'; then
+					bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+					DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+				fi
+				DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
+				if [ ! -e "${DTB_PATH}" ]; then
+					DTB_PATH="arch/${ARCH}/boot/${DTB}"
+				fi
+
+				fitimage_emit_section_dtb ${dtbcount} ${DTB_PATH}
+				dtbcount=`expr ${dtbcount} + 1`
+			done
+
+			# Force the first DTB in the default config
+			dtbcount=1
+		fi
+
+		#
+		# Step 3: Prepare a configurations section
+		#
+		fitimage_emit_section_config ${kernelcount} ${dtbcount}
+
+		#
+		# Step 4: Assemble the image
+		#
+		uboot-mkimage -f fit-image.its arch/${ARCH}/boot/fitImage
+	fi
+}
+
+addtask assemble_fitimage before do_install after do_compile
+
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -499,13 +661,34 @@ kernel_do_deploy() {
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 
 	cd ${B}
+
 	# Update deploy directory
+
+	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+		echo "Copying fit-image.its source file..."
+		its_base_name="${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
+		its_symlink_name=${KERNEL_IMAGETYPE}-its-${MACHINE}
+		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
+		linux_bin_base_name="${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
+		linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
+		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
+
+	fi
+
 	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
 		echo "Copying deploy kernel-initramfs image and setting up links..."
 		initramfs_base_name=${INITRAMFS_BASE_NAME}
 		initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
 		install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
-		cd ${DEPLOYDIR}
+	fi
+
+	cd ${DEPLOYDIR}
+	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+		ln -sf ${its_base_name}.its ${its_symlink_name}.its
+		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
+	fi
+
+	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
 		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
 	fi
 }
-- 
2.0.1


