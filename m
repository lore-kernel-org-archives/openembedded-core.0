Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FA9D172A0
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 01:21:11 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6846.1770081661429886859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 17:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HkxoF8ky;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.34, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFe3gi91Lt8zwwodpMa+KZNyUrMZWvIbD/j3PhVqxiIXY1YQv1FfH6iKFiqJnHFCoUoeAawip08a8dJaZa23JxugMeM9NuELDVl1HOKO+EBXeTM0DhxkcpEowPNcK7LiCVsiUbUu/W6LT/Cej76+zFk1TvozSo8CY4srzJ0CvaTXxnms7cnNDAN3pbhDbaEd3uPoRYt81dUYJJEWMqpLCBLSklpXr4yAJkUMBT9KU3h8GtdyRnq0LASgxRhPGaI+UWTeifUDwELwe1UcY8r8coHNJm5AX76fCbtWitOZAPnu+/8dIuuVjH+g9L8TZM06PyRKh3X8ejou34Rxj1JA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrGt6bIzBhI4pPcj9UthfXQfJT6TVivAlnQ35ErbCps=;
 b=jW20Y2+LpWn3egwsuPdX3SwSAJDgrkKbo92siIrpmKdDnneaoPuelvClW7IWaiwO1AUZYxaQNA/JIUunW4o+Sm+XkXdsZR+Xz2xfA+5DNqXVDyxCdf79g31rRmo/e6LwbBaK7GtQasxes/95YxoFwm4z7i2pS9QAfY3BCOI6L3JuDswCT0cOb/pmdRIZRrZ96n4PGrmHOCc5d5CHzt2+edzU+GIezUWFc3BApc/r2tOi5O1+Xc53RmEWKmFgpmlZ3XmZjOzIkm686s/RLaBh5ckn+dTqmixuMvpdIXXSSAggM5Hipbs5Z0rBj8ISdyF8/J5zHfq2U+UzLy4RNG8+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrGt6bIzBhI4pPcj9UthfXQfJT6TVivAlnQ35ErbCps=;
 b=HkxoF8kysYnQtaZpflcdvOlWt8/roBEYXT0h31XKPLtqHFs2usz6Fydbf33sAroh5oISD/aSEzeEjjfJjAjCx13iu522TFn2Wvjxc76vxDEhG6+5TULmJ6kfyDcgCOUsRlBeYOShb9dvUUPNrhU/Q2Zb24lc3TyBUExV8tTtIJc=
Received: from SJ0PR13CA0227.namprd13.prod.outlook.com (2603:10b6:a03:2c1::22)
 by DS0PR10MB7455.namprd10.prod.outlook.com (2603:10b6:8:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:20:58 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::4f) by SJ0PR13CA0227.outlook.office365.com
 (2603:10b6:a03:2c1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 01:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:20:56 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:29 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:20:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131KTrV3095493;
	Mon, 2 Feb 2026 19:20:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv15 1/6] emptty: add version 0.15.0
Date: Mon, 2 Feb 2026 19:20:23 -0600
Message-ID: <20260203012028.4008229-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203012028.4008229-1-rs@ti.com>
References: <20260203012028.4008229-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DS0PR10MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b179e67-6581-44da-c9bc-08de62c27b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7142099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NAzGMhP+/0G6XZNfYWBPl+420CnoVfMMrodhyHuwL2O9yMmzU4AzqiboSrKm?=
 =?us-ascii?Q?03SF5NIEstFyCZKKqLhe4SOjAqw7ZiIsxdtsYzD0USCj4W5EAHgqDLUW/reE?=
 =?us-ascii?Q?7EHI4HoHax5hMb9yxRPR5hA0qS6P17V9rvr7OEkLWpY9NVzoR2O1shACInLj?=
 =?us-ascii?Q?lbt9gaZbxgawBR3fS11vt+qdhP1pEziHo2Uw4H3QmCY0wl96DTAOsrGwJ3+g?=
 =?us-ascii?Q?+AdSAX+HVls0pp+RWfJp6Pl9AJzDWTb3XDinuxXT9j0gr55/rHfdx1oMaCxO?=
 =?us-ascii?Q?py2z4QL+PTzgaWTe1/qFgV+AJlUnQG1IRbH0eIrXAGC4+aJJJKYnvtlpevln?=
 =?us-ascii?Q?06xljvNB39HAOdAnC1BYO5Vs+4oGQs/ArvdwKQvN418yzkI2558LRam0I+Is?=
 =?us-ascii?Q?kCbO9QgMmKB3/1NCrZ/KJabj8S02Nl+9aJAVgBItA5XW+PROqni5XZ0JXdAM?=
 =?us-ascii?Q?uUZDM9IX/Jqi8FS1dJ5s+4TCi9c79WZ7y83zcTphND9V0nDexrmASWu/ANqj?=
 =?us-ascii?Q?n8JamlgyTqw/46lnFrJ5BfhHuHtChlhOrIcGtzq7HmGDlSo76SehTVuanhoo?=
 =?us-ascii?Q?E+EP9lsHQPfITYvDwRWM1jGxkw21PhUgG3f+dFI17ov/jl0YCe6ZKBx+n5Lg?=
 =?us-ascii?Q?W3pAEUsBnxDIy220TvRfA/7B5hBw2nCacfxgtwo1/CxtHfVYKxB9pgoPfgah?=
 =?us-ascii?Q?1Kl2CX7itdOGD4I4c1K2XAJmdgke+P1efA9feYQ3wBmp671F+ordvwLr/0Cx?=
 =?us-ascii?Q?HVqmlqDNIt8/KL2oFuCeaei8BOzpz0VKn80ThNYGRY46t8fmkExmsZo1ZJzE?=
 =?us-ascii?Q?MO/w27snRQEwu6fYN9g0t3ZdMGumpxyvPhknvAC5O3NIokhXnVNBV2tbVNKm?=
 =?us-ascii?Q?R7p+N8hHwWS2TGO/gN/lPFtSQ8hUyGc2cRivbStGcnKA/E0uaEkOaqjtXFDz?=
 =?us-ascii?Q?kz9t0wCEe53uxGnuYv9cYvPSYI6DwmXJ0vzuRN7TsW0HOZbDWOmbP+qk45bW?=
 =?us-ascii?Q?4BlzCDuFsIZI1kfcduuQfolyke0Sy/U/GoxBzPxb/W5oVJwossgSJDkWNGpm?=
 =?us-ascii?Q?Zpj9DSlUGkpMLHB5l1A8WNXiiUA5DHwcJqk1GHgvvBj48OfuOuQ7BY3AhxM1?=
 =?us-ascii?Q?zG51FKcZkLSR7J7/+Nz6IWJKIwXMLahzhO7uxTK6Y5mguKYOWp9QNPvA7NSy?=
 =?us-ascii?Q?J2slHteCKuISH3FAKb/0ks0MaOUfa1+PFB1LUpnVu+lOyQXhXPmGM9Oqkzsv?=
 =?us-ascii?Q?NFO7n4V+XnVKPRQAalIoT8KC2QcdrfrD4Vcyby6zjWgCIzfQW8Q2uPlHmEwa?=
 =?us-ascii?Q?WdJP+KN0nAyTXzl/wVNU6ZPfVBeLOdFLlnnHIuLa9OyxVmxLQWSFlUJ6sV3O?=
 =?us-ascii?Q?dPu2DDyXIRkUGQr4aBcqxPn4yGqprEFqkRNe7TJ6pJT1zyUcsoIsXoiP1jKw?=
 =?us-ascii?Q?wNqakghD3vQ43HtekIzwjl7ydh41VVDBZic+XEOtFc614TWavjLNR/SZR4Ky?=
 =?us-ascii?Q?3YW6Z46JnDhe1wIfoTasnTJV01wMGKGrTK2G4wnzwiCvgGLCAGJ1mdEO/rdC?=
 =?us-ascii?Q?QfurpFblnidjvlXS9oQBYqLVy73BHnhPtl77mCVic92IzCbts6Ft7l23ZOAU?=
 =?us-ascii?Q?NPiUe+iVneEOVe8315t/cHg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7142099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ul/8En2DTY7Owj+lBWfRL4SHApyzfqKVw8kpKnOCq8o/W/PtW3YtYLJq74xAq+YXK+6jqV9Czon3dyvYm/Jh3MqHNvEjPc3FlovB+l4H6fbnqEtJP1izS4HCB+Qx7SeajFRtWvfIJxJrJ7YkS3sSqdVNYW6a7GESkY43j/8a8jEyRzrs5ZzkbtfGyuu6fruLu2aqweqomZZI/Bembjh8a4QknaI41ZS70uieYnXWo1BgVaokkcLLnbXqMrJ69gsgr+21y3grJWEhnIvTlj7+RTZeQ+59vpyrAYKDd4nfCqu8P5agXvVuJyBj6c3fnxRn44ZkxXxrIiQ4XWCPHJSnczv/XJ8AfV1qN6cQj8m2sRrPPOs7nB4aH/xj3prwByc+6B+23uHrcw/AhxxCCzv6gUubDdloRS1wpb+1bicneLC21FMQYl5YNyaOGBLrCToJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:20:56.7488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b179e67-6581-44da-c9bc-08de62c27b85
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7455
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 01:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230412

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
 meta-selftest/files/static-group              |  1 +
 .../rootfs-postcommands.bbclass               | 14 ++++-
 .../conf/distro/include/default-providers.inc |  1 +
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-graphics/emptty/emptty-conf.bb   | 14 +++++
 meta/recipes-graphics/emptty/emptty.inc       | 25 +++++++++
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 ++++
 meta/recipes-graphics/emptty/emptty_0.15.0.bb | 55 +++++++++++++++++++
 8 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 252fdac67d..a197216165 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -29,3 +29,4 @@ ptest:x:529:
 xuser:x:530:
 seat:x:531:
 audio:x:532:
+nopasswdlogin:x:533:
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes=
-recipe/rootfs-postcommands.bbclass
index f0c7ee658d..a6a23b46a9 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -45,7 +45,7 @@ POSTINST_LOGFILE ?=3D "${localstatedir}/log/postinstall.l=
og"
 SYSTEMD_DEFAULT_TARGET ?=3D '${@bb.utils.contains_any("IMAGE_FEATURES", [ =
"x11-base", "weston" ], "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES", "=
systemd", "set_systemd_default_target systemd_sysusers_check systemd_handle=
_machine_id", "", d)}'
=20
-ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile'
+ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile add_emptty_inittab'
=20
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES", "=
overlayfs", "overlayfs_qa_check", "", d)}'
=20
@@ -193,6 +193,18 @@ systemd_handle_machine_id() {
     fi
 }
=20
+#
+# A hook function to work around limitations of legacy inittab behavior
+#
+add_emptty_inittab() {
+    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return 0
+
+    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ]=
, "true", "false", d)}
+    then
+	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfdi=
r}/inittab
+    fi
+}
+
 #
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 #
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index 5101ad78f8..e9a6d299bc 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -67,3 +67,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "native=
sdk-libsdl2"
 PREFERRED_RPROVIDER_virtual-libegl-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-libglx-icd ?=3D "mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
+PREFERRED_RPROVIDER_virtual-emptty-conf ?=3D "emptty-conf"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index e830648945..97c91a0e62 100644
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
 RECIPE_MAINTAINER:pn-enchant2 =3D "Unassigned <unassigned@yoctoproject.org=
>"
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
index 0000000000..7a0d4d257e
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,25 @@
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
+    "
+SRCREV =3D "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
+SRCREV_pam =3D "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .=3D "_pam"
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
index 0000000000..732bb45ff1
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty_0.15.0.bb
@@ -0,0 +1,55 @@
+require emptty.inc
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] =3D ",,libpam,pam-plugin-succeed-if"
+PACKAGECONFIG[x11] =3D ",,virtual/libx11,util-linux-mcookie"
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
+    # systemd init service
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-systemd
+    fi
+}
+
+FILES:${PN} =3D "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+RDEPENDS:${PN} +=3D "virtual-emptty-conf"
+SYSTEMD_SERVICE:${PN} =3D "emptty.service"
+
+inherit systemd
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
+
+inherit useradd
--=20
2.52.0


