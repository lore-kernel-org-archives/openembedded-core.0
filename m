Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CBACA5FE2
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 06:33:32 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13988.1791180752915219304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 23:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=oHQrDuNl;
 spf=permerror, err=parse error for token &{10 18 secureserver.net}: SPF record not found (domain: bmwtechworks.in, ip: 52.101.225.29, mailfrom: upstream_ip-sp@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSwKCVCBe13xFdkDuoK9Jxiv54VlOj57TA1GmjgZhnBu9FpZkADRZh/LCjqf4ptCcmX1QDStjcm0ot3EQRcOI+pyZ8/HlLYepGZiwxzhP+fOQ4fN5VFryPOu2taEy8DP0INY2Qcp7TTs62jrfMmJXBdXx/P7s9BxWRrl/WWAReX1ObFnxhXq+ZqRHk8La9R8AxX27g9+at7bWEeqiBiUusuGy68D3VogXlpr2+ILg/7rDBECtkcC9mW/AbchnwshBSuiu09NrWwUv8W3IP7LIO+EOlGf4hsXqJSAebo1NsGv5hF71izmgTnH8wChf2IhOrXOk12kGm8747H90GOBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/45Hdpvow1bXrYFg0Qpq+Li9axKrgirZqw8ljFxLCk=;
 b=zExX9jGDguZcMBtymliM4aE5ObU49PtuPSQ7ISbcT8TYB4RDM/p2jbdWzOG2ei+JY0xShwVif2YclzxTvaqAvmyorcSaJ+yi1FQZQKe5RUC/kHRrDWILt63uvV63RaWISyxVsnvYSH9kYp6Hp7CY8de6uN+B4rU8I81nkJW2Qp3iPGvWUtB+iJ64iM4cLQcGp9CyTRrGoNdl5/CxUpEUzjwIVqWxtnjKHgEDVu3JTuk0WS9lm9lAyQLmbC/OHzG55LDlGjRf2MyQE0W2ZfovrYjSjiV9mXToFFnqr4Gvp40KQ3RkJw17xMFP+WA3I7ZiJZdlfIvAVY/NIrFKt2Kx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/45Hdpvow1bXrYFg0Qpq+Li9axKrgirZqw8ljFxLCk=;
 b=oHQrDuNlI2pJOwXo03ENll6IA6nsiHnUuuYWNJLD9Dr28xox5jtsmCNC1k3M6gjSkxvWTeI7n0gMKNNKXeovKRByv6Q+N5dPU2BFLZM85oJiiEdHthPgO4KWd2Px1F1KkI6EpK+PvU4FHqIoVUHgJGmnnVWcJRfvKQmeh5eHOtdmlFzXAyNEtXQQPYcamKONM9uNATbrlQUbdz+12bAEjREuwZVWid34Yx2tsVgNXte5KNsDOy1wq+5vXd/mUINt720O4qCAHh2luh9oBQA7nsssoVAzDMR0SbjV7WubfywiTxYtr8/j7aH0XBdGF2iwp23FmvBv/SrNj20K8+3Rbg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bb::5)
 by MA5P287MB4174.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:162::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 05:56:30 +0000
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de]) by MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 05:56:30 +0000
From: Sourav Kumar Pramanik <UpStream_IP-SP@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: souravkumar.pramanik@bmwtechworks.in
Subject: [scarthgap][PATCHv2 2/2] glibc: Fix CVE-2026-5928
Date: Mon,  5 Oct 2026 11:26:01 +0530
Message-ID: <20261005055601.111500-2-UpStream_IP-SP@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005055601.111500-1-UpStream_IP-SP@bmwtechworks.in>
References: <20261005055601.111500-1-UpStream_IP-SP@bmwtechworks.in>
X-ClientProxiedBy: PN2PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::23) To MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1bb::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB5315:EE_|MA5P287MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 5988b384-fda1-4396-bd32-08df22a5671e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|18002099003|55112099003|22082099003|10067099003|13003099007|260925021311599003|260925021911599003|260925022911599003|5023799004|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xoSzIf8ja5Lz4EaGQSqERWLtcqsFCKgUCAf/vpzlvnQwyCA0XoMvhi28w4SR5mAj4L/pg54NdP7/+AWl4aQoMhWlTRwmta64wIwHX1Bof5+6QYHGOwzJgdEr5XDBu7XN+xKxDK6S3qMoO9+CyIrhxCSedIPsbxNqj9ZzM5YzQwWUBRxxsWpo18UxxgKS4nIFFPH/IB6by3C/ux9XFQISWGoKh4z79z2fL0gNxbiVDFW07Evb31nCELt/Tlx7/ZE6VZfjlEsz2xZ9upG2E8TbEk0x3jmUMLn1HeylnOaRt03LGCB0IXVNOimXo4uvbvhG9eDL532hH/v134OXEZUllWju7x1q40h93p3C2CTGeSRDZGEGSCs4zUSd+6x6NftUho1KGH9Gctsd56J9QQ2mXIKIz/gh3i7B49WBU2RrURd+X+d9y8aFc2ex1acb4UqmnNR7p+B8acQeG3RKAGHd67OfS1dC5JNy3Sx8BtITB2AsriaJKIQYO4W4YpV1Openk5F9DS9MDKlfLSJ4TcEM6rBfsfWbj8CDiVESDd7QuTteYmduqeI5myfDbEylRv7U+/e7HXiYU6SPqrxbsaBI028KcK6SGLtsOjlFETAEUiiJ++S7lf+8w5dSyHe3Y7dMNjQ+K10rzidSDCZWD94ScNzSWmkATcUjxdIPDdO+dCU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB5315.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(18002099003)(55112099003)(22082099003)(10067099003)(13003099007)(260925021311599003)(260925021911599003)(260925022911599003)(5023799004)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6GgIeZ4ixSY052MCoNCOTt9uK9IaGPc3zQeZUVxtY9oH7tyPmx26HxzEbLgB?=
 =?us-ascii?Q?2DikxdSGcbfUyKNO3/DwiSwX9PrxPgPi49+Q5th4gNuTewwAxR825JRgMPy1?=
 =?us-ascii?Q?S4PxQWdP5c0ZuRibhNBlynSIJXRIgFgL3hUitaVgwY4wifR+yOynTCsc2Zjq?=
 =?us-ascii?Q?DsYrzM59/4Cf4TtCc3sGKs+IO2vZLGgPwQRr9RTf8VmVNI6yLMgSfkbwlj9x?=
 =?us-ascii?Q?SiPQBmdka6F5IryKCSdaIMdk7RZR63L1wtDYUFlpTo15aNiHJAEZftMlKZRh?=
 =?us-ascii?Q?wyFIPtwxGjfS7y0yl/YUPsgdtkzvn34jb0RPgatFVejLIfZ7EtMgZIbWAYcG?=
 =?us-ascii?Q?jNMvU+hHTpg8oyW/YcvxQQi6q2w6q1m0wrDnsEag6cxlJXFLr7dSpYSl/Jxs?=
 =?us-ascii?Q?lvgLsvpD/x7UljwIO9RCKVgw4y4EV1wJmZ3km9lnMqe7xgh1MGLQu2z2Z7dN?=
 =?us-ascii?Q?NbMYg0Yz+ewN1WhcbZBSm2ajhp/NUZc/GGgM4idvaCwMbTxZ7Qegpjf0iZuN?=
 =?us-ascii?Q?+6oHMdhxYKG2Nat6ppSMC57vUPYJtwWr5AWgTLFLPnENfA3R6O8WQkYgrA1q?=
 =?us-ascii?Q?FXeRPfmkLp3Nisw+3lmE+VGgzuzDx2KyrzsvFtD7vr1IpzSD8TwgaiAX5p2D?=
 =?us-ascii?Q?go93qeJkcaxkkbjfDKWqZF4AmG9LsejDRlT7gy9O3JS2i8pLry98qJTdAxJ+?=
 =?us-ascii?Q?RJB7G+Ww9Sy9P4t1koo/5nXUWqQUnj/gdkvkfZnTC5ANlY5AogzfDlxJg5Cq?=
 =?us-ascii?Q?QsdYc8vgKJARSyFOlU0eUIOQIDYbVK099ipyD/LilN4lO9/si+NiVXZQ8NaU?=
 =?us-ascii?Q?GvC/fu+lIWyPXflkgkBgI1YbeEI6w707c2Fb4qlpgDOvSt04dk+QW4RI3zW4?=
 =?us-ascii?Q?h1/QSTSWznqHtWO9GeJBJ7usr+n8tlcpgwuBjt7+rTi6oLeTqirPQuu4cHeg?=
 =?us-ascii?Q?LDL0/Zo6PaxAql8pRdutTNBsFJKorgo5WmWpkZfGiDEAcKdMhEsO1/ULOOSo?=
 =?us-ascii?Q?vO/PnhSrvuxVLqhbZvC6uA0xNdVCUrx/j9fHAPU4jgORC7abUrsvJSUiF+Gi?=
 =?us-ascii?Q?I/68waL0CydWTp5556+WSYpbY+yxOsAqk86HU3wLrX7LNMfZDwRorwBK8wJB?=
 =?us-ascii?Q?GoAgPNx+Naad6N2Qu+TaRWik9X8ALzPopo7QQ4R+XcaH7b5CXZn+/xMx49Xx?=
 =?us-ascii?Q?qsSeTDJzLK1bpPQmdlKyzaFYhY7u5NweXtH8RYB9AjOkejr5iI15ZbdupXWg?=
 =?us-ascii?Q?x8bjGKz4Ek3xm+BZuhDXoqufIrTH64Pf3w5j7k9LJhY63Q95AZpIr46SQSbx?=
 =?us-ascii?Q?aB7eN1+f5rppbToZtq5dyEu0DXigy51rP4yq47RnviQaLlRk5LcKr0N8FZCc?=
 =?us-ascii?Q?VqOoJmN5iNGzlRj9+SODW1XPhdnKhVwlMKWecgLPCHbgzI8ZA4ObcMl1S63d?=
 =?us-ascii?Q?VDk4g8xdoHcB1eKLQzAqKCWuiu/q5yuGnLfbX5Fnk/QZikFCt3mdttmyt8im?=
 =?us-ascii?Q?AEejeQujSm6rMBSH3UGzNAfYZpAIhbylp7kEUef0eRs2fkobPSDSDCr1w+dW?=
 =?us-ascii?Q?HEUpzkyedm2LtG7NOpNYJcLpFoMr2V66utlEz666JXcBDVqWOnhzM7hjMia3?=
 =?us-ascii?Q?4/Tt9etoVL/d7odbV4I9Jchl9KCySBji/Adh0JEnO/E6tAu+UIFIIZmY0h6c?=
 =?us-ascii?Q?Sv06eiV44jVwiXPz+ADxEdeAeE4OeSwXzZZa8e4V1+3YBB+gDgxz8fmpAw3n?=
 =?us-ascii?Q?idzLjzC+ri8hPG4FIWb8IGb69LJwMWs=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 5988b384-fda1-4396-bd32-08df22a5671e
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 05:56:30.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Eiyl1W33+mF2H29HFpaKVpvqPVmx62107zu/UqOhVunuCS19ookgb7flZWHG8tuZcAgFUmmxD+9C81xS0tfx2hYOd2X5XF1AZezZtye9eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4174
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 06:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247215

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


