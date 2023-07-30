Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E68EB64DD
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 21:38:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.81853.1690753112019366438
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 14:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fGMGLjx+;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bbdc05a93bso22881255ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690753111; x=1691357911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKYjUcNpOm/mxfVzR4jRPoX17/uiUnIaDJ5IxRVaRRw=;
        b=fGMGLjx+UQONFBh8QCTsuwInN2zI04k0cnu7E9hnHdyvA4gG2lOfQLA8lb1mEzx6ry
         eeLB7b9NdZtwHMR6GA96O9D34ccomzqO6LwNfhoS6IbdQZlTFx8Yr5whqt3+EzAfeP6c
         zqNNLQeokMN10mCANtWMaVAzyHvhzqLN04WcLIvYK7Lw1wbTTKP4qLblD/KgWQTYlfFn
         m/BkzRaW5RF08yv0/2ho+zK37CELfkkOZ3IF6hWmRbsBctsvEhH95p3L9FNW0Lx+RzUl
         0aS9VLzYtcGqcWQowPjrnq3qWtm5jJfrQiCtWTA8BD60IZxLX0qNfAaiXkpWuq0010uH
         EtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690753111; x=1691357911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKYjUcNpOm/mxfVzR4jRPoX17/uiUnIaDJ5IxRVaRRw=;
        b=XkvhjXL21Ead6m89ZVxRZOr+BHs3zq0+Rj88RGVWXq3rY1wbeSWnQNamrHUZjrnFYC
         PBBbBx2CFsGxvKvTQTNxwW6tNVp5cZwk6UTZnsQ6yw2Q1jkWtJX8yFymQrwn5bUTfya6
         hh9UAtydhE+wUSA2gYWOygTq+Z7kvKj7iHP3ikY9PlzPl/OpdEOUfiipLE9n1qUiBskq
         DLbLLsquNiAm/VtcQdq6MDC5zPm05x8cmcRozx5I0LGJyU+LGtL+FGmYM3MIzfas1mU0
         b8/e1KbppxjeyRWvZabCaFgr16igMq+RsxGP+5i+1o8z64Mq8MeW06fO7jJIMXKlI3up
         TaIQ==
X-Gm-Message-State: ABy/qLZKwDrK16hkIh4pvyqEmJtDT+C9+2bSwb7fLroHwfXcWhah1HGM
	7YrnYZ1WSWsbv2SAw6PoQtw0qsEO3MKFcg==
X-Google-Smtp-Source: APBJJlH0vJ3u7oLALK3xKxAEZ4Oc7lZh3SHYZljF1YzQ5VoSwQdHjOALArVcWCT0C6VYPTb3JmHKYA==
X-Received: by 2002:a17:903:228a:b0:1b8:b382:f6c3 with SMTP id b10-20020a170903228a00b001b8b382f6c3mr7316482plh.13.1690753111089;
        Sun, 30 Jul 2023 14:38:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::8c80])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ee8200b001b04c2023e3sm7027395pld.218.2023.07.30.14.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 14:38:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gnu-efi: Fix build break on riscv64
Date: Sun, 30 Jul 2023 14:38:28 -0700
Message-ID: <20230730213828.3420458-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 21:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185114

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-riscv64-adjust-type-definitions.patch | 34 +++++++++++++++++++
 .../0001-riscv64-ignore-unknown-relocs.patch  | 32 +++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb    |  2 ++
 3 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch
new file mode 100644
index 00000000000..3475606264e
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-adjust-type-definitions.patch
@@ -0,0 +1,34 @@
+From 1de509497826faa0ad84b82f5e2c3d21ee613459 Mon Sep 17 00:00:00 2001
+From: Moody Liu <mooodyhunter@outlook.com>
+Date: Sat, 13 May 2023 17:39:16 +0100
+Subject: [PATCH] riscv64: adjust type definitions
+
+CHAR8 needs to be defined while BOOLEAN should be removed
+here to prevent typedef conflicts
+
+Upstream-Status: Backport [https://sourceforge.net/p/gnu-efi/code/ci/1de509497826faa0ad84b82f5e2c3d21ee613459/]
+Signed-off-by: Moody Liu <mooodyhunter@outlook.com>
+---
+ inc/riscv64/efibind.h | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/inc/riscv64/efibind.h b/inc/riscv64/efibind.h
+index 4fdf81d..d8b4f39 100644
+--- a/inc/riscv64/efibind.h
++++ b/inc/riscv64/efibind.h
+@@ -32,11 +32,9 @@ typedef uint16_t                UINT16;
+ typedef int16_t                 INT16;
+ typedef uint8_t                 UINT8;
+ typedef int8_t                  INT8;
++typedef char                    CHAR8;
+ typedef wchar_t                 CHAR16;
+ #define WCHAR                   CHAR16
+-#ifndef BOOLEAN
+-typedef uint8_t                 BOOLEAN;
+-#endif
+ #undef VOID
+ typedef void                    VOID;
+ typedef int64_t                 INTN;
+-- 
+2.41.0
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch
new file mode 100644
index 00000000000..5b3c152c5e0
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-riscv64-ignore-unknown-relocs.patch
@@ -0,0 +1,32 @@
+From 708f66acfec9a86f237726d45095cbd380fd83ca Mon Sep 17 00:00:00 2001
+From: Callum Farmer <gmbr3@opensuse.org>
+Date: Wed, 21 Jun 2023 11:32:28 +0100
+Subject: [PATCH] riscv64: ignore unknown relocs
+
+Sometimes ld emits relocs such as R_RISCV_64 for unwind symbols
+these don't need to be handled yet so just can be skipped otherwise
+the binary will never load
+
+Upstream-Status: Backport [https://sourceforge.net/p/gnu-efi/code/ci/708f66acfec9a86f237726d45095cbd380fd83ca/]
+Signed-off-by: Callum Farmer <gmbr3@opensuse.org>
+---
+ gnuefi/reloc_riscv64.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gnuefi/reloc_riscv64.c b/gnuefi/reloc_riscv64.c
+index 0b02d83..e429602 100644
+--- a/gnuefi/reloc_riscv64.c
++++ b/gnuefi/reloc_riscv64.c
+@@ -81,8 +81,7 @@ EFI_STATUS EFIAPI _relocate(long ldbase, Elf_Dyn *dyn)
+ 			*addr = ldbase + rel->r_addend;
+ 			break;
+ 		default:
+-			/* Panic */
+-			while (1) ;
++				break;
+ 		}
+ 		rel = (Elf_Rela *)((char *)rel + relent);
+ 		relsz -= relent;
+-- 
+2.41.0
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
index 547c469d19f..d37d638e097 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.17.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
+           file://0001-riscv64-adjust-type-definitions.patch \
+           file://0001-riscv64-ignore-unknown-relocs.patch \
            "
 
 SRC_URI[sha256sum] = "7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4"
-- 
2.41.0


