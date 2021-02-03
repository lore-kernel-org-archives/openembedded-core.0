Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.2942.1612316202509316033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 17:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IcMB8fK/;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id o16so16174683pgg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 17:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q585fxHoK6hrKdNDl4IwZMWXLUFel0VdnJxLv1FflvM=;
        b=IcMB8fK/NWFPn8rpc87UTydzVgpKAWvlcPscPh5mkcGr/TMDSi/wUd/rJenmTduJST
         KKA2zTbqm8UNorJZqMTyTfHqfpk72RPWLYsLRyujJcH/0Z1vfB+C+LlZF+8TDEeXwZSC
         sqGykDIVg/24V3M7MOIGKRL9EWF+nylw/D8FpkHvIFd0xP4z1sGgJiTwd/UEwLv4Eq8L
         llEs8N3MGoUpfkt4UU19RQSFWDNVgBZalJWUAPgzju1pcMvD756FmyGow7iVHFfDYp+E
         9nXR9SXOI03sHsEMiWd6yEA+LOCxL6m99d3ZywvhHIthxrYwi0lussAC1uuila1uY45S
         GePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q585fxHoK6hrKdNDl4IwZMWXLUFel0VdnJxLv1FflvM=;
        b=WMOAA+6GWYAPQXcZHu0MOrD5Z/NMR9NpxLw57kDyt+Qr7EEBj5Z0/fUZF8c3Tekbq6
         tlJyIr85/ZEgTsyzp5JH8vrhT5WnfQ49VaGAVdoVLLdSMnkumavwfMct+0gs9iWaL6tu
         aP4Ib2WCs6Q1AWpcTdobyAs4kk4uKRkFxq7ZWw4ZpjWSqu8s3p9jupC8Gz6cUirugqyd
         q0sn5o9JOP/uYPYSWigJmvH69ioqffOQVkUkSNVc+bB8wUQiGhg8Q6uVqBtrzBse25yu
         MJ0cadPrC1GaEUddin8PA3ju74Te6R7S10cgjMvnRv6MpAHLw+dqrrz8GcYEi//ytE81
         h9lg==
X-Gm-Message-State: AOAM5314yIKDeMCiqlxeFMriFAQbjFM+PHOIo8n4WmEHrpgMmetdKPd9
	E6Awi95Meih//5pYq7dEkP6ajZLCw3XinQ==
X-Google-Smtp-Source: ABdhPJyRQRQJxWdDDsG48kIyN/CuF3Si/t2deuFFTTQlVFaPwSc2qZm5qhufZ6g4SAASgyMJvns9Rw==
X-Received: by 2002:a63:f34f:: with SMTP id t15mr922812pgj.239.1612316201720;
        Tue, 02 Feb 2021 17:36:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id d14sm214013pfo.156.2021.02.02.17.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 17:36:41 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [v2 4/5] musl: Drop adding .file directive in asm files
Date: Tue,  2 Feb 2021 17:36:34 -0800
Message-Id: <20210203013635.2512741-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203013635.2512741-1-raj.khem@gmail.com>
References: <20210203013635.2512741-1-raj.khem@gmail.com>
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

