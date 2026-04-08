Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87523FF513A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 02:24:19 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97549.1775615053074653922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 19:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UV7QuNdw;
 spf=pass (domain: axis.com, ip: 52.101.72.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLSkhFOC994nmplo7XTtCx/X7Z6hbAlalI50mUvLtSArszqoZdQYOiLTnL+ng4HQiO+vu/D5SFbkZlnzg5jWWtcXVJj9y46/vlVUlvC4GmsmjwiaHi0GD2hyhJZHZgaUfXjZDgFyO+ZfoD5zXcGsUg7sv3dhkfLdpPOTD2uNL3+ByREN4BblaTdq7ABbuXnTFr5Pmx8FHx7ttGbsN69xxXJvj0+bOUIAN54nDxn4VhVOJzlc0snRpO8LCREFlgu7c4V9sdDf/1umuBP34l5QwxixCLtebV4ycDvtDVjPDpC4Vf2lTieX7VexlsMg9eOxry+6l4QtJ9nAd20s3O+D/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TU1HogYw3fSSQtmDdGMeJZtTj0gZxa5Ao4mIV+gxxEE=;
 b=YO93jUgQHEhoWDyFd44ffAVgupISzL/X8sqjl4ZWgmmUl3xu4eI9ZYpCqjSz4pOX8OMY6MPfNrhxG/eFGR3mt525FmoJLulr0T2GTM0t8HdgXM6U3o7pA+XZ2YdMEpEXaUrOFjyoxpCQUfeOZgLPOX29XmRkIEUajmnF0AKmfoArM+WeVWRGWglqsSidfDF4XTkTPB01qX+C4GfMWlQm+qRBREA3mB9tgQYPkZ8LAd4ERjTisznCg2tmjNXwJipMij2Wa63HV8zhEV3mDkptkw1kGP/6Tm2hwFydAWf5+p3552m0IYaAHTj0kNTvKBwzQ5aV1AI6PwFCM/kpNoe7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU1HogYw3fSSQtmDdGMeJZtTj0gZxa5Ao4mIV+gxxEE=;
 b=UV7QuNdwnzJW6qpZrZNrG8dea2XVGXuFwbVH1S+RmmILfBhj89azHF2mZCRGWx3DggmVNGuMgvfOh1DE+/0NWFNYb8Bkv51CaTmjANQVrLLYhJe9Q4w0szJlvRnI/lojlhaKOL7gz9mY9eoC7zHlPdkcbfhCPlE0wC9UOjVPo4Q=
Received: from DUZP191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::9) by
 DU0PR02MB9169.eurprd02.prod.outlook.com (2603:10a6:10:464::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Wed, 8 Apr 2026 02:24:06 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::94) by DUZP191CA0011.outlook.office365.com
 (2603:10a6:10:4f9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 02:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 02:24:05 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 04:24:05 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 04:24:05 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 04:24:05 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0FE9A18A3
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 04:24:05 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 046F012063F; Wed,  8 Apr 2026 04:24:04 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gstreamer1.0-plugins-bad: Add fdkaac as a package feature
Date: Wed, 8 Apr 2026 04:24:03 +0200
Message-ID: <20260408022403.1784405-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|DU0PR02MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afd8d96-e3fa-46d3-420b-08de9515e83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aqYrCsLlLdbtkwOqE2S+W8+uhi85+zSWW6FTsfT/tNs2v8695nyUHyAR+LR2NNqXWWf7547HBDaVc7B/dSvYY1BoBRoLGUHLbXTUZKJ+q4qpE+kL1jxVAjUts5a+O3Bxg4sDYyCc545v4s2P2DfdoB1anh67oYLUjQaRLSrTLj8wHrw6npufzs9lhCp5KEpEjJQvb5geic+1QKdiwLa6XpQTHA2f0TGqBd6EdUy5g2TT+R+y8bAAfqgaItTZGVMwIOhy8dWienpUpRXkw7X++vA7dzFP1zAoWa1iFa+IgcGrWswq3jlxqfy89AzMYOC1urCdY2HoRgH6PT+l1D4196r8Sydz7f5nHE8ODYc5P2LFv0OqOzh44j3wJtTiDGyi2hlfS9QaY1pwKpeuuWb0HXjgVDLGoqjZ50NVeTRx+N6CoYllebTzR3WyvEg05vQvfye/rTnRJm67XC8XDltLGqGvUGh2CedmznTsT0VtzgGGikwW2jjn33HrDFO82PZeZou7ilLivUGqV5DizUiwZKpIkFQP63G078SesGAQuZK7XN7MLaG2tMHUlniM6XqA5npeGmuWv38bUy/kk8+nrbkFubsaADPwz3odMIfFQKN6cvKZ1Coha6AhIjueAWF7qCKTfKIVxBZ0A6BHW+7T2mKO/nyf2Ep57SZMpYzMyXS5ASjuwtwQsk0r0V1o3gxXmmu7U7cKrWTd7dhSQmchzZYHEEt4h6YU9HIW3W/bULZaDhWMzkML8MtIPkfnUNss5X7XN1WMMxUhYGIpky1Urg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RnVNxR7c8dA78ArCd0CJ014b7U0LHglnIlOburHZp/lrkYTxdaQrbDPD7oS1DpMv3PpzG3lfzoe4kuZOQ0Ys7ovCnshp8AFHsW6ddZqVHkaSDT3zJENTZqU20dDsonWBt/3FutoiLP6W2ilH8ZRkhT92WIFSqT9LRChy7LvvKAP2KnFjo0jfWallC+pPf6d78s/rejdHITLnEdxjAQdK4Q8dluvdxUV0CtdgCQJBE0x4hw1+EiTO2J7Xqlc/E02iet/TU1hY4qpJs1UuWtCbclePdCPkI0sWhvdyOtk8xt9sgfwi1w7MWvxhilTasutm9S6c8dbcuWf3aIbiWmW0R91z/jNAlsYTZ7SPlK8DrVnEbwBFrmVmwF9CiSz3qVXzENZFOrE4A3TLQvGo4YkernfMVLCrJa6492RMZ6EiK1/+FGD3aC3wXP4TE/S3JHlg
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 02:24:05.6005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afd8d96-e3fa-46d3-420b-08de9515e83f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 02:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234792

This adds support for building gstfdkaac, which is the GStreamer element
that wraps the fdk-aac AAC encoding library from Fraunhofer. fdk-aac is
available in meta-multimedia.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
6.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.=
bb
index 4a9cb37dd8..37e6e9cbae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
@@ -46,6 +46,7 @@ PACKAGECONFIG[directfb]        =3D "-Ddirectfb=3Denabled,=
-Ddirectfb=3Ddisabled,directf
 PACKAGECONFIG[dtls]            =3D "-Ddtls=3Denabled,-Ddtls=3Ddisabled,ope=
nssl"
 PACKAGECONFIG[faac]            =3D "-Dfaac=3Denabled,-Dfaac=3Ddisabled,faa=
c"
 PACKAGECONFIG[faad]            =3D "-Dfaad=3Denabled,-Dfaad=3Ddisabled,faa=
d2"
+PACKAGECONFIG[fdkaac]          =3D "-Dfdkaac=3Denabled,-Dfdkaac=3Ddisabled=
,fdk-aac"
 PACKAGECONFIG[fluidsynth]      =3D "-Dfluidsynth=3Denabled,-Dfluidsynth=3D=
disabled,fluidsynth"
 PACKAGECONFIG[gtk3]            =3D "-Dgtk3=3Denabled,-Dgtk3=3Ddisabled,gtk=
3+"
 PACKAGECONFIG[hls]             =3D "-Dhls=3Denabled,-Dhls=3Ddisabled,"
@@ -120,7 +121,6 @@ EXTRA_OEMESON +=3D " \
     -Dd3d11=3Ddisabled \
     -Ddirectsound=3Ddisabled \
     -Ddts=3Ddisabled \
-    -Dfdkaac=3Ddisabled \
     -Dflite=3Ddisabled \
     -Dgme=3Ddisabled \
     -Dgs=3Ddisabled \

