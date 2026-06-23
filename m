Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D1BCDE006
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33406.1782253629118020532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aA9hq3ih;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49249072f03so2150805e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253627; x=1782858427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5/BHU7e0twfuoZnwOLKzgFb3+uZTuhTDmM2R7efeqI=;
        b=aA9hq3ihHLVM9wOirEY3ZqxnwcSP4aNQswdJAiq2e5yxodnp9HbArN6/iiHlTYnHy8
         OBHKbpIL3NFteIXyquRcm9PK6walU8mUhEupWBR+lyFwKQWcsv+pjsXRcJsunmB1TUMH
         /Y5DBFvWnHiJPSv+sPmBbqmiZZkX3jJ1Ou/FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253627; x=1782858427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r5/BHU7e0twfuoZnwOLKzgFb3+uZTuhTDmM2R7efeqI=;
        b=ZniJScHWP4MSB6Jc6NLi2bY9cF2p2kI5pA/yKNUWQ9LLq1xYv+zro7vXhx/283CE44
         M7j4CK/ZbumiHCiNwM8qjHK5KDrXZFDmOJXKnm+dqY7zBdSA0t3BEDyBx2aKQS0Tqm4o
         +FslWIuhOsCm8qQ7LqvvXJgWYfV4xGurXcsRmObuUW8nzUHPiCH6KP91BI40R0VHr9l4
         04bDIEeeF6d+X4TqJNX68mVlC2PquzJU4u4Y/z7yezbfbP31dZvQXfyG8GGsLoERXiei
         dFM98UMjreXoBqruEBnPPXpoFNHIV2OYGv+ooeCgsDLIhLjiWjzeNkBTERWJtMmhp3UX
         xddQ==
X-Gm-Message-State: AOJu0YzY5eCgcIA0wRD3XKODbGUT3R5dyi0L76vTlNpBs71/9oFVn0N/
	ZMVq29+RXfYd9NLy/v2cpA6uy1ZxtMAbrSHmy++rICxpqz3z/gqhICTHTz5jN3L4+uhNYA8/zWW
	pSNVc
X-Gm-Gg: AfdE7cn9jW771JD2lZhgPm3Aw33EG1wfw/QjdtgYmcCZnaqSA+H9VcIeuhPGPq6h5Yx
	TgBvdEZkk0yitvVfFGqXi1oVr3ab9gke1MR/fkpIkdd/2XZSbKgCVWcs1CKfn+0wXPKkB3clDie
	PARvPy2/DM82RqQeHwpThZcqCejYoJpx+4/Seq1akd+65IWUlU92s+5D7B9C2vu14r9rsmEVh5E
	veneiCy8YP+xoy4u7KFWyvUs1cqKSZeCMwl+eynWpoWU1rrQxiM3n4+zwTBWSiHM/t1PBv29wgk
	MS8vdRsnJW5x3LtJd0dgPdd3UJujARxxlRvRYi19rqlgzI5Zc5dWfwQzF9eZ1hNY1MuBFh2gX3O
	PPBCQa0uxiN/WLRj7md+vCkyKy7heDVkGzsWfEaAnGNm1eDfcxjK0sFA3SfRrsxVbFIcyw9NhPc
	nCNuXp+6rRcxcDuV9Wbb42ttsrDmQ61NvZbOEOadoDyZemHaVTQiHrlTA+HwYxFGAUJaAuQuNw8
	pcBmP3UpqDhbXseuWF6mN19hmc=
X-Received: by 2002:a05:600c:c167:b0:492:4cc7:de73 with SMTP id 5b1f17b1804b1-4926087d11dmr6608555e9.31.1782253627249;
        Tue, 23 Jun 2026 15:27:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 17/41] gdb: backport a patch to fix static_assert in recent GCC
Date: Wed, 24 Jun 2026 00:26:16 +0200
Message-ID: <92a57b28a4e8e4fe917e4aa3d58079257ee9a41f.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239439

From: Yoann Congal <yoann.congal@smile.fr>

On Ubuntu 26.04, gcc 15.2 defaults to --std=gnu23 in which static_assert
is a keyword, and not a macro to define like with older GCC. This make
MIPS64 code in gdb fail to compile with:
| In file included from ../../gdb-14.2/opcodes/mips16-opc.c:25:
| ../../gdb-14.2/opcodes/mips16-opc.c: In function ‘decode_mips16_operand’:
| ../../gdb-14.2/opcodes/mips-formats.h:86:7: error: expected identifier or ‘(’ before ‘static_assert’
|    86 |       static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
|       |       ^~~~~~~~~~~~~
| ../../gdb-14.2/opcodes/mips16-opc.c:52:15: note: in expansion of macro ‘MAPPED_REG’
|    52 |     case '.': MAPPED_REG (0, 0, GP, reg_0_map);
|       |               ^~~~~~~~~~

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 ...gnu23-compatibility-wrt-static_asser.patch | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 81ac441462a..d806a66ac43 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,5 +13,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-resolve-restrict-keyword-conflict.patch \
            file://0007-Fix-invalid-sigprocmask-call.patch \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
+           file://0001-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch \
            "
 SRC_URI[sha256sum] = "2d4dd8061d8ded12b6c63f55e45344881e8226105f4d2a9b234040efa5ce7772"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch b/meta/recipes-devtools/gdb/gdb/0001-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
new file mode 100644
index 00000000000..d0d4aa5bd20
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
@@ -0,0 +1,75 @@
+From 2b8d72efbe1af100ea4dad4c976b2d3a1fbad676 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 16 Nov 2024 05:03:52 +0000
+Subject: [PATCH] opcodes: fix -std=gnu23 compatibility wrt static_assert
+
+
+static_assert is declared in C23 so we can't reuse that identifier:
+* Define our own static_assert conditionally;
+
+* Rename "static assert" hacks to _N as we do already in some places
+  to avoid a conflict.
+
+ChangeLog:
+	PR ld/32372
+
+        * i386-gen.c (static_assert): Define conditionally.
+        * mips-formats.h (MAPPED_INT): Rename identifier.
+        (MAPPED_REG): Rename identifier.
+        (OPTIONAL_MAPPED_REG): Rename identifier.
+        * s390-opc.c (static_assert): Define conditionally.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=8ebe62f3f0d27806b1bf69f301f5e188b4acd2b4]
+Backport:
+* No static_assert to patch in this version of s390-opc.c.
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ opcodes/i386-gen.c     | 2 ++
+ opcodes/mips-formats.h | 6 +++---
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/opcodes/i386-gen.c b/opcodes/i386-gen.c
+index cfc5a7a6172..d5901b9667d 100644
+--- a/opcodes/i386-gen.c
++++ b/opcodes/i386-gen.c
+@@ -30,7 +30,9 @@
+ 
+ /* Build-time checks are preferrable over runtime ones.  Use this construct
+    in preference where possible.  */
++#ifndef static_assert
+ #define static_assert(e) ((void)sizeof (struct { int _:1 - 2 * !(e); }))
++#endif
+ 
+ static const char *program_name = NULL;
+ static int debug = 0;
+diff --git a/opcodes/mips-formats.h b/opcodes/mips-formats.h
+index ac73f060a3e..790e23f1783 100644
+--- a/opcodes/mips-formats.h
++++ b/opcodes/mips-formats.h
+@@ -49,7 +49,7 @@
+ #define MAPPED_INT(SIZE, LSB, MAP, PRINT_HEX) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_3[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_mapped_int_operand op = { \
+       { OP_MAPPED_INT, SIZE, LSB }, MAP, PRINT_HEX \
+     }; \
+@@ -83,7 +83,7 @@
+ #define MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_4[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \
+@@ -93,7 +93,7 @@
+ #define OPTIONAL_MAPPED_REG(SIZE, LSB, BANK, MAP) \
+   { \
+     typedef char ATTRIBUTE_UNUSED \
+-      static_assert[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
++      static_assert_5[(1 << (SIZE)) == ARRAY_SIZE (MAP)]; \
+     static const struct mips_reg_operand op = { \
+       { OP_OPTIONAL_REG, SIZE, LSB }, OP_REG_##BANK, MAP \
+     }; \

