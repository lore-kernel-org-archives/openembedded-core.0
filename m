Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id D28D278213
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 05:10:52 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id b79so4150064pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 22:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4jSc1Lcdj3936OTeN5vU/wC+qtOFNZn07UlpkEEYApY=;
	b=PudNb31a910nOzgKNMIiEmPgbiks3OcUZN2/WeQ6O6BV+EV6uTdwj/xM25pnc9aIFN
	lQLMxWdU9lHYdAQ1caIaUMTb3+PJd/PeDc00OxqMw8ppGIK/3saBL2aEY0yADSNPkPBF
	RctyUpO2ijw06Fi6mZJkUMYUC8jnN2bvSytyQHPoeqWAIhFAUjAPF0Mf27pdRj09Vvjy
	dxVMBYLJ/yjpGaWq09Zk2R986vpWcMSe+b2WMm060m3ls5BBwLfkl6kDd7QPRC0SC+FE
	hS/T8C42IfFwocfc22SktKiz3TMlnsNmox2YO4dQJZHnp3v+4GEZGS1D3lVyTxB2Ddin
	CdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4jSc1Lcdj3936OTeN5vU/wC+qtOFNZn07UlpkEEYApY=;
	b=HD9M9LjfAiaII51PzsqxRZ0h/DnR+hiViZ4BdlcrvHsQ4CFIaOIbbHcdIemBJgMyWi
	wF0XR5Ug9+9GeX08wX4UtxhLmVp0leJlYbncNexCHvo5C/UzAf96oZIkA72KZZ/Nv6tQ
	hb1JwJqN5Keq97DwKGP/IyHS+CHJ1GAukeYfvOvbaEW70B34s8ggiG+c+UU+HdLqfLlQ
	Ay5NpbtpYFOs3Qfe12I2H+9kjcM5sBbtGTW9srVf30ATZe04quVlxIvFjGZIVen5//fD
	ds0PtoTf2hw/9urjQKNXnvCX5kvyvEc/r6D3xe+s0DG9obfyf1ZaWr/uxb+Nyqo/jzla
	hdog==
X-Gm-Message-State: AMCzsaXMAcIn2uqnhLQ6HWABVCW/ZfPlnXDwvhieIpPfY119QW7/r/RZ
	naIlKcqt1wf3xaH2sQ3uPq76sw==
X-Google-Smtp-Source: ABhQp+RxeQm2P8Bg+KVShGe1qKRKSFO6o6MOwPztikVpQCtIkXroEMtK/3nmD0mX3Tbq/BMZHDsefw==
X-Received: by 10.99.108.2 with SMTP id h2mr7086667pgc.362.1509081052391;
	Thu, 26 Oct 2017 22:10:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	h185sm10657472pgc.55.2017.10.26.22.10.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Oct 2017 22:10:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2017 22:10:42 -0700
Message-Id: <20171027051042.2935-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] systemd: Fix build on musl
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
X-List-Received-Date: Fri, 27 Oct 2017 05:10:53 -0000

Add needed patches for portability across glibc/musl
enable systemd on musl too

Disable utmp,ldconfig,nss,resolved,localed for musl
which is not supported on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch |  43 ++
 ...llback-parse_printf_format-implementation.patch | 433 +++++++++++++++++++++
 ...asic-missing.h-check-for-missing-strndupa.patch | 104 +++++
 ...if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch | 157 ++++++++
 ...issing.h-check-for-missing-__compar_fn_t-.patch |  47 +++
 .../systemd/0006-Include-netinet-if_ether.h.patch  |  86 ++++
 ...-check-for-missing-canonicalize_file_name.patch |  63 +++
 .../systemd/0008-Do-not-enable-nss-tests.patch     |  35 ++
 ...xdecoct.c-Include-missing.h-form-strndupa.patch |  27 ++
 ....c-Disable-tests-for-missing-typedefs-in-.patch |  49 +++
 .../0011-don-t-use-glibc-specific-qsort_r.patch    | 105 +++++
 ...ass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  99 +++++
 ...fn_t-is-glibc-specific-use-raw-signature-.patch |  31 ++
 meta/recipes-core/systemd/systemd_234.bb           |  28 +-
 14 files changed, 1300 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch b/meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
new file mode 100644
index 0000000000..35599d44c2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
@@ -0,0 +1,43 @@
+From 3ca5326485cb19e775af6de615c17be66e44e472 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Oct 2017 23:08:24 -0700
+Subject: [PATCH] Define _PATH_WTMPX and _PATH_UTMPX if not defined
+
+Musl needs these defines
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/shared/utmp-wtmp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/shared/utmp-wtmp.c b/src/shared/utmp-wtmp.c
+index 9750dcd81..bd55d74a1 100644
+--- a/src/shared/utmp-wtmp.c
++++ b/src/shared/utmp-wtmp.c
+@@ -27,6 +27,7 @@
+ #include <sys/time.h>
+ #include <sys/utsname.h>
+ #include <unistd.h>
++#include <utmp.h>
+ #include <utmpx.h>
+ 
+ #include "alloc-util.h"
+@@ -41,6 +42,13 @@
+ #include "util.h"
+ #include "utmp-wtmp.h"
+ 
++#if defined _PATH_UTMP && !defined _PATH_UTMPX
++# define _PATH_UTMPX _PATH_UTMP
++#endif
++#if defined _PATH_WTMP && !defined _PATH_WTMPX
++# define _PATH_WTMPX _PATH_WTMP
++#endif
++
+ int utmp_get_runlevel(int *runlevel, int *previous) {
+         struct utmpx *found, lookup = { .ut_type = RUN_LVL };
+         int r;
+-- 
+2.14.3
+
diff --git a/meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
new file mode 100644
index 0000000000..e2f7458abe
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-add-fallback-parse_printf_format-implementation.patch
@@ -0,0 +1,433 @@
+From 0933ca6251808f856b92b0ce8da8696d5febc333 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Mon, 23 Oct 2017 10:41:39 -0700
+Subject: [PATCH 01/12] add fallback parse_printf_format implementation
+
+Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile.am                     |   4 +
+ configure.ac                    |   2 +
+ src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++++++++++
+ src/basic/parse-printf-format.h |  57 +++++++++
+ src/basic/stdio-util.h          |   2 +-
+ src/journal/journal-send.c      |   2 +-
+ 6 files changed, 338 insertions(+), 2 deletions(-)
+ create mode 100644 src/basic/parse-printf-format.c
+ create mode 100644 src/basic/parse-printf-format.h
+
+diff --git a/Makefile.am b/Makefile.am
+index 692d7bb95..3cc8f3451 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -997,6 +997,10 @@ libbasic_la_SOURCES = \
+ 	src/basic/journal-importer.h \
+ 	src/basic/journal-importer.c
+ 
++if !HAVE_PRINTF_H
++libbasic_la_SOURCES += src/basic/parse-printf-format.c
++endif
++
+ nodist_libbasic_la_SOURCES = \
+ 	src/basic/errno-from-name.h \
+ 	src/basic/errno-to-name.h \
+diff --git a/configure.ac b/configure.ac
+index 60e7df5ee..efcdc6c16 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -308,8 +308,10 @@ AC_CHECK_HEADERS([uchar.h], [], [])
+ AC_CHECK_HEADERS([sys/capability.h], [], [AC_MSG_ERROR([*** POSIX caps headers not found])])
+ AC_CHECK_HEADERS([linux/btrfs.h], [], [])
+ AC_CHECK_HEADERS([linux/memfd.h], [], [])
++AC_CHECK_HEADERS([printf.h], [], [])
+ AC_CHECK_HEADERS([linux/vm_sockets.h], [], [], [#include <sys/socket.h>])
+ 
++AM_CONDITIONAL(HAVE_PRINTF_H, [test "x$ac_cv_header_printf_h" = xyes])
+ # unconditionally pull-in librt with old glibc versions
+ AC_SEARCH_LIBS([clock_gettime], [rt], [], [])
+ 
+diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
+new file mode 100644
+index 000000000..49437e544
+--- /dev/null
++++ b/src/basic/parse-printf-format.c
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
+diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
+new file mode 100644
+index 000000000..4371177b0
+--- /dev/null
++++ b/src/basic/parse-printf-format.h
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
+diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
+index bd1144b4c..c9c95eb54 100644
+--- a/src/basic/stdio-util.h
++++ b/src/basic/stdio-util.h
+@@ -19,12 +19,12 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
+-#include <printf.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <sys/types.h>
+ 
+ #include "macro.h"
++#include "parse-printf-format.h"
+ 
+ #define xsprintf(buf, fmt, ...) \
+         assert_message_se((size_t) snprintf(buf, ELEMENTSOF(buf), fmt, __VA_ARGS__) < ELEMENTSOF(buf), "xsprintf: " #buf "[] must be big enough")
+diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
+index 440fba67c..0236c43c4 100644
+--- a/src/journal/journal-send.c
++++ b/src/journal/journal-send.c
+@@ -19,7 +19,6 @@
+ 
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <printf.h>
+ #include <stddef.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+@@ -38,6 +37,7 @@
+ #include "stdio-util.h"
+ #include "string-util.h"
+ #include "util.h"
++#include "parse-printf-format.h"
+ 
+ #define SNDBUF_SIZE (8*1024*1024)
+ 
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
new file mode 100644
index 0000000000..94c136b0d9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -0,0 +1,104 @@
+From 585abd891a56409915314304101cac26b42c076b Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Mon, 23 Oct 2017 10:45:46 -0700
+Subject: [PATCH 02/12] src/basic/missing.h: check for missing strndupa
+
+include missing.h  for definition of strndupa
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac           |  1 +
+ src/basic/missing.h    | 11 +++++++++++
+ src/basic/mkdir.c      |  1 +
+ src/basic/parse-util.c |  1 +
+ src/shared/pager.c     |  1 +
+ src/shared/uid-range.c |  1 +
+ 6 files changed, 16 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index efcdc6c16..cd035a971 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -329,6 +329,7 @@ AC_CHECK_DECLS([
+         pivot_root,
+         name_to_handle_at,
+         setns,
++        strndupa,
+         renameat2,
+         kcmp,
+         keyctl,
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 04912bf52..8009888ad 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -1104,6 +1104,17 @@ typedef int32_t key_serial_t;
+ #define KEYCTL_DESCRIBE 6
+ #endif
+ 
++#if !HAVE_DECL_STRNDUPA
++#define strndupa(s, n) \
++  ({ \
++    const char *__old = (s); \
++    size_t __len = strnlen(__old, (n)); \
++    char *__new = (char *)alloca(__len + 1); \
++    __new[__len] = '\0'; \
++    (char *)memcpy(__new, __old, __len); \
++  })
++#endif
++
+ #ifndef KEYCTL_READ
+ #define KEYCTL_READ 11
+ #endif
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 6b1a98402..d1388df48 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -28,6 +28,7 @@
+ #include "path-util.h"
+ #include "stat-util.h"
+ #include "user-util.h"
++#include "missing.h"
+ 
+ int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, mkdir_func_t _mkdir) {
+         struct stat st;
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index 4532f222c..7a30a0e06 100644
+--- a/src/basic/parse-util.c
++++ b/src/basic/parse-util.c
+@@ -30,6 +30,7 @@
+ #include "parse-util.h"
+ #include "process-util.h"
+ #include "string-util.h"
++#include "missing.h"
+ 
+ int parse_boolean(const char *v) {
+         assert(v);
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index 4d7b02c63..854efc0c9 100644
+--- a/src/shared/pager.c
++++ b/src/shared/pager.c
+@@ -38,6 +38,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "terminal-util.h"
++#include "missing.h"
+ 
+ static pid_t pager_pid = 0;
+ 
+diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
+index b6ec47439..91ce9fb7f 100644
+--- a/src/shared/uid-range.c
++++ b/src/shared/uid-range.c
+@@ -24,6 +24,7 @@
+ #include "macro.h"
+ #include "uid-range.h"
+ #include "user-util.h"
++#include "missing.h"
+ 
+ static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
+         assert(range);
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
new file mode 100644
index 0000000000..9a2d2c8e0a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -0,0 +1,157 @@
+From 5bbbc2a08a3b4283ec04af0e77e25fb205aa8b82 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Mon, 23 Oct 2017 10:50:14 -0700
+Subject: [PATCH 03/12] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
+ defined
+
+If the standard library doesn't provide brace
+expansion users just won't get it.
+
+Dont use GNU GLOB extentions on non-glibc systems
+
+Conditionalize use of GLOB_ALTDIRFUNC
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/basic/glob-util.c     | 20 +++++++++++++++++---
+ src/test/test-glob-util.c | 17 +++++++++++++++--
+ src/tmpfiles/tmpfiles.c   |  8 ++++++++
+ 3 files changed, 40 insertions(+), 5 deletions(-)
+
+diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
+index f611c42e4..ad6e2be8d 100644
+--- a/src/basic/glob-util.c
++++ b/src/basic/glob-util.c
+@@ -27,13 +27,18 @@
+ #include "macro.h"
+ #include "path-util.h"
+ #include "strv.h"
++/* Don't fail if the standard library
++ * doesn't provide brace expansion */
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
+ 
+ int safe_glob(const char *path, int flags, glob_t *pglob) {
+         int k;
+ 
++#ifdef GLOB_ALTDIRFUNC
+         /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
+         assert(!(flags & GLOB_ALTDIRFUNC));
+-
+         if (!pglob->gl_closedir)
+                 pglob->gl_closedir = (void (*)(void *)) closedir;
+         if (!pglob->gl_readdir)
+@@ -44,10 +49,13 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+                 pglob->gl_lstat = lstat;
+         if (!pglob->gl_stat)
+                 pglob->gl_stat = stat;
+-
++#endif
+         errno = 0;
++#ifdef GLOB_ALTDIRFUNC
+         k = glob(path, flags | GLOB_ALTDIRFUNC, NULL, pglob);
+-
++#else
++        k = glob(path, flags, NULL, pglob);
++#endif
+         if (k == GLOB_NOMATCH)
+                 return -ENOENT;
+         if (k == GLOB_NOSPACE)
+@@ -60,6 +68,12 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+         return 0;
+ }
+ 
++/* Don't fail if the standard library
++ * doesn't provide brace expansion */
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
++
+ int glob_exists(const char *path) {
+         _cleanup_globfree_ glob_t g = {};
+         int k;
+diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
+index af866e004..3afa09ada 100644
+--- a/src/test/test-glob-util.c
++++ b/src/test/test-glob-util.c
+@@ -29,6 +29,11 @@
+ #include "glob-util.h"
+ #include "macro.h"
+ #include "rm-rf.h"
++/* Don't fail if the standard library
++ * doesn't provide brace expansion */
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
+ 
+ static void test_glob_exists(void) {
+         char name[] = "/tmp/test-glob_exists.XXXXXX";
+@@ -51,25 +56,33 @@ static void test_glob_exists(void) {
+ static void test_glob_no_dot(void) {
+         char template[] = "/tmp/test-glob-util.XXXXXXX";
+         const char *fn;
+-
+         _cleanup_globfree_ glob_t g = {
++#ifdef GLOB_ALTDIRFUNC
+                 .gl_closedir = (void (*)(void *)) closedir,
+                 .gl_readdir = (struct dirent *(*)(void *)) readdir_no_dot,
+                 .gl_opendir = (void *(*)(const char *)) opendir,
+                 .gl_lstat = lstat,
+                 .gl_stat = stat,
++#endif
+         };
+-
+         int r;
+ 
+         assert_se(mkdtemp(template));
+ 
+         fn = strjoina(template, "/*");
++#ifdef GLOB_ALTDIRFUNC
+         r = glob(fn, GLOB_NOSORT|GLOB_BRACE|GLOB_ALTDIRFUNC, NULL, &g);
++#else
++        r = glob(fn, GLOB_NOSORT|GLOB_BRACE, NULL, &g);
++#endif
+         assert_se(r == GLOB_NOMATCH);
+ 
+         fn = strjoina(template, "/.*");
++#ifdef GLOB_ALTDIRFUNC
+         r = glob(fn, GLOB_NOSORT|GLOB_BRACE|GLOB_ALTDIRFUNC, NULL, &g);
++#else
++        r = glob(fn, GLOB_NOSORT|GLOB_BRACE, NULL, &g);
++#endif
+         assert_se(r == GLOB_NOMATCH);
+ 
+         (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index 9419c99e2..07027a765 100644
+--- a/src/tmpfiles/tmpfiles.c
++++ b/src/tmpfiles/tmpfiles.c
+@@ -71,6 +71,12 @@
+ #include "umask-util.h"
+ #include "user-util.h"
+ #include "util.h"
++/* Don't fail if the standard library
++ * doesn't provide brace expansion */
++#ifndef GLOB_BRACE
++#define GLOB_BRACE 0
++#endif
++
+ 
+ /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
+  * them in the file system. This is intended to be used to create
+@@ -1092,7 +1098,9 @@ static int item_do_children(Item *i, const char *path, action_t action) {
+ 
+ static int glob_item(Item *i, action_t action, bool recursive) {
+         _cleanup_globfree_ glob_t g = {
++#ifdef GLOB_ALTDIRFUNC
+                 .gl_opendir = (void *(*)(const char *)) opendir_nomod,
++#endif
+         };
+         int r = 0, k;
+         char **fn;
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch b/meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
new file mode 100644
index 0000000000..cb5ae99a46
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
@@ -0,0 +1,47 @@
+From c850b654e71677e0d6292f1345207b9b5acffc33 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Mon, 23 Oct 2017 11:31:03 -0700
+Subject: [PATCH 04/12] src/basic/missing.h: check for missing __compar_fn_t
+ typedef
+
+include missing.h for missing __compar_fn_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/basic/missing.h | 5 +++++
+ src/basic/strbuf.c  | 1 +
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 8009888ad..671f341c6 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -1063,6 +1063,11 @@ struct input_mask {
+ #define RENAME_NOREPLACE (1 << 0)
+ #endif
+ 
++#ifndef __COMPAR_FN_T
++#define __COMPAR_FN_T
++typedef int (*__compar_fn_t)(const void *, const void *);
++#endif
++
+ #ifndef KCMP_FILE
+ #define KCMP_FILE 0
+ #endif
+diff --git a/src/basic/strbuf.c b/src/basic/strbuf.c
+index 00aaf9e62..9dc4a584a 100644
+--- a/src/basic/strbuf.c
++++ b/src/basic/strbuf.c
+@@ -23,6 +23,7 @@
+ 
+ #include "alloc-util.h"
+ #include "strbuf.h"
++#include "missing.h"
+ 
+ /*
+  * Strbuf stores given strings in a single continuous allocated memory
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
new file mode 100644
index 0000000000..55887ee823
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -0,0 +1,86 @@
+From 21080b6a40d0a4ddd2db8f0fa37686f6fa885d1c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Oct 2017 11:38:33 -0700
+Subject: [PATCH 06/12] Include netinet/if_ether.h
+
+Fixes
+/mnt/a/oe/build/tmp/work/mips32r2-bec-linux-musl/systemd/1_234-r0/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
+ struct ethhdr {
+        ^~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/libsystemd/sd-netlink/netlink-types.c | 1 +
+ src/network/netdev/tuntap.c               | 1 +
+ src/network/networkd-brvlan.c             | 1 +
+ src/udev/net/ethtool-util.c               | 2 +-
+ src/udev/udev-builtin-net_setup_link.c    | 2 +-
+ 5 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
+index 923f7dd10..b95b1e4b2 100644
+--- a/src/libsystemd/sd-netlink/netlink-types.c
++++ b/src/libsystemd/sd-netlink/netlink-types.c
+@@ -19,6 +19,7 @@
+ 
+ #include <stdint.h>
+ #include <sys/socket.h>
++#include <netinet/if_ether.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/can/netlink.h>
+diff --git a/src/network/netdev/tuntap.c b/src/network/netdev/tuntap.c
+index 3d6280884..40e58c38f 100644
+--- a/src/network/netdev/tuntap.c
++++ b/src/network/netdev/tuntap.c
+@@ -18,6 +18,7 @@
+ ***/
+ 
+ #include <fcntl.h>
++#include <netinet/if_ether.h>
+ #include <linux/if_tun.h>
+ #include <net/if.h>
+ #include <netinet/if_ether.h>
+diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
+index fa5d3ee7f..e0828962a 100644
+--- a/src/network/networkd-brvlan.c
++++ b/src/network/networkd-brvlan.c
+@@ -18,6 +18,7 @@
+ ***/
+ 
+ #include <netinet/in.h>
++#include <netinet/if_ether.h>
+ #include <linux/if_bridge.h>
+ #include <stdbool.h>
+ 
+diff --git a/src/udev/net/ethtool-util.c b/src/udev/net/ethtool-util.c
+index 201fc2343..5f7cc2a0a 100644
+--- a/src/udev/net/ethtool-util.c
++++ b/src/udev/net/ethtool-util.c
+@@ -16,7 +16,7 @@
+   You should have received a copy of the GNU Lesser General Public License
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+-
++#include <netinet/if_ether.h>
+ #include <net/if.h>
+ #include <sys/ioctl.h>
+ #include <linux/ethtool.h>
+diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
+index 8e4777513..d01fff2a4 100644
+--- a/src/udev/udev-builtin-net_setup_link.c
++++ b/src/udev/udev-builtin-net_setup_link.c
+@@ -16,7 +16,7 @@
+   You should have received a copy of the GNU Lesser General Public License
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+-
++#include <netinet/if_ether.h>
+ #include "alloc-util.h"
+ #include "link-config.h"
+ #include "log.h"
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch b/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
new file mode 100644
index 0000000000..5234c59a78
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0007-check-for-missing-canonicalize_file_name.patch
@@ -0,0 +1,63 @@
+From 05dffe67919ffc72be5c017bc6cf82f164b2e8f9 Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Mon, 23 Oct 2017 11:42:03 -0700
+Subject: [PATCH 07/12] check for missing canonicalize_file_name
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac                | 2 ++
+ src/basic/missing.h         | 1 +
+ src/basic/missing_syscall.h | 6 ++++++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index cd035a971..3674190fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -333,6 +333,7 @@ AC_CHECK_DECLS([
+         renameat2,
+         kcmp,
+         keyctl,
++        canonicalize_file_name,
+         LO_FLAGS_PARTSCAN,
+         copy_file_range,
+         explicit_bzero],
+@@ -343,6 +344,7 @@ AC_CHECK_DECLS([
+ #include <fcntl.h>
+ #include <sched.h>
+ #include <string.h>
++#include <stdlib.h>
+ #include <linux/loop.h>
+ ]])
+ 
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 671f341c6..8ae4964e1 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -1246,3 +1246,4 @@ struct ethtool_link_settings {
+ #endif
+ 
+ #include "missing_syscall.h"
++
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 898116c7b..4d44ee4fa 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -28,6 +28,12 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
+ }
+ #endif
+ 
++#if !HAVE_DECL_CANONICALIZE_FILE_NAME
++static inline char *canonicalize_file_name(const char *path) {
++        return realpath(path, NULL);
++}
++#endif
++
+ /* ======================================================================= */
+ 
+ #if !HAVE_DECL_MEMFD_CREATE
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
new file mode 100644
index 0000000000..67a4f8e03e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests.patch
@@ -0,0 +1,35 @@
+From 48e7c0f5b2f5d777a16ac5584dc4f50f1dfa832c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Oct 2017 12:27:53 -0700
+Subject: [PATCH 08/12] Do not enable nss tests
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3cc8f3451..df20a9a11 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5290,6 +5290,7 @@ EXTRA_DIST += \
+ 	src/timesync/timesyncd.conf.in
+ 
+ # ------------------------------------------------------------------------------
++if ENABLE_NSS_SYSTEMD
+ test_nss_SOURCES = \
+ 	src/test/test-nss.c
+ 
+@@ -5302,7 +5303,6 @@ manual_tests += \
+ 	test-nss
+ 
+ # ------------------------------------------------------------------------------
+-if ENABLE_NSS_SYSTEMD
+ libnss_systemd_la_SOURCES = \
+ 	src/nss-systemd/nss-systemd.sym \
+ 	src/nss-systemd/nss-systemd.c
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch b/meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch
new file mode 100644
index 0000000000..d3694dcbd5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch
@@ -0,0 +1,27 @@
+From 75f4e7f167de533a160ee1af2a03fba4c5a5ffc6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Oct 2017 12:33:22 -0700
+Subject: [PATCH 09/12] test-hexdecoct.c: Include missing.h form strndupa
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/test/test-hexdecoct.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
+index fcae427e7..5eb5e2ed7 100644
+--- a/src/test/test-hexdecoct.c
++++ b/src/test/test-hexdecoct.c
+@@ -21,6 +21,7 @@
+ #include "hexdecoct.h"
+ #include "macro.h"
+ #include "string-util.h"
++#include "missing.h"
+ 
+ static void test_hexchar(void) {
+         assert_se(hexchar(0xa) == 'a');
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
new file mode 100644
index 0000000000..808c83aba3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -0,0 +1,49 @@
+From 6e9d2bcaa6f886b2384c1c35a04e4ebc148aea68 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Oct 2017 12:40:25 -0700
+Subject: [PATCH 10/12] test-sizeof.c: Disable tests for missing typedefs in
+ musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/test/test-sizeof.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
+index 269adfd18..ba7855dff 100644
+--- a/src/test/test-sizeof.c
++++ b/src/test/test-sizeof.c
+@@ -18,7 +18,6 @@
+ ***/
+ 
+ #include <stdio.h>
+-
+ #include "time-util.h"
+ 
+ /* Print information about various types. Useful when diagnosing
+@@ -48,8 +47,10 @@ int main(void) {
+         info(unsigned);
+         info(long unsigned);
+         info(long long unsigned);
++#ifdef __GLIBC__
+         info(__syscall_ulong_t);
+         info(__syscall_slong_t);
++#endif
+ 
+         info(float);
+         info(double);
+@@ -59,7 +60,9 @@ int main(void) {
+         info(ssize_t);
+         info(time_t);
+         info(usec_t);
++#ifdef __GLIBC__
+         info(__time_t);
++#endif
+ 
+         info(enum Enum);
+         info(enum BigEnum);
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch
new file mode 100644
index 0000000000..7cfe829e85
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0011-don-t-use-glibc-specific-qsort_r.patch
@@ -0,0 +1,105 @@
+From 2eb45f5a0a8bfb8bdca084587ad28e5001f3cc4b Mon Sep 17 00:00:00 2001
+From: Emil Renner Berthing <systemd@esmil.dk>
+Date: Thu, 18 Sep 2014 15:24:56 +0200
+Subject: [PATCH 11/12] don't use glibc-specific qsort_r
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/hwdb/hwdb.c         | 18 +++++++++++-------
+ src/udev/udevadm-hwdb.c | 16 ++++++++++------
+ 2 files changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/src/hwdb/hwdb.c b/src/hwdb/hwdb.c
+index 793398ca6..669b00818 100644
+--- a/src/hwdb/hwdb.c
++++ b/src/hwdb/hwdb.c
+@@ -151,13 +151,12 @@ static void trie_free(struct trie *trie) {
+ 
+ DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
+ 
+-static int trie_values_cmp(const void *v1, const void *v2, void *arg) {
++static struct trie *trie_node_add_value_trie;
++static int trie_values_cmp(const void *v1, const void *v2) {
+         const struct trie_value_entry *val1 = v1;
+         const struct trie_value_entry *val2 = v2;
+-        struct trie *trie = arg;
+-
+-        return strcmp(trie->strings->buf + val1->key_off,
+-                      trie->strings->buf + val2->key_off);
++        return strcmp(trie_node_add_value_trie->strings->buf + val1->key_off,
++                      trie_node_add_value_trie->strings->buf + val2->key_off);
+ }
+ 
+ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -182,7 +181,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+                         .value_off = v,
+                 };
+ 
+-                val = xbsearch_r(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
++                trie_node_add_value_trie = trie;
++                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++                trie_node_add_value_trie = NULL;
++
+                 if (val) {
+                         /* At this point we have 2 identical properties on the same match-string.
+                          * Since we process files in order, we just replace the previous value.
+@@ -207,7 +209,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+         node->values[node->values_count].file_priority = file_priority;
+         node->values[node->values_count].line_number = line_number;
+         node->values_count++;
+-        qsort_r(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
++        trie_node_add_value_trie = trie;
++        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++        trie_node_add_value_trie = NULL;
+         return 0;
+ }
+ 
+diff --git a/src/udev/udevadm-hwdb.c b/src/udev/udevadm-hwdb.c
+index 69b0b9025..fbd213300 100644
+--- a/src/udev/udevadm-hwdb.c
++++ b/src/udev/udevadm-hwdb.c
+@@ -128,13 +128,13 @@ static void trie_node_cleanup(struct trie_node *node) {
+         free(node);
+ }
+ 
+-static int trie_values_cmp(const void *v1, const void *v2, void *arg) {
++static struct trie *trie_node_add_value_trie;
++static int trie_values_cmp(const void *v1, const void *v2) {
+         const struct trie_value_entry *val1 = v1;
+         const struct trie_value_entry *val2 = v2;
+-        struct trie *trie = arg;
+ 
+-        return strcmp(trie->strings->buf + val1->key_off,
+-                      trie->strings->buf + val2->key_off);
++        return strcmp(trie_node_add_value_trie->strings->buf + val1->key_off,
++                      trie_node_add_value_trie->strings->buf + val2->key_off);
+ }
+ 
+ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -155,7 +155,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+                         .value_off = v,
+                 };
+ 
+-                val = xbsearch_r(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
++                trie_node_add_value_trie = trie;
++                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++                trie_node_add_value_trie = NULL;
+                 if (val) {
+                         /* replace existing earlier key with new value */
+                         val->value_off = v;
+@@ -172,7 +174,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+         node->values[node->values_count].key_off = k;
+         node->values[node->values_count].value_off = v;
+         node->values_count++;
+-        qsort_r(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp, trie);
++        trie_node_add_value_trie = trie;
++        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++        trie_node_add_value_trie = NULL;
+         return 0;
+ }
+ 
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
new file mode 100644
index 0000000000..1a6db654f8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -0,0 +1,99 @@
+From 9621618c701a2d5eb3e26f40c68354d4dfb8f872 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 10 Oct 2017 14:33:30 -0700
+Subject: [PATCH 12/12] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+
+Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
+thing to do and it's not portable (not supported by musl). See:
+
+  http://lists.landley.net/pipermail/toybox-landley.net/2014-September/003610.html
+  http://www.openwall.com/lists/musl/2015/02/05/2
+
+Note that laccess() is never passing AT_EACCESS so a lot of the
+discussion in the links above doesn't apply. Note also that
+(currently) all systemd callers of laccess() pass mode as F_OK, so
+only check for existence of a file, not access permissions.
+Therefore, in this case, the only distiction between faccessat()
+with (flag == 0) and (flag == AT_SYMLINK_NOFOLLOW) is the behaviour
+for broken symlinks; laccess() on a broken symlink will succeed with
+(flag == AT_SYMLINK_NOFOLLOW) and fail (flag == 0).
+
+The laccess() macros was added to systemd some time ago and it's not
+clear if or why it needs to return success for broken symlinks. Maybe
+just historical and not actually necessary or desired behaviour?
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/basic/fs-util.h          | 22 +++++++++++++++++++++-
+ src/shared/base-filesystem.c |  6 +++---
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
+index 094acf179..cdbc0ae72 100644
+--- a/src/basic/fs-util.h
++++ b/src/basic/fs-util.h
+@@ -48,7 +48,27 @@ int fchmod_umask(int fd, mode_t mode);
+ 
+ int fd_warn_permissions(const char *path, int fd);
+ 
+-#define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW)
++/*
++   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right thing to
++   do and it's not portable (not supported by musl). See:
++
++     http://lists.landley.net/pipermail/toybox-landley.net/2014-September/003610.html
++     http://www.openwall.com/lists/musl/2015/02/05/2
++
++   Note that laccess() is never passing AT_EACCESS so a lot of the discussion in
++   the links above doesn't apply. Note also that (currently) all systemd callers
++   of laccess() pass mode as F_OK, so only check for existence of a file, not
++   access permissions. Therefore, in this case, the only distiction between
++   faccessat() with (flag == 0) and (flag == AT_SYMLINK_NOFOLLOW) is the
++   behaviour for broken symlinks; laccess() on a broken symlink will succeed
++   with (flag == AT_SYMLINK_NOFOLLOW) and fail (flag == 0).
++
++   The laccess() macros was added to systemd some time ago and it's not clear if
++   or why it needs to return success for broken symlinks. Maybe just historical
++   and not actually necessary or desired behaviour?
++*/
++
++#define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode), 0)
+ 
+ int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
+ int touch(const char *path);
+diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
+index 903a18786..2f6052ee7 100644
+--- a/src/shared/base-filesystem.c
++++ b/src/shared/base-filesystem.c
+@@ -70,7 +70,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+                 return log_error_errno(errno, "Failed to open root file system: %m");
+ 
+         for (i = 0; i < ELEMENTSOF(table); i ++) {
+-                if (faccessat(fd, table[i].dir, F_OK, AT_SYMLINK_NOFOLLOW) >= 0)
++                if (faccessat(fd, table[i].dir, F_OK, 0) >= 0)
+                         continue;
+ 
+                 if (table[i].target) {
+@@ -78,7 +78,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+ 
+                         /* check if one of the targets exists */
+                         NULSTR_FOREACH(s, table[i].target) {
+-                                if (faccessat(fd, s, F_OK, AT_SYMLINK_NOFOLLOW) < 0)
++                                if (faccessat(fd, s, F_OK, 0) < 0)
+                                         continue;
+ 
+                                 /* check if a specific file exists at the target path */
+@@ -89,7 +89,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+                                         if (!p)
+                                                 return log_oom();
+ 
+-                                        if (faccessat(fd, p, F_OK, AT_SYMLINK_NOFOLLOW) < 0)
++                                        if (faccessat(fd, p, F_OK, 0) < 0)
+                                                 continue;
+                                 }
+ 
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
new file mode 100644
index 0000000000..e219981ab0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
@@ -0,0 +1,31 @@
+From 4b6733544beb662a0f77310302fae1fb7b76d167 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Sep 2015 18:53:31 +0000
+Subject: [PATCH 13/13] comparison_fn_t is glibc specific, use raw signature in
+ function pointer
+
+make it work with musl where comparison_fn_t is not provided
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/basic/util.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/basic/util.h b/src/basic/util.h
+index c7da6c39b..87f62b891 100644
+--- a/src/basic/util.h
++++ b/src/basic/util.h
+@@ -98,7 +98,7 @@ void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
+  * Normal qsort requires base to be nonnull. Here were require
+  * that only if nmemb > 0.
+  */
+-static inline void qsort_safe(void *base, size_t nmemb, size_t size, comparison_fn_t compar) {
++static inline void qsort_safe(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *)) {
+         if (nmemb <= 1)
+                 return;
+ 
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 36fd3f8ff4..e27b4b25a5 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -10,7 +10,7 @@ SECTION = "base/shell"
 
 inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion manpages
 
-SRC_URI += " \
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
@@ -27,6 +27,19 @@ SRC_URI += " \
            file://0017-remove-duplicate-include-uchar.h.patch \
            file://0018-check-for-uchar.h-in-configure.patch \
            file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
+           file://0001-add-fallback-parse_printf_format-implementation.patch \
+           file://0002-src-basic-missing.h-check-for-missing-strndupa.patch \
+           file://0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
+           file://0004-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch \
+           file://0006-Include-netinet-if_ether.h.patch \
+           file://0007-check-for-missing-canonicalize_file_name.patch \
+           file://0008-Do-not-enable-nss-tests.patch \
+           file://0009-test-hexdecoct.c-Include-missing.h-form-strndupa.patch \
+           file://0010-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
+           file://0011-don-t-use-glibc-specific-qsort_r.patch \
+           file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
+           file://0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
+           file://0001-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
@@ -47,7 +60,8 @@ PACKAGECONFIG ??= "xz \
                    vconsole \
                    quotacheck \
                    hostnamed \
-                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers', '', d)} \
+                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers utmp', '', d)} \
+                   nss \
                    hibernate \
                    timedated \
                    timesyncd \
@@ -56,13 +70,16 @@ PACKAGECONFIG ??= "xz \
                    smack \
                    logind \
                    firstboot \
-                   utmp \
                    polkit \
                    resolved \
                    networkd \
 "
 PACKAGECONFIG_remove_libc-musl = "selinux"
 PACKAGECONFIG_remove_libc-musl = "smack"
+PACKAGECONFIG_remove_libc-musl = "resolved"
+PACKAGECONFIG_remove_libc-musl = "nss"
+PACKAGECONFIG_remove_libc-musl = "localed"
+PACKAGECONFIG_remove_libc-musl = "ldconfig"
 
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
@@ -83,6 +100,7 @@ PACKAGECONFIG[vconsole] = "--enable-vconsole,--disable-vconsole,,${PN}-vconsole-
 PACKAGECONFIG[quotacheck] = "--enable-quotacheck,--disable-quotacheck"
 PACKAGECONFIG[hostnamed] = "--enable-hostnamed,--disable-hostnamed"
 PACKAGECONFIG[myhostname] = "--enable-myhostname,--disable-myhostname"
+PACKAGECONFIG[nss] = "--enable-nss-systemd,--disable-nss-systemd"
 PACKAGECONFIG[rfkill] = "--enable-rfkill,--disable-rfkill"
 PACKAGECONFIG[hibernate] = "--enable-hibernate,--disable-hibernate"
 PACKAGECONFIG[timedated] = "--enable-timedated,--disable-timedated"
@@ -615,8 +633,4 @@ pkg_prerm_udev-hwdb () {
 python () {
     if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
-
-    import re
-    if re.match('.*musl*', d.getVar('TARGET_OS')) != None:
-        raise bb.parse.SkipPackage("Not _yet_ supported on musl based targets")
 }
-- 
2.14.3


