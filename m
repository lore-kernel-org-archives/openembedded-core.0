Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.1077.1611991203352565623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 23:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aJ8QSzDf;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id b8so6701455plh.12
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 23:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q585fxHoK6hrKdNDl4IwZMWXLUFel0VdnJxLv1FflvM=;
        b=aJ8QSzDfyZxqRWgQUNktK/zK5zz8EilWYWTRhGqQWvvR0ZFL3MMTiLMXDYBo7E88LC
         AnbsHnpkR9gM7npFgnjWzgcQJmj/0vVrlLcQeHdqhGoSwBTm7FaECdrB4m1Z9M4/5/PY
         2phRyvsUas/aoZqlJn5rznX8MqIFTOzk4B/u9qkJ4u2P80n0+QKCI67HR4toLFonAMKZ
         Z07CQJ5gmasKfcG5Y89aUcGVQqgAmJ6i4mqfxSNUns2A3/BplOTfIvdPBzlQMyf7eM2S
         Mrsa76uRm59WGpEW7YczHRw9o5O6wOIhZwnEJP9oMxegQVcsB0k36JK/semsY5O3MTzR
         KdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q585fxHoK6hrKdNDl4IwZMWXLUFel0VdnJxLv1FflvM=;
        b=dw3UNc+npes2IUBIgR9Jlhr73GOzRRFchALDGPjdjENlqJ4bZdyyuchLAVTX2+h31d
         jF0e7tO2iBkRhlI+/mhdbt19EoqF1tr3npPbhW/oJTSegjzxRq5qkF713XwQjsaqJAzZ
         8Yp//jArNcIq3C5Xkdo8gPOnme+QCf2izXkN5LiOKbWJsuPNS8Yt9kth0NhFTlHIlbJZ
         n/pnNgcgZgbftAe3lRIR4WtXuaM/BmJNBGD+OVxVs+czZj8jw/Ei9h451FDBBme4b91Z
         CNfAmpjbFBipTr9At/XnYHZyOPaA/IMDREQoR6Gar6WlcM1UdU1XRQJE87DO7z/1mEYe
         Ai4g==
X-Gm-Message-State: AOAM532ynsP9+EE87yW9QdFEPRRwMrunbdYhpLx/WGaTij/U/srQpVL6
	EK+zbfqDGOGXn3KorKkcUbJmWA9Z4ZbsLA==
X-Google-Smtp-Source: ABdhPJy7wry1bMc7E1hi854QXlMvNNJRCpfnZZLD6R/2QJl3Lpg6IbOLu26HT+L8oViec5pB7KwCVw==
X-Received: by 2002:a17:90a:ab94:: with SMTP id n20mr3446267pjq.96.1611991202580;
        Fri, 29 Jan 2021 23:20:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id m18sm10797221pfd.206.2021.01.29.23.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 23:20:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] musl: Drop adding .file directive in asm files
Date: Fri, 29 Jan 2021 23:19:54 -0800
Message-Id: <20210130071954.2695419-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210130071954.2695419-1-raj.khem@gmail.com>
References: <20210130071954.2695419-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it was a workaround for binutils issue which is fixed in 2.36 with

https://sourceware.org/bugzilla/show_bug.cgi?id=26822

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musl/0001-crt-Add-.file-directive.patch   | 245 ------------------
 meta/recipes-core/musl/musl_git.bb            |   1 -
 2 files changed, 246 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch

diff --git a/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch b/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
deleted file mode 100644
index 1cd08cdcd4..0000000000
--- a/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-From b0124f3c4f2a353506621d387135ebea6b8c6609 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Oct 2020 22:40:53 -0700
-Subject: [PATCH] crt: Add .file directive
-
-Musl linked binaries come out to be not reproducible because
-absolute build path is seen in debug info of crti.o and crtn.o
-This is due to the fact that these objects are built from assembly
-source files and they are missing .file directive
-if we add .file <filename>.s in them then debug info encodes this
-value instead of absolute path in debug_line section
-
-fixed in binutils 2.36 [1]
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=26822
-
-Upstream-Status: OE-Specific [ Drop when upgrading binutils 2.36+ ]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- crt/aarch64/crti.s    | 1 +
- crt/aarch64/crtn.s    | 1 +
- crt/arm/crti.s        | 1 +
- crt/arm/crtn.s        | 1 +
- crt/i386/crti.s       | 1 +
- crt/i386/crtn.s       | 1 +
- crt/microblaze/crti.s | 1 +
- crt/microblaze/crtn.s | 1 +
- crt/mips/crti.s       | 1 +
- crt/mips/crtn.s       | 1 +
- crt/mips64/crti.s     | 1 +
- crt/mips64/crtn.s     | 1 +
- crt/mipsn32/crti.s    | 1 +
- crt/mipsn32/crtn.s    | 1 +
- crt/or1k/crti.s       | 1 +
- crt/or1k/crtn.s       | 1 +
- crt/powerpc/crti.s    | 1 +
- crt/powerpc/crtn.s    | 1 +
- crt/powerpc64/crti.s  | 1 +
- crt/powerpc64/crtn.s  | 1 +
- crt/s390x/crti.s      | 1 +
- crt/s390x/crtn.s      | 1 +
- crt/sh/crti.s         | 1 +
- crt/sh/crtn.s         | 1 +
- crt/x32/crti.s        | 1 +
- crt/x32/crtn.s        | 1 +
- crt/x86_64/crti.s     | 1 +
- crt/x86_64/crtn.s     | 1 +
- 28 files changed, 28 insertions(+)
-
---- a/crt/aarch64/crti.s
-+++ b/crt/aarch64/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .global _init
- .type _init,%function
---- a/crt/aarch64/crtn.s
-+++ b/crt/aarch64/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- 	ldp x29,x30,[sp],#16
- 	ret
---- a/crt/arm/crti.s
-+++ b/crt/arm/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .syntax unified
- 
- .section .init
---- a/crt/arm/crtn.s
-+++ b/crt/arm/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .syntax unified
- 
- .section .init
---- a/crt/i386/crti.s
-+++ b/crt/i386/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .global _init
- _init:
---- a/crt/i386/crtn.s
-+++ b/crt/i386/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- 	add $12,%esp
- 	ret
---- a/crt/microblaze/crti.s
-+++ b/crt/microblaze/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .global _init
- .align 2
---- a/crt/microblaze/crtn.s
-+++ b/crt/microblaze/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- 	lwi r15, r1, 0
- 	rtsd r15, 8
---- a/crt/mips/crti.s
-+++ b/crt/mips/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .set noreorder
- 
- .section .init
---- a/crt/mips/crtn.s
-+++ b/crt/mips/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .set noreorder
- 
- .section .init
---- a/crt/mips64/crti.s
-+++ b/crt/mips64/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .set noreorder
- 
- .section .init
---- a/crt/mips64/crtn.s
-+++ b/crt/mips64/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .set noreorder
- 
- .section .init
---- a/crt/mipsn32/crti.s
-+++ b/crt/mipsn32/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .set	noreorder
- .section	.init
- .global	_init
---- a/crt/mipsn32/crtn.s
-+++ b/crt/mipsn32/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .set	noreorder
- .section	.init
- 	ld	$gp, 16($sp)
---- a/crt/or1k/crti.s
-+++ b/crt/or1k/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .global _init
- _init:
---- a/crt/or1k/crtn.s
-+++ b/crt/or1k/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- 	l.lwz	r9,0(r1)
- 	l.jr	r9
---- a/crt/powerpc/crti.s
-+++ b/crt/powerpc/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .align 2
- .global _init
---- a/crt/powerpc/crtn.s
-+++ b/crt/powerpc/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- .align 2
- 	lwz 0,36(1)
---- a/crt/powerpc64/crti.s
-+++ b/crt/powerpc64/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .align 2
- .global _init
---- a/crt/powerpc64/crtn.s
-+++ b/crt/powerpc64/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- .align 2
- 	addi 1, 1, 32
---- a/crt/s390x/crti.s
-+++ b/crt/s390x/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .align 2
- .global _init
---- a/crt/s390x/crtn.s
-+++ b/crt/s390x/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- .align 2
- 	lmg  %r14, %r15, 272(%r15)
---- a/crt/sh/crti.s
-+++ b/crt/sh/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .global  _init
- .type    _init, @function
---- a/crt/sh/crtn.s
-+++ b/crt/sh/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- 	lds.l @r15+, pr
- 	mov.l @r15+, r14
---- a/crt/x32/crti.s
-+++ b/crt/x32/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .global _init
- _init:
---- a/crt/x32/crtn.s
-+++ b/crt/x32/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- 	pop %rax
- 	ret
---- a/crt/x86_64/crti.s
-+++ b/crt/x86_64/crti.s
-@@ -1,3 +1,4 @@
-+.file "crti.s"
- .section .init
- .global _init
- _init:
---- a/crt/x86_64/crtn.s
-+++ b/crt/x86_64/crtn.s
-@@ -1,3 +1,4 @@
-+.file "crtn.s"
- .section .init
- 	pop %rax
- 	ret
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 265f79f2fd..249ce53521 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,7 +15,6 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0001-crt-Add-.file-directive.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.30.0

