Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561F3D12D69
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:18:57 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16284.1764771531780255743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 06:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=RbgqYhVy;
 spf=pass (domain: axis.com, ip: 52.101.70.36, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIH//+jJ8ENIyK+W1WoYxdJXYZ6II6aMhTKt2u88NHy9rfeFOqCsnAx03nFuG1nW5m+dDuj1MvVkdw0Bwo/1eB1CPMfidea3qMqqwAvOkk0V5Hi0LAxhqEc3vIG8R4TnYrNM8BHcX2qzYut1E4hEF0pjlv+bS3EF2Ht8jKs4RUQA2pgHxEKMOAGg8vuOPFzQ1hZ8QBUGmfGLCh5EtUPrU77gKjuZhyopmeRhAdfXrECrSZScZN+cb9xxZn2+OkLwodLdcwO1/6Jk71/6UG/EPxorVBMdlX2H82tDe3fnD+kZXD67KEIa3iSC8TGX/mubZTSSq5s1MbXWykluTuczHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jblG/Lw68Q9n9J6S63Cgw1KdVmw8pSm+hGez9qqzzVY=;
 b=whGQOWgvMEjAmQ7g8bLbNR5pGl9sO9rnR7CpCRP96joacngLyr5P2jic6N4+k8iao2np9XDLb5Ue4gHSdEnrugDS2DwQ1WjmXXQtLFlgHbUy+hNE8a1L6ac3J+t3rKCfOjtKeJIJM1xyifnPrWHOeQg+q//f9ohCz3pETDEV5GhXxhYcvqc14KEUTjtB0zFCciAcne9dtckzhpOoldz2xgOlnq+D+/x8FwxcioBQT37uYWkIrKeG1gsBnQgvEoZ5w0ZRfhJirHQ+pa51cV5YAh44hEdRm2rXkx2zpGe0y5lTajFZNFZu1Lkcin90qGdsLZpTxISPucPPkFYNYDBInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jblG/Lw68Q9n9J6S63Cgw1KdVmw8pSm+hGez9qqzzVY=;
 b=RbgqYhVyiSAcqtCrnpQ2VOI68rEOXqpL8MLRk2S8O9YlUb346QTsi50JgZ7Z3hgo0/mxuPaPqOYcDFFfju3Z10baee2ppYQhrBaE/uzaql7xNrsyAJGi9mM/M9jnw7IaZeWvsLeXvxr7gE72iZd336M9Hum3oAhcMh31dwjK3/Y=
Received: from AS9P309CA0025.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:45d::31)
 by DU2PR02MB10448.eurprd02.prod.outlook.com (2603:10a6:10:49f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:18:47 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:45d:cafe::31) by AS9P309CA0025.outlook.office365.com
 (2603:10a6:20b:45d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.0 via Frontend Transport; Wed, 3
 Dec 2025 14:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 14:18:45 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 3 Dec
 2025 15:18:45 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Wed, 3 Dec 2025 15:18:45 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 4C7501392
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 15:18:45 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 156C612040F; Wed,  3 Dec 2025 15:20:47 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lib_package.bbclass: Use += to add to PACKAGE_BEFORE_PN
Date: Wed, 3 Dec 2025 15:20:38 +0100
Message-ID: <20251203142038.730995-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|DU2PR02MB10448:EE_
X-MS-Office365-Filtering-Correlation-Id: 034bf3c2-2c48-40e2-e21c-08de3276deb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?txpQtDmTeFVTt+A2vn2ETrvIrscNxkXBhCXsH8Yx70R3B6jvxc85uaQp8/CA?=
 =?us-ascii?Q?n86XDuM4NfoNDgTzrXH0D42NXlwtLfbI6LUgPjDHYv+/Oz9uQ7bNWL0+2Amu?=
 =?us-ascii?Q?t7po6iyLKveouXCwBOlqBvTazLjZueAGm246C+498VbEQs6DdAYQtDYZp3Ii?=
 =?us-ascii?Q?vkeWQcSSM0qwKJbs1ssGEJYT9ffePzKjTt2JBrE0ZXjniHK7gH7JLMzEqZ1X?=
 =?us-ascii?Q?fUQ3v4MIGZZ9Rk0R5r5/X/wKkNrpEUxW5UrK/pTTMqcZV4gU36y72F+1ciAR?=
 =?us-ascii?Q?8Q3hQc6KmPbIMVNDs8bPRA+89ViosxFrmlzYqf0vIWuYGgyLX/1lNAtEZyNY?=
 =?us-ascii?Q?zS3w4eADpsUnhBFZsUQSHg9oiTc/h/q+gho+OBz5ZhM5o1qBwkmn6u5L67qi?=
 =?us-ascii?Q?W3ngDPAk0Pp92IPnYhOLmlp9nms3jfqDDX0pkQkPg28FZqvncKPqOjLqYgOi?=
 =?us-ascii?Q?xdNR6xkobgncU9U7e1bd+duf3kaIWTlt5pa+Y9403cJWJ/cKrSSNCu6kn5w1?=
 =?us-ascii?Q?7oJQ86viPk58TJaTopX/Njw1sB1mA9KRPWS0lPdb+4KmruqJ3qXM7jFa3Cw7?=
 =?us-ascii?Q?VA/Pmipcnv//qEAb0l2pLPCB8yklqilsKDQ8lQ7QJfP7NqugURt4LDae59rz?=
 =?us-ascii?Q?6JNLZjIKjsSJDNpoh526KgY4puLspKeRQPw2RSZsz1nUJlPRgeLNTT374vDa?=
 =?us-ascii?Q?gazPfiKq91CMenGRjg0p8Veoz+fk+pAVAAhDWInIpF3jlZI83+boUCHD/q/3?=
 =?us-ascii?Q?yUbMJZaBZcFuhOOQ3MXjDYdxzsJ5yldJRsTlp1tU53JqY/7FckZz4nI7MLmz?=
 =?us-ascii?Q?eA44ZVABYjvX53hbz1OrcWvxVlAY29dzOnyaoinW/j1L9I4K97bIJyH/YRey?=
 =?us-ascii?Q?U2UOAyNei65bqSSIkx3haHNwFAGjaTj/RIBZM65SAP6HX0omalVuoDNjoaeH?=
 =?us-ascii?Q?1/e9iLd/CH/XVJb9/Q03ztDCndiMWFNfwr8CMnSzWvJ7osaL8S1R3sJVTYiU?=
 =?us-ascii?Q?OkxCiHZ3lSxJm5NALClGyqNR0Un0KTK0wGnfwKCsb03zQmHObf27zJRFm/0B?=
 =?us-ascii?Q?fqmDAF2WhTGs8zyDX+rUg9XQNhZ8T8x0TFXj6IdlnzKRFtxuTDi5p08OuyEk?=
 =?us-ascii?Q?kULmxBER8ILC3i365F0SdzN7eR91HlOLP9LHByVZO0sylNarkpC4d6zR3iW+?=
 =?us-ascii?Q?PZQAD+b7vvpR+v1ZiXg0WQ9o0JdJBFd1EvlBflkGxYiHgMGn/W/suFCMf14P?=
 =?us-ascii?Q?Z6piaXH75ifAnbnZ3OuE2yomTRFfFTx07l2Xiitc71D/WJTxxU+ewpPxAT1g?=
 =?us-ascii?Q?CzJUBbCB17Ut4keACQdvNA1eaD9xbKHhK4BVHbAMg6YRoPgvXBLjRjJSYkIx?=
 =?us-ascii?Q?vSctmNtVa+k26LLHkAcDP5qsqsC8L+kR8a1L/525HQ1cKpvv+GoscmHSnGVi?=
 =?us-ascii?Q?1kHZPvoonujYx5hLjswygOrRuUheXyajDIb49vL0idpY4RfeAS6/9jbvNFMJ?=
 =?us-ascii?Q?l4xFw1nyyVjjhui9WsliZpLoNRpiTekkP2zWwlJxbglYv3o/BenHu+NVPbGo?=
 =?us-ascii?Q?qHAchLDDOVakQ6EsTbQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:18:45.6967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034bf3c2-2c48-40e2-e21c-08de3276deb8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 14:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227228

The bash-completion bbclass recently started to use PACKAGE_BEFORE_PN to
add the ${PN}-bash-completion package. This meant that a recipe, e.g.,
proj in meta-oe, that inherits both bash-completion and lib_package
would fail since lib_package set PACKAGE_BEFORE_PN rather than added to
it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

Now, I have used +=3D rather than :append here because I know RP's stance
on :append, and it also matches what bash-completion.bbclass does.
However, the comment seen below, indicates that ${PN}-bin is expected to
be after all other packages that want something from /usr/bin, i.e.,
last in PACKAGE_BEFORE_PN. Using :append would make it behave closer to
that (though not guarantee it).

 meta/classes-recipe/lib_package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/lib_package.bbclass b/meta/classes-recipe/=
lib_package.bbclass
index 6d110155e5..2a944268c8 100644
--- a/meta/classes-recipe/lib_package.bbclass
+++ b/meta/classes-recipe/lib_package.bbclass
@@ -9,4 +9,4 @@
 # We need to allow the other packages to be greedy with what they
 # want out of /usr/bin and /usr/sbin before ${PN}-bin gets greedy.
 #=20
-PACKAGE_BEFORE_PN =3D "${PN}-bin"
+PACKAGE_BEFORE_PN +=3D "${PN}-bin"

