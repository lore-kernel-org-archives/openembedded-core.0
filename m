Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86857C64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 21:18:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1755.1677187090772932176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 13:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQLoFjZf;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id il18-20020a17090b165200b0023127b2d602so654711pjb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yoNHYJVIu3hLc+phap95OjqK8FYjO2kNaxlacGhq48c=;
        b=QQLoFjZfE1OC43bd9KA7Ivi3G0JQK1AoRvMIbMgGKxFvxbkTn6bjVrKgXRu/ZgABXa
         2aUuyrDN2IdMDVk072ViIjw4edORUyVSniXzRo5tUsk/lUePdbvrtxzkvdx97u6iMUDy
         P4i5UiVd8jAD/eM/4ADzo13/0k67G0CmDG67H0NfhsPAfuFK/6aZ8t0+yYgDUAFDWhzX
         ITxN7J8tBDK8E6ZAnCq875qbZdzsY1Bxfj643WOExW4P5isqYwGALZq4lqvLk/XK8I8D
         Q43PIJOhnaIGx/jjuuhgShjC28BmqNGHSrhgwDsPu1MyV3jnQaP+XrLjgcWGo2tWr8mM
         SQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoNHYJVIu3hLc+phap95OjqK8FYjO2kNaxlacGhq48c=;
        b=mR22GF0gi6xIpxV6nZSQJLhTytacszXPNtqZOA6/rIPk6/tR+5EgBTO3NE3yHP9ffw
         Cz2Ot1gjpcPp2Nn9hrCbuw6WkUDrnnphTV5BbFgykfDY9UERV3itEadHMMRPXHr0Eqho
         6xaPHgWZH5smO2r2mkqoY5NSF+z6tpvgKOSzkMJ5pk0uSjpjr0PGh4en6dqXWRQlFZcD
         aFEuKo5fhbztbaEzl0hxDSjiZpssmDTGjuhfby/c2Zu21gXMxwtQ7NgU8Djf30OM6FbF
         9r3J0uI316Xf1dNsymLOCLGWwz0fdLOWBCx+Y8arQSCFLHmeNvZIC82Iy0M96/4hpGH/
         5/og==
X-Gm-Message-State: AO0yUKXTY0B0behnUgfV0bJd3YSRPfe7sZNPEsFSF+K5ScY5Q6kDvMpc
	BIIr9LRJwP3+W1MqXQWLLgqoSXrdVqw=
X-Google-Smtp-Source: AK7set9wmGVFHNlnmsjpBH8PN3Q2AOqIR3u3+0qLyMl2aFklXa/CRX/YJIVbqtWHgf12roVNr5tlhw==
X-Received: by 2002:a05:6a20:3d81:b0:be:da1c:df65 with SMTP id s1-20020a056a203d8100b000beda1cdf65mr15439293pzi.28.1677187089784;
        Thu, 23 Feb 2023 13:18:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id i26-20020aa78b5a000000b00586fbbdf6e4sm2338024pfd.34.2023.02.23.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:18:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] grub: Handle R_RISCV_CALL_PLT reloc
Date: Thu, 23 Feb 2023 13:18:06 -0800
Message-Id: <20230223211806.3558442-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 21:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177631

These are new in binutils 2.40+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch | 48 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch

diff --git a/meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch b/meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch
new file mode 100644
index 0000000000..f3f12b6f0e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch
@@ -0,0 +1,48 @@
+From 64be669638e198bc0c7c1a344547265dfacd2470 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jan 2023 15:29:02 -0800
+Subject: [PATCH] risc-v: Handle R_RISCV_CALL_PLT reloc
+
+GNU assembler starting 2.40 release always generates R_RISCV_CALL_PLT
+reloc for call in assembler [1], similarly llvm does not make
+distinction between R_RISCV_CALL_PLT and R_RISCV_CALL [2]
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/grub-devel/2023-02/msg00143.html]
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=70f35d72ef04cd23771875c1661c9975044a749c
+[2] https://reviews.llvm.org/D132530
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ grub-core/kern/riscv/dl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/grub-core/kern/riscv/dl.c
++++ b/grub-core/kern/riscv/dl.c
+@@ -188,6 +188,7 @@ grub_arch_dl_relocate_symbols (grub_dl_t
+ 	  break;
+ 
+ 	case R_RISCV_CALL:
++	case R_RISCV_CALL_PLT:
+ 	  {
+ 	    grub_uint32_t *abs_place = place;
+ 	    grub_ssize_t off = sym_addr - (grub_addr_t) place;
+--- a/util/grub-mkimagexx.c
++++ b/util/grub-mkimagexx.c
+@@ -1294,6 +1294,7 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, st
+ 		     }
+ 		     break;
+ 		   case R_RISCV_CALL:
++		   case R_RISCV_CALL_PLT:
+ 		     {
+ 		       grub_uint32_t hi20, lo12;
+ 
+@@ -1725,6 +1726,7 @@ translate_relocation_pe (struct translat
+ 	case R_RISCV_BRANCH:
+ 	case R_RISCV_JAL:
+ 	case R_RISCV_CALL:
++	case R_RISCV_CALL_PLT:
+ 	case R_RISCV_PCREL_HI20:
+ 	case R_RISCV_PCREL_LO12_I:
+ 	case R_RISCV_PCREL_LO12_S:
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bf7aba6b1c..b92cbc2654 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -40,6 +40,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
            file://CVE-2022-2601.patch \
            file://CVE-2022-3775.patch \
+           file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.39.2


