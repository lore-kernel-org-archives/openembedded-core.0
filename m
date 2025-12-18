Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C740D711A1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 19:11:33 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.163.1766085082951238915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 11:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AZEw6hcQ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.28, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1rK2vO5b6nAVVE/tXhvg/5NLr330F5H48KAaMiAvz0LqhVQLYMdH1NQdYqTNNcDON+q9D42EERn7Qe084Xyy5SyoFC4ll9/8Fl3kF2sFuoawYPe1O1AJOzNKK1TeOWv65GpCTLIRg9kZpqeLVxFSKgsJYPiRH0JHhPVzPJk9b8BCH975mVQAsiWAdd0Nrza3+q2hoSfc95HthG9jcP8VqD0Fz+W4iT8s61Rs4MqEZyIj+8LLL7sEqVnHQj4WCEYiOXOpOKeRzPQXesoAoU5MCAgrN/BYnWswSjL33AFwvXASrHsOFnaeyRmFeBYnC2gyokBph5PrIKMOoKH7MzeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybTqRh4EAmrxKCmbR99NVmTdy3n2zn7pNVQKVH56DX8=;
 b=aIli+pyi5cR/PQOrWzxKmdM1I5DFe+hwE6Nmmw9PG7UXYajRNCMmLGQyal1Uz/pe7tZx433Lqk7lA49FZPGLcXB+GA+CU+jocgoMa3SNPkfMrvzHOoqYj6yMSVYdJqzbdN1nyIGmNRW9/2wEnC4WXdFu/d5VIWLufyc8ukNyOXGktAlkwHBqwdnhw5awn18Ug+RCnlJB6oWVjEt9hHMd9TEuBtcbkMm9MGl4oU70TfVr/KAUQ4MfEUe1JJy/8AhBLEAOfZN1HUxholMf9GUc6k2eRA20SlVyTWZDBuKNMm2OkzKSVaXSd/nEzZgiGvwdhx8kHqf4NDI6klA+4RQyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybTqRh4EAmrxKCmbR99NVmTdy3n2zn7pNVQKVH56DX8=;
 b=AZEw6hcQe+LBWdeNqvw3JkWVLTpusk5mp71wzm3DQGYSotVK6cJ/hSneANta10yiydKyHBvYI+e6aFjAo9X3mAg5HqqogqCfHacvfIVeieWiQjzJDSm8vdA41kMYLwOaSmtROR/7SsFAdCSe6ACIfcMf7u5+Opki6py1g2khptM=
Received: from SJ0PR13CA0111.namprd13.prod.outlook.com (2603:10b6:a03:2c5::26)
 by DS0PR10MB6797.namprd10.prod.outlook.com (2603:10b6:8:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:11:19 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::1b) by SJ0PR13CA0111.outlook.office365.com
 (2603:10b6:a03:2c5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 19:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 19:11:17 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 13:11:13 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIJBDtH3796612;
	Thu, 18 Dec 2025 13:11:13 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv12 3/6] weston: remove deprecated weston-start scripts
Date: Thu, 18 Dec 2025 13:10:23 -0600
Message-ID: <20251218191025.667701-5-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218191025.667701-2-rs@ti.com>
References: <20251218191025.667701-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS0PR10MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa76612-fa42-42f4-9c5c-08de3e6938a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?69mzsLWJYb1YTdxvUxXvNFsJO/MGyuNPbTu46ODKwJui05u2bP4nL9kWNe1m?=
 =?us-ascii?Q?5OuTPj2d6gx1r1yYfXKA7V5P9wsNWWkW4El3Q4z5uWvWxIRoB7vMOkWKFv69?=
 =?us-ascii?Q?5nQSOy9Zl5qxeswsjkjD6UKsMHt7ex4YYIaeiCMWBM2IhEgBWx4m6aHp7zvF?=
 =?us-ascii?Q?ZyI7NBNgTFOHrNrnovTD1REtvOR53WmqopgWI9mDgSSWH9Ge2iDnI8IpGppc?=
 =?us-ascii?Q?Oo1Z3T636kgIbAX1lLMU8w5V/Uy7Lyiks2VbkTMdyT4a0fh9sSv2U/2v5QV/?=
 =?us-ascii?Q?+lob7Kjd76+8t1vkr+ygxYru+P05RBcY2yZG/lsJ7d/2p94++4e1M5ASOIGq?=
 =?us-ascii?Q?CAtYU4yiiFUkOZtAar9PBDx38BghuWvtg+5et7kJEUUV/MEEW07es/hv17Ic?=
 =?us-ascii?Q?o2tUikroGQS7QrFf8OlhLx6/58cKqY4GGdt2O/nwrK+jmusFm1ue+J4aHfG3?=
 =?us-ascii?Q?n+rCGaG9tvW3nUDXg0aSv9NhDvVq0DJk5Msh3gO2dKuu+3V8K1xAe6Bxw2ff?=
 =?us-ascii?Q?The4w0mvgo8neovWK6ZXMtzeTmAjkER3Oi0AZileJcY6Tob/DIuarOHzuaxZ?=
 =?us-ascii?Q?+eIgTCVW8lMRusksl5yusYoBpZlYyb3+nExP/r2ojx6H5E1EKN7+3P5qbDAo?=
 =?us-ascii?Q?MA6NtSqFybSgx8iWqsdeQPcE88h/ZjL8P/rx0y8nODv2OrYwCAbaMbFWcFbP?=
 =?us-ascii?Q?Ww5MGulybdM+m/LmORMDWXsnF/f8mJUvRTIRc8KGwPSCZ9ne0BIYOcJkIidp?=
 =?us-ascii?Q?EqaAZKqIVqjAHlRmTFPq6otLHRijvlfJuSb6NgLrC/WnmsOHM+fVlrs7pf0T?=
 =?us-ascii?Q?yk267whFEuQytm5BkUCs7LzcOK5sb9L8NmfVnl+1cbdiaLOyOVf5OwqGeTDN?=
 =?us-ascii?Q?JDwPS7fojSWoCSzoWfM3zDaGjhNiZyqX0TAZWBtcBctAHYCCl+ZrXGqMuhsb?=
 =?us-ascii?Q?O0dORZrUJGRmlBnLg68Q0WrAv4GxrSRy/Msbhcuot32LtZg1efv7Mr8vTvlr?=
 =?us-ascii?Q?oQU+xaQWBEBYVEf3js77gz4spjVi55410qhXGPQj36gzz6hyqeKL8u2xQY08?=
 =?us-ascii?Q?n3g+JAdxjnZzc9ciMxCPIzeQWjMoVIdgFHeJ/xIblQG3anoHWY0uCDpxqsnc?=
 =?us-ascii?Q?hSo+bCS9H0LsCybtAkkkFtzKrBsrTn7tyA4GAtiGeKzUvmFPBc4O05NdHB1B?=
 =?us-ascii?Q?+0UVe2if3auSxrbMQevZrdu5/mpeHqBetUQwb64PWnmJRJR6/iywuLeiY1MZ?=
 =?us-ascii?Q?NcGRrRgtCiWaSkfc+dPDLQXrKiH3aLedHlTH6NW8OmOgj+/kL6RaCSY0ZdBV?=
 =?us-ascii?Q?34KQi6Ake7tLdZh48cNPB3GoeN+rKP5hQKymVRkuvgjhKGXSIgwVWkKAA1/g?=
 =?us-ascii?Q?Wp9Jk+1yH7Ah8Xk6FTQGzjteoVrzwGdOXoSCAEmpvE8SI1Ppc+bdvwyXNAQs?=
 =?us-ascii?Q?POy0Bj2oYaY8dGHqnTEm0/c+5DWEvnN5adOFCrDvFOs/nUt7SMInxfcrPBe0?=
 =?us-ascii?Q?obDLPTf8FVj7ESAqNLkvJ2uYZVygqIJ73VgKhXadqbD29qIMb7vTm87pCsxn?=
 =?us-ascii?Q?4X1zeY5HRxwAf4apyEE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:11:17.5141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa76612-fa42-42f4-9c5c-08de3e6938a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228137

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


