Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E735CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:25:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70361.1778570700396495700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 00:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=RzV4k/Ul;
 spf=pass (domain: ericsson.com, ip: 52.101.70.59, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqGjl4CBwwN5gGBmFqxttsX4ENvb+dyP4tl8ghsym7rdgQwWvhCyNrYot66+Fr9+yjxzDJjSY0vAnQOqX0DJ6h2YHNqBiN3vwrloNdT8MHbpB33p+Ah/YuaRJDEvkP+njfJxZj8D4nqsuAaQVKhNGSRHKLYZJ58lAUHtBDvqBXNd5xC5xSfhDLH5NNDCB8Rfus2s0iG2l/LdaKCPj+ualbLZ/bHRS1g38q6r2jfISAz1eTJv9+DNS0XeppKP36ypxCI+dtog76WRnJZEmOrAtMmmMeQxxfn24pQuynM7EQ1ZnfvJpN/Iz3bRyBgkZCTeu3lSFzrD2P0TwsSSui7IkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv+VvD+8tQ67RndPbh1O3Lx+5lfLi0wsc+KjCGLGYQw=;
 b=nA03l8vCiv/dsDt5Ja+rRCffupKXKkX+G8nUprmdFk3f/0VdTciW/Z04sUXrSFqkZenBSTlEFN19o8o75rEBcbvN9ryVJMUPE9Qozu0qKT5+og1bAFCMWc15EefmacWspB34S3vtBDFSGmoZSCUysSlkRmXMaNfZBf/PvhMK+oZBswaBSxtvym8c8GPNOkJh9vcZuy3o0oZGKYi+mlOmf7drmUYcYcH2854YAqcwahiePXECg4D6/XKASIkdlVjzmNsJYDMwys9Fd8RomqaS2p1iK1y448lOtbGwwnA+Uz7AEKv7ed6S7/vDm7Cok6ItYjBIALKGGo1jNAn0RTuDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv+VvD+8tQ67RndPbh1O3Lx+5lfLi0wsc+KjCGLGYQw=;
 b=RzV4k/UlzzzVl9DAXdMZ6H6mDrhc1JRpoc+0iO6OELKCArddUysCGZiG0XaUgV9VPf9wTiaHmSFCPbeOrUhfokC5GaD6BGAblMSaJejXTiVFIH4jJKPlWr2OSiQ01Sj33BJKuUp7bZuiARZerI6VSS+PBB6pvWp8yYCttmMroUqMTC9vkXKRCdZd9X1h0p5YX+pMftQydwN31fFzX/yCfwi52n0ZkAdhKtGZbrdqZu8/IOBtvg430G4xBtma2r1f9lbhbFCYaD5HitdTYp/9BBW/6gMtcZSkNCxHl8iUHY2zfHqXVKQw/bUPRCUaS5By9j+JelkQJjxPjHoQiRlYWQ==
Received: from DUZPR01CA0113.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::6) by DUZPR07MB10125.eurprd07.prod.outlook.com
 (2603:10a6:10:4de::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Tue, 12 May
 2026 07:24:56 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::a2) by DUZPR01CA0113.outlook.office365.com
 (2603:10a6:10:4bb::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 07:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:24:56 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 12 May 2026 09:24:55 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id CC8F84020AA6;
	Tue, 12 May 2026 09:24:55 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B647A7003739; Tue, 12 May 2026 09:24:55 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 0/3] devtool: add changelog extraction
Date: Tue, 12 May 2026 09:24:43 +0200
Message-ID: <20260512072446.2323529-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|DUZPR07MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eacfe52-ecb1-43f7-54c9-08deaff7916d
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	uBUN20hSWQ54ji+eZsq67XvycZFaGFFgG//pYIJGIZaSWsmz+eimdpEsQR6Hjd9yo+0GXNR1jR6mIjt61f7uyooHoFBsNAYe1Z6Sdke9DrJkriOAs+87vP85mS9sTZHcb27PV3FZycNu7RjsN2YnUT8G60JIouyE3YtNNz4SBGxwjiTijMoWhMxx1uWkl7Cx7QSLsp00NR/qSkLDBKh+wNkkE2AJAyPrI8KMnseplF6KAEEEw+yb/Fuh8myaNhtExG/td0G1Wyz380zX7CxYLtqqxpOkvemL7h8CytOuCWYbdW+xHZbqNCVas2nivnq2A8ydJVz8kbAmc2FPLAbiGloEmrMxF5Tr50HVmQelNQcgkkKQN+ydLfL96SGeUUt8xFrC61p9d+xLtIS+VWitaywUAlIXLo4bcXHG1mmeWJa5RZ4l6MDv+aYKR2Qz3OPXHKUk8QVnpytthGYpSQ+1K2plKPVpSNZdRoz6X2zxd0Yd5+6QwUF9ScDr+TNiQYOOmNQ9AhGrAzp5+xcle8VOdpckVEC1EmKR+uW8SyNJbfajZpAyjo+SSeCwfqd773i8Q515eSvOHn60/Ef+SeaB2BlwdSMrJacSzpAepiQB4KHozuTnmqJNVe19bc5XyIY6jYcPvpcM1R3Coyzn1Pe+Xp+fki3790Vt0jMj9TmQvH4tNmdEz+gACtbwalwgJ7fMEn5axfPyMdVAmAWp2RK0Z4ZFIoPrpthUyUhWvpukxvc=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0qZ2LBXtkbC4LrA3zB84wh0AaVrK/KT5yV+VfHlbGrMkbfS1zVSOndv8bM4vtVrZufbn/DO54Pz0WnYJVoXEbnhFP2ClDxaeq/5qCF3sBQEsoDbmkWfstpbuKcn0uho4iZkaqe3dtbw5t/42LropK5xAUS91mdJX8HlS3GPLekj/4AZxZsliNLxyIYaNsa+94oNQI0TqDe3KnRsaU7WSNvl9gMYaE5o5MFToNaGZYGFosAeK2o4DVllBY/xXZPvKxzchHsUbXp2jcwfLc7O2ZWdhgyCdw4F39/QIisVgHqC4RXLJoWTkV81sthpEqNBwqxG3S58U/8s8TvfCJlh3Wvy4QUjIw1wB5570yooDYJOGtJrG7JMzgza0zH6BDRFZy6ZjQFSAFe3YUSxhSZ06Q2IF1yNdQI3jPEbYvxCm4W6EAyaQcddNFG4SY5GsFjbd
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:24:56.3988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eacfe52-ecb1-43f7-54c9-08deaff7916d
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB10125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 07:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236854

From: Daniel Turull <daniel.turull@ericsson.com>

This series aims to extract the changelog between 2 versions when
devtool is upgrade. The aim is that later to backport the feature into
LTS branches, so we can have more detailed descriptions with AUH.

For testing I reverted the last 200 updates of recipes and master and
try to do devtool upgrade <recipe> --no-patch, since I'm only interested
in the changelog output.

From the last run: 83 with changelog, 21 without, 41 failed.

Excluding failures: 83 out of 104 =3D 80% of changelog were generated.

Daniel Turull (3):
  devtool: upgrade: extract changelog between versions
  devtool: upgrade: detect per-version release notes files
  devtool: upgrade: clean up extracted changelog content

 meta/lib/oeqa/selftest/cases/devtool.py | 24 +++++++
 scripts/lib/devtool/standard.py         |  8 +++
 scripts/lib/devtool/upgrade.py          | 95 +++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

--=20
2.34.1


