Return-Path: <felixn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A39BC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:29:44 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web11.56240.1716193780813804720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 01:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=XRDFkoUD;
 spf=pass (domain: axis.com, ip: 40.107.7.88, mailfrom: felix.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXE7rP1alHAnAOkhSx87YN8gxbF7Y0vf2NBbJTbcV4uTx7qDlfAImPvM+MVz6tyKoGt2tEe0oI3dreqjoOgmb+T2xfsplVZJCCgg2zr2FzFMGV5ecNnYv1Mxtim+npmWXvnypt2NceW2q41M/gME4aUhfWomQHm+SS3YlPAyJpPyTaAufx2bLWwplGDeogsQxwhiWHM0kMildVOY5G5AFpWIOqTkvz83svOevshPmBS8uTC6p2RBlW9iJaW3l9QFDKEoa3FIBTh1rvkuthdL0AR9JYSBWu9dn9ygRgGcO9UPioGwGVJXagQEY/ZqrnwUPVZLmblOO0q3QpeivIKVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kdqe/ZpoX7RK7FbWA2M7/8ds9wW7saUDfc5TXUfPuZo=;
 b=Fe9Yik4osHM6hxISnP0czdEo9mOXqHSKA9FYjo4ft4yx6itX15ZrpxZY1vaMD4y9taCM+zdN8JAKOIGvob6vDHG2XZGsjcgLYerlbpG1irXKVbAjLSgg7qNaLYmfSZoSyZR9x4qz+CTkrWbbLqyzD0ETrhpXADNgIZqkch1FOCA4uMx/tlKrQ9zYdK6ENasc5GbRWikUl3EE0Lqqpw2tX7+f8hjhD37FlcM1C06v5RuLAoUxI1hCz1yvAntk3r6o5Mx+r3edSLYTJpYfEqrty7eOQWqlRn8o7UACp6Ceet/ufarl5jjlCgZO6maE8LdXNFb1FVvdkXy1Nz8v5M9jiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kdqe/ZpoX7RK7FbWA2M7/8ds9wW7saUDfc5TXUfPuZo=;
 b=XRDFkoUDNy951GW3gwMMXdxLcagC8foag8nxtfI8k0bc3a/okdN32nYZjnUUy5thX1IclthnZRLSzKvatbQHswa442HGMB/Fh9V0SnkSqzhuaXRbdt6gzqnPeRCP1xCuzwZKbSX8hNtKouz63MUf2vv3abP79nm8uKE02+Tfp4c=
Received: from DU7P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::18)
 by AS8PR02MB7191.eurprd02.prod.outlook.com (2603:10a6:20b:3b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:29:38 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::24) by DU7P195CA0018.outlook.office365.com
 (2603:10a6:10:54d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 08:29:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 08:29:37 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 May
 2024 10:29:37 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 May
 2024 10:29:37 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 20 May 2024 10:29:37 +0200
Received: from lap5cg1375wnn.se.axis.com (lap5cg1375wnn.se.axis.com [10.92.71.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id F13481272;
	Mon, 20 May 2024 10:29:36 +0200 (CEST)
Received: by lap5cg1375wnn.se.axis.com (Postfix, from userid 16236)
	id EB6E144419CA; Mon, 20 May 2024 10:29:36 +0200 (CEST)
From: Felix Nilsson <felixn@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Felix Nilsson <felixn@axis.com>
Subject: [PATCH] base-files: profile: fix error sh: 1: unknown operand
Date: Mon, 20 May 2024 10:29:28 +0200
Message-ID: <20240520082928.20014-1-felixn@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|AS8PR02MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 7434d956-5c2e-4526-65a0-08dc78a6fc92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wwgCJctQ17qi56hMI2tq4x1VY05BH5HGPd7dUekMcEyZOO3WoQDrdlMokpTq?=
 =?us-ascii?Q?fVs3uJC7vHR5uEtJEGSrgiQnF8Boj2USMzjGQZruGm4NhgHseHcc0tzgX1FQ?=
 =?us-ascii?Q?V+q57WaVL9oA9+zaSPkY/UUjvTPaw5lIHj7+LwL92vQYLnb20XD8u9Toq7h9?=
 =?us-ascii?Q?PzxjBrc4krvXw76ZNUm2GJ/sHWsid7xcf+2L0xOV7Sy925aimFbfrtwg1RRL?=
 =?us-ascii?Q?3UsfXwh5iU4DS3vTEbJajX4lEqaFMXUOid8XJHq/zJ970WEof7DBvnCIKftc?=
 =?us-ascii?Q?3vfL4N8HZtTOIWUg+4VXLd7vjgUDU3Xzkvc+9Fh5bPRN/cOTm7jbwBWIOmgq?=
 =?us-ascii?Q?GAXP6h41mBukDvvUJFhkhSzphKOMnxzAX/TeJGXJmb1/GLeLn5VraxmgYvdD?=
 =?us-ascii?Q?jtSGS8YY6LH3LHXIIfuhmDeTSrCbGSWumWbHcZQs99rk7ZBmHIxkYFLVVSOK?=
 =?us-ascii?Q?wLmGsUlXAGWSSSLvyRr19VCv+Kitmqvc0Fbu8grXWooweqVphZjqtoYEglSj?=
 =?us-ascii?Q?lvDX+drDqby3HH1EwyPImr/hzs5Mnij9SoWpJtFTBksQGkAJoTwHDn/3nsgZ?=
 =?us-ascii?Q?DTbcca5+SxAsCyPO3zntQc70C1wO8GMv2Pp3Gx0rZx5d4pazC3WRjO5DQjf7?=
 =?us-ascii?Q?+q8gBON2RuOW82UnWlu2NGjk2EjvxFcQqFWc0IYHvjiGW29BJPzbyMtWL6iA?=
 =?us-ascii?Q?BM+KG7gFPDW0x/FfTdpTsqTRq5aLFNjuzlKHIrrUwsezN6X9iZ6w0OFwhllb?=
 =?us-ascii?Q?957zxhXw6C91ucSzUFOOBM8IuVP9Odh8UG9BkwzZQx9StEIta+pk/QPyyYp3?=
 =?us-ascii?Q?ov/ZU2g1v9S2LsYy2ZBSU43/VftEGA9H2DHdGojOjMwqWZ5ikdRsKYNUKwi/?=
 =?us-ascii?Q?iRVLmgCCG/8ekZLFC8dc9Nj9bBZQDediKZvCb1zuGUTwloDtdz/o90CLHiDY?=
 =?us-ascii?Q?Z3xriQJy4D4YWl47uQ5oAda/UQ5ohbmkToKCdz7gFVJDSbNUphNZIfehELur?=
 =?us-ascii?Q?9sJCyMgIAXFQaz3SxzoJUrt1fFz8NFT/cp9XqiTafB9pO0+aYTL93qIfWmSg?=
 =?us-ascii?Q?npOLE10Lu06Uu0tF8WC2VuEhL3LCN/FJE6zOvWCL1PIimn4wLmYMpqR3STr3?=
 =?us-ascii?Q?/U1H3JtCLI606Wa6B5EtspT3xT/NqMrva8g3gR7orOQoB1wy2LgWiC7cWGi5?=
 =?us-ascii?Q?l3xyU2X2m2y/O1zTNv9fHcu+WtV/7tcqHyAQyDikE03S+uIhAWrWF/q5ryNT?=
 =?us-ascii?Q?tKyxwK7Yp9Uf7L8sMy/8lMHxuqlT0iq4nkSSrs9tfQMxZhVdtudHsosRJGGm?=
 =?us-ascii?Q?NML/CoTdiWAvhZ+KORutvgYpMlJwPSayoDbp+31WArUxPLBHmAJNQIgpE7oL?=
 =?us-ascii?Q?4bErNq3+/U0b1Oj0HLHHJWdflZz+?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:29:37.6343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7434d956-5c2e-4526-65a0-08dc78a6fc92
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199562

Change-Id: I3cd2347ac808704c53aa660f2408b1b559d639e8
Signed-off-by: Felix Nilsson <felixn@axis.com>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes=
-core/base-files/base-files/profile
index bded3757cc..5e8393c91c 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -58,7 +58,7 @@ resize() {
 	fi
 	# only do this for /dev/tty[A-z] which are typically
 	# serial ports
-	if [ $FIRSTTIMESETUP -eq 1 -a $SHLVL -eq 1 ] ; then
+	if [ $FIRSTTIMESETUP -eq 1 -a ${SHLVL:-1} -eq 1 ] ; then
 		case $(tty 2>/dev/null) in
 			/dev/tty[A-z]*) resize >/dev/null;;
 		esac
--=20
2.30.2


