Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA47C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5294.1785500741652086570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=fJnFy1z0;
 spf=pass (domain: ericsson.com, ip: 52.101.70.39, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAz6TtoEk6+sfi1yahqNllatZPu0uTJycvUSuDPdAv3lCV6YDkJzPgSb1nZg3/r1dd7Ur+hz3iDpAXSiyiOaMEP/7fwV2Q/5HGLGrAGbFIGuoY2CkQeSME3s/n01iaiVX42QaNGTHx+4bgloGbj4dVITh6rmsWX0xU5h8UVsdhJ+PpSwB9fnuUT/OyKsBXNSlLZKUvIAU8wzJRjLWRqRPYdvuim66fcCwss7NjlcidepRbrJ9+AAvTf3sj7vGrdCG/wxHquEEuu14bDRZ/jJaEKzbJ7ysoOHHJ7/yb/9OiUQ+NS+iWVoySWBxndFzi3I3EqlFCwn8WLOpPqg4pYFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAkRwJr8c4kC6e2YD9vYM+Q3cMqZ4mAtBTO657KYvfA=;
 b=gusmsm8Msg9nw6iwFLtJ9W622X8044940kgSCukqmE/Jd9vGCDJ07jQ/O/J4ZszrNmszV1vOwhf+hUGVo8mAVgcWNx8uLrzJh2kqX58ASAFrD5SwP2Cs5hbBJQ6HU/NPkBBoXEhH5L2zgaqg7nMmYBe1xRL9aqOHFIUsYBnSpRmxmirgIS0Z+Mlj7jBY7pQ9q0vpIdOGQotr6vo7zhrzrT6WW/OyKkiQvLUT1hj2/8SxL14YoNnV62hr+bK+WXSFVTy9Jk1fWZo1FqELKp9feIpNqtlhGZdjWcK0aiyG402DjpNKMMLdhgYx4swpcayewmWgy0xRvn9AvGkN3RiBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAkRwJr8c4kC6e2YD9vYM+Q3cMqZ4mAtBTO657KYvfA=;
 b=fJnFy1z0C0faxYRtPtDAsPzO5xehTOo0SzxwesticruYAhN0Qb843+n0F8woIFIMcMescHuhqKgxXeaEDtFRDrvCgRDOOnx9E5pk7hYBN0xGC01IYOOXTwZq+VbuGRQJ6YG/In5Wyvow2xXiVmmz83ATG7Upo7CSzlzL4Lx5Pu2Uoub6lyO4vv6LjFB48ILMyQyOnjhAtBwnsuKGNl0p2TTIOozi8pnbMVD4k9pYhHlg0twMqqI+5SxlPoYILw4wGrnUqUml+gfYCynQkSjbFQxLdcCsIOLNQYGY5OS3FwhbE7R/+yKBY3jU7aqyVHkPllWWN9qq9Fali1xtQdWCpg==
Received: from DUZPR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::26) by DBAPR07MB6967.eurprd07.prod.outlook.com
 (2603:10a6:10:192::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.11; Fri, 31 Jul
 2026 12:25:36 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::38) by DUZPR01CA0144.outlook.office365.com
 (2603:10a6:10:4bd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 12:25:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 31 Jul 2026 12:25:36 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 1A2694020C02;
	Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 5F238700DF51; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 6/7] git: inherit upstream-stable-release-point
Date: Fri, 31 Jul 2026 14:25:21 +0200
Message-ID: <20260731122522.1647968-7-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731122522.1647968-1-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|DBAPR07MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: b361b9a2-8fb0-42b1-8a42-08deeefed344
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|13003099007|6133799003|56012099006|10067099003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ulCniCC3ktTD9gwRoYMdu64exWTMShr51NZMJ5W5pCrXR3Vf+KmnMkx4HJ0+n9AiECiA1Cqdtk3/CiD4/1HNE1BGeRHky4fYjLcoVsjTJfbSnZPDpRldV6nZcFOLk3sHegeH9cDOa4GdIXL1v5WE3cQ1MW6QAqCQBT2bo2I6ldvKpB8lkHCNvcBwnYBm60uo88uO4lJkWbc+J/tncjRzJrfZRNHKXkgGDaihXFw6V/PPuvRMbBbTvEhabpwm4GmRbGeilTSbqLftSllo9rz6nGBf3U23qJkRdlpnGHGaTD/SRnNr4dWRv9Mm5OdOckUcTDP0YZR4Bz0PZTauWtPk8tHvfc60dM8Et/plciwQrOpzHyUZqQf105GD6ptzj8PYcmksayCN4pUaukLNcUFJGje1f/lVTMxzVugofZKH633x03oEfNbn4LRF6Xb1YS3YSBfycI5gBhC32LTVgWelaceWr8zIqZCOxzft42ms2SKW7eDcLZ23XMrLTwd+IjvS0siSuX1/JhvGUKBbjd8zj8SG+J/f7kMkERZMc21mK9COMV4evj1lZ6eqmip7D8PGwKCCA7PSEfRK6Mw2SAtNuqJae56knWTcAu9vQAdr6+aQVSCqNcsFRGu5TS29jvKJu3dQeZo+c61jMOofDxPAOBN4J+y/ZQA1T0iYPlgiLdU=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U2IQ2Pecn4jX3ycuIfLF2MOI5y1hzSyGgUOCyVnodUXxtJmAp+i1x1MT32W4T+afFnjd4Elkz5NrcDj2J59hktDva7P23Cx07EbZQvlShF581NNsrakRShM34vNQnRE6yszBsPZtCzRgqv+MPD9abdQSa2cdnelZ+LBPWRatGJz/dR3ea/aZ+JQTZYhhaTue8TiNOIzZC1BNEkAD8VwJVVSEBV6nLPHRaXkAwOvYKTG5QW7EoeoHE6kUiG4bDmB5rW8V+N1R9KFkRrkGEuRnfWsdeLbllIRatBjisoXz1CNKgH1FG99Et54d/az4JaGIy97oZrrIkXAmjegm+zyNozPYCGUUKDFq7fFvRRsiz5N+jD29viS9eOZhW2dJv/xuppsZTLKshF7qKec/TkAA8aFmkSZ8TL8cWUvYBZnPVlUssX+4t6VivpwoZDtfnzta
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:36.5926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b361b9a2-8fb0-42b1-8a42-08deeefed344
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6967
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242435

From: Daniel Turull <daniel.turull@ericsson.com>

Git's maintainer documentation defines the version scheme explicitly:
vX.Y.0 are feature releases carrying bugfixes and enhancements in any
area, while vX.Y.Z (Z>0) maintenance releases "contain only bugfixes for
the corresponding vX.Y.0 feature release and earlier maintenance
releases". So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/git/git/blob/v2.55.0/Documentation/howto/maintain-git.=
adoc#L47

Checked recent maintenance releases for feature creep:

  2.44.4 (May 28 2025): CVE fixes only, seven of them, merged up from the
  fixes that appeared in v2.43.7. The release notes contain nothing else.
  2.35.7 (Feb 06 2023): four fixes -- two libcurl portability fixes, and
  two symlink-escape fixes in apply and clone back-merged from older
  maintenance lines.

No 2.55.x point release exists yet, 2.55.0 being the current tip, so this
relies on the documented policy plus the historical pattern above rather
than a same-series point release. The ref-manual admits that basis: a
recipe may qualify on clear historical evidence that a class of bump is
bugfix-only (ref-manual, "Criteria for Qualifying Upstreams").

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 2.35.2 -> 2.35.7,
five point bumps, and scarthgap 2.44.0 -> 2.44.4, three point bumps.
wrynose ships 2.53.0 as its initial version with no bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-devtools/git/git_2.55.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.55.0.bb b/meta/recipes-devtool=
s/git/git_2.55.0.bb
index 426cc13371..ecb7a8e1d1 100644
--- a/meta/recipes-devtools/git/git_2.55.0.bb
+++ b/meta/recipes-devtools/git/git_2.55.0.bb
@@ -46,6 +46,10 @@ EXTRA_OECONF:append:class-native =3D " --with-gitconfig=
=3D/etc/gitconfig "
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep perlnative bash-completion manpages
=20
+# Git's maintainer docs define vX.Y.Z (Z>0) maintenance releases as
+# bugfix-only, scoped to the corresponding vX.Y.0 feature release.
+inherit upstream-stable-release-point
+
 EXTRA_OEMAKE =3D "NO_RUST=3D1 NO_PYTHON=3D1 CFLAGS=3D'${CFLAGS}' LDFLAGS=
=3D'${LDFLAGS}'"
 EXTRA_OEMAKE +=3D "'PERL_PATH=3D/usr/bin/env perl'"
 EXTRA_OEMAKE +=3D "COMPUTE_HEADER_DEPENDENCIES=3Dno"

