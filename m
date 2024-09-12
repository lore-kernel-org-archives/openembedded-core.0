Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A83EED60B
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 14:30:03 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.66])
 by mx.groups.io with SMTP id smtpd.web11.49410.1726151400099073227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 07:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=YV94jyih;
 spf=pass (domain: axis.com, ip: 40.107.105.66, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lghhCPI95WYlUrUfQ0Kw/yQOD31uOyqEajyjOGU4ubVK068VL8DwQdFeWvJrETn3UoQu5YMWInuxte1MfXlUkHPR+jceAtb+nL8vrW37sQ+cXzD/xIU0DzsZbHm72gy6XUmis9x5v2VaKp+bMWXJFx7i25tnFtyEIsupnS25uVd9etNdaBgskprSRWIC66WuPRmnPv8CGiCu1FXnzB3H2+Q8NscBI9fwZkbZWMRPAPaeY8l3Lbq13euGXmD3ulCQBbNuwP3Q68hSVjOjDECxPU8ZneQGNtSzikj+e21Lm5AQm5+nJdnkfXGh4j/ONPiTCzWRDLTglQQLnGMvVftx1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/1qxFybMI1oa7SEbqS3c32ljGFKA9buYCca/QpfvAw=;
 b=MJPl3Q5/n276xvjx7zjsyGnAA8bwTe6Gu1Cs3J4AzQ3aI8VhOCavIsXi94Ci6VYUpHMO8/Sz7bLaQuu0h0eHBm+dxtcgwTMwX9epIww9QYwyv+cjJ2mcVHJ68padYcK2XJ+SfspqcvnMn72pmJvgD9JbSAIIqAH9xsD9vhFoVxYLqDUYhLuYC/4J1ISz/06Y12u+LQTn9dAhHu9zy9aqq+W5jj2C3Qyq2u9A0OYu8iMyRhzntEV4GJesf6IGS8v1R1CJAMerUJjW21SA3MvGhavRpS2YQn7/JGHkz0RusXXH/ai5MTePnLk5JI40KXt6lYJx+ywatHmdO3cLFMoWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/1qxFybMI1oa7SEbqS3c32ljGFKA9buYCca/QpfvAw=;
 b=YV94jyihs1CIW8BLfuGDCE0ZRPh3KiLQNGqKlfvaeagnn2Z3ynqN/3Fn6iCAsbCCVTGztD+mAICzEGjqwamE9dbyM8dbkB9OvFmMs95Mc1sCL7GKc1nwK81ve45N8MBv/1BWNgE5kZNZKBGz0liHFAY5p/L9okLT8Dz8t4DQhSU=
Received: from AM6PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:20b:b2::21)
 by DU0PR02MB8978.eurprd02.prod.outlook.com (2603:10a6:10:475::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 14:29:55 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:b2:cafe::91) by AM6PR08CA0009.outlook.office365.com
 (2603:10a6:20b:b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 14:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 14:29:54 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 16:29:54 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 16:29:53 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Sep 2024 16:29:53 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id E8D7F264
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 16:29:53 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id E698726B985E; Thu, 12 Sep 2024 16:29:53 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go-mod.bbclass: Set GO_MOD_CACHE_DIR
Date: Thu, 12 Sep 2024 16:29:53 +0200
Message-ID: <20240912142953.1580877-1-christli@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|DU0PR02MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c74f82-7faa-4f56-cd68-08dcd3375eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yCxkkR78ub9fubkRQqG0/DbPfzsawr2O5zdoJ+QK4eaHSuz0D7FdwRGYpkRE?=
 =?us-ascii?Q?zU3euN42OlptL3uVr25R6lPxe1TZY2qZXcTZf3fyZ0KvMhyKyJUP9oa0nktE?=
 =?us-ascii?Q?X7BRZuylW7JhaXxCYV6BFCNA8vj0V1YNqVV0eAOWbCqVbAEG1FucUOpBfxGn?=
 =?us-ascii?Q?uWYAgNV66cLplC9kO8qygewjltdH/jZ2k4OjrHoJ5w9Kj+WqlaiRY7FeLSef?=
 =?us-ascii?Q?whkwAmnx6t4YKwgJJm432HPmkhZUrVsajqz/ttQfvHqRL2J1M1Jp+9sOjlOg?=
 =?us-ascii?Q?ks4HAwl56nHFYamwW/uihr8ERLg4CHUTbd0YJFPIF/k1BpP9irtrHtRl5oN3?=
 =?us-ascii?Q?EBr68KkkpBbbpt6M+NJnafC8s/awaj690JaK2oGH90OLth29Tg99st+p4wul?=
 =?us-ascii?Q?pmd3VEsHCWGMet42/X6+U/o+KTc1Akkz9jKJhUgmn31p8DiLS406EppZc5uS?=
 =?us-ascii?Q?mComj47Jds/BeFZzmKqVIpxIZro71Kxzu52x/ExrWpVOi4ZgjhrMKdG6Vf9O?=
 =?us-ascii?Q?IgIRzjwZON8I8IATs5los2OsW/RdD1XQKnhZAoWTrLEstn7QC3WBQ7pzDS9l?=
 =?us-ascii?Q?dBTdMcjUG3qVhet2ctoHUn1DEny2TRbJNvJFdkA/0kKU27vcone7hJVWlFw2?=
 =?us-ascii?Q?KIqNUVd8cWuNtUDlx/idz06pUTgA+WpEGyUM2VRMr//RpwmRb62RRRiQXs1l?=
 =?us-ascii?Q?2E6VCyJ/ryAgr1y0wKTw/m4qb1i3z5S6wNaV44uVB6K+znZ41BKIVyZvr79W?=
 =?us-ascii?Q?Qgj2BXNSYOgnpFQ9QQaoInAw/VK4ZGlV/q3vxMsfO7zO7qLOndq0wndXysPX?=
 =?us-ascii?Q?FCWATGHo4xm2U365TQ9FcAs2FChQ/dgpK0biS2Rak4EbxQzIx+Ly5BmNGTik?=
 =?us-ascii?Q?6BwXop8PynHOeIE//4Ymp8pTymN/LKSBr00zIhpPgdUho1wRR/kJAaWSK1BV?=
 =?us-ascii?Q?zlQkgHKXoMjpVRd7BB0WSDRpZTn10QC6mP298l+w6Owi85hXQpExINF1R32d?=
 =?us-ascii?Q?YJ9gpxg81LwsViYmNPMsANGS6Oj9EysnqVvkZV9ZjkR8OnP90o09yTMxEKiL?=
 =?us-ascii?Q?qnlSxF2abIVc27CREGpxl9zysU9rQSix51rXdlrLnYOYh7nthgyikRo7pPEC?=
 =?us-ascii?Q?sKXteN3/6Kl+0w1/5aGh48VID+tvQDJbO/ocsfFGMRKiG50jENnncUQRazaT?=
 =?us-ascii?Q?bY6MMGPeBxhH3sOgIxcv0EIn1UD41AJv+Z5ko0rCDFmAWy5j7gcByOs8nDdp?=
 =?us-ascii?Q?unBQzgc3o5K3u0xPqiLXbwWto8OKTzD6y4oJLy5Jlkii+iB45ZFSfDdXnNxK?=
 =?us-ascii?Q?EBFekK5Une/B5T2sPHeRnfLW+d7GI4ApmPldoLey0XIYINvN5BoqKfvlLc5T?=
 =?us-ascii?Q?MLZOTC8660qAdhS6s4dqyuzUCry3iL7gsoHfkB1ccB7jePoPoyPn0U7/AoSn?=
 =?us-ascii?Q?si2pzBbHxInXsXv5aCfzExs9qatIcc8/?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 14:29:54.5130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c74f82-7faa-4f56-cd68-08dcd3375eb8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8978
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 14:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204444

From: Christian Lindeberg <christian.lindeberg@axis.com>

Set the GO_MOD_CACHE_DIR variable and move the location of the module
cache to enable the use of the go module fetchers for module
dependencies.
Also, clean out the module cache before unpacking.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 meta/classes-recipe/go-mod.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mo=
d.bbclass
index ca3a690d05..71a6712c47 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -22,9 +22,9 @@ GOBUILDFLAGS:append =3D " -modcacherw"
=20
 inherit go
=20
+GO_MOD_CACHE_DIR ?=3D "${@os.path.join(os.path.basename(d.getVar('S')), 'p=
kg/mod')}"
+export GOMODCACHE =3D "${@os.path.join(os.path.dirname(d.getVar('S')), d.g=
etVar('GO_MOD_CACHE_DIR'))}"
+do_unpack[cleandirs] +=3D "${GOMODCACHE}"
+
 GO_WORKDIR ?=3D "${GO_IMPORT}"
 do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
-
-export GOMODCACHE =3D "${B}/.mod"
-
-do_compile[cleandirs] +=3D "${B}/.mod"
--=20
2.39.2


