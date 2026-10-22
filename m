Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2244.1792709308167137794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SEoiFRnz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026102222482636347efa4500020712-zhun8x@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026102222482636347efa4500020712
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:48:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qG3YgKQDNqUuLSSCNHrVVqn4HOPYEguwsHSMIk3sFwU=;
 b=SEoiFRnzNa+qGzNown1omUmI6aoSq+UChs6gDi5WxAPMF3XVw7j3BMQoBf6nrJrGgmzYNw
 1I2rgxXdCpTg10BIBQQ2vAZWy94mf2spIUapDGop6JgkOgicMnvbKv8baG7IK5YuEJCirqjA
 HO6jYxny1RU+HWXEeKO2lKBFUB3wKtHWi7HK0bVOAJJea7+Ns/m+NPHgg6PapvXNtxsCV+Kl
 aPOdAyLkbFJdHGeTGbQBMrCoKMNAUf/OOth0kIVPEReIMsby5TL0YXqaKfwzBFAU1YLWFcsA
 vWBarco/amAu4KS829f5qqhntIRhROpMZMDgiz56cRNNa4I9ASnQFybQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 09/15] glibc: add tests for CVE-2026-77117 and CVE-2026-80489.
Date: Fri, 23 Oct 2026 00:47:02 +0200
Message-ID: <20261022224711.3783258-9-peter.marko@siemens.com>
In-Reply-To: <20261022224711.3783258-1-peter.marko@siemens.com>
References: <20261022224711.3783258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248465
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing bug IDs from patches for these CVEs from 3.41
branch (oldest release still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0039-CVE-2026-77117-CVE-2026-80489.patch  | 172 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch

diff --git a/meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch b/meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch
new file mode 100644
index 00000000000..7e9141bd9f7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch
@@ -0,0 +1,172 @@
+From 3d141c23899d90559741b5fe74db97ccf0ef5c29 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 28 Aug 2026 10:26:07 +0200
+Subject: [PATCH] iconvdata: Test case for bug 34556, bug 34568
+
+Assisted-by: LLM
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit 35efcffa97553df071bc37ab31fd7dc2c634e7da)
+
+CVE: CVE-2026-77117
+CVE: CVE-2026-80489
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=3d141c23899d90559741b5fe74db97ccf0ef5c29]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ iconvdata/Makefile                |   5 +-
+ iconvdata/tst-jisx0213-progress.c | 124 ++++++++++++++++++++++++++++++
+ 2 files changed, 128 insertions(+), 1 deletion(-)
+ create mode 100644 iconvdata/tst-jisx0213-progress.c
+
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index cc689f63e9..36f48749d2 100644
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
+@@ -76,7 +76,8 @@ tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
+ 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
+ 	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
+ 	bug-iconv13 bug-iconv14 bug-iconv15 \
+-	tst-iconv-iso-2022-cn-ext tst-bug33980
++	tst-iconv-iso-2022-cn-ext tst-bug33980 \
++	tst-jisx0213-progress
+ ifeq ($(have-thread-library),yes)
+ tests += bug-iconv3
+ endif
+@@ -335,6 +336,8 @@ $(objpfx)tst-iconv-iso-2022-cn-ext.out: $(addprefix $(objpfx), $(gconv-modules))
+ 					$(addprefix $(objpfx),$(modules.so))
+ $(objpfx)tst-bug33980.out: $(addprefix $(objpfx), $(gconv-modules)) \
+ 			   $(addprefix $(objpfx),$(modules.so))
++$(objpfx)tst-jisx0213-progress.out: \
++  $(addprefix $(objpfx), $(gconv-modules)) $(addprefix $(objpfx),$(modules.so))
+ 
+ $(objpfx)iconv-test.out: run-iconv-test.sh \
+ 			 $(addprefix $(objpfx), $(gconv-modules)) \
+diff --git a/iconvdata/tst-jisx0213-progress.c b/iconvdata/tst-jisx0213-progress.c
+new file mode 100644
+index 0000000000..7b2073be1f
+--- /dev/null
++++ b/iconvdata/tst-jisx0213-progress.c
+@@ -0,0 +1,124 @@
++/* Test JISX0213 combining character conversion progress (bug 34556, bug 34568).
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
++/* Certain JISX0213 byte sequences map to a combining sequence, for
++   example U+304B (HIRAGANA LETTER KA) followed by U+309A (COMBINING
++   SEMI-VOICED SOUND MARK).  When converting to internal encoding
++   (actually UTF-32) with a small output buffer, the first code point
++   is emitted and the second is queued in the converter state.  This
++   test verifies that the queued code point is consumed exactly once
++   on retry, so that the conversion makes progress and terminates.  */
++
++#include <errno.h>
++#include <iconv.h>
++#include <stdio.h>
++#include <string.h>
++
++#include <support/check.h>
++#include <support/support.h>
++
++static void
++test_one (const char *charset, const char *input, size_t outbufsize)
++{
++  printf ("info: %s: testing output buffer size %zu\n", charset, outbufsize);
++
++  /* Expected UTF-32 output.  */
++  static const wchar_t expected[] = { 0x304b, 0x309a, 'A' };
++
++  /* Use WCHAR_T encoding to avoid the BOM.  */
++  iconv_t cd = iconv_open ("WCHAR_T", charset);
++  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
++
++  char result[64];
++  size_t result_len = 0;
++
++  char *inptr = (char *) input;
++  size_t inleft = strlen (input);
++
++  char outbuf[64];
++
++  int iterations = 0;
++  while (inleft > 0)
++    {
++      char *outptr = outbuf;
++      size_t outleft = outbufsize;
++      size_t inleft_before = inleft;
++
++      size_t ret = iconv (cd, &inptr, &inleft, &outptr, &outleft);
++      size_t produced = outptr - outbuf;
++
++      TEST_VERIFY_EXIT (result_len + produced <= sizeof (result));
++      memcpy (result + result_len, outbuf, produced);
++      result_len += produced;
++
++      if (ret == (size_t) -1 && errno == E2BIG)
++	{
++	  if (produced == 0 && inleft == inleft_before)
++	    {
++	      /* Output buffer too small for a single code point.  */
++	      TEST_VERIFY_EXIT (outbufsize < 4);
++	      break;
++	    }
++	  /* Bound iterations to detect non-progress bugs.  */
++	  if (++iterations < 10)
++	    continue;
++	  else
++	    {
++	      FAIL ("%s: no progress", charset);
++	      goto out;
++	    }
++	}
++      if (ret == (size_t) -1)
++	FAIL_EXIT1 ("outbufsize %zu: iconv: %m", outbufsize);
++      break;
++    }
++
++  /* Flush pending converter state.  */
++  {
++    char *outptr = outbuf;
++    size_t outleft = outbufsize;
++    size_t ret = iconv (cd, NULL, NULL, &outptr, &outleft);
++    TEST_VERIFY (ret == 0);
++    size_t produced = outptr - outbuf;
++    memcpy (result + result_len, outbuf, produced);
++    result_len += produced;
++  }
++
++  if (outbufsize >= 4)
++    {
++      TEST_COMPARE (inleft, 0);
++      TEST_COMPARE_BLOB (result, result_len,
++			 expected, sizeof (expected));
++    }
++
++ out:
++  TEST_VERIFY_EXIT (iconv_close (cd) == 0);
++}
++
++static int
++do_test (void)
++{
++  for (size_t outbufsize = 1; outbufsize <= 16; outbufsize++)
++    {
++      test_one ("EUC-JISX0213", "\244\367A", outbufsize);
++      test_one ("SHIFT_JISX0213", "\202\365A", outbufsize);
++    }
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index bd0b4f06190..144ce36ccc2 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -71,6 +71,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0036-CVE-2026-19499.patch \
            file://0037-CVE-2026-77117.patch \
            file://0038-CVE-2026-80489.patch \
+           file://0039-CVE-2026-77117-CVE-2026-80489.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
