Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7DDD637A9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 20:38:40 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3925.1765917514644891448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 12:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=u8TQsOlZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.31, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxEKtV+yH7oHGrF7UHSK7FlXaz4g9yiL0Gz24Gu8pZJHurto7x9L1E6KG4FRQWyVBjFOHSQKdmaFRLobEFSOWZkMd9iSjl+5wAd0zScC4gAxYQ4wU2mOMqa/SyD9sm7zlptwj9f1VQMLZflE8vs+jy81tukTtg5jDaLDlY3gX3szH3+Lypyn8VEbdZGQWDS5vZ/9ORYPBlD60X0IiwK/0mBP6pRrw0r3cG+ymQhY+Wt4BwuBDib/m971AxhNYPRHQmqM69XXUpTiX5hkWI1qMvZuk8hB3lGa97lIDBK2mLDOxhXMvb6ql0anA1N24Dw5poKi2vl7JDV/t6vZD5dtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qkyTnBxVOxJP5h39idAYMUOzzP6op/MIZcAgAQNobQ=;
 b=sxOc1NoDIrMtNVnnbbzvLZ3+mZAdQ6xZT7ZCyjYCX8kdEgQCQDIPAHud28eGa0L9KqQgbRm65Cb2+d3upP5o78VHdJ6YRmka8goY+pjz4ShGCY8sWwtjGOIHMVi9qsFrEqu9sKKJL8LyG0cq199HKla7EWRDvtVB2V9bgoC2kx9G6HqyKvAZ5ve/pw9OUjX+NqTyociAnyw2JVYFDzmhiUCw1R4YYBRENOf5P8OslAa8U89ScjKuLcFXy0jAJKxWyMSTB9O79d6HXBOsVTWaVubYX00LRFn0hQIlBLhhLaa2m5XUyHUGV1CN50ZBIG6Cp5AyspI4mySjdN/n3Dm/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qkyTnBxVOxJP5h39idAYMUOzzP6op/MIZcAgAQNobQ=;
 b=u8TQsOlZ18WdUwTMzr9uZ7i0ctx2WKib0cGTFIyc1AXTtGq4DR0oxK71EWzySZLbGaOvZGB2SgtgF9BPIuD/4lG1wMgp08dYhlvvqWGjT38fOMeft3zTOvGJF1GzYIw4Jcq6LzamrpYFj053zMAlvttYU7FkO3UbaMPCgL5d4FI=
Received: from PH3PEPF000040A3.namprd05.prod.outlook.com (2603:10b6:518:1::57)
 by LV0PR10MB997684.namprd10.prod.outlook.com (2603:10b6:408:33f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 20:38:32 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::3) by PH3PEPF000040A3.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 20:38:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 20:38:31 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 14:38:30 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGKcUhe402388;
	Tue, 16 Dec 2025 14:38:30 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv11 1/6] emptty: add version 0.15.0
Date: Tue, 16 Dec 2025 14:37:58 -0600
Message-ID: <20251216203803.3870049-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251216203803.3870049-1-rs@ti.com>
References: <20251216203803.3870049-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|LV0PR10MB997684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af58ca9-6439-472d-ed5d-08de3ce3139c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WVzbHyWK1pLzuuaPjSjvyDbNIR/DzL5fIIiciB6HfmqXUb/gzWs0EbSj5e+k?=
 =?us-ascii?Q?G6N79jrzUACtgxU+B6+EbmSMAwD1eyL4zYGAJ7Ly+00JRTRed1W7C31rWztr?=
 =?us-ascii?Q?1ElAOWJDScOpl0DI4/UDIUrKE+nCtPbiL19q5AXDVb6mZvUMxdbGRk6esTw9?=
 =?us-ascii?Q?9pfrWd6asFBKRL0YV+vsRkjX4oNRb31qt9DjXVwOntdK3D/AvMbOezgM370z?=
 =?us-ascii?Q?Qh6LiKK29K3xUpQWDfTz0tJno7Q8IAkAbGnd6JzpIHaMygTDe/c+yjfNIYTK?=
 =?us-ascii?Q?+ZtBVsPa3mrpfY++St2y+6KtZ/M1LI29esfk0mx7d4KAHUq27VE5qC6pVvx+?=
 =?us-ascii?Q?+WlbsuUgys6mM2xjJY7GkM0RZ1xB6NXmaneUn4pE+RoG01ZxGer+8XE0Bqs/?=
 =?us-ascii?Q?odUGLJMdslLHCVJMbWHxR+WrJvqtX8m0rQxuYWv/Va1HpMbqWBa7APqY9jY2?=
 =?us-ascii?Q?CDuH7H0CDMBdVwYVx0Pp4YEnz9PoMYRzQcvBDWfjKYwhl+iszLlhEMk5LSMn?=
 =?us-ascii?Q?UxDzii9h3D53WWTZlIctXdKtsMN5LUMIXke5+CziA4HGPMEsgmYJQ+5zQLWY?=
 =?us-ascii?Q?NdT3qg9MTHPPbeRQQwPaVF8NNorkwKX1S9I1fJhctSsyYdg+1Mi8n0KrPpZI?=
 =?us-ascii?Q?BuO42L77NLeRRvFAWgt0oIn17NxIUferLMP7XSR6K/b/jb+T3kbtYaLZO1Uu?=
 =?us-ascii?Q?C/i0CbElRHQ8f8uuF6wbtjAQWiGv9f+OxtKFPWt2loTyDr9hIeBtkymqlF/r?=
 =?us-ascii?Q?dxjNDj2Ifu/VDexk6xCk9Fx0rR6JV5QLsbJvTQFPpo7A5Mj3DKk3bPYASTgs?=
 =?us-ascii?Q?TC/9AXQ3DVGjUpxUObBl48Hs83HqcFieySalETh08wc4L7R1ccmouXDBoUIw?=
 =?us-ascii?Q?pnW135ivjLdlB2CKYojqh9UDam/Ssks1k0cIf8xjjHrw4Ts3jfj70vuRV0jQ?=
 =?us-ascii?Q?SFoXJudGbMEIh5MLCtp67m3+Il6T6m6yNoyUCjCdsulyiZxaOBPF1fuoeV0i?=
 =?us-ascii?Q?XA5iG/ABbMZnTYXfmfYTn1qMfmAEtRw6Vm0Hlrm7YxgtTQONDt/c4Sz/yo50?=
 =?us-ascii?Q?kyny5L9TjDbpX6o92+k+ZSoZnbyaDf9/gN8vXTHk4bpZ4giCDre7k2Iq8AhX?=
 =?us-ascii?Q?W25zWN0nSySbKZ8yRy1mK4IKlNagZQQRXdLkZjX7zyiciNToRvPo1nMwrYHr?=
 =?us-ascii?Q?IL9jV/D8ehX0jC6fRyWZ/rP9WI5mPXTJuOZcSqUo/FWh9QD/GQrknC9CELSx?=
 =?us-ascii?Q?5CcaD3Rasc178QL+DxaVCxKUPSpj8ojGKa6Mr5xZcFBa4pE68mHqvvk2dQA2?=
 =?us-ascii?Q?sI82uzIdJuQaYVpxbOLGUm9l9EVuvydJIik20EHg4Kk6HsedtT9U/BpOyOdB?=
 =?us-ascii?Q?f2I1xYyIeep5a/mWW21GGnD8WWA0TlOw5eOvwYimgYBpWTmx4EHwKAKMx138?=
 =?us-ascii?Q?zPCqCRwkrjPXXdvfXdInY/7eEJjVg0ZfgwWmu7+gOlDCwmaz+MGnRWaofKoD?=
 =?us-ascii?Q?peF4VQYSyflclsS5CXUGQZV7uHVSxp0bCICEcaIZwW9q65RjwFhfTgiuLS5r?=
 =?us-ascii?Q?7Z7tiDt9pe5Ov6GacNo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 20:38:31.6818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af58ca9-6439-472d-ed5d-08de3ce3139c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 20:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227984

From: Randolph Sapp <rs@ti.com>

Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
relatively lightweight display manager that supports x11 as well as
wayland through both a CLI and an automatic login mechanism.

This can effectively replace the custom init scripts for both x11
(xserver-nodm-init) and wayland (weston-init) with a single tool with
more verbose logging capabilities.

This is split into two recipes. The emptty package provides the binary
and various agnostic configs while the emptty-conf package provides the
default configuration for the application itself. This RPROVIDES
virtual-emptty-conf, allowing other recipes to provide their own
configurations to override the default behavior.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../conf/distro/include/default-providers.inc |  1 +
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-graphics/emptty/emptty-conf.bb   | 14 +++++
 meta/recipes-graphics/emptty/emptty.inc       | 26 +++++++++
 .../recipes-graphics/emptty/emptty/emptty.tab |  1 +
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 ++++
 meta/recipes-graphics/emptty/emptty_0.15.0.bb | 53 +++++++++++++++++++
 7 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/emptty.tab
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index 3f113543cd..820a5d1342 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -69,3 +69,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "native=
sdk-libsdl2"
 PREFERRED_RPROVIDER_virtual-libegl-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-libglx-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
+PREFERRED_RPROVIDER_virtual-emptty-conf ?=3D "emptty-conf"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 8971b9b552..752fdb2d01 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,6 +170,8 @@ RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-ell =3D "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-emptty =3D "Randolph Sapp <rs@ti.com>"
+RECIPE_MAINTAINER:pn-emptty-conf =3D "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-enchant2 =3D "Gyorgy Sarvari <skandigraun@gmail.com>"
 RECIPE_MAINTAINER:pn-encodings =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-epiphany =3D "Unassigned <unassigned@yoctoproject.org=
>"
diff --git a/meta/recipes-graphics/emptty/emptty-conf.bb b/meta/recipes-gra=
phics/emptty/emptty-conf.bb
new file mode 100644
index 0000000000..0b98e2e13e
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty-conf.bb
@@ -0,0 +1,14 @@
+require emptty.inc
+
+SUMMARY +=3D " (Default config)"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install () {
+    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-config
+}
+
+FILES:${PN} =3D "${sysconfdir}/emptty/conf"
+CONFFILES:${PN} =3D "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN} +=3D "virtual-emptty-conf"
diff --git a/meta/recipes-graphics/emptty/emptty.inc b/meta/recipes-graphic=
s/emptty/emptty.inc
new file mode 100644
index 0000000000..cfe9ebf154
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,26 @@
+SUMMARY =3D "Dead simple CLI Display Manager on TTY"
+DESCRIPTION =3D "Emptty is a simple display manager with a command line gr=
eeter \
+It supports both X11 and Wayland sessions, exporting required variables an=
d \
+creating user paths as necessary."
+
+HOMEPAGE =3D "https://github.com/tvrzna/emptty"
+BUGTRACKER =3D "https://github.com/tvrzna/emptty/issues"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Dd1e4d12c7d1d17=
367ba5668706a405ba"
+
+S =3D "${UNPACKDIR}"
+
+FILESEXTRAPATHS:append =3D ":${THISDIR}/emptty"
+
+GO_IMPORT =3D "github.com/tvrzna/emptty"
+GO_IMPORT_pam =3D "github.com/msteinert/pam"
+SRC_URI =3D "\
+    git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Ds=
rc/${GO_IMPORT} \
+    git://${GO_IMPORT_pam}.git;protocol=3Dhttps;branch=3Dmaster;name=3Dpam=
;destsuffix=3Dsrc/${GO_IMPORT_pam} \
+    file://pamconf \
+    file://emptty.tab \
+    "
+SRCREV =3D "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
+SRCREV_pam =3D "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .=3D "_pam"
diff --git a/meta/recipes-graphics/emptty/emptty/emptty.tab b/meta/recipes-=
graphics/emptty/emptty/emptty.tab
new file mode 100644
index 0000000000..6359c7224d
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/emptty.tab
@@ -0,0 +1 @@
+7:5:respawn:/usr/bin/emptty -t 7 -d
diff --git a/meta/recipes-graphics/emptty/emptty/pamconf b/meta/recipes-gra=
phics/emptty/emptty/pamconf
new file mode 100644
index 0000000000..9cbfd6c4a5
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty/pamconf
@@ -0,0 +1,10 @@
+#%PAM-1.0
+auth            sufficient      pam_succeed_if.so user ingroup nopasswdlog=
in
+auth            include         common-auth
+-auth           optional        pam_gnome_keyring.so
+-auth           optional        pam_kwallet5.so
+account         include         common-account
+session         include         common-session
+-session        optional        pam_gnome_keyring.so auto_start
+-session        optional        pam_kwallet5.so auto_start force_run
+password        include         common-password
diff --git a/meta/recipes-graphics/emptty/emptty_0.15.0.bb b/meta/recipes-g=
raphics/emptty/emptty_0.15.0.bb
new file mode 100644
index 0000000000..11d306a56d
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty_0.15.0.bb
@@ -0,0 +1,53 @@
+require emptty.inc
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] =3D ",,libpam,pam-plugin-succeed-if"
+PACKAGECONFIG[x11] =3D ",,virtual/libx11"
+
+DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/cr=
ypt', d)}"
+
+GO_TAGS =3D ""
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nop=
am', d)}"
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',nox=
lib', d)}"
+
+GOBUILDFLAGS:append =3D " -tags=3D${GO_TAGS}"
+
+export GO111MODULE =3D "off"
+
+inherit go
+
+DEPENDS +=3D "gzip"
+
+do_install () {
+    # general collateral
+    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
+    install -d ${D}${mandir}/man1
+    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptt=
y.1.gz
+
+    # pam config
+    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
+    then
+        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
+    fi
+
+    # init services
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-systemd
+    else
+        install -Dm644 ${S}/emptty.tab ${D}${sysconfdir}/inittab.d/emptty.=
tab
+    fi
+}
+
+FILES:${PN} =3D "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${sysconfdir}/inittab.d/emptty.tab \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+RDEPENDS:${PN} +=3D "virtual-emptty-conf"
+SYSTEMD_SERVICE:${PN} =3D "emptty.service"
+
+inherit systemd
--=20
2.51.1


