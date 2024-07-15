Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F51C3DA63
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.38953.1721052910555333495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NatWjXEx;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-367a3d1a378so3924808f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052909; x=1721657709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGefg8w4IbAc+E6hYrQxSik/7W1Mw21dGCSfSNyKWVs=;
        b=NatWjXEx6q2EC0SZz/lt5CU2N6NPj86wfkyc0AqYgVT481STOPf32o+VM40ow00pgu
         OO+5ffgjaoLUJQJjR8Sw54b2Z77/fqUgZ9hgQghpFZ2Bwa/DJ0p6fCYnIhzwA1NzEfAy
         Jdv5JrqOxe6utIXssalxApOVAXiPWHowq8mvIL4Grh5ddjUicvQzHu+dhyOzotkldlOK
         oK+s67AVd1EgCVysuuh3HCsOKOIGlEgiv9CesZKNHUmDICZt8j0ZmYKpdHt0lU0udQG0
         WNXNzatBxmWpmCT6A50zhQfRYZv6F6cDuTwLPHOslF8qAbQVAHj3KX7yKsELhiEBU6Lz
         XRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052909; x=1721657709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGefg8w4IbAc+E6hYrQxSik/7W1Mw21dGCSfSNyKWVs=;
        b=sSANOuWMpFlLarxuk2OxJj9d9Ajtw6s0Caz+9jNeLPIiE8oEmyXlbyrxNW+Zp4NocJ
         lrNYTCZVrU+uBbl6xTxxTzmjqC7G+ikI1pxNFEsxMMwoj0NpWL/ubmKERel3bSFLNGBA
         2J56q4YwDH7ZcpretPiDonVUXEkBgtuAKWOtbYIhA4kSxlnBXy1HI8hZO5+uMo+AZBjX
         Ub2JgItnpP8iNQdnkQJo8BvUMWdLpcnVyL7/P66avjOnqjG4NZnnmdglgF5fME2td00n
         UB6I5w1VLo3TYAPYv52j/Q4qzYKbUpRth4lJo19NMNF9rxMCN4Lx0DHbA9Z/tyWaQ0a4
         ob9A==
X-Gm-Message-State: AOJu0Yyw3qA3ahShr79WX2F0KpBwrlIWrD13zQif9rBvTkI/ZjMwarI0
	y8tJyjDrQQCFINFmXM/D+3xPWpSQVewO/p7kAlx7Bl5s/OOU82ADH1lTIg==
X-Google-Smtp-Source: AGHT+IFEXTclvCpCmV7374tAlUS7x2572xEFkoYEDE17w1lNKzq56XbVA2/g+r4K387fr3fIl001Ng==
X-Received: by 2002:adf:e683:0:b0:367:8fc3:a25f with SMTP id ffacd0b85a97d-367cea96453mr15555027f8f.37.1721052908708;
        Mon, 15 Jul 2024 07:15:08 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbddsm6499074f8f.64.2024.07.15.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:15:08 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/6] kernel: refactor linux compression
Date: Mon, 15 Jul 2024 16:10:40 +0200
Message-ID: <20240715141448.2158477-4-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201929

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
2.45.2


