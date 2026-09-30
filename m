Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34C9CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 10:42:27 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10453.1790764585809456928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 03:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=arg2ct54;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.62, mailfrom: upstream_ip-sp@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEcbYsoF0UKw3tgpKV8Z7UaccoO42yJkyxkUdoIIC9xa4XNLGU6Fi4idPy0WySAq+R6/Ue4oszcQpEO0Rt1Pa11Nqm1/PecL1XKF/mZKEIc+E7MXJ6PKR2OJz6xq4nwiy0t1iImqz2S0sf+diHiJk72gGWCJ0FIQir6FlvZfYhOoVE4NbwBlN0S8IsTx+qZc/bR0RQDE9l8hCEzEf4YO0VsUUwc9ph4A3Ai2xxMQf5OUHnx4bNs1cw+EkHghvpmk1IYlRtxkPyCuVJt6t5APx0Qgnb6RScqru7NmE2TjdyOHo+lyFNtOIx7vVsLY5jDp5ACVmHB+kf9pLuczEp3QVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/45Hdpvow1bXrYFg0Qpq+Li9axKrgirZqw8ljFxLCk=;
 b=tjRXag3yOg9EcK5YLvaG3dJAoJHr2X9EVkR4yQDQp1I0tqcMw0oq8jWERbavtfTJcRKw+bJzbfyU+wBLZf7g21wrfi/CNAd37jhFC2HOT+azD2du/1ADK00umQIIw/IXEF5bSe3VjgBiB198/8nIJ5H5TY1pcMJR/dtkJvD6hJXZfo4wnLs8Q4NHzEzoDQcFPmHNIgcd3zAD/xjMz8hRGUbxRfdRKwiEPfBN96JL2hAh1JWZLabtnJABug6aiS5y7Gx4NKfN+ZeWj84ileL4FZFGFYKv78MPkuSFw3BCptjJSXC5odexAiXcS8DzoSnjE0GmbXoY4f9uFjrddngsig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/45Hdpvow1bXrYFg0Qpq+Li9axKrgirZqw8ljFxLCk=;
 b=arg2ct54/4roS9mLAGMo5Hwqdt8MDCmH9sxCeMOnkOFzDuXlI5eTO8ZHldUVeVSM+qD8Hu/L/eyt74L8gitzruIODsu+6xZyBKR07pUdmVpzeVAIpCG1OV6A+M8/rqVjTgp8ekLaVlV8X8k8sKj11RZJMC9o/eo3pVDY/38H0bQ7nNGZv6Duvz9Gvr915lQPgirO9cIF/vaByLS2LLea93DBLoEGljqHxRCLfu+T3JfkAEueT9bGnw+fjQLYVaVoBQxkMXMGGZ1nfRjaJFLVlThXkx4OXEptdZLb7HyZ0Uvq/M5ygFeUTmkXxuESiBIdC7zkvZ+edy16mmK8aaytzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bb::5)
 by MA5P287MB4032.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:163::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 10:21:49 +0000
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de]) by MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 10:21:49 +0000
From: Sourav Kumar Pramanik <UpStream_IP-SP@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Subject: [PATCH 2/2] glibc: Fix CVE-2026-5928
Date: Wed, 30 Sep 2026 15:51:24 +0530
Message-ID: <20260930102124.82827-2-UpStream_IP-SP@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930102124.82827-1-UpStream_IP-SP@bmwtechworks.in>
References: <20260930102124.82827-1-UpStream_IP-SP@bmwtechworks.in>
X-ClientProxiedBy: PN4P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::10) To MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1bb::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB5315:EE_|MA5P287MB4032:EE_
X-MS-Office365-Filtering-Correlation-Id: 247c3ea0-692f-466f-5128-08df1edca38a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|13003099007|38350700014|260925021911599003|260925021311599003|260925022911599003|5023799004|11063799006|56012099006|22082099003|18002099003|55112099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	sK86BW1JEZ3gZMeLZgLzZOMezPxFKW84wnhB9Ik7eNy+8tWAQ2jBR3HKTt7Xo5j/y4PRDRpvF6absLdHJUKjAoWSztd80h1zSWs54MPEdXnJ2rjb06F+M6XOCZKxLQNS2jx9EqTuxacxfBGnAYX9bEEQ+Api5Ay18Xs1L79N4Q12Rd9IgaX5Nz+YV5uE1ECe4xii9RYj1svcdgRe6PuRhLmopTZJ0GOZRfjNsVRzks1VrUueMGWGmtuVGvceFycez2ETYBF9Ux0YxuRLk4Ejq4Vd1ernxj36S/h97b5XUwpHOuQyZoceeN24zvYgbCRXNvWjdDFsz2R+sVPfHsRKDhV04cEfzz4PkyN0N4l72IsSE3dRMs3RQkZbPYUjQLbJ4H1i+0YXzK5hUg+Y5Wd+vq2luhOIGfx9ozzxuczuVlCQK7aP3v1kmwRputnO2GEeWGN62kWl4VqnZ3nCThyijZSBdjQllq4DOxwMCvgzizV8L/S+dxeAvRTzT7j3wNBWfFVzyv1YbU9UgrarkjLOSm9+clpa51M0TXAqC4m2XoOxXXOm+HQZpmjZw9mWVTbS3HdXStJG+n2cR/TimISiUO+EULyfpJToCSpaQ663n6x/S9VJ3cW1f0ZR1hhoFz+deG6ZzItbm2L68CQ2Nwaw40e1+rL1/q2VuOTGmwtL/dU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB5315.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(13003099007)(38350700014)(260925021911599003)(260925021311599003)(260925022911599003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(55112099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jou3zFis2IW5l6dRNHVt45eTVEPRN+LoSEvcH5WRo9L5kRFFqj89wrTfDL9d?=
 =?us-ascii?Q?4PU1Tl93gSulM3u/QPHwoi/a6FXDWAEPheg+8ai6vDP3Wry3tytGtBsbzVmx?=
 =?us-ascii?Q?erjOcbv+lHjNwZjp9o3dzI4qSg88V7Lcd8kkbctbqNK6um0WaiTmwlAq2jLc?=
 =?us-ascii?Q?1DKIvZKrgfAV4vjI23gBCCABNC8vmNBcTfmZWNbN6u0ZQPXJaUszQJPg60lJ?=
 =?us-ascii?Q?BjuDM4Wz82YdEfqIxSBmFkPP5e7N5OlE6TcJzRHRmYZNZnskzFbSt0Acy1XL?=
 =?us-ascii?Q?IlV4kAKshPuEcrDDkFXGtjc24W0I1g5kdFoEi5VUSIPWyNQHYbp6nLLVVYoS?=
 =?us-ascii?Q?puHk4PXuQYd59WBqid/KAJm+IyetW6nNWcXiVJDPHrW9YLbGq6g66jupiues?=
 =?us-ascii?Q?sb+E+/QrHmQGc3tSpMrA7Pex83LrN/npQfflpeciWeW0mwOuRqSlnbMiLJLY?=
 =?us-ascii?Q?mbKXpN92XWZMZKZobuIj4VBI9uwGjPpQJ8ZmSALypBFQnpB/dyXNGYb4zYuo?=
 =?us-ascii?Q?XOKJgALFg2bXA2tFSHrv7Bt+bHbrv1xBh+SSGkHife7YS/A5iCclOsv5Q20W?=
 =?us-ascii?Q?ZyOqa/aojFdyuBELoDSiV4XakG+aBBYEMb5wrYPpIn80zQMQ/ktdPx8nBI3p?=
 =?us-ascii?Q?pjAogXAR3UfARGHY6Tk5pa+yLkq76EaN8NK+GRfbnrXMDBXGn416YIT9nuvC?=
 =?us-ascii?Q?su1AEXo+uZ038/rnexbE266FZut99boxqdpFzPJ7b0GYnokAIpsrsKeFL6Ie?=
 =?us-ascii?Q?zkGQT3EDBYPUkJuW0P0CWr/vsnlGF9rgvUMghbZUl1bLvr+6E0HPvumWDYED?=
 =?us-ascii?Q?0oGJQ15u6CN68knPJ4hfjcwFjUqfZSX17F5Q69ZvqxQqZLHP903Q7qFMs+bo?=
 =?us-ascii?Q?34LLdv2rcORjhffySnoqwVub1b5jR45s46pEj2LixrOR42eVw/zET+veqFZK?=
 =?us-ascii?Q?5k2r2Iam4dGUO+daLSttaBf7AEe0bZlUfmlUHv8jZmhQQvFUdQI+fKvF1BEW?=
 =?us-ascii?Q?DOhdocRAnHhcnUiyRL8pqJKJ+QUxa+EUA+yympFE1oOSdxRLCH3ap/3kZ2Uk?=
 =?us-ascii?Q?SFRCKq1diQvd6gRREirCgw+mKb0uunD7uYtuF1eXjnhV1YoEOWo09SPTjhsD?=
 =?us-ascii?Q?2gB0putUe9vMzjlctCriC5GUlKpAXkYGTVbiRIhhBUi5V6ALl3m9sn/ZPtxW?=
 =?us-ascii?Q?QFkeLx56lE3FR/gGXY3rurjg4HEeScCcerII6J5bLONVHZGMzv69U9FKb46q?=
 =?us-ascii?Q?hA1/Z6gsNjRugWqd2irR+6ejLRPBu0xeon62AQ6aOU7NCwWiu3q9j38xLTMX?=
 =?us-ascii?Q?sZxkCYHZ6KzaiaqRysa5/FV20DdWenTA9LUOkLBCTe5/0zjdKib554p/zz+z?=
 =?us-ascii?Q?fCoDyYPK/q2dm5niNNjvO4DzUgY4pzXk9QHadohtQAyJsVlMLhU8p2Pa9cbz?=
 =?us-ascii?Q?8l2SQPbEKurGRlTIFGo/tragN8ryywRvMfkhQsCsEpWuH36uLG/aqUmvSIwI?=
 =?us-ascii?Q?SglsmZpk9JLPjaMXkcR9Hj9t9zQ/1+Rj+1xpODPs1/neT5fGQfH8FhVa/Ivb?=
 =?us-ascii?Q?h3YYQRJVo8M0UfedZvtQVbCc7pzRFccbnESV1+NLTS0RmU7n2QLy1Y3r/JWB?=
 =?us-ascii?Q?v57h36JqyundZ0ImOq1uJmdBR5jIUSniZcMkXIJlW7v36dpQoSBia6kx1O4l?=
 =?us-ascii?Q?7Ep381a9lu5TTi9qaoFFsgrFNNVY7ZFJMFbM4y/wTqpL6cX6fxgagK8BD1gk?=
 =?us-ascii?Q?TDkhd/wNoQvJxR2E+cNvDvqpIeKTtgU=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 247c3ea0-692f-466f-5128-08df1edca38a
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 10:21:49.6315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mj2+0LM1/14lM6l8nyU9VUXf0xp4Xe0g1t/V++H+f3fy2Dr7SyiCoSuhq8At1Kwl25CeV6e3usVMXr2EEVCYgp275hsdH8nUy2sOUZyUi0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4032
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 10:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246952

From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>

This change fixes CVE-2026-5928

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dco=
mmit;h=3Def3bfb5f910011f3780cb06aa47e730035f53285]

Comment: Patch refreshed as per glibc 2.39 source code

Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
---
 .../glibc/glibc/CVE-2026-5928.patch           | 105 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5928.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-5928.patch b/meta/recip=
es-core/glibc/glibc/CVE-2026-5928.patch
new file mode 100644
index 0000000000..470ab1a1ec
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2026-5928.patch
@@ -0,0 +1,105 @@
+From ef3bfb5f910011f3780cb06aa47e730035f53285 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-5928
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dc=
ommit;h=3Def3bfb5f910011f3780cb06aa47e730035f53285]
+Comment: Patch refreshed as per glibc 2.39 source code
+
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in=
>
+---
+ libio/Makefile              |  1 +
+ libio/bug-wgenops-bz33998.c | 54 ++++++++++++++++++++++++++++++++++++++++=
+++++
+ libio/wgenops.c             |  4 ++--
+ 3 files changed, 57 insertions(+), 2 deletions(-)
+ create mode 100644 libio/bug-wgenops-bz33998.c
+
+diff --git a/libio/Makefile b/libio/Makefile
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -83,6 +83,7 @@ tests =3D \
+   bug-ungetwc1 \
+   bug-ungetwc2 \
+   bug-wfflush \
++  bug-wgenops-bz33998 \
+   bug-wmemstream1 \
+   bug-wsetpos \
+   test-fmemopen \
+diff --git a/libio/bug-wgenops-bz33998.c b/libio/bug-wgenops-bz33998.c
+new file mode 100644
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
++  int fd =3D create_temp_file ("tst-bz33998-", &filename);
++  TEST_VERIFY (fd !=3D -1);
++  xwrite (fd, "A", sizeof ("A")); // write "A\0" by design
++  xclose (fd);
++
++  FILE *fp =3D xfopen (filename, "r+");
++  TEST_COMPARE (getwc (fp), L'A');
++  /* If the bug is fixed, then ungetwc should not touch byte stream.
++     If the bug is not fixed, ungetwc firstly match last read char, L'A',
++     failed, then the pbackfail branch, matching last read char in byte
++     stream, that is, '\0' (initialized when setup wide stream). */
++  char *old_read_ptr =3D fp->_IO_read_ptr;
++  TEST_COMPARE (ungetwc (L'\0', fp), L'\0');
++  TEST_VERIFY (fp->_IO_read_ptr =3D=3D old_read_ptr);
++
++  xfclose (fp);
++  free (filename);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/libio/wgenops.c b/libio/wgenops.c
+--- a/libio/wgenops.c
++++ b/libio/wgenops.c
+@@ -111,2 +111,2 @@ _IO_wdefault_pbackfail (FILE *fp, wint_t c)
+-      && (wint_t) fp->_IO_read_ptr[-1] =3D=3D c)
+-    --fp->_IO_read_ptr;
++      && (wint_t) fp->_wide_data->_IO_read_ptr[-1] =3D=3D c)
++    --fp->_wide_data->_IO_read_ptr;
+--=20
+2.43.7
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index b01225e530..74db1ac507 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -58,6 +58,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch =
\
            file://0024-CVE-2026-5435.patch \
            file://CVE-2026-5450.patch \
+           file://CVE-2026-5928.patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.43.0


