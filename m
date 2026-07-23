Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7412CC531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 10:48:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20774.1784803688973272731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 03:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aI1lRMUy;
 spf=pass (domain: est.tech, ip: 52.101.84.27, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6u1KoFMZUt0SKicZ9Kln0MAiDiO3+20An82AFosFefecaffZZduGPJ52LvL7aXG5WbXpTT2hIxcEX+VdfDf/A8Bfpipf/nLvOjO/ZAlwfRUeExCzKn8th1yoHwhRX43LBJJk3xZuzQELbRBKgFTwzqpmujYZkMtqykixplI4lac3tNWOxj0sz55zTETGr61N0OE6iRp5RFMEEYNOYAFnXtONZZMZjDxfxrogFnJk8rbkM5hvkqNb9yQwcXj36B8fJE20oqKlVBfiNkcCR3FIAQlkZz9pBHV5/P9AdJrTpPimVpWKD8f9iP3ZmSLb4xSpfjcebYWOfzRuskcG5NvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFePuurcGBjxlVwS4PG/Fl2LnBN0Nh8bedsOV6ga464=;
 b=r4WCdBx7ddr00ojeivYlxgZpkU5yoAh51gX9XhUAVUxhQEbF1OJB2UR4N6wLFNLRP/XrhPXEtpWOjmQXxXuf4TnW6AOup9Suq5WsYzoaBsn6aD38I+1I5mX2L0b0xR4BMQCIueIqG/1Of9O7ztYbcQE2HoK/y8GTj3o7CgCxQ+qE4feljqHnzRlGzOIoETJjvz+CnRf+GUS88ncenfDA8JqfscHwUbOJ8QhmSL36eTTxP+MdldEuUDAm5psrY3inaHgXIfNF0IDZwiSExZwDPKmLVCE4T9T5JjH6ZXIoOa0fy1tnK7CvXCJLfsDKXSp7EGXrIbyZ2R4JSeoX7N3g+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFePuurcGBjxlVwS4PG/Fl2LnBN0Nh8bedsOV6ga464=;
 b=aI1lRMUyawBBvM1oFjFsgWRk1K4l3EFstJmRpisE5FZ4/PQfIClPafIHKWM8l+O7D43zeTiOHCzEcfqhlL3FjEJwJ59R1jdp8FaAMi2V5kNyDxqc7gBbhg2g3ZoqKpy+WI5D275p65QudUe03wzivTx2T6SzimxPb/DkE07lf1sA+rI2tHEy5IrhEVjRE6Cio0ZCZHf/zlj+BeH4rI7cyqLAQoxc5SkfXHyOKYSDAkW6Yfm0gabIdSsWqGRJsJfoYSFnYogbVMkMftSVlLQaBp+HRCkQw9tJWpd1ePkfHtaLosjIGIshRZEZxHGdZZAJiUmaj4H0e00h6s/+JKcvmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PRAP189MB1898.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:291::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 10:48:05 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 10:48:05 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] bind: upgrade 9.20.23 -> 9.20.26
Date: Thu, 23 Jul 2026 12:47:42 +0200
Message-ID: <20260723104742.2999-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260723104742.2999-1-jaipaul.cheernam@est.tech>
References: <20260723104742.2999-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PRAP189MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: 11753920-e450-4164-aad8-08dee8a7dfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|11063799006|6133799003|56012099006|18002099003|22082099003|25016099003|12006099003|29003799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	6aTHNZ/JtzCd/uJegUQ27kBl854BNrQlxAoij6W4t82xj/daVUuuuGQGSHxuijjAJ6ahDxwiglM8dEwF6wruLFr0cK1RhTbkxGzcj/3XqQH0fLVuveDGmxY5iyLgqPYKR/CVH73XDZNzHKVcXvaCmVmwpJOZPE8tBcxqzKpf1i6MYu1zW1fezXRki4Ec6T/YJzPUAYE82kc13pN9hI6o4W8uET02bdOgk1i5Vylie8Wfq2LGIC6Ypt3AhayOfpllIfQYWWq9IGagS4IHR5ktA5dx1vI+ZYuRSopB/dgyNUCwgfq+1vnjqHR12hVHeOyPhAsKbVaBifPLfMCCLuQp4JxoBXh+DmRjhJ5NMBlMpl/oVwoJIn3hmQoMSX152JgTYXGvxIdDbb86ypjxof6E/Yg6sv0VDFeMmvKZfJsA1NQvAt2Fo4u1XISIvPluFgWNUdn16tLe+s6NVHCkS3YEXQTzBSo0frmaciKrF5dEvhkS6C7eTE+Q5c9FA6dMmA6fCO81Nze6Tf1xj8fRA/SxrGl+AwPM59gDbYhXp02sqTPibZLVFQMR6FtBxzFYciMR6Zft8ESGFf/ipuHK7FKssgwmB6mczpSoayJdpy79aOxFO0BTjrEGUWu6f66hLTC3zfkRL/3tcgX6E4xvrf1414fqQMwkJS3JXq9nbEeb4Xk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(25016099003)(12006099003)(29003799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tC871Af6IdApAM+nSIPjVL7IWsPNn+suMODoxo0VFVR4ckr5q3fYzCEa2v6X?=
 =?us-ascii?Q?b4S41EUbOr1mW/3jrGKYau4BjKgkClOpIM5jOd8POdtQ4GA4Q4vheqI0rb+5?=
 =?us-ascii?Q?n0nM4pRzhVa1ZlfeQ+VEebOPtRxhem36vfAunzezGQSIRMJscFEGVxYyLI7e?=
 =?us-ascii?Q?UIptwMkNH7EtLANrN4STp5Q6Vgkq3Kv4EmpeaIKGQpOAOQ0XcycHpQFq5cc0?=
 =?us-ascii?Q?vfTXZKb7k1mHQvlzlcfoaMyiTS0PZcEAmYBN3s+FXWMX+nklQrMIyqFmdmU1?=
 =?us-ascii?Q?XtGkOCriKwe+cJzHSdJnrdNj6t9/HJX2K9+wQsNzudjuvo/g1lUijTvkpqX2?=
 =?us-ascii?Q?fp5cLxKdv3FtK5PI7x61UHecQjEdawJUTKFnxaKCs8KQaM78YgSTf75yii8+?=
 =?us-ascii?Q?0r/TnyS9Tnm/95+YnZR5+OvYHszUWMKOAmvJw/jvEwC9y1I5I4zhS0+Qw8c3?=
 =?us-ascii?Q?TOotZ4fjf+qW8XKKQCsskhdIv0lC1Z6e6Qei3GMs6kYKpRCSQyUlbrZ5XytP?=
 =?us-ascii?Q?wlz9XktaE1vZf6VM2zSbajlCnfd3A9jwAumaTg7pxdI96KA0NUf1Fi+xIcvd?=
 =?us-ascii?Q?XW6Cfuwhp5+Svnu0Av3d3YSZEicxAreDSkG4tjCU9I3jmGYHJVJwhCc+h/DY?=
 =?us-ascii?Q?HqmBDtVfwhj+6WH9/DeApyX/aywWUmKKjgJrzbar0wY9rowmuPMD/r6jFjmZ?=
 =?us-ascii?Q?L/OMc2DkJHD2j82wMxs4M+BcPI12bUH1Dje7WyimgNkEWGwKn1C5zQwVMgpA?=
 =?us-ascii?Q?XVHs7oHG45GpoSdcf1Cuj6RDFZY8mYUVn1QfQJKqQN2vUtvsoiYk5tYTW0eB?=
 =?us-ascii?Q?69MLTOSIBUnDrNGzx/XTASy0ZyRG9A6MRFYSnK6PF0fRTVpdw/Ru4fNeY9+m?=
 =?us-ascii?Q?Wgclt+UEZEG4nkHB2s7Qv6IXTleIdlCGDyOjOPJ7rPUQQ1v3z2f/4qRLTaVM?=
 =?us-ascii?Q?23CcY6jMCip/3++3icahdfB2KCAxjTBExZKNZYxUhLCsjOpwnI8bAugIs6L5?=
 =?us-ascii?Q?kLM17RNaci1QZE45AdPonvjf8pQ8C81pNBnqKUgkmJ8ta1+Exi3XRYGbCyFL?=
 =?us-ascii?Q?+4tngDihLsYPAdtPQs6M1p3rF3ohHMT7N/WIUAmGQ6dcAAJ7BkioO+5yJ2JC?=
 =?us-ascii?Q?hnh2gwD2nVfHYaPu3Hy0wfxPw2pHT31aUtTAl76PxQ9+rWQHInPXeAmkvdu+?=
 =?us-ascii?Q?5kXeUdC/Oo2gMBIQ1OV5pSrC25FyGNJPR8TFGA/Enm2p2AHU6hFVDhkK6O1M?=
 =?us-ascii?Q?2CSS51C3DeVzImSmmRUZx6oI2720/ozQlZMjz4/DdPUdsP2VzoL/+3mNFBem?=
 =?us-ascii?Q?8kxrQAHBblRsXHsy4a0WGLs/o/UKh9d8h93u7NpoHXtJKqQDDNH7GW94icQJ?=
 =?us-ascii?Q?R/Z2DCBQ+KJWL6xckgBrri0rQymu7K7cmZkpL2NTrvq0ch2RttydDWQ5V+rM?=
 =?us-ascii?Q?1SERZZhD5BIdS6NtIxxM+hDfeMl/5CM69uV/FvgP9pE6R9oMUW99TfWonroh?=
 =?us-ascii?Q?Rwi05Dsz1rljVeoQmsadvM78eSJe8qqyE4DOPHt7/pVYHh7Rt5vBQchbayE6?=
 =?us-ascii?Q?eAJ77nbpkGViU+ZR9BShhy6tmhLjLQo+rH1e34ydPfgKUaAiyWGDP2jPY4m0?=
 =?us-ascii?Q?Lt/lLrL391go1VCHzBcjAIvcELiG0CJ5WxIR7eBy8zWT8GFqDCcrPlEnNP8R?=
 =?us-ascii?Q?gPriYgWQkE3bxMI+/Dd9EQ0tkwIiB4MI90S1YUNcEmdtEfgMYdiTpev7zvjK?=
 =?us-ascii?Q?vjSN9/y19OjKbTZecJyG7TbxcD99fsQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 11753920-e450-4164-aad8-08dee8a7dfe7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:48:04.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AM1V24gulYcum3eF9oaa5l1/iEpgUMXa7dOqKCDoc4kk6AwLRl4FW0MV87x3vCeZFlz8ivQYhY4/iMARicZPme4esJU4v7N+y2Fu/KbpNz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 10:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241821

Changelog: https://ftp.isc.org/isc/bind9/9.20.26/doc/arm/html/notes.html

This upgrade fixes the following CVEs:

- [CVE-2026-11331] Fix handling of rpz CNAME expansion that returns name
  too long.

  Previously, if the expansion of a wildcard CNAME RPZ policy resulted
  in a name that exceeded the length limit, a self referential CNAME and
  the original address record were returned, allowing the policy to be
  bypassed.

- [CVE-2026-11721] Invalid signed wildcard records were being accepted.

  Signed wildcard responses in which the Labels field in the RRSIG
  record was less than the number of labels in the Signer Name field
  were being incorrectly accepted.

- [CVE-2026-13321] Fix DNSSEC validation bypass via out-of-zone NSEC
  Next Field.

  A malicious zone with out-of-zone NSEC next owner names can cause a
  DNSSEC validating resolver to cache such record and generate negative
  answers for any zone that is covered by the range.

- [CVE-2026-10723] Correct verification of NSEC3 signer name.

  BIND 9 accepted child-zone NSEC3 records where the first label equals
  the hash of the parent zone as valid parent-zone closest encloser
  proofs.

- [CVE-2026-12617] Do not assert for some specific CNAME and DNAME
  queries.

  A bug in the resolver's handling of certain cached DNAME and CNAME
  responses could cause named to trigger an assertion failure and exit.

- [CVE-2026-10822] Malformed DNSKEY records could trigger an assertion.

  Previously, dns_name_fromwire() did not honor the record boundary
  when reading names from the wire, allowing malformed records to be
  accepted when they should not have been.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch   | 2 +-
 ...01-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 meta/recipes-connectivity/bind/bind/conf.patch              | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch           | 2 +-
 .../bind/{bind_9.20.23.bb =3D> bind_9.20.26.bb}               | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.23.bb =3D> bind_9.20.26.b=
b} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-w=
ith-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-=
failure-with-bind-user.patch
index 4fa377a594..7ed4c5fd2f 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
@@ -1,4 +1,4 @@
-From 2a3ff2a026c55dc67655baf28e0f4175232ee0ff Mon Sep 17 00:00:00 2001
+From a67ac281cd86d8d9ca27e64a5944deb5578e5087 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index 7279a73e87..da4cdef696 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77f8fafab0cc91c3ad8fbf1382b1d0f2d2cd99a6 Mon Sep 17 00:00:00 2001
+From 16608520c9d946223404165732eacd79b59de471 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001=
-named-lwresd-V-and-start-log-hide-build-options.patch
index 369185ad86..07acce9cba 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 49ca7b5432dd6c24541bbde21bca5043cd0c000b Mon Sep 17 00:00:00 2001
+From d925183807ae182cf332124ff5a617d257e184f9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index c3852ec..3b7a446 100644
+index af020f0..f461229 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTR=
A]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-=
json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind=
-ensure-searching-for-json-headers-searches-sysr.patch
index 4a066294f0..4e90e97271 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
@@ -1,4 +1,4 @@
-From fa165cb4a9dfeb72f0db787decd527e3d587cd4e Mon Sep 17 00:00:00 2001
+From af229781e60d6779c76d5a61d26a4597b2a42f6c Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,10 +32,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver=
.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index c6a10f6..c3852ec 100644
+index f47ce7b..af020f0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
+@@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=3Dyes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-=
connectivity/bind/bind/conf.patch
index ec22fe84c4..3425742d1b 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 4b9f6f6735340d558d9c9fba9c84d7f99d3cbde2 Mon Sep 17 00:00:00 2001
+From bde3a4cb010f459a9ef92817c7e6e6e2d871794a Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-rea=
d-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-suppor=
t-for-read-only-rootfs.patch
index fd96d46448..9b55afb5d3 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
@@ -1,4 +1,4 @@
-From 19933be78902d90014f177b5633dd15984bc1bc9 Mon Sep 17 00:00:00 2001
+From 8876e722beda701a0de021360ff381347120c6ff Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-w=
ork.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-wo=
rk.patch
index 155cc5a110..33d5d34f15 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
@@ -1,4 +1,4 @@
-From e429899c34ea8a4f85de428e22ee49c453281e82 Mon Sep 17 00:00:00 2001
+From 26c988eee9d2eae7c7dec8c529176352017b2ce1 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.23.bb b/meta/recipes-=
connectivity/bind/bind_9.20.26.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.23.bb
rename to meta/recipes-connectivity/bind/bind_9.20.26.bb
index ebc4422b67..fe2ae3f002 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.23.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.26.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-$=
{PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
=20
-SRC_URI[sha256sum] =3D "5d4475aed3f9e500ef554b2b14d972bdb83d33de214a9b3be9=
2918ea46908371"
+SRC_URI[sha256sum] =3D "55248def0f870c4c46b3de72978ea972615131516663188a45=
64dca1d20bf350"
=20
 UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

