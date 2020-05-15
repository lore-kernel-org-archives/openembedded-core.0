Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.15550.1589555954855753363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 08:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bMx1eflY;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id 145so1064660pfw.13
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Vy/e0sE+Z0iuC+pkywHQkSavHUcbzzo0P0O3rG1el4=;
        b=bMx1eflYv30Uazv9sFX48xebI+CkpjOUO8ti1nWQxnGE7mpDnTUF4gwLHPeePdjoSo
         PTuhT24U1wdBB4Se+grmCt1x5iAzgBXgZWUUOpKx6RwnYgO7fToGuNPxJI/WvAHja2xT
         Ang3vvwwSZEdwhO0thF0tXPfpn3sTLOaFPq1cpMgIkctyEE41w1v4v9qW0R0BWFC/cl9
         ddCteuyd1X8cXRZd/X/URM8ibp0tpPcVbpqwjv4XW6yQrhjkc2bAQhzwaO6aN6XdyR4s
         Vny0fFl/evBsUhQKj16YcxwNLRZm5YgWn/tMHPY4vVYLHu6+CssxjGlrAxteutneX8WI
         ss1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Vy/e0sE+Z0iuC+pkywHQkSavHUcbzzo0P0O3rG1el4=;
        b=CLwb/eaBQEIO/rz7dMUS/o+UyX+9I4XEcxjOWT8ISRkU5d4mJ8WpZF9dKZyWW+tFUD
         PRke4TWF9d8kAfrdpWud3PytTY4teakGKsVP45rmdMXeqymfVBEhmmb7SA6yfnjnc3WQ
         tIv+aklZr5MSyA4bwRwG+/Pbba40T9kgjMVfWFONi+gS9nHDhp1QbqhVwTqYYFK2IEiH
         vfkbdHPs5L2GrnAhpM0wOid6TOw8rWQtArbna5fTHozY3/+aHc4xt95X8ekF5+jh1fvB
         vc9ea4e10UEn1tmDdYgYVnHwCiPa9rSdobz4yglOROCvp9IKv1t5vUXbW1p7oDSX18ia
         HkBw==
X-Gm-Message-State: AOAM532WVir6mAyAkDPc121FEZlKNXt5cidKLgbixnPe4KYl3MzItD+V
	Sjfd3j4cu8W+WiX1YL7IoAokzu5Gzrk=
X-Google-Smtp-Source: ABdhPJypEcWvq9840/tETp28SztKRRTHY/jqTBv/Jrlu6WqX/SQVZs7diW8nBST4WDd9yzS2gK+dUQ==
X-Received: by 2002:a62:7c16:: with SMTP id x22mr4313144pfc.267.1589555953735;
        Fri, 15 May 2020 08:19:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3cf8])
        by smtp.gmail.com with ESMTPSA id e16sm2022162pgg.8.2020.05.15.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 08:19:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] valgrind: Backport upstream patch to fix __getauxval needs
Date: Fri, 15 May 2020 08:19:11 -0700
Message-Id: <20200515151911.3550390-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop disabling outline-atomics since that was added to fix this issue in
particular

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-needs-__getauxval-for-linking-with.patch | 144 ++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |   3 +-
 2 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch b/meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch
new file mode 100644
index 0000000000..9afa7f6a55
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch
@@ -0,0 +1,144 @@
+From abbc0761fa0349d49b10dc8c0f10af6bc0578c40 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Tue, 12 May 2020 16:58:36 +0200
+Subject: [PATCH 1/2] gcc10 arm64 build needs __getauxval for linking with
+ libgcc
+
+Provide a new library libgcc-sup-<platform>.a that contains symbols
+needed by libgcc. This needs to be linked after -lgcc to provide
+any symbols missing which would normally be provided by glibc.
+At the moment this only provides __getauxval on arm64 linux.
+
+https://bugs.kde.org/show_bug.cgi?id=421321
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=abbc0761fa0349d49b10dc8c0f10af6bc0578c40]
+
+---
+ Makefile.tool.am         |  3 +-
+ coregrind/Makefile.am    | 26 +++++++++++++++++
+ coregrind/m_libgcc_sup.c | 61 ++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 89 insertions(+), 1 deletion(-)
+ create mode 100644 coregrind/m_libgcc_sup.c
+
+diff --git a/Makefile.tool.am b/Makefile.tool.am
+index cc2fa0ee6..2bf90de5d 100644
+--- a/Makefile.tool.am
++++ b/Makefile.tool.am
+@@ -17,7 +17,8 @@ TOOL_DEPENDENCIES_@VGCONF_PLATFORM_SEC_CAPS@ = \
+ endif
+ 
+ 
+-TOOL_LDADD_COMMON = -lgcc
++TOOL_LDADD_COMMON = -lgcc \
++	$(top_builddir)/coregrind/libgcc-sup-@VGCONF_ARCH_PRI@-@VGCONF_OS@.a
+ TOOL_LDADD_@VGCONF_PLATFORM_PRI_CAPS@ = \
+ 	$(TOOL_DEPENDENCIES_@VGCONF_PLATFORM_PRI_CAPS@) $(TOOL_LDADD_COMMON)
+ if VGCONF_HAVE_PLATFORM_SEC
+diff --git a/coregrind/Makefile.am b/coregrind/Makefile.am
+index 6a1a925fb..1753fb633 100644
+--- a/coregrind/Makefile.am
++++ b/coregrind/Makefile.am
+@@ -542,6 +542,32 @@ libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_DEPENDENCIES = \
+     libnolto_coregrind-@VGCONF_ARCH_SEC@-@VGCONF_OS@.a
+ endif
+ 
++#----------------------------------------------------------------------------
++# libgcc-sup-<platform>.a
++# Special supplemental library for functions normally supplied by glibc
++# used by libgcc.
++#----------------------------------------------------------------------------
++
++pkglib_LIBRARIES  += libgcc-sup-@VGCONF_ARCH_PRI@-@VGCONF_OS@.a
++if VGCONF_HAVE_PLATFORM_SEC
++pkglib_LIBRARIES += libgcc-sup-@VGCONF_ARCH_SEC@-@VGCONF_OS@.a
++endif
++
++libgcc_sup_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_SOURCES = \
++	m_libgcc_sup.c
++libgcc_sup_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_CPPFLAGS = \
++	$(AM_CPPFLAGS_@VGCONF_PLATFORM_PRI_CAPS@)
++libgcc_sup_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_CFLAGS = \
++	$(AM_CFLAGS_PSO_@VGCONF_PLATFORM_PRI_CAPS@)
++if VGCONF_HAVE_PLATFORM_SEC
++libgcc_sup_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_SOURCES = \
++	m_libgcc_sup.c
++libgcc_sup_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_CPPFLAGS = \
++	$(AM_CPPFLAGS_@VGCONF_PLATFORM_SEC_CAPS@)
++libgcc_sup_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_CFLAGS = \
++	$(AM_CFLAGS_PSO_@VGCONF_PLATFORM_SEC_CAPS@)
++endif
++
+ #----------------------------------------------------------------------------
+ # libreplacemalloc_toolpreload-<platform>.a
+ #----------------------------------------------------------------------------
+diff --git a/coregrind/m_libgcc_sup.c b/coregrind/m_libgcc_sup.c
+new file mode 100644
+index 000000000..e29325459
+--- /dev/null
++++ b/coregrind/m_libgcc_sup.c
+@@ -0,0 +1,61 @@
++/* -*- mode: C; c-basic-offset: 3; -*- */
++
++/*--------------------------------------------------------------------*/
++/*--- Supplemental functions for libgcc normally provided by glibc ---*/
++/*--------------------------------------------------------------------*/
++
++/*
++   This file is part of Valgrind, a dynamic binary instrumentation
++   framework.
++
++   Copyright (C) 2020 Mark Wielaard
++      mark@klomp.org
++
++   This program is free software; you can redistribute it and/or
++   modify it under the terms of the GNU General Public License as
++   published by the Free Software Foundation; either version 2 of the
++   License, or (at your option) any later version.
++
++   This program is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program; if not, see <http://www.gnu.org/licenses/>.
++
++   The GNU General Public License is contained in the file COPYING.
++*/
++
++#include "config.h"
++#include "pub_core_basics.h"
++#include "pub_core_clientstate.h"
++
++/*====================================================================*/
++/*=== arm64 libgcc support function for init_have_lse_atomics      ===*/
++/*====================================================================*/
++
++#if defined(VGP_arm64_linux)
++struct auxv
++{
++   Word a_type;
++   union {
++      void *a_ptr;
++      Word a_val;
++   } u;
++};
++#define AT_NULL 0
++
++unsigned long int __getauxval (unsigned long int type);
++unsigned long int __getauxval (unsigned long int type)
++{
++   struct auxv *p;
++   for (p = (struct auxv *) VG_(client_auxv);
++        p != NULL && p->a_type != AT_NULL;
++        p++)
++      if (p->a_type == type)
++         return p->u.a_val;
++
++   return 0;
++}
++#endif
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 25837e4b44..a764d18177 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-tests-Make-pthread_detatch-call-portable-across-plat.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
+           file://0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
@@ -74,8 +75,6 @@ EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEIN
 # valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
 EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
 
-CFLAGS_append_aarch64 = " -mno-outline-atomics "
-
 EXTRA_OEMAKE = "-w"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
-- 
2.26.2

