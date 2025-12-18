Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150CAD711A3
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 19:11:33 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.172.1766085084565515792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 11:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ebE1NLRi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.66, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDmCmD4idAmSoDmSaF6wrqWHaCLVUzppIKUxUcU2U1Iw1KN99+dH9S0NZNpzr/nXeYm0ABUrPsgdI78t166BhpKIDZQRoOJMQk7sNzNlU3VzjrnE195BbvD5SULB1siLo6/N4B/a8Zb60y35N4AGMe6qwxCG1KxyIkixCQEbxclaA9xGLG96kv3AywZ28ij7fc0beo+4ijl7CP00vmyQsMDcOO+CNS4iAcm65aGrzvPhcngjTTeq2ZPZ++wLxFbWFXvVYGNabd2W74ZaQF/ZgTMq58fTDnPBCk5VsGqTAyzuZnY7Gcl0CuADWJfAI2SsTeCTwfet/2UFtphdneXbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAkoxJxlKZByMzN0A60bk6VNa5NQVW5X7paTLNV6SR0=;
 b=P/D+UESjv5XoipePGOeeW8dMG+yZ7Kc/eu8mYEo7idPTYU0gR0JkAOKthwexiRV3bo1PZBIX/V0nfcOAgGSHYdYySseOGiwUKB/JUYBbew3V1DlPr2P4UJ40f1cU6XZrCLBqy0jgR0VfXpckj9N4sj5SnJT4JXWmPmrLHeJ4v/9ssxXHh+O4c1RnB9H5lNtCfUTOUr51eCLasrC3QYcJryTL/SWLdC9LZDNnwuZ7A9m+CbAFqNf0UWVAID7XPRYMpAuGvnf+EdDfo7gZcDzzU07xLZRIC53jtE8jWqrk4UCaYDB/EhKPyTx8SRxY357gJL8Fy6ctPj9tzVwQUd/kwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAkoxJxlKZByMzN0A60bk6VNa5NQVW5X7paTLNV6SR0=;
 b=ebE1NLRiZZAS2s7+MAloTa67ks+/SCWldvOqyDwpQNcqcFmytiYG1Wja1q9BqKzrPCGoghAyND3dXsbPxR6q5euV+TVAJWtsi9ltqiLz5hov8pYzyksvzNIwm+uuZDjvEXL0hmjhxQ2VrDMcXEkb6Z1YWyK/HU0Rbp4JRe02Ngs=
Received: from SJ0PR03CA0059.namprd03.prod.outlook.com (2603:10b6:a03:33e::34)
 by MN0PR10MB5910.namprd10.prod.outlook.com (2603:10b6:208:3d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:11:20 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::5b) by SJ0PR03CA0059.outlook.office365.com
 (2603:10b6:a03:33e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 19:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 19:11:18 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:11:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 13:11:13 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIJBDtK3796612;
	Thu, 18 Dec 2025 13:11:13 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv12 6/6] xsessions: add unique desktop entries
Date: Thu, 18 Dec 2025 13:10:26 -0600
Message-ID: <20251218191025.667701-8-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218191025.667701-2-rs@ti.com>
References: <20251218191025.667701-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|MN0PR10MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc32b3e-8b74-4ca7-3688-08de3e693941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0O/v27G1/j23hEWux4xLDTI3iBsg1inLPfGyu2/tO8yFxdm1NH5HVSLMe/Qx?=
 =?us-ascii?Q?kNqY1ueevWqI13O52Dtc3w/+8zSSolPICgZ4HtdyKuKx3ZpCz4yvb0hWtaOK?=
 =?us-ascii?Q?jh7SpJ2zIuQCSM5onSRrVi/AANtGetipRJkBgx4GlwwSAxXPrh26UzD4u09O?=
 =?us-ascii?Q?cJbKkjDkoI0QAsZp6Did8JD5eYiBohV2l+awqbMMtBbsl+xKI777MS3rVM9z?=
 =?us-ascii?Q?JnzgM14CCRH1ASIy5f15mn+ZOfwAXyH1a0YT8e0NM9bCLj5Q8/Kmwd1G7yMz?=
 =?us-ascii?Q?NKGgDnC5nSpBi9R89D7V/qF2GnmhqJ96lRddJMPOXCodtWrT5lSpX4hlQd/m?=
 =?us-ascii?Q?Z1jn95ogBP+ZIE93h5PlEBwPBF02zLMaOJH8PargYnS8BuE0//2X0F2yWoa1?=
 =?us-ascii?Q?czJ/1gDfgRH5HOy3MbEUdEWY49BM4Wg85rlOwb48G2ijyvt8GQdswjtDTSR7?=
 =?us-ascii?Q?8ii/YADBTe6KqGzhTFcaQFUzXd4COuUuv1JXUf0eXNeGO5MugIZpInG35Hu4?=
 =?us-ascii?Q?esUr/60m0RZ3k33UuBf7w2I3Cr9RG2W5v1RfX95q4q/Go1nY2vhYtDdgk7BY?=
 =?us-ascii?Q?mouRVfrXokX7fWd4Qf8UGsebe399hlXh3SKHct2gYy8aaKX/AO3BuKIF+wA3?=
 =?us-ascii?Q?oiwp65Vs1st7F1gqIpjn7hsOGUSlNCPZNqCEwsafPgMbd6mK7AxGRHP1Wkjg?=
 =?us-ascii?Q?CCrqDHjMyOwTnzmMfu6iqgqEinAJKZyzogJSc0QZjLiMXAUszbLGnOBWJYbz?=
 =?us-ascii?Q?4CJXcf5a8tubgS0z/JBjeqL7MlD6eMvf/U/3UdR4kdocpD6lF57/LDwr4TJC?=
 =?us-ascii?Q?w5UfW0UC20PSkJhnEOgqP5o6MHppSQfOhbtUDL1V3LBnXdGwYh2To0D7RCYw?=
 =?us-ascii?Q?aIDIlX0DrkmMJkRUifQ72G2IF8dZvO+SuBy4l0nCFOS1oiKideb3rIRtmilL?=
 =?us-ascii?Q?HE4OanP5N6Hgs3VpH99Ue2kR83CSJBwkJlOvSqD2Qwf4YgLhkRienqouk8w7?=
 =?us-ascii?Q?irz5WUsPH4LD2z9uc7whX76CQn8l9QK/GJaJQTTfFkgn3cmydUmPh+qj2qV+?=
 =?us-ascii?Q?2jaoqy16QpZkPH+CIREHc88Oo4rpI8SDbUmAgjOim5zJUILLm4Ldcs0Po100?=
 =?us-ascii?Q?f25YeVx9x4ly0bd1/YiVM36YL9UXyU9JSZEmaO4ylcQiwBgKkNCU4bQZxYld?=
 =?us-ascii?Q?ImkZ7j9ODY87Tkr4Ro1yWzLXqT7NFkUK4eJpDu6TIkx5zqDmO14SB8ThNqx8?=
 =?us-ascii?Q?mHciHuXg1tARR75tSykH9eMoCJiLwUNImNgHDxGzcTmh73jalSkC1P41cgrO?=
 =?us-ascii?Q?WQLeF2oAu5oxY1/jsnqE9cx++UC8EINBeBuWb0I9dpgXw92Qpe1VI10TQCQz?=
 =?us-ascii?Q?rEwORi97ewRUcKqj08jKdZyyA8179shu5P3y+7rOe/hbGLEj+4fpoz8v+zrE?=
 =?us-ascii?Q?QhPNDOb7nDtPlAidAv0S37fbsVBKsVOBB5fk6zNZqoGXBWR7OwE09NFHS78f?=
 =?us-ascii?Q?5BADDMLrfUt7MBatEmRS5BhHE8l6mBrC6BNOzRRg3NAeotz2ZPRwIrmAejm3?=
 =?us-ascii?Q?8qapds0/UfccvfrsVDI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:11:18.5543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc32b3e-8b74-4ca7-3688-08de3e693941
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5910
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228138

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
2.51.1


