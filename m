Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10372E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:47:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web10.15998.1736333138729896964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 02:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=UMAs6Vjq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.40, mailfrom: catalin.popescu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4E/pt+WKC6eIU1JGdTlrV8QfR3xCK6SMU3jrGUJL5T5rU51sM4rnvLT3lRwdWuTulSRQvgzuFrwCtyDOz5SzIxC3Rp6a5CRHzQaprOC5JUa8aZNQf6BR2oVYL7PwlaUuVdcYN+44p4ih60+SeI39wayUET+NJFcMHqOWO2+qojqIW3lCZsQGUVlq6k431R/xTPvHRJ9x01tS6e+IvExwdTEGvNiusjPOC2/kZlKNm7wFRbNlY3r/IMS9QfKAaCsnLFOpmGD85x9JTEXmkVmYr9a720GYntOfoT8StD5F9UPxzxO5laNfPj7zHJgRNl5tqRodI8/jfSx+RddLYnw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po0ORTrMx0DXHmsk7uYq1CP9lxF295C91nRUr55wEcU=;
 b=is41zD0rizhhVebabJa+XkiW38cw4Xzepn3bzGOXweNjL0nAOIPm4u7UhMinEHrz8SPks+51ZD/aoJ0wVrzOpfEJa/ZEGelb4a048b54LgZBJ5U8WOc4VFEUaifBgBqs9RFk48wbsfWqhX69Ldlc25t7WIYNQU3xtOoSL7ftz+itLSptQQv6sHLZ7C92EU5+HL5HJOO32dGDHvDXb4oZLvOl+X+aD6sHfid9/Ph5nV0LSekJpmkXUfmxQJ/JsVoWsU8Rz2H0Q5OmqBn2RD2Zk2unxSS/FTbFlbPlr5gh9C2rmQ8vIgfD+zR2lS0su4wWB1KrovtEKudLMxDOi0tgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po0ORTrMx0DXHmsk7uYq1CP9lxF295C91nRUr55wEcU=;
 b=UMAs6Vjqqoi3Gxm1nRzYUjHTcy6wm5g6U05x/V8nRiUkTLBzpvZ0lH2PePKe4zUeCqD3j0Xtisyp79P8qA0rV0dQU2iReVArj2zl/DAV8dMwSpTTs4l/h9CuNTmQLduEkKiMlauwXQbzrue22q0y66u2/aW0OIIPwKRD8tgS/+I=
Received: from DU7P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::9) by
 FRWPR06MB9858.eurprd06.prod.outlook.com (2603:10a6:d10:173::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Wed, 8 Jan 2025 10:45:33 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::5d) by DU7P251CA0018.outlook.office365.com
 (2603:10a6:10:551::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 10:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 10:45:31 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 8 Jan 2025 11:45:31 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH] bluez5: backport configuration file shipping from 5.73 to 5.72
Date: Wed,  8 Jan 2025 11:45:29 +0100
Message-ID: <20250108104529.3701964-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 08 Jan 2025 10:45:31.0377 (UTC) FILETIME=[70519E10:01DB61BA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|FRWPR06MB9858:EE_
X-MS-Office365-Filtering-Correlation-Id: 44338b67-b160-45f8-1c2a-08dd2fd19313
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MPjDk1yHhZN9lMGwNZXd3NI4ec5/QonTKTbAVW53ksawBVtduz6NyJvyoWGC?=
 =?us-ascii?Q?j+OK8lNvoFIpsslBMqY9xcL4TMCScjk7tZUTuqNKAeFMGGtOAB60FzI7kqIU?=
 =?us-ascii?Q?bpWSnRL0KyBCNZaAoU64782iGEalYvhPHK8oqbAAkH4wUuS1kYEnX3qr16PN?=
 =?us-ascii?Q?XGE4ID2jqDkJUMoHgtZDs1Z87Qfc9Qa1Q3baidfIDBJ8Fu2rcxEOEPHhIu7W?=
 =?us-ascii?Q?d5sacWHvl+lp3HostjL88gLXHarMRduijgW/R+E0vjSqxuNui9KiCbbTBw8x?=
 =?us-ascii?Q?F5xgpBjlR4JkhJOHqFit/L9aAlI5raZsCTmSi9mIL/dAr7YZrYdK4OfT1reI?=
 =?us-ascii?Q?IavYIOZJxBJFPHo5c9Dm9pOGcTJjvXgZytLaIGd/ItEcuBB3RQwjRPu9Dq0P?=
 =?us-ascii?Q?LuuBdYmUUDuQ+6d2XyzaEXjUvko58j73XGXObXflZOtX9rxnO3vjIDzMD72/?=
 =?us-ascii?Q?KUzV7DMs7zmrz3SxjixIat21jMC6eHJE+/T6uJR4rVw5FsK4IL9cY+jMKsjd?=
 =?us-ascii?Q?Seg88PSCJm9JA78qTdMaTmEWV1xVvUTZeUp/iezE1oVWGAQ4NFNgEfVj/0y9?=
 =?us-ascii?Q?dIm5gfn4v4qvujH6MLg68u4TP5QVc3UNquoc9XwxTFXv6LeC9IRwG5vSsHAg?=
 =?us-ascii?Q?WBwyqn41IyBR+4xdWFI3jTl5xJcMiq8eKIcJUccnniA7yCDmrZr9KmHPIRHx?=
 =?us-ascii?Q?h9P1p9rc9irRUy5tzJPbJgJu6f5uinz+RUKiK7qD6JCmPYKBKlfZe7aL42Dh?=
 =?us-ascii?Q?wBuB71elIaOlrcV6pVJ7JnhjQuLQFNZ6VgDvulmgsBfhOaXn6V8wkTuLU3TF?=
 =?us-ascii?Q?Vmb9Cz8E2R6fJJXmYrlKHQp34v+OMAiAz5psNkH1BsrgFJNO0KCIGc6XfPR4?=
 =?us-ascii?Q?KD2im5yN0+/rpusEHSAqRdxoJudpjm2EgE9Z/crzHSUReHQOW/wNKzC7XiR4?=
 =?us-ascii?Q?8apMd/hH3A2mF+JACal+yT6Nt2fpkLvEGmKQtQDmBN8itkPjY1LoKZFKeK9b?=
 =?us-ascii?Q?8vdMBbClORmxjJxIzD6LsZItnKulDMV8VFycPC07XfWNPcx5dlp/OJK3p5OX?=
 =?us-ascii?Q?FcCfU50uidblMd5XbP9zaKdwye8k+ZlWkMmjJvMnXFCXN8vzjyhKoAGY5+84?=
 =?us-ascii?Q?IBVYxvXYHUZV6l0lOm2PCo6konbCumwQaoyJJ3yuDfO5ju5UvxuRgn+QBOWh?=
 =?us-ascii?Q?fdACxyCbEoGIZsa1tZ4YP5Kpxj0wxS0foYZ1lPdOyNcgpi1XSNr7m0R0vtcP?=
 =?us-ascii?Q?+TkVH3JRlBvR92Io+CqChxmDXktNxa6dK7GQKGlyqG2dqaLdRRPOMPQH9IJn?=
 =?us-ascii?Q?15zBN+UcsF6t9V0HK0hikuTNejGKS+K3yGaT3rUe39AVFVtU54+P3t63haW2?=
 =?us-ascii?Q?YLdZmfsSkY8IHEuuxojnHVdUIrZo0NaXOVFp8XLEGwAqDSta+/zk9W2ntt1s?=
 =?us-ascii?Q?fq6zPzGyhejmYr9VbRsb+f6+VyPNNJww1F9oAh4K9TZUio/NryMcrSND65lY?=
 =?us-ascii?Q?bFQzWrd9fwCarGQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 10:45:31.8026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44338b67-b160-45f8-1c2a-08dd2fd19313
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR06MB9858
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209546

Commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388 removed the shipping of
configuration files from install task too early. The configuration files
shipping has been added to bluez5 5.73 whereas scarthgap is on older
version 5.72. To address this issue backport the patch from 5.73 to 5.72
and add it to the bluez5 recipe.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...l-config-files-with-enable-datafiles.patch | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
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
index 0000000000..275ca9f493
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-build-ship-all-config-fi=
les-with-enable-datafiles.patch
@@ -0,0 +1,60 @@
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
--=20
2.34.1


