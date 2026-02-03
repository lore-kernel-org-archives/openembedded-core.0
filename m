Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAD0E73165
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 01:21:11 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6850.1770081667592399438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 17:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=j+jPpvcf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.3, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfLmGYMhXY0wtSoXYeumDyHn1feY2AdhqwtWzLujxRv1sB4zES1tZqzgwVYikFdXfJucFkxJ//V/sCOxiYoSQidP1DU0WOzPOo0SasdHLgfF0AShIlVt0GBkWmjb2q5kxYty9RhdkzFyAlMVP3MGH2vWjKWAt58q94MvANZHvQj/DZUR1aYsFc1r7rENPSdBsoIBzQcWsC7Zi/wN7oSDCRFdQrylqvz7VROGb2FwsCNHWo9vnSkIdwgP0eCtA7oik4s0SiIR1i0EGkux+Mm6Grda+maQ31JNxcSjepX40hUKpS9pvarY/Cu9o4FzVWvh24oXwr9QR1Qi7xogAPj9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSNqm10WBBhhK5T8L7vwvkUJu/VY7NplBW+bcLbYXDo=;
 b=OZyA5Fqws1IUxh14BXrfIYKVOXrQWIrFTQ0AEWoSfLYhgypEIYglsuG06RW6mkZkw8CbFD9BGtic1yBiIa7aXeDHARIj/J3RFHHT3Ago7vbEYrS6atqIDVtrXskXHN72jfHUrSiQK/iXjVQgXA3F+XpjfRlvuW+V5qLagyh5SwQXbdN1XtYKVlC4cOLASSybXwOGrZrFILaQ6cNrdIsXlMvnVVEY4jKATl87YOAUSJEDXTWI+wUBG0JCQwvyGpDDzaUc4E2hidj7AxvjYuXEv2Ae3sfG2kc/Zroq1029zeRcbcTms5FZiuuShlZJgjtajQqmc6ISbeg920ZsvvQC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSNqm10WBBhhK5T8L7vwvkUJu/VY7NplBW+bcLbYXDo=;
 b=j+jPpvcfrcANr11NDyRHTglz3ywR3Kw2szQxqrIpqbZh+hyIKtEC1xp5UkKJz9dKUI7QCfeTAH9MLfHa1PwTX+yW3Jvy59CDn/tGZCkeo1Wuah6pU0ZB2FFnsOJi1aVW765+ETPnNT2AaolHcxPgEg1F5cQrVXlw0i9+Z7h3Ntk=
Received: from BN9PR03CA0976.namprd03.prod.outlook.com (2603:10b6:408:109::21)
 by IA4PR10MB8709.namprd10.prod.outlook.com (2603:10b6:208:56d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:21:05 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::86) by BN9PR03CA0976.outlook.office365.com
 (2603:10b6:408:109::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 3 Feb 2026 01:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:21:03 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:30 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:20:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131KTra3095493;
	Mon, 2 Feb 2026 19:20:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv15 6/6] xsessions: add unique desktop entries
Date: Mon, 2 Feb 2026 19:20:28 -0600
Message-ID: <20260203012028.4008229-7-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203012028.4008229-1-rs@ti.com>
References: <20260203012028.4008229-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|IA4PR10MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e290ec8-4c92-4c48-da57-08de62c27fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ifUkYPrmZlZ7XKj9J6SqxayRGey9HZmHriAyl5cv1mYoZTgJqy9G+UqZqnnA?=
 =?us-ascii?Q?Si3zl8teDP+QmxyvU5S73royy3kB/ETgk4SX2URwCD8nGa4up3HR9GwaCrdK?=
 =?us-ascii?Q?xSrLNTSIJIiMhbjqpyeWRUwPhtFt9K4MrE2pbQBKsaF2io5KdQgmy3cBbaiN?=
 =?us-ascii?Q?ez+27tjzk1Qw5TU6cLCCvuqH4rORMm8teezYpHq2OYNPD67YFIxcr3qZa+PQ?=
 =?us-ascii?Q?Bxxcu9+DR4lUC7B5aq7926Aj3tzINuY9d8OnSDdhxO2nwAfnFIL2L9OH/TuM?=
 =?us-ascii?Q?kdzak6NJHPNip0NZZWBs1Gi/2eAhQB0itp3IjP9aSbJL/FBoCnedDidvGiIr?=
 =?us-ascii?Q?+cKmXUH7ljt9SibsdiJ/657r1igBimCM2fwsS2LPmRHmyryS28ONDirkUDEc?=
 =?us-ascii?Q?5ZtTl2WaOzrwid1q2G4eAS4Dzn2P7Vfe1gP8ElG4RQSRKdMuVTaI/ZMQPD7D?=
 =?us-ascii?Q?7SObQ0MV7hrD8/r10gzwpnbFrdLxSBsB62Q3f0friGMwRQr3a0GgXIMul4s9?=
 =?us-ascii?Q?NjMYNaGz079dHHPH8Z72hy2u0IOO43ZQlAGiVqaitm1UaF0DRGbb/IQbXDVd?=
 =?us-ascii?Q?Mr/nOSVJ5loGgDryjVhKtSEDjvvGNkENpUWFnsoV8N6YLZ3xZvvRQgo5agc/?=
 =?us-ascii?Q?0j/owtWWdjyvIRiT59sM2wT3WzydPZayyYWZYEH/qFJ3rhaYeRm/ayPAPue/?=
 =?us-ascii?Q?nnspxMjP+CYP1aoieisyzFVJN1XKs8SZFfoELucwy8lKfFo1G9q3awMLNlDK?=
 =?us-ascii?Q?Q0WsdybRGu8F9BFkDihBYoOU2iOl7tQ4/UIFa4cY1GKIH3hoStiKNqFE7XIC?=
 =?us-ascii?Q?hroj9o0qOoTbLSX5yLiLMQEpJXKYdhDmOwdrgsk4i2Q7xzd/jq9V0OTxcB/7?=
 =?us-ascii?Q?J68o095I2/0/vLIS8T9ZHQh6qUaNSc9+rVCglYKgERd+vQW+1HdbCiGPJ0R9?=
 =?us-ascii?Q?DciTAW7++e0nIfd4or33XWbEW3SsSQAV7C8WZXZAt4eSE+Xoan7iSvf/831w?=
 =?us-ascii?Q?F1fgOKQ4ZeQk24KgWx3t1ahywGwiMGwe5cRJLdZ2dfgNhPGs2s/B1J5FGQtU?=
 =?us-ascii?Q?JoV+VKHue8Y5VWUPFyfklSz0db2vXs5FoAf/4HY8w1GGwr75PTQ9vNIUc8Ux?=
 =?us-ascii?Q?/0QUG+9qBBrZAE2dH8g3qmY44TLIEkWLdY7zDvCCn4qvqJhNrGsPIZ0cIQvW?=
 =?us-ascii?Q?MfVRj3xxJO5pKsgPV48IU51p3V9eI/AW52GkH8z36ACppWTqfefdqBRhD6F5?=
 =?us-ascii?Q?8IlUeJXoP1s9fEQ0sG0VXcMm/Tew4vniN36xFYc+Ebi0sHIFBfA6mjHTjhDk?=
 =?us-ascii?Q?skeZeLn5reszYy1j/aUr8rdB+jvlCBy7VMnKRDWXVT3oCrmWTgZDDNj5KQqT?=
 =?us-ascii?Q?EivRENB8t7YrHDKqqeRrSEDdAkuSny2I5tilJ0WkGFKikOfU0B6ngECk3pDc?=
 =?us-ascii?Q?PjJBh8jPCbq0I1U8xcpzH6igGAxsh/wvv+FUn8oTkWCO7fAsKGgYLu81sWsm?=
 =?us-ascii?Q?6scWlShZBWRmCIMU/4kzt7JgoD820N5isDhu4F6c7ZP8e+FfK9y5WImooZcQ?=
 =?us-ascii?Q?Valdvm6zfgYHwaY3kHg8cAWNCv25+fLNithdSBeOJylsEEyN0Fukz6YRry0T?=
 =?us-ascii?Q?mJlFMUtkTi7FCGd8KIqYQCejXCu/5qK8D4C2iRj8I5GKRMmyc43iwMG1aHIG?=
 =?us-ascii?Q?xaD5PA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vLle9UEXpIUlyeAzkhgMNA44oOyacYTr5Mns+ZtYixdydSqYVGDwlvc1hybNjT2aI+zIdm+fPo+A+zz54RLM0xTKIOlOhqYh7Vi8AnuIiRHKaL+9zLK7+FWa4oXBy3QUDI+1XmEJF27nfGLEmVN/6LjX+E0vsOC8cTyUd9jCVCMQOZ2UAdAqm+X5dsbDnaSLyPKrECsNBuoWkXf/xq0Ud1CjubS117V2vvOILtqJi+YOIfBLGiCV5yHp501Pd/IEWsuXPZ2d+9Tz774N8u3sb4rW+fzMph54OvXjGd+oZY/ejLpNrAtlRMxeVlGuFZYlWelzDo9oNfcFi4+NdJzo/XHW0hNBO6v986EWkWAfPypJg8ztGyieqBe39ZLpW7GoZDeSqV6o/01McJA/P/S4cSw3t+hzkJ+Liy78tm8Mw8J15VK3JIQQdpruNfYX+4rj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:21:03.6404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e290ec8-4c92-4c48-da57-08de62c27fa0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 01:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230415

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


