Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA20C71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 17:35:37 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.67])
 by mx.groups.io with SMTP id smtpd.web10.2983.1749836131470227266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 10:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=RjmjdwHO;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.96.67, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0XYKyAY9wOli974MPvYva+S5pmGWNAuGWdvPNMeWtiv5hBKhMfvZH+v+4StNqDU5tNCGEZsm7bmpJqV1hnx2MfFwiSjHr97zANYoHKffk+jAdy7wdj17G77aYMlwuMIyGLhdluo3efAF3ADXhTrB1Gw3t21U1TpW2db47c2dnVPEz30aG7Y/ZKLxg+ryBXLeCHX2opKyEDVOALiIFkEvygXfHYtMJKvZZsNRW87dDETfM6vqELTiQB8EBKuA0irM7lFbx+2DwzgWSxiGXv7+Y5lX/9UjR2vQGUThshPXUyGjmBg8vnUl/berCj6TXLFWPhsETOe0X4Q18Xa92lMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbivUEjn4481QGa0d6MC+m+3aL4Rfd60djG/ovVCxWY=;
 b=ax0a39pEdTHe3HYKV9yICdBYFRrkQBd/fYhN0WtPz1IekDE26JBtRqKd5a9Twsqfp0/zQ0kL85wnIGm1ffBZiXhFasVcvBE4oD0mCWdQV34IwDKAteY/iOV8j4jsaQQ+6IteBaQt6R4XZR2R9/QxySZWF5d++21aQLmSwotJg195vj4YqgKyK7Rj/eftPWVgegVNzoBriYpW2ZbTBMdU0OJEijn9S50bbje4e/ewOBbJ2E7UlRCqBrAXtv96P9S4s+Wbn9g2deTAFGAnb8cIUSiRs0czb5xI3IvdOiFjqN/V4YV25MTJYZ9/1DGRERR4yjfKlul0BEKOR7ml9IeLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbivUEjn4481QGa0d6MC+m+3aL4Rfd60djG/ovVCxWY=;
 b=RjmjdwHOWAbwIncODNiEAvGsnHkp5MpCP8200FCZ4IM3SIpDDQLZ3BlqKGuCmqLWEhvkX826n1S/VOJB00fUfjr7dfcn/VaYBLhSuOaigD0AeajbHj0c9LrdgeqvsbiDV3X8isxZR3aZAyPH2EE5XIUgZx1t4bLbiUjBiA0lPJw=
Received: from BYAPR07CA0009.namprd07.prod.outlook.com (2603:10b6:a02:bc::22)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Fri, 13 Jun
 2025 17:35:28 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::dc) by BYAPR07CA0009.outlook.office365.com
 (2603:10b6:a02:bc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Fri,
 13 Jun 2025 17:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 17:35:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 12:35:27 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Jun 2025 12:35:26 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <jon.mason@arm.com>, <ross.burton@arm.com>,
	<mark.hatle@kernel.crashing.org>
Subject: [OE-core][scarthgap][PATCH] tune-cortexr52: Remove aarch64 for ARM Cortex-R52
Date: Fri, 13 Jun 2025 11:35:26 -0600
Message-ID: <20250613173526.752633-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6b6725-9c62-4437-791c-08ddaaa0afff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6TUM1Jbv+wWbW0do/oOd98H7iOUddPQO9yvXo6Oy5QagCbRPRVRl9HLDl7D0?=
 =?us-ascii?Q?DrnesBjQhJMpKx/TuzbpSTBSbMtcB9UH+jXTCaHG2wvxU3PRN6sL4jWs5AyE?=
 =?us-ascii?Q?ugOY7AvFOX1xkBcQXcHgDvWQJeut3VzyHCDxBWGFlndUjzs8Vf6tha8tQN3o?=
 =?us-ascii?Q?IVSdyUVzQDxuJpvUn8dHJdZqqMH0M8RNtOL8Z6V0ZjNc20afrPTlqkk92uwv?=
 =?us-ascii?Q?eBljKRwj6tDtDPswEmnxk+IQa1VXn6Tkf4mCCL4Sp+f5xavfp//s5GujjjtU?=
 =?us-ascii?Q?G8h1ropT6XVmjy/A26uUyeBbX1Zhj6bSr9o6IVP0wG6boUNOHo+7U84lsL5d?=
 =?us-ascii?Q?+toqvOZJH43E0xz5s/7TesiAcczOksT0U4hktu/5mnZa/zpaoDxneAgrvWmA?=
 =?us-ascii?Q?QCzV5w9X6k7FZWrk62pi+6u6/WQ8S6SOYEy3f/yMcEfjmoouewAQK6FVINzm?=
 =?us-ascii?Q?agUiqz4xOn7liiKz9EFvZ3VM1k6cJZyU3beOTuvFYuGE1GrrDVhwePSFCdlb?=
 =?us-ascii?Q?RN+Pblc567r71FfmtPin+2VvsYTD+44ezwqKHhUJIgMQE2LtnzDiN2F8bZCD?=
 =?us-ascii?Q?m5fnjo+x8QLpzzecG3XKzte8aTTtG3Etd9aRZvpMzFRG/RM9JrKdU9Ky42E0?=
 =?us-ascii?Q?8B0rA29BVUS7iQ2weSl6NuBmzkpy4g2WzBdFyoAT5/GZI9u+TGsJDAal+5nW?=
 =?us-ascii?Q?tEitcSnERbhVmQxjjzMzQ9rxZAmYv/bWGKN2ZFEq7muvvEZkdOH3H2eelCQc?=
 =?us-ascii?Q?SCouze3MAC682o8VYxHuPN+r+phSnn0XPx6y2gcCPbLbzyX3ZBr+QCfGLCgT?=
 =?us-ascii?Q?4MjANTzVs1Od4zEgdDb55g/WHM62RpW2u3YetZ7fZZIqWs2EjV3BMpkfz+uZ?=
 =?us-ascii?Q?uAt8/95/+m0SrW4rVfEbTNKV1ZYhyTvbeyXTaE1lIAc+0Ki8kMaTlFFrelBJ?=
 =?us-ascii?Q?feR0+MtVLAMIMBZAXB615Asi6659oMFVrq3VoIj7R+7f1RZLUJeNmeCBSN0y?=
 =?us-ascii?Q?wRVCEmIJDayGkp8MEuCaJ0iNqToKRdggzaf8CAYbaWizRgrrA3vAziriKiWJ?=
 =?us-ascii?Q?l+EngzXHgKnWceQEV3DAi5sSkPkGSw3vRySw/kQ02uBRCTP/Yu79JDZTB6LD?=
 =?us-ascii?Q?8Kgnzk/Id5zV1W+AI4gqX105xwO5FcSTPRpHDJmbzkcfyyC3ZjWhRkbJ1xSo?=
 =?us-ascii?Q?0sIXhrLVV3y55475wF8JC1zGPn5GYf95IycelRtQVFL6pj0eXdDd1uqJt6ZU?=
 =?us-ascii?Q?9NeIca92/HenidTSp5Q85vW7RyPPQDV4+wtJ1EhSPyOLRVwnDIaavvf4FTev?=
 =?us-ascii?Q?Qk57cbk5/G8fRKZvPdtCKIKeq3lYVC/Bl4oM9trEQUAQscdKaivjfjITZkgZ?=
 =?us-ascii?Q?Ri5puHEBB3n5fJ0MTTBssUSzFPiVqsbbcY0sAfHvipTetEOEXw2EOEdZjwYN?=
 =?us-ascii?Q?OHBXD5PwoqfSq6SZR6cK4pePDxaGTvFcWoNnkPfV81wgqu2nDDIbTNIOh7AC?=
 =?us-ascii?Q?ExTvZnpz5RO2/gH8QhGxD2wCQMqtv9ArcGW8?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 17:35:27.9375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6b6725-9c62-4437-791c-08ddaaa0afff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 17:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218621

Remove aarch64 for ARM Cortex-R52 processor as it supports only 32-bit
ISA but not 64-bit ISA. Also update ARMPKGARCH for cortexr52hf.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta=
/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 89f0e09450..e8667bc16b 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -10,11 +10,10 @@ require conf/machine/include/arm/arch-armv8r.inc
=20
 AVAILTUNES                             +=3D "cortexr52"
 ARMPKGARCH:tune-cortexr52               =3D "cortexr52"
-# We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexr52            =3D "aarch64 crc simd cortexr52"
+TUNE_FEATURES:tune-cortexr52            =3D "${TUNE_FEATURES:tune-armv8r-c=
rc-simd} cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      =3D "${PACKAGE_EXTRA_ARCHS:tune-ar=
mv8r-crc-simd} cortexr52"
=20
 AVAILTUNES                             +=3D "cortexr52hf"
-ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52"
+ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52hf"
 TUNE_FEATURES:tune-cortexr52hf          =3D "${TUNE_FEATURES:tune-cortexr5=
2} callconvention-hard"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    =3D "cortexr52hf"
--=20
2.34.1


