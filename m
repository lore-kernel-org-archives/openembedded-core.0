Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FBDCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:10:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.54])
 by mx.groups.io with SMTP id smtpd.web10.22308.1758219017908877024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 11:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=pyyheOdu;
 spf=pass (domain: axis.com, ip: 52.101.83.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pA9ii2mA+z3EPq48wHjNrlW23vxIxErXUi2AG+nvJf2azQYLzLxfv3oGKNuRJmpIJ3SaBjouxaJ0mQvIdeXBcAbtYrbmEHH8npLMTdCy8/o+8zGqbOssl8qtLN+MaVGPjjSRXRUTqb9tDs80q6ZnMfS7nMC/yOk07q2LbxfITarJ/EaLE/hvLgkqntnta+by1BAvqncp7fmvnzMTe7Zt3SKIlSo2k1EqlKJan7sJ6Heodp/kw2K4bo4ZCTtw4mO1lztWndPIWfnXwZQR370e77HhOsRCsZmPZXb4cDuQLujIiEnS+2XmzMCzxUrk23VgrIk4Vy3UzXFosvDWnJE73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoFRYeTv4P7wwzbOdPTbDQM6hfvTe2cflR+N5YJVm9E=;
 b=M997+ntrvCH3fVQKYoSpzbvGQ7p4+PYBRms8eoSRvko7TiK4eMpyJ4mcXQPnKQvarK5rNF7pLL0IVClSaZCECvXRzhQ+Syido1KO5C3vgnqeLShWmlYp2CUkpxb5nQSYEHxXmXxRoROJwz64zJYeWevnzwjkXk4jEoGM89I5vwUNclUrbS18x6xw1PgFyzbn6Tg9+NNoTeewtDRiyFcZJnZ2A6tmWobfs5KS9OU2cAqHAKpCiWfzbSJyUmDynpFNL0HHDTkHt+lmdN4L/Ley/lNQ44bk6X7AxkBna8luYEijJ9R/2+MOF1En4MIBUYFQ5cGJkwMt48zgc8SFubymBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=linaro.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoFRYeTv4P7wwzbOdPTbDQM6hfvTe2cflR+N5YJVm9E=;
 b=pyyheOduG9vvn6LtvmDBSgKNRCH/UsWT63oHVReCd01Qtx44gzpcRjdf/DZxa+iKfOhdiTO1I0oL7EmvtQdVz4CqYovQFJ+VThOJTfL+rf4DJMW29OAXsraUOCdX+CNRdkJt/hUuG7k9xnFb3m43pIXWIbiGJhakLYfhGwrHfys=
Received: from AM0PR02CA0115.eurprd02.prod.outlook.com (2603:10a6:20b:28c::12)
 by VI1PR02MB5983.eurprd02.prod.outlook.com (2603:10a6:800:187::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 18:10:12 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::e) by AM0PR02CA0115.outlook.office365.com
 (2603:10a6:20b:28c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 18:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 18:10:12 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Thu, 18 Sep
 2025 20:10:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Sep 2025 20:10:11 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DB5852BCE;
	Thu, 18 Sep 2025 20:10:11 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3DF2D1203FB; Thu, 18 Sep 2025 20:10:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] linux-firmware: Package ${PN}-wl1251 before ${PN}-wl12xx
Date: Thu, 18 Sep 2025 20:09:49 +0200
Message-ID: <20250918180949.4002208-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|VI1PR02MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 340873d1-d777-40eb-afef-08ddf6de9c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aJEF+LGUNw+2NPOsV0Od+V0cu+4OG3CvlCEnR5P4e3Zzd7GZfFEhzJHd060v?=
 =?us-ascii?Q?LpcuBKz1/4HuWAskoS4w+ziTD6SgVBRz4etm7gBFa1pWzNWNmy5xxrlN45og?=
 =?us-ascii?Q?cbrN6qdyV2EN7qiMrd9Psn/dpEQ1D477UX5ouBYX3YxTKSE1Ui99rse4RPpM?=
 =?us-ascii?Q?lYiCpaEBVDDSVeD1/6dbJEyJDG6Daee5KwN182jG1zoDqcweHdAAQKMbMS2F?=
 =?us-ascii?Q?Qu1rblwMozCePYfEKX9n1R4q7wcC01OnOMuJlmmm8zXh+Vm+5/49VjKHKeLP?=
 =?us-ascii?Q?Euj7NmPyIdMWAVVGpNs/Rd7f0YVt0jB1DJnxnJ8bRHxqF5xLdFiNPwEw3JWc?=
 =?us-ascii?Q?v9QHOyZO4ALCMKdBpYjIEmzKWZ2hFTwEUH6oKx3xrkK4ssbqq+b418qY0f8o?=
 =?us-ascii?Q?EjSLdpV8N8KdZIaLE3CKGEHT3J9qLR0kIk3nAaKNcCznnQbsZJdCy0gv8eDG?=
 =?us-ascii?Q?1KGiAqfEfQOjUgcv59h1siV9HokjjGmPmgugHzI8+mwtTGwaqygD/+RJZFJp?=
 =?us-ascii?Q?fejfBIsAfj7nmj0A6PPCOTfTpwsfB7SL+AUmk9NU/Xyml3B02SLRBXiFx5vr?=
 =?us-ascii?Q?RPhMxWJC6kTgoXrZ/Pc4eAyZJ4Wz1D5ibk/BWUxrg9Q9vEH18aGvkMUb7wF4?=
 =?us-ascii?Q?LQM1mwInz3Yf/ahhE8akwIYuFXY99BiSKGAAJWapFECSNzZVCZ5JyHGp/Uas?=
 =?us-ascii?Q?walDyoR+QzVCYTgFs9Ay9kuXVobqDhQUrP8TnvPGBizwh8X0Ky4R8mAB+p1j?=
 =?us-ascii?Q?24ahe69reLEQw5UbGI8TqoSNibt4ESIW+yclrKhZmBPYNBoPq95UX9utJWOr?=
 =?us-ascii?Q?K1OZ4mBxDaMclE4Qk1ey9MmWFq7o6uMstRjfjYjAiknJW+Yzc6uguxY8YzX/?=
 =?us-ascii?Q?6h7HbTcZWlI3SEOn4ndbXd1PKmHk2rPLCRZY+gc6KKwqoqVP9VyWUWiIJWQI?=
 =?us-ascii?Q?yuG20HNo0VPvDeUTZtA4aP86sFOpiwDtzNaGYtlLc5NvQiD/r5IOnvdoI5JG?=
 =?us-ascii?Q?rbCaKtUCYg8J1w6fsFoH7HJkCwiX+Nrls++0b3msXV5tMHJp836Ux4O/o3pM?=
 =?us-ascii?Q?mU+Se9aPf/lmXN3lUfe4fyaZa4rcMzYY8Sx/KadYmBtpnUwAG8Kg5qJPukHb?=
 =?us-ascii?Q?PMDrblLUwKM5Nwceokn+uyeDKqGk3f6wLuHxCral10VqvIbgtmMw/2G/1d+O?=
 =?us-ascii?Q?xR5SRW4zZ6itDHPxAhx5PsbbPOewArABaLbA2DoN+Dy7oPn8tfLSfo4xXtmQ?=
 =?us-ascii?Q?BScX0I8XAuHHywj2g7u1smlRezSvaIyKK679kloI55ex/IceiCOlMA39DMYu?=
 =?us-ascii?Q?HPtFuYm9EcnRK6ZcH7IRryVw6tS0xAU8C9VHVPAh5INnL905R2yvab4s2MhD?=
 =?us-ascii?Q?lg9KTvvd5Dtt3zSQ1l379Zai3UazEArhEdwb0SK4YeE2GgvTxZvhWVgXD1oN?=
 =?us-ascii?Q?epYzzIJ2i8TPZGgrsxMNpiBz7hBEjKZ8ucYy9PTxu6iWq28NAT6lZjbBTDq1?=
 =?us-ascii?Q?E7Uw+cKFeUioOGGI8eiapszcnt0vSjcb6mSe?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:10:12.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340873d1-d777-40eb-afef-08ddf6de9c5c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 18:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223655

This effectively reverts commit bfe67c7775fb4a9177c7ca037ac08e93155b5808
and insteads solves it by making sure the ${PN}-wl1251 package is
packaged before the ${PN}-wl12xx package. This assures ${PN}-wl1251 gets
the files it wants.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../linux-firmware/linux-firmware_20250808.bb              | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
index be38a8edf3..0f4c923a41 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
@@ -455,7 +455,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-=
vpu \
              ${PN}-moxa-license ${PN}-moxa \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8=
801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
-             ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${P=
N}-wl18xx ${PN}-cc33xx \
+             ${PN}-ti-connectivity-license ${PN}-wl1251-license ${PN}-wlco=
mmon ${PN}-wl1251 ${PN}-wl12xx ${PN}-wl18xx ${PN}-cc33xx \
              ${PN}-ti-keystone-license ${PN}-ti-keystone \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 \
@@ -642,7 +642,6 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-=
vpu \
              ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-wfx-license ${PN}-wfx \
              ${PN}-whence-license \
-             ${PN}-wl1251-license ${PN}-wl1251 \
              ${PN}-xc4000-license ${PN}-xc4000 \
              ${PN}-xc5000-license ${PN}-xc5000 \
              ${PN}-xc5000c-license ${PN}-xc5000c \
@@ -1462,10 +1461,8 @@ FILES:${PN}-wlcommon =3D " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl127x-nvs.bin* \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl1271-nvs.bin* \
 "
-# All wl12* but wl125* which go to wl1251 package
 FILES:${PN}-wl12xx =3D " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12[012346789]* \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12[a-z]* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12* \
 "
 FILES:${PN}-wl18xx =3D " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl18* \

