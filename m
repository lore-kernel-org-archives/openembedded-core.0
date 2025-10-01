Return-Path: <Adam.X.Nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB86CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 16:06:26 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.5])
 by mx.groups.io with SMTP id smtpd.web10.1032.1759334779011872471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 09:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=q0KQy3ar;
 spf=pass (domain: axis.com, ip: 40.107.130.5, mailfrom: adam.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvknDr8e6Jy8cqMEFeWav9yyF+scqK+YGxqJdCUXcRt769KtCODqgNGNzwpsiLWXJ0NTfjtt39rkocLM4xP/Zztz+fnUKgAalxe5iO+vGN+HPxt6+Yl77EJYKRXOpWe7kEyjLS+p4nE4tKBfxrHrTM/VOL1vi4jFT3Rra/2rBFJaT+IuykEGROfsFDVX8SUU7+pRDFO7nXvwL8+cDF2hV8rFin2cJPkGDkroIgt7cjB2ofClw1LK3CP+SXAuE60uV+iSpJ1wBuvAahSSsBJytM4/ndk/+o3E7db1T+dgrk0De/PQqBMFPvzOJXrAJmpPiWM2dB/KvrqUWhsHgqe7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r1gKQcfk15S67h+8Mshkps7CUBxl5C0gjrnUEtJG8E=;
 b=ghtb90cNfOuzCNWoSa0dk+8FMXNKfBH5nKPkLV/sIKYUxkOrBTBg8Sr3Jw9JB03J/bpspm0Wl52KQAQ0oHur+wOPKba/L8ohtyFoARYHsdxJTYNi4FDd1msO+2CysAuYKVjyndJq2IBORz/3xycnlXRoZ1l7/7vSCVWWBY/UUNWFmh+1PupP8oWR3uhPmNOsXkkvSOIxR1sx6MSIfLMVrX6q8h9HDhc9ROZzYNbXkb279iTlUkoebgiqs1AgMO2K61zHWSJw6BsItuSonPm96h0/kEI4oCLnnGO7zdap4hj9CPUYRmwwCDivhHQenkVxcYh3eoeeac9oUg6747WVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r1gKQcfk15S67h+8Mshkps7CUBxl5C0gjrnUEtJG8E=;
 b=q0KQy3arWy+Cs8dG1xTtHmtX0HN2mcDr1ynQ+WQ/nmio90nuxbsClq23rdWExE29LIoMxVWQqfndhzDsyjBNMWwYfvXVnWENqCz7FXmm2yebb1S0DiAicQ5v1jLn5PvMxlsmeX3f205N1+QTtEeY0zQ+roE6gnaFfdgrqWe004c=
Received: from AS4P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::13)
 by DB9PR02MB7370.eurprd02.prod.outlook.com (2603:10a6:10:244::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 16:06:15 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::7f) by AS4P189CA0026.outlook.office365.com
 (2603:10a6:20b:5db::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 16:06:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 16:06:14 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 1 Oct
 2025 18:06:14 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 1 Oct 2025 18:06:14 +0200
Received: from pc51388-2240.se.axis.com (pc51388-2240.se.axis.com [10.86.130.217])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8BE4FB43;
	Wed,  1 Oct 2025 18:06:14 +0200 (CEST)
Received: by pc51388-2240.se.axis.com (Postfix, from userid 11596)
	id 7351242303CB; Wed,  1 Oct 2025 18:06:14 +0200 (CEST)
From: Adam Nilsson <Adam.X.Nilsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Adam Nilsson <adamni@axis.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, Adam Nilsson <Adam.X.Nilsson@axis.com>
Subject: [PATCH v1]  core-image, populate_sdk_base: Add zsh-completion-pkgs image feature
Date: Wed, 1 Oct 2025 18:02:13 +0200
Message-ID: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|DB9PR02MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b356ca-81b0-4572-70e2-08de010472bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KSqwkjhbpQTgrBjMvUiWo1WsKiihodcLDzOvFXxGcvVTdWoIR1/R9CI7UbvM?=
 =?us-ascii?Q?o0569cQDbvI0Zr91Qg6RSgYGscEzs8nwMBkP9UQQ3L3xA338VEDclO3FkjGH?=
 =?us-ascii?Q?cGx2wjlCJ9VYxhJuxjirDrdxde0/AWVpOCl6UEJFwGH9DxchMd8RmmqgXMOZ?=
 =?us-ascii?Q?WBY2mkI9XuNCJerrt755PVl07HwzK0izgT76a6gpaeExNEAEP6zzeXNkLnGv?=
 =?us-ascii?Q?NUmlF5WyHuDtytF4rmG1EbI66NtA1rcs0r+f99i3T+rusSFBBxGzLLvduxyF?=
 =?us-ascii?Q?f8TnmuGEZAtHAgtyJI8jj04upc3EyCSLGkp9LbV1y5Lb7mhVbpHCSuR3TyHd?=
 =?us-ascii?Q?sZs0CnwhnOheRD0T/lWvE7j24ZiMgABYQXJyNed1vwQSK8bcS+sfNHw18xTx?=
 =?us-ascii?Q?ulBnFcsPYAnEPb8/WqEQ4KbwDFj6VXl2kwdpb5jt7QIonNPNJ01YJN1jTQ+3?=
 =?us-ascii?Q?iMi9M+90Y7lbtZWVQ0sd2U/uHsPRoS6TpDHjva9MXSgn6iEIoVNSUTqtSKkT?=
 =?us-ascii?Q?YLJl2u3qrZhFoufpxETDayQt7JkfjtIug0WH0jTt3Px86kYFEcPcZtW39529?=
 =?us-ascii?Q?YB/5npfDsv01TcC1pYk31nGT28DPXC2J32YPJqrBJcoE7E9OodSOwAWfIfyu?=
 =?us-ascii?Q?vLUIeD0ucWc6G+Bu+2YdXrT2aQsQveDh5pj+V35HoHr6QR2wM8zmmDBSWWiR?=
 =?us-ascii?Q?IUT5NhH85L6WZhBYA9hmEGiefJ+NVulDUKSJxxRc+jsxhH64A4KIcyPEsNvZ?=
 =?us-ascii?Q?FBoHA908H3mTUwCwfvbVFL2hKwE/QakPfnfJTIigomq0wNFEAJXHQyrs2bW1?=
 =?us-ascii?Q?qZA6DfmQTgVX25YECgDANezNXbvlheCJghMR/QD9+xzOVk27g1RkrGB6s1pq?=
 =?us-ascii?Q?xEaUhrUB0kiDvs7wYiJBsycLIqOtXK/PtMkCu86T3up5QBiAZ4TwkngqtGNT?=
 =?us-ascii?Q?5tPve+dy5YMEPrIH6gL524Nlt2vYwsgZ9q2rAWsMi8XmFrqH8IvNbayqzgAU?=
 =?us-ascii?Q?PY7x8vNaMwssqbsCeASutZ8RofMDmgVzl5r/pu3Dk+FeWrAzQYFyEpfJnymo?=
 =?us-ascii?Q?tY8P3rvf5lgL/a94uvzKuvFjLrpAiA2xLKsp7Wr1m6PY9zHlTNVHqmO+bMFB?=
 =?us-ascii?Q?wAMIbfK7RpCiZ355CZiFVV+vS2lR+DrBRmFKhjhnqtrCdmdHvBpZe/oo739/?=
 =?us-ascii?Q?X29id97UQ5ISIe1ZNwPsOQC1FvMIVanA/F03q9If5tRP13fRfA1xVUKMNI4i?=
 =?us-ascii?Q?M7ek4EahBjvu9ut07kglEqqgYGDKWBZeTA8FBxynwkTZ0w3oFi+tIlZxjPDo?=
 =?us-ascii?Q?KI7p3TtSjh5QPow9FfVMAn74iUtiyxCV2OzgE7JAI8t8t3VsHJw/JK92ibdz?=
 =?us-ascii?Q?aDHLk6pr0TOLdzOKzjy0ILwCUQs1qCdakk8WiemP2J2xCx8tnP/xX1nVYEo3?=
 =?us-ascii?Q?Ml2/IhdQI9SSOL//nCeoQJm1YaQij73S8MvQKHi+89UKeIR/m1kB74GgJlrz?=
 =?us-ascii?Q?gazdbQPzs4RRUZ4H0YfvXU4Jq4NaZ8gmwgNn3MzOE8htf068HcwvP2jNIdXg?=
 =?us-ascii?Q?jrJIR8x5Ya94s5noPTY=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 16:06:14.9120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b356ca-81b0-4572-70e2-08de010472bc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7370
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 16:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224311

From: Adam Nilsson <adamni@axis.com>

Add a zsh-completion-pkgs image feature to install *-zsh-completion
packages into an image. This is similar to the existing
bash-completion-pkgs feature.

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Adam Nilsson <Adam.X.Nilsson@axis.com>
---
 meta/classes-recipe/core-image.bbclass        | 1 +
 meta/classes-recipe/populate_sdk_base.bbclass | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/c=
ore-image.bbclass
index 4072e420c5..309a7c577b 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -33,6 +33,7 @@
 #                         LICENSE_CREATE_PACKAGE=3D"1" to be set when buil=
ding packages too
 # - doc-pkgs            - documentation packages for all installed package=
s in the rootfs
 # - bash-completion-pkgs - bash-completion packages for recipes using bash=
-completion bbclass
+# - zsh-completion-pkgs - zsh-completion packages
 # - ptest-pkgs          - ptest packages for all ptest-enabled recipes
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
 # - stateless-rootfs    - systemctl-native not run, image populated by sys=
temd at runtime
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-r=
ecipe/populate_sdk_base.bbclass
index 0c2fd26e6f..8e671cf28f 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -24,6 +24,7 @@ COMPLEMENTARY_GLOB[dbg-pkgs] =3D '*-dbg'
 COMPLEMENTARY_GLOB[src-pkgs] =3D '*-src'
 COMPLEMENTARY_GLOB[ptest-pkgs] =3D '*-ptest ${MLPREFIX}ptest-runner'
 COMPLEMENTARY_GLOB[bash-completion-pkgs] =3D '*-bash-completion'
+COMPLEMENTARY_GLOB[zsh-completion-pkgs] =3D '*-zsh-completion'

 def complementary_globs(featurevar, d):
     all_globs =3D d.getVarFlags('COMPLEMENTARY_GLOB')

