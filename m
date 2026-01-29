Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F639D73EAD
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 23:02:43 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28663.1769727757072598654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 15:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZZFPUlNC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.39, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7h1IUyryCbJf4PYG/uYVLfzy1jo/wacN2f6+GCE6Pxp3pGXkVHv0Zbhqh1tNzsW9XyA/aK5WQkt8o/NgoTTrvWEy1kYMCTNHlyrsuRXnH4Tw5UKMq3jD00UpzdynJT2skd8NnTRTdiZ/JsEiLTf0PhQWQRn9rtvddsUOGZgrtb4Y/ZX9oW4uIF/UgCnT11K1YGRPHaS162N7CkU2Ye0FdS8Nt/VPv6KL+qRMyuceVatK45xsjTyAZi810J4ZLQFRU8QY1DhV3H1DlZeyFbRdsb1CUfbfrj4kVM14+xYJX5ujZkcnn4o+VfJmKDGbH7ugncfWnF6ltDjXeDgMKA9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSNqm10WBBhhK5T8L7vwvkUJu/VY7NplBW+bcLbYXDo=;
 b=GdR26a2ZVrfwCRTS2MTEntQbn6HRXFnVNaOcFswbL4Q8nPV6WxhG1gXqA/s5N14UpR5ccJ11BCHdpps960ywy+K/a9o8S96OqRMpivd9GzkiQVK3N2VgAFHovF/XNOCmBMqjwdFECf+up7FY1pSDIh/5MybWm/dZQ0XDfaUqfvDOSDdnbjRhSJ4L5Cq6r78WdqoHghVL/Ce8WODSuQZ+4au5CrENKp1sdVe4uKtigFjhQRwpcseeadsOGxpuxJZNyXB1SGlxfxXBc0mQSKvYl71jplUbaJm49g7pzqYW85HC7pt5KRmh4M1UfkEliGUqMnJCYiHj6FowmsI6u3X2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSNqm10WBBhhK5T8L7vwvkUJu/VY7NplBW+bcLbYXDo=;
 b=ZZFPUlNCkzFPMOjiD9Wpi1mRcqWH+b8o2kaqLVkLr6/WZ1S/RIYML6/3N61IY+o0eYgJWnojR8glwuTvtXWwzDNSXpTNowdeey9ni+anxRi82LKX5Yequ7vTvyXDlwPhCumF2Tne0mC4dT9ISXETTfbq+Uc9R08H0AZHanED5hw=
Received: from PH8PR22CA0020.namprd22.prod.outlook.com (2603:10b6:510:2d1::27)
 by SJ0PR10MB5801.namprd10.prod.outlook.com (2603:10b6:a03:423::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 23:02:34 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::2d) by PH8PR22CA0020.outlook.office365.com
 (2603:10b6:510:2d1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 23:02:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Thu, 29 Jan 2026 23:02:32 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 17:02:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 17:02:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TN2QPL713167;
	Thu, 29 Jan 2026 17:02:26 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>,
	<a-christidis@ti.com>
Subject: [oe-core][PATCHv14 6/6] xsessions: add unique desktop entries
Date: Thu, 29 Jan 2026 17:02:10 -0600
Message-ID: <20260129230210.2934333-7-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129230210.2934333-1-rs@ti.com>
References: <20260129230210.2934333-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|SJ0PR10MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ee7109-0c91-4d6b-1047-08de5f8a7c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?43uI3iEllmAAiZtKJxumo8jhYuNwpdSnptHq1J1tOMGUQ7EmaikxKZsxBdEY?=
 =?us-ascii?Q?xsbb4QvvjGCvbI/2WBBBIby1JShO+hU/Ltg1uvZlwYwOIA6Rl0PLw50EuuXS?=
 =?us-ascii?Q?tw/S/VT8uwRJh/atPxBI33w2fYrnVeYpajijyhVzjazsUyWSAuVgDwI3izB5?=
 =?us-ascii?Q?mfuNgocQi3PbmUSwhfew268KTLT9g50G3TnU8n3P4Qwzx6n4/CRSWUQCuCWq?=
 =?us-ascii?Q?eq1o3Gv1VhAwKZXnTr/9dHbjdCx7KFw/LxyC5rbbkRxL9RXXhinqOC4pZNvv?=
 =?us-ascii?Q?UFDhgt2Q5maNAFvjGo8xW/ih7VSCf4vA3Pn+/Fd9f1T9JteGc6dfaXusrjh9?=
 =?us-ascii?Q?0ug4Cfp7vvy1emUcDu9W6VFOtaniBQofyIsLRw4YjQySxi/FJG9b8qi//9XT?=
 =?us-ascii?Q?1akSp3Ktmbt2pV89SrWgdndtVjJB60wWwcTiZddXqWluJRujfjzSuPXMwdZS?=
 =?us-ascii?Q?dCvvnKWWREM8jpy+FQlYzo+oKOD37tWuLDOTUA8ybcmTFQevIrncMsY/hi2o?=
 =?us-ascii?Q?tgstuKBdgCz6YAwEnYPVW05nMKJXEJw5bZ/ezHsAvljjcaFXASq6rYVJtXpZ?=
 =?us-ascii?Q?PSuVyrKYAorNaKTeLYQFVSTb3nO2boO9HnFwkOMl/oxpGnHcp60LnW+5r2eO?=
 =?us-ascii?Q?GNGUoVRzwnmIUdNL36DVhn1pG1EWisdAdab1VQUdjh8Vr0DxZuculvd9nrtY?=
 =?us-ascii?Q?CJ+veDf9uY4lwltwOoQtkFYLFH1t5L+USHQ27T30+TUznOyXUNMuU//8SlcF?=
 =?us-ascii?Q?jD2KMJ0E0avKGHiuLRN/fyG3SI4bNhMPovWzUUHwWWxH4mem6F5LBSMawSxR?=
 =?us-ascii?Q?AnMgkX2zXE5gvDFv//HjqU4BrJayiaXAc4FL/H/J1dClAdhei0IuUNvxzARP?=
 =?us-ascii?Q?mblXZambUTHGcFcXf7ejyhRXrouG9no0QU2l4cNuMPNaiMid3Gre3+FgDg8x?=
 =?us-ascii?Q?53K0BoRsCrbECGMhZnrxdgVeaZe2s3GdnBF7/1DKPq/vuYZfqx5c2FSqCbKJ?=
 =?us-ascii?Q?bb/E4NeQLALMQijJ86P7XMer3kXy089oHdRGeBr9ypUtULJLIrEijro7z2tm?=
 =?us-ascii?Q?PUeaoFpy6xE/TMJ+3w18G/tfL7skvnBTEN48mx8UPdfUcFEyWvg9CjthergF?=
 =?us-ascii?Q?QEqgsQa8mNaSpmuO0lhKpZZJGlL0GIMiUvTaKVRTGPkrYaqr2vQD2thTo5o1?=
 =?us-ascii?Q?HTpxJtp+K0FWol+i1oWxYm7NFwbxj/dKsx5OYd8H+awJP7QS1v4IMM7BY7xF?=
 =?us-ascii?Q?GtOsMXEwCvJPcdtBRn/4zJBuILtoFA21Jv63B/+/g/YHkVhnQ6NyKqaa6a+Y?=
 =?us-ascii?Q?GgGisGd2VkKpUHo0bD7sJK6No/cyHNqUgPOeVrXYY6ijQHbUaAQEua/WcbKb?=
 =?us-ascii?Q?wFpLExFcYdjlentNG59xw8SUaGsW4931rCCSLM5TnicjBF/bPyllwQdKf2yh?=
 =?us-ascii?Q?ZrjPJC3exK2Oil+qNptQ3FsMW0jWlve6LqfCtyjG97uAcN0o+qtAnySKu0Ks?=
 =?us-ascii?Q?5pbfTzcQkt1/A049hoe4hjCT7Ctjr9x5j82lWaJbI70umOGnqeTccir5efaV?=
 =?us-ascii?Q?DmXDkZbSFr0ELTt5/mz4/Zk66AanE4wFXRXlK8ZjFRDE12yo3lhTcxaXOUPN?=
 =?us-ascii?Q?W6GIJO9koa418FOyJV4f/mgUrb6cnrpEvPU+T2U7Tan546jGUQTEuzjKwVyj?=
 =?us-ascii?Q?VMD6fg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fdDZqDYhFfrIH7WrbYxW7zdFcmaccprzpTX/dPbb86HJ4GGb0bnQR40qjrLa/sy4joJQ7oktAnsmidmzdol8G9RqXBD9flvLo8+Lg9xSza9cImATh2cipDaeRkw3sc/fgE9A/lZSJ8COx60Jb4Rfln2WkbyoL+qMsyu6TM/4QtRGv0+BcTR20Kgx8qYrSYsCkUTsUhxI+Mm2+3ctO281B3bZIBge4ZmDj4yWY+Y+kaTEmXzpp5pzINKmi+29RQCBY6YFkyGzHIn+pS7CUiVv0M23kPqflsQEFlLnMJ3siIzXow48asUX2/zfeyd2UE9zj//pV8/0uSchduFNeg4WZ35obsyWX+2OLpjv6AimS/vh9AosNWsKVtGM4vazr+ZWv0xyxZosvfcCoc0PYK91hHjZYT+SIpIxN9iH5PjXSDBKVqWeWFp4lrQR3Ulu5u+E
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:02:32.6873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ee7109-0c91-4d6b-1047-08de5f8a7c46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230170

From: Randolph Sapp <rs@ti.com>

Now that we have a display manager, users can have the option to choose
a session manager with the default emptty configuration. Currently this
could be either mini-x-session or matchbox-session.

Previously, only one was selectable via update-alternatives logic
switching out the x-session-manager link that xserver-nodm-init would
unconditionally use. From my testing this normally resulted in
matchbox-session being chosen.

Now xserver-nodm-init will use a DEFAULT_SESSION variable to configure
the automatic login session, and both of these session managers will
provide unique desktop entries for their respective sessions.

The loose default for DEFAULT_SESSION will be matchbox-session to keep
in line with the existing behavior.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../matchbox-session/matchbox-session.desktop       |  6 ++++++
 .../matchbox-session/matchbox-session_0.1.bb        | 13 ++++++-------
 .../mini-x-session/files/mini-x-session.desktop     |  6 ++++++
 .../mini-x-session/mini-x-session_0.1.bb            | 13 ++++++-------
 .../x11-common/xserver-nodm-init/default.desktop    |  5 -----
 .../x11-common/xserver-nodm-init/emptty.conf.in     |  2 +-
 .../x11-common/xserver-nodm-init_3.0.bb             |  7 ++++---
 7 files changed, 29 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-graphics/matchbox-session/matchbox-session=
/matchbox-session.desktop
 create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-sessi=
on.desktop
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/defa=
ult.desktop

diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session/matchb=
ox-session.desktop b/meta/recipes-graphics/matchbox-session/matchbox-sessio=
n/matchbox-session.desktop
new file mode 100644
index 0000000000..f496fd860f
--- /dev/null
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session/matchbox-sess=
ion.desktop
@@ -0,0 +1,6 @@
+[Desktop Entry]
+Name=3DMatchbox Session
+Comment=3DVery simple session manager for matchbox tools
+Type=3DApplication
+Exec=3Dmatchbox-session
+DesktopNames=3Dmatchbox
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb=
 b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index d8be3417cc..bee18ad617 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -9,17 +9,16 @@ LIC_FILES_CHKSUM =3D "file://matchbox-session;endline=3D2=
0;md5=3D180f1c169a15d059a56c3
 SECTION =3D "x11"
 RCONFLICTS:${PN} =3D "matchbox-common"
=20
-SRC_URI =3D "file://matchbox-session"
+SRC_URI =3D "file://matchbox-session \
+           file://matchbox-session.desktop"
=20
 S =3D "${UNPACKDIR}"
=20
-inherit update-alternatives
-
-ALTERNATIVE:${PN} =3D "x-session-manager"
-ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/matchbox-session"
-ALTERNATIVE_PRIORITY =3D "100"
-
 do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/matchbox-session ${D}/${bindir}
+	install -d ${D}${datadir}/xsessions
+	install -m 0644 ${S}/matchbox-session.desktop ${D}${datadir}/xsessions
 }
+
+FILES:${PN} +=3D "${datadir}/xsessions"
diff --git a/meta/recipes-graphics/mini-x-session/files/mini-x-session.desk=
top b/meta/recipes-graphics/mini-x-session/files/mini-x-session.desktop
new file mode 100644
index 0000000000..d7afed9cfd
--- /dev/null
+++ b/meta/recipes-graphics/mini-x-session/files/mini-x-session.desktop
@@ -0,0 +1,6 @@
+[Desktop Entry]
+Name=3DMini X Session
+Comment=3DVery simple session manager for X
+Type=3DApplication
+Exec=3Dmini-x-session
+DesktopNames=3Dmatchbox
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/m=
eta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index e90786df44..b223c38c9e 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -9,19 +9,18 @@ LIC_FILES_CHKSUM =3D "file://mini-x-session;endline=3D5;m=
d5=3Db6430bffbcf05f9760e72938
 SECTION =3D "x11"
 RCONFLICTS:${PN} =3D "matchbox-common"
=20
-SRC_URI =3D "file://mini-x-session"
+SRC_URI =3D "file://mini-x-session \
+           file://mini-x-session.desktop"
=20
 S =3D "${UNPACKDIR}"
=20
 RDEPENDS:${PN} =3D "sudo"
=20
-inherit update-alternatives
-
-ALTERNATIVE:${PN} =3D "x-session-manager"
-ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/mini-x-session"
-ALTERNATIVE_PRIORITY =3D "50"
-
 do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/mini-x-session ${D}/${bindir}
+	install -d ${D}${datadir}/xsessions
+	install -m 0644 ${S}/mini-x-session.desktop ${D}${datadir}/xsessions
 }
+
+FILES:${PN} +=3D "${datadir}/xsessions"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/default.des=
ktop b/meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
deleted file mode 100644
index 3357cd9a7f..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
+++ /dev/null
@@ -1,5 +0,0 @@
-[Desktop Entry]
-Encoding=3DUTF-8
-Type=3DApplication
-Name=3DDefault X11 Desktop
-Exec=3Dx-session-manager
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf=
.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
index bdb3bec782..fbe106d9b6 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
@@ -17,7 +17,7 @@ DEFAULT_USER=3Dxuser
 AUTOLOGIN=3Dtrue
=20
 # The default session used, if Autologin is enabled. If session is not fou=
nd in list of session, it proceeds to manual selection.
-AUTOLOGIN_SESSION=3DDefault X11 Desktop
+AUTOLOGIN_SESSION=3D@DEFAULT_SESSION@
=20
 # If Autologin is enabled and session does not start correctly, the number=
 of retries in short period is kept to eventually stop the infinite loop of=
 restarts. -1 is for infinite retries, 0 is for no retry.
 # AUTOLOGIN_MAX_RETRY=3D2
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/me=
ta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 0e9fe1e65a..a4b4a11d1b 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;m=
d5=3D3da9cfbcb788c80a0384
 SECTION =3D "x11"
=20
 SRC_URI =3D "file://emptty.conf.in \
-           file://default.desktop \
            file://system-xuser.conf"
=20
 S =3D "${UNPACKDIR}"
@@ -18,21 +17,23 @@ PACKAGECONFIG ??=3D "blank"
 PACKAGECONFIG[blank] =3D ""
 PACKAGECONFIG[nocursor] =3D ""
=20
+# matchbox-session seems to be the current preferred session provider
+DEFAULT_SESSION ??=3D "matchbox-session"
+
 do_install() {
     install -D -p -m0644 ${S}/emptty.conf.in ${D}${sysconfdir}/emptty/conf
-    install -D -p -m0644 ${S}/default.desktop ${D}${datadir}/xsessions/def=
ault.desktop
=20
     BLANK_ARGS=3D"${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0=
 -dpms', d)}"
     NO_CURSOR_ARG=3D"${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '-n=
ocursor', '', d)}"
=20
     sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/emptty/=
conf
     sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/conf
+    sed -i "s:@DEFAULT_SESSION@:${DEFAULT_SESSION}:" ${D}${sysconfdir}/emp=
tty/conf
=20
     install -D -m 0644 ${S}/system-xuser.conf ${D}${sysconfdir}/dbus-1/sys=
tem.d/system-xuser.conf
 }
=20
 FILES:${PN} =3D "${sysconfdir}/emptty/conf \
-               ${datadir}/xsessions/default.desktop \
                ${sysconfdir}/dbus-1/system.d/system-xuser.conf"
=20
 USERADD_PACKAGES =3D "${PN}"
--=20
2.52.0


