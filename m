Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69666C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17290.1785852713300119340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=U9j+x57C;
 spf=pass (domain: ericsson.com, ip: 52.101.69.52, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMg+QDRd/AAHra4PyykESKAsFLeZOa+veX1eWS5JG9FvuCSgEFrFXkn5JQS1J17pI9HMsIgigPLt/1ZO3YFSrC0SQwvuKClItAxxWmJY4TWAwUn4Ryna7XdP/Q6/vm45P8v4YJl43aLdtyd79JxdCTmbsWcJKMNqNtuWtdP9y2eWoqOhepdpeEEdpIGxUE/a65osxKxxAjAncJcU8Lpn05ScXeXxIXZdmFfygn5V+GAkd65npAbpiMBEwrsoSLT3qVDQVRKFO75K0q453G2n0Ci3CLfMvo/C0Nxv8rFxxm4mgl4m3g+LNUoCcS+6aT8ZszIZ566N+AT/URVrRu4X9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOWFz8WEF/j5N8RiYV+Qwwm4jAReoxBOc7979BT+fmE=;
 b=Gh/iyVJnQWXPOkKB961jmJktSfvkMms9bbGO3JQBJWjdubOA4wCvRwRePJVLsMcJt/lv1AslWWax2LKk4noBxnPHBQ/hoqHCS7gZG0mQUjGBKctuX62xr++LMJ85O6Vb8nlDsR09CGDr1hr89ismrczVzNqwXmKv6HSiYBMTD3lerfYA2n3kWQd0Cu6jA+ueqaU4fusgDWE1mxfMYGBMDHRg63TG+HyuxrqKoDY+/IO91vhBWU65tlwOX8ewknkURdu+Gl4zKbLaodOsuUZ/BLM+9Kv4H9n791zA1uHOzXZ78HE1weBKw287VfISt5xB+MS+ZNayHXYKHW/Aifipbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOWFz8WEF/j5N8RiYV+Qwwm4jAReoxBOc7979BT+fmE=;
 b=U9j+x57CE02+iKPz3tmHMafG0McxaTwBEAWVc1Z+fwOT0obXEXIf5cCQDRPbKDw5yElx1Cz6Ot57Ood21E6Ifx6IFkeYtCc9vRbg2oJRFtRSeG7EvvcNs18prBNiDXIkiz7Wr3u2w4ChV54ZijojAx8Q9Q5Wj/2ViN16Y6zp20vktEH4PPtPR228lI8p37trqzsz1zBU4QwJ7xFmAYnht8mO3PBtq4xgRGdC1ttCozXm6fQuJEpaC6Bo+QRGXVqzQ/Q/jIgKDGq1a7cr7z079GwSxKyu5ew0b+TgpL7S36Yh9PXTxc3KLpd18FU530AhgB+Fd3qr2ILPIoQCse+WxQ==
Received: from DUZPR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::21) by GV2PR07MB11525.eurprd07.prod.outlook.com
 (2603:10a6:150:2f2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:11:45 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::8c) by DUZPR01CA0157.outlook.office365.com
 (2603:10a6:10:4bd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 14:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:45 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 75A244020B42;
	Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4B966700DF4E; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 4/7] binutils: inherit upstream-stable-release-point
Date: Tue, 4 Aug 2026 16:11:32 +0200
Message-ID: <20260804141135.3779287-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|GV2PR07MB11525:EE_
X-MS-Office365-Filtering-Correlation-Id: 94dc513a-9fb1-4bff-aac8-08def23250e7
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|10067099003|11063799006|6133799003|56012099006|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	REVW84UI4w+m5P2NgLS+k5SZfS5l9UVrA6psEqcDi6dnwEcC7Us5ejEq5SVz6aHPrv9SrAy1DUEH5e1MdxZZ5YDqeEeDGbuupk+fdJVLam5P0cZak6ygGihmbUfJwl+ul3XLmwaB9TFOq4675kN8tED+NndfaKx5FQ/6PgoAHabbrWohkkiLTrpnadtbJ39itxL10Ldwkmjueu3hB1vn+BQHqWq97vchM6zI4FkqtIj1EpOowZkC8Y9RKouxW/4+M0WerjunFJa3iXHsaIw5WTIEgCjSWxEvMvVUpcknkQ6DJH/XvF3Q/OKqdH27DjsZqfPRxkaKg2fHeT27CyhwNDURmPJ8gPO+/fTLmo8mdQVi6T9fDTvXzypWUSOqEFOYTIPTUURZjythkZ9PsvPlmTp+x1nsf0fZ9nbsmSa4OClp0aWL4CdbZTLD/c5wuh5GldPaEmebepoHs8kSQ+WTISHNESh2DCLKm15/1T20JtEGSMHBo1PxhzZuz5nD6fND0uNWu9hq1dnPQGBu/D2fE9M9t+JaqxGwm6F6bAGAMZ9gSeBAyUYIqqQ6A63Ub7jX1+yPI9KeI81SWYF2KQiLtYgL35S1PqJMS8WZ5hIsM97wHaxGI9eEzFBro4IwFILRy+F8t7l56ZkSvroLFvMVug==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(10067099003)(11063799006)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	y0LLRZvNbBNHz5+o141uY9iwkh0jbOkslsuDZd2ZpMqDl/V8RYBfCLpT+AengS7PnSuilem6X2jQ+G+/un4qddtbHC42nR70KGd+dL9SAXnzQLbRyJIAA/hm5iT6wbsZ15JcG2jrnALH3cvHhbeyHk86GwcV1awCsbX5CUWQlB3RLiDgYGBN9yr1Bfwecee9d3e6krV+gwTDHH4GsZCq/+Tv0MlKLnEDV86ekZ1F1GWu68QGOC36HSI5qSvJNZfZidQuOArNym4UvV1RU6CA7lqYUDNdGbqNX/P9zhedMTmROG/9a4tWsv3Tb9VTBfPbaO9oxN1WyhSAahfGpzrVl+CtrJpWVzcfe4NJTZ1EfDH0N2owu7PD1BIqubS7m1H06Gw1e1e2sdvk5/S7rIqq5LG6KbY0qwQL3fA1wfA8/c2U8ksNJwiJIEyjr/ChmR0/
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:45.1981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94dc513a-9fb1-4bff-aac8-08def23250e7
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB11525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242772

From: Daniel Turull <daniel.turull@ericsson.com>

binutils cuts a per-X.Y stable branch, binutils-2_46-branch for the
current series, that takes only bugfixes and backported CVE fixes, and
tags X.Y.Z (Z>0) releases from it. Superseded branches stay alive: one x86
MODRM fix landed on the 2.40, 2.42 and 2.43 branches on the same day in
May 2025. So upgrades within a major.minor are stable point upgrades per
the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades"). This is not spelled out in a policy document, so qualification
rests on the branch structure and the release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dshortlog;h=3Drefs/he=
ads/binutils-2_46-branch

Checked the last two point releases. 2.46.1 (Jun 08 2026) is 137 commits,
mostly automatic version-string date bumps, with six substantive changes,
all fixes: gprof testsuite, build warnings, an sframe encoder/decoder
call-site fix, a DOS-filesystem fix and two linker fixes. 2.45.1 (Nov 10
2025) is aarch64/gas fixes to incorrectly restricted instruction
encodings, linker metadata fixes adding GLIBC_ABI_*_TLS version
dependencies to match glibc's own ABI tags, and libctf, strip and warning
fixes. Neither adds options or instruction support.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone has five or more "binutils: stable
2.38 branch update(s)" commits staying within 2.38.x, scarthgap the same
for 2.42.x, and wrynose has already taken 2.46.1.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-dev=
tools/binutils/binutils.inc
index b3d0728e4b..29c05b1a27 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -15,6 +15,11 @@ DEPENDS =3D "flex-native bison-native zlib-native gnu-co=
nfig-native autoconf-nativ
=20
 inherit autotools gettext multilib_header pkgconfig texinfo
=20
+# binutils maintains a stable branch per X.Y release (e.g. binutils-2_46-b=
ranch)
+# that only takes bugfixes and backported CVE fixes; X.Y.Z (Z>0) releases =
are
+# cut from that branch.
+inherit upstream-stable-release-point
+
 FILES:${PN} =3D " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*.so.* \

