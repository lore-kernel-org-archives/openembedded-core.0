Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068F6D73EA7
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 23:02:43 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28749.1769727753819167465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 15:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vRpksocr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.56, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLA4nCCcyeAOZ9gDSQW1MuvF9x+TnBtWhDy/lDnGWYYnnR1OJOQitBT5220cejpYouNjaw2ArAk1WSsTV3bn6Qg3skJeT3+Mi3F2gTFqZ4YMp3mamP+nSmBlemnjFHIfaae2XWcqs09NMNWd87vNRh2rR9jxv50ZGgAGfjgbmuicTO0JNwb4sqzD65TOJT11yGFTnna3oTcInDg2WRB9wzQUYL1Xnzu+3wN3ovJMLCGbNRhiopVT3WCCbCzez1uKRbz2V3VeJgQsQUbRlz93Ew3FkwuO9GQ+2+aX/GvWeFrXq4alWU7+Ktj3Md7xW7yR7gGNsUopDUVs5s1NRbi6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTv078U7Mx/ql/+eHDkRj53lVi+qT/YCY1Ul6dWsp74=;
 b=KHSic2w1BYOfQfqjKYiM4g+RDpTxm/EPU+yIdxHRZB4c3h4cwK4CZrFiZIg0fYnrkAlFK17jGW5EDO7DcvgJm2jpHwumec0SGVpL1YXfez274ymh8WblgyPsXySqP5xUdt0ljNgk7YwJLw8GvwMNvHIGxtS8GY9g5XCmT+gnIUwuNpcrC1zaW1rF+IFDGpvV5Yz9IOVyIAkjsbwLij3Y+BBMJtjAa2+nmbV3EHXOZGiflmGyj6OVLJ/zk4Srlwu6528Pos7CkOOnSmd5LlCAwYNAbSzY8aZ8fokl/Mnh9xcy+HTzEKIyg03C39/ekYyqjgz8kVut/rc7ntyLyugSRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTv078U7Mx/ql/+eHDkRj53lVi+qT/YCY1Ul6dWsp74=;
 b=vRpksocrNoBqasxxCna2a50mAa1eyOQk0re/W8cQiizJiCePlU/HmRfqNuRXyK57XNDujzPAZ5aaVe+lKyHmn+h3GSi/vKyXmrbjnOrMHD/L8MhYqUJgfFWZuwoipfQph+IAHq12eZP81IqUQV0Kc0gX/09x2Z0C/R0XnYtFpeY=
Received: from CH0PR03CA0206.namprd03.prod.outlook.com (2603:10b6:610:e4::31)
 by LV8PR10MB7991.namprd10.prod.outlook.com (2603:10b6:408:1f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 23:02:29 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::f) by CH0PR03CA0206.outlook.office365.com
 (2603:10b6:610:e4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 23:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 23:02:26 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 17:02:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TN2QPI713167;
	Thu, 29 Jan 2026 17:02:26 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>,
	<a-christidis@ti.com>
Subject: [oe-core][PATCHv14 3/6] weston: remove deprecated weston-start scripts
Date: Thu, 29 Jan 2026 17:02:07 -0600
Message-ID: <20260129230210.2934333-4-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129230210.2934333-1-rs@ti.com>
References: <20260129230210.2934333-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|LV8PR10MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecbb59d-bd74-4202-3062-08de5f8a78da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EGQXxJp6Iue7pBcHNEYpQ8FzFaipoitZY54e6XvBVYGZ9FQUzEhiID82YUeP?=
 =?us-ascii?Q?HRwhlhNu618K2EzwylQGHv/ta3rgFK1MQZ2yrM1vCLQWdSVzdt6iWqip7D16?=
 =?us-ascii?Q?v1eFD7wxEp9OXTkW620EeUt2H0NRslg/9ac0XHpZkjgkjE6Y6vfJSqXtLFms?=
 =?us-ascii?Q?+NncyjEHFG9vfJyUhImW3NVmz0i6LKGcMgegzAwOSgnkdy0pbA3xobuYpqWO?=
 =?us-ascii?Q?RC3QvNMzd2yl8feyZoTtPn7cQodV4MJr0JnNzQnIn/rtpbgQvxmzcj2PJ14I?=
 =?us-ascii?Q?c2YVBHqtwpLEgXnVqQnsM/7cc1ZT824vUsmWVdvAR2TbxxVYLQWJSo+qFfa+?=
 =?us-ascii?Q?aXfDZnyxwNhB8TG+dlWRYaLaTX7cXYgFnnwNo/gx88AdpnbbpzCbeLM9lH4w?=
 =?us-ascii?Q?T2Fdzqbjoi6IupqOpxTxBEMK84uon7gTwriQ/DA/Mf5WVR4APksIpw1orUpm?=
 =?us-ascii?Q?ajzFZiCVglLI8flOLDVn270Ff2Rg3wLDo3VRSCoP6LExN6HKOy/wNCJIIia+?=
 =?us-ascii?Q?njSg8RGxZOAQDsaeRzBF3nRNGJyYvlIU8x1cpUJ85N0rOmlTmL5ksm228EyW?=
 =?us-ascii?Q?qfWUv4YgAcmESmPDGHbWSMAnBlyu2rKjB0yxMIKyCZsMvmRuTSsPQCIri8UQ?=
 =?us-ascii?Q?e2D5C4q7W0t69D23DKWndE8qyji6Axp2i20HRDWAsjtisxfVmHGKnQ9Pdi7Z?=
 =?us-ascii?Q?Edok45WP0qA4+C66R2bM5g2KHXmWNxVOsCiyr3MhB14v5tmTvQbquRIDYJwq?=
 =?us-ascii?Q?5AVMCUOpJdUEvTnfGpzh8HassgaY58d40+UNzO8juPe5swLufQXVF0BghCsn?=
 =?us-ascii?Q?iHYfed7LVWfa2QZa05e3JqNAvHHSKmeq/yj59SGmooU9qdMmud+sMf/+/4l/?=
 =?us-ascii?Q?+JIhq5Z5yyBlSEeXhpQ9NULaCINgIvBlMNKc06QhdqJERl04oe88xsdDGIob?=
 =?us-ascii?Q?yzic/r1ZxU3OkvoMTmPsQ2B4MD5fupNTzL1v2rOKuN//yRJwr89NqrSK41Sa?=
 =?us-ascii?Q?9y8rZa9JVaQu8821R/8bXSMJ66S6oQE+fS8FAI5DFMhnz5pWVAelSEULboeU?=
 =?us-ascii?Q?MMCj6Zr7hlE1j1XJ8gFazzIeLjoJ44X8D4l6VVtQkFG0i+B9lfBPmQGbKlsT?=
 =?us-ascii?Q?uIwadDjmm0Un2HVzPd8Bi0qkYXZQeObSBMDmMrn5denvg5XTm+29KU7PWmuJ?=
 =?us-ascii?Q?7B37E3L7aJh2USpgTHyIJWiM7U3uSo8cQ5d9cVS8/ZM9fN8UOvyJpVcpG18C?=
 =?us-ascii?Q?vXAuFuY3OQ2QFcP/L2P0TK4F54UKQKVgxmCZVLnmau2dPc5FYSMXfmJa+93o?=
 =?us-ascii?Q?4ly943D5LyTfkrTapwL4nw/4lO97j6AJawEolqNHbsjTLzHXICQ21FF+534Z?=
 =?us-ascii?Q?LwG91UxlDFq0HxsB4otTcxiaNhiSgie/gHDOppkZx6f7AiXKUyTbCNdT8YVv?=
 =?us-ascii?Q?txWkCrAmBbJYXs8PE2cwNZcxMAtDB+1KiJS5383iD0iBWn1wS7eWfVQcjkKJ?=
 =?us-ascii?Q?hmd7kNRdNZ4OnTrJzNyFwu8AR0jpeaOsVqSlzW9pQZsBAXbrXF1q0MJ3F+4o?=
 =?us-ascii?Q?TOrw8jKCuiH0gM7FAQ5JeICyNgnul10GvL6ak5P5mi4DmWDO1IYJvUrK6WRT?=
 =?us-ascii?Q?xQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4h4AeSirrK/vNSQt5OHPVHmFW75hfaCJORvq+Kg7dnue/rqWasySLQQmeNmKYiGx0duONyOEo633EGwul6Zlu8r+KYERplCS9qaI3tb8dCe5bSUp3WfdBBEJ49hOgAFCzP+i2qlgkTvfBA67SELwgprHv+OLMrslnqr6pfh+O7V+DL0HF1YxYbGh1fW4GGENPQh7Rb/q1ma85FP42RHZUevPnz3e+bXdX+FE/523nnd3pvicg1cYwffkBD5Xd5yD0eVQiFJy7+hGC+GqkrEPU17DIGH89FLA552rVbo0UpGQoCz91JlMIHzTULzMS4C352BuhE9fDH0nCE1oNKvMxv0LOgJ0q4aXkAojDBVyZHhgKneUgKXdzEAXE9EOv/c4oo06b2Mfk/eb23dfCMQuzcUPvMCfuQAYT0g37lZn+Jk39GQ+vkmbdLrk3ZyfLvp7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:02:26.9918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecbb59d-bd74-4202-3062-08de5f8a78da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7991
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230167

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
index c53b03def0..7ac7d5d314 100644
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
            file://0001-libweston-backend-drm-meson.build-allow-libdisplay-=
i.patch \
            "
=20
@@ -108,14 +106,6 @@ do_install:append() {
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
2.52.0


