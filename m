Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C806C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 22:56:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web10.21662.1744239409473340840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 15:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=YuAGvNCg;
 spf=pass (domain: axis.com, ip: 40.107.22.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GddpONTGVDcFX/YvizUyNWedr8GmZTl5uzCEwKnTiT01VGjtBgqnJFUc6fMd5dhGBdWUCfneJXaWnVapBBVweA19g/E+BsACKwQpH7oxn72kuv+eBM+ezL342CBDF1SrLJ93If0U2/LzjONcN1LP10XrjGpPNNTwKkaE8LHNXnsrd5uOZ7xUYYyfXufszWOFrtEXJym4VCzeDyDhnnE12PW6c9laVVrECfQQ1EtXSRuv5QLxr4eiAUiFFSbL8TRfGUpH6wAAxaOxhRhZqQhZH9YpDMhWNBmDU+k+ltnNWlE9vvFmD3vq9/Hwndy6g1OlcH17nv4e8iCTx1x5KJFl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmgWV/udILuKi2TIpf+eQalRpWitvsCckxgJ5cBWYhU=;
 b=DbOMNmgExWkynm/dJiiqvvwmDbvV0Tqy+3pUc3H557b1i+WVlJAaYXxClHfCb3+MbtlfHU86dAQvQ4OFHTCNm2uYNTO1zWIBFiaDUVhu+KKAKIAjr4p7CTc9Num6XFL6kahb1jiGUu3MG3JVIOwJczom0rKaqNxTwZb3/tImMxB1yRftK8GQgweNiX0cvichyJKEEwcxCOZZOEzXnnB/SiPqHlV3dbJBqIHBknzuzm8JUA1HxCGMd5nexZsdwiZHX7a/FkHSySIyaGe8E8ScmZf5QG+ZJ6biKYWs94xgyFBLMqjo6GZf6d1AKYIh1u3IA9xrNAWnfqx8qh/qTP9FLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmgWV/udILuKi2TIpf+eQalRpWitvsCckxgJ5cBWYhU=;
 b=YuAGvNCgoQFOAxUI51yMq/HCG3MJD4Y1n1Tq9BPeBz8KGg3ZGLfthV2FSPicqtJHAaKPSS2wk8uAlqouRf9iZZgrNX+PU0U4Bi7KAjxmtN5rKXZ0UmoqssqNXEKgCxEpAEj1fTt0JPUvTDtGDK9nP/NAlEm980DdVXV74XBs13w=
Received: from DUZPR01CA0083.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::19) by DU0PR02MB7921.eurprd02.prod.outlook.com
 (2603:10a6:10:349::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Wed, 9 Apr
 2025 22:56:45 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::af) by DUZPR01CA0083.outlook.office365.com
 (2603:10a6:10:46a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.38 via Frontend Transport; Wed,
 9 Apr 2025 22:56:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 22:56:44 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 10 Apr
 2025 00:56:44 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 10 Apr
 2025 00:56:44 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 10 Apr 2025 00:56:44 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 05C48284
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:56:44 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 539MuhfO3968489
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:56:43 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 539Muhdl3968484
	for openembedded-core@lists.openembedded.org; Thu, 10 Apr 2025 00:56:43 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libstd-rs: Correct the license to use Unicode-3.0
Date: Thu, 10 Apr 2025 00:56:39 +0200
Message-ID: <20250409225639.3968447-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039232:EE_|DU0PR02MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ca8df4-ef3d-4408-4366-08dd77b9cce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J863HwXvkpHEjDimgB6/zMW/KPN0WdvxI8qpXGfJQH46ZqKUwrjN9zc+o+fT?=
 =?us-ascii?Q?gWFYzfGkMJguh3eCL9RH3S5SPFUFB5H47Lg8sayrJnxMjAub4i2+jNZtp8wy?=
 =?us-ascii?Q?agi7b4fw2qNxgO6OzIGI8BDM5BYCoqBidN5B/i24+HSgTO9Fov31X31CItif?=
 =?us-ascii?Q?b696iOJPzXk8kHTR3C9r1Lvx5d9o3RIL8z3bOv77tsbppp2xaBHUbfsNxF9h?=
 =?us-ascii?Q?YOc9XO+TWMgWI0LFVPRTWfOmFrnuvDfOYeUKD6LkK4gEOK85rP70YCqQJTUR?=
 =?us-ascii?Q?TKsf722lGZT20AspdW+nnCzY+RLKjROEgF0/aFb9FZi6p9HWTK91HSNLrp0t?=
 =?us-ascii?Q?FLs+gSXa5g/ZxF64BetER1hTsey/Yraw1ELvVYh8OZO5Plvu4e2lkET81WVm?=
 =?us-ascii?Q?kFyTuHR3xWUhPaLADWfNMgtnMoGZ2OXukIwlnZa5rF01oIe6tQR4re5LfijL?=
 =?us-ascii?Q?7c+6gSJ0ct94X48m1P8jBHTULVy3G2Ka6z29Zz6P8S+1AVMs5fKJRFvaGS3d?=
 =?us-ascii?Q?8HmU9OCjTDvCYmEV4E099KxbvWiEzHFTp44A58YC374VOErmxf2xOH1kF7H1?=
 =?us-ascii?Q?Zp1FB2wGZLbF1aQa1YOd18eRS/mFp5Z4PNhH5l+TjxCN7KlidcIm4HwddIEp?=
 =?us-ascii?Q?xTpkudjDdJC4NpEChxFA5oiUFFvOWK1cI3NqOVSGtRDooiPltkibmsT8LJ5f?=
 =?us-ascii?Q?BwzX58OztjyTkC3pQYjljoNQghlNqJBYK3mYr8HvTjfNd9dG4c6iB/sppZWS?=
 =?us-ascii?Q?IBZXW/AY+QPMV1DgwOnmGetJHsuMJBrTbW9wqTXfwRv2jrKHe6r/5V2CFzD8?=
 =?us-ascii?Q?HII8ZZ/W3OwF4s8f6NqQcy9oU14qtTuqBqnrg+X6KRPmfQF9NOSebPxNwS99?=
 =?us-ascii?Q?uAErJD57VpsYYpBTP/kKiBfe9SwtLkJMZ6WgnFjUwTvGoAPu0+Rxz4yTprsF?=
 =?us-ascii?Q?7LmVzFfoC138AGjZeisDZ9OUHP4SGcJHa6VXQ/Cuoy+vWP02CUHybZ/eBnsC?=
 =?us-ascii?Q?rLkBEikSY6Lh0Svq9EtVgUQE7UQv+Jgj41HZMI/yJAsU822+tD0n2RDq2IVK?=
 =?us-ascii?Q?yim9sCvW5y6rBMZOHGdyhl+d/xZasF9P5ipPQHW5wl9/gZZWF+uGvZ3IncSb?=
 =?us-ascii?Q?7oeDEw5IADcaCM9/4Yf5TWfeusa91CwZ36pXf1pGgzlYe6udKkshA9h8KNeX?=
 =?us-ascii?Q?z2K9KT9vikjGrTzBepEw2fqdFpbntw13IMg9qKbpSsrF6s9rXSLrilUTOtYT?=
 =?us-ascii?Q?62UcOv/7H4GYYKe3UtdXMzuFMP1FMBO9cXUIEUBeuXHuaueQmSys7y3kBL2q?=
 =?us-ascii?Q?tXMHDvOa1KRdCqikFYwGmibHMl/wcDVxXrad0QGOsRi1MNrMJ3rlq3sSLedZ?=
 =?us-ascii?Q?cQL4pRmPYDCPFIIEVHDunNEeMUbOC8sJMZzePJN8d9EzD1gdSq4ybXl8Sp/w?=
 =?us-ascii?Q?EYcpyDf3gbg=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 22:56:44.6020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ca8df4-ef3d-4408-4366-08dd77b9cce4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 22:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214599

This was missed in commit 3130069fdebb92f20b962fa8074564a27c3fb6b9.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/rust/libstd-rs_1.85.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.85.1.bb
index 1994368812..00802f0fd9 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Rust standard libaries"
 HOMEPAGE =3D "http://www.rust-lang.org"
 SECTION =3D "devel"
-LICENSE =3D "(MIT | Apache-2.0) & Unicode-TOU"
+LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
 LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D9c0fae516fe8aaea2fb601d=
b4800daf7"
=20
 require rust-source.inc

