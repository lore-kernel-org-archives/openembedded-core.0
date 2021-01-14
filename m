Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: F7Rq601nquwfzM34QKvu8CFdhTrW0g+Yw0gfu5hHlS8i5ddESZdKFRL8WZ1s6XcTCzlVSI/0Nc
 Uji2qP1HJhjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062681"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062681"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:08 -0800
IronPort-SDR: nPvfu1hnpBDNa+9Xbw9SyQg57j0NQokIBAd8tlvafYTupfckTnOSaZiuZdd2vgljY3OMyRa8M5
 uza9jGV0OnAA==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986627"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:07 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/14] glibc: CVE-2019-25013
Date: Fri, 15 Jan 2021 00:09:44 +0800
Message-Id: <b067f78a116b9c6cd75bdffe568a1f801f7ed9a2.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Scott Murray <scott.murray@konsulko.com>

* CVE detail: https://nvd.nist.gov/vuln/detail/CVE-2019-25013

* upstream tracking: https://sourceware.org/bugzilla/show_bug.cgi?id=24973

* patch from upstream:
    https://sourceware.org/git/?p=glibc.git;a=patch;
    h=ee7a3144c9922808181009b7b3e50e852fb4999b

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 53d149df4d8832e34ace2470c31ddc688176faf7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glibc/glibc/CVE-2019-25013.patch          | 137 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.32.bb         |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
new file mode 100644
index 0000000000..987e959db2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
@@ -0,0 +1,137 @@
+From ee7a3144c9922808181009b7b3e50e852fb4999b Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Mon, 21 Dec 2020 08:56:43 +0530
+Subject: [PATCH] Fix buffer overrun in EUC-KR conversion module (bz #24973)
+
+The byte 0xfe as input to the EUC-KR conversion denotes a user-defined
+area and is not allowed.  The from_euc_kr function used to skip two bytes
+when told to skip over the unknown designation, potentially running over
+the buffer end.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ee7a3144c9922808181009b7b3e50e852fb4999b]
+CVE: CVE-2019-25013
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+---
+ iconvdata/Makefile      |  3 ++-
+ iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
+ iconvdata/euc-kr.c      |  6 +----
+ iconvdata/ksc5601.h     |  6 ++---
+ 4 files changed, 59 insertions(+), 9 deletions(-)
+ create mode 100644 iconvdata/bug-iconv13.c
+
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index 4ec2741cdc..85009f3390 100644
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
+@@ -73,7 +73,8 @@ modules.so := $(addsuffix .so, $(modules))
+ ifeq (yes,$(build-shared))
+ tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
+ 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
+-	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4
++	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
++	bug-iconv13
+ ifeq ($(have-thread-library),yes)
+ tests += bug-iconv3
+ endif
+diff --git a/iconvdata/bug-iconv13.c b/iconvdata/bug-iconv13.c
+new file mode 100644
+index 0000000000..87aaff398e
+--- /dev/null
++++ b/iconvdata/bug-iconv13.c
+@@ -0,0 +1,53 @@
++/* bug 24973: Test EUC-KR module
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
++   <https://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <iconv.h>
++#include <stdio.h>
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  iconv_t cd = iconv_open ("UTF-8//IGNORE", "EUC-KR");
++  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
++
++  /* 0xfe (->0x7e : row 94) and 0xc9 (->0x49 : row 41) are user-defined
++     areas, which are not allowed and should be skipped over due to
++     //IGNORE.  The trailing 0xfe also is an incomplete sequence, which
++     should be checked first.  */
++  char input[4] = { '\xc9', '\xa1', '\0', '\xfe' };
++  char *inptr = input;
++  size_t insize = sizeof (input);
++  char output[4];
++  char *outptr = output;
++  size_t outsize = sizeof (output);
++
++  /* This used to crash due to buffer overrun.  */
++  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == (size_t) -1);
++  TEST_VERIFY (errno == EINVAL);
++  /* The conversion should produce one character, the converted null
++     character.  */
++  TEST_VERIFY (sizeof (output) - outsize == 1);
++
++  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/iconvdata/euc-kr.c b/iconvdata/euc-kr.c
+index b0d56cf3ee..1045bae926 100644
+--- a/iconvdata/euc-kr.c
++++ b/iconvdata/euc-kr.c
+@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned char *cp)
+ 									      \
+     if (ch <= 0x9f)							      \
+       ++inptr;								      \
+-    /* 0xfe(->0x7e : row 94) and 0xc9(->0x59 : row 41) are		      \
+-       user-defined areas.  */						      \
+-    else if (__builtin_expect (ch == 0xa0, 0)				      \
+-	     || __builtin_expect (ch > 0xfe, 0)				      \
+-	     || __builtin_expect (ch == 0xc9, 0))			      \
++    else if (__glibc_unlikely (ch == 0xa0))				      \
+       {									      \
+ 	/* This is illegal.  */						      \
+ 	STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
+diff --git a/iconvdata/ksc5601.h b/iconvdata/ksc5601.h
+index d3eb3a4ff8..f5cdc72797 100644
+--- a/iconvdata/ksc5601.h
++++ b/iconvdata/ksc5601.h
+@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s, size_t avail, unsigned char offset)
+   unsigned char ch2;
+   int idx;
+ 
++  if (avail < 2)
++    return 0;
++
+   /* row 94(0x7e) and row 41(0x49) are user-defined area in KS C 5601 */
+ 
+   if (ch < offset || (ch - offset) <= 0x20 || (ch - offset) >= 0x7e
+       || (ch - offset) == 0x49)
+     return __UNKNOWN_10646_CHAR;
+ 
+-  if (avail < 2)
+-    return 0;
+-
+   ch2 = (*s)[1];
+   if (ch2 < offset || (ch2 - offset) <= 0x20 || (ch2 - offset) >= 0x7f)
+     return __UNKNOWN_10646_CHAR;
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index b850c28c78..d43c8c56cb 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -46,6 +46,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch \
            file://CVE-2020-29562.patch \
            file://CVE-2020-29573.patch \
+           file://CVE-2019-25013.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.29.2

