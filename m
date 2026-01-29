Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080ADD73EA9
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 23:02:43 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28750.1769727754455126777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 15:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qmdpy6q1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.36, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufEJxHFYpFSmLpTsc19V7AASlrJLrlslHP2ccbTcUGrAr98HSEokkUovWARc+doIu5FhJzFClXIblG8dGcw7U9tsnNnLpDBsryE2dxTjxpwAACunT1WN5OYcUAfDcW8IDFFBmndsCqTS5E/sb6JQLpFj/RsubfFIjll8xh9j5TM4faGjsdteoolVrueORGMmarpq0mhmNJvLgbLcdINSgZN5fMcfb5GvW0fvMo88ri8lCnmBosm+Q15Tfok8PgQzRFGpFFXRR5lQ6KgS1jhtSd2HRJMzCHbM3Znmi9MU6v4ypUfDbw22qHZMNoDSnwsQHfAwaNVKjqKy+vuAqZiwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W46n+bH959tfLW1WdKLPyzMIfK8030ekmk0E2GvNtes=;
 b=mODJoi2uuelgQUzt/pdLpTCVwBm4UlF+3WQnYY8GmwT/uz+s0/fbSA3DrwdbG0tJmicBtAIZ3Atk1GbfMXey0P9gXbfnI2KQAsdy14dCU0U/WUnjwGfrwkbOUREcmno236MFv+MgJX9RW3f49+SrsPvknCwaMOPqJQzakn1HaE3cWkwWLTdPQhkaDqtLG7ByxlvisN5Z5tYEkXauWhglGUGEakDqUOTexpGtcQLHcraqldm3u8RFwP/IzVcArb/Y8WGXmNNMbCOEPGM2Ne9r1xnu+n4ELU2REA5Cjj2CrP8zWHzUXowgLA6BRxQlyocqGuRBURSyG9c1jjFoCVrXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W46n+bH959tfLW1WdKLPyzMIfK8030ekmk0E2GvNtes=;
 b=qmdpy6q14MkmbI6zmHGxZZ8330A4ne0xIIwbbKBivk4pszPIa8TdEU0uiCdolk87j5KgdIMYReHlzo2Tw+NQ8JFVGHAtuiiM/EC9fmR7YJqEVM01B0GrjAM2kT0XbJiXL5qsS0z5J5VhDfdeaJ0JZ7YhDIrxHMQb8heudiq8Ga0=
Received: from BYAPR11CA0101.namprd11.prod.outlook.com (2603:10b6:a03:f4::42)
 by IA1PR10MB7513.namprd10.prod.outlook.com (2603:10b6:208:451::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 23:02:31 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:f4:cafe::3f) by BYAPR11CA0101.outlook.office365.com
 (2603:10b6:a03:f4::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 23:02:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 23:02:28 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 17:02:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TN2QPK713167;
	Thu, 29 Jan 2026 17:02:26 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>,
	<a-christidis@ti.com>
Subject: [oe-core][PATCHv14 5/6] xuser-account: merge with xserver-nodm-init
Date: Thu, 29 Jan 2026 17:02:09 -0600
Message-ID: <20260129230210.2934333-6-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129230210.2934333-1-rs@ti.com>
References: <20260129230210.2934333-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|IA1PR10MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: b909c823-e778-4b14-ed8a-08de5f8a7a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GAjAFRgHTUTYmAqjAzRfK1mYdknYqMT9qprbfxQ5LB7XyHNVaz6iqtJIzgfb?=
 =?us-ascii?Q?kZ5KRjaS+5Q4SdE2q/HaJJIrnuXdZcSJLSaO2dBRmNp3bUlfiWxvS9j8bYBy?=
 =?us-ascii?Q?0TKGUjmvA6eSZgP2sDyk0/nOGFCPUcN8XBJBgmDDl/1JXcfy6oCyDLRCM4IU?=
 =?us-ascii?Q?4T6Bm4/z0Z2nbqhZUQ2cyGH6gRWBdfdOPISPcCmMxx7DxPwCDuGrkLOb8fjU?=
 =?us-ascii?Q?K6Op29uFtXPOzKXYsRIDEal5mGjFNkji4poeT9itkncPyYQgdtZK8Xx+JKL1?=
 =?us-ascii?Q?a376cfhZaaRRm9Ns/tpjZS7M0rJEI+B9CCuSDQNb81m7mqK3xk2naeLaYyI9?=
 =?us-ascii?Q?av18yk/lqHZAmj1etxiL8Sf3+rQaA70lUv1FZjMLL9jzUq+L42XO2bvhgFyI?=
 =?us-ascii?Q?/zix6Ye96ZNffzQI1R70QQqGTs8A+SsINbHeZY0AMMbczeuV0bPnBI8SpeNh?=
 =?us-ascii?Q?Ci0nvJdFeuJZlEZi/EapwlIfa2djQxsv6ZDDbMD7iTE5cwSnnoJCO5j8Vd+Q?=
 =?us-ascii?Q?kOoP49J9hEoN9K3Xek8DJTw/2Y4POjmKwZbCf8Fnjvw5ccPJaKUYIIsXfjZU?=
 =?us-ascii?Q?6+QeiB3a0ATJKowyjWup6ljIcVBIBASZX7mxN+yg0OcmWWLwwldvjFiA8+ZK?=
 =?us-ascii?Q?M9IAl7Ea6EmkEgtnUlxHaXMJbfC8akzvOa3Vjz9I4suoQjhi30qm3jpsvpzk?=
 =?us-ascii?Q?NYhj4OZb8/alL6wqBPnbv0IHsTOlAy0Z2pBdWj3LOggc8kzbLGGTWMdQZtei?=
 =?us-ascii?Q?tr0bt1rHKyyL9q53w0P23L0EKscQ5A5qOSNdMUjllaY8DlyC5khQnhCxr2no?=
 =?us-ascii?Q?zMh+ga+msOm2cBh8OpDEXYQwSMFK3LX9sqd0DiyuHGl25NQPhDIM/oiTHWYn?=
 =?us-ascii?Q?vYSrVngUx0BZsMbuFgc5EAbMfh07EYeL1hJ2clEGyWtktw37sfp9CnADjJgj?=
 =?us-ascii?Q?jMcF95ufGNS+m2t35Nuj7W3Ni6zddNIMCs5KKKkESqzW/EvKbZr9KECJzP3S?=
 =?us-ascii?Q?y0m1njtfe2YLVeTe1Ot+YU6N5gYUBA44LW5GP9edoBLDyliJVwSby+ZgMKBp?=
 =?us-ascii?Q?vTT/znCfAPiAeHmTJsCcs/LdJP65S93zHxa95gnGLwgjxGt+VSQvdFRdslgf?=
 =?us-ascii?Q?KeMP45E/7rvQ0rFRiZKlq2uB9KptuMGSE/PpHAS/goAczduZancxBCI7YrxT?=
 =?us-ascii?Q?63RZxLzhaRf0dLYGFBKwdNAzaNQecv3ptUDs+BEbPPYxbyYSfUYHrCIaqSCl?=
 =?us-ascii?Q?oiO24i0hitYKgfu0WJgS+8xa8Tz/aTmKInS1H5DWScqXUopO2t0U80/aC/9s?=
 =?us-ascii?Q?jjwdwDtpJmUlERK5OoJmPyHpcI5TwGZHEKYBfD5nhdnLK8Ub9x6bX2Cz8F1j?=
 =?us-ascii?Q?PF6CLwIwT5CCbmjymzN76SunDFZYVRVKu2tBtaQQdPwnYu9rucGvE5uVnncr?=
 =?us-ascii?Q?BOk+alIlEh+jKjkVbzz6McvmNwMC+0FBod9BppSiaisFCrpxXppJDLorm7Iz?=
 =?us-ascii?Q?8VGbHRlPi1LR8C4dXV0wGr4dndXLeYFIXEUTINBLSi4xlLwqBNw2hd8JlKNt?=
 =?us-ascii?Q?lIgp+seX6Hzp6ktV5z9icX0JA7DGTKNqbW0tEFgoRCiwz3y+BPT7Pc8ANdBG?=
 =?us-ascii?Q?LBCtTgoXGdyGDobtTsYtE0ECADINlnjDvrBJNub0hOnmOHt0GIHyocmB44J4?=
 =?us-ascii?Q?elVNBQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rlnf+3R9Vau0ZIxQBlVhE9VnuEcaXtRZHSeCM5RnqDQQcf/r7U3WoGj6y68lcKJM5bPrTRcHVjuKX2TOcg9A9p0DgS70cH3RcbhDNAa441LINFNyDQN17sbsDjBidGnSMfTNgK7Ermyff31scLTL6UqxaQ59MrkkOAtgD/K9Br8FCcYHNJthLFA/H+BSlsn7GRqdRf4GpKcIWz2m9/U1cJc0iCp6W3Obv9o+kytlIPtQDnp/fVYAgmwuUDnszfL0laCG1+5xCjo2/r/zuJ+eMl/Ku+OGVE9s5Pt5SCWwPaIB19JFuaFfKHrTo3AvjWWg4V32MKWj16fQViDuzksCrPl05nVgoyPBVa0f76ZDR5pmEp70A681pulE6pQlOWm3zZAhJaXj4EDvyNAyC/c5d+c6f44aQOvY6uMILMYQAwGH2PDddwKdLKhCpazUX010
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:02:28.9310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b909c823-e778-4b14-ed8a-08de5f8a7a07
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7513
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230168

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
index a7425f7020..ec0a128901 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -935,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassigne=
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
2.52.0


