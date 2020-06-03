Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.11019.1591181535454606619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 03:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93757505"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 18:52:17 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D64534C4A88F
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2020 18:52:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 18:52:15 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] valgrind: upgrade 3.15.0 -> 3.16.0
Date: Wed, 3 Jun 2020 18:52:01 +0800
Message-ID: <1591181521-15405-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591181521-15405-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1591181521-15405-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D64534C4A88F.A5828
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch
0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
0004-pth_atfork1.c-Define-error-API-for-musl.patch
removed since they are included in 3.16.0

refresh 0004-Fix-out-of-tree-builds.patch

-License-Update:
before:
   You should have received a copy of the GNU General Public
   License along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307, USA.
after:
   You should have received a copy of the GNU General Public License
   along with this program; if not, see <http://www.gnu.org/licenses/>.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...d-needs-__getauxval-for-linking-with.patch | 144 ------------------
 ...ad_detatch-call-portable-across-plat.patch |  87 -----------
 .../0004-Fix-out-of-tree-builds.patch         |  85 +++++------
 ..._atfork1.c-Define-error-API-for-musl.patch |  37 -----
 ...{valgrind_3.15.0.bb => valgrind_3.16.0.bb} |   9 +-
 5 files changed, 44 insertions(+), 318 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.15.0.bb => valgrind_3.16.0.bb} (95%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch b/meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch
deleted file mode 100644
index 9afa7f6a55..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From abbc0761fa0349d49b10dc8c0f10af6bc0578c40 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Tue, 12 May 2020 16:58:36 +0200
-Subject: [PATCH 1/2] gcc10 arm64 build needs __getauxval for linking with
- libgcc
-
-Provide a new library libgcc-sup-<platform>.a that contains symbols
-needed by libgcc. This needs to be linked after -lgcc to provide
-any symbols missing which would normally be provided by glibc.
-At the moment this only provides __getauxval on arm64 linux.
-
-https://bugs.kde.org/show_bug.cgi?id=421321
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=abbc0761fa0349d49b10dc8c0f10af6bc0578c40]
-
----
- Makefile.tool.am         |  3 +-
- coregrind/Makefile.am    | 26 +++++++++++++++++
- coregrind/m_libgcc_sup.c | 61 ++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 89 insertions(+), 1 deletion(-)
- create mode 100644 coregrind/m_libgcc_sup.c
-
-diff --git a/Makefile.tool.am b/Makefile.tool.am
-index cc2fa0ee6..2bf90de5d 100644
---- a/Makefile.tool.am
-+++ b/Makefile.tool.am
-@@ -17,7 +17,8 @@ TOOL_DEPENDENCIES_@VGCONF_PLATFORM_SEC_CAPS@ = \
- endif
- 
- 
--TOOL_LDADD_COMMON = -lgcc
-+TOOL_LDADD_COMMON = -lgcc \
-+	$(top_builddir)/coregrind/libgcc-sup-@VGCONF_ARCH_PRI@-@VGCONF_OS@.a
- TOOL_LDADD_@VGCONF_PLATFORM_PRI_CAPS@ = \
- 	$(TOOL_DEPENDENCIES_@VGCONF_PLATFORM_PRI_CAPS@) $(TOOL_LDADD_COMMON)
- if VGCONF_HAVE_PLATFORM_SEC
-diff --git a/coregrind/Makefile.am b/coregrind/Makefile.am
-index 6a1a925fb..1753fb633 100644
---- a/coregrind/Makefile.am
-+++ b/coregrind/Makefile.am
-@@ -542,6 +542,32 @@ libcoregrind_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_DEPENDENCIES = \
-     libnolto_coregrind-@VGCONF_ARCH_SEC@-@VGCONF_OS@.a
- endif
- 
-+#----------------------------------------------------------------------------
-+# libgcc-sup-<platform>.a
-+# Special supplemental library for functions normally supplied by glibc
-+# used by libgcc.
-+#----------------------------------------------------------------------------
-+
-+pkglib_LIBRARIES  += libgcc-sup-@VGCONF_ARCH_PRI@-@VGCONF_OS@.a
-+if VGCONF_HAVE_PLATFORM_SEC
-+pkglib_LIBRARIES += libgcc-sup-@VGCONF_ARCH_SEC@-@VGCONF_OS@.a
-+endif
-+
-+libgcc_sup_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_SOURCES = \
-+	m_libgcc_sup.c
-+libgcc_sup_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_CPPFLAGS = \
-+	$(AM_CPPFLAGS_@VGCONF_PLATFORM_PRI_CAPS@)
-+libgcc_sup_@VGCONF_ARCH_PRI@_@VGCONF_OS@_a_CFLAGS = \
-+	$(AM_CFLAGS_PSO_@VGCONF_PLATFORM_PRI_CAPS@)
-+if VGCONF_HAVE_PLATFORM_SEC
-+libgcc_sup_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_SOURCES = \
-+	m_libgcc_sup.c
-+libgcc_sup_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_CPPFLAGS = \
-+	$(AM_CPPFLAGS_@VGCONF_PLATFORM_SEC_CAPS@)
-+libgcc_sup_@VGCONF_ARCH_SEC@_@VGCONF_OS@_a_CFLAGS = \
-+	$(AM_CFLAGS_PSO_@VGCONF_PLATFORM_SEC_CAPS@)
-+endif
-+
- #----------------------------------------------------------------------------
- # libreplacemalloc_toolpreload-<platform>.a
- #----------------------------------------------------------------------------
-diff --git a/coregrind/m_libgcc_sup.c b/coregrind/m_libgcc_sup.c
-new file mode 100644
-index 000000000..e29325459
---- /dev/null
-+++ b/coregrind/m_libgcc_sup.c
-@@ -0,0 +1,61 @@
-+/* -*- mode: C; c-basic-offset: 3; -*- */
-+
-+/*--------------------------------------------------------------------*/
-+/*--- Supplemental functions for libgcc normally provided by glibc ---*/
-+/*--------------------------------------------------------------------*/
-+
-+/*
-+   This file is part of Valgrind, a dynamic binary instrumentation
-+   framework.
-+
-+   Copyright (C) 2020 Mark Wielaard
-+      mark@klomp.org
-+
-+   This program is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU General Public License as
-+   published by the Free Software Foundation; either version 2 of the
-+   License, or (at your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program; if not, see <http://www.gnu.org/licenses/>.
-+
-+   The GNU General Public License is contained in the file COPYING.
-+*/
-+
-+#include "config.h"
-+#include "pub_core_basics.h"
-+#include "pub_core_clientstate.h"
-+
-+/*====================================================================*/
-+/*=== arm64 libgcc support function for init_have_lse_atomics      ===*/
-+/*====================================================================*/
-+
-+#if defined(VGP_arm64_linux)
-+struct auxv
-+{
-+   Word a_type;
-+   union {
-+      void *a_ptr;
-+      Word a_val;
-+   } u;
-+};
-+#define AT_NULL 0
-+
-+unsigned long int __getauxval (unsigned long int type);
-+unsigned long int __getauxval (unsigned long int type)
-+{
-+   struct auxv *p;
-+   for (p = (struct auxv *) VG_(client_auxv);
-+        p != NULL && p->a_type != AT_NULL;
-+        p++)
-+      if (p->a_type == type)
-+         return p->u.a_val;
-+
-+   return 0;
-+}
-+#endif
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
deleted file mode 100644
index f407d8191b..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-Make-pthread_detatch-call-portable-across-plat.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 92fcf75d6d3903e45492b041bf4ad07787d2e58a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 27 Jan 2020 19:50:04 -0800
-Subject: [PATCH] drd/tests/pth_detached3: Make pthread_detach() call portable
- across platforms
-
-pthread_t is opaque type therefore we can not apply simple arithmetic to
-variables of pthread_t type this test needs to pass a invalid pthread_t
-handle, typcasting to uintptr_t works too and is portable across glibc and
-musl
-
-Fixes
-| pth_detached3.c:24:25: error: invalid use of undefined type 'struct __pthread'
-|    24 |   pthread_detach(thread + 8);
-|       |                         ^
-
-[ bvanassche: reformatted patch description and fixed up line numbers ]
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=92fcf75d6d3903e45492b041bf4ad07787d2e58a]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- drd/tests/pth_detached3.c           | 3 ++-
- drd/tests/pth_detached3.stderr.exp1 | 4 ++--
- drd/tests/pth_detached3.stderr.exp2 | 4 ++--
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
-index c02eef1..efeb15b 100644
---- a/drd/tests/pth_detached3.c
-+++ b/drd/tests/pth_detached3.c
-@@ -4,6 +4,7 @@
- #include <errno.h>
- #include <pthread.h>
- #include <stdio.h>
-+#include <stdint.h>
- 
- static void* thread_func(void* arg)
- {
-@@ -21,7 +22,7 @@ int main(int argc, char** argv)
-   pthread_detach(thread);
- 
-   /* Invoke pthread_detach() with an invalid thread ID. */
--  pthread_detach(thread + 8);
-+  pthread_detach((pthread_t)((uintptr_t)thread + 8));
- 
-   fprintf(stderr, "Finished.\n");
- 
-diff --git a/drd/tests/pth_detached3.stderr.exp1 b/drd/tests/pth_detached3.stderr.exp1
-index 58412ec..8dd58ba 100644
---- a/drd/tests/pth_detached3.stderr.exp1
-+++ b/drd/tests/pth_detached3.stderr.exp1
-@@ -1,11 +1,11 @@
- 
- pthread_detach(): invalid thread ID 0x........
-    at 0x........: pthread_detach (drd_pthread_intercepts.c:?)
--   by 0x........: main (pth_detached3.c:21)
-+   by 0x........: main (pth_detached3.c:22)
- 
- pthread_detach(): invalid thread ID 0x........
-    at 0x........: pthread_detach (drd_pthread_intercepts.c:?)
--   by 0x........: main (pth_detached3.c:24)
-+   by 0x........: main (pth_detached3.c:25)
- 
- Finished.
- 
-diff --git a/drd/tests/pth_detached3.stderr.exp2 b/drd/tests/pth_detached3.stderr.exp2
-index bdc5cf8..e82dee1 100644
---- a/drd/tests/pth_detached3.stderr.exp2
-+++ b/drd/tests/pth_detached3.stderr.exp2
-@@ -2,12 +2,12 @@
- pthread_detach(): invalid thread ID 0x........
-    at 0x........: vgDrd_set_joinable (drd_pthread_intercepts.c:?)
-    by 0x........: pthread_detach (drd_pthread_intercepts.c:?)
--   by 0x........: main (pth_detached3.c:21)
-+   by 0x........: main (pth_detached3.c:22)
- 
- pthread_detach(): invalid thread ID 0x........
-    at 0x........: vgDrd_set_joinable (drd_pthread_intercepts.c:?)
-    by 0x........: pthread_detach (drd_pthread_intercepts.c:?)
--   by 0x........: main (pth_detached3.c:24)
-+   by 0x........: main (pth_detached3.c:25)
- 
- Finished.
- 
--- 
-2.9.3
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
index 75bb0aa7cb..4570f63995 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -4,7 +4,8 @@ Date: Tue, 16 Oct 2018 21:01:04 -0400
 Subject: [PATCH] Fix out of tree builds.
 
 The paths to these files need to be fully specified in
-the out of tree build case. glibc-2.X.supp is a generated file so the full path
+the out of tree build case. glibc-2.X.supp is a generated file so the
+full path
 is deliberately not specified in that case.
 
 RP 2013/03/23
@@ -16,81 +17,81 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
- configure.ac | 68 ++++++++++++++++++++++++++--------------------------
- 1 file changed, 34 insertions(+), 34 deletions(-)
+ configure.ac | 66 ++++++++++++++++++++++++++--------------------------
+ 1 file changed, 33 insertions(+), 33 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c18ae5f2a..99667ce57 100644
+index 524230d..54861c5 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -392,50 +392,50 @@ case "${host_os}" in
+@@ -396,50 +396,50 @@ case "${host_os}" in
  	     9.*)
  		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin9.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin9-drd.supp ${DEFAULT_SUPP}"
-+ 		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
-+ 		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     10.*)
  		  AC_MSG_RESULT([Darwin 10.x (${kernel}) / Mac OS X 10.6 Snow Leopard])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_6, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin10.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     11.*)
  		  AC_MSG_RESULT([Darwin 11.x (${kernel}) / Mac OS X 10.7 Lion])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_7, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin11.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin11.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin11.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     12.*)
  		  AC_MSG_RESULT([Darwin 12.x (${kernel}) / Mac OS X 10.8 Mountain Lion])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_8, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin12.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin12.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin12.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     13.*)
  		  AC_MSG_RESULT([Darwin 13.x (${kernel}) / Mac OS X 10.9 Mavericks])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_9, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin13.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin13.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin13.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     14.*)
  		  AC_MSG_RESULT([Darwin 14.x (${kernel}) / Mac OS X 10.10 Yosemite])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_10, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin14.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin14.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin14.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     15.*)
  		  AC_MSG_RESULT([Darwin 15.x (${kernel}) / Mac OS X 10.11 El Capitan])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_11, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin15.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin15.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin15.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     16.*)
  		  AC_MSG_RESULT([Darwin 16.x (${kernel}) / macOS 10.12 Sierra])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_12, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin16.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin16.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin16.supp ${DEFAULT_SUPP}"
++                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     17.*)
  		  AC_MSG_RESULT([Darwin 17.x (${kernel}) / macOS 10.13 High Sierra])
-@@ -460,7 +460,7 @@ case "${host_os}" in
+@@ -464,7 +464,7 @@ case "${host_os}" in
                   DEFAULT_SUPP="solaris12.supp ${DEFAULT_SUPP}"
                   ;;
               *)
@@ -99,7 +100,7 @@ index c18ae5f2a..99667ce57 100644
                   ;;
  	esac
          ;;
-@@ -468,7 +468,7 @@ case "${host_os}" in
+@@ -472,7 +472,7 @@ case "${host_os}" in
       solaris2.12*)
          AC_MSG_RESULT([ok (${host_os})])
          VGCONF_OS="solaris"
@@ -108,33 +109,33 @@ index c18ae5f2a..99667ce57 100644
          ;;
  
       *) 
-@@ -1051,29 +1051,29 @@ AC_MSG_CHECKING([the glibc version])
+@@ -1095,29 +1095,29 @@ AC_MSG_CHECKING([the glibc version])
  case "${GLIBC_VERSION}" in
       2.2)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
 -	DEFAULT_SUPP="glibc-2.2.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.2.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.2.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
       2.[[3-6]])
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
 -	DEFAULT_SUPP="glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
       2.[[7-9]])
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
       2.10|2.11)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
@@ -143,23 +144,23 @@ index c18ae5f2a..99667ce57 100644
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
       2.*)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
-@@ -1082,8 +1082,8 @@ case "${GLIBC_VERSION}" in
+@@ -1126,8 +1126,8 @@ case "${GLIBC_VERSION}" in
  	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
  		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
 -	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
++        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
  	;;
       darwin)
  	AC_MSG_RESULT(Darwin)
-@@ -1093,7 +1093,7 @@ case "${GLIBC_VERSION}" in
+@@ -1137,7 +1137,7 @@ case "${GLIBC_VERSION}" in
       bionic)
  	AC_MSG_RESULT(Bionic)
  	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
@@ -168,7 +169,7 @@ index c18ae5f2a..99667ce57 100644
  	;;
       solaris)
  	AC_MSG_RESULT(Solaris)
-@@ -1120,11 +1120,11 @@ if test "$VGCONF_OS" != "solaris"; then
+@@ -1164,8 +1164,8 @@ if test "$VGCONF_OS" != "solaris"; then
      # attempt to detect whether such libraries are installed on the
      # build machine (or even if any X facilities are present); just
      # add the suppressions antidisirregardless.
@@ -176,13 +177,9 @@ index c18ae5f2a..99667ce57 100644
 -    DEFAULT_SUPP="xfree-3.supp ${DEFAULT_SUPP}"
 +    DEFAULT_SUPP="$srcdir/xfree-4.supp ${DEFAULT_SUPP}"
 +    DEFAULT_SUPP="$srcdir/xfree-3.supp ${DEFAULT_SUPP}"
- 
-     # Add glibc and X11 suppressions for exp-sgcheck
--    DEFAULT_SUPP="exp-sgcheck.supp ${DEFAULT_SUPP}"
-+    DEFAULT_SUPP="$srcdir/exp-sgcheck.supp ${DEFAULT_SUPP}"
  fi
  
  
 -- 
-2.17.0
+2.17.1
 
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch
deleted file mode 100644
index 1cb7062545..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From fb77fef4f866dac7bcc6d1ae025da60564869f84 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 10 Jun 2017 01:06:11 -0700
-Subject: [PATCH 4/6] pth_atfork1.c: Define error() API for musl
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- none/tests/pth_atfork1.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/none/tests/pth_atfork1.c b/none/tests/pth_atfork1.c
-index 34201ef..b7f5f2d 100644
---- a/none/tests/pth_atfork1.c
-+++ b/none/tests/pth_atfork1.c
-@@ -18,7 +18,7 @@
-    Boston, MA 02111-1307, USA.  */
- 
- #include <errno.h>
--#if !defined(__APPLE__) && !defined(__sun)
-+#if !defined(__APPLE__) && !defined(__sun) && defined(__GLIBC__)
- # include <error.h>
- #endif
- #include <stdlib.h>
-@@ -27,7 +27,7 @@
- #include <sys/wait.h>
- #include <stdio.h>
- 
--#if defined(__APPLE__) || defined(__sun)
-+#if defined(__APPLE__) || defined(__sun) || (defined(__linux__) && !defined(__GLIBC__))
- #include <string.h>  /* strerror */
- static void error (int status, int errnum, char* msg)
- {
--- 
-2.13.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb
similarity index 95%
rename from meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.16.0.bb
index a764d18177..5402f39a5b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=d4de0407239381463cf01dd276d7c22e \
+                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=41c410e8d3f305aee7aaa666b2e4f366 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
@@ -27,7 +27,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
            file://0002-context-APIs-are-not-available-on-musl.patch \
            file://0003-correct-include-directive-path-for-config.h.patch \
-           file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
            file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
            file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
@@ -40,12 +39,10 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
-           file://0001-tests-Make-pthread_detatch-call-portable-across-plat.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
-           file://0001-gcc10-arm64-build-needs-__getauxval-for-linking-with.patch \
            "
-SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
-SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
+SRC_URI[md5sum] = "495b30af5e5ed62ebb9bb777ee19b27f"
+SRC_URI[sha256sum] = "582d5127ba56dfeaab4c6ced92a742b2921148e28a5d55055aedd8f75f1cf633"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.17.1



