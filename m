Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688DCFB5E96
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:35:16 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65881.1773707710590228808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=OtA9JRDL;
 spf=pass (domain: axis.com, ip: 40.107.159.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp3zRmy/foCQhba4NjGLhtvWs50lRI7SCTqGYgkq1nGpIN5tZQV3497+4nFHmCIRvPi0TXb7ZoV01/uwha1Lqodo48GtL5nE4S8oFUrQdt8FyIEYhDKUd89DOK7VKZ2uk5r25jM51qQuvsjaBnMfERv83GvAH+fZ7xdNZp90NOF0JB6C4nYsH19B+/hCPwRAykdF6+23TMZvYdgZXMSMu/4tpO+KTmq2QR2hAOX6SYzigMYGDGBIAGT8RwF9vq3kw8eN8IQ3olS4Ln0MuFnZis+7ioQajlOb2dq0SZBjoXeKFnApLkzh1cKIHwhEWP0qlf4Y/EC6BvvdF+34hOSchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOpE6HteHmzdWfGn6vybhE/dy4849QFKp4kw/O3380k=;
 b=wacwE8pi6GqRTtS9xtFcx+xnEpXMb3aRQx8i1pXeG3qQYd4uJzuMKiYdiCSPNAfmXW5dZoZwStJToJlCRhIUEKaJIFVPovizP2n5Y211agARUrikFcPDOLkp7CVFQ/B5n+Ma91KM9kmXUz1F0w2CzZ6LoA1evTbfCjaFsOTa3h+musB15ob3ESr+yA2FKXToqhz3SgMFEzEox7pyno7ge+X3/Ipj7GUHVU2UF/kQUi8Dpwb9EHMwyv3VpDUalzCtwlIpGfJE5hRxRZ6c9kagSqDnSbFpXKdkMSAIQccqWuvNFvhlJDlXgCbOSVeAUeID3tBNVZuwuGxXVt9sYoH1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOpE6HteHmzdWfGn6vybhE/dy4849QFKp4kw/O3380k=;
 b=OtA9JRDLVFC8vHgq1lLwIz/aAJeHV+WGZ6sux65cNFrX4lwCyoGfgKZRDk8BNVDAzaWPXeLhkOH31cbYNfgKzka8jSh9oz78hOAFo5XVCidA+J6PJVmkotspn33ILBofqco05/9BSENQXAPyfYdIIsJ5dyetYNpioSNyqsiF5as=
Received: from DB9PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::15) by GV2PR02MB11708.eurprd02.prod.outlook.com
 (2603:10a6:150:2fb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 00:35:03 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::c8) by DB9PR01CA0010.outlook.office365.com
 (2603:10a6:10:1d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 00:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 17 Mar 2026 00:35:02 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 17 Mar
 2026 01:35:02 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 17 Mar 2026 01:35:02 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 877F4F9B
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 01:35:02 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7839F12AB28; Tue, 17 Mar 2026 01:35:02 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] layer.conf: Use += to add to the DUMMY_PACKAGE_ARCHS_* variables
Date: Tue, 17 Mar 2026 01:34:58 +0100
Message-ID: <20260317003458.3583571-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D08:EE_|GV2PR02MB11708:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc5ddd3-57ba-451f-0911-08de83bd0774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iEjWYNI2+qfNl9eaAT3csgN+v1MfZlgz3JGdaEp7tnbASVgqYRPcl8xZ5tT76CzSIU7H2f+HE6RwbPVxDmdFdzPySESRdM8IMg7tDVnvCXLSTv1kOZ3TjlvYV6dw/gHkEd2tVrYfV+Ud35ApUDPtx14hKGz6e/HZPACzZYsblgnzp7T0UWDkrvWfVIiSplm+XrwazH8LqHtWxW+w2OIO1Z0YSUVpPHyvnSl3auwMc04FdK8KHQ1jBd0ZulonqfkknBjFqpNpmBwva0gMcHD+HmEijRaY5ilwgPAeiJdjdr49y2yYvahI+3NiCbObxX8zzq9mHFDjscW/cMMUAEX1X46h6pikWV3payjNI/y/Bocu026njinGOet5sEEkIzQSXZvXyH8E+MspLttnsOZAp6zoclaRB1snrdWfWMx7HsXIgTKKTrZ6cJ7BmzyPgCUIe9V6ekYBAdLCD5FCT2OERjgAAYrHiqI5cNEvdsicDISBdvUIwn2K2k57Tp+0ctgwu7GTqYzXbu2UborooXyPHpbqjBGdNWxCP9PXkz1KWF7xjm4PPtvyo//DGmKlRUA0TXx2WIOltROPWaie3K3hbCz2tTB/b70fkpdR8Htxl8O5nz+u7cRphuGtLihcNSU8LsYJVGMGJ6wWTLFYjkn7RFA9837IQET5WrcELbhUiIGKukxxPyJxfu7r919KECZbqDfmJEGybaPzuD0xU66uOV09epSJzBvPc7wE9rqY+97oN8UhIfi9iasuEmMViyF5mqBFkCpDZuzrmMtP0qcUGQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4HPsz/D9gxckEugb81KiRJ4aWWXVfz95bCuMugPT7B4mAPS6gmzMv+D7yMn6sF4do3C2vIWbwawZsy7GmRwy/ISfIAi7chQlQ7BmaTaGIlVqoyUWSudeLm2atxpbS7cyvsHzJHA7sWDKdHga7Nc19nGnCPFdx/4iz3QZyWseXsgzSDJ320Jh7tWowgT640PUw4XC1YuGEBxf+ewnLNMSxZ57nPm3+pWtzh3TI5W+AEB5l3e+J/Nuf1sgBMpXk+EXO4pWTRuw19uLIS/2KFliDFG2uz7U/aog5uOYOSpRjzxQ5svbfyBYXKpDuVNDk/ZH0zclhG+i0NA9Uk9e5KUdofM/kPr6RbjrVXHelYaMTiUTFCehVeombawUD08Yx5sbu4J5iiMK+aga2qOtqQ1njzTZbW3F59XRbGpdyJtSf/a2ikXvrdc6K6LHBs8uHdwp
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 00:35:02.9798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc5ddd3-57ba-451f-0911-08de83bd0774
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11708
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233286

This avoids the assumption that the meta layer is the first layer listed
in the BBLAYERS variable.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/layer.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 4794e660ae..9c80153233 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -133,8 +133,8 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
 # dependency in the recipe.
 SSTATE_EXCLUDEDEPS_SYSROOT +=3D ".*->autoconf-archive-native"
=20
-DUMMY_PACKAGE_ARCHS_SDK =3D "buildtools-dummy-${SDKPKGSUFFIX} sdk-provides=
-dummy-${SDKPKGSUFFIX}"
-DUMMY_PACKAGE_ARCHS_TARGET =3D "sdk-provides-dummy-target"
+DUMMY_PACKAGE_ARCHS_SDK +=3D "buildtools-dummy-${SDKPKGSUFFIX} sdk-provide=
s-dummy-${SDKPKGSUFFIX}"
+DUMMY_PACKAGE_ARCHS_TARGET +=3D "sdk-provides-dummy-target"
=20
 # We need to keep bitbake tools in PATH
 # Avoid empty path entries

