Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965E9E7317E
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 01:21:11 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6849.1770081664509248304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 17:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=tDhvQ/Ll;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.32, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtW7e5vXWEcT9lWGM5LjtLxlnPG+x+uyi2PLVfFebz1sgIoQr0rFJn8JOaDoGs2/1Fyu6cyJdlBM8krkbOKH+nql9kseVvXFvoWeEO3ube818bfofridvr8hOGBojw3gzTzGyx6YVlmffpm1+i86f1Utgv0sOvIqDaIyqilukL7wT52zTg+VwTrh7Irm/XybaKBfPly12syZLCPPu6OpcqVetJFEz2BEVbyrPTjkZ/9IYyjtQd9169pPEp9mcXA4F/B8T/JdixzhOFU0gWgc91i84tbBOoQXv/lm0MnG9RYRZxV8motFKR8yWeyTpQywzmoKMGsfezBnJLqmyfJAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTv078U7Mx/ql/+eHDkRj53lVi+qT/YCY1Ul6dWsp74=;
 b=Tq78en0p9hhyZaZJ+PU7ttrVZCrqklYmNFCJjvMuoL8BjixKWoBwGCbeGyI+sskTGc+E0Dc709KCH3aqWkzMz4010q+10E6MyPYhN6RdzzpOIrylPwPYA4DPFFMI9S80gyEVO2GPxEGUBA2d/JbaT6MoLhoiAiE1k2LPH0jObBIGHfuVQiv+DJ/uBdB7Gmk3c0n42QZZYoHjAuvZF42nY9KuuLTM6/y2gFgavaCQjRHwJN4DABaiTfzRFflntEOP3jmtbu+O28+M+4OURlAdKFdDxLFEzFqsd2ajCWsdXadT6VmvYntNfJinytJNVmJP1TwFnQdrW01pBk+6OerPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTv078U7Mx/ql/+eHDkRj53lVi+qT/YCY1Ul6dWsp74=;
 b=tDhvQ/LlprDiUuk4jy2qwcOqRDR9DSBoLTnf/0Ql4QA3cIc4TvF5Cn1AEzfugXnvwwFmS0ytuJnq1yObtSn73ijGU8QYcgJG2+JO0aGejb7kZtHjFkA/LhAR3hCAwWvZgQKg9aXj8X3xevrcZI8pIQnawgYCAG4ZxQhirFgRN7k=
Received: from BN9PR03CA0983.namprd03.prod.outlook.com (2603:10b6:408:109::28)
 by CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Tue, 3 Feb
 2026 01:21:01 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::73) by BN9PR03CA0983.outlook.office365.com
 (2603:10b6:408:109::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 01:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:20:59 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:30 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:20:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131KTrX3095493;
	Mon, 2 Feb 2026 19:20:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv15 3/6] weston: remove deprecated weston-start scripts
Date: Mon, 2 Feb 2026 19:20:25 -0600
Message-ID: <20260203012028.4008229-4-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203012028.4008229-1-rs@ti.com>
References: <20260203012028.4008229-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0c334c-56c2-4f27-406b-08de62c27d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CInZP0sdNZeVEZR2jdxbyPhmAj5y+SB9RR/1sa0szM9kJn9BLk9RE08LVcXj?=
 =?us-ascii?Q?fB7C2fLgQ1Tnj8PSAA3Hv1mzEEaUr5UU/SRv0LPcIiuYdqjr5YR/NFGFaD+I?=
 =?us-ascii?Q?6nYUxK3oS/rgSGLHZdCM1CsF4v1X9gPjUZ4SHRaWweskMEUu3EEJShx2fOz3?=
 =?us-ascii?Q?N6VrXbMtE6s1PLvhuNquFxKvuWrWW2UMzcWEh/S/MULrk0BuF2FEhhdaJ3eC?=
 =?us-ascii?Q?ZMFay4NdXUON2/Pet/OmM5Rj2XHij72b0xSxe4id5dIYqkTflo4iyECHTJrI?=
 =?us-ascii?Q?tO79RtfjC4GSObT1zYBuJak1GbQ7O0t8i0BPlj81jcpoDCiutZZz3o0r3ZUA?=
 =?us-ascii?Q?wKOpXPPV/56v34WVIkGzEUCJg8CPcmRqK+MQU9oLNSQeWuffVprU3XWi7fOc?=
 =?us-ascii?Q?RkhOGshzd1jABu/sYCNUQSWUSabsDaaFf0+3TYbGO6k0QvRXmaH/gnRztCeN?=
 =?us-ascii?Q?sfDAPTTsO3NyKh3Grla/KRXviLR0En3TtP7mrMvtHk5IFQ0PwVm5ktLWlBhA?=
 =?us-ascii?Q?SAjGxLNH1uqCdRT88rb+z2R3Yf52Zo143XtDT7A/sP2zd6OJklgxmapqz+vm?=
 =?us-ascii?Q?wcL4d1qUIVT+XjfSZu18qSKA7JsR+XG0+BmiyLNJODHC+ogS1CY6lJLfybnj?=
 =?us-ascii?Q?WTkH07zljnGQC1k7hpoP35lumC7wQU/8MgACZa/PCX/2LUeoKlUtZkOnM9dk?=
 =?us-ascii?Q?TTEqczu7I8oXESWVgX0MiF/Z2pRzVBiVylQgvfhLM8EDCeoEirupYXCd2pnK?=
 =?us-ascii?Q?c3HlIa9MX2uPvttxF8ERUkLu2WsZCkDGaBdu53sOd69HN8rkLzr/LP2VCdiY?=
 =?us-ascii?Q?R1outrA8FWYdqmHrZfbr4mckGpRn9C8sSbqZoWUSU0PXvIywn1WmIEJkT5Yy?=
 =?us-ascii?Q?TfK84Nm7+jn7yQ54aJLuh9Jq+lRwsSuykABdMWv6KbnnaWkxtro27uKnyn6e?=
 =?us-ascii?Q?UmdAhaiVoAy2qLe92lRBcajSkTF4oPMtMqoYs9zgIJohsPqLhwYVmagHhdRU?=
 =?us-ascii?Q?4qsXeDRMY83AcCk/FJBaQEtm4DoiYl2oBxw0gp7yhWm7yap832kMZ/VrqMx3?=
 =?us-ascii?Q?+BPhvBYSjoJeGDuR90bq5uynxJ0Ou6oCOuMXfxYB8OqAqBENbBOmro1CfSoS?=
 =?us-ascii?Q?koAWu2CFaDlwTN/caaXQ+QIKJvS+5v3ewqS77uFH2Iv32Zpo3dMzNhKu5FfE?=
 =?us-ascii?Q?dJ68YEodp9l7s2haTOLrOwyDniOrqwbmRP8skIXzwl5FO5Y0J0GQXQfPfpKd?=
 =?us-ascii?Q?1EZN/vN3vWZd1K8pClRRZeMXdPwYY0UyDJ7ApovXWJwf1B6ajAReEPcST7E5?=
 =?us-ascii?Q?Prw4vpkKWxS26gy9rd3Z6F8lk+0rGc7SSQImgN9Of9VlFFqrKNrKjMN0KVAL?=
 =?us-ascii?Q?L0bcGsdml4zI6LxZ3r5cT9w+knFthljBLwEpdCpWYoc559A+5YxfMIxu++iq?=
 =?us-ascii?Q?FOAFVK+NdlhBBkho/yGyNTzYeO8/BGxXebAlLjyhaHvY1aCxSIDR4OnjEqTH?=
 =?us-ascii?Q?OUMmGDOp6A4zZj+eaFkjS0MSL6fo42kgM4KF6k1lOvlC0fCvnkUar/V74J9M?=
 =?us-ascii?Q?Ou7Hx33xpVDcH8bHoYgD4cU5yiTtOczsUrDCdl89NYzIYUbIztKBy7q1QLW4?=
 =?us-ascii?Q?vQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cX5UT5SxrVOKmhongQylGD0suPEmUskfyJbswUUqaV6NHDROHljzrC/EzGpOz1Mri8HUw+pLj2GQMZoiDqN7t/EaZ8QKHaghRq1APfJL+KyeKUsqsIXV+UKhuP/UoMUTtaiNu6FkUJQXMR8/I4rg+a2tmFlsIC9pjGFpS4dX7++JOZ8n8lnviQFlQIYSHa51QjAWUi6S0gzx4qI+y7dK+4G82v0pYj7BIt+tpeHLDAZgmH5TEQvMWRgRBiv2ucT94kOaHpovedyyUQOkstzXw7hvoteGmT0Ue+u8ytIpKi5AFYupTmGGEkz7ifh1CYb910soaq9BCq7ee19R9xPD2iQ3v4QKtBizM7bItXWTGmilTrLEk2X626eVhMPM6jRQ+XvAqc7EYhFn//lqnWhnfjHfwR9tGMJ/39GTbgKEAyh9TlFH25MFySUeBgOMGspo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:20:59.4311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0c334c-56c2-4f27-406b-08de62c27d1f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 01:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230414

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


