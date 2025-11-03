Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F81CCFA04
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:37 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2246.1762203574352588448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1lFNQYUT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34029cd0cbdso4570006a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203574; x=1762808374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGvCKDoNBy3QOXCjC11M38+pZzutqdle4zV/UT4oXrw=;
        b=1lFNQYUTbp53y1D4NOGfGCwj3ErqDKASXL0sWYHxu7jF/DRE5YI6p5WEIkAHEV3niW
         EqNLvG0XFHhF1n/hs0AsRvgX/4VHJhfQBxFq+QWBNdksifhreSu4MW8BSRN44tMiSDcY
         yp+ACrOR1Y+RGHGPPJHM5eu74LWuzd0P/FhXJwHeCn3RYGYIuUEnDGybnQoGuDhVJOrY
         xS39zfwr/NMk5xt/2rKIDCBiOjsSi+yTsMvc5K3+plwtpM4GO/e2N4tREi0MhderGUeM
         Lg21wQUzmCIr+fMfYC+nkm2HNc7aLkDghMDI2C8J6oLRiFSiEvw4b1NkGoofog4ipdin
         uIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203574; x=1762808374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGvCKDoNBy3QOXCjC11M38+pZzutqdle4zV/UT4oXrw=;
        b=E5EWWb/SUY9VqkEmT+GCCJ8D5zWz/U/+feYRbDzZuRx5NqNxfvzzV6eUE/bzVXbxlW
         Ld954tyACqb6Cbz87lL2xnjBZd6FO4TS9pdl38gs87DKhgZsWRbQYd0pDW2COUz7xlAB
         u5cThJUwus68EWKrOQ53xrnWN5zOtmUZTY1o00Wy5iIvDmvKHGmrpqzkByKbMJBsO9eR
         I6HG0XXZJ7HMFp95IQFcBtXRlFxsuAIGZHXNL2drQC8uFyVkyftZFGptGVH9mZyIelr+
         Ava4Q3J4IGz+cqeRSvF5Bb5339X38yBzGGO03YXKNIPRDY8YNWJ6MwDvd9op2Xp+TRnc
         5/Eg==
X-Gm-Message-State: AOJu0YyM+vQ8L6gB6uXHgmLt9NpDfuh6h4ZPe1AfbUk7O6kBn5Einlbf
	puSuieD6cZVfS8/mqPQi/u1hYFAWC9onFY7nH32aaBcOwQUCpRLllGhKMAaUj4/SmqA+XNk5NGC
	f/hQZVxQ=
X-Gm-Gg: ASbGncumNquOIYmMVnemmk+D9FOAacoq+v4IF/kv4I2nvQzqPabYnxPCeSCT2biCWPG
	War9958eb3EHsTepGBG5s9879bGCHfi0NWN7ekA8KP9Yvcxmbqjhq0gDJXqvcw79L+19rAyfHVT
	IfxCHQqvAEJXwoZbJpmQubGrfVLDSqEdnSI1xok9wE4+WTI+bbO4f6Elkqk5D4kr7Fz2MWWyGRd
	wq0XINcrabEr8aKPGBhxU2oArmYkYZNHDqM+DD4GKQngoBTYS5DJmZT0nTl7SPac/O9dTpZliMZ
	ZX1zg4oj6eRUx1vxU1n134BTCSgOBxGfGsQXRSOqj/Q9YG/yFr1bfLcXA5VU4v7/FSm1PlsNzpj
	K56fWexfYCT60VXT9Cv5PYJRAs/OqcBpKgK7YExR2xkycfsgWtRUtrKkKYlVLJSA8Okw=
X-Google-Smtp-Source: AGHT+IHqGlLVzpD4OoUOECQFTTAsOvFBCChmFmDQCQNgWKGPsP8XDwrDlf5/X2vVK+LuZQqSd+FVLQ==
X-Received: by 2002:a17:90b:258c:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-3416164d3d3mr2178373a91.3.1762203573641;
        Mon, 03 Nov 2025 12:59:33 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] binutils: patch CVE-2025-11412
Date: Mon,  3 Nov 2025 12:59:11 -0800
Message-ID: <9130f3471f4814979cfdfa66ca118929f240cb30.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225700

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

(From OE-Core rev: 6b94ff6c584a31d2b1e06d1e1dc19392d759b4b7)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/binutils/CVE-2025-11412.patch    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index ade69881a1..39f2827f78 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -84,5 +84,6 @@ SRC_URI = "\
      file://0045-CVE-2025-11083.patch \
      file://0046-CVE-2025-11081.patch \
      file://0047-CVE-2025-8225.patch \
+     file://CVE-2025-11412.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
new file mode 100644
index 0000000000..19a630b863
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
@@ -0,0 +1,35 @@
+From 047435dd988a3975d40c6626a8f739a0b2e154bc Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 25 Sep 2025 08:22:24 +0930
+Subject: [PATCH] PR 33452 SEGV in bfd_elf_gc_record_vtentry
+
+Limit addends on vtentry relocs, otherwise ld might attempt to
+allocate a stupidly large array.  This also fixes the expression
+overflow leading to pr33452.  A vtable of 33M entries on a 64-bit
+host is surely large enough, especially considering that VTINHERIT
+and VTENTRY relocations are to support -fvtable-gc that disappeared
+from gcc over 20 years ago.
+
+	PR ld/33452
+	* elflink.c (bfd_elf_gc_record_vtentry): Sanity check addend.
+
+CVE: CVE-2025-11412
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=047435dd988a3975d40c6626a8f739a0b2e154bc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elflink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 54f0d6e957e..0a0456177c2 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14407,7 +14407,7 @@ bfd_elf_gc_record_vtentry (bfd *abfd, asection *sec,
+   const struct elf_backend_data *bed = get_elf_backend_data (abfd);
+   unsigned int log_file_align = bed->s->log_file_align;
+ 
+-  if (!h)
++  if (!h || addend > 1u << 28)
+     {
+       /* xgettext:c-format */
+       _bfd_error_handler (_("%pB: section '%pA': corrupt VTENTRY entry"),
-- 
2.43.0


