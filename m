Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.40])
 by mx.groups.io with SMTP id smtpd.web12.5481.1607413403869887889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 23:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C5LMnCT3;
 spf=pass (domain: windriver.com, ip: 40.107.92.40, mailfrom: zhixiong.chi@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRD/caN318waWT3p7atYIfRAxho7WgsvYChbigVkRduZhVR1VNlrB2kIpuhhoPdnS0YCnq7NXhgW919KT8Ys3NCyFlXQiKrUtjA/yNxsNgt+Mi/6DEHTOcffDESHGPvWcXHpOT0IAaOLvGpW3p2GrgkH5I6FwEH1GxqXpzbvYGwIlNZV9s4x99Aml/vTpXUWTninxQpUlQrGas5oCsYYqpxVUpX3yvWqWoMfzqFQl0gnqIK+WUAmadbhzDWdBavkOKhFg/SHK5PwXSrZ/iOs0gOt5KSYg8bPkbycs0fnU8Lrw6eT7rdqTPazB9I5vRnAqlZmN6VAbkuzPRSVNmUZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIZutg388nn5c9vULYP56KoOx0NvQ92MY3zce3K0SPQ=;
 b=UGjEVSBaw2wHed4udBr8BsSbBmApxJlBTShdckZhOLhLI9GenJEFtLNfw1GtM2THX0KIrsCx6N08qJq9QzFcagG9BBp8wL8Gwr1uEhfIAJH9QlAQcI6gu8jHdtCekJfSsMh3KmBwiinvxvTgtiMx2M7DZhnerWqBQtLBQA60RTuPQ+NKFWcJ7IargBR3U51x0O8wyGX913L0+6aZuleGOqV0tX9icSMo9UgMNI2ykDSfx2s7I7rxe3Zj6wPl0/71jwn9zFHUzM4tO+AtaBGgtJ9cjkAovEdNNAZadjiR6lqsT1sH/NluQxWoDiQ3TDpumLEiORdsMFlokyYkAp7JCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIZutg388nn5c9vULYP56KoOx0NvQ92MY3zce3K0SPQ=;
 b=C5LMnCT3RslCTUn/s+Gw8Yq7q2qWwafvv70K1/AI1wEff0nfBgGdo3doD5dL+FLztBh80JoVTjRt62tkoEO28GFCRzUSQSAzyaQAPJBuWi35bPKCw0Af+04AmjuK4xjxWRUYbw8QK7hjTwtiFsuNraNN3BqPl4nudQcnXzP4Nr4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2686.namprd11.prod.outlook.com (2603:10b6:805:59::12)
 by SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 07:43:21 +0000
Received: from SN6PR11MB2686.namprd11.prod.outlook.com
 ([fe80::6996:ac8a:69c:cf36]) by SN6PR11MB2686.namprd11.prod.outlook.com
 ([fe80::6996:ac8a:69c:cf36%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 07:43:21 +0000
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glibc: CVE-2020-29562 and CVE-2020-29573
Date: Mon,  7 Dec 2020 23:43:08 -0800
Message-Id: <20201208074308.103776-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.123]
X-ClientProxiedBy: YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::16) To SN6PR11MB2686.namprd11.prod.outlook.com
 (2603:10b6:805:59::12)
Return-Path: zhixiong.chi@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp2.wrs.com (147.11.105.123) by YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 07:43:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c779b39-7052-4be4-a06c-08d89b4cefd2
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB25578C2E0728D0F7D48CA9E59BCD0@SN6PR11MB2557.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cvHegbIiJlV7IIzsl1HfXsFkUxNCuUkytj+wtxawd4Y3HcCyAavA3ejAEpoz2uSqLjyF86DUwvZbf6LAUbC3+sdPJt1Hhx8DmHWQEug4IWpSa8NdrW4cCU4GEss4DBo4LOKNvwORCd55gIr/FlEbnOH6eq52ZabnAzzDStqUFIU3sfblEFghQgzDE0dZQz17MEAhsz/dnHPLNK4AG8C+2i4g8QmYC3Ae5UwODHdAOSW6Hq4PhUi1nYvPBbl1KNgCjfYGQ9jhxG/fSYbECfruCN7Ph14bizifWrxOBHrFTgo1V9ZPIw9Jjj3FfYjKOnYYuzmd6PthCAgN6HG1LT1KA5z3x3RTxcq+/j9rf9kfhbdVcJDEwuJKl7vAC/I/K/0wunl+0WeVgtrEg92ERZAmkUym4/I8vbRncgS1wFQQIgFyEKygO+YRCAW5cQsja/TmVzBLs9DgBnvXb4N9cmXweg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2686.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(396003)(346002)(366004)(52116002)(1076003)(316002)(66946007)(956004)(36756003)(86362001)(66556008)(83380400001)(16526019)(2616005)(44832011)(6506007)(6486002)(8936002)(2906002)(66476007)(186003)(5660300002)(26005)(6512007)(6666004)(478600001)(8676002)(6916009)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mO7579o056AVfn2BW8ZBQnRm0RwP1b55KaTOpc3VXPgMUqmHAY3n8VpVWs7h?=
 =?us-ascii?Q?vs7iX9qJg+RcnxD0OTh+HVDdX8vRcFMoKiINe/F24GZ2MZJuJjYZQvpU2CK0?=
 =?us-ascii?Q?Qvkoh7tmYZ1psCrkCTVW4t5UNJRCeQDmVqz76daZY3VOyi0vaSktD0SeBtO+?=
 =?us-ascii?Q?9OTzzTix4QkAzZkYGv1YsAniaJ2yT4tC/U6ytCm8dWkhViAIu1Wa2eRAUh3E?=
 =?us-ascii?Q?6oPtsgD81loh8pzEG0qqJUr9FjK7neUjEsquxGE9nqZssLaRJKLO6OwWk/UM?=
 =?us-ascii?Q?9Y5rkY8h8LpI4oE+FOHuNYJlONpH9ASHeSACHp+Gq/n2d4dqFMzzD8+MkoJs?=
 =?us-ascii?Q?bbI+4t/2Q9LrehQIzLgeM/NAfy7R1EDAdG5jXk47+24Ox69dMZoW81wVVWLj?=
 =?us-ascii?Q?vE4eOAp37AFqBH+Vb5QQ30cmfb0Ssc9xQiuoPmoqLKdnmWmhzx35EhPUOUHf?=
 =?us-ascii?Q?uNDxbW2bA62aHUvoiTjago3EAsK37M5dQgwBqiuAyiofDa3WI7L6+I3WKaju?=
 =?us-ascii?Q?fBPkzLPHST1I8sEeDvo84gHJHiYZbWfACFGDKMQm8N1OnOZTu7ynVLCmjCVG?=
 =?us-ascii?Q?6oqPeu15+d44E11AybLOKU42Pe/zA/EwjiHQf67kO5Lv58Y90AGZVP+G/6yP?=
 =?us-ascii?Q?9LALzrg2+E4TUqhKnNCTUBEKvS80s48HktjTvKBFrsKhf/xhmZ6eEHy9rOrF?=
 =?us-ascii?Q?7ZuM18/HsieBkhKgSul376luIcqJBeLX/62inNUJ/knpC6SNmST66cjy8u1y?=
 =?us-ascii?Q?6iEofPB4IIECfaauIDBHAhgwg/218RDcaKXYcNS7vFe3c1qUxrHySAmMGKr5?=
 =?us-ascii?Q?RCyMp4Z4CWPrACJBUFnMSK8/RdUv11Dw3W65TjhEy9qlLOvy+CNU9bQZQ6ve?=
 =?us-ascii?Q?EyWj0HKhoLFWgDAwXLkj64JHRpOxzCS6xc/XDP6p+dKNp9yp5+p2vcsxNl2w?=
 =?us-ascii?Q?l9o9is8WDdUBcU+/rqKoF9KDHgPacZ5wEXbYLPGH/kTFZ6GMAnN6/SJ/QSW8?=
 =?us-ascii?Q?Aw3S?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 07:43:21.5133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c779b39-7052-4be4-a06c-08d89b4cefd2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sy8ViXIA1huNE7cyjbpMFLfWUOp6Ju4lRGHINxk+xF1qoRwJfjiwiEVSjnUBtqorTy4vVkTTipu0G+KCpToMiT3yG144TbapiULB1xlSQ6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2557
Content-Type: text/plain

Backport the CVE patches from the glibc upstream:
git://sourceware.org/git/glibc.git
commit 681900d29683722b1cb0a8e565a0585846ec5a61
commit 228edd356f03bf62dcf2b1335f25d43c602ee68d

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
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
2.17.1

