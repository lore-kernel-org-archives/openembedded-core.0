Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF8CCA5FE2
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 06:33:22 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13905.1791180644428204358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 23:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=AvY7PLkP;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.45, mailfrom: upstream_ip-sp@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsYZAcYebBIqp8h6vxxJovF08ss/Wqvnw80FmcN1nWFHAmEzZ8IOl/fzJib02a0Y4g1ur/2NlC6rSTB8fe0ss9OChHwJ9iA64cJtAGQ9M9wSE7NQJfaRlvoZG2/FepKVpsmaVAUanBBy2v6YJJ4hL7QMHeSSbCwNywlqdXv6t7saD5rMv+mkV0cr7qlyJPBJ6KTp9IjpTGQEBWoRh8XQ+GnhRnNEb2t3K4tpNnRtJjC4EcMUn+eJJ2ms97YKlsR1Lo4mT4t6aInWhJTj+Jhu56cpgkrZsxHq01ihqtAeKQ+mRVVW38VPlavcUmrgKD1qvFiss1KeZ4w4oPhHopupeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UErfGVDT2Oo6fFQa1sy29i4Pk6SNzZM8JUTZDNBl48c=;
 b=lvdS/zMdAwovjO2zDx64yfGQNuVQuD/06RrVLer8ZAaUcQCR5UhsmSz/89y1Y6GJtxzT/n0g2uBm2VYQKsLCjqQDOeL5NaIIqQNmc4G/uWPGqdHhI6cwemJnXQwBfDGsdYctkrQVBZNEjRhZIBHlG3+VPljpgr5q3hUSLvhrRf+N3K1ZReG3xSn5tu1DfHE+07OcB5xVBBj/Sucl7V/j7rOFjXQzm2GDBIBxaQbCuQKyM1hmXVQJev0F5DbprUadAbeC4gV80HJEH5GWyC+umonucsI582m7Qyz+QH2hvFJXw45r8sBizBEtQNcAQX71WAvBSmSJ9xaSFXF87DD3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UErfGVDT2Oo6fFQa1sy29i4Pk6SNzZM8JUTZDNBl48c=;
 b=AvY7PLkPg565ylIxsXtL18fryVh7vyUdGv90O4C/gPdg6W9kuS2nyCTAt+bcJwTN4dAAtfkQ0+Hmf43ggm31dfGCKfGWwDfhBi4z4W5K5sML7V2KjirOegzePuma83qH2/1RSAlbdnlDbyeNIaSmWvwEisF8MeHW8xVna6rHOwRgHRKm7AcMd3fWbQqIdkTDt3M81roVv3QMa2SXZA3U0aX5sCXUPUzmfGDnaav5pO1W/wjQHXejUGe6MvZJjGAE6kUdEe16Lgyvr2cm7v+MDG5/PGOQNsc3F724B9kqHEC5Jd+IyNDjRCHssvc8t/WsyNu1p9CXgLwfMaPAG1iSjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bb::5)
 by MA5P287MB4174.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:162::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 05:56:24 +0000
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de]) by MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 05:56:24 +0000
From: Sourav Kumar Pramanik <UpStream_IP-SP@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: souravkumar.pramanik@bmwtechworks.in
Subject: [scarthgap][PATCHv2 1/2] glibc: Fix CVE-2026-5450
Date: Mon,  5 Oct 2026 11:26:00 +0530
Message-ID: <20261005055601.111500-1-UpStream_IP-SP@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN2PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::23) To MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1bb::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB5315:EE_|MA5P287MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a93b05e-3a78-472e-f04e-08df22a5635c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|6133799003|18002099003|55112099003|10067099003|13003099007|260925021311599003|260925021911599003|260925022911599003|5023799004|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	QmUSV/EY2WWTB3zScXTtM422qGP5M9og97efzIYHHFLShBXVPyOJgVbCVuLs1KRY1pX8eb5O2cwLxK2Vo32GcSFirCQ6ynQ/i0iH6Gc06Y+dwFyitQrndShiznuElnXfASPiNydmYBKnanNlmFQIH9Dn1avTD/i8OJCeExYR9lvvSuzW7tK/AhPybB0UtbK0Uy0Mx94KBgFioVaLGAzjtf7z+mjNZC3JUO+FcCFTCtYBBqCxfx9FvegjRpxP67RAei99rGGxPGzn0yDNMrh/2L76M6+eJkV08L50Q0urkgqoLcFYFEKxiWdWO5rpON0C0ZDmOGj3cv6cMwd9rHD7KcGAnh01Z2AueVfvXlU6RcUS4ajTvJr5RjBd2hiF7J8I+aBjWP0r8bBZyWsyMf92oAUeRCZVZLgGb/kSevjkAe137CNltvKzaUeCLkEyTc8dQp7A20XVAtykeeHmHoFa00vtMe5Stp61a/3eR17LA1RqdCPQuIbUOkDMwIlGFAwv+fmUFpSPNLeH52KvPa6HLk0FJMkxn90FrpY2GJzSvIEVHscuu9E8X3awzJfbEq3l8+Fhnw8n14iBayfTeHPuELtxH/gMTJZPhhDSHF9c0pwovb0IdNHbzsdNUTvtxQ4VthFRO3a/XsQoDwQBuA5fIpYIhFTjYnWr6KYAF9UXo2A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB5315.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(55112099003)(10067099003)(13003099007)(260925021311599003)(260925021911599003)(260925022911599003)(5023799004)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+XA5Wk/adrAAI4ykWCYpl9hZOgkG4k9rejrOjWC+jCIHoRxk7fAnAviBGgL9?=
 =?us-ascii?Q?C4/vDIpABCBn3oVgjRmNhhCV343ITY9P0DptlMQ2/EWvvEWez//zh87xhv+3?=
 =?us-ascii?Q?y8pBkXGP91AD3EsiIcdTkAbmXatIq11KJbAX/vxsd4JsDY1oExXJvr9nAVXo?=
 =?us-ascii?Q?Djyj8iUd0HteHcYsu+l1GyxLzlwZJYYZ6r+qhba52wtU1iZ94QDp2qoeeshE?=
 =?us-ascii?Q?Q73Gazd0pd+fO9SdHCqJu00qkjWzGnvyOFbfgEbn06w2yZ6UpSIHjuGffVv3?=
 =?us-ascii?Q?LOP5NN9mI2QHrav4Qnnu49Ue/2ZEWNF136A44GCxji1ijsPQStBjlirkAuuV?=
 =?us-ascii?Q?MZzmRmwfP/hmMdvZ5iQ0Bi23kQVBhyeYe64erlz8dXX4cmS2yr74sVRUAKzl?=
 =?us-ascii?Q?hqs0YGVPCnsEPoVet5OGGPi4IlMIuYTVRp0t0ybMNvEpafEOyevjorNnsO1k?=
 =?us-ascii?Q?Jyo5jYYdpPcptvg9nLcrHovkr2YJLHtUVb0KiCe4g/PWkNAN37QSyMgzPGh8?=
 =?us-ascii?Q?ta/gVtNrw8O8pP6W56w6f/AlrjAochoo/OJYsw1rsa/Q+a5Xi4bQ9C2GM+xt?=
 =?us-ascii?Q?4MbiYeAZbIhqT35A8PVe/n6rl4aoGGJgNGS1s1hhsiN0d4xBybX5h0AvwITn?=
 =?us-ascii?Q?jgtztrD47zfWyBGHNTTDCP1g/hrYHxoQxo8ICbpuFEpK9shEn0Yh3EVoPw/8?=
 =?us-ascii?Q?W5//apkRo8XUidRPFqCfA1fSLROmv5V0FBo8Wqr77L1AV/sCrBm/Inac/vwR?=
 =?us-ascii?Q?+Wu7MfvUMNNQOK+U8+LbTDJ4d1OpIQRFNpiy5/mKf7behsUIlu86wdhgaHQA?=
 =?us-ascii?Q?/1B32FZ1f6mfsYCtY3734V7kjI3MQaaYCxzDV5HiVfwGZYsd/c5kj54+tS6I?=
 =?us-ascii?Q?i813JdhDgdokkYbG4Qih+VwPKl/KX2UAgdJP056gp9CDB09mWzWDVmRVNyHT?=
 =?us-ascii?Q?BNI091LZ7p/VwWCHTkJSoVUCZMenSACA9dPDd6BkFfzUQg/4ooTdgJLaixXR?=
 =?us-ascii?Q?TDrhbdSm65hSeg+Sg/92nr1RSD1nG+pcTcC/mn+lXkjk+54i6drzntEV1bFE?=
 =?us-ascii?Q?/fStUGvsmp3hJuPLRzlo+RRnaW0f3McOpZsUcLqtDwbOVJ0IYZ0kW3+XegmJ?=
 =?us-ascii?Q?lopWmpsAIx6rjf0oAGOr+OkknhRhfke+cJWzoOz8kxz1SWZOo8gZ0LPihr2W?=
 =?us-ascii?Q?rA15rYV5EGkDvbD2PrekiY7dwQom9Pw4oyS17jVFGVf7217WcuQOWIawLp0r?=
 =?us-ascii?Q?X0uAYFqL7MBoZJsdSpKX/kVyPKpbzyOLPRXeDJ+6OgHYPumzwV7SZTWZvN0V?=
 =?us-ascii?Q?SYly0YghIlhzL1EmsImS7vLX4P0yXIrGpVcvNUo6VOsUcDK/yrR3WtNJbLgG?=
 =?us-ascii?Q?Skz0b/JUYyYZwNgoFbmS7iorZx5a4DeBbXsiyS15FL2F6mqFs3ANVz7X5D4b?=
 =?us-ascii?Q?5xQ2bVn/z2gdz2Kx/YkwUuawmyavr4npCaQ5js4afoX2IOH5e7kZyqEiDjKY?=
 =?us-ascii?Q?NnMhYK8of401p/2gedLQQuF219Gc4b2ZYgsRwDUX9MAg1vUN/Qmk6td6XUum?=
 =?us-ascii?Q?T6nrJv72pY2WnYC40oRlPFBAqL6LKWApzXZEo6jHamazVY89TK2lnNA/JOfT?=
 =?us-ascii?Q?6ZzAweFFVyeOP8PGZtfpJSIIHTS2VAdGCA4QMXTewJWNKLw8yFgXl3JfK7vH?=
 =?us-ascii?Q?u/zvPT3KMoGue1TCWAPNXKSMuP68ivJLNqSxFDHHHmJJoCneFgyTRAoPVxwg?=
 =?us-ascii?Q?2ONPqeYJ8Lhvh5EW3YdqqHfVhfKjrt8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a93b05e-3a78-472e-f04e-08df22a5635c
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 05:56:24.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4lU8kgtHLrWGl6i7mCJcdZzR88GStIpvL3DxXP8eETznWF7c5dR+krJ539+TbWbOowbLm+sv9T/sXim8bL66/KFXxhQfmplcTvedMbMLyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4174
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 06:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247214

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


