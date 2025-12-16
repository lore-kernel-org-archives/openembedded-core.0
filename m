Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52054D637AB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 20:38:50 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3926.1765917521729309741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 12:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Usg89BbR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.40, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWSjErv/b1DSMKv6DOy82s8P5BA5SBgddZRteWF8vgZ0wPC2+wKAVISHS0nzYseuAfqtQZvpgkHc8kHFbnv7WfR9hA/UDAHz+iWFdnRVXafa9J6ldmj0P/fwOx8W/qOGyj3zbwgicLcSBRWd6qrhaajTnU4k/jdQpFbGnVCwRBcZq+9NfJWqbHIbW0VT6mWsOZZYrPhFaCZNuAYGyLeYxAJEizfAcNQcdYgrNc0PGyDbN5JE/8WY9UsPw/U5QYH+viLP3HYfNu55PdZC8YfOwDseUfXmTbMt1lUxxOKhxVMLoJcWXmGLenwOmxIOykh2MCJJ0S+hwIPqjtKqmGyyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAkoxJxlKZByMzN0A60bk6VNa5NQVW5X7paTLNV6SR0=;
 b=IeIlqzVqdAjebjZofU46PomNQmjUX6SzwQMp3sikTLV1xvWdSfZfxkE1VWiYvqqfjxQGJdraghon/pKcAmersB5OT5xMD2s3F0C5SLA2o6/yeIBKvfr23rsWqerViOskdxbaSsiXOVV0XANG6cef9evKEos4RtxVJCYLDnk7D6iPJw99EFczUq/dPKGnAuTPvMrdetiBtWNbaCuOWsDuo+uzYzoWelut2lbIWW8by/i/9U3LgE2QeF7K2MvP4JRPIKYrZMhzo4iRVp82jY/2elhNEb6jbKgoa63wpR9qPL4EU8fODpTVcazNy1lbXijQZ3iJgvyLuf22Y6Y6uy/2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAkoxJxlKZByMzN0A60bk6VNa5NQVW5X7paTLNV6SR0=;
 b=Usg89BbReHSDaiA07APSKSPzTLeb/Ld6KlW32C1BIp4sADdrtNNkA/PHYd5IJNiOoRB8Xr2U3Yfwk9DOOSGjLRiM/aks+IkPLcFrCxk97xetRzJvfX1JSz82a2Ei/Me7QwjHtdbjCKExNT8EQFvZYYDbMRYIFx+Ih/DxclQfJjE=
Received: from PH3PEPF00004099.namprd05.prod.outlook.com (2603:10b6:518:1::45)
 by MW4PR10MB6321.namprd10.prod.outlook.com (2603:10b6:303:1e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 16 Dec
 2025 20:38:36 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::3) by PH3PEPF00004099.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 20:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 20:38:36 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 14:38:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 14:38:31 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGKcUhj402388;
	Tue, 16 Dec 2025 14:38:31 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv11 6/6] xsessions: add unique desktop entries
Date: Tue, 16 Dec 2025 14:38:03 -0600
Message-ID: <20251216203803.3870049-7-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251216203803.3870049-1-rs@ti.com>
References: <20251216203803.3870049-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|MW4PR10MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 94faad8d-524a-4c97-fcf1-08de3ce31665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xnXtfPuuG6PEDjOVN+lvypAkJh7WaXMZn8aUC1ZOf+FyElI4MumgRejAQMNf?=
 =?us-ascii?Q?weQiBiJOMcVoYksJUvt8323ZqiMCQfPDGqo0wyFA51RfVc62ZeGahPiIJt0I?=
 =?us-ascii?Q?dnZPgD+SiQ0iIqtXJKANYlINVkgNtPbAkIdvUbIbblE5UNeZi2dhrF8ubNiU?=
 =?us-ascii?Q?0aX1fIcsChHTGblXU9VPgULEHpyroffDRFS7qDVTG7uX4XNoHGjEvEAllGv5?=
 =?us-ascii?Q?sHDgZMhymo1XVVs4JmrXJS0p44RL8CdnigxsS7K0zz7/C/hKpyKvnmxt/7Ul?=
 =?us-ascii?Q?mMmT1Ftv7cRSFVT7PHWs9afLg8NM+gC4wXSDD4kXIKzmm8T6BuJVMizpqpnF?=
 =?us-ascii?Q?e7XS9EEKvnYQV/v+mkN5SMImMygnH170Pg1aZEodp+vuFT5CGobaeek1s4A+?=
 =?us-ascii?Q?FWSNUD0/t/IZmmBXNsi7YtjqZW06o5dw7GFMbaPlq6Kh2taWEJyKEePrPLEi?=
 =?us-ascii?Q?BPcomQw4n5tRJtF63nhm33wZL+xPq9kGJhx9BkIxtOEXolWAVLBxdHPa/rDJ?=
 =?us-ascii?Q?XGvxTJJhxRdcu4AgI1KYzTNMDxUxtsqecSPpxwMCKHjAdZIV4nFsQ56OdyFl?=
 =?us-ascii?Q?EqiTsgAna8YJzs34PYuwye51FWaMC6mMNmGL7++50Bq8cOTq2NoY+0vQqog8?=
 =?us-ascii?Q?3EvC++DkwfbfPQhvojbeIUkt2oxEMWWsfE6mdjdHrM9ftO5vsVZ5VsxFQxnM?=
 =?us-ascii?Q?XAPRBm4MJGE5MkB2vA+Zz6KQaT8RxfxIEr1HYTUSB67jS53mE7ZRcwDyeDnI?=
 =?us-ascii?Q?F6E4VNchatraaudfCddAPN7coHg718Hy8tjxlAUCIoNbfMBDFdhLGi3Ekqmh?=
 =?us-ascii?Q?hjUtYPNJM0YefXGk3TFlH1kL6BmwfxYlpQxI3KMjBR1QpBj3QAH2Qa6Y3C17?=
 =?us-ascii?Q?CIRVOsvFSqGEdFJM/tfXAIQ19dv7rV2IsxlcE0zLQrkF89u59LPGkNTxxtxn?=
 =?us-ascii?Q?hmbZkYtX+/FH1IpwNuiDM7rzYvoXSuH9dAlUwDjF5Jcdsq8xlBOiDAJ+FLsb?=
 =?us-ascii?Q?hi7k8CYUuUEtd5F9mbqY33lzvQvAETuB2NBEO7ogJ4eAfNzf3BA4sNPOSDMT?=
 =?us-ascii?Q?jGSnXUyQ++j/LdWw4zGdk6+Toqqrw52LAECBv2ApaTC2p36WmOncO8tnuyrQ?=
 =?us-ascii?Q?bBnhimq6HSkJm6Pj1m6t7KZcyPIGSgivbr2sWZVJeoRYvvoUP4wMvb3JP2R6?=
 =?us-ascii?Q?GfybwqzTQfT3LjDY5XWOyC2OGb4073RCDp7vLM1gpOlbqcyC0CJj5jMj9Dpj?=
 =?us-ascii?Q?O0VcQnCN4xrmVpnXsz+3jAx43GtWVZhWDi5PuDVlyzxDi0NaUXcofQjF6J2L?=
 =?us-ascii?Q?yW3ZPtD+ia9WPdbzXjcYr3XBTBxHTQ0JzzbdSa2HjdaoDVwwvdYh1nsFXRRl?=
 =?us-ascii?Q?xa50XrPjNfZuFynEGm0dQSu/ZU8yNaMDx3mP7SbrdWtQgx3/m0nSTiSy6gpu?=
 =?us-ascii?Q?oMp/ud7G04c0Mc96Q6mM7iVGywDv2mdsJlveU4u6W1ahDAj4trX1QkdH+cHh?=
 =?us-ascii?Q?POEfzhQNArB7Ju4fl/wIab7tbw/L49XTiMvIqtAf5Som5PC2NjQ9cLC/omkQ?=
 =?us-ascii?Q?eMNhO8diXAhKxCGCDlQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 20:38:36.3424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94faad8d-524a-4c97-fcf1-08de3ce31665
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6321
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 20:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227989

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


