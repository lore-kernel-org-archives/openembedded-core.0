Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C573FC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:05:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37100.1782738325842836255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=njYqb2qG;
 spf=pass (domain: est.tech, ip: 52.101.83.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5polP1/o7PzjQn5KFQTQf3vmbo3HNB8oF86ZYAK9TFxOB2bJfb/eDBwIw7eOj/ir7cyc/wu0ivCEVOgaoAdspdphMZnGMGqOxtDCtIMt/phjG5Oud+IelD+/Wz94DzkVmu87e+mKHQevAtE02C+6ZgEK9MQIEPOB/nVCWZ4+GlUFcO0c5tRufVsMMQ6qiw0JQgDvLwr8+D4zFu7pIngzD34MnxTIDqjXidz6eM8qokLXuwCH8Cjn299hpmQjVE9DVHibtQ3dwShDWFsb/x7ID1h5a+R4pLMYoDerjzj1Ry+0RRfOBd+jZoMiqv51grRF07IVAbmowoWBeWCIxamJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L+BIvvSwiflqX3YWMjUHgjgowUBrjhIRHW+wHMy+M4=;
 b=ydw8A7dGcFfElfEKzghHpR+GMIlkTtJLdMVVKWauVuB9/qJMcuPX20RUV5RotWkILWG6yx5wv/3O2DDflw5uB42Ejr4LhinhoIErAWWaDTw5Yh5Ym7LbTt5ugVrNCKhUNrPJ94tlrWw1mUW+FGzXWziu/Vj1Vq44i0u6nS4feGbwwKgVugk5BnbkSQCTFewze485u/gRUHSjCBgUE37we5EUIRmKXbyFBDO0h2zH7yTLJeTQv6wmmSFv/mB40HYELIAxsSzXdvTDMCKNg4YR9GsY0asUVDFP3ElrDHuU/OtblhtetKKk4puPc4zsCf9u0X+MGU0C6AeLF8bT59peOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L+BIvvSwiflqX3YWMjUHgjgowUBrjhIRHW+wHMy+M4=;
 b=njYqb2qGL2tqRw4R8bDZuY8m7ghTnWclw4eMXf2F9Y6q6OTbEmglCCci4GijlCL3y0jbJL0elRtay1SXu6oKjDufTlRP6xsos4bjd5g8hh9sHgIN7n16/fsC0BwJpzORl7eOkH48n7H6XNxD9N8HCjjlvXmvRkHR/qeeBVFld1nbk6oa56je5F8IcJgjlhGu2ND5E6AwobevP3mfEIZjWFPuYpePTdWyB1oRFTZUrABXeX+12BRl+PlvvxNMLw6uhRVQ8jVu6l2iQ67kdGMYKr7f9I+HcfwaxBxkDWtqZPRMQCJb+xLyM5pTBrNgzaTneFxFrzYN8Eh7o4JucOixZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM4P189MB3502.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 13:05:18 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 13:05:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] perf: Fix BUILD_BPF_SKEL PACKAGECONFIG to not define variable when disabled
Date: Mon, 29 Jun 2026 15:05:15 +0200
Message-ID: <20260629130515.39891-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM4P189MB3502:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a108fb9-c5c5-4072-dad4-08ded5df119b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	JQzYUXY15xlJWN3PY/DDEmCSSbBEFnypWW9sGYWDWx6vM7kgV6LYMR72xq8TY/r/b7xiBaCuDS27ew+XDQPv36ArWnJus49aIGoBhuHfLarxlDZhm/K6SuODK0WGjtlaBF4gpKFrbybkaR9nLFnop16aAqBdFS/NSlRpedHSzTgdoSc6tUIqlneVulnSkZeJMo/RdgihZrXXMi0zKrEvCfeXrPtaFSWHBmuKC1mY522JjNeDBluUX39G16sOmlzLlg32SXiI0Gr4g5TjPWfgNW0rkM3ZXsomgDkOYJgEnxJ5FcbsS82SXXxzGWQXQLCb7JdxvWikUPDQ8F3Ril80u9ZH6tj6mb0wC9DSvwH21BVoElzJpwzs3bMfzk2l8QTWjjpxKrGq+ac3vPUv/KImSy1P7Q3zBKnCg0CQcecp+a8ntjspoUbitoTFVD6A+VPOwIMNKAC5V5gsS+cj2FkIpxMVb9S24CNkEmH6S9v3g2YQXYQ8qCnHAE8pQg4d6OJ8U0zIc1WZ5Mi7eAv+FbmTYB+TyuIFrbzaSOm5w86+6/KrEceuNsykS3yPcYAWoq2/MVMnmwwUFJVoPxQQFdvRaJmXGkd/Ly7IB1b/ib8yd1eOarSg/3UpRongOUQHO2M1AKoO4YPbUO3oQ1rMWR+8xw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bNdtzbrk5IoZP/o3G6NZnG+3wvYAe0Vj1436Ox8uFPCb5Oo/rzdjkIqAfTi7?=
 =?us-ascii?Q?4cKTadGh3JfJ++ypTUiacyDseCx6I9PnVl67QyumEdQA+SgvGclmaEQvHfUW?=
 =?us-ascii?Q?x8CkEBveKQPtZAQwxCKq+niL8hhydMOQa7cojXh/zhk4QZzUuW4aiWipiF7K?=
 =?us-ascii?Q?k9HPSLpCyfhM81a6ueYORAE6Vs9aAoRei0EW+6X+r9Q9CelS9ykpeh3v+rdz?=
 =?us-ascii?Q?vjAzjs9dI56X3kuJ4OQMB0PrU3QJi/bGOjf6Voxr1etlSixev3V2KIJrQ7zS?=
 =?us-ascii?Q?Vu9iDiIesregeZzDxiGoakFi4kaNYgOVP8S4uK7zdHOBb3e/g1EbdZmied87?=
 =?us-ascii?Q?WisLAE823Gjc0UtUm50IiADqhOcCuhWZqFe+YEXFeq7R9/TW1ZHjVGRlTX8/?=
 =?us-ascii?Q?+fE7INwuxi99R7bU1LywIdLVPmyFIGpWZn/ydzklTuXJbWtWwl2He/xez6mU?=
 =?us-ascii?Q?wFHxtjI0kgVci9L4YZO5WUbnIEEoBD5MgRZbTjcLVgLcKeBPhBSNMTLJmJ1T?=
 =?us-ascii?Q?MCI3/IIhq2mNCCALklUQ4bM8AcfY6lmiGJjKZL3HkA7fPqJKfvPoLUMo6Hbt?=
 =?us-ascii?Q?l2cKQAYhY5NLYIQ6Xb8xDZxpJIn1Ff4RUJGwpsSRBt8iVIwSBUi50zaVHQLL?=
 =?us-ascii?Q?AC00GbiznySjAKgt1e5VuhQC2+dNLZ9sMSelJthFe9i/DqxIPkmiWK/b5X9i?=
 =?us-ascii?Q?Z9sSZJ7G62vvkA9hThNCW3cer2xYn9XfrzVNHGmBA7nWwMvJaxOpd21jFL2n?=
 =?us-ascii?Q?benPrIwFPedGM1oIVVhLgdvfYFc8SRoGC7otctjzwiIjScwY1vSpVQhe43Q2?=
 =?us-ascii?Q?KplllQTAIG2eTeqTFwK1TCSsVOmtiC5tv3dJ0iEZTr+Bx+uHrxt+fVj/gJPc?=
 =?us-ascii?Q?WWcVvUG85GV9fLjfKMd0lifneFGoRf92nby02imYEyLhUBGB8fPsSVgFITou?=
 =?us-ascii?Q?H2pzFlXrMWPeYE6cYWDA1dHWaW9GfMZW4HFluNhYmO65h6N3ZsN4yQy+3hoL?=
 =?us-ascii?Q?Jy5rjRfUOjubUldQdLVGVA8S95urZ3bxJqvvnxtDCtmly4Hf5qlZn6tDAVP4?=
 =?us-ascii?Q?lhMyo1KrkaI8LrydEbN6MhGErlf0p3e+n17Q46/PI+eLKxWLq2A5yQrMKkye?=
 =?us-ascii?Q?gLdlqCRfnfFRcKeXexmvgn4weWNMPHmbYff08umLVAyufrTsXMH2405dYRWO?=
 =?us-ascii?Q?GSXgCqeOnLVQhJcqIrwgjK0C7oXrD8G1I1/oxuj5UMKGuS+ei0TinnWMsuJr?=
 =?us-ascii?Q?+NiCAsjWyPQevzrABLwWlHHOiqoSicbr/ERCjfGrGmCMrQGj4rgIAlUbDcKw?=
 =?us-ascii?Q?m6MfeCr6WTyZSH0ax1hMrbgCj3i9YkGrdqqb9U7UNqDnnborC7VVgHVCGEid?=
 =?us-ascii?Q?SD5gGlDWTjvw0u6oNu/Kbi6Sh6+cvhlyg6wyT+uyyC6ugVASI+TXQ0nYgvyC?=
 =?us-ascii?Q?/c5W2fZdCLxuKZTj5TCWCSUGJlvbt8guGdV/I66Sexs546g4Ckjhz+alqu5v?=
 =?us-ascii?Q?sqoEHJD8pIvfLZN8Wxef4BojO4QA8q6698NHpuru9bJHxrfkbYLg3OVgUmML?=
 =?us-ascii?Q?aAbhXp7GemnKZPZ/pvx0xBBY7fZ8MzxagfDczH670eRw9pcqQxqBAeyqJ5t0?=
 =?us-ascii?Q?9kYam3Mnn/Go0EYt0zodo6454ZNkgrEcTo5wazGlYoHT4U0qTWTFNHfvO6zV?=
 =?us-ascii?Q?ltlafTBTCAXiNyVyP5Mmery9MEcaOV5N1Q5VM8hSufYUm7jH87rxtkBhvtvx?=
 =?us-ascii?Q?4G+kJ7IkGQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a108fb9-c5c5-4072-dad4-08ded5df119b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:05:18.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRwCWyVpWJQ4nes9kZTQ2ebWWV339hYROwH3ylEhd4S/1VVkduvAty+pMBKNLivBiHKIs3IfelnuK8UGwyT/bqLRth1VDcbzGEgRV6CbZIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3502
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239774

The kernel's Makefile.config has two BUILD_BPF_SKEL checks:
- Line 219: ifeq ($(BUILD_BPF_SKEL),1) - value check (works with =3D0)
- Line 668: ifdef BUILD_BPF_SKEL - defined check (triggers for ANY value)

The previous fix (f48f6fb91c) passed BUILD_BPF_SKEL=3D0 which correctly
skips the first check but still triggers the second 'ifdef' check,
causing a build failure when clang is not available or too old.

Change from:
  PACKAGECONFIG[bpf-skel] =3D ",BUILD_BPF_SKEL=3D0"
To:
  PACKAGECONFIG[bpf-skel] =3D "BUILD_BPF_SKEL=3D1,"

When bpf-skel is not in PACKAGECONFIG (the default), nothing is
passed to make and BUILD_BPF_SKEL remains undefined, which correctly
skips both checks. When enabled, BUILD_BPF_SKEL=3D1 is passed.

Also move the PACKAGECONFIG entry to be grouped with the other
PACKAGECONFIG options for consistency.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-kernel/perf/perf.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index e3e5d55e39..65dc8e7538 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -40,6 +40,12 @@ PACKAGECONFIG[pfm4] =3D ",NO_LIBPFM4=3D1,libpfm4"
 PACKAGECONFIG[babeltrace] =3D ",NO_LIBBABELTRACE=3D1,babeltrace"
 PACKAGECONFIG[zstd] =3D ",NO_LIBZSTD=3D1,zstd"
 PACKAGECONFIG[llvm] =3D ",NO_LIBLLVM=3D1,llvm"
+# Disable BUILD_BPF_SKEL by default. Use "BUILD_BPF_SKEL=3D1," format
+# instead of ",BUILD_BPF_SKEL=3D0" because Make's ifdef triggers on any
+# defined value including 0. Note: Rust-in-kernel support pulls in
+# clang-native, satisfying the dependency checks and causing perf to
+# attempt building bpftool, which fails without an adequate clang.
+PACKAGECONFIG[bpf-skel] =3D "BUILD_BPF_SKEL=3D1,"
=20
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG:remove:arc =3D "libunwind"
@@ -439,8 +445,3 @@ perf_fix_sources () {
 	done
 }
=20
-# Disable BUILD_BPF_SKEL by default.
-# Rust in kernel support pulls in clang-native, which satisfies the
-# BUILD_BPF_SKEL dependency checks and causes perf to attempt
-# building bpftool, resulting in a build failure.
-PACKAGECONFIG[bpf-skel] =3D ",BUILD_BPF_SKEL=3D0"=20
--=20
2.34.1


