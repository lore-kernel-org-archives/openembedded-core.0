Return-Path: <erick.shepherd@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A4EE6F07E
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:08:14 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.13])
 by mx.groups.io with SMTP id smtpd.web11.929.1730484489858641133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 11:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=HxZ/oIUP;
 spf=pass (domain: ni.com, ip: 52.101.57.13, mailfrom: erick.shepherd@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8k7awvbjNxb5F0UHoFfytmHcP0Z4ojMVsyQNe+yZIL84OxEzp8SU41PS4RgoRfIIr5JjfxM0YtdK7W8YbD353HK4fSF0TV5MaHM/CdbkJquSSo+0jppuaifmXCRuVx2KrfDUFNgFOsnmRyl1fhLg4eIVP9f5zortCL+aShba2lI7LiErmIebPJ0cp3XfMsONrXspC0dTaLTm33P8D1sAc8Xi/ByPgsdGjxYcSx0aEKmH28muUrMhBOZzBEKjof1x5HlFxMdS/REai7goUmGTZBH4Xg8Sdus11Lt+5buuSjh2OrogwwvqRq1ahbLa7sRbvjc9D7c9ZcY55IPsIgKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBK2v8sWu5YShDRnWaZ83fgRgETdqq6bhrTGXCt/7Vw=;
 b=ZA1bOqUP16qedbrgs0VZyEgXb4fO9PUI6TlxrDTErzqeGmHhA9ez5mO8YmH361Dd6nuYCtOb33XtMIeRToZZUHNb+XW5+wgiZ8kj+rF0FmbNxVChhqtSoVqYxncLxie8DJ9ttSGfSw4O5NAumlcJpiKOjmEAt0E3n5LPbdUi837cfrGEMLg6OyyoqLZ2xTRzoxKg+qimuXOwb05NBL1l6JlYOzZKk03gf3ZoNZD88AC0r2avufNKcCdk3SQHoF6lRQZjTrQblo7Rutqsz06b9Yn2W50a7E6nEhf2g+SbUxe3wtpyJBBCLGXwzbD0/TuTjJz4kdOTdyS7XGG26Hb4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBK2v8sWu5YShDRnWaZ83fgRgETdqq6bhrTGXCt/7Vw=;
 b=HxZ/oIUPnteIof8aPk1eihcjWv3IW5BX++6FXiZ1RYmNVeO1AhgnNp1j3CcX1OWGibspfTrc2Hn815q0aImq8ahihU2UuyyK1QkgYApFg4MlG6R/i7Pmc3oWezOXXFg68jUWbqnf7KkkS2CY+US6EnPm4iipiTmEZKbcdHR/iK4=
Received: from DS7PR03CA0254.namprd03.prod.outlook.com (2603:10b6:5:3b3::19)
 by BN8PR04MB6276.namprd04.prod.outlook.com (2603:10b6:408:7d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.25; Fri, 1 Nov
 2024 18:08:07 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::4a) by DS7PR03CA0254.outlook.office365.com
 (2603:10b6:5:3b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Fri, 1 Nov 2024 18:08:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 18:08:05 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 1 Nov 2024 13:08:05 -0500
Received: from ershephe-ubuntu.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 1 Nov 2024 13:08:05 -0500
From: Erick Shepherd <erick.shepherd@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Erick Shepherd <erick.shepherd@ni.com>
Subject: [openembedded-core][PATCH] xorg-font-common: Install fonts after target boots
Date: Fri, 1 Nov 2024 13:08:01 -0500
Message-ID: <20241101180802.395269-1-erick.shepherd@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|BN8PR04MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 5552ca56-6232-4eec-ce63-08dcfaa0226c
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T+5gdfik3zQws1wEfOVQSqpSnVUtTF9VPMNYTSSRn/THD23yEZcxUVZSRcdu?=
 =?us-ascii?Q?IFWDNqbwyOK4FVbG1rQgyOe0NsVrRl5+s8ypHduGlyP8IHsTN4T+cmzzLGLU?=
 =?us-ascii?Q?5ftZ4RPLv65nkLj8R6smosDpwhcuVV+VMlOu40s9svkuPVo3JG2pDVc1x5E/?=
 =?us-ascii?Q?fEakGKBx68+dcRwF34UJw9hrEPStQ4izqPNNN99wOq3Nnt/RW9g5vR/4G2Ba?=
 =?us-ascii?Q?nzPdQBkDyIfKRnjkoPJW2QoQ9D3UlcNGqsOuKZWPYHbVx1ssaCdjOhdwAGN1?=
 =?us-ascii?Q?ePV5qKcYCb823Q3iRtEWM2Dea78ZxtnIpc7Zwu2DJb65xb9OJ/a9akfAaT0l?=
 =?us-ascii?Q?lhgyOh0C16E8jawfXaKcRTAhlMF+dqBtkU7oMgPtZftM710gks9BDlBD5Vye?=
 =?us-ascii?Q?NYKMZZTNE3ZVdGVYg2r5X9UPFXKoAN3quW2F5rFx7xU3OU0FMKSd0t/VwfkT?=
 =?us-ascii?Q?vxB+djp91I6cNm8laVtFGXqtMXUUousb5Lc3tCSpyrss69dlBJkuYX3YbzhD?=
 =?us-ascii?Q?FS1bzwYj++EyfLJEN6FyD/SBsDCf7O5witRpHnpPMQhAemKgcDeQv2IgF+XR?=
 =?us-ascii?Q?nDZfOFmdp4r++zFHLqbr/Nm1Hr4jlyfH+zUQB2e0Z3LLFP7YnuYkSXJZ93Sv?=
 =?us-ascii?Q?0aocKB/A5apcEHiMG8yi9rGrKag93YpfevgJx4w9sgxVBXGfLHlLZR9YZKyQ?=
 =?us-ascii?Q?1JQc2nycbQzfY5XmRkqgvOw/2AHndN/RKUT4iN+CG1dlq3p0aKbplPheYJzB?=
 =?us-ascii?Q?Q+G7sf8ovX2+NRStjRkG7szvTDnoHH1wSikJChDdmgyISD/IpRVYwUiOA9iu?=
 =?us-ascii?Q?LC9otSAt10l938Zoz2Isije3QavH6PzYNDogV5aeAgaV9OhDmLQOm8bZBH5K?=
 =?us-ascii?Q?aFPS9pyKnngO4cPOac++HvP8sB0ioC76m3P75nGwNZrHbN5Zr/kDeQdPudVN?=
 =?us-ascii?Q?1Z8KyQ5aUhimd5m9Jt4bPkKn5x0p47zCwxZMFUog3nV91gMgw1GOKT3XSk/F?=
 =?us-ascii?Q?xwcRKesET3FLh+YlSxTTOH6aj8lxrGNfAZZd8Tbs6QzCNImGODMxjXqqECxw?=
 =?us-ascii?Q?LcOfpnCDMduFPNjGiN48oPlVDN2CruJb0L8vgjdvm3ia8C80yb8wRPUL6k49?=
 =?us-ascii?Q?iz6Qt3Vti+WBpbvvfBoMpJ9Pal9w0rHHcWBkC/+T7z0kO1Uv61DlfH9pAUfe?=
 =?us-ascii?Q?FQn+P4EsqX4JiAAQyoOPYuj1VsGV38iyYfOUlUd2GdHJkECsgUKNDUGHJC2A?=
 =?us-ascii?Q?1d95LA/tCPT6qIpX1SFIXrE2EWIDz02nTfHO0VANNLo8gVRVSFSWhE+e4oMt?=
 =?us-ascii?Q?Jjm/8O/yEYigkYXMnPY6BX82I+0Y01tg88W5OV8KnYoWjbYTVj0TXBekZT/O?=
 =?us-ascii?Q?y6k0B2UNtqlMj9x/IJzZjml5Xr9FRWWVi98Nn2/IgbWm39+jsA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:08:05.8254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5552ca56-6232-4eec-ce63-08dcfaa0226c
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6276
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 18:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206625

Access to the font cache on the target is required to
get rid of the "configuration required on target" font
warnings that appear during rootfs builds.

Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/re=
cipes-graphics/xorg-font/xorg-font-common.inc
index edf7cf7642..b9c55a95f8 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -30,7 +30,7 @@ do_install:append() {
 FILES:${PN} +=3D " ${libdir}/X11/fonts ${datadir}"
=20
 PACKAGE_WRITE_DEPS +=3D "mkfontdir-native mkfontscale-native"
-pkg_postinst:${PN} () {
+pkg_postinst_ontarget:${PN} () {
         for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
                 mkfontdir $fontdir
                 mkfontscale $fontdir
--=20
2.43.0


