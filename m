Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46008C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:08:33 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28738.1787681311994169846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=mnIS81c6;
 spf=pass (domain: axis.com, ip: 52.101.66.8, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8+S1S8n5Zdq667EBGBZb0bWAXhJcuE1Fdh1XDOZgn4XGTfbEBEzvLpvdKN7KkUZM+yb41n94M4VLw460XiEqzCY71bm9JkLKINzhqZk/DagKELeeuYxIANwg/GtqSf22SZfNwnhzesWToAkFnNijwvZHur86TAFa1omh9yUhT5Nah0CDcuI+3cllFYeK0/9a3iHMOc/iZqby0oa9Amc7mFVfbeJ3HiGyVbVIBMeQAWwmPO4xnyqolWcLmc1nbQqzy8EwXIG1GFKVvMc9jsk2UIRqQoq9o9BO0CALWP8mj6HXxvpEVzBjyBSH6jFY89i/Dg2dEX5Xu0d4Dv04f6yVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwUdQLSV62+xr7lgIKHuKhyG2sALKm1gBVH1RhBuRPg=;
 b=NT4c4JOrqbZ4al0nqroMiben3L7cvueQ6a4yp+nbQms7MFBvBp5flMcNGFuS8oXZWFntDA+rpjQVeaty82bAv8LjG3Dl/Gl8/QZWuHPPZc+13ynFhpgfcasr6SC+VWxUlqITHUTbVJYEVL2rR7mu5vofMWkORu4zk4O5ZvpFVmSCrwMdAd17bBbV/0aLfasSvC1GLB4Tw/4ApD3BwIvI+EZz5RfVUfM8plV4z4JlBSMvsU/rNU+zU1sADA9JOxXgsDmH85So2bDCvzKwHoQrONQxjq+kgnuKYWrI/HNVxTX6ihkXxLVnwMBvqY6/iWV4aE1a/EBSWERMGu8Qz9XWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwUdQLSV62+xr7lgIKHuKhyG2sALKm1gBVH1RhBuRPg=;
 b=mnIS81c6pmh7MbBTOrA+7OXb1/gMtTbxgNTlNac8vwwd4CjxFhPFd4bWeD2N/+7KU+wYMcbZ2LYdbmwlwNgq9iqm2gH1o/LUawUa8ZQZMWEopjg+SJXWbgQUhmykc3L88IDLIqLvOmtAubU28d+lspV3G4cVmTRr93tZQvUpLMc=
Received: from DU2PR04CA0273.eurprd04.prod.outlook.com (2603:10a6:10:28c::8)
 by DU4PR02MB11407.eurprd02.prod.outlook.com (2603:10a6:10:5d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:08:27 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::53) by DU2PR04CA0273.outlook.office365.com
 (2603:10a6:10:28c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 18:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 18:08:27 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 20:08:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 42F72432A
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3E40E12B4CD; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] documentation.conf: Remove the documentation of GROUPMEMS_PARAM
Date: Tue, 25 Aug 2026 20:08:05 +0200
Message-ID: <20260825180805.2990506-5-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825180805.2990506-1-pkj@axis.com>
References: <20260825180805.2990506-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|DU4PR02MB11407:EE_
X-MS-Office365-Filtering-Correlation-Id: 480eb286-9b8a-43b4-2792-08df02d3dcfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|6133799003|3023799007|20046099003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	27ixWMtsInlkf4PYSE9gDXelFR0qKJSoCtoIs1Xoe53V9sLaFFLcTSNyrlEcHtUFAo5z96T+K5D3g1yQX0tuTazfqnDteNz99yU7N+m0J3Fy4H3x8ZqjLvCgqnVm2KwcTA0Vqx8sgVEOLV2mWfH6kmSwtHs4NeJSddN8G70X/F2FOmdz+8a324z84MnumBjSf2iH27d34dVOG9wZwfwUswjX0zNOLUGkqq8PwlfCGioWoYqWjUv8sOkW7owcO7+5QP2wORJBqzvBylOC931v0GgtLnH3f0Mw6qt6M+qqXrGKNTY/5eNPxpypVXlWmC5TKza7JU5ayxyTKKAgr7tptS6iFEdcG0QNSs9mHLwlkbdv2RDjeWC1aXmSm/lArra4SVKv4OSB5qqgBl9d3fLHZ8IUgjmxdM46dFrH+kwWWAuwOzkwX9g1bQlVZSEAQ0/aUUBUUYaXtNp81k5Pyi5F2RPrz+VbPNi08PncmzuSe8US72YZi7+S3JtZSMkc0L5zTf3k5obgrm/Cg6g3YKXwcgRyvPikVCBJ0rB8t6ZgdAnV6Z/FZtNgxtrfluWiZkEC4X1J6m4Kdu3ArqjQGHIHbXJyDn3fag/c22fIvwD8GIv6nR00Tc+Dwi6i9h0qencf7SSZJn4Henjta8xuIXOlC6GSuW2DAnMTB8pgV0BAjqG+ERYzsfAHt/+iBHbYu3tAWJxHH6N/9imZZQ2YgYzZnA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(3023799007)(20046099003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eMl84UcoEWJt+HCB8svoHA3DoaSNJG/WbsNUsgahtzlMmgiljo3ZU/xyZ5AbAbXQ+w+G2Cu+RzwvC56tvmiv6bcx0Kt+2Zb05ZMQNXj3MwD05deXledpqui/q5lLwnfBfNGUiNSaOWtM8F99vyImc3BAKD58nCfMvKUMcprHmfuIx7UWr9dCx6UeUEoS+YfjyR5bpxwQnuc4VBOsNnM6E/lG1bbxzGTgijKfvFURuFLymW3e2EKNjQeAcOv2l6Kc3hGUihNOh59mg1bh5UY3DenZUQAtHWjxsvsTvJJkZOoj6Ts1DI/CZqFZbF589EKgacKkd3MDHbYaG/JRX9PkP/o6+CleOYt/6ML2eA8h4eU2WTu+qKjG7877rDxtEoAV1HQ86dSgovdvAcp3i8ecQrNNJ0bCe1QJMb7LzvzE5mzeZFPmPaRIYZkiBQtTw8rE
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:08:27.8272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 480eb286-9b8a-43b4-2792-08df02d3dcfc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244250

The GROUPMEMS_PARAM variable has been removed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 72513296e2..7b6df903bc 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -178,7 +178,6 @@ FULL_OPTIMIZATION[doc] =3D "The options to pass in TARG=
ET_CFLAGS and CFLAGS when c
 #G
=20
 GROUPADD_PARAM[doc] =3D "When a recipe inherits the useradd class, this va=
riable specifies for a package what parameters should be passed to the grou=
padd command if you wish to add a group to the system when the package is i=
nstalled."
-GROUPMEMS_PARAM[doc] =3D "When a recipe inherits the useradd class, this v=
ariable specifies for a package what parameters should be passed to the gro=
upmems command if you wish to modify the members of a group when the packag=
e is installed."
 GRUB_GFXSERIAL[doc] =3D "Configures the GNU GRand Unified Bootloader (GRUB=
) to have graphics and serial in the boot menu."
 GRUB_OPTS[doc] =3D "Additional options to add to the GNU GRand Unified Boo=
tloader (GRUB) configuration."
 GRUB_TIMEOUT[doc] =3D "Specifies the timeout before executing the default =
LABEL in the GNU GRand Unified Bootloader (GRUB)."

