Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87F4C561F8
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:56 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17369.1785852711355244144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=nYQsEZqM;
 spf=pass (domain: ericsson.com, ip: 52.101.72.24, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEENBCExVzNiBWoXbAbFpry9nUXQ4m2AKCYbKDZ+ShmqSXFGpEfnoziAOoa0JPf8c9bce+kajsNvoM9rrNX9Lv09zWC3FiLstDFtro3xirlsl0Pw2QJnUTLaeO/oBI6a65/lw2Z2V2kISOxGzcrq0+sq1jH/obXJkKsbV5TCCee10CPWPVhekW7TtvB7rNHPG7sCBA7uenKIAquL79//mdbush79K4/tVG0QsImW0LFcPtXzp0mYXSeOdsfsUIYmEqYhUK/RdWGQUnanP9U/lXGCRv3pq+/kaNuMbRip4RzxOFklcOghUHCZkj8Q1PQcbBIHbfsdRzNFXUoTLYNxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPr6KGq6mPMbIfKOrxl2KEBMqT/vi1V2MT9aheRXafs=;
 b=JYEk489zcS7r7Pc/Aq9LYDPOg74VGqoAr6HFx6Yj7bzHCwgM9c1qEyoJupaDkyAx+QG7sdTXVdfxXnF6iF6QZco2MK5DxBqto/mGq+GVX9Snojr311jJHoeJ9fyA7ZVdZbv7aIVNaNWcZIMoYM85VNPe000dTFRrmi/F9O3RtQxROrPbNZf4On7iRfTKy6/3syBnDKe9l1Wp/54GpUc6KSKfAb6M2VnBqrVWqh6ShOAV5xeUxxcGlDGBZ/IPw9yHX292yuUudJJYnBCP1VG7JpYx79J63TlEUMzWC4bD+e9G8kuGs6L6yqzCJ+ZZW2EWn8sVsBUKesyZeep7Z3umHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPr6KGq6mPMbIfKOrxl2KEBMqT/vi1V2MT9aheRXafs=;
 b=nYQsEZqMKwR9DhcCMCZ7RvuenokS3uJECLneN/rgbIbWxS2is32NsVPxxOgLFJOQAI+c7S6Vanyn3GxUPgyM5i67gD3rFQAEuTrbR00sfKboAuvajVaiDOCGuDeDf0pbmu8g4n67JozARvz7Krf3sWn4HwKcG3whzR+Dr+cefgwoSsdDgeqizy6QZaEF+zvPJ/QUIk/snHHgYSmCX5DiL4zvKPFiglWyhKSRgKfO0dgs9PeI5nehY/Y0d5Wa3u1vVj+75ODLRaATuRQBZtkNn2Tiz+yzT2LT4sUTUY9E8jX9i/NpxIO/zPQWArtnKEV3rsgJka2GBmWd66BVdVOTqw==
Received: from DU7P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::8) by
 AM7PR07MB6754.eurprd07.prod.outlook.com (2603:10a6:20b:1b4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.15; Tue, 4 Aug 2026 14:11:45 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::4d) by DU7P191CA0003.outlook.office365.com
 (2603:10a6:10:54e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 14:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:45 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 169E64020B43;
	Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 53A46700DF51; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 6/7] sqlite3: inherit upstream-stable-release-point
Date: Tue, 4 Aug 2026 16:11:34 +0200
Message-ID: <20260804141135.3779287-7-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|AM7PR07MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 450c2a5f-d230-451f-9c78-08def2325115
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	4PPspIBwq2WJldd4nA0rVyMClTpgxNvVV85P7idj1Fq5K/7A1yoTvfRqdzDOgcRaNzNbExWArvhhtrKSSsnxfugjdDhogY9kbSnDmgHxV17cQR9Uwxi6bSnIDwqy6p1BIWsMzWpcdEck9TeyCVB7r1FMJwkw0XSDxN6SwN6W0j+XB9F5aH1S7LNTbTS38gKLICDCqvMRI6+zBb7nJIY9W540d4yBxiJMedN7a5BdpM6clZtS8XsLA5HzDd9UR/MEdP2SIic8o/jvt8HOBknOWxCKHKvQt4Qxy8tk2qUjYY6zt1EJZZccOKGcXr1pITDKhQ773Q5UX+HVGyfmDgwBtecO0aNGIxns3xVa3irkhNQLYxLYaYWm6kTANk3aO7wxdK7bk2EhYGKLQiGA5VyUxtpYRjLnVrx6evXKiSFP19uYhuZHDiG/8fkwiwXDN3LBnvd9+z6Y5CbNRsMfFrRu7WmIPr76XZztZqaVDXX2DNzfoDtwH18pzx8nhoA5kcEbEIdI/uS+1REcq0sjvfQY3Juox7LJ3fSlam33C+B1tzdbrulFLCZLkYWIqTyYVz4eFnvmVUb9TigxlDWyTP9nvEQhQw68brsN4mk4QdC0wt+8uEMM0ZeDrOP18IF2cFdyGonm/RF7I81mTIYFI2+vnQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vWU+c+iWKRt5453kL6ljDJqjcvfMVhbbTR40jiy4iKv0HknSWFon+kAp9B+GzvQDrTmvu2kTD8zCtgWgFL3x+buorgPWEq2drN4W/QgPO+JzWH50G5YC9hO7eZku86VA2TzsGrV4qB182prgUXpYf7dKGImr3m/KNqs1neroWidOpAv+d2N+zhJ3cOdjlWX34q5Sy0P35YqBdTKHcZkrHW7w8uKuuRsR8kRfKRxtmpifejAKwfuFMITTBTGEsc9K7SUaAkNwN5Xl2lKtOLCOBz46u1O5/Xgjw0tZ3qtFtoWIBabkR7skmJsK73qXg1Sx4ZpqujKFxxTeJa4DWGeV29ki1DKZXlJl/wquWFJ4jtXlQjn/vo+bakU5Qm4zLjWi5R9qmdgc5/+mkfBtgsAN/g8QgAuc6cCKeaNd8DalV1+xD4f9ljNxvGNRLffHe/cw
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:45.5035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450c2a5f-d230-451f-9c78-08def2325115
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6754
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242768

From: Daniel Turull <daniel.turull@ericsson.com>

SQLite cuts a per-minor maintenance branch for each release series,
branch-3.53 matching the current PV alongside branch-3.52, -3.51 and
-3.50, and tags patch releases off it. Superseded branches keep receiving
them: 3.44.5 and 3.42.1 were released in mid-2025, long after 3.50 was
current. So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/sqlite/sqlite/tree/branch-3.53

Checked the whole current series. 3.53.1 (May 05 2026) through 3.53.4 (Jul
24 2026) are almost entirely memory-safety and corruption-handling fixes:
five out-of-bounds reads, two buffer overreads or overwrites, two integer
overflows, hot-journal rollback with a zeroed super-journal record, safer
double-to-int64 conversion, and mutex acquisition added to a batch of
sqlite3_* entry points. 3.53.0 (Apr 09 2026) opens the series and does add
API surface, confirming X.Y.0 bumps must stay outside the regex.

Two additive exceptions in 3.53.4, neither touching the core library ABI:
the SQLITE_SHELL_EDITION compile-time option for the CLI, and
sqlite3_intck_register() in the incremental integrity-check extension.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.38.2 -> 3.38.3 -> 3.38.5 and
scarthgap 3.45.1 -> 3.45.3. wrynose is at 3.51.3 with no in-series bump
yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support=
/sqlite/sqlite3.inc
index 94dbc38ec5..8791749dc8 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]=
*)+)\.html"
=20
 CVE_PRODUCT =3D "sqlite"
=20
-inherit pkgconfig siteinfo
+inherit pkgconfig siteinfo upstream-stable-release-point
=20
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext"

