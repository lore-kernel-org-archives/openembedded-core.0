Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE13787C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 00:50:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 16:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,394,1511856000"; d="scan'208";a="11919057"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga008.jf.intel.com with ESMTP; 21 Jan 2018 16:50:01 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 16:49:53 -0800
Message-Id: <20180122004953.8117-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] systemd-bootchart: upgrade to v233; fix build with musl
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
X-List-Received-Date: Mon, 22 Jan 2018 00:50:01 -0000

* Drop xlocale.h patch, merged upstream
* Rework patches from systemd to fix musl build
  - comparison_fn_t is glibc specific
  - musl does not provide printf.h
  - musl does not provide canonicalize_file_name

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../0001-parse-util-Don-t-use-xlocale.h.patch      |  32 --
 ...fn_t-is-glibc-specific-use-raw-signature-.patch |  36 ++
 .../0002-musl-does-not-provide-printf-h.patch      | 423 +++++++++++++++++++++
 ...l-does-not-provide-canonicalize_file_name.patch |  33 ++
 ...d-bootchart_231.bb => systemd-bootchart_233.bb} |  12 +-
 5 files changed, 501 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
 rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_231.bb => systemd-bootchart_233.bb} (73%)

diff --git a/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch b/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
deleted file mode 100644
index 5aa0463ac8..0000000000
--- a/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d379126d56d0b6e935b2d97ca71579e6cc54d1bb Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 18 Jul 2017 13:37:27 +0300
-Subject: [PATCH] parse-util: Don't use xlocale.h
-
-glibc 2.26 no longer contains the non-standard xlocale.h
-(http://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27xlocale.h.27)
-
-This change shouldn't break anything as xlocale.h was a subset of
-locale.h.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/35]
----
- src/parse-util.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/parse-util.c b/src/parse-util.c
-index 5635a68..1b2169c 100644
---- a/src/parse-util.c
-+++ b/src/parse-util.c
-@@ -21,7 +21,6 @@
- #include <locale.h>
- #include <stdlib.h>
- #include <string.h>
--#include <xlocale.h>
- 
- #include "macro.h"
- #include "parse-util.h"
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
new file mode 100644
index 0000000000..f392ceafcc
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
@@ -0,0 +1,36 @@
+From 45b401a947af944c20b3c451a35dfe53bca5ef3b Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Thu, 28 Dec 2017 21:24:57 -0800
+Subject: [PATCH 1/3] comparison_fn_t is glibc specific, use raw signature in
+ function pointer
+
+Make it work with musl where comparison_fn_t is not provided
+
+Reuse the approach from systemd:
+systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
+
+Based on work by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+---
+Upstream-Status: Pending
+
+ src/util.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util.h b/src/util.h
+index 561f9e7..e9cfd81 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -57,7 +57,7 @@ extern char **saved_argv;
+  * Normal qsort requires base to be nonnull. Here were require
+  * that only if nmemb > 0.
+  */
+-static inline void qsort_safe(void *base, size_t nmemb, size_t size, comparison_fn_t compar) {
++static inline void qsort_safe(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *)) {
+         if (nmemb <= 1)
+                 return;
+ 
+-- 
+2.13.6
+
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
new file mode 100644
index 0000000000..196272f7a2
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
@@ -0,0 +1,423 @@
+From 6f9454184a02310802b1ed3e40287958b524a495 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Thu, 28 Dec 2017 21:39:51 -0800
+Subject: [PATCH 2/3] musl does not provide printf.h
+
+Reuse the approach from systemd:
+systemd/0001-add-fallback-parse_printf_format-implementation.patch
+
+Original patch author: Emil Renner Berthing <systemd@esmil.dk>
+Includes work by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+---
+Upstream-Status: Pending
+
+ Makefile.am               |   4 +
+ configure.ac              |   3 +
+ src/log.c                 |   1 +
+ src/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++++++++++++++++
+ src/parse-printf-format.h |  57 ++++++++++
+ src/stdio-util.h          |   1 -
+ 6 files changed, 338 insertions(+), 1 deletion(-)
+ create mode 100644 src/parse-printf-format.c
+ create mode 100644 src/parse-printf-format.h
+
+diff --git a/Makefile.am b/Makefile.am
+index 9bbc8fa..b887d16 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -169,6 +169,10 @@ libutils_la_SOURCES = \
+ 	src/util.c \
+ 	src/util.h
+ 
++if !HAVE_PRINTF_H 
++libutils_la_SOURCES += src/parse-printf-format.c
++endif
++
+ libutils_la_CFLAGS = \
+ 	$(AM_CFLAGS) \
+ 	$(LIBSYSTEMD_CFLAGS)
+diff --git a/configure.ac b/configure.ac
+index 7f74bac..062e310 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -73,6 +73,9 @@ AS_IF([test "x$with_libsystemd" != xno],
+         )]
+ )
+ 
++AC_CHECK_HEADERS([printf.h], [], [])
++AM_CONDITIONAL(HAVE_PRINTF_H, [test "x$ac_cv_header_print_h" = xyes])
++
+ CC_CHECK_FLAGS_APPEND([with_cflags], [CFLAGS], [\
+         -pipe \
+         -Wall \
+diff --git a/src/log.c b/src/log.c
+index 15dec83..aecf231 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -28,6 +28,7 @@
+ #include <sys/uio.h>
+ #include <unistd.h>
+ 
++#include "parse-printf-format.h"
+ #include "sd-messages.h"
+ 
+ #include "fd-util.h"
+diff --git a/src/parse-printf-format.c b/src/parse-printf-format.c
+new file mode 100644
+index 0000000..49437e5
+--- /dev/null
++++ b/src/parse-printf-format.c
+@@ -0,0 +1,273 @@
++/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
++
++/***
++  This file is part of systemd.
++
++  Copyright 2014 Emil Renner Berthing <systemd@esmil.dk>
++
++  With parts from the musl C library
++  Copyright 2005-2014 Rich Felker, et al.
++
++  systemd is free software; you can redistribute it and/or modify it
++  under the terms of the GNU Lesser General Public License as published by
++  the Free Software Foundation; either version 2.1 of the License, or
++  (at your option) any later version.
++
++  systemd is distributed in the hope that it will be useful, but
++  WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public License
++  along with systemd; If not, see <http://www.gnu.org/licenses/>.
++***/
++
++#include <stddef.h>
++#include <string.h>
++
++#include "parse-printf-format.h"
++
++static const char *consume_nonarg(const char *fmt)
++{
++        do {
++                if (*fmt == '\0')
++                        return fmt;
++        } while (*fmt++ != '%');
++        return fmt;
++}
++
++static const char *consume_num(const char *fmt)
++{
++        for (;*fmt >= '0' && *fmt <= '9'; fmt++)
++                /* do nothing */;
++        return fmt;
++}
++
++static const char *consume_argn(const char *fmt, size_t *arg)
++{
++        const char *p = fmt;
++        size_t val = 0;
++
++        if (*p < '1' || *p > '9')
++                return fmt;
++        do {
++                val = 10*val + (*p++ - '0');
++        } while (*p >= '0' && *p <= '9');
++
++        if (*p != '$')
++                return fmt;
++        *arg = val;
++        return p+1;
++}
++
++static const char *consume_flags(const char *fmt)
++{
++        while (1) {
++                switch (*fmt) {
++                case '#':
++                case '0':
++                case '-':
++                case ' ':
++                case '+':
++                case '\'':
++                case 'I':
++                        fmt++;
++                        continue;
++                }
++                return fmt;
++        }
++}
++
++enum state {
++        BARE,
++        LPRE,
++        LLPRE,
++        HPRE,
++        HHPRE,
++        BIGLPRE,
++        ZTPRE,
++        JPRE,
++        STOP
++};
++
++enum type {
++        NONE,
++        PTR,
++        INT,
++        UINT,
++        ULLONG,
++        LONG,
++        ULONG,
++        SHORT,
++        USHORT,
++        CHAR,
++        UCHAR,
++        LLONG,
++        SIZET,
++        IMAX,
++        UMAX,
++        PDIFF,
++        UIPTR,
++        DBL,
++        LDBL,
++        MAXTYPE
++};
++
++static const short pa_types[MAXTYPE] = {
++        [NONE]   = PA_INT,
++        [PTR]    = PA_POINTER,
++        [INT]    = PA_INT,
++        [UINT]   = PA_INT,
++        [ULLONG] = PA_INT | PA_FLAG_LONG_LONG,
++        [LONG]   = PA_INT | PA_FLAG_LONG,
++        [ULONG]  = PA_INT | PA_FLAG_LONG,
++        [SHORT]  = PA_INT | PA_FLAG_SHORT,
++        [USHORT] = PA_INT | PA_FLAG_SHORT,
++        [CHAR]   = PA_CHAR,
++        [UCHAR]  = PA_CHAR,
++        [LLONG]  = PA_INT | PA_FLAG_LONG_LONG,
++        [SIZET]  = PA_INT | PA_FLAG_LONG,
++        [IMAX]   = PA_INT | PA_FLAG_LONG_LONG,
++        [UMAX]   = PA_INT | PA_FLAG_LONG_LONG,
++        [PDIFF]  = PA_INT | PA_FLAG_LONG_LONG,
++        [UIPTR]  = PA_INT | PA_FLAG_LONG,
++        [DBL]    = PA_DOUBLE,
++        [LDBL]   = PA_DOUBLE | PA_FLAG_LONG_DOUBLE
++};
++
++#define S(x) [(x)-'A']
++#define E(x) (STOP + (x))
++
++static const unsigned char states[]['z'-'A'+1] = {
++        { /* 0: bare types */
++                S('d') = E(INT), S('i') = E(INT),
++                S('o') = E(UINT),S('u') = E(UINT),S('x') = E(UINT), S('X') = E(UINT),
++                S('e') = E(DBL), S('f') = E(DBL), S('g') = E(DBL),  S('a') = E(DBL),
++                S('E') = E(DBL), S('F') = E(DBL), S('G') = E(DBL),  S('A') = E(DBL),
++                S('c') = E(CHAR),S('C') = E(INT),
++                S('s') = E(PTR), S('S') = E(PTR), S('p') = E(UIPTR),S('n') = E(PTR),
++                S('m') = E(NONE),
++                S('l') = LPRE,   S('h') = HPRE, S('L') = BIGLPRE,
++                S('z') = ZTPRE,  S('j') = JPRE, S('t') = ZTPRE
++        }, { /* 1: l-prefixed */
++                S('d') = E(LONG), S('i') = E(LONG),
++                S('o') = E(ULONG),S('u') = E(ULONG),S('x') = E(ULONG),S('X') = E(ULONG),
++                S('e') = E(DBL),  S('f') = E(DBL),  S('g') = E(DBL),  S('a') = E(DBL),
++                S('E') = E(DBL),  S('F') = E(DBL),  S('G') = E(DBL),  S('A') = E(DBL),
++                S('c') = E(INT),  S('s') = E(PTR),  S('n') = E(PTR),
++                S('l') = LLPRE
++        }, { /* 2: ll-prefixed */
++                S('d') = E(LLONG), S('i') = E(LLONG),
++                S('o') = E(ULLONG),S('u') = E(ULLONG),
++                S('x') = E(ULLONG),S('X') = E(ULLONG),
++                S('n') = E(PTR)
++        }, { /* 3: h-prefixed */
++                S('d') = E(SHORT), S('i') = E(SHORT),
++                S('o') = E(USHORT),S('u') = E(USHORT),
++                S('x') = E(USHORT),S('X') = E(USHORT),
++                S('n') = E(PTR),
++                S('h') = HHPRE
++        }, { /* 4: hh-prefixed */
++                S('d') = E(CHAR), S('i') = E(CHAR),
++                S('o') = E(UCHAR),S('u') = E(UCHAR),
++                S('x') = E(UCHAR),S('X') = E(UCHAR),
++                S('n') = E(PTR)
++        }, { /* 5: L-prefixed */
++                S('e') = E(LDBL),S('f') = E(LDBL),S('g') = E(LDBL), S('a') = E(LDBL),
++                S('E') = E(LDBL),S('F') = E(LDBL),S('G') = E(LDBL), S('A') = E(LDBL),
++                S('n') = E(PTR)
++        }, { /* 6: z- or t-prefixed (assumed to be same size) */
++                S('d') = E(PDIFF),S('i') = E(PDIFF),
++                S('o') = E(SIZET),S('u') = E(SIZET),
++                S('x') = E(SIZET),S('X') = E(SIZET),
++                S('n') = E(PTR)
++        }, { /* 7: j-prefixed */
++                S('d') = E(IMAX), S('i') = E(IMAX),
++                S('o') = E(UMAX), S('u') = E(UMAX),
++                S('x') = E(UMAX), S('X') = E(UMAX),
++                S('n') = E(PTR)
++        }
++};
++
++size_t parse_printf_format(const char *fmt, size_t n, int *types)
++{
++        size_t i = 0;
++        size_t last = 0;
++
++        memset(types, 0, n);
++
++        while (1) {
++                size_t arg;
++                unsigned int state;
++
++                fmt = consume_nonarg(fmt);
++                if (*fmt == '\0')
++                        break;
++                if (*fmt == '%') {
++                        fmt++;
++                        continue;
++                }
++                arg = 0;
++                fmt = consume_argn(fmt, &arg);
++                /* flags */
++                fmt = consume_flags(fmt);
++                /* width */
++                if (*fmt == '*') {
++                        size_t warg = 0;
++                        fmt = consume_argn(fmt+1, &warg);
++                        if (warg == 0)
++                                warg = ++i;
++                        if (warg > last)
++                                last = warg;
++                        if (warg <= n && types[warg-1] == NONE)
++                                types[warg-1] = INT;
++                } else
++                        fmt = consume_num(fmt);
++                /* precision */
++                if (*fmt == '.') {
++                        fmt++;
++                        if (*fmt == '*') {
++                                size_t parg = 0;
++                                fmt = consume_argn(fmt+1, &parg);
++                                if (parg == 0)
++                                        parg = ++i;
++                                if (parg > last)
++                                        last = parg;
++                                if (parg <= n && types[parg-1] == NONE)
++                                        types[parg-1] = INT;
++                        } else {
++                                if (*fmt == '-')
++                                        fmt++;
++                                fmt = consume_num(fmt);
++                        }
++                }
++                /* length modifier and conversion specifier */
++                state = BARE;
++                do {
++                        unsigned char c = *fmt++;
++
++                        if (c < 'A' || c > 'z')
++                                continue;
++                        state = states[state]S(c);
++                        if (state == 0)
++                                continue;
++                } while (state < STOP);
++
++                if (state == E(NONE))
++                        continue;
++
++                if (arg == 0)
++                        arg = ++i;
++                if (arg > last)
++                        last = arg;
++                if (arg <= n)
++                        types[arg-1] = state - STOP;
++        }
++
++        if (last > n)
++                last = n;
++        for (i = 0; i < last; i++)
++                types[i] = pa_types[types[i]];
++
++        return last;
++}
+diff --git a/src/parse-printf-format.h b/src/parse-printf-format.h
+new file mode 100644
+index 0000000..4371177
+--- /dev/null
++++ b/src/parse-printf-format.h
+@@ -0,0 +1,57 @@
++/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
++
++/***
++  This file is part of systemd.
++
++  Copyright 2014 Emil Renner Berthing <systemd@esmil.dk>
++
++  With parts from the GNU C Library
++  Copyright 1991-2014 Free Software Foundation, Inc.
++
++  systemd is free software; you can redistribute it and/or modify it
++  under the terms of the GNU Lesser General Public License as published by
++  the Free Software Foundation; either version 2.1 of the License, or
++  (at your option) any later version.
++
++  systemd is distributed in the hope that it will be useful, but
++  WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public License
++  along with systemd; If not, see <http://www.gnu.org/licenses/>.
++***/
++
++#pragma once
++
++#include "config.h"
++
++#ifdef HAVE_PRINTF_H
++#include <printf.h>
++#else
++
++#include <stddef.h>
++
++enum {				/* C type: */
++  PA_INT,			/* int */
++  PA_CHAR,			/* int, cast to char */
++  PA_WCHAR,			/* wide char */
++  PA_STRING,			/* const char *, a '\0'-terminated string */
++  PA_WSTRING,			/* const wchar_t *, wide character string */
++  PA_POINTER,			/* void * */
++  PA_FLOAT,			/* float */
++  PA_DOUBLE,			/* double */
++  PA_LAST
++};
++
++/* Flag bits that can be set in a type returned by `parse_printf_format'.  */
++#define	PA_FLAG_MASK		0xff00
++#define	PA_FLAG_LONG_LONG	(1 << 8)
++#define	PA_FLAG_LONG_DOUBLE	PA_FLAG_LONG_LONG
++#define	PA_FLAG_LONG		(1 << 9)
++#define	PA_FLAG_SHORT		(1 << 10)
++#define	PA_FLAG_PTR		(1 << 11)
++
++size_t parse_printf_format(const char *fmt, size_t n, int *types);
++
++#endif /* HAVE_PRINTF_H */
+diff --git a/src/stdio-util.h b/src/stdio-util.h
+index 0a67557..21cc515 100644
+--- a/src/stdio-util.h
++++ b/src/stdio-util.h
+@@ -19,7 +19,6 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
+-#include <printf.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <sys/types.h>
+-- 
+2.13.6
+
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
new file mode 100644
index 0000000000..7670d95f07
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
@@ -0,0 +1,33 @@
+From 79396449d264bde58b4daa3ef6dd99f0f0652429 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Thu, 28 Dec 2017 22:10:58 -0800
+Subject: [PATCH 3/3] musl does not provide canonicalize_file_name
+
+Reuse the approach from systemd:
+systemd/0007-check-for-missing-canonicalize_file_name.patch
+
+Based on work by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+---
+Upstream-Status: Pending
+
+ src/path-util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/path-util.c b/src/path-util.c
+index 2fb6366..12e2e17 100644
+--- a/src/path-util.c
++++ b/src/path-util.c
+@@ -63,7 +63,7 @@ char **path_strv_resolve(char **l, const char *prefix) {
+                         t = *s;
+ 
+                 errno = 0;
+-                u = canonicalize_file_name(t);
++                u = realpath(t, NULL);
+                 if (!u) {
+                         if (errno == ENOENT) {
+                                 if (prefix) {
+-- 
+2.13.6
+
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
similarity index 73%
rename from meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
rename to meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
index 4da000e5d0..1ae21b1fbc 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
@@ -3,12 +3,18 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
-           file://0001-parse-util-Don-t-use-xlocale.h.patch \
 "
 
+SRC_URI_append_libc-musl = " \
+    file://0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
+    file://0002-musl-does-not-provide-printf-h.patch \
+    file://0003-musl-does-not-provide-canonicalize_file_name.patch \
+    "
+
+
 # Modify these as desired
-PV = "231+git${SRCPV}"
-SRCREV = "9ee2ffc1dc6c8209725e625954bbd89f96cb7139"
+PV = "233+git${SRCPV}"
+SRCREV = "fe1c5e41e6bdb78043dad8fa863fc2df66d1dadf"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.6


