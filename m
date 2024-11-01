Return-Path: <erick.shepherd@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262D8E6F07D
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:08:14 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web10.953.1730484491985987274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 11:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=ew2Kb7H3;
 spf=pass (domain: ni.com, ip: 40.107.237.88, mailfrom: erick.shepherd@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an1hswDTqR601qVCeC7316sge+hOP1FkXu6kOVrb0WEQ184yevlm4zly32QWWvjCUsyAcwsak3QFdROGYpUNANPjXb54b/WWEBp4R47aAvCOLQMyHVmlOvpNsgkgK6OvEFwRzT42sbKDD2/v6G3NZ1IpjWTR334My1X0n19kothgLoY2oVtPYnsyh8lDpvtDsW2ZifgKysSHo5mIQz9IaiFuV9mKKCXmMzElPVovrWupWKirMPBB/u8iMUppEnbOt+ng299qffNGe4u3sDUpIANCkk+NRMyA/poDbvkbhiqkSpCWCq9TI6l/C65P1GhNZuMivLgzGrs87yNh3Y4vXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBK2v8sWu5YShDRnWaZ83fgRgETdqq6bhrTGXCt/7Vw=;
 b=gupzE1G9C3AcyJt0OC2uWVlAcipSIZzbpShR9VpCPEvBrojPmI8murCaCYOzLFySYRqAudpPFQls6xSHcz+1t3oXW2pqfACGpZ2Ovw6c3Rn2Jk0vNJx7YH4bgoG7tj2xJKNt4NZNdYFfd0vqfmgqBKqVQeSWXUMPZ5MaIvsTKML0cJPMi4wMNgtP2rICbzYSmFodViTqH0Kzau2WblD+dk+6IlJoE5FJdwF94nyFjfjFuVD332UgIgoJXOsZcEekg3MMzbyDTrc8GLlz9LSk/a1FBKBRB6FZZUwo7iVXuEhUG3pSwWz8/dnMzf1tlhXIBW7vlbMsZb+ZfjSEVVNt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBK2v8sWu5YShDRnWaZ83fgRgETdqq6bhrTGXCt/7Vw=;
 b=ew2Kb7H33dh/iqD1Gx7FQ0uErsjaXyMaSF+QVx0yDeaeANLnqvSnASDiRA5whgabYeO5dLMreFxV65P2T/hoDUZUoDcIPt8o8y00xg35JyfZEHevuCkSotTFjXgc5HBrvN5qJDagAVlZW1k9ZSKUIMXf24OfX8Z/3+LggDuTJ6g=
Received: from CH2PR18CA0020.namprd18.prod.outlook.com (2603:10b6:610:4f::30)
 by DS0PR04MB8700.namprd04.prod.outlook.com (2603:10b6:8:12c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.27; Fri, 1 Nov
 2024 18:08:08 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::db) by CH2PR18CA0020.outlook.office365.com
 (2603:10b6:610:4f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Fri, 1 Nov 2024 18:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 18:08:06 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 1 Nov 2024 13:08:06 -0500
Received: from ershephe-ubuntu.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 1 Nov 2024 13:08:06 -0500
From: Erick Shepherd <erick.shepherd@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Erick Shepherd <erick.shepherd@ni.com>
Subject: [PATCH] xorg-font-common: Install fonts after target boots
Date: Fri, 1 Nov 2024 13:08:02 -0500
Message-ID: <20241101180802.395269-2-erick.shepherd@ni.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241101180802.395269-1-erick.shepherd@ni.com>
References: <20241101180802.395269-1-erick.shepherd@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DS0PR04MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a77b0be-0dee-4c0f-9605-08dcfaa0231e
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EWROZRV5qj26m6c22K+rAmj8XFG9BXAog0sg49UXWf1e+xffhbyy0YKx31N/?=
 =?us-ascii?Q?HPeq4blAYJsdQriEc0YnqutG7RxxRmzXFhxyV0sfnkn4l/uhAPGzGfMMqC7s?=
 =?us-ascii?Q?wJWtJvYfVHTNCDzr0pDEPqO5XtmtTdYcLNMKWZ/5v2ZHWSZ2SFV9rH7syr7h?=
 =?us-ascii?Q?FLgeDEy8L8aNIRw+Wb6zlBe/zTBufOS/x5QE0IdhZkcr9hIxODAsQd0Ujvk6?=
 =?us-ascii?Q?kCMg2OULJLb+QbmZuJBf1r0xXAEtE5kxZThqhjvSeFW3qquRNPlME7TRO+PO?=
 =?us-ascii?Q?ePILufayGes2JHkKSXHXg+dgSKVeyTyVFDHBbu3EQ2UD0M8+zYwnXZO4Qv7S?=
 =?us-ascii?Q?5msrq1FadEr0z+FqIf5i/157hJ+VfjhjAZT73aX78c9vC3MSu5qNxWPTKdMq?=
 =?us-ascii?Q?J4X4dbyoR0V2ap2srKmx/4ejLlrzoZyXj+VThViuDu20BkBNLR6zPxhcmHgU?=
 =?us-ascii?Q?ClDZPhGexNWuqzCVRJmNymfy/b7mDDE5SyhM27V54k3qVRF+5RU6HS75gtmf?=
 =?us-ascii?Q?n878P0R25IkJANiSyWUYDMbGJZt/gxCEHas+SxEnJWJnl279UrjKfyjQxajq?=
 =?us-ascii?Q?/iXuYSCMfmprV5qtx+LaOIlnZ088dVtItMMNh3vEfp8O6yFD9r/m+MpwfaDu?=
 =?us-ascii?Q?RWyaSrdW6Z8L6yOfLgzR7jFgPvlguH4MlAe83sFPf3UX3RQwcftPJ+4hQZj6?=
 =?us-ascii?Q?PemHTmItZxRnGGGSbhkWh6/YdjIOQzghYTvZuQaQ/6+LmufmUm0CPGyQXHqv?=
 =?us-ascii?Q?ioPA0LHdrAEctU9Q8efn4BF5HL4nC44wxflqP3gE9YbXvohxE0nZnBl0sz9V?=
 =?us-ascii?Q?8nEnnS4LDVoQpYWWjYhj01rnQudZoW3im0zjdlGL0Fq3L440bC/zwl/O453S?=
 =?us-ascii?Q?7JSvCW3rpTxximGQHZ3AjITwwmjiflVC68+9tlmYs2W5CQvlZ95uw5V0nKAF?=
 =?us-ascii?Q?FNnpoKRq66YMQfM+W2wVM7APbKhZeJzSUtuqRfVshBqBx+hNIvwWqStwSp6U?=
 =?us-ascii?Q?esisH5mfVDgqzAwSdVrK+DbBxVIXzW+eH5ee5xq36rQy6yq9T1d17qXppvgh?=
 =?us-ascii?Q?iDXhMMu8qDr7gho8QQb8B0mm3wg/9KP16EychqMjZSRrev0UqJSQ4/veUDio?=
 =?us-ascii?Q?PHKAUJ8LGzaZhguPsbovH/TcblwGv/p5n70izYpTlDGGQzYo8TgHKn40XnYO?=
 =?us-ascii?Q?fyAjyQgu0+Yr7Y+ncwpY0g+RaT/o+WixAWj/TcJ1uFIC2HahPiKklfA7bVPA?=
 =?us-ascii?Q?FPRmgu+ttmcsJhVXWp648zgahoEJDQPTopL+h7T2pPh5LNt6Xc/D+d81mdSU?=
 =?us-ascii?Q?8QSvDMx+09J7I44DYCzNBMjkA9P2pnr2bQH2OW5qWa1/op309wAaw6YpbVJ6?=
 =?us-ascii?Q?m1Ma3NPCBxxYo1BjBTPXHLV5XVx/ezgxQkrpttUfEFIjUc4rnA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:08:06.9436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a77b0be-0dee-4c0f-9605-08dcfaa0231e
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB8700
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 18:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206626

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


