Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B6ED65521
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:22:45 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10417.1765963358490468238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Nni6tWYJ;
 spf=pass (domain: ericsson.com, ip: 52.101.69.36, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wh7KFSldbcyS6ePTxCiTJRkR2qLRIT7WRMCBlx17RTcMe/wVUaBI4hVB3/vR3jmG3T744ToVJ2ddsu4j0oSFxtUZw/qmLSHOnaV3Ch/LzMpyDUFs23mOsIW8VKPLYPkva9CQ/Xd/NW0f67TNxz2nC8oXbjwNL6afVvAGnVU7UBmRaPm75/wypH/7/5Haqw/FmBBQlXaSGWXHRBqJZ/mj8vJXBJ9qEI3cM9wvZB2WhlH+6XZH8qDYYFWGyT/JO9SxIUhKh5EqCbVA/b1fOm81cEv0/TTdqAuHq8lBSfMdU07rV0nJuS3qhkNiTwcX96DR4MhfA6KQ55VtDo6Y2dFrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPVNZGs1fdbsgE+cqhcPcftIBIOlxNKAx+iERJnY7xY=;
 b=mOp5zXgDGR4PY0lqrIIRk20wRK5l544YsXz7Xt/rJkhnswUSQPxtozrldgrKBTvVBSxuv02BawX+OJyx0iL2jYq68e8So3lwTj713zTD4OCJztfWrEoEgegQjDdSRDetpwZ/aLdRB+zbo0ieeZURbhE25MFHG1BxQJsUVxVPf1z6t9zBT048DA1BbVry/1lNkm3MUchbnuMTOMYbBcKFdFDnICBMtMXxOtph+9ektAO5PNtBmpYRlsQ55EisJL6flyuQRxb38Yb6PoiP3W4lNKitSKsbpTEdQH81kjfP1zd3cC6DvgGyPEiJutrqPhXLsAOBEQe7yqWvVKYu3Crzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPVNZGs1fdbsgE+cqhcPcftIBIOlxNKAx+iERJnY7xY=;
 b=Nni6tWYJ9c32VbYklGdeLqY82y7WVqykBj1vNlTRhSwTUGX75wanZ63y/PWochBT+Fjt43yHa2MGvT6CeNZEl7h0Ta7j8Iv4pcbQ4iF3IhQYV7LS87eCpf2Mi9NZ40Bvex8nZSSDh8dqrGEacxDzJ66NP+itpIr5wiZKiWvy1kxAg1mG4Y3nUkkwr8RTTDILX7Koliilo7n+3v3BqFBDWmmfpo6Q22CpvnbV1Pon5LPiRBvxjLZM2HgTKjmxf3EcaqmxVCyUG9Nv1x8X0BU+xnyMdnOvCZXDfkY8NKGwn1PuR5JLh3/iLBO2C5zGNzrnIoWFwux9TH9f+CZht7vAAg==
Received: from AS4P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::12)
 by AM7PR07MB6407.eurprd07.prod.outlook.com (2603:10a6:20b:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:22:34 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::7d) by AS4P190CA0025.outlook.office365.com
 (2603:10a6:20b:5d0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 09:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 09:22:34 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 10:22:32 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 4AAC09569E;
	Wed, 17 Dec 2025 10:22:32 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 2AEB7700DF64; Wed, 17 Dec 2025 10:22:32 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Saravanan
	<saravanan.kadambathursubramaniyam@windriver.com>, Steve Sakoman
	<steve@sakoman.com>
Subject: [scarthgap][PATCH] cmake-native: fix CVE-2025-9301
Date: Wed, 17 Dec 2025 10:22:24 +0100
Message-ID: <20251217092224.3482254-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|AM7PR07MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c70f8af-e7fe-445f-1676-08de3d4dcfc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DrzrZE5v5rxtXcm7bqHKEWDdWZO6832IawJMgTJpC1vyPtV8UeZK5Nou9GD2?=
 =?us-ascii?Q?6In6Ldkw3D71SabTJRFiute9ZrP9CcbOLh/6ujIK3TGEn+PRMvy56PM5zMQ/?=
 =?us-ascii?Q?i4sqg9qaPUUDFCEbqzBdllL0F8jBBA1N3QWXMXM/TZS4X4W1SssIHD0AgQMP?=
 =?us-ascii?Q?Y8lOpzTVPdeqrIDixi39hyVNTq++laI+TBt5gYlD6w2dZfhmvcMO5sDxWOEA?=
 =?us-ascii?Q?6l08Byg1iMHLoPgLLysd5Aq1fb69QKTmuXDLRE9EWgrZZGGVK3ngbqnyfVo8?=
 =?us-ascii?Q?K3yBAol+iE0WVoVZ1e4oDGCSRDivPOY5aHOSD94wiLsG6NSVsuUTGR7v19de?=
 =?us-ascii?Q?5kzpvkcc//1ybN118dQMdQOqUXRsZELzjdUVGVKeR98YXgPMjT9bLc2wrkOq?=
 =?us-ascii?Q?kJwi+zHcziW3TIGT2SSsyVbfAJGfNUiaPiCSWEgjWKRXB94y1WK7OHygHtUx?=
 =?us-ascii?Q?Xnut3p6G5IlbYUTiW52IV7UUYoYPPMbqoSufljF45igC7tuK7Xx/RVCLj6Bs?=
 =?us-ascii?Q?ZK1DFW6ErGZ4H3dPBY9Rz0Cecv//fAipWqOTkuKYuE11RQQzvc0qWfvRC7uW?=
 =?us-ascii?Q?HrzzgAfAEqW/EZdCytclmAeyqAmgP5lr1TGekkfhOpujs4rV2ZfscixiucLp?=
 =?us-ascii?Q?a88nXZfPHtGzPAs86gDNeEJFdC/PMd53bxf/ZNRyRvUSfkdqGrJwDSdmKcwY?=
 =?us-ascii?Q?Wmh/OvxMZGnuQKG040dDM/xoMGl0bIIG6ZuX1U3CYR+b9yOT/Hmawm9te2JK?=
 =?us-ascii?Q?dxtMVn7K4/cTkGyOzLQpAaqPwRFViGlpsVPIjkwTryiGjZhTCwfObY4z7K90?=
 =?us-ascii?Q?mNV0xqYTJCUrpGzddE65fvboQS5H/6hfeMgCXOItzVNJn9zhAbCECiyDMSfa?=
 =?us-ascii?Q?BT96KCIBrLuFysExKYH1blHWCI+67txwS+f6jO9SXh8baTfOYoDr38cR2gF8?=
 =?us-ascii?Q?JHcexF1viWaeG41liSIOB3b0/gvf5klRibLfOMcvPwx0k2Fm/CpgoC4vC/U2?=
 =?us-ascii?Q?yRxEgqekiiPdowPMHM2vbXMl9LMJqjiH2ZPcKkvklHgBr8ahUmAF9s3H3BsB?=
 =?us-ascii?Q?ThDFaGA6GRBq3RdkDU/3cRMWYcwrboQkr7JCuxsCyyfN0gtQVK3CNUl6wGEr?=
 =?us-ascii?Q?4m6BrhCQ9jCo/u4oQNZUavzWHrvocLzBLmhv0gw+sHRTULDgNqUvZ64rdaCT?=
 =?us-ascii?Q?worISLEOL2wsXD8owvF4GPmgYNEw+c8UoApfLnJSUUdYNsBc7J9mYonLxzr+?=
 =?us-ascii?Q?G/WO7+g/5HbwEnZi9JUjlKpUQvXFuf+DWDXIJgbAbJ4in7hJrw10ALt1SkgE?=
 =?us-ascii?Q?y4Fs0YtwR9Z36ObamqGH8K4hDauiF3gOGhCKrIEEalfrW/5b6fB3qhH+FkPg?=
 =?us-ascii?Q?nT16fIh/7f+3/rcFDW8/NKQIJGlh1R5/oF9AhPUA0n+wCOWj5lKLvZLiHSLz?=
 =?us-ascii?Q?U3pLYCpv1Z43QOGIWBzuDzWXZ89kO2jOU+MOkcMXwnKYxUjpyQhDwW+FwJAu?=
 =?us-ascii?Q?b6XaW3bb00d/2kaWwchDwvfu5KCEaESQAABUiUFdkQLckUrIOnCDDXHBLSjB?=
 =?us-ascii?Q?OWSvUhRj16kw+M/KSfo=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 09:22:34.0020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c70f8af-e7fe-445f-1676-08de3d4dcfc3
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228010

From: Daniel Turull <daniel.turull@ericsson.com>

Add fix for native recipe, since previous commit for cmake missed it.
5d8a6fb52c cmake: fix CVE-2025-9301

CC: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
CC: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.28.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb b/meta/reci=
pes-devtools/cmake/cmake-native_3.28.3.bb
index 376da3254b..7b250752d8 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
@@ -7,6 +7,7 @@ SRC_URI +=3D "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-interna=
l-.patch \
             file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
+            file://CVE-2025-9301.patch \
             "
=20
 LICENSE:append =3D " & BSD-1-Clause & MIT & BSD-2-Clause & curl"

