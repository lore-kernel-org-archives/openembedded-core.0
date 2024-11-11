Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E41E6781F
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:35:58 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.54932.1731314150668240385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=IFxZ85FI;
 spf=pass (domain: axis.com, ip: 40.107.20.59, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGf4sT2ZvaQReafG35M1aLmAcqcFU+mBQUOlzdq4mH4XBT1ulswkZkXpAj+a683OCvWqTrDgPKTpc1piWgO4Pir/OTRlwPXgJn4MebVE258lSlh0+gDfb9QQBP8N6GHqFHjACwJv1Mz589cUUrGiCZHtbPmL/HJGO8IymEleBSNUoDEE/R1mrTLoOA7BA/FHjpX/tRLW6kGFgBDgiXnOBn0A1Tr7w9kjLW4scchpaDaybMJpn9a2xW4t3GuSs6AoyyrVK3a8UnE39L/1wSje7zVxKC1zy/8mYSZH7BJuA/7taHzvLtXQ9JYlelD0AOjmJX3kI5ntYih39NbIe01ZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdtNAUXhfaDkc5qyTbOsBcun/J/usugryZ7zskOqt7E=;
 b=UYCdGK/o3A/FhRx4hAQg4Uh01Vqjm/5hA5oJ+6WfCI0plEUrGGUTdVGqSuST7lDz5Sju348vorbe9w66WN/tc1edDI1S5AXI2Fx5C9USaNbHIfhKI6mgwe+j48gxxA5npEk3XNVpDB21/YH2oFeAUL446ZAa26K337JyDb0luF9ymA9rVzYtDhKqFTC+nMV6ABfn5mI+WuUQuYh4Ag5dHEvXSweELgTFsQ8gZ/5gCzABYsoiTIAVgRmSu/P9TzSuQAmh1z5wL3mv0l3rt7j0sxWQsyo2KcPcSpT7w+PCm6PKDEupFA9x/K3JsvOBsiy4wn4P6pRA8T2J/CVMb7AqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdtNAUXhfaDkc5qyTbOsBcun/J/usugryZ7zskOqt7E=;
 b=IFxZ85FIWifsgAArYy48kQm7ImgEWe0EKQN9ytKay3J1dxQP+8hT9HQNMYbsfG9necJkg80m96Q6gj60IrkLIFmPjYKc8GU04WXO6Jh9KUYG1z7dMQKmTa5e/+B2UrAZISKvpejyGjdoGy8PItO828wZF6BUeFnz8Bwm4SfYtMY=
Received: from DUZPR01CA0128.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::21) by GV1PR02MB8305.eurprd02.prod.outlook.com
 (2603:10a6:150:50::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 08:35:43 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::9c) by DUZPR01CA0128.outlook.office365.com
 (2603:10a6:10:4bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 08:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 08:35:41 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 09:35:41 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6515E50B
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:35:41 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH 0/5] Remove automake patch that changes path to test-driver
Date: Mon, 11 Nov 2024 09:35:36 +0100
Message-ID: <20241111083541.291594-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|GV1PR02MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: f43e62d5-4d32-4bf6-be74-08dd022bd406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fsTM/63BL+Km2kWyali9vjyCgmGIWwWY3W3n0Us3Va5GNSktNYUXPr/dJgFb?=
 =?us-ascii?Q?/iUyvr8Ye/6slSYP/kDRT5dhK7evp3PFOBbPlj+YhVwlmLggZ7LyWvN6UbAX?=
 =?us-ascii?Q?cC2rjld4kBO4TfX+RYAI+VgV0V+u/vMXnrRDnXcivZglV13CVHBd3WLfhV8k?=
 =?us-ascii?Q?QHvDP1frOIRcSLPKUiyvbyoC376BZspKOedfbyyoZMBhP4SBqZyLIWEFGtSh?=
 =?us-ascii?Q?LK00d9xu1X4SP+t+xl6YhjORCJh78rQI1CsQNm42fLZsM9tm9/L+YtOlIpSa?=
 =?us-ascii?Q?rfL2G6f3C+rAw8BXmCSMAMkI8GzgscFLrGMy66091uotjXnX3y1DAu4boBxt?=
 =?us-ascii?Q?CKQ3CdzxdcUHRaLzGJ39ex7361cDVbi15eYk16pO5pEZHJyJxtpmC4utYDk0?=
 =?us-ascii?Q?68bm0b2jAvJAUTWnxCd3IfVvAW7E1l+U0dC7B7iDjtxEhvbi6Q1WjXZIhBkT?=
 =?us-ascii?Q?p1pEf4nbGH/RWU2/lVfVNuGN8AJZO0Mr1GhfF612LT+XNBZjhKowqx+6wW7z?=
 =?us-ascii?Q?pwLLKCXCuOOrRjm4NwkZgjgL2j7uRlNvzTCBQutZh43TIxtfRBSwmoaj4jcl?=
 =?us-ascii?Q?Rx6cLUT9brqGzMv5duR3NrPnrmzBbZdyPDRHnzbjXZXaiA8Ec2Z1qDq+vms1?=
 =?us-ascii?Q?yE81j6lene7jJVa9vkYMn80fgjcmGd+xPS1a/B5lFLAX1q6PJKCGTNVz5UaY?=
 =?us-ascii?Q?UQUO3oFvJb0brUn67vCgxlBkJC89aVg5aD/GtoKm798hNIAzx5cID1byHTJf?=
 =?us-ascii?Q?N4Tufs7QZJgIxmBMBWwZFzba8n7VWOsDrQ8hBeNsHrQg72fulw8WrSOTDQj7?=
 =?us-ascii?Q?SlwsjZCuCtYvhYcDz3S3Fy46Q9BPSLYLq0uU7snx5R4DDvY5NuvdAEvLN9+v?=
 =?us-ascii?Q?IQYiRdaC35oLaruStWYJYndrjgTOIfOwjnfT32UYZEuggUZTSnYceW74Si59?=
 =?us-ascii?Q?i+P4AMsSWOPBBNBRiRT6i23h0IeculvC1kajirQrnYAJ9oJ20HhgK2h+y2eg?=
 =?us-ascii?Q?+6d+yyeotSyX3dRzImAS+1d/Wwq9Y39Zfi0FQjldXwLRvzt+DUwaorayuO/h?=
 =?us-ascii?Q?uO+Vx9Pu+/i/7Xk/j4V8e6WWtsTGb7FTUiOe7Qpha4hTvB7+hTSVHHhQfayd?=
 =?us-ascii?Q?4VM2rFdve4jKCfUyTBMRSkoohxnwDAT7849CvgMHEOhukImxhDMN7Rp73q5R?=
 =?us-ascii?Q?SZDw425Ll8GLQm2/fBf5Uyjxy7uGkWoe4rcT582yVsKLvUtZykIYZeq/wPTg?=
 =?us-ascii?Q?9rkXGp+4Kh6tBKxfETq3UblpHgMOxN9+B8hyNR/Gbcwq9FgjldKYtoVOMve9?=
 =?us-ascii?Q?hCAil+4KZy+PomZibKp8sJtlkWRRDrBCShHM+WhavMkMLqU+kcvdk6MBQIbt?=
 =?us-ascii?Q?tte0X6K1GamCyu91enH3CTE4ByC1Fy5F6EXXxLo+nNatzc1VLA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:35:41.9914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f43e62d5-4d32-4bf6-be74-08dd022bd406
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206937

From: Ola x Nilsson <olani@axis.com>

Fixes [YOCTO #15635]

The automake patch
"Set relative to top_builddir path in Makefile to access"
sets the default path of `test-driver` to
`$(top_builddir)/$(config_aux_dir)` instead of the normal
`$(top_srcdir)/$(config_aux_dir)`.

This breaks `check test` for Automake projects in generated images.

To reproduce, use core-image-kernel-dev with git added.

git clone https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git
(cd libabc && ./autogen.sh)
mkdir build
cd build
../libabc/configure CFLAGS=3D'-g -O0' --prefix=3D/usr --sysconfdir=3D/etc -=
-libdir=3D/usr/lib
make check

/bin/sh: ./build-aux/test-driver: No such file or directory

Removing the patch makes the checks complete successfully.

Some ptests depend on this patch to find test-driver.  They need to be
addressed individually.  In all cases I've found so far this is just
another sed substitution and should work even before removing the
patch.

I have not verified the ptests in meta-openembedded yet, but I'm
working on it.

Ola x Nilsson (5):
  attr: Fix the ptest path to test-driver
  sed: Fix the ptest path to test-driver
  parted: Fix the ptest path to test-driver
  strace: Fix the ptest path to test-driver
  automake: Remove patch that changes path to test-driver

 ...top_builddir-path-in-Makefile-to-acc.patch | 50 -------------------
 .../automake/automake_1.17.bb                 |  1 -
 meta/recipes-devtools/strace/strace_6.11.bb   |  4 +-
 meta/recipes-extended/parted/parted_3.6.bb    | 16 +++---
 meta/recipes-extended/sed/sed_4.9.bb          |  1 +
 meta/recipes-support/attr/attr.inc            | 11 ++--
 6 files changed, 20 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0005-Set-relati=
ve-to-top_builddir-path-in-Makefile-to-acc.patch

--=20
2.39.5


