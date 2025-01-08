Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA50E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 11:09:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.44])
 by mx.groups.io with SMTP id smtpd.web10.16452.1736334529873006738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 03:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=bWN053Mb;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.162.44, mailfrom: catalin.popescu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+gmp8r6kYGfygSkfXPyD+FB73OPYx6M/qRwj2ezX7z/yoB5UbaxUyYCoWArv9jNJO2iawhC3ADnA6g8jnvcxC8+fyhRktg0al+J3pu4R7D0itcxRC9rzAGkfeLy8jgZa33sqPu+h+qcG9CcPojMK3tNmgUal3Axe/LVTdGU1zeOgQDwNJMMArO47PRgZlt5RYC5uKhDfwF5Izd0ZxMrGsGiWbC9/5nA7C2mYicikNncbRh1Q83ydqaGUiVqBOJ+lvLYZgVnEGy68uIVSWWnG+7gHuGyu6dSTy5CxrYROv5QThMJt8hZB8GkOv8DZVJzL9IXp+tVjlYw723YUq7XWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7NzMf0qYp0ilL/K+rnI552lhzplyC4GWgWiOQ7KEDI=;
 b=q9K74VmAliVjc7jfYQjxkKmcGskgOb3EhXxxgC9RoFvYN+um+Uu7C0c74cS62V0EDsMoQLFXLq+4+D/qW+M/l66AGIo0hgxO+Vv6U4ToV5cyR0SeU9iBuNiViyf25lAidP+vWncHpmk8dMOJxtwnsZKlRbaYOgBayQtehAGmx4isnXhpQxiB+rhvtupQC0K0n3sL7JFmqvF6igJdu6BEJ6xdKXY+FzTf69XZXqT4GfUkOfqpyfgU7PHXY2lbknNIv9cvwbHRIZU8dTF9J3kgvO99TIKSHyzCjPSv15J0lZE7QsenDWZbAuXpgdN8J0li57URjgGIXv2dNvFJMggNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7NzMf0qYp0ilL/K+rnI552lhzplyC4GWgWiOQ7KEDI=;
 b=bWN053MbGCRfHylLKKfUPoAE4PKhbYJjaPdICsZ1FXd0vX9jEc3pPwI7LzPeX1TSKH0v2QVOc7LylUJ8LA84hbo2h6htUOZFS5UdAsZHZfuHFMvEbGs9gkzhqG4cEtzw7xaK8g8q8kpBVXTKSWkwj/ruzoJYV1g0/6aKZ/JSRtg=
Received: from DUZPR01CA0226.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::13) by DB9PR06MB8440.eurprd06.prod.outlook.com
 (2603:10a6:10:370::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 11:08:46 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::46) by DUZPR01CA0226.outlook.office365.com
 (2603:10a6:10:4b4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 11:08:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:08:46 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 8 Jan 2025 12:08:46 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [scarthgap][PATCH] bluez5: backport configuration file shipping from 5.73 to 5.72
Date: Wed,  8 Jan 2025 12:08:44 +0100
Message-ID: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 08 Jan 2025 11:08:46.0175 (UTC) FILETIME=[AFAEE6F0:01DB61BD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|DB9PR06MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: c03c52f6-954d-455e-68dd-08dd2fd4d25b
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?igpU/6eJg7KV+XoJaReAzlLC0S5iIdWoaAx6nDiBV+N53RarCY8q6Bfxpr8v?=
 =?us-ascii?Q?e5obzh0/PEVymerBFvk9nVKR4DIDaEnbLi/vqgwSHFohWkrOmXnI0lpthaHU?=
 =?us-ascii?Q?eL3Kybfng7wJu6YODuBLiCueKhMB+GJ/jCxhMMKljyaYvILgpXmlY89PHUsO?=
 =?us-ascii?Q?Qbe7yDibaF3ALCivgtnp8GUVOcFM79ekWwe3JB4/LCPYQ/BJJCIOaKnSA3ZX?=
 =?us-ascii?Q?2uu30gp1skQMaEcJH+7SojoIuOxYBHG/FQByPIkZNQZ9WKyshcfKIygcSOey?=
 =?us-ascii?Q?b1BOvfI4uB95MBlbO77K/uNRWMiXxON09R0qnnrdbRX8+7kxIRIJqHUD/O3g?=
 =?us-ascii?Q?cMn0gYyfNNWd1pkxXT9da4yViUxrFU/8dtqM2FJj7PWHYcfiq6QLoY/zVRby?=
 =?us-ascii?Q?hjP4+T1hUGx79wDr2HVCIf3oEawwPamqqmsahchByvwPycZ8DftEL7jJzDqQ?=
 =?us-ascii?Q?maA1Ob17sFVR02vUfl20m+mPX9F6wnYB7Wo6nOnyXoO1PCh3VEd+PziQl1wT?=
 =?us-ascii?Q?7XntBK0ftmluZtjCBw3AuJxL7GI2i++Tnxl1Ca7ATTYmB3cwfy5lV7xoz6Ba?=
 =?us-ascii?Q?tUsKhWbqEc0bpUnLZczTL5h4+R0LG0+COMB8j5d8xf18qgf4zQx4xXNejQB2?=
 =?us-ascii?Q?HMi91k8aWDZ6NQofvb5b8L++qKEcju/R30N9KDvBdPRKWaMoPc1NpHclRZXg?=
 =?us-ascii?Q?WWRXpwRRPYzKuhfSvhGLZxaFXZIJQ+5j9+jmjuhyC7nE6L5GD8UgDZXr56nI?=
 =?us-ascii?Q?6rH0l/2SOI3esglv92IWLiDy0caUaXXsVBJnv9lI7gpYYPX5LoUE7rZN6biu?=
 =?us-ascii?Q?Dl0Qu4VXPjf8cRjqMMAeLUHGAQY6Q3idyL9XtoQzFpTLTamd+noX7UTwAgNV?=
 =?us-ascii?Q?6kFf5toKOZSCnmdxMjnqp5DVwQbzft2huo6YxJYKLSjdIkyywL+3tga6yX6g?=
 =?us-ascii?Q?GA2sRyaZx870p9r0+h1zrLIhHtI5sAx+qhlH96+7fgbXjLJx4wTFWKdu2Px3?=
 =?us-ascii?Q?2OWyTdunaETziHlpvRCaAUsPtKbKL4xRZkxCJWgxsppnGBhYAsGHE2cKt7Ea?=
 =?us-ascii?Q?/rwq0qnaZAIwpcBrHjlsphXiOeXyXH+jBEBqKR4YFruUXL9F1mrxutBGnoKw?=
 =?us-ascii?Q?S01by5OXKZcdPDez/nWmKVxhBLLpij3JzYrysM2F6TkLvGyGbsqUEdtdH2mT?=
 =?us-ascii?Q?KyciHe9cYvvmzBQFwQVR6hBNm/O9PrLBSl+GsheOhwi6W3wHmcOM5HoSgj3a?=
 =?us-ascii?Q?Dun6hGApF2pflRYUAOjyjEjSZIX9kTlc/60W2z1mqBYfKlnv5WuQxMfXviMB?=
 =?us-ascii?Q?szKI6ZubKoP2+sMADtJqUJSh6DAg88dZ7b4MRpMR6+ZQtVdzRX8McICLYq9U?=
 =?us-ascii?Q?APYsZnUttTQ0tErD63QnCcPRwozL2KnWICEYbOgoT5rnn7AUy0hdUe7rBOVt?=
 =?us-ascii?Q?DLEmzaJxkHgyZxBdLJ51Hgsm7dJK2fMocWzCDttMbKQ5R5Wn0nOCCg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:08:46.4787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c03c52f6-954d-455e-68dd-08dd2fd4d25b
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8440
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 11:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209552

Commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388 removed the shipping of
configuration files from install task too early. The configuration files
shipping has been added to bluez5 5.73 whereas scarthgap is on older
version 5.72. To address this issue backport the patch from 5.73 to 5.72
and add it to the bluez5 recipe.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...l-config-files-with-enable-datafiles.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-build-ship=
-all-config-files-with-enable-datafiles.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index 3f2f096aac..d7283fba00 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,6 +54,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${=
PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://=
0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runni=
n.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-build-ship-all-config-files-with-enable-datafiles.p=
atch \
            "
 S =3D "${WORKDIR}/bluez-${PV}"
=20
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-co=
nfig-files-with-enable-datafiles.patch b/meta/recipes-connectivity/bluez5/b=
luez5/0001-build-ship-all-config-files-with-enable-datafiles.patch
new file mode 100644
index 0000000000..6e10674bf9
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-config-fi=
les-with-enable-datafiles.patch
@@ -0,0 +1,61 @@
+From be0e796299b0e7a73bf06c5655b56180588550b0 Mon Sep 17 00:00:00 2001
+From: Emil Velikov <emil.velikov@collabora.com>
+Date: Mon, 12 Feb 2024 20:02:44 +0000
+Subject: [PATCH] build: ship all config files with --enable-datafiles
+
+Currently we ship only the dbus/systemd policy files and omit the other
+four - /etc/bluetooth/{main,mesh-main,input,network}.conf.
+
+Outside of those files, there is no documentation what the defaults are
+and the other possible options. A number of distributions (Arch, Gentoo,
+Fedora) have opted to manually copy those into the package. Alas this
+does not scale and leaves other distros at disadvantage, in a sense.
+
+Note: we need a custom install target to ensure confdir and statedir
+have the correct permissions.
+
+Upstream-Status: Backport [5.73]
+Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
+---
+ Makefile.am   | 8 +++++++-
+ Makefile.mesh | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2b1b9acdf..2cbfed2db 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -31,11 +31,17 @@ AM_LDFLAGS =3D $(MISC_LDFLAGS)
+ confdir =3D $(sysconfdir)/bluetooth
+ statedir =3D $(localstatedir)/lib/bluetooth
+=20
++install-data-hook:
++	install -dm555 $(DESTDIR)$(confdir)
++	install -dm700 $(DESTDIR)$(statedir)
++
+ if DATAFILES
+ dbusdir =3D $(DBUS_CONFDIR)/dbus-1/system.d
+ dbus_DATA =3D src/bluetooth.conf
+=20
+-conf_DATA =3D
++conf_DATA =3D src/main.conf
++conf_DATA +=3D profiles/input/input.conf
++conf_DATA +=3D profiles/network/network.conf
+ state_DATA =3D
+ endif
+=20
+diff --git a/Makefile.mesh b/Makefile.mesh
+index ea50383d2..e4c9fa6a3 100644
+--- a/Makefile.mesh
++++ b/Makefile.mesh
+@@ -3,6 +3,7 @@ if MESH
+=20
+ if DATAFILES
+ dbus_DATA +=3D mesh/bluetooth-mesh.conf
++conf_DATA +=3D mesh/mesh-main.conf
+ endif
+=20
+ if SYSTEMD
+--=20
+2.34.1
+

base-commit: 01423828248b75e1f5afe2e5959ccd971df875cd
--=20
2.34.1


