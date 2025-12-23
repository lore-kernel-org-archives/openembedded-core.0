Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E4CE748F9
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 22:01:37 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.110132.1766527294725529909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 14:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kLyWcwkx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.7, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQInjh4sUeIHEyZbnpn/Y7llRZXvkLSRIKv+iE0W6TKjYzVRJYWgIWxUskwJauiQ1l30QlhVuFbadZOtIzK5J4F8iW48lnOhEBePdQbt+lkunRHQMyan6X7qUsvv5PMxkfrWzx+3ovTLGYY0Ye4as/5Ccp//KSliygSRV7N8R7we2aot/VUZwYthcQWozbScYUKrFfU99l1P6i5cfDnAJ5n/TeAr3yrXylEWAuFvSta9wCnCdsIcIhd9Fr+9ax27P9I3/Ol/4ffxDv2bEld0C7hr4BTQmftMdrkwoeKC9wCDZjsiFNsPJRN2iFX5ehe9rbc0eJGXnj3RGhT6/8uqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybTqRh4EAmrxKCmbR99NVmTdy3n2zn7pNVQKVH56DX8=;
 b=nCdCLBewvttoFVVas/CcjN9AwX+u8rYeGfZqIMj/BDHAabTNNuBIGWthAKNyST9d11cN//ol2Y3r3uPgDS/iX8AwaFvNXJ2pSIdtiX6Kcigx0gnwzfvPJIApeAi7w3g3/0B3zYRTjHlzmlLrVFmL7JS4dcWRGa5e/vIXfkD7uU8AkHihRV5JA7IqCZpl/qHep9eKUcVsWPPQYC/On94CV82Uu8CJ51xXw6JhTiaSnr/6CFD7F9gI9/rKJdptBuqd4u9fBG56uY+8M0zQHboi+Qe2KXogp3mZlLhx1A8ANqZLuPFk7okDeRQazBKTevL09RapPn0QHqkWM/8yeqoUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybTqRh4EAmrxKCmbR99NVmTdy3n2zn7pNVQKVH56DX8=;
 b=kLyWcwkxod/abt5nX2WNswuuPKvBvlQtpiF5Yb5QLg9etYZe3Q2GpRg5UoQnKc27FRKZdhD8PzQU7EGnAdvZf32uzgEgokim+NUbrtSkQhhvFQCKo90phmP2w15Gu6dUrrkMnAM378GlbmO0ENTwcMEFDMR/mPAN+lwy+iDvUnw=
Received: from CH0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:b0::21)
 by DS0PR10MB6127.namprd10.prod.outlook.com (2603:10b6:8:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 22:01:32 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::d3) by CH0PR03CA0016.outlook.office365.com
 (2603:10b6:610:b0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 22:01:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 22:01:32 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 16:01:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BNM1TJN3656883;
	Tue, 23 Dec 2025 16:01:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv13 3/6] weston: remove deprecated weston-start scripts
Date: Tue, 23 Dec 2025 16:01:11 -0600
Message-ID: <20251223220114.2259233-4-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251223220114.2259233-1-rs@ti.com>
References: <20251223220114.2259233-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DS0PR10MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: c89d8c34-30f4-421c-d53a-08de426ed522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S5OUhnLAvopQMo1CDBZW3RRny/8DnJE+2G6dwO210YOJcdq+2qlMfecOAEq8?=
 =?us-ascii?Q?2qTO65h43zwm/hQnsRFO2eYUbcdWJZTzt/ElnDsq6Teq1dEhEqucLLEbuG4D?=
 =?us-ascii?Q?N8tw0yRdStz6j4/HS+6jaH5+1+TT/NKOljyGIWM6OXBEhzuqfMoDb1jq6PKr?=
 =?us-ascii?Q?bci6BalyZ/PRpPM7o+UH/B5V2NPCFWcZKdughUPg8ZKx4FRp2xLQHToWU5/z?=
 =?us-ascii?Q?8w8zogZM7kUjn5/4/q+HPJlewieMFATkvqyrr0lXR0nMebVrDd5Gfzl2cswi?=
 =?us-ascii?Q?e0E8e6lFsOjzwJhI2Z+I77QH8coTQA6AziCzGoK8lDvLYmahqrzkr/W6mF6P?=
 =?us-ascii?Q?ulp+MiIPW60lhBEAgwLyl+jpxnm0UP0EDLG6iMl9XDGD9KMjXTKX/xIUC0ht?=
 =?us-ascii?Q?nX/+/KVfB6ZGjoUZtUGplJz3CBkmR1jDpXym7gkDJaQMNHns+nyzN5gCixHv?=
 =?us-ascii?Q?CIR4rUAyGBgolm3kQnRoFap9O2LP9fpJ60mtuMHyBFwHoCs68zriMLVQDlj4?=
 =?us-ascii?Q?8onm+OZ1MimUjmhfSKuCD9FMVMPnRRB0qYOhysKJZ8L5wwjw2NoqhyuQTpT+?=
 =?us-ascii?Q?idY8WCSq2vIliqXkfWZynVDpCQlHyVMmRn1EBSSWUAq3o9EOCjRvym3btqdv?=
 =?us-ascii?Q?nlcYU71aZTweuOZ4NbYSQsURq+SJLkz0G7N7EQ250wyVZOMRiUED6xhn5qH/?=
 =?us-ascii?Q?4xjw4hlY+gbANorrZenMq9/SIWll5TqqdHgyb8p2v/gbv0/qbRspSy63sHwB?=
 =?us-ascii?Q?L4ZVJq8UUmOaAxWEmVVQ5fKfv1sY7nENbwXwZXsJLFrX8E4eskfMw2QTFdjx?=
 =?us-ascii?Q?NO9iDuqXvKsm5ykJY/G7gZ+v1zj+kRG/6Mm3HV2x0RP8iT23q/y6kF1B2str?=
 =?us-ascii?Q?u/SWvuOHtx6fGWKk3yAQvcAyeUCY4ogbfM1SlR082xk5+QI58EDIP8HDwq3m?=
 =?us-ascii?Q?+ySUD+l3SRwALhT1tvs3QitmmriNLA8Zjo//YlIR7tVkDUajJI83zJ3vtwQQ?=
 =?us-ascii?Q?Cvloz1INUaL5piB553pe7kOBneVb+smWEI7YJhBCWmbHaqDZX/4h5vWM1hkO?=
 =?us-ascii?Q?NIMSVvwJGNVrenL+SMu8bDkYIG0D69jyEeZZRkolrkNkb/uyfqXPhgw2POdx?=
 =?us-ascii?Q?kY1HOl0vNRTjWjBLVqzYwoeRi5QJTQONFesKkNGyRJue/8FigrFtkOU4vfaL?=
 =?us-ascii?Q?1ZZP+unmIdrdFXssz7mG//KoNySv3WiVR3BRUew+g30UzCvMlVG7R7kQtDYq?=
 =?us-ascii?Q?JyRFvNa88pxmQjZjaiS1ysTg4um08RaIIrKd9MK7vrVJKYJIlR/DKEhE/m3k?=
 =?us-ascii?Q?J9KXEHtoy3uQHHcHAr71Gh9l1gOPK4DyBq6L9dD68jrteH2ZLSNPNAuhhaNg?=
 =?us-ascii?Q?JszGHs3CCizF3dof0G/4ow1aOnFEKhL8icVekWefC4FwKFkjH9ZUKtg4a/K0?=
 =?us-ascii?Q?mv8SXq3eWCI8ASB5W6MXRSYT0ibXay9l7Gp5RbA1ZzCmzsdcVyJA7JTuzQ4r?=
 =?us-ascii?Q?OLPhsQ7f/81BxLDGxYpFyWxQ6udCNeUOcP4R99Wvgm4rb5ztr1rYw9XqvfXD?=
 =?us-ascii?Q?q3EGxh5N7l9UgQCUaZI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 22:01:32.1970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c89d8c34-30f4-421c-d53a-08de426ed522
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 22:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228505

From: Randolph Sapp <rs@ti.com>

The weston-start scripts are not parsed unless using the old version of
weston-init. These files are no longer required since weston-init moved
to a virtual-emptty-conf.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../wayland/weston/systemd-notify.weston-start         |  9 ---------
 .../wayland/weston/xwayland.weston-start               |  6 ------
 meta/recipes-graphics/wayland/weston_14.0.2.bb         | 10 ----------
 3 files changed, 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.wes=
ton-start
 delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-st=
art

diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-sta=
rt b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
deleted file mode 100644
index a97e7b38d9..0000000000
--- a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
- =20
-# SPDX-FileCopyrightText: Huawei Inc.
-# SPDX-License-Identifier: Apache-2.0
-
-
-if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
-        add_weston_module "systemd-notify.so"
-fi
diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/m=
eta/recipes-graphics/wayland/weston/xwayland.weston-start
deleted file mode 100644
index 342ac8d129..0000000000
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-if type Xwayland  >/dev/null 2>/dev/null; then
-	mkdir -m 775 -p /tmp/.X11-unix
-	chown root:video /tmp/.X11-unix
-fi
diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-=
graphics/wayland/weston_14.0.2.bb
index 73c9ce38bf..7e0867f96e 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0f95d=
3386a7acae780b70 \
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV=
}/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://xwayland.weston-start \
-           file://systemd-notify.weston-start \
            "
=20
 SRC_URI[sha256sum] =3D "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c=
46f78f20b6e0ac"
@@ -107,14 +105,6 @@ do_install:append() {
 		install ${UNPACKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
 	fi
=20
-	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}"=
 =3D "yes" ]; then
-		install -Dm 644 ${UNPACKDIR}/xwayland.weston-start ${D}${datadir}/weston=
-start/xwayland
-	fi
-
-	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}" =
=3D "yes" ]; then
-		install -Dm 644 ${UNPACKDIR}/systemd-notify.weston-start ${D}${datadir}/=
weston-start/systemd-notify
-	fi
-
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" =
=3D "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
--=20
2.51.1


