Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.9452.1604036828138359165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CnjLpkmr;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id i7so2351486pgh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 22:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OFlLi+S966NoYy027IhF8cYtT5p2Km64gMilvraxOqk=;
        b=CnjLpkmrCN6vRNX3XucxZrB9aDb1pQyTQfNAFy8HC93Rsh6nrgYiLR3bLTg5ERf8ca
         0jJ6ynEhFpoQtrtgZXDIrqKF4xAcfzI7Obx2dObmz0ovvYfqZxbxk+B3eQrXNPg95CeM
         b87gMhgmJAJn44Xb1Aq2qVgzZXGRPOwCkm9Jav3GPEkBY3ERDANOC7JY4mIQI6mvFpRx
         YNlAWJTsQRDr4gTIOeR8PeogHXT/8pdAT5PxObosCwYTh8C+aRZ4yDRNOUteswJga0Ia
         yRbFutyHBBVS2/C4x/dDiXZWODE5Dlmas7E4o0FYKrMOdYlOGdXOVI18LIOmtv6QsTJo
         Ye7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OFlLi+S966NoYy027IhF8cYtT5p2Km64gMilvraxOqk=;
        b=WqK2sbZToPe8YHb2Okuc4KNuo5FpJX6HbI/801tk7mgC/oTdskrkgKjDlP0fMDqTJl
         etr7/w6DLaR7074xkqTZW2Ytjjqn5Sn4RLnT4w7/+KHDjkCHCaQsf8Y/hwpgeGOhykfd
         zP/Bei+df2/9zbfjL5CvaAZ8IhRY5msrrH7l63rbJ1ho57RyKm9NbBelu7yispdKMR/H
         OP6qmLX4ie2bfDiBgNMs3X4zlZPjpqZx07UMTmuJ3r9QUkeaK5GOigi+5408a9bUwfvk
         yySbjYNFm8SgNMZOMKjxK5W/aJex6AjQZ0iBoAtu56+R4sIzytGooTtS34kDfXcpjtmh
         +XvQ==
X-Gm-Message-State: AOAM532sUx9TOTa68Vbo4E/PzDjfX/2qfwBnvrk+E2UXuKFyY7ZCQKs3
	LCPiJHD54iWP/A1n+irHUMICaT+gLcZtWw==
X-Google-Smtp-Source: ABdhPJz7yHQxZGukiZe5n9NvSOADqjmqxfceMQUobZkU7vS3AZDB7/K0I7C/uzfsxyXjao7G+J1ycw==
X-Received: by 2002:a63:65c5:: with SMTP id z188mr784907pgb.139.1604036827293;
        Thu, 29 Oct 2020 22:47:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id m11sm4720343pfa.69.2020.10.29.22.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 22:47:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrei Gherzan <andrei@gherzan.ro>
Subject: [PATCH] musl: Add .file directive in crt assembly files
Date: Thu, 29 Oct 2020 22:47:03 -0700
Message-Id: <20201030054703.422319-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps linker to noot emit absolute paths into .debug_line sections
of liked binaries and libraries and therefore make them reproducible

Reported-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musl/0001-crt-Add-.file-directive.patch   | 300 ++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |   1 +
 2 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch

diff --git a/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch b/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
new file mode 100644
index 0000000000..d2bd587e39
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
@@ -0,0 +1,300 @@
+From b0124f3c4f2a353506621d387135ebea6b8c6609 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Oct 2020 22:40:53 -0700
+Subject: [PATCH] crt: Add .file directive
+
+Musl linked binaries come out to be not reproducible because
+absolute build path is seen in debug info of crti.o and crtn.o
+This is due to the fact that these objects are built from assembly
+source files and they are missing .file directive
+if we add .file <filename>.s in them then debug info encodes this
+value instead of absolute path in debug_line section
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ crt/aarch64/crti.s    | 1 +
+ crt/aarch64/crtn.s    | 1 +
+ crt/arm/crti.s        | 1 +
+ crt/arm/crtn.s        | 1 +
+ crt/i386/crti.s       | 1 +
+ crt/i386/crtn.s       | 1 +
+ crt/microblaze/crti.s | 1 +
+ crt/microblaze/crtn.s | 1 +
+ crt/mips/crti.s       | 1 +
+ crt/mips/crtn.s       | 1 +
+ crt/mips64/crti.s     | 1 +
+ crt/mips64/crtn.s     | 1 +
+ crt/mipsn32/crti.s    | 1 +
+ crt/mipsn32/crtn.s    | 1 +
+ crt/or1k/crti.s       | 1 +
+ crt/or1k/crtn.s       | 1 +
+ crt/powerpc/crti.s    | 1 +
+ crt/powerpc/crtn.s    | 1 +
+ crt/powerpc64/crti.s  | 1 +
+ crt/powerpc64/crtn.s  | 1 +
+ crt/s390x/crti.s      | 1 +
+ crt/s390x/crtn.s      | 1 +
+ crt/sh/crti.s         | 1 +
+ crt/sh/crtn.s         | 1 +
+ crt/x32/crti.s        | 1 +
+ crt/x32/crtn.s        | 1 +
+ crt/x86_64/crti.s     | 1 +
+ crt/x86_64/crtn.s     | 1 +
+ 28 files changed, 28 insertions(+)
+
+diff --git a/crt/aarch64/crti.s b/crt/aarch64/crti.s
+index 775df0ac..0f7c23a9 100644
+--- a/crt/aarch64/crti.s
++++ b/crt/aarch64/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .global _init
+ .type _init,%function
+diff --git a/crt/aarch64/crtn.s b/crt/aarch64/crtn.s
+index 73cab692..d62fc129 100644
+--- a/crt/aarch64/crtn.s
++++ b/crt/aarch64/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ 	ldp x29,x30,[sp],#16
+ 	ret
+diff --git a/crt/arm/crti.s b/crt/arm/crti.s
+index 18dc1e41..8df72979 100644
+--- a/crt/arm/crti.s
++++ b/crt/arm/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .syntax unified
+ 
+ .section .init
+diff --git a/crt/arm/crtn.s b/crt/arm/crtn.s
+index dc020f92..7451355b 100644
+--- a/crt/arm/crtn.s
++++ b/crt/arm/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .syntax unified
+ 
+ .section .init
+diff --git a/crt/i386/crti.s b/crt/i386/crti.s
+index d2682a20..2823fc3b 100644
+--- a/crt/i386/crti.s
++++ b/crt/i386/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .global _init
+ _init:
+diff --git a/crt/i386/crtn.s b/crt/i386/crtn.s
+index f3b61e01..04fb1646 100644
+--- a/crt/i386/crtn.s
++++ b/crt/i386/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ 	add $12,%esp
+ 	ret
+diff --git a/crt/microblaze/crti.s b/crt/microblaze/crti.s
+index ed1c2fa4..29ee4733 100644
+--- a/crt/microblaze/crti.s
++++ b/crt/microblaze/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .global _init
+ .align 2
+diff --git a/crt/microblaze/crtn.s b/crt/microblaze/crtn.s
+index 1e02c984..c2083749 100644
+--- a/crt/microblaze/crtn.s
++++ b/crt/microblaze/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ 	lwi r15, r1, 0
+ 	rtsd r15, 8
+diff --git a/crt/mips/crti.s b/crt/mips/crti.s
+index 39dee380..0211764e 100644
+--- a/crt/mips/crti.s
++++ b/crt/mips/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .set noreorder
+ 
+ .section .init
+diff --git a/crt/mips/crtn.s b/crt/mips/crtn.s
+index 506a04b7..606490cf 100644
+--- a/crt/mips/crtn.s
++++ b/crt/mips/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .set noreorder
+ 
+ .section .init
+diff --git a/crt/mips64/crti.s b/crt/mips64/crti.s
+index c962dd09..f2c19cdd 100644
+--- a/crt/mips64/crti.s
++++ b/crt/mips64/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .set noreorder
+ 
+ .section .init
+diff --git a/crt/mips64/crtn.s b/crt/mips64/crtn.s
+index f3930b24..68903ffa 100644
+--- a/crt/mips64/crtn.s
++++ b/crt/mips64/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .set noreorder
+ 
+ .section .init
+diff --git a/crt/mipsn32/crti.s b/crt/mipsn32/crti.s
+index 14fa28d9..a35387d3 100644
+--- a/crt/mipsn32/crti.s
++++ b/crt/mipsn32/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .set	noreorder
+ .section	.init
+ .global	_init
+diff --git a/crt/mipsn32/crtn.s b/crt/mipsn32/crtn.s
+index dccd7e89..bdb6e561 100644
+--- a/crt/mipsn32/crtn.s
++++ b/crt/mipsn32/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .set	noreorder
+ .section	.init
+ 	ld	$gp, 16($sp)
+diff --git a/crt/or1k/crti.s b/crt/or1k/crti.s
+index 7e741459..919369ca 100644
+--- a/crt/or1k/crti.s
++++ b/crt/or1k/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .global _init
+ _init:
+diff --git a/crt/or1k/crtn.s b/crt/or1k/crtn.s
+index 4185a027..d670b327 100644
+--- a/crt/or1k/crtn.s
++++ b/crt/or1k/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ 	l.lwz	r9,0(r1)
+ 	l.jr	r9
+diff --git a/crt/powerpc/crti.s b/crt/powerpc/crti.s
+index 60461ca4..b748ca48 100644
+--- a/crt/powerpc/crti.s
++++ b/crt/powerpc/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .align 2
+ .global _init
+diff --git a/crt/powerpc/crtn.s b/crt/powerpc/crtn.s
+index 2d14a6f0..d989e36f 100644
+--- a/crt/powerpc/crtn.s
++++ b/crt/powerpc/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ .align 2
+ 	lwz 0,36(1)
+diff --git a/crt/powerpc64/crti.s b/crt/powerpc64/crti.s
+index 9f712f0e..d3323a67 100644
+--- a/crt/powerpc64/crti.s
++++ b/crt/powerpc64/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .align 2
+ .global _init
+diff --git a/crt/powerpc64/crtn.s b/crt/powerpc64/crtn.s
+index a7a9f4a0..5e71ae66 100644
+--- a/crt/powerpc64/crtn.s
++++ b/crt/powerpc64/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ .align 2
+ 	addi 1, 1, 32
+diff --git a/crt/s390x/crti.s b/crt/s390x/crti.s
+index f453205b..3da3c5e1 100644
+--- a/crt/s390x/crti.s
++++ b/crt/s390x/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .align 2
+ .global _init
+diff --git a/crt/s390x/crtn.s b/crt/s390x/crtn.s
+index 06066dc9..bfd55caf 100644
+--- a/crt/s390x/crtn.s
++++ b/crt/s390x/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ .align 2
+ 	lmg  %r14, %r15, 272(%r15)
+diff --git a/crt/sh/crti.s b/crt/sh/crti.s
+index d99bfd5c..77d61c51 100644
+--- a/crt/sh/crti.s
++++ b/crt/sh/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .global  _init
+ .type    _init, @function
+diff --git a/crt/sh/crtn.s b/crt/sh/crtn.s
+index 958ce951..29deb5be 100644
+--- a/crt/sh/crtn.s
++++ b/crt/sh/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ 	lds.l @r15+, pr
+ 	mov.l @r15+, r14
+diff --git a/crt/x32/crti.s b/crt/x32/crti.s
+index 4788968b..8668b7c7 100644
+--- a/crt/x32/crti.s
++++ b/crt/x32/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .global _init
+ _init:
+diff --git a/crt/x32/crtn.s b/crt/x32/crtn.s
+index 29198b77..ef73d295 100644
+--- a/crt/x32/crtn.s
++++ b/crt/x32/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ 	pop %rax
+ 	ret
+diff --git a/crt/x86_64/crti.s b/crt/x86_64/crti.s
+index 4788968b..8668b7c7 100644
+--- a/crt/x86_64/crti.s
++++ b/crt/x86_64/crti.s
+@@ -1,3 +1,4 @@
++.file "crti.s"
+ .section .init
+ .global _init
+ _init:
+diff --git a/crt/x86_64/crtn.s b/crt/x86_64/crtn.s
+index 29198b77..ef73d295 100644
+--- a/crt/x86_64/crtn.s
++++ b/crt/x86_64/crtn.s
+@@ -1,3 +1,4 @@
++.file "crtn.s"
+ .section .init
+ 	pop %rax
+ 	ret
+-- 
+2.29.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 897e56e10f..504fdfe019 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-crt-Add-.file-directive.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.29.1

