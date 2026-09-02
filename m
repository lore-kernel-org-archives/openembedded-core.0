Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07178C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:00:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9258.1788343209327213504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=HfokAtqC;
 spf=pass (domain: ericsson.com, ip: 52.101.84.40, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2Vjk77QMbbbyA+Gh2Kp+irdUorUqFJmOH/Au1mtQ9dMKjZkIEiBhR4XpJaP1SSdyALU1P8ZTlvyEfMIc4wl10i/MZQ14IZ9DHUu1ryozOtMycLdvG1Eyjr5suRnDJKjG/FVpJD0WZVIOrJ+QRA6OxvzIlhHVfIh8lLL7LggZB1gbBc1s9osnCmooRyT+g/T6FyA+bkpRhxKDsXXr5YFi8pmC/MDlj50Lg31098astOa3feaWAoWNcFAveuxJ9FMnaGOyyL08dIvd+ZI8BIvo54s4SH/sWfeaS7j/zjd5a8sPLTN4Hsp2T7Gr5qiZJg64+1SJe07GAxS0aK1bF4QJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg7XkX7ZonmnEsP6zg7UVjuNqqmb3WU/Up9MEYX11ME=;
 b=S2GTz3v2u7kolweqLXTunfyyWc3foqLUrGSZTfktOe8lf1WOujdrWdyVpe4Z4uMWNua6hXxnIDS0RAfBooDJOHE0Dj5Nh+BD+ypeaePKbv7qSXNk134aC38Sz4OzYt3KuQelVTSUE7i/a03BUlQtGMRxBdCnZFU/BQizrb2R+uICC3xorQ/JDl7GZYkR9ggq3ggkh6uuoejyfoRDB7nItPO93EMKAInmc7cBVDLeq049XSRX7dQgrCsJk6RrMJbOpcKcCoHuPJyqQr2RH2GSas6w39LdbUnay+ZbrbNzoiL8wXVaF5BPAvI782MaCEy6H9LdjDNzLLi892FRc4GQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg7XkX7ZonmnEsP6zg7UVjuNqqmb3WU/Up9MEYX11ME=;
 b=HfokAtqCqJKQ3ChM4AXKBZSzXo8euyJytvYc8eulo/NUfYxTnHukR50PnPSF08F61YwGIjy2E97EdY1fZHf4ZA37aOO2Z+9r5axd9OOWFZp83kfIOnMUg/e63SHNFc3RLcTGtUNsGotFI57ilWIQsVQBoteBZ5NqP6Sgow4t/6QdzJtUD51LJtFLNSVNf+0OWQ4/RdaR/u8i+ebJ3QAYK/s3PjYMU5daq5EZH+wNTkLzbNmVS8YjWtoj+JIkCYFCsi+8wkPqhPUmx4byf37v9cwOPsWado6DNSrGc8seQSLz8M47VUv57anY0ax8OmAi1ORhlbeIQ73QpYOZsWGTOw==
Received: from AS4P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::15)
 by AM8PR07MB8169.eurprd07.prod.outlook.com (2603:10a6:20b:320::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:00:04 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::4e) by AS4P189CA0012.outlook.office365.com
 (2603:10a6:20b:5d7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 10:00:03 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:34 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 671B84020EAC;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 8BBDE70044D9; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 19/20] babeltrace2: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:19 +0200
Message-ID: <20260902095920.2840293-20-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|AM8PR07MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: c795c0c4-ab9d-4ec6-03ee-08df08d8f5da
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EU3meP9gef4ePAS/QjdkRTp0JAVlWpMyMP1wyCqj0hYlAseOIuKAN8x7YI4zNRs733SkARi02xMwjE5i9jiWd4JpObUmOgk3lifsWHL+OHA2Mzls3hNYOeIp6hDASRAWQtk/aKCLS401kHOFoVt2XCkEKFYqcV/VglrbWNQK9zvEJb/tIuESzgivSJpPKaPWngY+291K6JrTjKNGQYM38m5+wt7WUQFXraOPQD6kK3ZKs4z5Sb65uKwjbJ1NA+vmSR9e4NLiyQNVT5jYx7UJ1W/rvjA9vf4g32Gs7zdn6koF2QBaqto+LDOTmLPdBHMwbjODrBdQIcyY+0K0P7F2atz5gMrZTywTOlFWvSskpDVpBdA5ZpB03vMExP75Q/6QjPQIxw3Rj64MpjyQgG7gcebM22Vd45SW+qO/l65qAHWvfBayWhxP4a2swZ+xo8rgjySiJgn/vQaUUFyzvIVz0PJmnufT9OLAhHQ56nMu0zhlAbtAaqcHzk4ybshEcxTxaAfMtj0b2thgfOlChIcmBG73+6sgjBmm+Udf4/bbvcFi7pfwwr1W9KltsBpwWR2Bc3TwB90URlXWpa1FosEnSdZPVAv0u9GqM1hr+8LxMkHKTte38R1h81puSbQ4zqMJdgO0T4BICaBVuvodcUZ9abAX7Yis9zSlSaNm68RNeWE=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b62P1MbUj5JcsQOQRcBfuOtwkebGMQDvJPj4w3GIh4WJ7M1QsCGvZlcPNa33FI3s51ZgnMUiIc+Sxa+/KH35B1gebBUU5forFxzj1D/P+gu0F+9/hWqK9SiG3WrZFNgcwXqNS9HXbJAyxKOPtu+vDnIeGzhHOyzJuVuu+i4wzpv6wUdN/bJWp/G0Ls2tu/N4SpYbBl5PqO1faJI6DgR9cdXum2csyj28YowhGGfKM8ZX1MUPgBNiUPEr1UTimioYwWA3ox05iduhbVvCFVKuum57s747uxGsAnTOBsPOF143m/2QIK2GHyxCrFPvTSB+OJXZg9CVLYNKADPXwewybDDsCN9MYBrCaXO3dPQ1ght7jZWZ/Z99nDO4ua645Mg76Y1y8ZFnid6PPvYX60EsHA4imS24yBlFlqClRRXJXrsm4KU6vujjCo+FLpc+fS26
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:00:03.9945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c795c0c4-ab9d-4ec6-03ee-08df08d8f5da
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 10:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244927

From: Daniel Turull <daniel.turull@ericsson.com>

babeltrace2 maintains a branch per minor series (stable-2.0, stable-2.1)
and keeps the older one alive: 2.0.7 and 2.1.2 were released the same day
in July 2025, with 2.1.1 already out since April. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). There is no written
policy document, so qualification rests on that branch structure and the
release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/efficios/babeltrace/tree/stable-2.1

Upstream keeps a ChangeLog with a per-release entry list. Both point
releases in the current series are fixes, tests and documentation: 2.1.2
(Jul 22 2025) is 13 commits, and 2.1.1 (Apr 14 2025) 10.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.0.4 -> 2.0.5 and scarthgap
2.0.5 -> 2.0.6. wrynose has taken none and sits at 2.1.2.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d742fa47d795b6b013d5ca3d78f0dd601432832)
---
 meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb b/meta/recipes-=
kernel/lttng/babeltrace2_2.1.2.bb
index b0cd6efde1..5b9c02b0c2 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -19,7 +19,9 @@ SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=
=3Dstable-2.1;protocol=3Dhttp
 SRCREV =3D "d0e946a71faf5f0c2d7f1fb5b92a369983e9cf10"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)+)$"
=20
-inherit autotools pkgconfig ptest setuptools3-base
+# babeltrace2 publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches.
+inherit autotools pkgconfig ptest setuptools3-base upstream-stable-release=
-point
=20
 EXTRA_OECONF =3D "--disable-debug-info --disable-Werror --enable-python-pl=
ugins --enable-python-bindings"
=20

