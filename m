Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13655E748FE
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 22:01:47 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109793.1766527299325989464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 14:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KOaJu5zT;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.15, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BR3+shV8oHrt2hc8gOt8wHw72MIr6osQXg+yFMJcA/16IWZCmHAZtsfm9HTK50XT8hn8foy7ym1qrLSFHEysnhBNg/Y9emAz6lCWKTdjP2mS5VoF1mJAi68seSuUpA9P2aabCpbbL6fyIYWOa0frmgeDRmbvpE1artDSjwq4IcAyNbW8eBobMYB55GDcrlQDZSfIN5Cf7GvAlyZdMKYsnNN0P4lgCdbaMEo1Y/6oSd8efLS/df1dbrzqgKDY/smXp01wAk6+VLruUypXolmto8Axc/6Kk5I1KdepNHEkXuN1FCwu4Pik4LFQfwy8Rz1QQK4E1O61kw8fC/cHZhgL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAkoxJxlKZByMzN0A60bk6VNa5NQVW5X7paTLNV6SR0=;
 b=rQIGVb0K5Q0C/OznhU8G5c5Ji2yd599tVs6mskFq57NnDv0d0ADeQbcRB967WhbKHGYklRzG44ZhuatNHh5urs0Wurucw9NlvJCjHYbIbp0J+Tf8lrxm6GRqC4cgkIG9hSUyoawwRNiJNeXfld4IyEkSDuaBcr2BpsQfYfxl2GCAaXbhHWb6UG0RaTRjiCWvIl2PvrEEVVa9Z0t7yGQxa+l2+/l3HuM6peRD8jy/po1yCzNXqft+KRWc2YN/lF2FoevNPp1bFU5+Zsvk/QgQlyLc0my+aPzxW09zmWE18D9KJnHb2S7amqSN34j1hEBYYI7Hztmf1naHDp4t11W4Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAkoxJxlKZByMzN0A60bk6VNa5NQVW5X7paTLNV6SR0=;
 b=KOaJu5zTdDk59VRDHy+zI9HrT4/IsfCdC65KZqHdG3NPyZ5tgTOheqYAcPo+fy1aKottnuzl0HaE8jkxzj+zr3zXRylxfXjYIp6FgJjAVcNjIbuj0bKAquQpgutAYjDkdevOrXHkzKIMUlpN4qgLg5wzy4lcyTSLh9jcCPKvELw=
Received: from MN2PR15CA0003.namprd15.prod.outlook.com (2603:10b6:208:1b4::16)
 by PH7PR10MB6227.namprd10.prod.outlook.com (2603:10b6:510:1f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 22:01:36 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::e0) by MN2PR15CA0003.outlook.office365.com
 (2603:10b6:208:1b4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 22:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 22:01:34 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 16:01:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BNM1TJQ3656883;
	Tue, 23 Dec 2025 16:01:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv13 6/6] xsessions: add unique desktop entries
Date: Tue, 23 Dec 2025 16:01:14 -0600
Message-ID: <20251223220114.2259233-7-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251223220114.2259233-1-rs@ti.com>
References: <20251223220114.2259233-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|PH7PR10MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 4848d497-c585-4bb6-e2a3-08de426ed6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Q2ugJde/86VdDOZadPXm3lMjpzGn3wincoUGXurNImYz2+ly3qqG4Cfqz1a?=
 =?us-ascii?Q?KFkMxJ9gP5pS6Xipr6AXqnXBlaEEmFiwWGK1XLF3s2zm6/dK9SPXE51N5FQb?=
 =?us-ascii?Q?uMVNymL1HezOGjpw6o74owdZcfcEznD6qTUzwzknoUDYjjYZoXvcWdfEyLJm?=
 =?us-ascii?Q?45DlaQb+S4GFuhSpnO2P4Ps+aqtvvOjE/qOqLsB+f2pNE8LjPuYth1T7Ybev?=
 =?us-ascii?Q?zKp76xC4IiKjt9Rd5hsFT5ZPXj+Gmr+FX/kD7DIY7BQr5vVn9yvsfdJTPONf?=
 =?us-ascii?Q?iQarQaiSulwQaU/HE0WjH4MQOuWgjv+ymYzufdpwbVX/GINsCBG8G9/vd1NB?=
 =?us-ascii?Q?skqUXpTTc2yCyfcWlxOOuTFfUJ17zWW3MdzTo9J5uoBsJq5uDMQiZ7gniRn1?=
 =?us-ascii?Q?S8nmRsZUiJ8pkoxS1v7Kmizh8Y/Dex6YNoywsc4Sx5uxet7Y9g9suFLFRx/k?=
 =?us-ascii?Q?oJbb4ryLFLZr5uyCiA1IVwC/b1OmBwyDT4zhnefNcwjIcU5vs4KW1ShM1Osd?=
 =?us-ascii?Q?Lo9swvFDmn9NN+sF/da1GOoj4nPLhi1Z5ZIzB5Es8eZSGQNAC6xA2n6hhgQj?=
 =?us-ascii?Q?JoFvN60iN+gRdh6/TyQdQuNuDxHgpl9Ngj2qMvROUEumDAeaqivbk0O7L8GA?=
 =?us-ascii?Q?GwtW9cSiktImVgs/bIv5XLtF9IloMSPV9rG9OEPNsedbYd/XYgSnnnOodd4H?=
 =?us-ascii?Q?pdPZybzgaML+UL8m2Xpa+sOnAzTKCclkK1yF2qUoadtpKtz7AaPPcVx+QoLu?=
 =?us-ascii?Q?jWFRDz96JG/W2g+xFvpTDBIJlyEGcLybDc8Z6u6MP/ZKmLVU6OpOaIatZ4+4?=
 =?us-ascii?Q?cAK1ALLzvK35Jtm+muaHR2nv6C9EXVnML5/f4PDpC9IlGhNR24UH/GeCvhXI?=
 =?us-ascii?Q?JvjUl+jvyFaReFkLQYE0yC+A4+/1KciGFmttJOo/W5p2VGemen4hnNf0DhTE?=
 =?us-ascii?Q?2Y/WPhT8ZMj5mrQIcJrChw7FURfZXYZ7KE9M8X+EAIH+lQV173H9b+0StBQJ?=
 =?us-ascii?Q?/kfkWpwex/jMoHzn/ThbVZSEMp4y8D3W7pv7rCZgiAeXE22U0TeRuyiHaqPt?=
 =?us-ascii?Q?gj60jv52wKnONNzC2aSukXCuSZFJq7uUH426+C/c60Jc/3NoKOOEPmfni/xa?=
 =?us-ascii?Q?qaxYgwEf40kpgZFlUDO2IM7VAUimWfnunhy+p1VRhsHicIXuMFPmwi+CPpH+?=
 =?us-ascii?Q?LKSO0XwEizCXjDr1hYFoe7RYZwWAZti/uL9T/8koicpQsfczJaYedG6404l4?=
 =?us-ascii?Q?NGL2vsi/qdDJ8zTukUnRqkbafDO9FL+Q+OBfQ62px2C30s9HKy+odRdTQCHy?=
 =?us-ascii?Q?51jmZrPIBU3uLFS9ZH8LncFi3e7tBY6u0+ajIpqgRVNCH7GO39dJo5zdvRZI?=
 =?us-ascii?Q?p2e8AydB0SWjkSR3dm5D9FTHoKXkEUCFDWTP6KorA5u3X/+EEP4MCZ1z4Lju?=
 =?us-ascii?Q?wXzMNq+g+if1/LjmVdfsoWgL2bOTtW/0OOrK5sKidHSgrFSqKe7nkdZR+Zr8?=
 =?us-ascii?Q?bInp5evIBwPLhJ9ky/jo+HRUBpR5oJVo/0/MZst7PvDQnL5U73GbLYeFMfYI?=
 =?us-ascii?Q?PTY1ZYDH+qHQ7bugXkE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 22:01:34.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4848d497-c585-4bb6-e2a3-08de426ed6af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 22:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228507

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


