Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFAFD711A5
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 19:11:33 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.166.1766085086385993366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 11:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PzBPJvbd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.18, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wa66ekXPTn6mnwrAwjzonNqavbKBtLU2FngpIG8GFkz+/LO3BgnxV5T7hTiNxx/6yhwLpnGjsLdOqvUmkvlVyhVMtR2RDyuXYqSRO60Vfx9+MCc1Kb5rCRTpcOTNOLMEEvkt1KIFbKNwO6fywj+fs+Vj5+GOKF+ZCVGlvn0xLzp5MAKRY3olSB59axyaMscoZ9EEWKrixZVApSlGSgzKYQL3v2MnNqMX6mZuf42Lg29Sa1NZKScJlOOZxHUzaRDzS5s6uX6WxfWiii/1744Zr/ENqNEi1PvbDTx0JVdpm7CZUe3B7TDc5GeASv4U6oiDEGHPnt8YEvgrnhbQnj8xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=199FnRU2OY41avFwkEKwfw4fk52kwUxl4MzP4UNiMtQ=;
 b=dgt0MrImtiXRW+YTYHHkzuUXwIVqLe0SNek5uL3n6SyGSrV6rkj8DxEwbjFzicHuHGJhQUcP0EUJw/pQugHHbfeOgitmX53drKBeojk/Kmwsc7GUbHPhkWlG/nnAXgbhAFAWSuVcTvncNjwxb8RhAfvhi9vtug8/wdlqa4CczYztIqDfopiw5NdjQbdM30XxrYLFKH3+5fY2PQ4Gbm+uF6YUXOyal7aSB3d5Xjv6rg/4XZtpszj3PWvLUIDcNHw5psw0EgTf5k3SezbwrWyegAFz/542f35xwNNlnZC1I8xJu22psnsbLJV0ig5pb2djFhspmsNtL4VWxQM/C77Ygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=199FnRU2OY41avFwkEKwfw4fk52kwUxl4MzP4UNiMtQ=;
 b=PzBPJvbd5/e1tuYPww8iu5Ue7s451Dq0ogScnD7PdBPEgsIZsQApdNAlMQjX5FW8FzbHgF7vZ+d0tl0BaUYogsvK6ol/o1eSFWjKFF+bTv3rdC87/5FPw8RiZgIKTS9YCpvKSQLTgVYtEvV/EWC9Tu4PfD7Yh0PDBNswedRjU0w=
Received: from CH0P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::28)
 by MW5PR10MB5827.namprd10.prod.outlook.com (2603:10b6:303:19c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:11:19 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::2b) by CH0P220CA0030.outlook.office365.com
 (2603:10b6:610:ef::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 19:11:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 19:11:16 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 13:11:13 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIJBDtF3796612;
	Thu, 18 Dec 2025 13:11:13 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv12 1/6] emptty: add version 0.15.0
Date: Thu, 18 Dec 2025 13:10:21 -0600
Message-ID: <20251218191025.667701-3-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218191025.667701-2-rs@ti.com>
References: <20251218191025.667701-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|MW5PR10MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f5d139-c691-4adc-9c94-08de3e693813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F7s1kCms3NCgulQOyuuK5A/2FcaaFxWfqEVEU6Xyf0FSYfVdEKHXUkf6FI3O?=
 =?us-ascii?Q?J/hQy7WAP7T21gS/uYoRottOdFvRS653euSzVDUePIZf5GWWPk4kJe8HO4i5?=
 =?us-ascii?Q?3SeIcz82Vvqu0z4qeoOkqm3++h95/9De34uhzu/ZMLj3DP/hB04g0rSor/1d?=
 =?us-ascii?Q?+H7g7slX4JvjHeSrxpmS+ik8lyC1Tj5Y8SqBntyaYNoSvqG9NRNCEd4svFsQ?=
 =?us-ascii?Q?0tqAVeQmldu5V8HgS95EYoLyilEnCI0z5uOEA4jout/eoTA26SL2VRV87S0m?=
 =?us-ascii?Q?T6WBIsETgGV5NlT3hwLiu1G+j0+MrcUG50feknliIKRevuCDjwYXtZRjb0ZP?=
 =?us-ascii?Q?FzX/Au8TVEvW6GoL9ti6B/Lx464IwXy55oLX7nNHyU4MNYDb6D1wZvEf/XGK?=
 =?us-ascii?Q?jNYKKxbEhUAqIWS2nSt4Vqch13RS7KyBgLsR5ziV11LuiEE0goIQAKIqGdCa?=
 =?us-ascii?Q?Ztbrh+NbMhQ6QxlUA9x6eleHe/G9H2bO4AhrqgqU/IERA6ABtee1M/U5DWUj?=
 =?us-ascii?Q?etS3TIxGmHba6D/xsyCw+tiHPwStoLGHS6POcPddIMftuscLVrCagJEZHhh5?=
 =?us-ascii?Q?sO9rga/3MBCT+uoAAXRKpAoVazIHNFCBINulDglhsYDhpgnsQRxaJ5+Y8nKV?=
 =?us-ascii?Q?4cLBRzf8O0lUWu0woEfBbAPGtKJcg02NmvpRTrP6LULhT404arjcWojQhOSD?=
 =?us-ascii?Q?L83MyprMtkyfdrOOdP4Lx0/AL6v1RLsE4srQUZDFo8vBFXurNHffu+flxuPR?=
 =?us-ascii?Q?IfRAx//u/77CtYs1Z6Ol7SNDHtqp89rKs6RiOi1AFLmZW4c3CWTFlWy0JGN5?=
 =?us-ascii?Q?10+s3WDIPdy4mSrqaJN4lV51fj3GsZfqgUDY6LkMQGMtM90FGbrCdTj0a/7i?=
 =?us-ascii?Q?H6x/GADVSd1ZcFEZJ3eOmQ8ANmIt4JwsKRGan4ea3KFBcptdtl5IgkZxzi2n?=
 =?us-ascii?Q?7YcLk+kKt+TXWl+qFQ0lhh2K4hpy3lkWwULjU0aX5BlGhQdbw6Hm6Faiax9U?=
 =?us-ascii?Q?xZ94IdJ2ITlwKmTpw42dsOrKd+JmuF4WVv1N0jrjPs2c1aQ02WZJlDHdEpV1?=
 =?us-ascii?Q?g+O0iXcaAVECg3UNF1uAI5fgTJmaXWPSCWFR0Ivo9qxE/3cO1ex6PgUh+M1U?=
 =?us-ascii?Q?6K9PoHQk1SUf/W5HNVhq1kVplwxDDn+6tVOTFOgnyP5Brn1JfwBOyWWU2FRZ?=
 =?us-ascii?Q?NzwdzcZnIPPL32oXEfDh84lKscnft4pko8sYEgiqmbHYb2KZAGAH6FmhTPAg?=
 =?us-ascii?Q?poxq+ja4RGlMogtXnqWRGKi35NWPcGx0ecbd1Yp9+zUFlvPHGeUmxyD5NMVs?=
 =?us-ascii?Q?jXgD1cxaoNRnlKpAdgDJb16yLs4ySPZpG8NvdhjH+oH40pnX/74i/TttNCCG?=
 =?us-ascii?Q?Wbyk1ubXgat3b0MSCrBg/VIH9e6pqSblixvmpKmZiA0jsBr08anlHUI3bZeV?=
 =?us-ascii?Q?aanTnutdUzBiNXNNB7ZHkgSYSoRGpNgcfTx528lL8sYkKNScMUIf+ussm9lR?=
 =?us-ascii?Q?1mFIOPACJL3dJvUSMwdwwmJLGi8pvTgwgUqZsXTXEl+q9C1YsW8NuT2IZsiL?=
 =?us-ascii?Q?W/Gf8M/2SfC1VuVSWq4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:11:16.5772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f5d139-c691-4adc-9c94-08de3e693813
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228139

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
index 0000000000..d856e2f851
--- /dev/null
+++ b/meta/recipes-graphics/emptty/emptty_0.15.0.bb
@@ -0,0 +1,53 @@
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


