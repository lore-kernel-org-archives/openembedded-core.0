Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5AAC79F84
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8947.1788343178171641784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 02:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=Y27uIJuu;
 spf=pass (domain: ericsson.com, ip: 40.107.159.11, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYvxGvRoENEAgyQ90UefEaxwwtB4OLtLEIf98IG1QSr6yd9ZNjUZOI8CaqtoOUuPZnMvTG2w71lqYhz4BUwsHLJo9v88Dsf6HjcCmz6ZgcLmwQSOhRjpaqakvExFpB1F+Nq5paglUxKBwbLwKSZfzoM0VxFkzDQLeZdM8xAfmhkvmbErmIaf2ZpwgoBxSF5d1T8lwbeF1nlCph1ah0v7lIj7Cf0th7ydaV0FjeOlihNtExAf9BzVdDq3pgH6if0vyKV7igKJHi1P8kJ0GrPM+1ElwmkEz2DPwn7b8n+14tWx4IiSxpTyyLTlCFMbsQXV/7Je8Z33pD8H6og3ShXIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSsvmO4y9Ua5d/ZUPholzWLVqoL5Y3uYCUci3nlNFlA=;
 b=NlkF8AI7GvJlgno8AmX4GAVvK2Jf8vJ+RGs7GgDTh+2jOrBlRtiA0MU95ttPxPpmJByCmqMMWFhYlCo4UJOpkRcP58h0pik8Vwl79Bmf87oO829IegL5Z2Y6uC0l7vySN7DDZPf/iLohKJAmOoPtD2hhs/VI0/yXWENi/ywcOsvrSsmGgAfeeCfSUoxintXh/nIuvJYsEZ3GtRpJ/VYd/Gp5klESxsEnv3+SvohaIUHE0a2N0IrbncrdT42mqLjgf5pHnxcOS4bTTu2UNQfIvpxSVtbF5sTJEeUo1hNXemdOQjcS1M1iptH6xAE/joEOM3bixn/mAM3tVc9WUrh6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSsvmO4y9Ua5d/ZUPholzWLVqoL5Y3uYCUci3nlNFlA=;
 b=Y27uIJuuuiTWhb/kMfukRyYi9nxNvTUourBUXg+uXqoYhxHK4SzOpAp8c0dlEsfT1VQ6o5hFHWS0vONWe5qHhbzp5MLMpohTlAhVuzo60hImPyXoF63n/xbRYRixQZ8QVFNjMYRy5/SQ9VkqT2WHcrHLDbHJ79htVMTqzVtS2/JLTcTSCbr5qlalPtrk8nKbSNpqI1rbJseEeDFfXq9uwrrWxmLAKKQBatZLEnIAAR+vX+dyohxxuCA+IK/3yBgmgce2VsbSr8hheqS6ci3sN9N4I5ggFqDBXLcQhVparwbtRl9Z9qQi3OQRHQqBn2oTQv60AcUP+PwIP9lRe3Howw==
Received: from AM9P193CA0030.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::35)
 by AS8PR07MB7991.eurprd07.prod.outlook.com (2603:10a6:20b:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:59:34 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::52) by AM9P193CA0030.outlook.office365.com
 (2603:10a6:20b:21e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 09:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 09:59:34 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 2 Sep 2026 11:59:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 1B0F595805;
	Wed,  2 Sep 2026 11:59:33 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 71304700E7CE; Wed,  2 Sep 2026 11:59:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: [wrynose][PATCH 13/20] binutils: inherit upstream-stable-release-point
Date: Wed, 2 Sep 2026 11:59:13 +0200
Message-ID: <20260902095920.2840293-14-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902095920.2840293-1-daniel.turull@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|AS8PR07MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 336ef1c6-acb3-4a04-1c13-08df08d8e436
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|10067099003|6133799003|3023799007|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cbdntgNAtyIm054HG1BriZM4M4a+0UKPVdJEUDs+Sp1umKC2vwhRhUg3P8e/1wM1qINZPcHxKIt9C1gReBXlI3oHlt/hcnyqPSRSIhGU/FLOhdRLlRD2vd9JIQxR3mLmjpNHQaBhxlrrDYFTfVInpkwXs8kSsC2eChYyLwenxTuaHqZ4fWgZa1SGsZi1KdYAsdAnIYVgle+Rd8hUqfbpEPQCEAvPNWU8iIFCn792+j7zFzuD+/lATC27U5SgGHJl4J63+JJlcz7H8UoCsiIUMBgSTgjNIPIwJuE8kIJs5NpiEd4p571pdd6birECNNKz9DP819G5JAyx6x1XEdQPGDn75HhQfwacO1x7G7L1M7rJWmmpa5949I5G99HOwOGcpdL8rd6kXJTi9D7W86Pshk1B4dc0MBccZzaLrt7rbuF5HbotJMA/PBmPEQg6MkjQmpnM05U5IDOxbFxMYRs3BvHcdGTZTcTjfvsAPk8QCFXXYbgfote5BdmgGS7VWL5SjIV3bNHuAKwv1eF3cfVx7D84BdHRrHOLczxCk/lMCh8PGMqJWnzDylYt1UVvNzIzVMOo2+W1PdHgEgskIM14UkGwW0XhLsZG9gANCMwYoJHlHjJIudN4A1Iy0bHWGWA+cw87wSaukGvv/2WYDP9p4DDlCR0c5xq5lcHRKl5Y6dQ=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(10067099003)(6133799003)(3023799007)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oHjC2a1eSiWSR7KspCKA7Ll5ZiTmAjaHwAUe/p3oeChc//6Wx8TFWvFlMlCMY2/2n88CAHOV5Cpw1rLXQ1yTt6cpPdNISruE+ZPqbmAR8BqKyQH5djzRuVXgdfKL4mRDQDlfIO5tPnqoXjENJ85vHgYBIOYAPyZ1FQGVA21EvP5rXtlSaQDXaXql30KOvZE3AruAUuzsugQ6CokA7ogQKuqVbTCCrzVSAcw9OA2u1iktMjmodJI2L+AYVHtFOyobmgoGejnqX0PCApuBIIWc6Kxc1xQYU7Hu6+Ro2tglCkNK0IXS6jyWCccj5+NX0I7cZhapNg7d4YLzaB1X5GK71nGV7h7ItZ3N9PNT7CfCkIJ1Wl/lAxxu0MopETx0hZeeIT9uMv4ZmXx8TF358h/9+X5MGKXbg3qddqO5p5OZcCirKJRW5r0Wa6efzDQ3Fs/Q
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:59:34.4019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 336ef1c6-acb3-4a04-1c13-08df08d8e436
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7991
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244909

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e61767b8d9486c1a13f505563919654af5955a23)
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

