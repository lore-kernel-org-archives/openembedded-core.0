Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.10902.1604208104974038237
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 22:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ECcFMvSv;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 133so8342512pfx.11
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 22:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i+K/EjAZYQtYAkrGSqhCvvoE3n5I/bkQ0cGOIXWEr7I=;
        b=ECcFMvSvcDFWMph9UsdOBKDrZsafGJQbzb0mvCSmlO/KYUh9bARE9XKECzDUb3De5E
         pJGqG+DgYT58on+8RiS0rEJdLARry+su2eFuTJ7WeCZF4ctX+gPYgbUOhhdKJCpUuyI3
         BbgrRHjJNUui+3Ix3RgcbyjVzfhVDsEsAhfLtusp0w8AZSF9hjk0OgYDqixI2z37CikU
         kqQgDZPXzsUoYMUPtcTUXiQT5zoxJDs29Uk/u1i99P7wXFXyQfNdMtb+X72UZplaVyPT
         urG5bWzFgUa6L2e82fjoL4lglEUNnhrBYznA8eubTWc6/eTh9rggWgtfdr36VSR2DCf3
         p5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i+K/EjAZYQtYAkrGSqhCvvoE3n5I/bkQ0cGOIXWEr7I=;
        b=IYFxt8MavwhtCNeKTmluy/gI9d3V+HP0O8JoGRD6HcjtqOjNlYmtS8Tyfh9b2ohbUK
         79xFFTM0xCOgJ1pnllLWflzFBlUj3HlWkJYX3M1BhnajIPm1epNJFVDE9nuLKEqHp9xy
         IeEymMAHsc0s0G5dgurmcHsGA3SJWmrIyhgJriETsMgIo/IyGAkqqx9uf0IpE+i2INNQ
         sJ1ZZ7MzIQ7wBYFY5ZKWZJwQjYlsScLaVlTZElW0W3d6yJA0CP7tnHnIMtAHNkCpv4Gv
         xkh/xVvZmPe56rGTOS2Ly+TR9mjnr4fp+4cURS9WVbMWxIYHyoy6t7EwXmx2Q8hozLBJ
         zxvA==
X-Gm-Message-State: AOAM532PaIPcstxy02VgMl94YN6iFBYL1SdSNRgp81iQp1aW/Wq+ar4u
	uk6u2w9EDNarXu/cHerMxU1m5/l6aXKE4A==
X-Google-Smtp-Source: ABdhPJyH2m5NkhUWqkuXZLnnViBpj17RQuFXX+EB38lbAYso51WGZTEsWyGozkEjKur581To68l2wA==
X-Received: by 2002:a63:c55:: with SMTP id 21mr8178929pgm.392.1604208103967;
        Sat, 31 Oct 2020 22:21:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id z3sm9106643pgl.73.2020.10.31.22.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 22:21:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rpm: Fix error.h handing properly on musl
Date: Sat, 31 Oct 2020 22:21:40 -0700
Message-Id: <20201101052140.3867813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ignoring configure fragments when error.h does not exist on system
leaves eflutils half configured, which is seen when gold linker is
enabled because librpm does not have proper dependencies added,
therefore add error.h for non-glibc case and include it when glibc is
not used.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-musl-C-library.patch  |  26 ----
 ...tools-Add-error.h-for-non-glibc-case.patch | 118 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.16.0.bb       |   1 +
 3 files changed, 119 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
index 0b1d6298a9..b960da6c31 100644
--- a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
@@ -11,29 +11,6 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  rpmio/digest_nss.c | 1 +
  2 files changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index c04a2e8d1..c9d9ac16d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -255,6 +255,7 @@ AC_SEARCH_LIBS(dlopen, [dl])
- # Check for libelf library. Prefer external, otherwise none.
- WITH_LIBELF_LIB=
- AC_CHECK_HEADER([libelf.h])
-+AC_CHECK_HEADERS([error.h], [WITH_ERROR_H=yes])
- AC_CHECK_HEADERS([gelf.h], [
- 	AC_CHECK_LIB(elf, gelf_getvernaux, [
- 	    AC_DEFINE(HAVE_LIBELF, 1, [Define to 1 if you have the 'elf' library (-lelf).])
-@@ -263,7 +264,7 @@ AC_CHECK_HEADERS([gelf.h], [
- 	])
- ])
- AC_SUBST(WITH_LIBELF_LIB)
--AM_CONDITIONAL(LIBELF,[test "$WITH_LIBELF" = yes])
-+AM_CONDITIONAL(LIBELF,[test "$WITH_LIBELF" = yes && test "$WITH_ERROR_H" = yes])
- 
- AC_CHECK_HEADERS([dwarf.h], [
-   WITH_LIBDWARF=yes
-diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
-index 992d9acf6..e11920e3e 100644
 --- a/rpmio/digest_nss.c
 +++ b/rpmio/digest_nss.c
 @@ -1,5 +1,6 @@
@@ -43,6 +20,3 @@ index 992d9acf6..e11920e3e 100644
  #include <pthread.h>
  #include <nss.h>
  #include <sechash.h>
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
new file mode 100644
index 0000000000..e78514b814
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
@@ -0,0 +1,118 @@
+From b3952bd5e28f2a4d86c7377de239db8fa7237e14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Oct 2020 22:14:05 -0700
+Subject: [PATCH] tools: Add error.h for non-glibc case
+
+error is glibc specific API, so this patch will mostly not accepted
+upstream given that elfutils has been closely tied to glibc
+
+Upstream-Status: Inappropriate [workaround for musl]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/debugedit.c      |  6 +++++-
+ tools/elfdeps.c        |  6 +++++-
+ tools/error.h          | 27 +++++++++++++++++++++++++++
+ tools/sepdebugcrcfix.c |  6 +++++-
+ 4 files changed, 42 insertions(+), 3 deletions(-)
+ create mode 100644 tools/error.h
+
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index 9f8dcd0fb..852f46073 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -26,7 +26,6 @@
+ #include <byteswap.h>
+ #include <endian.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <limits.h>
+ #include <string.h>
+ #include <stdlib.h>
+@@ -40,6 +39,11 @@
+ 
+ #include <gelf.h>
+ #include <dwarf.h>
++#ifdef __GLIBC__
++#include <error.h>
++#else
++#include "error.h"
++#endif
+ 
+ 
+ /* Unfortunately strtab manipulation functions were only officially added
+diff --git a/tools/elfdeps.c b/tools/elfdeps.c
+index 6d9094874..f69e60997 100644
+--- a/tools/elfdeps.c
++++ b/tools/elfdeps.c
+@@ -5,10 +5,14 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <fcntl.h>
+-#include <error.h>
+ #include <errno.h>
+ #include <popt.h>
+ #include <gelf.h>
++#ifdef __GLIBC__
++#include <error.h>
++#else
++#include "error.h"
++#endif
+ 
+ #include <rpm/rpmstring.h>
+ #include <rpm/argv.h>
+diff --git a/tools/error.h b/tools/error.h
+new file mode 100644
+index 000000000..ef06827a0
+--- /dev/null
++++ b/tools/error.h
+@@ -0,0 +1,27 @@
++#ifndef _ERROR_H_
++#define _ERROR_H_
++
++#include <stdarg.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++
++static unsigned int error_message_count = 0;
++
++static inline void error(int status, int errnum, const char* format, ...)
++{
++	va_list ap;
++	fprintf(stderr, "%s: ", program_invocation_name);
++	va_start(ap, format);
++	vfprintf(stderr, format, ap);
++	va_end(ap);
++	if (errnum)
++		fprintf(stderr, ": %s", strerror(errnum));
++	fprintf(stderr, "\n");
++	error_message_count++;
++	if (status)
++		exit(status);
++}
++
++#endif	/* _ERROR_H_ */
+diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
+index fba460014..2be9c1fd8 100644
+--- a/tools/sepdebugcrcfix.c
++++ b/tools/sepdebugcrcfix.c
+@@ -29,9 +29,13 @@
+ #include <endian.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <error.h>
+ #include <libelf.h>
+ #include <gelf.h>
++#ifdef __GLIBC__
++#include <error.h>
++#else
++#include "error.h"
++#endif
+ 
+ #ifndef _
+ #define _(x) x
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.0.bb b/meta/recipes-devtools/rpm/rpm_4.16.0.bb
index f01874fe38..a578cf3cbd 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            file://0001-rpmdb.c-add-a-missing-include.patch \
+           file://0001-tools-Add-error.h-for-non-glibc-case.patch \
            "
 
 PE = "1"
-- 
2.29.2

