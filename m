Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2291.1792709495400860782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XcfJg8/i;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261022225133e69f1a28ff00020783-4_xs9o@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261022225133e69f1a28ff00020783
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:51:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=coLMsMS9yRXoeetTEErHT4rpRKtFJw+OqA5EjCrfy3w=;
 b=XcfJg8/iD2VRa9vhbQHhaGa6xs1Uh0po+/faEc2i9nEwjmZON7nfOxuKF8FFbUDbpE8LjM
 Gtg/qSrbDVe5w5ADPSgNp+YglVH3vbveLPeuBdVQ/ZoygcupVvEehIlPlR2qhy5wmWqZGIDl
 FBcVdJbukbuCwBQkBi106NjiyljtMNQ8MtleJmen4pUXo/tuz4Bifo6SWdAYk0k9bI5AGuHG
 AgaS1Z/toS1c8g7p9vElJ6JxZmWw/K8wFcQwa7HTbUa/fKtiQXYmEcIj7v9E7Ayq6yW8v1o1
 ZbWIWJ56jcWW1TQDchyA67HCeIv4RTdQt2OJFmgY4dLgXtmVPQSgs+iA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 10/15] glibc: patch CVE-2026-18374
Date: Fri, 23 Oct 2026 00:51:20 +0200
Message-ID: <20261022225120.3784827-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248471
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patches referencing this CVE from 3.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0040-CVE-2026-18374-01.patch  |  53 +++++++++
 .../glibc/glibc/0041-CVE-2026-18374-02.patch  | 103 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   2 +
 3 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch

diff --git a/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch b/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
new file mode 100644
index 00000000000..a5a71473ab2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
@@ -0,0 +1,53 @@
+From f806c45178dbca3be08a25cc5dd6d5542ce84a59 Mon Sep 17 00:00:00 2001
+From: Dongkyun Son <dongkyun.s@samsung.com>
+Date: Fri, 4 Sep 2026 21:28:41 +0900
+Subject: [PATCH] libio: Fix CVE-2026-18374 heap buffer overflow in ccs=
+ handling
+
+When fopen() is called with a ,ccs= parameter whose value becomes empty
+after strip(), the code must reject it with EINVAL instead of attempting
+to use it.  The original upstr() fallback could read past the ',' delimiter
+and cause a heap buffer overflow.
+
+The fix checks if the charset specification is empty after strip() and
+returns EINVAL immediately, preventing the overflow and following the
+approach described in BZ #34574.
+
+CVE-2026-18374 - CVSS 4.9 (AV:L/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:L)
+
+Reported-by: AISLE in partnership with Red Hat
+Signed-off-by: Dongkyun Son <dongkyun.s@samsung.com>
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit 9765a538ebf8661a6e5578e01e35a3dd30db7eb4)
+
+CVE: CVE-2026-18374
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f806c45178dbca3be08a25cc5dd6d5542ce84a59]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libio/fileops.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/libio/fileops.c b/libio/fileops.c
+index 775999deb3..18efe8e0c0 100644
+--- a/libio/fileops.c
++++ b/libio/fileops.c
+@@ -305,12 +305,14 @@ _IO_new_file_fopen (FILE *fp, const char *filename, const char *mode,
+ 	  *((char *) __mempcpy (ccs, cs + 5, endp - (cs + 5))) = '\0';
+ 	  strip (ccs, ccs);
+ 
+-	  if (__wcsmbs_named_conv (&fcts, ccs[2] == '\0'
+-				   ? upstr (ccs, cs + 5) : ccs) != 0)
++	  /* After stripping, ccs[2] == '\0' means the charset name is empty.
++	     This is not a valid charset and would cause problems downstream.
++	     Reject it with EINVAL (BZ #34574, CVE-2026-18374).  */
++	  if (ccs[2] == '\0' || __wcsmbs_named_conv (&fcts, ccs) != 0)
+ 	    {
+-	      /* Something went wrong, we cannot load the conversion modules.
+-		 This means we cannot proceed since the user explicitly asked
+-		 for these.  */
++	      /* Either the charset name is empty after strip(), or conversion
++		 modules cannot be loaded.  This means we cannot proceed since
++		 the user explicitly asked for character conversion.  */
+ 	      (void) _IO_file_close_it (fp);
+ 	      free (ccs);
+ 	      __set_errno (EINVAL);
diff --git a/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch b/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
new file mode 100644
index 00000000000..d653d545f51
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
@@ -0,0 +1,103 @@
+From 5dd252cf1d113644b3679f5a158e9ef20217865e Mon Sep 17 00:00:00 2001
+From: Shamil Abdulaev <ashamil435@gmail.com>
+Date: Thu, 3 Sep 2026 20:19:42 +0300
+Subject: [PATCH] libio: Add test for fopen with an empty ", ccs=" value [BZ
+ #34574]
+
+This goes on top of the fix for CVE-2026-18374.  The test runs the
+reproducer from the bug report, plus "w,ccs=" and "w,ccs=,", and
+expects NULL with errno set to EINVAL.
+
+Signed-off-by: Shamil Abdulaev <ashamil435@gmail.com>
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit cca93e5d88d3d4ed073c03100467696f652269e7)
+
+CVE: CVE-2026-18374
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5dd252cf1d113644b3679f5a158e9ef20217865e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libio/Makefile              |  1 +
+ libio/tst-fopen-ccs-empty.c | 62 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+)
+ create mode 100644 libio/tst-fopen-ccs-empty.c
+
+diff --git a/libio/Makefile b/libio/Makefile
+index 43ee8db06d..5b9929c3de 100644
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -99,6 +99,7 @@ tests = \
+   tst-fgetc-after-eof \
+   tst-fgetwc \
+   tst-fgetws \
++  tst-fopen-ccs-empty \
+   tst-fopenloc2 \
+   tst-fputws \
+   tst-freopen \
+diff --git a/libio/tst-fopen-ccs-empty.c b/libio/tst-fopen-ccs-empty.c
+new file mode 100644
+index 0000000000..64723965e1
+--- /dev/null
++++ b/libio/tst-fopen-ccs-empty.c
+@@ -0,0 +1,62 @@
++/* Test fopen with an empty ",ccs=" value in the mode string (bug 34574).
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#include <errno.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/support.h>
++#include <support/temp_file.h>
++#include <support/xunistd.h>
++
++static void
++check_fopen_fails (const char *path, const char *mode)
++{
++  errno = 0;
++  FILE *fp = fopen (path, mode);
++  TEST_VERIFY (fp == NULL);
++  TEST_COMPARE (errno, EINVAL);
++  if (fp != NULL)
++    fclose (fp);
++}
++
++static int
++do_test (void)
++{
++  char *path;
++  xclose (create_temp_file ("tst-fopen-ccs-empty", &path));
++
++  /* The value is blank and the mode string continues well past it.  */
++  enum { size = 1024 * 1024 };
++  char *mode = xmalloc (size);
++  memset (mode, 'X', size);
++  mode[size - 1] = '\0';
++  static const char prefix[] = "w,ccs=                     ,";
++  memcpy (mode, prefix, sizeof (prefix) - 1);
++  check_fopen_fails (path, mode);
++  free (mode);
++
++  check_fopen_fails (path, "w,ccs=");
++  check_fopen_fails (path, "w,ccs=,");
++
++  free (path);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 144ce36ccc2..3e95792b359 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -72,6 +72,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0037-CVE-2026-77117.patch \
            file://0038-CVE-2026-80489.patch \
            file://0039-CVE-2026-77117-CVE-2026-80489.patch \
+           file://0040-CVE-2026-18374-01.patch \
+           file://0041-CVE-2026-18374-02.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
