Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1350CA5FBA
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 10:42:07 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10446.1790764557208633452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 03:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=zadOwy4I;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.16, mailfrom: upstream_ip-sp@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=occuJLvQaCzDIsniC+0V/vqA+G/sHDv7JDx2DnCQ2QtEXzARQ7y7nsV2797TNVfFms9jzykDpjJZ+CxgxvWClxDjI3b9zBoHYgaTlhaBT5S5hAIuerWtpW2dv5r/A/uxndV10KRQ8jD+/KthyphsR/VX4dTYSfsuVZKfq+UbIs2UYbCQZmarHk0xOH5Mb8+K/sptIMWvL6ahK5pFvEK3DA25iut2djkJB/YR1g0q5B3OfGXFb3ZjSL8+Er2w1jmb/2+pT8pbOOiLxWzFzj7S/42Nb2eHgcOPXl3ggFFIHDzSeASJf86qcZdqb5MA2zaR4i2bx6Uw7JZrW4BEBHwahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UErfGVDT2Oo6fFQa1sy29i4Pk6SNzZM8JUTZDNBl48c=;
 b=aSALqdq3xqUSF5B4R+OcR9hlSlOeKlibEjHB1WsYVoZAiK0J0S+Tz0MhF7v8zRDvghovKtfK7iC6BS6vUP2lXPe09BC1Y8A4zMh/kpgx262JoZTUOltBYiv5+OsIV4+8yLK5IgH03DVyP2Hy3VPhnXTS2fRyyPcV9hqsu2MYVBxC12dOuUIohR7oL+et0JwhTbm/rmKdL6ax40ey0HIMK0ebnTuPZrhdniSc+isMX23X1cJK0uSV9VviCicaCfWNITzPKAopsGGTIXKJt8KE1nNYYNudxq6iiPArUM9BJeRP8Ih2NW75ub5J3CGwSaT91aeP/aNWQqspjHynloCqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UErfGVDT2Oo6fFQa1sy29i4Pk6SNzZM8JUTZDNBl48c=;
 b=zadOwy4IVlKjbranj6Eo85ZKlj15nRtMiivdQ0OoVzl1QBtOcCmwuKoT+WUtZEhH6fcrpCKRFRibtKJFso2FFbnsIXY90CObQftzSggTyt4HJZooqrAK7z1+hn1wt1rz4IQgZ9HcPDFHtVPPfu4i0uKTRZejKscXsAHhDhsUSFGJBLquAA+KcSyF86G49h0Kgym3VsD6KiPSMiF4yeSaClGB89hSLlZ7pPzoM6RZ29tFWhiXACsozcv3nJCmsURUUQQ0ui4eo2wszCYBiVKJNuPhjAlGaeZTgrym2Ae3CMWNMzBF1UNLCmHCjPYV/dg0MeJpDWNC5Fit3PdHuAUg0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bb::5)
 by MA5P287MB4032.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:163::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 10:21:34 +0000
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de]) by MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 10:21:34 +0000
From: Sourav Kumar Pramanik <UpStream_IP-SP@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Subject: [PATCH 1/2] glibc: Fix CVE-2026-5450
Date: Wed, 30 Sep 2026 15:51:23 +0530
Message-ID: <20260930102124.82827-1-UpStream_IP-SP@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::10) To MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1bb::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB5315:EE_|MA5P287MB4032:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0e2f23-ac04-4f9c-29d5-08df1edc9a5e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|13003099007|38350700014|260925021911599003|260925021311599003|260925022911599003|6133799003|5023799004|11063799006|56012099006|18002099003|55112099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Ys04x76o3ZdJj5TgvFnkzPejr9P2Zi3JZzS4VpUjYCXEX5hW3Nb+YBPNNt0xUTd7GcrscCF9rWBjoc9JIcM+kbydVvxEwkF50z7Bj1X1HA4OI6yqxrVl2ZQ71ngDm8yTz3ChVgDaiePxLu3ELQeMRgVF4NbAh0/JSMdLrB+WZaJsV4xPwcMZTq6u/CaBwVAx4HJEP4ef1aeDTQXOjDii2ZxWACrZFP4OKbO3q11oH23SZ8XWoPu3IbpMPL7Tgv9oJVVjbZecjPf1L8QjbkdhBG+pRhICtqIb5nYuA8bED3GIVqGYzcDyTkvz4ElS249pQdCjQrMNUnHImMU1VopOBjvVeBg/85Ggx8PETTdaEQLLIsavcb0va9qrQpU/Hikf8XWWQlQFsrUkQ6EHTgNPk54AOHVcwIn+8ab180lm4pZilsHERBOA+69lj1MpJLH72Y2jwimSkWURqmiwyo0+lyHW/1POAbb2DWFKRT5m0kxtrxnJrC4G8Hs5MSvy6cency+5I8b3Ms5Qhoz5Awq3xx/O24nVm1pTjqsa4v+4DC5CwpeXrzAay83U/0wn/H0dH3wOomuEEljJs9g6q0XyOmvq1cOLyzpRoNOJmnjl7Q2O03jJEPRL7Arytof4pzAxGCPHIKbV/Ujn3Ljj5U6kCEnkjXyEvWwVw0Y359p9SVc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB5315.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(13003099007)(38350700014)(260925021911599003)(260925021311599003)(260925022911599003)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(55112099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yDplEIZhiXK7dE6IfUJkN6/p63qxSRw5UOLg75MksTfNpAm+p0c9eV4lv5z4?=
 =?us-ascii?Q?NT+P3lGzEgV4md6Ie95n42EKeLqlxd//m4X3hlgPtZ1VRk2mC8/Sz+vLWe87?=
 =?us-ascii?Q?nVS8RuxpMg2JJbjM/NpCRYtZ+qgTfiWWmIsA9fdMnmu0NkoJTpoGbA7KTP/6?=
 =?us-ascii?Q?t6AsWtJDbeXn4rZENr950LdLRRlSBLf1jF2n7gNdgH5SCbmys4srMh1oZ5Xb?=
 =?us-ascii?Q?+B6QCVPA3h7bgbGIa3tpV8CzUIOGVfncqGsZZ347G98vDLLDzpimgbMKyLIY?=
 =?us-ascii?Q?HTclaToI8dw945751/8MdAFpmystubKILZenVUwlkCdSWACzZ70FVMxkFchk?=
 =?us-ascii?Q?BW/vsXY+oZ0fjcdYzuVcbgQKk/G14bgvQ4Zg0kU8w7ttWSTpCw2iZZLA1e63?=
 =?us-ascii?Q?8k6gQdQwTHAImRD4uKaHP+Mwby8pps+5dIhOEPNDBDeJiXarFFItreWiM4U3?=
 =?us-ascii?Q?cw56+kjwrvxHel9Sqw3JERDR2d1yKCqWBnI6HcgoFtpnLccn2b0CLUAHB0fl?=
 =?us-ascii?Q?Nu8XClRI9WSrENuuSXTyXezzF2sjN9/U90NpuuwCSHzYCOI7/F3jJoknqfMP?=
 =?us-ascii?Q?jYGPbsdP2PNpu+yfw9gB4FtWhnj1PnaamoWxhDjwVj4AL65GnzsHibSRRF9D?=
 =?us-ascii?Q?J9zJxyf7RLRlf88XNF2Xk+7iwaMJnspmrGqpzu01ePoSbXtp1jdXRa0mf3oG?=
 =?us-ascii?Q?tuwEaCJtBxI3Hur2mNbHOzZ1hRl1VoVFniHnvbDGM+p7EhGQcBhwbK5ZJucc?=
 =?us-ascii?Q?xtv4/P2+4pfyJ0Z2/sfrlKq93pPBzZIWiVwbe5X8MFXXcHAQ5fSudO+ilSdQ?=
 =?us-ascii?Q?f7Gx0eUWwzoNexatPG+9ryCsG5+n47PfqNDKywE4LlrFaypfvSclQAphVCDW?=
 =?us-ascii?Q?9rfYVPStsJY7r6oRZE0WJr+eIiRQoB1S/UYN4uXyfYpgqgvIjY7ANxw62LRH?=
 =?us-ascii?Q?/+AIWGg68hgCdLwrN6IuRzVpkJWny4NeCT6B2qdR5Q38Yef3FxLY7hAVJ8XV?=
 =?us-ascii?Q?AGzV4KJe3Ib576blTFSPahAnMcxqB+yr8NEc6lo8SISl2vBjIJEK+ehf3cCG?=
 =?us-ascii?Q?KxtOhsqx2a8F6gHvcY1bP83Shd742lNfvCxHaGHjaIStID1Lid4mCCgjfqHk?=
 =?us-ascii?Q?JPGFDi45hPCPUcpbQqc/dBRYC5e4775eEf9IiZvXoMJ6k+GLf3Eyvweuf7Eb?=
 =?us-ascii?Q?XTwvdR3glzOcKHFNQYXxiAnvkMZcHAGq1LvTa8mXiaIk+Df8q3ese0pjY0Dv?=
 =?us-ascii?Q?RIlefkgCVdw2KHQ51laB4BvlcH8ARKvmWrRPjiQIauDFgbNhto3pXdihYYbl?=
 =?us-ascii?Q?K4J8HpHEAvIno1nE5QSv9K0neoEZfPVBte/xdXPM3Zx46fb7AWMV+H60/+Pq?=
 =?us-ascii?Q?WDAOynGoywYDCh4R90GNeG4db2XfZtsNOWAKJIIeDw8UOyQJTMWYPpEn6cfY?=
 =?us-ascii?Q?GTlbnTcdbPHgwNvYqccJ9L24ZD6rRLXfrtKdi4mgHpK5z9XSKz/+0Bu5c5VP?=
 =?us-ascii?Q?EkVl/T11/5bW8SVp8g6pmAf72dgJpqFDF/jZKmEpZ+0ninpAY4K/21DH1ff1?=
 =?us-ascii?Q?ISFcjSM6eObkaODWG3luKcO1I0MNmWvW6v0khhFARG0ideDeBhB1dSXK7q6Y?=
 =?us-ascii?Q?0U2qS2PBdb0qmnJU17iDcSTT1W/IF/i8tnYEmt/jcMlU9HiJX3IZBQeCN+Hg?=
 =?us-ascii?Q?M7RDchy5PqeqmJ9ndAEfSFI9Vlk=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0e2f23-ac04-4f9c-29d5-08df1edc9a5e
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 10:21:34.2658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/DhIMkH3HCjNcWAU/weWf3imxGv1h6CK1A/d2W8VHBuueZgSHWlHlk8hhQYm5YObH18S8cuK4wT6MgJmwugB7p+1aid436tckIVHNGn6G0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4032
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 10:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246951

From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>

This change fixes CVE-2026-5450

Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=3D8=
39898777226a3ed88c0859f25ffe712519b4ead]

Comment: Patch refreshed as per glibc 2.39 source code

Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
---
 .../glibc/glibc/CVE-2026-5450.patch           | 113 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5450.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch b/meta/recip=
es-core/glibc/glibc/CVE-2026-5450.patch
new file mode 100644
index 0000000000..adea5c3f01
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch
@@ -0,0 +1,113 @@
+From 839898777226a3ed88c0859f25ffe712519b4ead Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 17 Apr 2026 23:48:41 -0700
+Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #34008=
]
+
+* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
+format %mc or %mC, glibc allocates one byte less, leading to
+user-controlled one byte overflow. This commit fixes BZ #34008, or
+CVE-2026-5450.
+
+CVE: CVE-2026-5450
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=3D=
839898777226a3ed88c0859f25ffe712519b4ead]
+Comment: Patch refreshed as per glibc 2.39 source code
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
+Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in=
>
+---
+ stdio-common/Makefile              |  4 ++++
+ stdio-common/tst-vfscanf-bz34008.c | 48 +++++++++++++++++++++++++++++++++=
++++
+ stdio-common/vfscanf-internal.c    |  6 +++---
+ 3 files changed, 55 insertions(+), 3 deletions(-)
+ create mode 100644 stdio-common/tst-vfscanf-bz34008.c
+
+diff --git a/stdio-common/Makefile b/stdio-common/Makefile
+--- a/stdio-common/Makefile
++++ b/stdio-common/Makefile
+@@ -266,6 +266,7 @@ tests :=3D \
+   tst-vfprintf-width-i18n \
+   tst-vfprintf-width-prec \
+   tst-vfprintf-width-prec-alloc \
++  tst-vfscanf-bz34008 \
+   tst-wc-printf \
+   tstdiomisc \
+   tstgetln \
+@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV =3D MALLOC_TRACE=3D$(objpfx)tst=
-printf-bz18872.mtrace \
+ tst-vfprintf-width-prec-ENV =3D \
+   MALLOC_TRACE=3D$(objpfx)tst-vfprintf-width-prec.mtrace \
+   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
++tst-vfscanf-bz34008-ENV =3D \
++  MALLOC_CHECK_=3D3 \
++  LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
+ tst-printf-bz25691-ENV =3D \
+   MALLOC_TRACE=3D$(objpfx)tst-printf-bz25691.mtrace \
+   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
+diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfscanf=
-bz34008.c
+new file mode 100644
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
++  char *input =3D malloc (WIDTH + 1);
++  TEST_VERIFY (input !=3D NULL);
++  memset (input, 'A', WIDTH);
++  input[WIDTH] =3D '\0';
++
++  char *buf =3D NULL;
++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) !=3D -1);
++  TEST_VERIFY (buf !=3D NULL);
++
++  free (buf);
++  free (input);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-intern=
al.c
+--- a/stdio-common/vfscanf-internal.c
++++ b/stdio-common/vfscanf-internal.c
+@@ -857 +857 @@ __vfscanf_internal (FILE *s, const char *format, va_list a=
rgptr,
+-			      + (strsize >=3D width ? width - 1 : strsize);
++			      + (strsize >=3D width ? width : strsize);
+@@ -928 +928 @@ __vfscanf_internal (FILE *s, const char *format, va_list a=
rgptr,
+-			=3D strsize + (strsize > width ? width - 1 : strsize);
++			=3D strsize + (strsize >=3D width ? width : strsize);
+@@ -983 +983 @@ __vfscanf_internal (FILE *s, const char *format, va_list a=
rgptr,
+-		      =3D strsize + (strsize > width ? width - 1 : strsize);
++		      =3D strsize + (strsize >=3D width ? width : strsize);
+--=20
+2.43.7
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index 88ad5e44e8..b01225e530 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -57,6 +57,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch =
\
            file://0024-CVE-2026-5435.patch \
+           file://CVE-2026-5450.patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.43.0


