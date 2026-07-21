Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4769C44536
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:46:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23209.1784641590542551585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=f5+5Ucal;
 spf=pass (domain: est.tech, ip: 52.101.65.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF9lsg2+sLXcoDX0Vdtp9brsc3D25xBV8KzCLF0QYuRdvUkn7v6d7rQu0/Fxf3UKtoC3YZRDqHmCKH+zaFqADefzGI1KnNf7BhcyD9/zWcuzgVXH+6Eo65byiMx45zvh3iTAxuxnMZKm4tXZAamSRzN7FiMFc/rjyt37DMpjna6axzAYFlb0J4byfubmEs7bA4G6w3GDQTne93qTp2gL5rsElJrYInA0+Lu+L45UUPFr5H2uxhlL8MmqrQX3syeRvGOd5EC8wUqiTfw9Paqf+rUbWh6eEIgjLUFOrD3Be4HmNui43vj7+hXB3n9IO0soeoSpJp7MSWwgzj3YVSesTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wCYYLMeHqPqr8RqqhoT8rvuWTYpeMfV7bI9a35FDjo=;
 b=tQuK/xEdDsrx/fFdNzUVHVXT0iZ+wp2qoOgcLBOQPE457WU/VpJntLwovsQzAY86FGCZT0gi91eypNPiszde9cMM/Z2P7MYGrdsiKyMlhD0D8iq3jb0p8aWQZo6sCuvik5g1xnCfLMnZ9dGE5f5fi2d6mg3awag+bjntYd5O0hZaj+rYwMZHbPnN/SKHeUc7JiLV8/dYeSh7RSUd/CwBMUy581MEPR/4bku57q6qz43U0bQI/JGXHbD1z8w3uOSy58WayejkurPNHeg/yfuKxYJ35Qs9AnnANKhaTZjsp/l66LI2kwlX2OnTyunIm85el5uhVKbp6uNMfYNBRDT+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wCYYLMeHqPqr8RqqhoT8rvuWTYpeMfV7bI9a35FDjo=;
 b=f5+5UcalWCaODipsJkIX2qYKLKgjIgmAZfIfmwHLSSG9AfpuCYZfkVTKGlFxvLKm/hsCS+teG2pFWelqzmzFWk/g4tBRS5meuRoVmJ0g/HeEt+n5gwFp/hQTyZq7BFD9016fcPHqtZTFxqS0SHCNjz40SKfzu8ppJckgNpiLFrkW4vXRBeKdfiN0BeRW3MDMUgck+U5EnjneKQ4jY6AoIRPIjv6bMWkiquD+JDvxRDK+21eTjc5OY2ijdTJZUMXbI+QuPb8nCJ7+Ld8u2tZ78rj462MPtqNV3CmuhuDuG+5tEt1DApcRiJgSUwKZc5epeODakSBKYIlyN4Q/dBBhKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:46:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:46:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 3/3] perl: fix CVE-2025-40909
Date: Tue, 21 Jul 2026 15:46:16 +0200
Message-ID: <20260721134616.16538-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0239.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e35f3d-4c3e-49ba-808c-08dee72e7691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|25016099003|22082099003|18002099003|12006099003|13003099007|29003799003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	btkY6Phz+hWAmFT1auxRhgK4COuys0RjBAenb2toTq/HuItGvLuOV6pBGesBGMzryWjzx3Sj7WDTkMOwnI6Kr5/vRlZXag9o4Yj4uYDYqFXvsPkSZbhFRTYAH3fwFURrJhwaBUkMUumChP2UzV0QxZHCcSKLP9/4aKIMiK2HG1ywKQAigsE0ECR1GEdLwFby+fqtb36ILTx/QqMtewGm5OiHk9Gq31Cwzdnvgbtew7K0g7n6YNKWJF/tKCsMxtkmp/lZy4j+G/D+QLjSNRqw+jAisuWoYP4uKotGCB501BiL0ErbUJ6Veercz/wRi1ITtTull1LzoFSvTAzbOomrGtB5uI/xBmB8YjE/PpBJeteX7sFRN1lgbRGr+x6rY9l0WvdjK/v5MQ0obZLiGMD4z2KPVpRl/5gKZc/3TyhvycSAXlfj0O9+HmEJWc2DE9ioTBfw4ATgB6KdJs2C7DuEMlY6mnBmLiCx01VRU1VgfDj6B99g5fJW2C3Lv3z8yR4hZfTYP0ulVTvhf1k10VQ2W2/tvUpje5my+y8+vDMrjUqs3kkyo95HmyEHNpsQoNd8DeZHxUSvYgtiYKeaPMJm69UgJBJr/ZRbM3wiYFxd/IwpnZs+8oUR0imFqdu30w+S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(25016099003)(22082099003)(18002099003)(12006099003)(13003099007)(29003799003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2OZJ8cNrSvJiLgrgRBJJP3VExeyvnjEHDLRLn6wjwTxBMndUhvt/G1T9nU1U?=
 =?us-ascii?Q?Ey9aPHXQqcHNHGh69jBFsqy9l7IzSw/wEL/kht6tujrjXbDS0HgG6/JTQlq8?=
 =?us-ascii?Q?D0Pn3PtjMtnd8N6W/i84YwqVQiRckFm2oa4UtdHimSceiZGfGHiSq/SLai2l?=
 =?us-ascii?Q?mNx9SO+EHz2N5l3htGRovm5dkNS4ujgv1Z0NMgcpoumPVfp+J1E76MsPeZk0?=
 =?us-ascii?Q?/WIsQvRbymazeG/pb35RGErJ32Px1jbx5L7ZRA9ZvIhRonJ4ojZ8k7FpYl7U?=
 =?us-ascii?Q?z7kd5hP3VYRgYd7OHOqFnZWSDvirnF6QM2BgBo6zA8IeEIR5mgRUOybyZlnw?=
 =?us-ascii?Q?9JhSkg8dL4lmvFDn9YZ399kl5RwXo+plLjfwhidUTVSbQJzvSw0zYmCQkRte?=
 =?us-ascii?Q?j/gDKkpVARFYz5VnJsglGGi6G6Ykc7oOAirQqr1NEdKtYeoQXvonB2YNnVFx?=
 =?us-ascii?Q?+n4/ScbQ6SwpvKq21JLY9+2i/3wTc6ulv7wndFuZmwaTdAChCG1zc6RpoCXG?=
 =?us-ascii?Q?DqCbMOSz5tCqTSjPhemlF2vwdBe0ioisTY2A4L+ZkfCsTee7qMhHCagysMnU?=
 =?us-ascii?Q?S2pG7xZTLmR8lkvoAfqPH9KHlQkYSNfyzs7LRiksAVTT4tF9d4R0xC+dl1mq?=
 =?us-ascii?Q?fqBOHap11O7vuWxkP9gU8nwz1J2W722yCBtyAEf82bQwGt9IAJ54McI9hOx4?=
 =?us-ascii?Q?pWFM1ycT3E6rbzwqik8N+RxIfyMpOocSX90kQ+en9/PATl3NcyHhPfv8azuk?=
 =?us-ascii?Q?IVzszbHkUs8+vyY8Q3H8BhzzfS+kfXWPwFzdW3o/fndoLfXjFM0q2InzS1jB?=
 =?us-ascii?Q?kg6GWlWiu3VtE1wrkxfYIYuqlq92epKZsBEebN3JZFD4lmQGbfV34ptYihrx?=
 =?us-ascii?Q?BTZtZQryxfS3jDt3DjXWpuNeIfp/T6j6+V/9scBW7/gxhNJuyCsJTlDTD5Ch?=
 =?us-ascii?Q?XpMp2mo2L61rMDphsi0ZhHwUcEWwkxnMT0dA4D1eXvwP6YpG2wQg6+veYsOr?=
 =?us-ascii?Q?2cCFzq4BzhnHPgKMQPuLXrbpu67MXz2VNRhmZToN5t7Ke5GE8v42lJPvLBhM?=
 =?us-ascii?Q?T30x0waZsBinp9bzI/UD021LYiL6pBWvfwY0tj+n/kaT32TlBiEtcaOEogWt?=
 =?us-ascii?Q?9B/d6aHVzFeWSw3l76/aZZDuS3XDzQFa3vvQc6aFARkXaFBThd9lMeI9GDRp?=
 =?us-ascii?Q?Lcl4GzKMT17wbrAjhYSaaul/CavJSCGGfutTBfEEaMHlgxJ2chwwMzaFTEpB?=
 =?us-ascii?Q?haiIUfj7cFIzkaWFkKtyFY5It7qL11Qa2hzkV4FMYEoP2ntY/UKrXLZT/dPR?=
 =?us-ascii?Q?Ge4d6Gu9HDmjQWKLIdPJN8aW+mHC6PdA1AOqJUzxHirpkxxNVNerY8jXIbK1?=
 =?us-ascii?Q?9PJSV0MnEkFpOFHrpMUSDZyz7tmRmazhMwFd8xCrSX0UqVFhFSrYqFYV7Cej?=
 =?us-ascii?Q?nQTWdEhzXAXUPQNb+W1Z9rGrwDgu2C5HcdwBnKTLzlsBwtAWUJ6M8Nweg0wK?=
 =?us-ascii?Q?txTQLpohUNxefpI2Ny3VdMPiL5EGkk/KobqycgOgaCwHTO+2Qt3Pdtj0xs7T?=
 =?us-ascii?Q?dRoOQ088P3bXppAqipE/0dA9x18SBKA8ZahDHXLGqsB/up/SAyctEPSuqRGj?=
 =?us-ascii?Q?4YTVF4C2bzhvYxRdYTcwJtYinFIr/Bn6KzppY/UotIF9PLf09/HACVGBuufU?=
 =?us-ascii?Q?JTOZhCcWKlNfiDSZa2Qz+DC6vbz4Cx79Hkn4HDQTzn4eoWkRCxLnIcDQD/PL?=
 =?us-ascii?Q?fRd3PZ/K66gB/NMj0oFnrZC4hJSBtuM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e35f3d-4c3e-49ba-808c-08dee72e7691
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:46:27.8089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0JHHDCwGdFag4WjDSNTqfQ9VABG71U6I+86pioMyx9z9VjzPWm54bQgogsWKOHH42jGJpExZNcgMC31wOnuoExi/qV0FjsRspBtIMmCzcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241528

This patch applies the upstream fix as referenced in [1], using the
commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-40909
[2] https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd=
74aba9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../perl/files/CVE-2025-40909.patch           | 412 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |   1 +
 2 files changed, 413 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2025-40909.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2025-40909.patch
new file mode 100644
index 0000000000..c9418a3574
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2025-40909.patch
@@ -0,0 +1,412 @@
+From 918bfff86ca8d6d4e4ec5b30994451e0bd74aba9 Mon Sep 17 00:00:00 2001
+From: Leon Timmermans <fawaka@gmail.com>
+Date: Fri, 23 May 2025 15:40:41 +0200
+Subject: [PATCH] CVE-2025-40909: Clone dirhandles without fchdir
+
+This uses fdopendir and dup to dirhandles. This means it won't change
+working directory during thread cloning, which prevents race conditions
+that can happen if a third thread is active at the same time.
+
+CVE: CVE-2025-40909
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/918bfff86c=
a8d6d4e4ec5b30994451e0bd74aba9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ Configure                      |   6 ++
+ Cross/config.sh-arm-linux      |   1 +
+ Cross/config.sh-arm-linux-n770 |   1 +
+ Porting/Glossary               |   5 ++
+ Porting/config.sh              |   1 +
+ config_h.SH                    |   6 ++
+ configure.com                  |   1 +
+ plan9/config_sh.sample         |   1 +
+ sv.c                           |  91 +----------------------------
+ t/op/threads-dirh.t            | 104 +--------------------------------
+ win32/config.gc                |   1 +
+ win32/config.vc                |   1 +
+ 12 files changed, 28 insertions(+), 191 deletions(-)
+
+diff --git a/Configure b/Configure
+index 44c12ced4014..7a13249caa96 100755
+--- a/Configure
++++ b/Configure
+@@ -478,6 +478,7 @@ d_fd_set=3D''
+ d_fds_bits=3D''
+ d_fdclose=3D''
+ d_fdim=3D''
++d_fdopendir=3D''
+ d_fegetround=3D''
+ d_ffs=3D''
+ d_ffsl=3D''
+@@ -13344,6 +13345,10 @@ esac
+ set i_fcntl
+ eval $setvar
+=20
++: see if fdopendir exists
++set fdopendir d_fdopendir
++eval $inlibc
++
+ : see if fork exists
+ set fork d_fork
+ eval $inlibc
+@@ -25052,6 +25057,7 @@ d_flockproto=3D'$d_flockproto'
+ d_fma=3D'$d_fma'
+ d_fmax=3D'$d_fmax'
+ d_fmin=3D'$d_fmin'
++d_fdopendir=3D'$d_fdopendir'
+ d_fork=3D'$d_fork'
+ d_fp_class=3D'$d_fp_class'
+ d_fp_classify=3D'$d_fp_classify'
+diff --git a/Cross/config.sh-arm-linux b/Cross/config.sh-arm-linux
+index bfa0b00d5f0f..9e056539198b 100644
+--- a/Cross/config.sh-arm-linux
++++ b/Cross/config.sh-arm-linux
+@@ -212,6 +212,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3Dundef
+ d_fds_bits=3D'undef'
+ d_fegetround=3D'define'
+ d_ffs=3D'undef'
+diff --git a/Cross/config.sh-arm-linux-n770 b/Cross/config.sh-arm-linux-n7=
70
+index 47ad5c37e3fd..365e4c4f9671 100644
+--- a/Cross/config.sh-arm-linux-n770
++++ b/Cross/config.sh-arm-linux-n770
+@@ -211,6 +211,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3Dundef
+ d_fds_bits=3D'undef'
+ d_fegetround=3D'define'
+ d_ffs=3D'undef'
+diff --git a/Porting/Glossary b/Porting/Glossary
+index bb505c653b0b..8b2965ca99c6 100644
+--- a/Porting/Glossary
++++ b/Porting/Glossary
+@@ -947,6 +947,11 @@ d_fmin (d_fmin.U):
+ 	This variable conditionally defines the HAS_FMIN symbol, which
+ 	indicates to the C program that the fmin() routine is available.
+=20
++d_fdopendir (d_fdopendir.U):
++	This variable conditionally defines the HAS_FORK symbol, which
++	indicates that the fdopen routine is available to open a
++	directory descriptor.
++
+ d_fork (d_fork.U):
+ 	This variable conditionally defines the HAS_FORK symbol, which
+ 	indicates to the C program that the fork() routine is available.
+diff --git a/Porting/config.sh b/Porting/config.sh
+index a921f7e1c79a..6231ea0f31ea 100644
+--- a/Porting/config.sh
++++ b/Porting/config.sh
+@@ -223,6 +223,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'define'
++d_fdopendir=3D'define'
+ d_fds_bits=3D'define'
+ d_fegetround=3D'define'
+ d_ffs=3D'define'
+diff --git a/config_h.SH b/config_h.SH
+index da0f2dbcd7b7..5a0f81cf2011 100755
+--- a/config_h.SH
++++ b/config_h.SH
+@@ -142,6 +142,12 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#undef\(.*/\)\*!/=
\*#define\1 \*!' -e 's!^#un
+  */
+ #$d_fcntl HAS_FCNTL		/**/
+=20
++/* HAS_FDOPENDIR:
++ * This symbol, if defined, indicates that the fdopen routine is
++ * available to open a directory descriptor.
++ */
++#$d_fdopendir HAS_FDOPENDIR		/**/
++
+ /* HAS_FGETPOS:
+  *	This symbol, if defined, indicates that the fgetpos routine is
+  *	available to get the file position indicator, similar to ftell().
+diff --git a/configure.com b/configure.com
+index 99527c180bfc..7c38711bb85d 100644
+--- a/configure.com
++++ b/configure.com
+@@ -6010,6 +6010,7 @@ $ WC "d_fd_set=3D'" + d_fd_set + "'"
+ $ WC "d_fd_macros=3D'define'"
+ $ WC "d_fdclose=3D'undef'"
+ $ WC "d_fdim=3D'" + d_fdim + "'"
++$ WC "d_fdopendir=3D'undef'"
+ $ WC "d_fds_bits=3D'define'"
+ $ WC "d_fegetround=3D'undef'"
+ $ WC "d_ffs=3D'undef'"
+diff --git a/plan9/config_sh.sample b/plan9/config_sh.sample
+index 636acbdf6db3..246bad954424 100644
+--- a/plan9/config_sh.sample
++++ b/plan9/config_sh.sample
+@@ -212,6 +212,7 @@ d_fd_macros=3D'undef'
+ d_fd_set=3D'undef'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3Dundef
+ d_fds_bits=3D'undef'
+ d_fegetround=3D'undef'
+ d_ffs=3D'undef'
+diff --git a/sv.c b/sv.c
+index ae6d09dea28a..8a005b2d165b 100644
+--- a/sv.c
++++ b/sv.c
+@@ -14096,15 +14096,6 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS *=
const param)
+ {
+     DIR *ret;
+=20
+-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
+-    DIR *pwd;
+-    const Direntry_t *dirent;
+-    char smallbuf[256]; /* XXX MAXPATHLEN, surely? */
+-    char *name =3D NULL;
+-    STRLEN len =3D 0;
+-    long pos;
+-#endif
+-
+     PERL_UNUSED_CONTEXT;
+     PERL_ARGS_ASSERT_DIRP_DUP;
+=20
+@@ -14116,89 +14107,13 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS =
*const param)
+     if (ret)
+         return ret;
+=20
+-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
++#ifdef HAS_FDOPENDIR
+=20
+     PERL_UNUSED_ARG(param);
+=20
+-    /* create anew */
+-
+-    /* open the current directory (so we can switch back) */
+-    if (!(pwd =3D PerlDir_open("."))) return (DIR *)NULL;
+-
+-    /* chdir to our dir handle and open the present working directory */
+-    if (fchdir(my_dirfd(dp)) < 0 || !(ret =3D PerlDir_open("."))) {
+-        PerlDir_close(pwd);
+-        return (DIR *)NULL;
+-    }
+-    /* Now we should have two dir handles pointing to the same dir. */
+-
+-    /* Be nice to the calling code and chdir back to where we were. */
+-    /* XXX If this fails, then what? */
+-    PERL_UNUSED_RESULT(fchdir(my_dirfd(pwd)));
++    ret =3D fdopendir(dup(my_dirfd(dp)));
+=20
+-    /* We have no need of the pwd handle any more. */
+-    PerlDir_close(pwd);
+-
+-#ifdef DIRNAMLEN
+-# define d_namlen(d) (d)->d_namlen
+-#else
+-# define d_namlen(d) strlen((d)->d_name)
+-#endif
+-    /* Iterate once through dp, to get the file name at the current posi-
+-       tion. Then step back. */
+-    pos =3D PerlDir_tell(dp);
+-    if ((dirent =3D PerlDir_read(dp))) {
+-        len =3D d_namlen(dirent);
+-        if (len > sizeof(dirent->d_name) && sizeof(dirent->d_name) > PTRS=
IZE) {
+-            /* If the len is somehow magically longer than the
+-             * maximum length of the directory entry, even though
+-             * we could fit it in a buffer, we could not copy it
+-             * from the dirent.  Bail out. */
+-            PerlDir_close(ret);
+-            return (DIR*)NULL;
+-        }
+-        if (len <=3D sizeof smallbuf) name =3D smallbuf;
+-        else Newx(name, len, char);
+-        Move(dirent->d_name, name, len, char);
+-    }
+-    PerlDir_seek(dp, pos);
+-
+-    /* Iterate through the new dir handle, till we find a file with the
+-       right name. */
+-    if (!dirent) /* just before the end */
+-        for(;;) {
+-            pos =3D PerlDir_tell(ret);
+-            if (PerlDir_read(ret)) continue; /* not there yet */
+-            PerlDir_seek(ret, pos); /* step back */
+-            break;
+-        }
+-    else {
+-        const long pos0 =3D PerlDir_tell(ret);
+-        for(;;) {
+-            pos =3D PerlDir_tell(ret);
+-            if ((dirent =3D PerlDir_read(ret))) {
+-                if (len =3D=3D (STRLEN)d_namlen(dirent)
+-                    && memEQ(name, dirent->d_name, len)) {
+-                    /* found it */
+-                    PerlDir_seek(ret, pos); /* step back */
+-                    break;
+-                }
+-                /* else we are not there yet; keep iterating */
+-            }
+-            else { /* This is not meant to happen. The best we can do is
+-                      reset the iterator to the beginning. */
+-                PerlDir_seek(ret, pos0);
+-                break;
+-            }
+-        }
+-    }
+-#undef d_namlen
+-
+-    if (name && name !=3D smallbuf)
+-        Safefree(name);
+-#endif
+-
+-#ifdef WIN32
++#elif defined(WIN32)
+     ret =3D win32_dirp_dup(dp, param);
+ #endif
+=20
+diff --git a/t/op/threads-dirh.t b/t/op/threads-dirh.t
+index bb4bcfc14184..14c399ca19cd 100644
+--- a/t/op/threads-dirh.t
++++ b/t/op/threads-dirh.t
+@@ -13,16 +13,12 @@ BEGIN {
+      skip_all_if_miniperl("no dynamic loading on miniperl, no threads");
+      skip_all("runs out of memory on some EBCDIC") if $ENV{PERL_SKIP_BIG_=
MEM_TESTS};
+=20
+-     plan(6);
++     plan(1);
+ }
+=20
+ use strict;
+ use warnings;
+ use threads;
+-use threads::shared;
+-use File::Path;
+-use File::Spec::Functions qw 'updir catdir';
+-use Cwd 'getcwd';
+=20
+ # Basic sanity check: make sure this does not crash
+ fresh_perl_is <<'# this is no comment', 'ok', {}, 'crash when duping dirh=
';
+@@ -31,101 +27,3 @@ fresh_perl_is <<'# this is no comment', 'ok', {}, 'cra=
sh when duping dirh';
+    async{}->join for 1..2;
+    print "ok";
+ # this is no comment
+-
+-my $dir;
+-SKIP: {
+- skip "telldir or seekdir not defined on this platform", 5
+-    if !$Config::Config{d_telldir} || !$Config::Config{d_seekdir};
+- my $skip =3D sub {
+-   chdir($dir);
+-   chdir updir;
+-   skip $_[0], 5
+- };
+-
+- if(!$Config::Config{d_fchdir} && $^O ne "MSWin32") {
+-  $::TODO =3D 'dir handle cloning currently requires fchdir on non-Window=
s platforms';
+- }
+-
+- my @w :shared; # warnings accumulator
+- local $SIG{__WARN__} =3D sub { push @w, $_[0] };
+-
+- $dir =3D catdir getcwd(), "thrext$$" . int rand() * 100000;
+-
+- rmtree($dir) if -d $dir;
+- mkdir($dir);
+-
+- # Create a dir structure like this:
+- #   $dir
+- #     |
+- #     `- toberead
+- #            |
+- #            +---- thrit
+- #            |
+- #            +---- rile
+- #            |
+- #            `---- zor
+-
+- chdir($dir);
+- mkdir 'toberead';
+- chdir 'toberead';
+- {open my $fh, ">thrit" or &$skip("Cannot create file thrit")}
+- {open my $fh, ">rile" or &$skip("Cannot create file rile")}
+- {open my $fh, ">zor" or &$skip("Cannot create file zor")}
+- chdir updir;
+-
+- # Then test that dir iterators are cloned correctly.
+-
+- opendir my $toberead, 'toberead';
+- my $start_pos =3D telldir $toberead;
+- my @first_2 =3D (scalar readdir $toberead, scalar readdir $toberead);
+- my @from_thread =3D @{; async { [readdir $toberead ] } ->join };
+- my @from_main =3D readdir $toberead;
+- is join('-', sort @from_thread), join('-', sort @from_main),
+-     'dir iterator is copied from one thread to another';
+- like
+-   join('-', "", sort(@first_2, @from_thread), ""),
+-   qr/(?<!-rile)-rile-thrit-zor-(?!zor-)/i,
+-  'cloned iterator iterates exactly once over everything not already seen=
';
+-
+- seekdir $toberead, $start_pos;
+- readdir $toberead for 1 .. @first_2+@from_thread;
+- {
+-  local $::TODO; # This always passes when dir handles are not cloned.
+-  is
+-    async { readdir $toberead // 'undef' } ->join, 'undef',
+-   'cloned dir iterator that points to the end of the directory'
+-  ;
+- }
+-
+- # Make sure the cloning code can handle file names longer than 255 chars
+- SKIP: {
+-  chdir 'toberead';
+-  open my $fh,
+-    ">floccipaucinihilopilification-"
+-   . "pneumonoultramicroscopicsilicovolcanoconiosis-"
+-   . "lopadotemachoselachogaleokranioleipsanodrimypotrimmatosilphiokarabo=
"
+-   . "melitokatakechymenokichlepikossyphophattoperisteralektryonoptokepha=
l"
+-   . "liokinklopeleiolagoiosiraiobaphetraganopterygon"
+-    or
+-     chdir updir,
+-     skip("OS does not support long file names (and I mean *long*)", 1);
+-  chdir updir;
+-  opendir my $dirh, "toberead";
+-  my $test_name
+-    =3D "dir iterators can be cloned when the next fn > 255 chars";
+-  while() {
+-   my $pos =3D telldir $dirh;
+-   my $fn =3D readdir($dirh);
+-   if(!defined $fn) { fail($test_name); last SKIP; }
+-   if($fn =3D~ 'lagoio') {=20
+-    seekdir $dirh, $pos;
+-    last;
+-   }
+-  }
+-  is length async { scalar readdir $dirh } ->join, 258, $test_name;
+- }
+-
+- is scalar @w, 0, 'no warnings during all that' or diag @w;
+- chdir updir;
+-}
+-rmtree($dir);
+diff --git a/win32/config.gc b/win32/config.gc
+index f8776188c09c..34aa8de6ed75 100644
+--- a/win32/config.gc
++++ b/win32/config.gc
+@@ -199,6 +199,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3D'undef'
+ d_fds_bits=3D'define'
+ d_fegetround=3D'undef'
+ d_ffs=3D'undef'
+diff --git a/win32/config.vc b/win32/config.vc
+index 619979e22b53..536085fe94e0 100644
+--- a/win32/config.vc
++++ b/win32/config.vc
+@@ -199,6 +199,7 @@ d_fd_macros=3D'define'
+ d_fd_set=3D'define'
+ d_fdclose=3D'undef'
+ d_fdim=3D'undef'
++d_fdopendir=3D'undef'
+ d_fds_bits=3D'define'
+ d_fegetround=3D'undef'
+ d_ffs=3D'undef'
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devto=
ols/perl/perl_5.38.4.bb
index b4927646d7..b86c58f540 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar.=
gz;name=3Dperl \
            file://CVE-2026-13221.patch \
            file://CVE-2026-57432-01.patch \
            file://CVE-2026-57432-02.patch \
+           file://CVE-2025-40909.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \

