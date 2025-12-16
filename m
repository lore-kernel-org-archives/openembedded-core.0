Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58356D637A9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 20:38:50 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4011.1765917521479661709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 12:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=c3auyBlW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.6, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ/UM7LBXU0wqzWHYzLGC+uyVVSgDzW4NsyC+ayY2AqXq78pfO1jJHfbUgAFMdMaSxEzcAtbytYAqVaTxgk73jCIlFogHnG7J26hf5uH0gC5Ljl/FgFfQoNVHX+1XTAq37E+waeIjnnt72Dg8cMflfGlZLC7/W3vc0Za3ir4FpO4SLoEY/BHhQ1kGSik7Wa8V/9nj/ClGu0914goNuK4hH1rHmeP/JleskQCJsFC1p++xrEOjL6gtPXRa6wnOGXevGpuJ06UXjQg4qaK6yxyfCd3usYQHidbfbbVaW7+hymxMwmXTAACx55j4EMSRyUXBh583HPMTWAEwYBJ7frqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7yv8Wzao5r7LIsvGXejy9SNhAXP4PmqCGjxN2kHyV0=;
 b=VgR6NI3ad08ZRiEuxHJSrk2Rz8LkzScrwgpUF0xOX6ccSfEHGghyrN723rPshgMbNQYgaaKKCQdgPoaQrcPD0vUrSZgcRp2K0dO/vIUF0D4tEmI98stACIm6AycHvS/LDNHHebraOlM8wcME+6aKfuCJFCt122OAKsDNBQB9sCZGW7UD5BP4bBpLv7uyYrXhcFC2+EHjx7K5aJl+SGv5HXfQHYcc47tl7Io0IaRIN8l/SKFxknDapSnk725Wq3KX+6Z2r6fysO7yER3SFo827oU5FlVUN7TA/oXIsmVes3SVDIZRKZnZ/CRPfXgmSMrXOMSVPu2sTmODExybhBTFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7yv8Wzao5r7LIsvGXejy9SNhAXP4PmqCGjxN2kHyV0=;
 b=c3auyBlWyKHkA0meLmUkl2JBk/OgHukVzKyYAeKG8KzSsz3RYgO1G+mT9HvQnlu3WZQhKDqMYdUaQ5LPPPMg5j+Dyhwr0z0dH0Yh37Spjjqa9d2lGEra3S/5h/fWk8s9Oj3qY88/Se9+uxsJQXTrNr+4nt/Grs2bJv9bm36VrIY=
Received: from DM6PR11CA0072.namprd11.prod.outlook.com (2603:10b6:5:14c::49)
 by DM3PPFBD8703CAB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 20:38:38 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::96) by DM6PR11CA0072.outlook.office365.com
 (2603:10b6:5:14c::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 20:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 20:38:35 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 14:38:31 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGKcUhi402388;
	Tue, 16 Dec 2025 14:38:31 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv11 5/6] xuser-account: merge with xserver-nodm-init
Date: Tue, 16 Dec 2025 14:38:02 -0600
Message-ID: <20251216203803.3870049-6-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251216203803.3870049-1-rs@ti.com>
References: <20251216203803.3870049-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DM3PPFBD8703CAB:EE_
X-MS-Office365-Filtering-Correlation-Id: b72277cd-95ae-4c04-0d8b-08de3ce3162d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S1PzfjHmh4oZ16BureRmdiHqucOOdY2itoyOwF0zb8S5Cmh8Mp8LhVakpjRz?=
 =?us-ascii?Q?wXd3UnxWYq8cwgRfHS1/n1XIoszF97RDi7HH3DNWpFo+vsDcpSEDtKqjfqnp?=
 =?us-ascii?Q?o8+B2+EZ8yES8D9YOUwYnxaG5fEoy7ch7WwFRMxtehwMBPbSd/Uoi5cHt3Dg?=
 =?us-ascii?Q?ylSJeFnu7ilNZxBRVMrh/R199+cj1qEGqN0wRtBWg0j/zXw924fkp9+IhJS5?=
 =?us-ascii?Q?S2zwJe0OPiwLZZXM6qLLlCh0dKjhEsO4a56SHj22Vbm4v8WII+utNh6mpuoh?=
 =?us-ascii?Q?FZrmpM/AtEmf0LA9G6L0YnHvGDwO8gh33YlGJFQI/mutFksH38nyQwH77/9Y?=
 =?us-ascii?Q?cS6lqCOI/5uClyYR/FOpF/bz7Gi3aAChJnNs2FzQz+MsGZsCBhgQo9a4c+Ah?=
 =?us-ascii?Q?NRM46JCDS1uyfLsDi9CxxAepvzWwc5l2EIbhvSU954zTJKSNwr1JH71KPxIQ?=
 =?us-ascii?Q?bEZHq7rx6gxRK2VH9KystQK7Or95MUypcYhOZpQp4PtGvcYKGJfK1wlP0QOv?=
 =?us-ascii?Q?WrUSS1amM5d8fnHJQ2Tk1TlyO62e6z1FI68rPY4OMTvexF15Pam0CiQtc6nz?=
 =?us-ascii?Q?pjDMBIZMuIbdyBNaKXxe4fDONUjFdRitaEF8CUW8A/1EJRd48Dw1PR6/ty4x?=
 =?us-ascii?Q?CoLi6K50oQzuLNEU6xhLx+IyFzQIYgvWwYda9sN6HgUTf71avT5y5CzkGNWm?=
 =?us-ascii?Q?WGfEYb9L2WSpMXn68ygWyMlDrfuOjsHaDd30xZAGwmCF8esSvVNFky/Y+erD?=
 =?us-ascii?Q?21LA9mlcc5RZv14n3huKjVfTRVHMo67ZxGspuAJUCjHd5GLZRtE1OhjYx8/p?=
 =?us-ascii?Q?SUtibeOLjgFk7/lxzIIlO/wdND/f0r4+oVhbmQNxeuPkAoOPTxR6VFPI+T3Q?=
 =?us-ascii?Q?uzJkLg2aS1SP+BoVTF0Cw4oQ9wtR2flgIT5UOC/ciKfCNjEqSKgPDGYv5URT?=
 =?us-ascii?Q?EssjMORzEd9bhmeuYE8WodLjb53VC2bfvhpBmsE7MKf0trgOMa2ZcdMobesB?=
 =?us-ascii?Q?vtpuk5JieipcxBQ2pWh/dzrRhSkVMYkDALwVBPkpC0NEIY6ZlCMY/TcbuXgf?=
 =?us-ascii?Q?i6ng94NZS/C1kr+jrRpo7LVyXvj66T/K19s+Ye8ls679dmJ4TWMzVK/ldkQ5?=
 =?us-ascii?Q?rLLUL0g/HTukhjzZMBeMVrYYE28i+37nSO31IRO0UZSghIp0bNuS+R/54MV4?=
 =?us-ascii?Q?aKtdSzugxoh9/TSP2UeK9fBERK1yVBVBiamr1Yyh1dalEEsDMyzCiosDXyuG?=
 =?us-ascii?Q?S7r0EHxT80d6EAOl1OyEljZaH9T50UZ9FF9mDTRmRsQ8hSk7nNEDcmm9z3Xe?=
 =?us-ascii?Q?0sbnTWbbJsn/WfsnV+2A8R+PxT79RySWLaZN+nJhz+mBASHRlq4BVdpjzk02?=
 =?us-ascii?Q?qQEkio2LGFQweFlexOphszLpECDX0KssXb48MkMt26D3D6jYJRmZm3QiyY/r?=
 =?us-ascii?Q?8L7ZUaOEI/LAOvhPWVBxyghtAIoXbOXDlxbezsSAHEcnou0pVK9f2KOe8n7/?=
 =?us-ascii?Q?Vmzl+ZXu5lIrLuMH9jdhBOEP0D0wkiRgJ1mFzhX+hILpZrsyBCq3NErq77Du?=
 =?us-ascii?Q?ColypXJEHk+TJVES3Tc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 20:38:35.9713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72277cd-95ae-4c04-0d8b-08de3ce3162d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBD8703CAB
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 20:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227988

From: Randolph Sapp <rs@ti.com>

Merge the xuser-account recipe with xserver-nodm-init, since:

 - This is the only recipe dependent on it
 - This matches the current behavior in weston-init
 - Running x11 as root is no longer a supported path in
   xserver-nodm-init
 - The display manager configuration and user account name are heavily
   connected
 - The existing method of integration ignored this connection

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../xserver-nodm-init}/system-xuser.conf      |  0
 .../x11-common/xserver-nodm-init_3.0.bb       | 20 +++++++++---
 .../user-creation/xuser-account_0.1.bb        | 31 -------------------
 4 files changed, 15 insertions(+), 37 deletions(-)
 rename meta/{recipes-support/user-creation/files =3D> recipes-graphics/x11=
-common/xserver-nodm-init}/system-xuser.conf (100%)
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index c17a4ef0c6..53d372eacd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -933,7 +933,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassigne=
d <unassigned@yoctoproject.
 RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xuser-account =3D "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoproject.org=
>"
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/m=
eta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
similarity index 100%
rename from meta/recipes-support/user-creation/files/system-xuser.conf
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.c=
onf
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/me=
ta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index ed056df72f..0e9fe1e65a 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -1,14 +1,15 @@
-SUMMARY =3D "Simple Xserver Init Script (no dm)"
+SUMMARY =3D "Simple Xserver Init Script and user account"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
 SECTION =3D "x11"
=20
 SRC_URI =3D "file://emptty.conf.in \
-           file://default.desktop"
+           file://default.desktop \
+           file://system-xuser.conf"
=20
 S =3D "${UNPACKDIR}"
=20
-inherit features_check
+inherit features_check useradd
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
@@ -26,10 +27,19 @@ do_install() {
=20
     sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/emptty/=
conf
     sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/conf
+
+    install -D -m 0644 ${S}/system-xuser.conf ${D}${sysconfdir}/dbus-1/sys=
tem.d/system-xuser.conf
 }
=20
 FILES:${PN} =3D "${sysconfdir}/emptty/conf \
-               ${datadir}/xsessions/default.desktop"
+               ${datadir}/xsessions/default.desktop \
+               ${sysconfdir}/dbus-1/system.d/system-xuser.conf"
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--create-home \
+                       --groups video,tty,audio,input,shutdown,disk,nopass=
wdlogin \
+                       --user-group xuser"
+GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
=20
-RDEPENDS:${PN} =3D "emptty xuser-account"
+RDEPENDS:${PN} =3D "emptty"
 RPROVIDES:${PN} +=3D "virtual-emptty-conf"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta=
/recipes-support/user-creation/xuser-account_0.1.bb
deleted file mode 100644
index f1e4cb674f..0000000000
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY =3D "Creates an 'xuser' account used for running X11"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
-
-SRC_URI =3D "file://system-xuser.conf"
-
-inherit allarch useradd
-
-S =3D "${UNPACKDIR}"
-
-do_configure() {
-    :
-}
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysconfdir}/db=
us-1/system.d/system-xuser.conf
-}
-
-FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
-
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--create-home \
-                       --groups video,tty,audio,input,shutdown,disk,nopass=
wdlogin \
-                       --user-group xuser"
-GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
-
-ALLOW_EMPTY:${PN} =3D "1"
--=20
2.51.1


