Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2338.1792709259340280506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=b/AJuhIT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261022224737225e6f53b600020763-97bqdr@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261022224737225e6f53b600020763
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:47:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZtkW/W1EUm/BjBLKLV68Dn5CxIY3oILpZA3wWmbUjSo=;
 b=b/AJuhITieJrpSZRUmOs3rsGhIr5yqxg3MrZhvl9c2eQGH9sZcr/tvmMeHPtIuZjWuEkLc
 28hejqbdDpinzo2ziGNs+dqwwJEOCdBFTmogVw7mERO7B80oXHibtIgwYXfLH6l8vUrCM5tT
 zfHrcqjAN/13bUGm5I2R2b92AIcZZFEz3FsxXLpP+wqY7reHkTnfaLZClKkxPJjq+xUzXauC
 geej0kjS0W2WBWZMDdNJIFkpRGicbVrGY01g9UCINrcd9vn6Ooj2dYef5uxoIanLx15+aCqp
 W6T+zK62ENeSsjIf4oqjD9njGv/8EYNwF4Za/8XX6H2Nk+PUrcphpWeg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 02/15] glibc: patch CVE-2026-5450
Date: Fri, 23 Oct 2026 00:46:55 +0200
Message-ID: <20261022224711.3783258-2-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248458
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 3.41 (oldest release still
receiving security updates) which is mentioned in [3].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=1a74f82eedaf0987eda1f522121e6a48fac502e7
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=839898777226a3ed88c0859f25ffe712519b4ead
[3] https://security-tracker.debian.org/tracker/CVE-2026-5450

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0032-CVE-2026-5450.patch      | 133 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch

diff --git a/meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch b/meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch
new file mode 100644
index 00000000000..631b63f4654
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch
@@ -0,0 +1,133 @@
+From 1a74f82eedaf0987eda1f522121e6a48fac502e7 Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 17 Apr 2026 23:48:41 -0700
+Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
+
+* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
+format %mc or %mC, glibc allocates one byte less, leading to
+user-controlled one byte overflow. This commit fixes BZ #34008, or
+CVE-2026-5450.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
+(cherry picked from commit 839898777226a3ed88c0859f25ffe712519b4ead)
+
+CVE: CVE-2026-5450
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=1a74f82eedaf0987eda1f522121e6a48fac502e7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ stdio-common/Makefile              |  4 +++
+ stdio-common/tst-vfscanf-bz34008.c | 48 ++++++++++++++++++++++++++++++
+ stdio-common/vfscanf-internal.c    |  7 ++---
+ 3 files changed, 55 insertions(+), 4 deletions(-)
+ create mode 100644 stdio-common/tst-vfscanf-bz34008.c
+
+diff --git a/stdio-common/Makefile b/stdio-common/Makefile
+index ac098dcd8a..72c18e5dc1 100644
+--- a/stdio-common/Makefile
++++ b/stdio-common/Makefile
+@@ -266,6 +266,7 @@ tests := \
+   tst-vfprintf-width-i18n \
+   tst-vfprintf-width-prec \
+   tst-vfprintf-width-prec-alloc \
++  tst-vfscanf-bz34008 \
+   tst-wc-printf \
+   tstdiomisc \
+   tstgetln \
+@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV = MALLOC_TRACE=$(objpfx)tst-printf-bz18872.mtrace \
+ tst-vfprintf-width-prec-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-vfprintf-width-prec.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
++tst-vfscanf-bz34008-ENV = \
++  MALLOC_CHECK_=3 \
++  LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+ tst-printf-bz25691-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-printf-bz25691.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfscanf-bz34008.c
+new file mode 100644
+index 0000000000..48371c8a3d
+--- /dev/null
++++ b/stdio-common/tst-vfscanf-bz34008.c
+@@ -0,0 +1,48 @@
++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
++   Copyright (C) 2026 The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "malloc/mcheck.h"
++#include <stddef.h>
++#include <stdio.h>
++#include <string.h>
++#include <wchar.h>
++#include <stdlib.h>
++#include <malloc.h>
++#include <support/check.h>
++
++#define WIDTH 0x410
++#define SCANFSTR "%1040mc"
++static int
++do_test (void)
++{
++  mcheck_pedantic (NULL);
++  char *input = malloc (WIDTH + 1);
++  TEST_VERIFY (input != NULL);
++  memset (input, 'A', WIDTH);
++  input[WIDTH] = '\0';
++
++  char *buf = NULL;
++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) != -1);
++  TEST_VERIFY (buf != NULL);
++
++  free (buf);
++  free (input);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-internal.c
+index 1ba034d961..fabb0ec874 100644
+--- a/stdio-common/vfscanf-internal.c
++++ b/stdio-common/vfscanf-internal.c
+@@ -853,8 +853,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 			{
+ 			  /* Enlarge the buffer.  */
+ 			  size_t newsize
+-			    = strsize
+-			      + (strsize >= width ? width - 1 : strsize);
++			    = strsize + (strsize >= width ? width : strsize);
+ 
+ 			  str = (char *) realloc (*strptr, newsize);
+ 			  if (str == NULL)
+@@ -925,7 +924,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		      && wstr == (wchar_t *) *strptr + strsize)
+ 		    {
+ 		      size_t newsize
+-			= strsize + (strsize > width ? width - 1 : strsize);
++			= strsize + (strsize >= width ? width : strsize);
+ 		      /* Enlarge the buffer.  */
+ 		      wstr = (wchar_t *) realloc (*strptr,
+ 						  newsize * sizeof (wchar_t));
+@@ -980,7 +979,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		    && wstr == (wchar_t *) *strptr + strsize)
+ 		  {
+ 		    size_t newsize
+-		      = strsize + (strsize > width ? width - 1 : strsize);
++		      = strsize + (strsize >= width ? width : strsize);
+ 		    /* Enlarge the buffer.  */
+ 		    wstr = (wchar_t *) realloc (*strptr,
+ 						newsize * sizeof (wchar_t));
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 0a4f7ac3bd6..e62d941fdde 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-CVE-2026-6238-0005.patch \
            file://0030-CVE-2026-6238-0006.patch \
            file://0031-CVE-2026-5928.patch \
+           file://0032-CVE-2026-5450.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
