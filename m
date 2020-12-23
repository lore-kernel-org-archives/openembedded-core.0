Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gzspged5bASXOTyaLZInb75DD9cNv+OYReLp1QYSMIVdNISmsoWShA2piEFDefaK6h9fgUB4g0
 dcTb3yPW0Y8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236039"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236039"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:11 -0800
IronPort-SDR: xYGUxUzci02HlhTyfTrNF8KyrRPBYHi2Hshjdk4S1PNjmAuA0lB9oEZBjB6wiAue6JA2/Yx2Pn
 iBs4qY2hHPTw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027572"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:10 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/35] glibc: CVE-2020-29562 and CVE-2020-29573
Date: Wed, 23 Dec 2020 23:18:24 +0800
Message-Id: <6f191f803997d74b5d8df0036a65dc548e4a2723.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the CVE patches from the glibc upstream:
git://sourceware.org/git/glibc.git
commit 681900d29683722b1cb0a8e565a0585846ec5a61
commit 228edd356f03bf62dcf2b1335f25d43c602ee68d

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 01d59c49720548d620448f0e812f07aa3c1cc83a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glibc/glibc/CVE-2020-29562.patch          | 155 ++++++++++++++++++
 .../glibc/glibc/CVE-2020-29573.patch          |  56 +++++++
 meta/recipes-core/glibc/glibc_2.32.bb         |   2 +
 3 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29573.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
new file mode 100644
index 0000000000..134b4e3613
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
@@ -0,0 +1,155 @@
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
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+CVE: CVE-2020-29562
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
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
+2.17.0
+
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
new file mode 100644
index 0000000000..0f54d72cad
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
@@ -0,0 +1,56 @@
+From 681900d29683722b1cb0a8e565a0585846ec5a61 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 22 Sep 2020 19:07:48 +0200
+Subject: [PATCH] x86: Harden printf against non-normal long double values (bug
+ 26649)
+
+The behavior of isnan/__builtin_isnan on bit patterns that do not
+correspond to something that the CPU would produce from valid inputs
+is currently under-defined in the toolchain. (The GCC built-in and
+glibc disagree.)
+
+The isnan check in PRINTF_FP_FETCH in stdio-common/printf_fp.c
+assumes the GCC behavior that returns true for non-normal numbers
+which are not specified as NaN. (The glibc implementation returns
+false for such numbers.)
+
+At present, passing non-normal numbers to __mpn_extract_long_double
+causes this function to produce irregularly shaped multi-precision
+integers, triggering undefined behavior in __printf_fp_l.
+
+With GCC 10 and glibc 2.32, this behavior is not visible because
+__builtin_isnan is used, which avoids calling
+__mpn_extract_long_double in this case.  This commit updates the
+implementation of __mpn_extract_long_double so that regularly shaped
+multi-precision integers are produced in this case, avoiding
+undefined behavior in __printf_fp_l.
+
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+CVE: CVE-2020-29573
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ sysdeps/i386/ldbl2mpn.c                  |  8 ++++
+ 1 files changed, 8 insertions(+)
+
+diff --git a/sysdeps/i386/ldbl2mpn.c b/sysdeps/i386/ldbl2mpn.c
+index ec8464eef7..23afedfb67 100644
+--- a/sysdeps/i386/ldbl2mpn.c
++++ b/sysdeps/i386/ldbl2mpn.c
+@@ -115,6 +115,14 @@ __mpn_extract_long_double (mp_ptr res_ptr, mp_size_t size,
+ 	   && res_ptr[N - 1] == 0)
+     /* Pseudo zero.  */
+     *expt = 0;
++  else
++    /* Unlike other floating point formats, the most significant bit
++       is explicit and expected to be set for normal numbers.  Set it
++       in case it is cleared in the input.  Otherwise, callers will
++       not be able to produce the expected multi-precision integer
++       layout by shifting.  */
++    res_ptr[N - 1] |= (mp_limb_t) 1 << (LDBL_MANT_DIG - 1
++					- ((N - 1) * BITS_PER_MP_LIMB));
+ 
+   return N;
+ }
+-- 
+2.17.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index 2a0e464385..6d42f33822 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -43,6 +43,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://CVE-2020-29562.patch \
+           file://CVE-2020-29573.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.29.2

