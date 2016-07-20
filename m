Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9AA731BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:38:31 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id cf3so3811856pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3GpbsBB69daHodGVrEQk0EipqlbcVT3lB3KyNcko740=;
	b=cu/W1nqc8vQLFGZIVril8+75+PnOrrYE/eNJATFJqBSoIAKwZ9J2lE7qcOIDECytl2
	2Jig4BPslJ7dPEr2msRy86XEZZiYKReGT8z8BcdfqpfwXGOVZd2uffi3d81vp9O+mpAq
	8pQVyTp8hvCfURcfw1nYXgov086q/Slru2u1iWZCMK45/x6dIO6Itc/kFuLhQYNrvYIR
	9Xud6nkgGaBIF/uXdQ0uh+vk4nT9+Ge01oC9iaYoT9Mx46TOBz/FfM9Qyq7xqZdkESy8
	Acwf4HpzCZjBhfPlT0enfMXRqMwbiSy2L4+igQD58d/Q4dURbBppOuViAGxecWAVzvDh
	pFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3GpbsBB69daHodGVrEQk0EipqlbcVT3lB3KyNcko740=;
	b=Z4cj37R2cUU9XXro6Idk7lQhvE5QfbjOx7JdhWotB89+saDr/8haBun0YXsBhsVAE6
	y2vbdrr2PNX8jrdlXbQatFhDey3dwQAGqdDM7hZgv7215gFzoYQya3qfmE2M0+ds3Msc
	UdMTKzYrc/dYu9V7yeBEFn7DkjPAWNv0Z5OrPnKHTFgenKPFpH5G52sIRWoQvU6LAzqj
	CBRU6sf/R6GFBzRV+Bxg9YQXEdfViMWttZKKTtBDI3uxkKjPs1suPHNpQE8W7Vt38Ulk
	emNSrLANU0dglr5u0CpEcZbrdgSTNBEfZYAdDEhVMeTY5fGVGte2NR4u97dTpsmnC/Xo
	etSg==
X-Gm-Message-State: ALyK8tLJYlxheI48FGVSj8C870ybZI0zdyoRlAKzTxYm5hRRC3K84E4aYA2fn0MkPP/jvw==
X-Received: by 10.67.7.165 with SMTP id dd5mr77151805pad.124.1469043512418;
	Wed, 20 Jul 2016 12:38:32 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e10sm6465694pay.39.2016.07.20.12.38.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 12:38:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 12:38:25 -0700
Message-Id: <fd8b9c504f8db9c92a7cd968864c0ffc0839a499.1469043317.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <2c386c7b01a0ac2764c4a6d7334d79487f9371ba.1469043317.git.raj.khem@gmail.com>
References: <2c386c7b01a0ac2764c4a6d7334d79487f9371ba.1469043317.git.raj.khem@gmail.com>
In-Reply-To: <cover.1469043317.git.raj.khem@gmail.com>
References: <cover.1469043317.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc: Fix libgcc unresolved symbols with PIE on musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2016 19:38:33 -0000

Fixes

[YOCTO #9772]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.1.inc              |  1 +
 ...e-alias-for-__cpu_indicator_init-instead-.patch | 85 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.1.inc b/meta/recipes-devtools/gcc/gcc-6.1.inc
index afeeff4..0426028 100644
--- a/meta/recipes-devtools/gcc/gcc-6.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.1.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            file://0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            ${BACKPORTS} \
            file://CVE-2016-4490.patch \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-6.1/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
new file mode 100644
index 0000000..ed6cd69
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -0,0 +1,85 @@
+From 0a9ed0479203cb7e69c3745b0c259007410f39ba Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Sat, 24 Oct 2015 20:09:53 +0000
+Subject: [PATCH 47/47] libgcc_s: Use alias for __cpu_indicator_init instead of
+ symver
+
+Adapter from
+
+https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
+
+This fix was debated but hasnt been applied gcc upstream since
+they expect musl to support '@' in symbol versioning which is
+a sun/gnu versioning extention. This patch however avoids the
+need for the '@' symbols at all
+
+libgcc/Changelog:
+
+2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
+	(__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
+
+	* config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SYMVER.
+
+gcc/Changelog:
+
+2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_init
+	call __cpu_indicator_init_local instead of __cpu_indicator_init.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Rejected
+
+ gcc/config/i386/i386.c       | 4 ++--
+ libgcc/config/i386/cpuinfo.c | 6 +++---
+ libgcc/config/i386/t-linux   | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 861a029..1c97d72 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -40323,10 +40323,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+     {
+     case IX86_BUILTIN_CPU_INIT:
+       {
+-	/* Make it call __cpu_indicator_init in libgcc. */
++	/* Make it call __cpu_indicator_init_local in libgcc.a. */
+ 	tree call_expr, fndecl, type;
+         type = build_function_type_list (integer_type_node, NULL_TREE); 
+-	fndecl = build_fn_decl ("__cpu_indicator_init", type);
++	fndecl = build_fn_decl ("__cpu_indicator_init_local", type);
+ 	call_expr = build_call_expr (fndecl, 0); 
+ 	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
+       }
+diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
+index 8c2248d..6c82f15 100644
+--- a/libgcc/config/i386/cpuinfo.c
++++ b/libgcc/config/i386/cpuinfo.c
+@@ -485,7 +485,7 @@ __cpu_indicator_init (void)
+   return 0;
+ }
+ 
+-#if defined SHARED && defined USE_ELF_SYMVER
+-__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8.0");
+-__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
++#ifndef SHARED
++int __cpu_indicator_init_local (void)
++  __attribute__ ((weak, alias ("__cpu_indicator_init")));
+ #endif
+diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
+index 11bb46e..4f47f7b 100644
+--- a/libgcc/config/i386/t-linux
++++ b/libgcc/config/i386/t-linux
+@@ -3,4 +3,4 @@
+ # t-slibgcc-elf-ver and t-linux
+ SHLIB_MAPFILES = libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc.ver
+ 
+-HOST_LIBGCC2_CFLAGS += -mlong-double-80 -DUSE_ELF_SYMVER
++HOST_LIBGCC2_CFLAGS += -mlong-double-80
+-- 
+2.9.0
+
-- 
2.9.0


