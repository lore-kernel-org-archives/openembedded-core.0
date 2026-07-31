Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92018C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5305.1785500755408662987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=QONWl4m9;
 spf=pass (domain: ericsson.com, ip: 52.101.83.27, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+NiM2extHkbyh6N+r4PtcgsrisBh350df6ZFSo2jIN+lnb94xcyrUZouMSrUDiswrdAx8uUsSsUSXPQnLRmHrLky7D2Irf/hZk4dt03kKiURDn1vBSxWjcbmGi5zqm49lxAQPx/3rmL91hbmtMI3Iio5yZVpiEj9X3hXkWgOn0wSbZWKR5XBBy4V//XNM3BELYtF8wIZ3cfTk2w9agv6PhzQCMYVhV5rNPbpQOj2Dm437aXls6N8/aOspOSwIl78fCPraIlur0pPFOOQcRkyUD2oCYpmA+/1BazTZmf10s8AUgo/ln8xk3RoAP7MbVuiK2PoKEaen8xQmlTtf3hBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDPDmVSQ7WBel52MoYX+mueeEpcz32xJfShJmlFz7vI=;
 b=RyL0g7aegGrUeSMIli97yE39syOxZNgLhdhJHZYSmVzuAaZCAnLYFyQrEIhY8zeH90JMVaW6CIjS3Nd5SKx8ZwkjU5ShGKu5S1CCvLsvnGI+zJtMzb4cKBJ3S6wdTj7IFJrpMLLQItUAyVud59wuVoA8IdC3qlCsTdps+ebkPDElfoD3tbS0oF/lSc/RBVq7BzNEuv4pZLMfD/9RKDU4VfrMHRt/KJeokulmNbQkroSVjrNJXJicSG4GKJkQTpOV5P33uB040QO7Ljrg26Wu0T1RPciZIhdPPfqbDyZPclXosP+MvZmgg7l70i8v+vIVliqZIJJ5yDK5xuBSWUOXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDPDmVSQ7WBel52MoYX+mueeEpcz32xJfShJmlFz7vI=;
 b=QONWl4m9PMBVcvjqBzsJe3Qp1O9mEdBQkroswWQq6/k6w7VBcuuqC0qOcFMRcC+ZFfIDTZnCwtoHn9MgHrjT32AU1+QKvhsSiEj+lo4hHy7YjMQ239hAeK+uHJyZ4fcmA4FlVxIuAOdckSz443Ha40gfKkKzpffCbKHq+cKlN/s9nZlBSvFmm6SBEvTRu3vUDEykpQY+tFmjbjVthvOahNle6IUWbaXec56Z+nPcYVdR3sW+vHlqmGVlOU4DyFiS7kYXQ9tAExFTg1Tsks+P3vjBlLc8XpnteM5FlbhZeur01JlhVYFCbZb63NWeQ373LV0/zO6StPO8yTwTMA8WLQ==
Received: from DU2PR04CA0359.eurprd04.prod.outlook.com (2603:10a6:10:2b4::26)
 by GV1PR07MB10143.eurprd07.prod.outlook.com (2603:10a6:150:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 12:25:46 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::28) by DU2PR04CA0359.outlook.office365.com
 (2603:10a6:10:2b4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 12:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 12:25:46 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:45 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 57DED9987A;
	Fri, 31 Jul 2026 14:25:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 639C0700DF53; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 7/7] perl: inherit upstream-stable-release-point
Date: Fri, 31 Jul 2026 14:25:22 +0200
Message-ID: <20260731122522.1647968-8-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731122522.1647968-1-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|GV1PR07MB10143:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7efe8f-67a7-415a-93ff-08deeefed91f
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|13003099007|6133799003|11063799006|56012099006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YzZdJ+qiTQozXvGfVpNaiPoUWThJ7PWaeUz0Win52PTtp+7D0b7heI/PxknDqlqb8dg4hl6op2gFM9TsBP2IH1Iiz5qG7ozsiJAjxCOaJX49kdfeB+9QAFj+oCsbeCLU6QV3RQrzpLsrKRGlsJ1m+zH+57uto4bgmRZVvMSehjs9vc1IvsRfZvyxVMUJ/vg2GQFmGHM/YWfM3x2HOGGCpPl2IUNm+c7Diy7+Ez8Zvcjam4zdlYow8camioXnNZC0F176hXkeS+8D3fuUceQrZFMSQSltcfRSFu8SMU+axDgty66BjsKYMxh97tAPfJzF+lIH76p6Nc72AQ+oOyhnsdQry2kO0nvWP/unNnKRxdBfXbRjuaizXG6ifSdk4C14vYWYv1MU68geLRzc+tHjuKrwlxRg6G7sBgygsdkwpI7AO+xbYJb9SkJmn0n2f3wZTsQB+C+wMQ1z1dFP2tO2357TTzol8L3YLN1jXTjFj5s1+yg7cqnRldkXz+6iSjWQ2KjSGYJRHEVaX0s+YTBCWqGBZjwfrcK2biyaSKwgC7lpLx+zY8qV47WA47sfwI4JCrkUX9GzaBFM8eO/NLt1uic9q38hkhAAIcz6cb7kH2zYT5KRwjtDh6Pg/CnCFQlQskipsh2wCdDCYEu9N+p1JA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(13003099007)(6133799003)(11063799006)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6H/a4qU//I2gJE0QnchpdzT9KcTHwUFhWabhRkH0vsfoZJw/lEYhn26wgG55A784DH3+mFzVlewhyA1sXrANaCDL6QglLtRRjeTL8Ffp/9h94sTZU1q+LBw5cHibxTUJ7yRq0lrzxx5j6hiD9s2YWWq3N+YEQm3rYSEGbXOgNIJ4XBmEf4Xi4eOXPMXQPVT6/xjGfMJ09n0YntokKtmo3fX1oDI+zkICdHggyFvyQMCYcKXFZJvHD4Utb4F9jG4Zs8Gv9QeaW3zjsQ1Qh+mul72O8eNBxryIMlVdSLhDXq3yJlUQhhJWg5Q60WB3URr/Ofnx7vOGDY36nVtwOcgVkwEbPRpQVFJ1Nf0wbLkgQsNUzGzB5A1+gFSPFmPKKzrQGtWx2DIaScpxTY1irsQ2KiO8fiLHioV9waQi9WpScrJp3H4dA5IiyH1WFwsdEvtt
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:46.4132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7efe8f-67a7-415a-93ff-08deeefed91f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB10143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242441

From: Daniel Turull <daniel.turull@ericsson.com>

perlpolicy documents a strict maintenance-branch policy: new releases of
a maint branch may only contain security/CVE fixes, crashing bugs,
regressions, build and install blockers, portability fixes and factual
documentation corrections, and must not contain patches that "add or
remove features", "break binary compatibility", or "add new warnings or
errors or deprecate features". New dual-life module versions are
explicitly deferred to the next stable series. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). Long-lived
per-even-minor maint branches back this up, maint-5.6 through maint-5.42,
with a documented back-porting vote process.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/Perl/perl5/blob/v5.42.2/pod/perlpolicy.pod#L259

Checked the last two point releases for feature creep. perldelta makes
this easy to see, as maint releases carry no "Core Enhancements" section
at all:

  5.42.2 (Mar 29 2026): one CVE in a vendored dependency, CVE-2026-4176
  in Compress::Raw::Zlib, plus module version bumps. States "There are no
  changes intentionally incompatible with 5.42.1".
  5.42.1 (Mar 08 2026): four fixes -- a Configure fix so POSIX locale
  values can be passed in for cross-compilation, an AIX thread-safe
  locale workaround, a Win32 build fix, and module version bumps. States
  "There are no changes intentionally incompatible with Perl 5.42.0".
  5.42.0 (Jul 02 2025) is the series-opening release, not a point
  release: it adds seven language-level features, confirming X.Y.0 bumps
  are feature bumps that must stay outside the regex.

Cross-checked the previous series the same way: 5.40.1, 5.40.2 and 5.40.3
all show the same profile, with security, module, documentation, test and
bug-fix sections only and no Core Enhancements.

The policy forbidding binary-compatibility breaks in maint releases also
covers the ABI concern directly.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 5.34.1 -> 5.34.3 and
scarthgap 5.38.2 -> 5.38.4 are both in-series point bumps. wrynose is
still at 5.42.0 while master is at 5.42.2, so it is missing the
CVE-2026-4176 fix -- exactly the tracking gap --stable is meant to close.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-devtools/perl/perl_5.44.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.44.0.bb b/meta/recipes-devto=
ols/perl/perl_5.44.0.bb
index a449b904fa..ef76df7e0f 100644
--- a/meta/recipes-devtools/perl/perl_5.44.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -27,7 +27,7 @@ SRC_URI[perl.sha256sum] =3D "3b855066b92491cb40e86affb1ca=
57d1a388aa43e51b91c7806a3
=20
 B =3D "${WORKDIR}/perl-${PV}-build"
=20
-inherit upstream-version-is-even update-alternatives
+inherit upstream-version-is-even update-alternatives upstream-stable-relea=
se-point
=20
 DEPENDS +=3D "perlcross-native bzip2 zlib virtual/crypt"
 DEPENDS:append:class-native =3D " bzip2-replacement-native"

