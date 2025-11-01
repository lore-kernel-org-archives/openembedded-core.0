Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18021CCF9F8
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 02:27:36 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2190.1761964051936600376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 19:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=XYYAPRSO;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.72.14, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL3zoDzcaULSbLNIL05Yz/YlJUDwuL5YyYdgG4F12K14vPbAOnRTV6Ab5XC4EEWOiQ+soauHs8STp+FKo9TZe9NDFLjVzQQbYmDmlddV4hM2zDizIbS9Mduc0qYGcV0dYP1BOh2gR9WtgNYnAmMw3hx3j8f2/9aBgtxcsI6QtUa9wP6/klBwZ38BYjlLIaA4KqceFBJJ15Ox7IMNKcusE4FfrqU2qzWz7lk8j6yRLOqtUXLG0T3As7GApAoH2B4Uk0BbFVIJ/bXIZ1OmFkxKm+dNPzABuK9xgQiyrnKl30UJFeaxa4prc8Ys0jp9ag1Z2C4sTZ0pFhvHbgmWYmn2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7s7IGg5nHQpEiRpuZrCb2+0MlFXCHSthnv29zv4LbI=;
 b=T88ADxawbU5pHASZD0sqCUNeAr67xPeppSBQwP6aPaB24hc8x7slcibob412uK2gwe/NIXU0C8EzrbsBD+tRCm7zM3LrBrMdUGv9pojnQxt4sRPa5oPTOaYhvmo/LvCIbz977mnxHlrwzwIIYuqhjO3QTWAuWFVOTHYlheXRBvDgBLZU7myNd/RWlc4hRixfaDOMS0c+snzzkwY3WhwwcBpxppH6P244T9fMQisTjbjKtTHLpwhwV9OoOVmYuz9UhsmpbAVAsApuTOHb+pPzE41Q12t5b/N+6XA3plIwqhFgKznwN1W6+6gRB00UxGvZdOCT7dkGFrXWrXb38Mpelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7s7IGg5nHQpEiRpuZrCb2+0MlFXCHSthnv29zv4LbI=;
 b=XYYAPRSOWJ8ept/xzmogVSQFfLKWUhRmYg2OFjIT4JUDc5snyuDeaFhVx7iBJUJTKFYyixGD5CjiV9ACj8DY6cKh8d02GbW2xHRY1bpQVNa2RRoiOsZMqWD5pOMuthTGXDhDidvAiIRaH6WJjqQkrWOE8dVJ0g3ybCI3zov1jcU=
Received: from DB7PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:36::15)
 by VE1PR06MB7166.eurprd06.prod.outlook.com (2603:10a6:800:1ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 02:27:27 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::41) by DB7PR05CA0002.outlook.office365.com
 (2603:10a6:10:36::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Sat,
 1 Nov 2025 02:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Sat, 1 Nov 2025 02:27:25 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 1 Nov 2025 03:27:25 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@gmail.com
CC: Yannic Moog <y.moog@phytec.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] perf: add arm64 source files for unistd_64.h
Date: Sat,  1 Nov 2025 02:27:24 +0000
Message-ID: <20251101022724.598115-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 01 Nov 2025 02:27:25.0602 (UTC) FILETIME=[0FB20020:01DC4AD7]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|VE1PR06MB7166:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed5e2540-988e-4a5b-1519-08de18ee325f
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34070700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xX6pi40ufE9XOY/ZG/aMLNQK1VMSFMtPjnLRX6dXAm93AVaqaZka/x246BcZ?=
 =?us-ascii?Q?ztGT+63o7MDRFSpTIuxBGLHb/VANxnTSFTwjNqZZ/uF7+dsmbg7C2Uy7CsA+?=
 =?us-ascii?Q?eeB4NO+ytwi5wlq0Y9Gvcr0yBLwSlgnJPuehTW9AHsKNHaaKaq0s7rkJx6IB?=
 =?us-ascii?Q?abeef9wPDR8mDE7sxitLVvjG7zdEQOdGF3LcAC5CWwkZms0nHThzTNmWanuK?=
 =?us-ascii?Q?MjHiWF0ic74lX+nvdUiEvx5qoGJDAiu1uOPG3bmAK9Lqk2uKS+oNjG9wKl81?=
 =?us-ascii?Q?LMwusOt5PpXuAukHk7VcApCusSh1M3E2V5H8HOeut6vMHX+uSV3E9dulK1yt?=
 =?us-ascii?Q?UMz/404WtmB/lCt9KfWXfwSjc7u+mfEND7PRTQn6vuCRGOpwUrOBU+f9XMs6?=
 =?us-ascii?Q?v+KmwKX1BFucGb+N0mUt10Y27HAa+RDSkOJR68mBo1eG7heMhML1OdbO+c+N?=
 =?us-ascii?Q?MegGTlIg7Ca+BGZ4nDpkFZPMqsoIAxhvjUT2J7Q0doLU17cYD3G5b9TMG71L?=
 =?us-ascii?Q?B2eXaJef8XsLLy0Jl59LzEVtP1BxHKuRUdYZ6iShFPXXhVQuzQNuArv2KZo4?=
 =?us-ascii?Q?krgp3JUTOAeRWPXwx30yRFvWvJJk/EU4+LxTlpNx3JkGNxqKX8B6gcJUFoVh?=
 =?us-ascii?Q?PZZbPVYbXJaqmL9qR30pw9Fsx1DBpfpfpYkERUhZSUlPF1QgkNhJoGQyDAhZ?=
 =?us-ascii?Q?OCUTUnUq0JVeds+INLaiNyCP9lrg8mk+9ezPn0Kow7MKyr+K0AD7QJFFjM5L?=
 =?us-ascii?Q?Eb67jjyKBqSWlk2ZYQOH4GwetqWoVDup3Ew5QvJ1uYnMT8dj/Ckbjmr1qMQ2?=
 =?us-ascii?Q?pj9DmB9R1PDn5GY5FJ+jKwLBRNCflXv6oqW7IaJOepNj3VAlVw5hy+8Cf1lU?=
 =?us-ascii?Q?qPikFa1xHEjBSJUmYjv9pV4ctY32oWl1I6z8FmLsSqpk9FzOuqlof692yyFP?=
 =?us-ascii?Q?L5f0B9/OomwTv/QiK0xTUv+SmTqJnNYE5Zh9G3hgV6GQK5kQ38NSJec1OnKf?=
 =?us-ascii?Q?v88QvzMnOyav6GHWrcqPEOP4MqofUR4oFKLqjB3oGghtQ4iSwGLm7wjWBIsr?=
 =?us-ascii?Q?FGH4kOUmqyWNZVtCEMNKXqGjtEhmbnvBQbStw0axThRSjWorpWWD8n1XELQ6?=
 =?us-ascii?Q?3KNwYxvyXqx64FqInU0Onfn9c2sQQ92LnFZ84lHGLQ1cndZEpXedcGVLNl7Z?=
 =?us-ascii?Q?Uhb5Wdm8IPpLO/lDl1KggIg+ElZW+7PppTywSLY/8bQxjJhSzqVRIC0W9qHH?=
 =?us-ascii?Q?7WVH3Ec68dDXaVuGQvkroDZkkFh1pvgOaHgqDaXeogSptMlOTl03ITV2qq2s?=
 =?us-ascii?Q?30d490k1YfXYOwQ6LZczzF1VUA9D87p1AWbAAtPmHurog5zuhvpPXAi32iFf?=
 =?us-ascii?Q?A0ENh4yHUk1TKnMDc+eqsvXpbbWerYFQi1+JUajZqJwHnU2LdoXzwo6Wk6qH?=
 =?us-ascii?Q?30VkPtGlczXKvoCu68KytL09KEyM0DMX5vkkWDZVKb829d7ZfNJvnMJvekDM?=
 =?us-ascii?Q?Cks9Z7m5SMlTyupY8FBK5WEIoCl+nhmBrLiD?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34070700014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 02:27:25.8926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5e2540-988e-4a5b-1519-08de18ee325f
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Nov 2025 02:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225562

From: Yannic Moog <y.moog@phytec.de>

kernel commit bfb713ea53c7 ("perf tools: Fix arm64 build by generating unis=
td_64.h")
introduces a new dependency on source files for arm64, specifically
include/uapi/asm-generic.

Build fails with:
[..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33: [...]/perf/1.0/perf=
-1.0/include/uapi/asm-generic/Kbuild: No such file or directory
make[4]: *** No rule to make target '[...]/perf/1.0/perf-1.0/include/uapi/a=
sm-generic/Kbuild'.  Stop.

Add the directory to PERF_SRC.
Fix whitespace error while at it.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

This patch is a backported from 'master'

The original submission can be found here:
https://lists.openembedded.org/g/openembedded-core/message/217991


 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 11fa917649..2d432f3f40 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -145,6 +145,7 @@ PERF_SRC ?=3D "Makefile \
              arch/arm64/tools \
              ${PERF_BPF_EVENT_SRC} \
              arch/${ARCH}/Makefile \
+             include/uapi/asm-generic/Kbuild \
 "
=20
 PERF_EXTRA_LDFLAGS =3D ""
@@ -202,7 +203,7 @@ python copy_perf_source_from_kernel() {
 do_configure:prepend () {
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a=
 32 bit
-    # build, with a 64 bit multilib, the arch won't match and the detectio=
n of a=20
+    # build, with a 64 bit multilib, the arch won't match and the detectio=
n of a
     # 64 bit build (and library) are not exected. To ensure that libraries=
 are
     # installed to the correct location, we can use the weak assignment in=
 the
     # config/Makefile.

base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6
--=20
2.43.0


