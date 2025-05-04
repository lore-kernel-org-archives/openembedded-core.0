Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5A2C3ABBB
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:07:09 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.28297.1746364018399646036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=KuFrTyle;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2025050413065976106ab09aa9a065e1-ymof7u@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025050413065976106ab09aa9a065e1
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WqFkUcHuRoIWxhdLDP4pRqY//pRB5VYYNsEd87Pc6fg=;
 b=KuFrTylegR6H5teFGm/qD+HX1d7Mg5kUq7rg3ShcrvkLJUeLZK9y6fTUCPyjyYnYCyJ+QR
 ee8+svIHcweCbS0Fg/rlS/MyGTUKkNJZd2gOU6PwvnAaO2Xq8eGhRUIptS4B/btHWsUhSyot
 bFCsOFbayFC5Bz9GpqFpHnr/4gld10VtO8DMSaNzj00YEwPVN4m2GFtaPtLcwEawQHV0GQBN
 oTe2byWcLr6DP+0FZ2PAOZn6Pwupe3iEyZQzSnrUpB5YTo5uavhazepCBIu9wMH51pbG//Jt
 a3B7KG2zOQEyzdhO/rhn+2tXzqjD1YdIX/alaK0jKoXkhtZ0RUEnLkng==;
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
Subject: [PATCH 18/20] kernel-uboot.bbclass: merge it into kernel-uimage.bbclass
Date: Sun,  4 May 2025 15:05:05 +0200
Message-ID: <20250504130507.717954-18-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215959

From: Adrian Freihofer <adrian.freihofer@siemens.com>

After the kernel-fitimage.bbclass has been removed, the
kernel-uimage.bbclass is the only user of the kernel-uboot.bbclass.
Simplify the implementation by merging these two classes into one.

Until "uImage" is in KERNEL_IMAGETYPES the kernel-uimage.bbclass does
nothing else than exporting the artifiacts which are required for
creating the fitImage.

It should also be remembered that the kernel.bbclass inherits the
kernel-uimage.bbclass by default:
  KERNEL_CLASSES ?= " kernel-uimage "

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-uboot.bbclass  | 69 ----------------------
 meta/classes-recipe/kernel-uimage.bbclass | 71 +++++++++++++++++++++--
 2 files changed, 67 insertions(+), 73 deletions(-)
 delete mode 100644 meta/classes-recipe/kernel-uboot.bbclass

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
deleted file mode 100644
index 7aafd4757c2..00000000000
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ /dev/null
@@ -1,69 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-# fitImage kernel compression algorithm
-FIT_KERNEL_COMP_ALG ?= "gzip"
-FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
-
-# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
-UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
-
-uboot_prep_kimage() {
-	output_dir=$1
-	# For backward compatibility with kernel-fitimage.bbclass and kernel-uboot.bbclass
-	# support calling without parameter as well
-	if [ -z "$output_dir" ]; then
-		output_dir='.'
-	fi
-
-	linux_bin=$output_dir/linux.bin
-	if [ -e "arch/${ARCH}/boot/compressed/vmlinux" ]; then
-		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
-		linux_suffix=""
-		linux_comp="none"
-	elif [ -e "arch/${ARCH}/boot/vmlinuz.bin" ]; then
-		rm -f "$linux_bin"
-		cp -l "arch/${ARCH}/boot/vmlinuz.bin" "$linux_bin"
-		vmlinux_path=""
-		linux_suffix=""
-		linux_comp="none"
-	else
-		vmlinux_path="vmlinux"
-		# Use vmlinux.initramfs for $linux_bin when INITRAMFS_IMAGE_BUNDLE set
-		# As per the implementation in kernel.bbclass.
-		# See do_bundle_initramfs function
-		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ] && [ -e vmlinux.initramfs ]; then
-			vmlinux_path="vmlinux.initramfs"
-		fi
-		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
-		linux_comp="${FIT_KERNEL_COMP_ALG}"
-	fi
-
-	[ -n "$vmlinux_path" ] && ${KERNEL_OBJCOPY} -O binary -R .note -R .comment -S "$vmlinux_path" "$linux_bin"
-
-	if [ "$linux_comp" != "none" ] ; then
-		if [ "$linux_comp" = "gzip" ] ; then
-			gzip -9 "$linux_bin"
-		elif [ "$linux_comp" = "lzo" ] ; then
-			lzop -9 "$linux_bin"
-		elif [ "$linux_comp" = "lzma" ] ; then
-			xz --format=lzma -f -6 "$linux_bin"
-		fi
-		mv -f "$linux_bin$linux_suffix" "$linux_bin"
-	fi
-
-	printf "$linux_comp" > "$output_dir/linux_comp"
-}
-
-do_install:append() {
-	# Provide the kernel artifacts to post processing recipes e.g. for creating a FIT image
-	install -d ${D}/sysroot-only
-	uboot_prep_kimage ${D}/sysroot-only
-	# For x86 a setup.bin needs to be included in a fitImage as well
-	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
-		install -D ${B}/${KERNEL_OUTPUT_DIR}/setup.bin ${D}/sysroot-only/setup.bin
-	fi
-}
diff --git a/meta/classes-recipe/kernel-uimage.bbclass b/meta/classes-recipe/kernel-uimage.bbclass
index e353232a0e9..f04a2c6d691 100644
--- a/meta/classes-recipe/kernel-uimage.bbclass
+++ b/meta/classes-recipe/kernel-uimage.bbclass
@@ -4,7 +4,13 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit kernel-uboot
+# fitImage kernel compression algorithm
+FIT_KERNEL_COMP_ALG ?= "gzip"
+FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
+
+# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
+UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
+
 
 python __anonymous () {
     if "uImage" in d.getVar('KERNEL_IMAGETYPES'):
@@ -26,10 +32,67 @@ python __anonymous () {
             bb.build.addtask('do_uboot_mkimage', 'do_install', 'do_kernel_link_images', d)
 }
 
+uboot_prep_kimage() {
+	output_dir=$1
+	# For backward compatibility with kernel-fitimage.bbclass and kernel-uboot.bbclass
+	# support calling without parameter as well
+	if [ -z "$output_dir" ]; then
+		output_dir='.'
+	fi
+
+	linux_bin=$output_dir/linux.bin
+	if [ -e "arch/${ARCH}/boot/compressed/vmlinux" ]; then
+		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
+		linux_suffix=""
+		linux_comp="none"
+	elif [ -e "arch/${ARCH}/boot/vmlinuz.bin" ]; then
+		rm -f "$linux_bin"
+		cp -l "arch/${ARCH}/boot/vmlinuz.bin" "$linux_bin"
+		vmlinux_path=""
+		linux_suffix=""
+		linux_comp="none"
+	else
+		vmlinux_path="vmlinux"
+		# Use vmlinux.initramfs for $linux_bin when INITRAMFS_IMAGE_BUNDLE set
+		# As per the implementation in kernel.bbclass.
+		# See do_bundle_initramfs function
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ] && [ -e vmlinux.initramfs ]; then
+			vmlinux_path="vmlinux.initramfs"
+		fi
+		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
+		linux_comp="${FIT_KERNEL_COMP_ALG}"
+	fi
+
+	[ -n "$vmlinux_path" ] && ${KERNEL_OBJCOPY} -O binary -R .note -R .comment -S "$vmlinux_path" "$linux_bin"
+
+	if [ "$linux_comp" != "none" ] ; then
+		if [ "$linux_comp" = "gzip" ] ; then
+			gzip -9 "$linux_bin"
+		elif [ "$linux_comp" = "lzo" ] ; then
+			lzop -9 "$linux_bin"
+		elif [ "$linux_comp" = "lzma" ] ; then
+			xz --format=lzma -f -6 "$linux_bin"
+		fi
+		mv -f "$linux_bin$linux_suffix" "$linux_bin"
+	fi
+
+	printf "$linux_comp" > "$output_dir/linux_comp"
+}
+
+do_install:append() {
+	# Provide the kernel artifacts to post processing recipes e.g. for creating a FIT image
+	install -d ${D}/sysroot-only
+	uboot_prep_kimage ${D}/sysroot-only
+	# For x86 a setup.bin needs to be included in a fitImage as well
+	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
+		install -D ${B}/${KERNEL_OUTPUT_DIR}/setup.bin ${D}/sysroot-only/setup.bin
+	fi
+}
+
 do_uboot_mkimage[dirs] += "${B}"
 do_uboot_mkimage() {
-	uboot_prep_kimage
-	linux_comp="$(cat linux_comp)"
+	linux_bin=${D}/sysroot-only/setup.bin
+	linux_comp=$(cat "${D}/sysroot-only/linux_comp")
 
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -37,6 +100,6 @@ do_uboot_mkimage() {
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "$linux_comp" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "$linux_comp" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d "$linux_bin" ${B}/arch/${ARCH}/boot/uImage
 	rm -f linux.bin
 }
-- 
2.49.0


