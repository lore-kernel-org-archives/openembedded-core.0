Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD8AFEFB78
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 18:31:54 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [52.102.146.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103048.1772217110732584711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 10:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PYvDSYTt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.102.146.46, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTyPI2GVGJj9Zxq57Gwo3yW6cora61YxmRmvMr8t/aEALmUi3XzgyTQne6Liz3AlM7GyWBJLQdG8u6OoFB44sKrE/6G4N+X5T1bTqyLywW3lv1gRvfjSI7Rt1phyHgQQluXSfB6gSHuzAdSHNyKffhkdSAT5OWSvoLJjORhfn2hKzWTZQmjGEIrSYq7FbjeuPlwnPnJdtfP7bKY0wB7NUJH+q0c02S9gFAvMryf7V4coTbVXL88nBePUk1ht9nNQFnAmLYpa5ufo/26EnZOfIffQKTqxVPkI8eCVZBxAv5OWgXJeh8GqilP457BYuqznALmIf0fFnThvgJkStzAgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FF5GiS5A7NXIFJa3+RfmaN/2N8q+kt3G9osAqErf9qg=;
 b=UTM0inegnBVdlX7+SR3Z+cQZuXygHE/A8vgEXYUmhMv2jxK4KTWeHUnZBL5p6auZE1RD2w8Neg/A/GOSLH4Gag/zVvPfGi8UbRH4dEDYjo9poWMz7U7moSRB+J/AXlE6it3rjVt4hl95H7uZZjQ+8h/1m5sWZHtblD/QzNjCasqQOFlv66KPssdU99IX+mW89UHvnt+9lDo+VI6wHaW/rkY+1KCkx1+FrHqQzhlTMZAO1fsi7w0pRLEdIz1WPrIJXfB6FQaVc+MmS7gDVIBGGcpapZNv3PpbBrnyXKxWMRv8r8ql6pXDMjMzkqoB1g/mdTdksr01fX2qsWSAU6tmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF5GiS5A7NXIFJa3+RfmaN/2N8q+kt3G9osAqErf9qg=;
 b=PYvDSYTtXxnt1n9qmKnPhRtf1tBxx1miTPbCGuJutLkctyVvdjgsgtiRtjJFtPy6vEpwhhut65tm/eZfSU5WywXL1qtsrgViZbiJc5NZXaFE9qnJ93ONiTT23P1alT18IkxXdqTR5ZEXjglUjGH7XRRQY2o2sRdi4XXJYdOKvmw=
Received: from PH8PR07CA0040.namprd07.prod.outlook.com (2603:10b6:510:2cf::26)
 by SA1PR10MB7697.namprd10.prod.outlook.com (2603:10b6:806:38f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 18:31:47 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::f9) by PH8PR07CA0040.outlook.office365.com
 (2603:10b6:510:2cf::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Fri,
 27 Feb 2026 18:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 18:31:45 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:41 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 12:31:40 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RIVeRY012242;
	Fri, 27 Feb 2026 12:31:40 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv16 3/6] weston: remove deprecated weston-start scripts
Date: Fri, 27 Feb 2026 12:31:32 -0600
Message-ID: <20260227183135.64544-4-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227183135.64544-1-rs@ti.com>
References: <20260227183135.64544-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|SA1PR10MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d30d8fb-51d1-4864-7b92-08de762e763b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|82310400026|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info: 
	nPYiT1g9hhxqdQ4lFlw4ZO1ySmUlknWM1gpckqeR85tzGidJcPT0c36YuL7M767MqPLqOm+NTQdQfZ6OUofHyG2kp7AEhN0vE/jWe8PoKLaQgjn0LdmYKkl3SV3sG29k35dn1diz48i4TVKmC1kCVNmwYn+bZ8dBbPslLaLKg4YdwsZZ0XT1G4hKsQYrFeTUQU7PxbPF/nG4yWAVz+s6QTspyJcOt13bCjv32GPm1Xx3chDXcF1CuyLBYUnD0tmLvrwQo6BNPMTTVli6SvFYKv6Ll0iuoSUpfvboiUdUUIZ3Ygl2ZegbPZKS1xE+7/RVJQNzRbcM9or6uj1nqVLYvMxwxyAp6UrH5sra5lM+PzInyjBR/nCoVfnpIqZXCWH+ZDnL4L0n7ZYLNLPa8Hcus247PYnm2CM/9Op6UjzHUDS7XhVYHxPwk9fR290Bemk+ClKpeksumRvZVZEJj8XdY/QmM/RRbRCxDWxUzrsNn3c8FI0dnJ9OwyWHEsiXF7MungaC6UqbLcOQ1wwsAfefZOAPba4wuXMJ2t9SywlvcIt2VVTQoSnTM7phMmXv4Z3dkUUbTb+FS9wIAekUOa9vqjcRWcdfI19/xd4avVdW/T82dbM0/0+3VtrNV6YnVR67dhlXgdmHlwLj9hKgqpw+J6SdhqWcbydqTDAmKE6+QOgWddemiJ2zYCXFzqz7QMnBDi5NKZvE/svulvY995n/B9URK1RnM96gqJsYJEue82hDjznrX2Wu1cBv7mIab29sGCg2rbf+EXFrMEtikAAwBA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(82310400026)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cwU/x/Zz3MjUjKnJPh9R3rV0osvRYVmiPf0oLqsvS3s5Js6FnPLYlpcv035Tqwkhiho2hU7uEJAhMcyuonIxzYGzLYlPs2Hk/J3GueVKrl6IgTBbzMHACViZxetsiUSqLlXzvgFhQv5zOUdN8xsNyNS5J3eBynL+AYauICNoz4vfjUr1uzyv8J4haL/uJFd6qXorijU4mPzM6dVzgZIkgbkiAa72PmSnozE3LJESDiaWWwGdKVsrYXMoKO0soqkvu4QyBFQGCjZMYzfekBVddU2Juq1iQeI09AAIDJofujhBmJAUYJr1ipwzcjowmIu+wqVcUUpKEK2ZG2PI72/PPn0CgXPxLm6DR51Va0UYWwy168wR2O74jwLxxvXC9TM7zmj/yurQ0wQ0eJiw8zHO4aR83uH5lp6UAwS2GQ7jpAA5Q0zAXRyXye/YC0q9sRQi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:31:45.6484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d30d8fb-51d1-4864-7b92-08de762e763b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7697
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 18:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232107

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
2.53.0


