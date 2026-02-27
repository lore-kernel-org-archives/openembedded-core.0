Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A45BFEFB7E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 18:31:54 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.102.128.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103220.1772217112089527147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 10:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VaHZPWFd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.102.128.18, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ig7z0Oy3Q6jvxtfVtQmkuia+G9R4CEyEcvveDUMy8ONQUtodgO+U93LFC5BhHhU0bGq8IQjkzE2B18iv8GRkm2Heiwvt7t4gznC7m9fTIwCw/bJOBQ76w2wBdWMlwNhdFCNBroWiL5dRXJ7S6vGe51wVbVk2d7ftZZuRHGR2QUy9iMnpz9ONP1qZG38d3PZ/xbk7ChBOJpBP5B0dzs3m+8cBlhr0peNHailPskmVu0/5wbN1btVSs3RbGuopGuJjB6ycFHW8cDDhAxxJxDhQ97Lgcxp1b/EwNQ6hpXCtJxsgqYl7I9YRnOUO/UBilSaoNqqcSdA1mlVo+6qfJ6TjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM467Alvy3RRgNDy8r/Nx1K4vDYN2tg4OEhkpWchals=;
 b=MJZvVPp5LEO3FG4vKx05dpPowiqmJQ24q0ibpyAY+RT7XWNfgopWBA478lvcuLk4jWtq5GSppFBgbms9rV+XADTCzEzCvathvaah9b1mH0Qt7LibTlh94koAAlV+AjnMxiEs0iG+xdvGTw+mMDmGhRYUP8n7b71vk/liaXmrCw6W4nzpiFJjMhVGX2yvzsh8TknJxQC842n2jheAvqoerzie/IxLbJItAC01HuvnO7hLk6Ux19CKyevmlCrt+ckKQvJxMusKOW5QKou1tPfXSNz1Op2cXyj7F7fHpZZcTC9pbb14174KsaqZjgI/0ddZosQmfYAqGwTnI0H2jxOs7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM467Alvy3RRgNDy8r/Nx1K4vDYN2tg4OEhkpWchals=;
 b=VaHZPWFduSkBt8JTxAzOURIPr1HmJetysXDapBnMVcdoMwyLRcfkPk/j+NaxlIyRuxN04lFRTwKCBE4+7PP/x03gQt7bqKSlMDvZ7rlUyR7v9ZuFxUwm4oXcaUDFalZTVOI1cpqchD9LyIHEjoPKvVL7gMQDQ/u2Yzu/Czlmeeg=
Received: from SA0PR11CA0160.namprd11.prod.outlook.com (2603:10b6:806:1bb::15)
 by SJ1PR10MB5932.namprd10.prod.outlook.com (2603:10b6:a03:489::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 18:31:43 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:1bb:cafe::60) by SA0PR11CA0160.outlook.office365.com
 (2603:10b6:806:1bb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 18:31:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 18:31:41 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:41 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 12:31:40 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RIVeRW012242;
	Fri, 27 Feb 2026 12:31:40 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv16 1/6] emptty: add version 0.15.0
Date: Fri, 27 Feb 2026 12:31:30 -0600
Message-ID: <20260227183135.64544-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227183135.64544-1-rs@ti.com>
References: <20260227183135.64544-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|SJ1PR10MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: b75f5bea-786d-4814-0152-08de762e73b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|376014|82310400026|1800799024|13003099007|7142099003|12100799066;
X-Microsoft-Antispam-Message-Info: 
	D0CbUoGOBM7DOEQcWqiuOaLaPfYgAJf69WT/rx6tgqEdbNp3E84CORb5jbn9cJsE0hIs7IyUNRgY96XfMEvqQ/FzkBqg03bJKkAOhoxHbmjDP2ueIHfUH+42zMr9gakRwqZBD1OGcQLIQazf+oQqBwb55oT7PQhp2v8PE0YurRoSbdpZPwD7gdoshm1FCu/bGiBjORjYo6Azd0me0gaM+yV6WMzBFSDGIz3lzhejnc2OgypXIcusj6vzZzP0WkkEqjZUOpGpzZ+KAbeCsZVdrM7vCPf6nYCCh4SKeAYECGJvzI43aLeVO0yKLpL3S1YdYJ851VXAciYkbpWE/H+J2XmIQrN2fE8cg1ti9zOJdMLr1ZsHzzgbNRfZiRhZW95wWpe0s6vnfWCsDBpXa6MQZeu5p3Z0Ls48LVs3wd4mnBs+F4NeQrEZY1wJF2+fzfGs7lsmN1qa8yfVmiqhHIhmhTnpYDcbpTy/ULTR5JFjwXTBJ/+Hoy47naAVMHcO1ooIMjs/3trf0/gZLRk42P4NCBUil1omGrX5ImRRP7L92dSZDruFYeO4l4l98oHMqpcmu8OUFNN4BQRBLyjhzElXGDhyrCG96qO0o5sGGQYdx9ean2xc99pLh7zRQCff4LtFqasT4K0Ho5T0v+4EoCPfYRR4z/0taWOboWe2tDPhBge+JPeZVxUR9MZjHM4vL5r8sFgoZUkBGCINrm4ZIHXBCWibbLU7LSwYdqbRK9m6HqbV21qXH0vhvQMO8sQyyufxt1KGVibPev6SkV1fWArkoCBk0oCE9RcN9sjfQdNZcd4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(82310400026)(1800799024)(13003099007)(7142099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GLPrEi6sKDVYgE6zcEaFRcrmQMLz6K4ZMRbVyQGhMQNOzGBnYN/yOtfNEgIb+ZgkIqv8IHEsT7Zrd04ry4wXHmlKZdLfOXuSl9igp7gWM+T/bahHc4CajEzr5NDjf/vDqMcv+Z9ne/Vxeg5vKPEanyb3MsynOL68aCVEHDqDJ+NHM4q29rJ9p6mfhxOaYSj5wVNk0l0jFP01fdFPsJ16c92DOYJW30ZdXfOlDmZGXBlczMIKmb04orPw+7rWgx2ZdLXj0i1dFJLxGfQoE2nDBwiYkPfpgdlcBDFQ1cou3ft8IqIw6aWnM8R6oNWNUvsOytV22j8zDikL2UU8NQLuQGrMGSS437R1fGy2CkUIRpw/Ku5eF5eRV+Sgfx2BTffreKHMiwyqJ8GBnkoyzVWH0MQtTfuDwnEVg/mgX4k6r/vmNTzT6488855m7kyXXRaq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:31:41.4089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b75f5bea-786d-4814-0152-08de762e73b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5932
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 18:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232109

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
 meta/recipes-graphics/emptty/emptty.inc       | 27 +++++++++
 meta/recipes-graphics/emptty/emptty/pamconf   | 10 ++++
 meta/recipes-graphics/emptty/emptty_0.15.0.bb | 55 +++++++++++++++++++
 8 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
 create mode 100644 meta/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
 create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-=
group
index 3fca4aa5c9..1c3c6b73e3 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -28,4 +28,5 @@ ptest:x:529:
 xuser:x:530:
 seat:x:531:
 audio:x:532:
+nopasswdlogin:x:533:
 nogroup:x:65534:
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
index b5ab35d92a..81c7919aa4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -171,6 +171,8 @@ RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burt=
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
index 0000000000..d99c4d8c39
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,27 @@
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
+
+PR =3D "r1"
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
2.53.0


