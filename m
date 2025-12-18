Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05CAD70DF2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 19:11:32 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.165.1766085083388509372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 11:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=L11QDZBr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.22, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZvvHWjvHi4UUwQjoD1XMf3uX7yMAcE1XgeEAyUhv5aaIUSedygHVFJDMaEgZhUJ1fX9dsX+1KXRSeUYKNTScHgJvZljaMe1th5CqQI6/k3hj6e2ymZfMHOSHSumX68jQHgrBd7FF1B0xrDfCQqGIbDN6IzWX33SBRFOV0AzEOdxDhCKJCgMTOOzcHPXsRw3PNUDHtjzaWF0NGoEI2Z6FO/gkJ+JzIH2O7p45yVdjcvs+Z6YvXvOmYm1ia/4UzSZjEAJ3oPLplAYmCovRBPljNAqDs3MvcxdjYGyLxE3QhhXDAq9xhE7/6HAoMnknIMQ7KplkAiAIBiXEguQ1efvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7yv8Wzao5r7LIsvGXejy9SNhAXP4PmqCGjxN2kHyV0=;
 b=UdVGIWG9d1qhejIUo0buHrOsar6WMc/lc1P5T4T+qrxuw9MdMSbDlQlctTLdLCQaF6q3wY8ga7zmmHxKmA202gCqr6Y+vMJxHlmDObY2TmtdAmSDmL9lc3lGp6U88OqwKQhZMc+hY/EhVSV/FqixSXvldQug7vFQQpU5gRVEa5cIN6OZf3BTuNl3FqOVbgjv0KPf1l0dE+cxJLtYPn5p/UVRX1C1COCV0TkPqHRKSJzKjFLK/poABA6K7Pu3KucMtWu9fL/Std8Ct74pyx4Z0vEuEGmFDSpvGtKDMGqxEytq8hh495ZhoyfN6VWnG0GMvXK08n9z0JdKIwnGBxhrqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7yv8Wzao5r7LIsvGXejy9SNhAXP4PmqCGjxN2kHyV0=;
 b=L11QDZBrrKbX1AG/KhpPIFuASW7HFLCFtGqZfk8sW5c679awwNgKwg8Yi6834nhwrbYiwPliP54UcvHArC0zGekb5o30blta8+rlX+HugJz5GjTZTkt7vDfyfa282ZsUvzZ39xBjsIdDFe5Qp7xikr1p1CpsmVHmJt9TvDqbURI=
Received: from SJ0PR13CA0103.namprd13.prod.outlook.com (2603:10b6:a03:2c5::18)
 by BN0PR10MB4821.namprd10.prod.outlook.com (2603:10b6:408:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:11:20 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::6a) by SJ0PR13CA0103.outlook.office365.com
 (2603:10b6:a03:2c5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 19:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 19:11:20 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 13:11:13 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIJBDtJ3796612;
	Thu, 18 Dec 2025 13:11:13 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv12 5/6] xuser-account: merge with xserver-nodm-init
Date: Thu, 18 Dec 2025 13:10:25 -0600
Message-ID: <20251218191025.667701-7-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218191025.667701-2-rs@ti.com>
References: <20251218191025.667701-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|BN0PR10MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5d8474-d273-47cf-aba1-08de3e693a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?90CZqLXcgTbIYisDkEGGU3C+zn6tds6vB+63CTmH5lHpBfhkTDCPAZJzzpxL?=
 =?us-ascii?Q?B+8uaREUK+aTjrOk//5fW88ERHWc796KhBzXaPJJcZhMSVpvT5IHrkiWxjzW?=
 =?us-ascii?Q?lNQzDg+/G/6E6AgipBLRHgz9AI3JYKHjqv9+JLOCU75GP/y672RQmj5uAUS3?=
 =?us-ascii?Q?HkExK1lE5cr04QD7UmSu4lT5zX10+JUL1WT4oV1BXiNBsFokZzkci/nHTGYX?=
 =?us-ascii?Q?QOW7Lw8bs6WMvPBvQ8gugIYiu1sbJuAvf7BgTgi080LLlKciXIRiw4H0rPG5?=
 =?us-ascii?Q?EN0BCHFLTsX7pNKvvsp5ybWQ/UwHZBTkiDATW9/YvM5pQeLuaU2L65RmzGWo?=
 =?us-ascii?Q?ZHDu03UDcIBs2WrrY1DcgODywBEHKCDWko59yttnTUrojC7931YsLZP5bz76?=
 =?us-ascii?Q?P7Lcw3Mp+U7bSTR8sS9yQGJNOynYuGlReKzofcPAzExo1kRgEkI++IEuY8ew?=
 =?us-ascii?Q?2IaiLKr6b4hhHEtDwo4ig1qyW3p4Lx7ZsDOZFgzy2g0GKzlYFC3e2sgOCrIP?=
 =?us-ascii?Q?f546ewNPLOzMqKV2eC8P1u8u7DzspYyhO03yNVUhSJ7FBIYyZ7j21ggGv1Qc?=
 =?us-ascii?Q?uzzpf1DMMGGqjDHYqXoi4OPu0Rj64R44zWUbl8yhpq8t0E5sRsJu6FnsgXPA?=
 =?us-ascii?Q?Rksr9uuqcDzJUs/sWH4EZnzJBwI/OQbsj0379xfe9V4uHXxS9jPaKceE38Xy?=
 =?us-ascii?Q?ZOMnCRpVP+4/RqetwBBlzUad0LEe7q5R6eMlz7Janrvt5XrXr7ZpZ5a/sgy/?=
 =?us-ascii?Q?yBpBYeV2gY/W8kFWDB335JF2ymc3cqjkS8+gmMxTtGBKjOLY8ZONm4sBb7df?=
 =?us-ascii?Q?17bfzOtRljXciuOQXRtgIQN88XzQn+IeoGnmK4Ps1vs6ojodRc8xrgb6ccm2?=
 =?us-ascii?Q?O/qomxV7r670ZTKj1A6MkxP+AF9Auz6UjCu/exTTKS5bMisJZmuZSz0L7nIq?=
 =?us-ascii?Q?dPgO5u4xeN2im4NayTzVBgg0pRtX83V/fFGaajvnxU2KxFqAUOisi2ltt8Ps?=
 =?us-ascii?Q?buB5/9ISc+arWDjltuOWwCL3spInSA4fZAcxq3Pm+txNPSzE7E+Rp/XPCEPJ?=
 =?us-ascii?Q?rjZhMiZJLpvLxoFS1FRScr9lCD8R/kucyhH/3segYK4fZ886oTU6/soTJMR7?=
 =?us-ascii?Q?cfANaD34MUMvOd8ILeLe79xh/RR6vk84A8UvTLd9R/JEDVeebG+ms+f7+6n5?=
 =?us-ascii?Q?3J4KTH/ItTLMw7mmyN/iektmMEo7B5j2ZcMZzw3V6Ro8221LrBM8CaU3G8wQ?=
 =?us-ascii?Q?T7gM73OqzUuXVkn+CNEd0BY3kRKuXzTr7Zhz0SvAwiEzDzbU6PKoNCpAmyMZ?=
 =?us-ascii?Q?aNlqU4B0dLc4VRV5WsMd/UQ5s0weVfB/OkPj8J4CLzbriLerYPwlo+ZJNupj?=
 =?us-ascii?Q?N3kFrewJ8uGDiWf4RR8c+DLxdm1DeM7fxdT9hk9VqtoXw88YLoXYvz81bIsT?=
 =?us-ascii?Q?kubY5ONCTwHj4qd+4aeTAAnVcqpq/XNrW7ZXAZYPjg2yZBXwsCwKDy2CcpvH?=
 =?us-ascii?Q?9Gmgkgtwa21Mq0zJqnuoXsBf7CZ1eagvFXFF3ot9SHgqq6GErier0hi1yTH3?=
 =?us-ascii?Q?P4pWtbBOscwSSqI67FM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:11:20.0209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5d8474-d273-47cf-aba1-08de3e693a29
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4821
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228136

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


