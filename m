Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFB9C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 21:15:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.57869.1723497301852059218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 14:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULTEueWu;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso518891566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723497300; x=1724102100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWlKp6oE7NKmNWSnBHLyptMjfMOa+gQBgdxYK8BopFE=;
        b=ULTEueWuocrAxN14YAEGx5zW0+5udNq/ez6kwAPzuCug5RJJ0iEDSbnwYf61x3N+Tr
         e5oPSFcXOAVOWHvdPYLCTw9ANEFPAqlcBuFCb7CC17csiCK1qRO/Eq8grU54YyJZyLQ5
         yJDdwSQ+P+t73EsnRX+4Jo7Dfj+J7+4Z2EAiubWbATr7QwFGMzhd3eZHWGU9FTwO440o
         dub17dtyHdWX1BAAgEoctt+G4y+e1y6Aiy3UtVAngoq9kVebJqY2u6Eh1LEHXQF25ovm
         lZvXMybc9f2cYiwy97MzSBBeidLOox/qvRoae85c4Uquz9VoaBuKU4OtFqO2p0402Q+I
         nJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723497300; x=1724102100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWlKp6oE7NKmNWSnBHLyptMjfMOa+gQBgdxYK8BopFE=;
        b=eDb3/57CqGvHy8Nm2NGL+tyHXHSgp6m6F9mvKyb8cyURMINDTixWQRUo9f0mBcNNnf
         wIjqAmpVoJ24nJKHUO/Pk86AVC6yDJcSPY2gKcdua+KlL5zYNXRWWBtdC2HG6sGduvxB
         3ch8xl6yrVEMqBhI3pBbD6TOow+WOb1Dna9DPwscy7CAsgBKrtrHwO69zbQVOthT9Lpi
         X/L3sWA3irmGC3rL0DS0gsQ3OEQk1Jzz4VQyoMvkMOT0lVtL+ulySQszKLtMANcqdViq
         2MKBFrJ6NoH8JJ7RWFC08AOvaTgKcMce9yfm+k/T1w1q990LyjQvNm+YSKAkiKr6MMPf
         VTRg==
X-Gm-Message-State: AOJu0YxQneq+eV3M/oRT89M8Cgf9kkEsBlGnuOgK7ZePjTBqg7BtOvTY
	IvJZIGqHTKMwRrultQD8up8jZoG8aLy1NeEnJ+TgkzmqtWOtF1/0cdru1w==
X-Google-Smtp-Source: AGHT+IFUEU9oZKBBRV4++66f/3aSWsJ1vxIHN63Od3I27bMG36drThnyuQVAIlyEYQ9nT0q8TyIvbg==
X-Received: by 2002:a17:907:f753:b0:a7a:9954:1fc1 with SMTP id a640c23a62f3a-a80ed1d69edmr114858366b.24.1723497299586;
        Mon, 12 Aug 2024 14:14:59 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fb069dsm10828366b.80.2024.08.12.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 14:14:59 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] kernel: refactor linux compression
Date: Mon, 12 Aug 2024 23:12:54 +0200
Message-ID: <20240812211437.2736977-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812211437.2736977-1-adrian.freihofer@gmail.com>
References: <20240812211437.2736977-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 21:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203236

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a step to avoid unecessary kernel rebuilds when the initramfs
changes but not the kernel itself. In case of an unbundled fitImage the
kernel should be staged in the sstate instead of re-compiled.

The uboot_prep_kimage function generates the kernel binary which gets
included into the fitImage. It also defines the variable linux_comp
which is used by the fitimage_assemble function later on.
To make the fitimage_assemble function working with kernel binaries from
sstate it must be decoupled from calling uboot_prep_kimage in ${B} by:
- refactoring uboot_prep_kimage to write the result into files
  (linux.bin, linux.comp).
- calling the uboot_prep_kimage before the artifacts are used or cached.
- refactoring the fitimage_assemble function to use files rather than
  calling the uboot_prep_kimage function which depends on ${B}.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 5 ++---
 meta/classes-recipe/kernel-uboot.bbclass    | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 67c98adb232..02b5fd8e3f5 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -579,9 +579,7 @@ fitimage_assemble() {
 	# Step 1: Prepare a kernel image section.
 	#
 	fitimage_emit_section_maint $1 imagestart
-
-	uboot_prep_kimage
-	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
+	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$(cat linux.comp)"
 
 	#
 	# Step 2: Prepare a DTB image section
@@ -764,6 +762,7 @@ fitimage_assemble() {
 do_assemble_fitimage() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
+		uboot_prep_kimage
 		fitimage_assemble fit-image.its fitImage-none ""
 		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 			ln -sf fitImage-none ${B}/${KERNEL_OUTPUT_DIR}/fitImage
diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
index 30a85ccc287..50be7962d46 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -45,5 +45,6 @@ uboot_prep_kimage() {
 		mv -f "linux.bin${linux_suffix}" linux.bin
 	fi
 
+	[ -n "${vmlinux_path}" ] && echo "${linux_comp}" > linux.comp
 	echo "${linux_comp}"
 }
-- 
2.46.0


