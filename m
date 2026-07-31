Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF2EC5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5300.1785500746728503760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=i9SLM8gN;
 spf=pass (domain: ericsson.com, ip: 40.107.159.69, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4DvPTEVNascfqE/UUFkxhDc840lu1hyxNPe3Uet+EOYd4u1Ljbdg7rJ+0zCg37FObunOctkI/Uf83cdUy8fJZKn6Z4WNp3Ws4bQpLMaOV8ci1GQKrbbFoaNULgKO1k9rTdZEU10Y4bIL/CtCWpnCGhSEVmplFQkfDAATpuyyr/zhPZWmn4PaXa1zrNQ72Q/x92UNdqxyd08IyyRNV/v9ch3cw3ajwFEUtNw9P2opmnQj8eiT1KsYkPFu/2i8DXxfoHPSD6mgZXJWJUl8cf56Z2OOFz9H2AbFNsgJI4tI4kckFz0hSjMHTyELlpnFUM/9wx2j0ff2p9lUpDEGS8sCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/O7mWuibsntTN07dNUueCgIceceFr7F9pCtNAkssM0=;
 b=Xbby0+SappuaZP6nOM2OIM6ulMVEz2H9AhCzgRCeATEqHJ6WOCFNgIRN/LmMK4dngIAJkz7vQaEBHkjeR6V4bm+xAmu93xXM4ouFRvDD6JXI3Dl+nrKi7SqpLz7B8jokZfLTU5vf/+NkeAe5BQnVdm8PmBMModohkuAwSya8aggsosLedL569rxqUKwd+6GjFtTrqSER40Bi1gHKGfF7mh0Qi00sUQjrk23/BtG0x7uaRugBBdZ6M5CPLNMeRvQ0/5ZXR9oyJ1+WqCKKl9VbHqeIBTQ9Ts4O4Gt+JUVKfyrYdwzfg5d66xfynq7d5EbdS/bwSQl3CtmFBQmx64f10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/O7mWuibsntTN07dNUueCgIceceFr7F9pCtNAkssM0=;
 b=i9SLM8gNKcf75onUFFlQocfAEeDWMSftnEBbn6eqCm8KLpPEhuzy/m7YZIaSeLRJrSlkcu4R/n2MayPVv9D/fMyfYRsXV2mL/KFUp58BEmzQ1fuR7t6Tx4RutNOsFBkeShm6Qn5ctTKkWu4dFsMNJFIUQd6Lve8LTPjpm5BLydzwINwJFZ1xc8WG1WYyS9InvPDLZOOKNtGbnKg3cBgkKHxVzNvuWV6PkrhYVRVs48jY6tmz/b0vp6J+6BKxjm6GYTzED1ZN2bgayNcKIqCEjdgumYaud79CpusoKQyiyf1QFFRTFbYPbw6SyAQQnGr2q/cv+qx8zCXrLN8kmt0b0w==
Received: from AS9P309CA0023.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:45d::23)
 by GV2PR07MB9082.eurprd07.prod.outlook.com (2603:10a6:150:b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 12:25:37 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:20b:45d:cafe::a4) by AS9P309CA0023.outlook.office365.com
 (2603:10a6:20b:45d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Fri,
 31 Jul 2026 12:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 12:25:36 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 31 Jul 2026 14:25:33 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 79DB64020B6B;
	Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4E0F0700DF4B; Fri, 31 Jul 2026 14:25:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 2/7] systemd: inherit upstream-stable-release-point
Date: Fri, 31 Jul 2026 14:25:17 +0200
Message-ID: <20260731122522.1647968-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731122522.1647968-1-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|GV2PR07MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: a39ac35c-7807-4a93-4222-08deeefed383
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|22082099003|3023799007|13003099007|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	LImWxFvoPgSet0y7DKcqNw7tA3qg8+LX6VlDB7ID2YHhU2mAUPIQfHXlutVK94/AvbA9pSTXLCwsTWUfvNL3kx2ZKnRe+E38H/3iIN3rt/uKPqxYqpVC0l/Fdr3/pbkMQhwsY88LKPyBUCNtmN+7exHWpQoE6tcockN034S04aKVY/4PFf34rdB76OzlpNplBBzMp2UF3NWjDgNST2wPJtcA6FOjcO9fixcbbSmibiGWgdbr1W4+5jKrp9bfRgFmKZ46Pjrhc/H8mPUBZxWLGJiHTM+lD2SZM5wahNJU4i99W8o5T51SUh2aQcjI3sT4a2TiVHlJQTkRAJ/ceZs1GPkqJwbbRBrwtip1M5ZbwMIQa8f9T8ZCkS78fruaG4ynH8t/4e1qiQpdb5OXobCU0yzRONdqcYjaJNqtsetOsjXJJcJOkSzs1bkEh0H0ccpAvQg2L4nnoMky9CXxjJXd0jrgbCTNWXPidUAZjPp30si3GvilXwS9EgZOr0rvTxrrFv6azf+azHtkkfSJS0Q7L/tpmoY+csr9x3xikekhuLoxTg9fz+7ZNZ8YIaNBGfSVE7WTH/oIAp0ZpcEQqrCVtvxsxhgnMSIEa2UMI8B+ZxEWhVCDJa4VjaicfavTfMz0uU1B12MrGKXmNCiTOT3AHJuZx6s2edrD6YBPgwTgi3c=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(3023799007)(13003099007)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eXRSgtS6zmcXK9V86CsdPpbIPTtXuC6fYbCHdz2Q2eWq6AiiwS3xYaYz1WCQ06sofT3LEi1FCuhunjXF4pitPxSr/v+AWs80azxE1fEjVPVcW6EgJxIo3u7YZ06j03Ml+DiCr/cokBAwKriz5PchSkvsSc2Tm+BguaWUZkCS9uNznzPYS5aeNEQ7l24ihbmfazTL8ZWBviiDsatXF6dhvkgJhuFUQO1IdIDtxEAiK3jnGN5Wbwya0c0I5BoibrMpMs7EwiS3Q2AIcGKZJwH8LkmLpNmy1s7euZSxeJp9Et5YpscsrBFpONRdmQ3eRx+2MgCGeQrUB3RAK2hd2RRVqAERmVrdpIVkKPeqC1/5dLiJBK/MyzGTJTnxeI+VxoJvELaGeCL5yd29rFRkaLOnNAygMmVLZMKQvT2eNGSgKH0LpBKeMgz+LQPl3whoIesj
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:25:36.9972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a39ac35c-7807-4a93-4222-08deeefed383
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB9082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242438

From: Daniel Turull <daniel.turull@ericsson.com>

systemd's README ("STABLE BRANCHES AND BACKPORTS") documents per-release
stable branches carrying backported patches. The current one, v261-stable,
is branched in the main repository; the README still points at the
systemd-stable repository, which holds the branches up to v255. The major
is a single version part (261 -> 261.1), so upgrades within a major
are stable point upgrades per the OE-Core stable release policy
(ref-manual, "Stable Point Release Upgrades"). STABLE_VERSION_PARTS is
set to 1 accordingly.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://github.com/systemd/systemd/blob/v261.1/README#L460
  https://github.com/systemd/systemd/tree/v261-stable

Checked the last point release for feature creep:

  261.2 (Jul 23 2026), against 261.1 (Jun 26 2026): 277 commits, mostly
  fixes. NEWS files both releases under "CHANGES WITH 261" and gives
  neither its own entry. Four items are feature-shaped: refcounting,
  argument handling and JSON output additions, plus one new internal
  string-util flag.

Those are small internal additions on a real, diverged stable branch
rather than mainline drift, and none introduce a new subsystem: closer in
scope to a security-hardening batch than a feature release, though
broader than a pure bugfix release.

These bumps are not free: the scarthgap 255.4 -> 255.13 bump was held for a
v2 because TCLIBC=3Dmusl broke, and was merged once fixed. A point release
being fixes-only upstream does not remove the need to build and test it.

Already tracked this way on the OE stable branches, counting only bumps
made since each branch forked from master: kirkstone 250.4 -> 250.14 and
scarthgap 255.4 -> 255.21. wrynose has had no point-release bump yet.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/systemd/systemd.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index bb499a0587..0348f9f08d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -21,4 +21,9 @@ SRC_URI =3D "git://github.com/systemd/systemd.git;protoco=
l=3Dhttps;branch=3D${SRCBRANC
=20
 CVE_PRODUCT =3D "systemd"
=20
+# systemd publishes bugfix/security-only releases on its stable/v<major>-s=
table
+# branches (e.g. 261 -> 261.1). The major is a single version part.
+STABLE_VERSION_PARTS =3D "1"
+inherit upstream-stable-release-point
+
 CVE_STATUS[CVE-2019-3815] =3D "not-applicable-platform: only applied to RH=
EL"

