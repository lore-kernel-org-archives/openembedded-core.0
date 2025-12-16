Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB97D637AE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 20:38:40 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4009.1765917518951646103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 12:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CC71RVRV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.23, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsyLYiNq3XyZmysNahulbdvFgLTGNDWMVO9sgQHO5UNqSjJhi+mL+8ynRM6Ff1vj9pcjDmmr2EXZNP9HpNBX/V+xSpduz3lrHAeSODUJHcQe4ELG+2/3IORF931REAKbtX80Lh64sVYw6euf4qNZW8l2QWwWlVAMQmKh6kvCkJSzl8KoizZBP5g5bjyoE5xCoXztpG3t/GL+ywbEgBCaSrQTNIC7jxPSs5wN1eAWsOIlFdkO5wnYJU5zc5iEt6xWtA5Q3C//IRXeSnVqvpWzneJmMdj8o+8DLbrJJPi8oVqNPtRk6i1ZQDWO99yvF/xb0W41qAi6MVdJPiBz2uvwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybTqRh4EAmrxKCmbR99NVmTdy3n2zn7pNVQKVH56DX8=;
 b=DWN782xvC31rXNUUvyjHCpHcbd6zwBUJCGIMZ3SgXTmdz9usZX8fx1tw0mK0uRWufrYcUE5+MMGLtxPh5+vbPi3waADC+NQkh4mLfGofhaAcvV34+5plrkTA0oRQ/MdS9iAlf9x862PcpBe8GYZwUueX52B6wLy4Knya7ARUDibrt1/pKFkKv23IlAe2L2JyskbrX6fXK2SHm37sReAKB1fNJzkkOO49lrb+drolJyScVtQpKbluxYSZu+fszCMnHUstmYM9+s0FxFi5+VPwYiUgtlJ3tG+VNPj+fZKklpTVK5mOLMVEGG+VTMW3vGOJTg/qmoD/wNMBM9fjW4MGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybTqRh4EAmrxKCmbR99NVmTdy3n2zn7pNVQKVH56DX8=;
 b=CC71RVRV4IKTDwZVo1EbL2lr7cVSssiBNqtbuzuhKu8GAZoLUH1WPfUViKKVtSchXmmeYN1O/bUbWWbKvOpA9+3TDimvW12wDQIhq8WtRY0eQhxTSfg19MvTrr9MrmyzzLa3SyRZAli9kPogpIMH0eHwWZ49bjx7SyjgLgzeudA=
Received: from PH3PEPF000040AB.namprd05.prod.outlook.com (2603:10b6:518:1::4d)
 by IA3PR10MB8275.namprd10.prod.outlook.com (2603:10b6:208:577::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 20:38:33 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::3) by PH3PEPF000040AB.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 20:38:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 20:38:32 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 14:38:31 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGKcUhg402388;
	Tue, 16 Dec 2025 14:38:31 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv11 3/6] weston: remove deprecated weston-start scripts
Date: Tue, 16 Dec 2025 14:38:00 -0600
Message-ID: <20251216203803.3870049-4-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251216203803.3870049-1-rs@ti.com>
References: <20251216203803.3870049-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|IA3PR10MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: c82cd8d9-4487-4a21-1901-08de3ce3145e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mCAaIBrjPCYIp5adY3DPaIYPnr8XuwdpgoIwzNt+KUKUFR2b2COCQPffy+Q0?=
 =?us-ascii?Q?Uhr27AGV9HPHbyDSyBcjFJRa3ZL8GbsqnBGnljkVDS4JjRYUbjZWMWAtqHlf?=
 =?us-ascii?Q?BwqWsyH8Udpehx24wuFVl2Jk3Y4sGaMV7TYaZm49lmKtob4n9HpDyplHWCGy?=
 =?us-ascii?Q?bhW1IJjPUI1Ekp0+bV6YyVoQ3z3yiUX5XpsoaxrgbvX8D0Wh7HByw9ZSdX/F?=
 =?us-ascii?Q?hjFUMRwzKnARWNjZXb+M5iMYxZOj3XM3lQRFJB/K2cIsIWolWvUPEdeRgf/C?=
 =?us-ascii?Q?OTZhLfA/um66HG519nboAV7CsK9frO7xD8hiZ85/gkjmqsVISNFOztln660+?=
 =?us-ascii?Q?cSFCeSveY71YbKBp9CDCHVOKvU/psC70U+wYOMvJDAsGWTpSwhg4ZversdRh?=
 =?us-ascii?Q?E759YVR/5Q3sD4jAqT6pgIoItYdbsd54Sxvx3VaBKKwJpqy2vi2XaSPPo8v0?=
 =?us-ascii?Q?IPiiWb+7dy/OdHfafJ3pDmco3Kd6V73osQqk27F8rjknYrgi6kbrzAG14XRL?=
 =?us-ascii?Q?+S5D4hOKqBu2dMC+T0621ek0+58DS5lLVHvp2BJrSmrOik8elJ/7/T4KGfRG?=
 =?us-ascii?Q?yddTAkZ7zxp2OnZcypmWABRqVdn3ObNs5sbo/YPhSxUtb2MeJpPMG0ihg96j?=
 =?us-ascii?Q?tEJ5bHSusPdodpzHzDzNe3nb2PGfzz9QIj/kGxwDKSX5pssTuBaAnMCG0BT/?=
 =?us-ascii?Q?tIa8MtzCdMd6Bd1CT7ggxOtZEaBHwn3mtb6++byFCkJbZjncqpND5PMvlfOp?=
 =?us-ascii?Q?qNHLqddGadXLdarj8ChUgXa+cB1vk9y8Hr1MQMz0ibOtZxheympaTpue9YB/?=
 =?us-ascii?Q?AvJa/XD1v5q/3iskdgYMtqFrgJF5/s/3OLAm4FMOniPz5WUcqULbrEarYZIP?=
 =?us-ascii?Q?ECC1KF2oDxKWHKIDTByeU0RuvGIfi+MNhKZb4lZZjKI7A5wiYTSxskBMlT4p?=
 =?us-ascii?Q?tHSiFvvvPYfUNXefGLVqKNlQK5dzeYb38mvJrWOJKIwcRVfNJ3+i/iFMddZL?=
 =?us-ascii?Q?y/h+mJUYQFFj8038bCPPFSdQHyMQ/8oeuV+21TH5u+Cds+BWY9aS14jNj0TJ?=
 =?us-ascii?Q?R49VtJJSx30z1k8GDEjpcegMG1mTvNwKIWm6DvHRzzpT6AROF7BVl5c+YWUI?=
 =?us-ascii?Q?cpytuE6M/cUG42uRqKZvqAqM6y40UNtIlMt8BpiM1PlJY83hI1oY0D1Znp3v?=
 =?us-ascii?Q?t1u+lVzxGUDvOFTIRL7n7F4r4xV01w8X8YO50NKeWjrKIY9ue0SKaP28NHAB?=
 =?us-ascii?Q?3R8sQGEWLd6aFuT4azarCGUatFLztwAPkLbFdrk62VQlfi9/6tPavtnLybEj?=
 =?us-ascii?Q?AGTJzGTIBGOifuy3E/wd2Br5W/Q6ZiyMlM+e1nPamw5nf4cBXhG8Rjdwe/7g?=
 =?us-ascii?Q?fqKVXyUJyZkm7ri/54t23d6X0G3yYn8AcJ9GuMEDNiMZ3OABRY2cWLJpcIWd?=
 =?us-ascii?Q?vM4OMTe/yalRGoJBdlk352+7SHLHobw+unMaXo28HGyooxxs6v1TwGqMlgnb?=
 =?us-ascii?Q?C6I5vBOJLUPmrVA9g5rGntrbnWLjZReOQHbvVL4XWc/Ol1OzGMGem8AOEsKW?=
 =?us-ascii?Q?x1bJwb+bMpnl253QvsM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 20:38:32.9336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c82cd8d9-4487-4a21-1901-08de3ce3145e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8275
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 20:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227986

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


