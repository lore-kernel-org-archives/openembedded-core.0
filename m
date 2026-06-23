Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD985CDE004
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20454.1782220480463769913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jqZV2TOB;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so44265525e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220479; x=1782825279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5/BHU7e0twfuoZnwOLKzgFb3+uZTuhTDmM2R7efeqI=;
        b=jqZV2TOBkOzBLfEuKNZ2EFrVELrXXIWyjcaNAefiRtMwYZnvlHEoq0cRv+ka4jCSiw
         8Rdjle3FqfITPUVCyuAUPC4ZomFQIMY5QPEpeiWF+3OVQEWT4E/Dqt8kj91DwoSDcsS2
         +WGJren3u8HnhM1Miryj5Ny72JDfE7+t3ULk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220479; x=1782825279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r5/BHU7e0twfuoZnwOLKzgFb3+uZTuhTDmM2R7efeqI=;
        b=PpRYvMpPAwPoGrmb/XWP444JwQBNPXuzxCKNDAsuWlp2yDT+vHvENjP9SHNx6C5Y1h
         4eOUHBbO1N2iHjq6l1yrJuHZrg1+rZ3iBwDq02x8ufLXPnsJzcHWLVFvv+zulLt/6byQ
         SVhp48KwhlG2r+TlqonyZO/NPpwPL17ZZo//kMBmKZz34MwW4DYaiJ7FNaTEnHKgEOpi
         PMIhF8K5fwDzyPRe2k8oVRkU+PdklO4tZKwSSeXgboOo2nlFyJ0+w8c5BUatBOPPOAKl
         QyfzgUW4gPNV8fDpn3qY+S4qoJf5VTLL4CjJ4rYgeOUcCAxuUHVUtt7n2QMLpZu5Aefu
         /9lw==
X-Gm-Message-State: AOJu0YwD/1NiyarRivq3XHO/hcJwofQHghZDlSh95lwYybH+oXpRQlVm
	yWw39ShsgvhM6fNAvx0OHKp3t+JA4MwedHSC0hnqnLeAa3Thc1WoFD6uuo38zjNh/DiNZI820JG
	CRL5j
X-Gm-Gg: AfdE7cm0R+4DQcbFsioOFVmYti4zA0XGeIPKebhmavB2w+kZy+8z6V0QsvMBqB8GhnT
	dXWsaXHwLCQyHk/uKw+yZ1Ygj2QELg6NNNCl9UzH1FshZibRICfl0Ki67HrSvG/sMGVvmdsrRwe
	HUQP55FzpEL/eN/kiD1HWwUa95EshgD12cJrc+IoKP9UUDrMNj8qgC8IbrzGdiSTyNNJPf5UG0p
	o9dQ10jT7qcmsi/GmM9+hlwxWSpFkM99LjYRHkiu4fkUq5/zRsWZDU3BvM68aR7WHmEcw6hexuC
	LrSLD9X8szA93jM/UWGUFk2UN129p23XDXlD9vmKvgUKStPlXwioWL4J7TeNx5y9s5aN9vKWBAZ
	98ZPWAc2UY7QHWtT1Gk070edguQ/fWR6KSK7ThCzyFoZHuKa5tZfh48cgL5a9ceXwzqEcvGXl6u
	m2pHCOJzAu0YqwzZ4k3QoYZ8S91/cVIraYAF4MsHiXf962eWAvni+bgEp77aPgbEkiQGQtteC5N
	oX7V4IpwkhMN9tHFAuCWBUtwT+p
X-Received: by 2002:a05:600c:628d:b0:490:d079:2919 with SMTP id 5b1f17b1804b1-4925b35a137mr36831245e9.14.1782220478548;
        Tue, 23 Jun 2026 06:14:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/26] gdb: backport a patch to fix static_assert in recent GCC
Date: Tue, 23 Jun 2026 15:13:58 +0200
Message-ID: <92a57b28a4e8e4fe917e4aa3d58079257ee9a41f.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239383

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

