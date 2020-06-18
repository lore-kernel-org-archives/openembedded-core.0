Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.10580.1592494992675199881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FJj7q72x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id n5so4901280otj.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3bsbcdkfXlRv5jgNBJvhKEM+5Xq6tO39En0Xl9lIu1Y=;
        b=FJj7q72xJH+XZGDalBQTrp2+WI6uNzFonr6F5rfwn5nBGVVKVRJB0V0JL0VqQE/Fr3
         fkANuiYfHtAETYRhCy5WWR9ahkAWEcBnHaeTsaz3dyBPCvHR/5v6LUh+6ynjEATFLgfd
         FsP4zyUcdO3jrEFESL7cauKSZdxBYbfWYc4DwJtwsmWXYOQcZ8ZmNS5bjpSfJATkJACf
         S2RfWfJMtzCNA/WV90Vc8Kgyo9RnDjxgxXZF1MpqoqahIBnrXFqqYXXCXs57fWxCYXFu
         WRULVY8GV1LoM1DPDDKuXbQuYdPCOJKj2ERaBLcnakQN+h1Twov/979AgIL4WQt4Hjdz
         MRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3bsbcdkfXlRv5jgNBJvhKEM+5Xq6tO39En0Xl9lIu1Y=;
        b=Vtt7W7RKCwaJw143OWudd7yvuE79nl/+Mwyn9XOTbcWE9e5NZojJx/5Si6lLPUkcAQ
         vVACfb56lkXeQo8Bi7KJhdJmtzp/5vxgAxy688ZUrc++Pp/kedN+jlGojqSREoN+tnCq
         YB9uqcF4cWXzpKmJIgYA56dY9FRrVJ03tg7auNHBZSaOYZsgOU5MTP/75204nk7UMpV5
         Hk9nLYAFE+FWzcPDzuMLzJNamcaiXHkMIR17bhlGgA7XZd9/mC0eiuovSA4kpAwugcjl
         uRVmVAid+aKGCgZGidVHRsGPfFVtFhxhWEqR+sZZf03a0VnsjuAuQb7o39kh/gQyDAbF
         w1Hw==
X-Gm-Message-State: AOAM531i0eb60RqC/Ubn85CVq5N4cR+PltOZ0cCQMhMQbTxg5lA+HOhg
	riPWXCsAcxXdhrRO1RwIGas7mcaAbPUDkQ==
X-Google-Smtp-Source: ABdhPJwuX3950z/K59rpX8/bO6kFfR1JMsTUdJVM+ZIXsnSdsxyKZvaTbngkWUx7N+Et6g+YJUEtwQ==
X-Received: by 2002:a9d:3a6:: with SMTP id f35mr3897241otf.299.1592494991380;
        Thu, 18 Jun 2020 08:43:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.43.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:43:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/21] valgrind: Backport upstream patch to fix __getauxval needs
Date: Thu, 18 Jun 2020 05:40:49 -1000
Message-Id: <a3cb468746635f5c052074c3e4de485465fd8da8.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Drop disabling outline-atomics since that was added to fix this issue in
particular

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 702a1ae29c6a0f920bd67b7a7a41b886ac52a751)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

