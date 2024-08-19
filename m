Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189A3C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:22:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.213487.1724080928680798225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NksCiWB3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42816ca797fso36320985e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724080927; x=1724685727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWlKp6oE7NKmNWSnBHLyptMjfMOa+gQBgdxYK8BopFE=;
        b=NksCiWB30hPM/ARw6fPkXbzD8mUSi+n+ze2vjYotJ57mdICbEI2w9UDOkxLq0UOwtZ
         PyPhH1yqCFvyH6j5XvL1cVAjnVntUZC13cWotLTN2ytTbY2FAkfLZ/xI8s5TpMyy9lCM
         pzkJrmjXAn+ucU7XomXzmR9QCbtSuTqgc1Ysd3Lse8Pkgk2xQKl6SdhRDvGpSFmNTnz/
         rT8i56/Cyw5LnZluvMzPg+LmSFaxRXg2g91JOJaFod8fDFYDI3h+APBZRjbWY9tdK62d
         LaHuop1L1/bySXfOYokhZY5Bxe/I601CI/KQh6uY44r7pGRZtNa2JVFYL2Q66Zc3I1JD
         JB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080927; x=1724685727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWlKp6oE7NKmNWSnBHLyptMjfMOa+gQBgdxYK8BopFE=;
        b=hp403u/m0QVCQtsx4JhHeaoMtUfyl3OAqBUndrhgWnEVnwthGqKaE7/d9cG/uCG6Uu
         fayI67n5euJ5e9gMfM4cMlzoe6oe/CDFoVvpiSYkyT/naHULDM9RoT0uYwH9Ki0Geqb8
         sKa42xpTq/9FxQkcjfngW8kTI9GUxhUapelAscAR0Hfh9otgXLlxUpVWIKM5RyuVdI6s
         dKCW1/q8R5WFBMHsDQhQTHcIOLBKSJ0O1uqohEZLiDGn6GoRlfAgWgsJ0cfyn+q/U46p
         +zmPX0rfO0jLRg0fobPLQSnAAUnqsBpL4nm7FLXKZTjSE2Fe3lqi1UXJEyN0dJWRU/LM
         C57Q==
X-Gm-Message-State: AOJu0Yyu0Z/Xc4/ASqYgdVJftvMtWBYw5n6ESx9MoC7LG8nSG1nTd4iV
	Uc4qj8NlOZWUKrWpDahXsjHIYT+DWhKz4YO+4a5sEqXlolgA1a1A47+s2Q==
X-Google-Smtp-Source: AGHT+IFH8bAEfSgDVGrBu8/IkDbiSRP9vBMzFQKYTZMEIBNal0aQMgb+9KM93C5TA4k3TUxPwJmFIA==
X-Received: by 2002:adf:ce8e:0:b0:371:8e30:290 with SMTP id ffacd0b85a97d-3719443ecc1mr6205578f8f.21.1724080926378;
        Mon, 19 Aug 2024 08:22:06 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm10782649f8f.54.2024.08.19.08.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 08:22:05 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] kernel: refactor linux compression
Date: Mon, 19 Aug 2024 17:17:05 +0200
Message-ID: <20240819152136.1185744-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819152136.1185744-1-adrian.freihofer@gmail.com>
References: <20240819152136.1185744-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 15:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203511

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


