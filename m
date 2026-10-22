Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2237.1792709288180369279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IrJQE6FT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261022224806eae5fbfa0200020792-p7nivw@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261022224806eae5fbfa0200020792
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qxT6aBe/d5t3SVcEcAPZiesV/u62jlj74zqTF5rCXm8=;
 b=IrJQE6FTevb/K+wNb1Li1kIfQS0s7TC5VIP9adK5CQ1SQ566ryVCgWyo3u1TsD+flH//yZ
 P0yQfaMFFRN/FpIt1BhFwlIYIZ5/d1xQhBevmNBMw0yWTQTZaDZo66pFhcq02tKS7xOFFP3q
 kEC252XJFQQDoabdjC0xfmm/JcqnSiKodVcOTDl7gt/l2cxXvPUTNwSub5n0iwNRbJU2ilZj
 lP6rvaexlxwhxoDPujiCsdzfIEWZVJ0cBheDhvqY1Q/z0E2fcZJ4uKukOJvAzDNZTkUTKHxQ
 x22qZMB+44srVsRZSInR70ia/MhZ5GtSBaN8VA7+5WOgWelyZb1Yevcw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 06/15] glibc: patch CVE-2026-19499
Date: Fri, 23 Oct 2026 00:46:59 +0200
Message-ID: <20261022224711.3783258-6-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248462
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 3.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glibc/glibc/0036-CVE-2026-19499.patch     | 100 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch

diff --git a/meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch b/meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch
new file mode 100644
index 00000000000..792c5276d0b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch
@@ -0,0 +1,100 @@
+From 5256941bc811248670eda4636dccd0a390d34dec Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 27 Aug 2026 13:34:54 +0200
+Subject: [PATCH] stdlib: Fix right-justification in strfmon (bug 34510,
+ CVE-2026-19499)
+
+The memmove call did not take into account that __printf_buffer_pad
+updated the buffer pointers.
+
+Fixes commit e88b9f0e5cc50cab57a299dc7efe1a4eb385161d
+("stdio-common: Convert vfprintf and related functions to buffers"),
+which went into glibc 2.37.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+(cherry picked from commit b090cf226ff65b913e41536f1f573f500855615c)
+
+CVE: CVE-2026-19499
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5256941bc811248670eda4636dccd0a390d34dec]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ stdlib/Makefile               |  1 +
+ stdlib/strfmon_l.c            |  5 +++--
+ stdlib/tst-strfmon-bug34510.c | 33 +++++++++++++++++++++++++++++++++
+ 3 files changed, 37 insertions(+), 2 deletions(-)
+ create mode 100644 stdlib/tst-strfmon-bug34510.c
+
+diff --git a/stdlib/Makefile b/stdlib/Makefile
+index c9c8f702a2..b655f0e5eb 100644
+--- a/stdlib/Makefile
++++ b/stdlib/Makefile
+@@ -324,6 +324,7 @@ tests := \
+   tst-stdc_leading_zeros \
+   tst-stdc_trailing_ones \
+   tst-stdc_trailing_zeros \
++  tst-strfmon-bug34510 \
+   tst-strfmon_l \
+   tst-strfrom \
+   tst-strfrom-locale \
+diff --git a/stdlib/strfmon_l.c b/stdlib/strfmon_l.c
+index 5e22aac750..bd849ff470 100644
+--- a/stdlib/strfmon_l.c
++++ b/stdlib/strfmon_l.c
+@@ -549,7 +549,8 @@ __vstrfmon_l_buffer (struct __printf_buffer *buf, locale_t loc,
+       /* Now test whether the output width is filled.  */
+       if (buf->write_ptr - startp < width)
+ 	{
+-	  size_t pad_width = width - (buf->write_ptr - startp);
++	  size_t written_width = buf->write_ptr - startp;
++	  size_t pad_width = width - written_width;
+ 	  __printf_buffer_pad (buf, ' ', pad_width);
+ 	  if (__printf_buffer_has_failed (buf))
+ 	    /* Implies length check.  */
+@@ -558,7 +559,7 @@ __vstrfmon_l_buffer (struct __printf_buffer *buf, locale_t loc,
+ 	     Otherwise move the field contents in place.  */
+ 	  if (!left)
+ 	    {
+-	      memmove (startp + pad_width, startp, buf->write_ptr - startp);
++	      memmove (startp + pad_width, startp, written_width);
+ 	      memset (startp, ' ', pad_width);
+ 	    }
+ 	}
+diff --git a/stdlib/tst-strfmon-bug34510.c b/stdlib/tst-strfmon-bug34510.c
+new file mode 100644
+index 0000000000..b187bde1f4
+--- /dev/null
++++ b/stdlib/tst-strfmon-bug34510.c
+@@ -0,0 +1,33 @@
++/* Test handling of right-padding in strfmon (bug 34510, CVE-2026-19499).
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
++#include <monetary.h>
++#include <errno.h>
++#include <support/check.h>
++#include <support/next_to_fault.h>
++
++static int
++do_test (void)
++{
++  struct support_next_to_fault ntf = support_next_to_fault_allocate (100);
++  TEST_COMPARE (strfmon (ntf.buffer, ntf.length, "%100n", 1.23), -1);
++  TEST_COMPARE (errno, E2BIG);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index eb198427d1a..567d53dd6f6 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -68,6 +68,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0033-CVE-2026-6791.patch \
            file://0034-CVE-2026-6368.patch \
            file://0035-CVE-2026-19542.patch \
+           file://0036-CVE-2026-19499.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
