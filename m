Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5354FC54795
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:09:03 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.48711.1747652938325096988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hVk//vpu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20250519110855386702eaba32bbde5b-omyudt@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250519110855386702eaba32bbde5b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 19 May 2025 13:08:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KqmqVZan7/t5N3Q6U09RScxWIkVGDuAdTBjMfpOo3Mw=;
 b=hVk//vpugseLryZuZA76g49Hi8fswp+RlzzG5KEjexeRKH9k/g/uqI6e3jFvktf3SbLvvd
 ICebiBqDz7tKTp7GAo33mLE/YOMFrQYMJsasFMeCU+fJML+w+BtoEwTWlZfH46WZzw2sxqxx
 rVB09tQdkyXPdxeetnvh3kKjuJfms1WjgEbOdqQWGfltb+CNxJb8ygynkQrzarskKErEHxMn
 PjzR4Var9u9VzCWrH3kre4NFBd+R8AxKhre9yxWvVPiH45juSskokCZNxOYb9qu0xJuHOcv4
 gj3xEQx4VUyIXvjtmBnMzuIBa2UoAx793Erld7TvIbXHivfx6c4s4Xug==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 04/16] kernel-uboot.bbclass: do not require the kernel build folder
Date: Mon, 19 May 2025 13:07:48 +0200
Message-ID: <20250519110838.82978-5-adrian.freihofer@siemens.com>
In-Reply-To: <20250519110838.82978-1-adrian.freihofer@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216848

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The function must be executed in CWD. Make it more flexible by
specifying the kernel build folder as a parameter.

This is a refactoring without functional change. But later this change
will allow to use this function also with a kernel from the sstate-cache
instead of requiring the full kernel build folder structure.

Another preparation for using a kernel from sstate-cache is to persist
the linux_comp variable in a file next to the linux.bin file rather than
using a global shell variable.

This change also requires to adapt the kernel-uimage.bbclass
accordingly. This change also fixes a minor detail:
the kernel-uimage.bbclass used ${ instead of $ for evaluatiing a local
shell variable.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-uboot.bbclass  | 40 ++++++++++++++---------
 meta/classes-recipe/kernel-uimage.bbclass |  3 +-
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index 6d4aff6b11b..d2a63524ece 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -12,19 +12,27 @@ FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
 UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
 
 uboot_prep_kimage() {
-	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
+	output_dir=$1
+	# For backward compatibility with kernel-fitimage.bbclass and kernel-uboot.bbclass
+	# support calling without parameter as well
+	if [ -z "$output_dir" ]; then
+		output_dir='.'
+	fi
+
+	linux_bin=$output_dir/linux.bin
+	if [ -e "arch/${ARCH}/boot/compressed/vmlinux" ]; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
-	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
-		rm -f linux.bin
-		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
+	elif [ -e "arch/${ARCH}/boot/vmlinuz.bin" ]; then
+		rm -f "$linux_bin"
+		cp -l "arch/${ARCH}/boot/vmlinuz.bin" "$linux_bin"
 		vmlinux_path=""
 		linux_suffix=""
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
-		# Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
+		# Use vmlinux.initramfs for $linux_bin when INITRAMFS_IMAGE_BUNDLE set
 		# As per the implementation in kernel.bbclass.
 		# See do_bundle_initramfs function
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ] && [ -e vmlinux.initramfs ]; then
@@ -34,18 +42,18 @@ uboot_prep_kimage() {
 		linux_comp="${FIT_KERNEL_COMP_ALG}"
 	fi
 
-	[ -n "${vmlinux_path}" ] && ${KERNEL_OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
+	[ -n "$vmlinux_path" ] && ${KERNEL_OBJCOPY} -O binary -R .note -R .comment -S "$vmlinux_path" "$linux_bin"
 
-	if [ "${linux_comp}" != "none" ] ; then
-		if [ "${linux_comp}" = "gzip" ] ; then
-			gzip -9 linux.bin
-		elif [ "${linux_comp}" = "lzo" ] ; then
-			lzop -9 linux.bin
-		elif [ "${linux_comp}" = "lzma" ] ; then
-			xz --format=lzma -f -6 linux.bin
+	if [ "$linux_comp" != "none" ] ; then
+		if [ "$linux_comp" = "gzip" ] ; then
+			gzip -9 "$linux_bin"
+		elif [ "$linux_comp" = "lzo" ] ; then
+			lzop -9 "$linux_bin"
+		elif [ "$linux_comp" = "lzma" ] ; then
+			xz --format=lzma -f -6 "$linux_bin"
 		fi
-		mv -f "linux.bin${linux_suffix}" linux.bin
+		mv -f "$linux_bin$linux_suffix" "$linux_bin"
 	fi
 
-	echo "${linux_comp}"
-}
+	printf "$linux_comp" > "$output_dir/linux_comp"
+}
\ No newline at end of file
diff --git a/meta/classes-recipe/kernel-uimage.bbclass b/meta/classes-recipe/kernel-uimage.bbclass
index 1a599e656c8..e353232a0e9 100644
--- a/meta/classes-recipe/kernel-uimage.bbclass
+++ b/meta/classes-recipe/kernel-uimage.bbclass
@@ -29,6 +29,7 @@ python __anonymous () {
 do_uboot_mkimage[dirs] += "${B}"
 do_uboot_mkimage() {
 	uboot_prep_kimage
+	linux_comp="$(cat linux_comp)"
 
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -36,6 +37,6 @@ do_uboot_mkimage() {
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "$linux_comp" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
 	rm -f linux.bin
 }
-- 
2.49.0


