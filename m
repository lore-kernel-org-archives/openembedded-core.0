Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F62C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:28:03 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24224.1784644074765876339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=WrQScFQ4;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=sM1nkqu890Vz+6Khs2JMIka9hthByF9Qx7b4fz3gRco=; b=WrQScFQ4IKoIRQEr85uJ0rWfGy
	aQl/S5rh5bcOnY7brrPie7kO07iHSztACV5bD/87ffBw0JPatrpg+E6ZA7sQnbhU44+UbaGfVPGXk
	WSzn1pacW6xPR0uSsFkY8zPInGB/MwOKMs09UskV2a5DRLmQglqIHGuWKYK8jKPpvN5F7WAG+kPju
	benq2DcLwZPEVj8iDM04nzWoVwyfMxvo3EW9KS/IrzK0XQMHoMv3NYJuQRfVvwhONSt1ysL2x8Whu
	LbHoUPfGPHgmJfs+6eBQTLdo0C2r+9FUqcQq0+Fj33VqRGmghwHFQcrkAulXuHpC9YxQJCcl47A/L
	cXv0kmFA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmBRo-000ADj-2q;
	Tue, 21 Jul 2026 16:27:52 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wmBRo-000DBE-2b;
	Tue, 21 Jul 2026 16:27:52 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH] kernel-uboot: drop FIT_KERNEL_COMP_ALG_EXTENSION
Date: Tue, 21 Jul 2026 16:27:35 +0200
Message-ID: <20260721142735.3803979-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28067/Tue Jul 21 08:23:56 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241539

Supported values for FIT_KERNEL_COMP_ALG are hardcoded, and we can
always derive the resulting extension from the used compression tool.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/kernel-uboot.bbclass | 24 +++++++++++-------------
 meta/lib/oeqa/selftest/cases/fitimage.py |  1 -
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index 62974baaf0..fa28be1715 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -6,7 +6,6 @@
 
 # fitImage kernel compression algorithm
 FIT_KERNEL_COMP_ALG ?= "gzip"
-FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
 
 # Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
 UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
@@ -22,13 +21,11 @@ uboot_prep_kimage() {
 	linux_bin=$output_dir/linux.bin
 	if [ -e "arch/${ARCH}/boot/compressed/vmlinux" ]; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
-		linux_suffix=""
 		linux_comp="none"
 	elif [ -e "arch/${ARCH}/boot/vmlinuz.bin" ]; then
 		rm -f "$linux_bin"
 		cp -l "arch/${ARCH}/boot/vmlinuz.bin" "$linux_bin"
 		vmlinux_path=""
-		linux_suffix=""
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
@@ -38,21 +35,22 @@ uboot_prep_kimage() {
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ] && [ -e vmlinux.initramfs ]; then
 			vmlinux_path="vmlinux.initramfs"
 		fi
-		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
 		linux_comp="${FIT_KERNEL_COMP_ALG}"
 	fi
 
 	[ -n "$vmlinux_path" ] && ${KERNEL_OBJCOPY} -O binary -R .note -R .comment -S "$vmlinux_path" "$linux_bin"
 
-	if [ "$linux_comp" != "none" ] ; then
-		if [ "$linux_comp" = "gzip" ] ; then
-			gzip -9 "$linux_bin"
-		elif [ "$linux_comp" = "lzo" ] ; then
-			lzop -9 "$linux_bin"
-		elif [ "$linux_comp" = "lzma" ] ; then
-			xz --format=lzma -f -6 "$linux_bin"
-		fi
-		mv -f "$linux_bin$linux_suffix" "$linux_bin"
+	if [ "$linux_comp" = "gzip" ] ; then
+		gzip -9 "$linux_bin"
+		mv -f "$linux_bin.gz" "$linux_bin"
+	elif [ "$linux_comp" = "lzo" ] ; then
+		lzop -9 "$linux_bin"
+		mv -f "$linux_bin.lzo" "$linux_bin"
+	elif [ "$linux_comp" = "lzma" ] ; then
+		xz --format=lzma -f -6 "$linux_bin"
+		mv -f "$linux_bin.lzma" "$linux_bin"
+	elif [ "$linux_comp" != "none" ] ; then
+		bbfatal "Unsupported FIT_KERNEL_COMP_ALG '$linux_comp'"
 	fi
 
 	printf "$linux_comp" > "$output_dir/linux_comp"
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index b3c54cebed..451878aafd 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1525,7 +1525,6 @@ class FitImagePyTests(KernelFitImageBase):
             'INITRAMFS_IMAGE_BUNDLE': "",
             # kernel-uboot.bbclass
             'FIT_KERNEL_COMP_ALG': "gzip",
-            'FIT_KERNEL_COMP_ALG_EXTENSION': ".gz",
             'UBOOT_MKIMAGE_KERNEL_TYPE': "kernel",
             # uboot-config.bbclass
             'UBOOT_MKIMAGE_DTCOPTS': "",
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


