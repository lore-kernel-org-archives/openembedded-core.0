Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2227.1792709251511447035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IUniCBeF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261022224728fb61af7e9a00020788-exc15d@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261022224728fb61af7e9a00020788
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:47:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=CyUfY8b/oe5+D51oRejhbMx41yGu5XJZJ+GPV+gvbvM=;
 b=IUniCBeF3b29iPDBfCyKxl0hayVyXhwq1EkuDYF14DAJ/D1KcdIdOm9YQXx4gIu83ALv9Z
 Y9lpb0DoBntme02Tz1GfuxfMIQ4S54DfYTZD1X0nBQf3nfc9x8EPlQd1NG2vauJjBKZynGRY
 VET63yw4pOOlzHISr3iOugVpAljvMmiuRXiAehmSHdzxbbtWYJhSN3zAOiPOPVAvlg3aJoWL
 Sc1OPfsPTcr+xn1BcAtcu16yTD8vY08Ijua5281pBmhcOCGnx4UJ/Dzk6VyOOknoUTJ6wa+L
 v4OIiAc+RnA84vG08oVB/t8Cm+P3lijb/avdIrrPaQ9je2Lo404laddA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 01/15] glibc: patch CVE-2026-5928
Date: Fri, 23 Oct 2026 00:46:54 +0200
Message-ID: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248457
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 3.41 (oldest release still
receiving security updates) which is mentioned in [3].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=8941538b92a574a24e9308e164869239d2b0d845
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=ef3bfb5f910011f3780cb06aa47e730035f53285
[3] https://security-tracker.debian.org/tracker/CVE-2026-5928

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0031-CVE-2026-5928.patch      | 112 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch b/meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch
new file mode 100644
index 00000000000..60b81e74529
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch
@@ -0,0 +1,112 @@
+From 8941538b92a574a24e9308e164869239d2b0d845 Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 1 May 2026 20:39:07 -0700
+Subject: [PATCH] libio: Fix ungetwc operating on byte stream [BZ #33998]
+
+* libio/wgenops.c: When _IO_wdefault_pbackfail attempts to push back one
+character, it accidently compare the wchar to push back with the last
+char from byte stream, instead of wide stream. Under specific coding,
+attacker may exploit this to leak information. This commit fix bug
+33998, or CVE-2026-5928.
+
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit ef3bfb5f910011f3780cb06aa47e730035f53285)
+
+CVE: CVE-2026-5928
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=8941538b92a574a24e9308e164869239d2b0d845]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libio/Makefile              |  1 +
+ libio/bug-wgenops-bz33998.c | 54 +++++++++++++++++++++++++++++++++++++
+ libio/wgenops.c             |  4 +--
+ 3 files changed, 57 insertions(+), 2 deletions(-)
+ create mode 100644 libio/bug-wgenops-bz33998.c
+
+diff --git a/libio/Makefile b/libio/Makefile
+index e143ccdb2c..43ee8db06d 100644
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -83,6 +83,7 @@ tests = \
+   bug-ungetwc1 \
+   bug-ungetwc2 \
+   bug-wfflush \
++  bug-wgenops-bz33998 \
+   bug-wmemstream1 \
+   bug-wsetpos \
+   test-fmemopen \
+diff --git a/libio/bug-wgenops-bz33998.c b/libio/bug-wgenops-bz33998.c
+new file mode 100644
+index 0000000000..cc4067da99
+--- /dev/null
++++ b/libio/bug-wgenops-bz33998.c
+@@ -0,0 +1,54 @@
++/* Regression test for ungetwc operating on byte stream (BZ #33998)
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
++#include "support/temp_file.h"
++#include "support/xstdio.h"
++#include "support/xunistd.h"
++#include <stdlib.h>
++#include <unistd.h>
++#include <sys/mman.h>
++#include <stdio.h>
++#include <wchar.h>
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  char *filename;
++  int fd = create_temp_file ("tst-bz33998-", &filename);
++  TEST_VERIFY (fd != -1);
++  xwrite (fd, "A", sizeof ("A")); // write "A\0" by design
++  xclose (fd);
++
++  FILE *fp = xfopen (filename, "r+");
++  TEST_COMPARE (getwc (fp), L'A');
++  /* If the bug is fixed, then ungetwc should not touch byte stream.
++     If the bug is not fixed, ungetwc firstly match last read char, L'A',
++     failed, then the pbackfail branch, matching last read char in byte
++     stream, that is, '\0' (initialized when setup wide stream). */
++  char *old_read_ptr = fp->_IO_read_ptr;
++  TEST_COMPARE (ungetwc (L'\0', fp), L'\0');
++  TEST_VERIFY (fp->_IO_read_ptr == old_read_ptr);
++
++  xfclose (fp);
++  free (filename);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/libio/wgenops.c b/libio/wgenops.c
+index 0a11d1b1de..9e0b2c00ea 100644
+--- a/libio/wgenops.c
++++ b/libio/wgenops.c
+@@ -108,8 +108,8 @@ _IO_wdefault_pbackfail (FILE *fp, wint_t c)
+ {
+   if (fp->_wide_data->_IO_read_ptr > fp->_wide_data->_IO_read_base
+       && !_IO_in_backup (fp)
+-      && (wint_t) fp->_IO_read_ptr[-1] == c)
+-    --fp->_IO_read_ptr;
++      && (wint_t) fp->_wide_data->_IO_read_ptr[-1] == c)
++    --fp->_wide_data->_IO_read_ptr;
+   else
+     {
+       /* Need to handle a filebuf in write mode (switch to read mode). FIXME!*/
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index d31c8656414..0a4f7ac3bd6 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-CVE-2026-6238-0004.patch \
            file://0029-CVE-2026-6238-0005.patch \
            file://0030-CVE-2026-6238-0006.patch \
+           file://0031-CVE-2026-5928.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
