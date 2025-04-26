Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FE7C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 16:20:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.52])
 by mx.groups.io with SMTP id smtpd.web11.11899.1745684451318494305
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 09:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Qk1s+sPC;
 spf=pass (domain: ericsson.com, ip: 40.107.20.52, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSsRcpVR06btvRrgI0p71pWSPUR2yWAgaznavyM/aPEW+XS7894Wr7CrEcOxTMIBJUyqhUdbgvNlB0fT7V7UGTqgUpA0k0Io+IvidzvLP50fmvN63KMFMc0/1j9MrOtUBy3Rs+KoCH6JZvlntouQi7habKzTZOoQhlxxVFKXowq0nhUtIkBJ78xpVZ4f0/vbhkRIKY9Lp6yl9gxrYzGt3DpqLFToLWJsLoaeWyelKBhvoPqsIBx3VPEPLwtv5icMP9jU7gMDIFQKvaoKmttEXO58qbXvHOli+GVdIhY1xFASIZCUfHRo/oUA3JV1bm8i0dt5bXnZG8T0Hrkfyp6kxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ru9xz5kvYVV+Cna27wT41iRbgZ/VTYMjipnEROOfsxw=;
 b=tueGij/fq4DTseVlf4kSRfGsLlDC80ifHKxRA3s2jV08tRj9J3IB41GUnUAzDRIzxmNiqtvkzBNwF2T+pW5sZ8rVco7kRhaR2Bo7uGwC5TEQzTB1rV+YZJrhiPqp7Ck5aZPiX99hGtswLRIdT4zmmIfZlyHMGD8AkvP/ZG61xdtzxcWJ1IsGPrZfaDZW/nWRqpOdZMqTOh6ps5PF/80DfVnZNs+uz4E8Av4N5961CRFegDik8ES4kuMT/eQsK1D5eU6Fpytc450VhgTfWzKP+073hfllr09mYjruOTHh79mBZJHHovcOmOA40r5WB5MpT7e82TY4r4nEufFohZIWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru9xz5kvYVV+Cna27wT41iRbgZ/VTYMjipnEROOfsxw=;
 b=Qk1s+sPCqGNZ9dpZyEYh0j5u4IdM3EzIESKQBaSHrYQuIUR8jLh6uiFcIfT/JorhmP+oHKtr1FgDZw/+pGIWG3uz7eG58hSHpX5r4q6oXeIFHKV7//Z+cxK2zbm/pK3VjDheifcYT6jvpk4ARNKw22dqiojlgsMooba5wSVsREh/XdS7GGwiRi7ikOlZ6hBEs7YhF/C4vjhM76+CEQ9fOEFoLBv7aGcxPt8j7UeLkyYX/DwI6MjQVhOP8GEEMMm0IGTFYQlgcM7gNAfKQHG/7Ifxdb9cSVuyvuqojArRkSQSnX24W6PEw565OVmcdxKbHZ+7tLChvHKaJR5rr/uSrw==
Received: from DUZPR01CA0280.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::26) by AM8PR07MB7555.eurprd07.prod.outlook.com
 (2603:10a6:20b:24d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Sat, 26 Apr
 2025 16:20:45 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::dc) by DUZPR01CA0280.outlook.office365.com
 (2603:10a6:10:4b9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Sat,
 26 Apr 2025 16:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 16:20:45 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 26 Apr 2025 18:19:58 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 173C44020840;
	Sat, 26 Apr 2025 18:19:58 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id F0F887000229; Sat, 26 Apr 2025 18:19:57 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] cve-exclusions: correct cve status for 5 entries
Date: Sat, 26 Apr 2025 18:19:29 +0200
Message-ID: <20250426161929.3492087-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|AM8PR07MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6ed021-2ea3-4ea8-ad0d-08dd84de4c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?84oLeTQI15oh0TXpoivMJX95Mq3Bjb++87Ww0BJNarhGZ6i/hsKpCm1wx2L+?=
 =?us-ascii?Q?EISkWdL8Wl+BtEFLvT0kxTgmn3L9z9I55LGIrs5Drgi/OpICsTEOHfCkXqpI?=
 =?us-ascii?Q?D296Bw5BlUiAOmhNm74UG81zQqWqstbf93AE1/cb7tNfaMMv1qHpFLq4PKGh?=
 =?us-ascii?Q?FYpLVXevp14ApwOxnDikwdsxf4USqshjICbVIr19taNM3sYyZvjgqXhJEI6u?=
 =?us-ascii?Q?N3SGMajDcKBk/t4M9tmQdI/1ctOqqMjjSzGtEKGnT0up+D3tc8kildBVDXz7?=
 =?us-ascii?Q?6njQswbXwuBHZSCL7aJFBotEwMpDpCKHGaBcc54Xw3VnGRanq2vKytRNoBOj?=
 =?us-ascii?Q?HEPcogIkEPqJjYPu373pvj38M6v+JYkS5UE5QFQSE6o7xvxkA3HxYO7yzLIz?=
 =?us-ascii?Q?oLE//t+IHfkbpPCXv9Mu9L4ZlRpb5MU9mrL8oTkcOOwBMo9wH90TsGBBEZys?=
 =?us-ascii?Q?KJSx1Zwodgd7pVku2u7/IlnKqzo7IM9fCqvKPKVzkHK7cajC6gc5jx+rxtv9?=
 =?us-ascii?Q?GJhdG0la1Nb0I49sQarULG65z5pnrImyzq+WXm6E9emNYbK4kD2uCUZYZ7W4?=
 =?us-ascii?Q?i7RgtrNoSEi921nBPYUU/7GK+yrU1gVsAMnN3OpsUKuxJVOJsxrkxR7UxdhO?=
 =?us-ascii?Q?6RPHlz3unM9y95MUh3fkRB/gHanZEDMfx6PNC0btZP+nSCzpIu+GzpxbGb2y?=
 =?us-ascii?Q?crCb96IRP6g7mkUq/n0TzOjvWtCQGpFgXnztejMBMQgEoATryMx2hbOYL5oW?=
 =?us-ascii?Q?ovj2yumeaxfGL+xPuwDdKmfAG9SnxZAbET4G+C2usm2pZGMmHjr6+IZAyLO6?=
 =?us-ascii?Q?F9y6LycX+7xUsX7FSpXnW3B++s3eOCTc7IBHyYEghvDYjuRH2304e0J+Pke3?=
 =?us-ascii?Q?N2lWKk8GIBkbdL4Zc4/FE+Kxcb+1/KiCpbMIcNl7H31WN/6mPlIod0zB4M4h?=
 =?us-ascii?Q?ozzgKxeBDam23ENCdPf5rCGzXt67bQa3UM0VPWHyKoMnKSTvTgPlDHEvowRU?=
 =?us-ascii?Q?EbJMcrU0VkOpp5nFGpk6AqjEkP71IMATf6HxXVRXo3kPJHaaSlaWE7adSb+i?=
 =?us-ascii?Q?IVvq60pSI5WL/v0Y5ekkLnoAQ9njfyEmr/fbr2gv7KaX4C7DyMu7pGB0Rs2C?=
 =?us-ascii?Q?F2Z96oiOzDAXgEflOGPyJR6ZQZiwD4TYGtPVhoyh4COnlCP7sAtN0AkoWQL7?=
 =?us-ascii?Q?bB5effaHnl3BE0Owl1vOH1PLoeA1QodkxC3mhW+5EIyYzTlfUWtq/oKr2vmR?=
 =?us-ascii?Q?u5PejOsrG1BTGVk2P9ftc9CTRjqw7zUyixjEgt3y2Jx3u1gXbUA0J5LgXAOs?=
 =?us-ascii?Q?J1vozqW19RyBaimfNmypiiOBV6P6cSpAK54xPEVfec09WLbYZ2U2Dn+N6a6r?=
 =?us-ascii?Q?ifyPRc4C1mNRqFHj978JsHfcQq8ScxbMHPXQ7C5PAdXHYWDbuEmo1F5pb0uU?=
 =?us-ascii?Q?M5a293G56cklDQ2INzIlcPGociQyW/MJ8kfKc4rpgzfLVKQOcbAjDBYrO7Wf?=
 =?us-ascii?Q?AZUY4P3JCN9cNuomv/QrjzdgHTaCYPLntDtbZEOJaIUHgrY1Su8D/8lewA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 16:20:45.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6ed021-2ea3-4ea8-ad0d-08dd84de4c20
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7555
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 16:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215520

From: Daniel Turull <daniel.turull@ericsson.com>

In commit 8a7af09feb the CVE_STATUS was copy from the old data
for 6.6 kernel, which had backport information.
Correcting status to when the fix was introduced and adding
references to the fixes.

Fixes: 8a7af09febc28477094de0999ab6321d910811b2
Reported-by: Peter Marko <Peter.Marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-ker=
nel/linux/cve-exclusion.inc
index 5f96a81bdd..f1b7db44b6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -141,12 +141,17 @@ CVE_STATUS[CVE-2023-4155] =3D "fixed-version: Fixed f=
rom version 6.5rc6"
=20
 CVE_STATUS[CVE-2023-6176] =3D "fixed-version: Fixed from version 6.6rc2"
=20
-CVE_STATUS[CVE-2023-6270] =3D "cpe-stable-backport: Backported in 6.6.23"
+# Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3Df98364e926626c678fb4b9004b75cacf92ff0662
+CVE_STATUS[CVE-2023-6270] =3D "fixed-version: Fixed from 6.9"
=20
-CVE_STATUS[CVE-2023-6610] =3D "cpe-stable-backport: Backported in 6.6.13"
+# Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3D567320c46a60a3c39b69aa1df802d753817a3f86
+CVE_STATUS[CVE-2023-6610] =3D "fixed-version: Fixed from 6.7rc7"
=20
-CVE_STATUS[CVE-2023-6679] =3D "fixed-version: only affects 6.7rc1 onwards"
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?id=3D65c95f78917ea6fa7ff189a2c19879c4fe161873
+CVE_STATUS[CVE-2023-6679] =3D "fixed-version: Fixed from 6.7rc6"
=20
-CVE_STATUS[CVE-2023-7042] =3D "cpe-stable-backport: Backported in 6.6.23"
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?id=3Dad25ee36f00172f7d53242dc77c69fff7ced0755
+CVE_STATUS[CVE-2023-7042] =3D "fixed-version: Fixed from 6.9rc1"
=20
-CVE_STATUS[CVE-2024-0193] =3D "cpe-stable-backport: Backported in 6.6.10"
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?id=3D7315dc1e122c85ffdfc8defffbb8f8b616c2eb1a
+CVE_STATUS[CVE-2024-0193] =3D "fixed-version: Fixed from 6.7"

