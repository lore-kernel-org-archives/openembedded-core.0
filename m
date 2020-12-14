Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.32780.1607943178055624897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: tE48QW8lU7PsaHdF0gO1QphKH6L8u7+3+sdoUAVKGanqnSC3zqmNLcrZKTRsKOmSY5l2YHo703
 tHQh1NEsY7GA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="171177866"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="171177866"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 02:52:56 -0800
IronPort-SDR: 13q4UvFtOy/T/1+eb8YjqC+ggJr7/90In5mwtaeVP3Bkuz8L9S7lvsAPh7PAE43oeqMujJMEco
 vQ4ttIdYzCrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="411138070"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2020 02:52:55 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/3] glibc: fix CVE-2020-29562
Date: Mon, 14 Dec 2020 18:52:52 +0800
Message-Id: <20201214105254.57230-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../glibc/glibc/CVE-2020-29562.patch          | 156 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
new file mode 100644
index 0000000000..c51fb3223a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
@@ -0,0 +1,156 @@
+From 228edd356f03bf62dcf2b1335f25d43c602ee68d Mon Sep 17 00:00:00 2001
+From: Michael Colavita <mcolavita@fb.com>
+Date: Thu, 19 Nov 2020 11:44:40 -0500
+Subject: [PATCH] iconv: Fix incorrect UCS4 inner loop bounds (BZ#26923)
+
+Previously, in UCS4 conversion routines we limit the number of
+characters we examine to the minimum of the number of characters in the
+input and the number of characters in the output. This is not the
+correct behavior when __GCONV_IGNORE_ERRORS is set, as we do not consume
+an output character when we skip a code unit. Instead, track the input
+and output pointers and terminate the loop when either reaches its
+limit.
+
+This resolves assertion failures when resetting the input buffer in a step of
+iconv, which assumes that the input will be fully consumed given sufficient
+output space.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=228edd356f03bf62dcf2b1335f25d43c602ee68d]
+CVE: CVE-2020-29562
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ iconv/Makefile       |  2 +-
+ iconv/gconv_simple.c | 16 ++++----------
+ iconv/tst-iconv8.c   | 50 ++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 55 insertions(+), 13 deletions(-)
+ create mode 100644 iconv/tst-iconv8.c
+
+diff --git a/iconv/Makefile b/iconv/Makefile
+index 30bf996d3a..f9b51e23ec 100644
+--- a/iconv/Makefile
++++ b/iconv/Makefile
+@@ -44,7 +44,7 @@ CFLAGS-linereader.c += -DNO_TRANSLITERATION
+ CFLAGS-simple-hash.c += -I../locale
+ 
+ tests	= tst-iconv1 tst-iconv2 tst-iconv3 tst-iconv4 tst-iconv5 tst-iconv6 \
+-	  tst-iconv7 tst-iconv-mt tst-iconv-opt
++	  tst-iconv7 tst-iconv8 tst-iconv-mt tst-iconv-opt
+ 
+ others		= iconv_prog iconvconfig
+ install-others-programs	= $(inst_bindir)/iconv
+diff --git a/iconv/gconv_simple.c b/iconv/gconv_simple.c
+index d4797fba17..963b29f246 100644
+--- a/iconv/gconv_simple.c
++++ b/iconv/gconv_simple.c
+@@ -239,11 +239,9 @@ ucs4_internal_loop (struct __gconv_step *step,
+   int flags = step_data->__flags;
+   const unsigned char *inptr = *inptrp;
+   unsigned char *outptr = *outptrp;
+-  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
+   int result;
+-  size_t cnt;
+ 
+-  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
++  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
+     {
+       uint32_t inval;
+ 
+@@ -307,11 +305,9 @@ ucs4_internal_loop_unaligned (struct __gconv_step *step,
+   int flags = step_data->__flags;
+   const unsigned char *inptr = *inptrp;
+   unsigned char *outptr = *outptrp;
+-  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
+   int result;
+-  size_t cnt;
+ 
+-  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
++  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
+     {
+       if (__glibc_unlikely (inptr[0] > 0x80))
+ 	{
+@@ -613,11 +609,9 @@ ucs4le_internal_loop (struct __gconv_step *step,
+   int flags = step_data->__flags;
+   const unsigned char *inptr = *inptrp;
+   unsigned char *outptr = *outptrp;
+-  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
+   int result;
+-  size_t cnt;
+ 
+-  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
++  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
+     {
+       uint32_t inval;
+ 
+@@ -684,11 +678,9 @@ ucs4le_internal_loop_unaligned (struct __gconv_step *step,
+   int flags = step_data->__flags;
+   const unsigned char *inptr = *inptrp;
+   unsigned char *outptr = *outptrp;
+-  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
+   int result;
+-  size_t cnt;
+ 
+-  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
++  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
+     {
+       if (__glibc_unlikely (inptr[3] > 0x80))
+ 	{
+diff --git a/iconv/tst-iconv8.c b/iconv/tst-iconv8.c
+new file mode 100644
+index 0000000000..0b92b19f66
+--- /dev/null
++++ b/iconv/tst-iconv8.c
+@@ -0,0 +1,50 @@
++/* Test iconv behavior on UCS4 conversions with //IGNORE.
++   Copyright (C) 2020 Free Software Foundation, Inc.
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
++   <http://www.gnu.org/licenses/>.  */
++
++/* Derived from BZ #26923 */
++#include <errno.h>
++#include <iconv.h>
++#include <stdio.h>
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  iconv_t cd = iconv_open ("UTF-8//IGNORE", "ISO-10646/UCS4/");
++  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
++
++  /*
++   * Convert sequence beginning with an irreversible character into buffer that
++   * is too small.
++   */
++  char input[12] = "\xe1\x80\xa1" "AAAAAAAAA";
++  char *inptr = input;
++  size_t insize = sizeof (input);
++  char output[6];
++  char *outptr = output;
++  size_t outsize = sizeof (output);
++
++  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == -1);
++  TEST_VERIFY (errno == E2BIG);
++
++  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 3d486fbb59..3a0d60abf8 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -41,6 +41,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://CVE-2020-29562.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1

