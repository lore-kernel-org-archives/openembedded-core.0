Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0748DE748FD
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 22:01:47 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109796.1766527300488543392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 14:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ijoYhqLu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.46, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUw9Pu6ap9O6Z5cwTDohqfFeU99UAOZdliOJtnJEDqGfCjpmuNilcDuR2Y0Ks7Ai7st29A+U2Kfd8+yWlM+MRYibywD905HWz9nI3r5k25i/1hKGQ4vQl3Crk9ugue4JPp+oKTWiDkw+WA1OmAdxPl5lN+BH9sgmrkgumko6d8mHdhrA5wK8HZqAf8RLFF4NR1LwH0HZLavqytNQ5U/JGPpRb7MgO/Q8iqaFGkq67ZSqPcgwRjVjEhzcmrX1+mR31kadVF566lo7nIhLdIgQAO/bg4G5Bd5y4lX0a7C/36SxGYg1Oe6G0NL/UUeGmBDlpCTMvr+sE0tDWYK9KM4W1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTglNGrDJJWpKl29INb1DnGOtARubllJ2wcCKQp5y5k=;
 b=BN4antxGMjwx1JNsZO4VSAVU4prv1n1fKR3nGrV/FVQx85dtZQp9ag4VqT793MToLsg0GHUqPaZEmOG5hT2nQY3rpcN0CEr5aPHUXSQ/dq1IWmnrh+tWfGZoBiGPBGvrIl0aXJlevGdXeIoAEbksoSNLV2DubtIlmDbUAPr7Wl6KauE4Nl6Z0kcZQOlA4bdCoNIWlcvuE7GKRNthcmJIkJ75916yCIpCv+Z1TPuFKFTCxPpnEh1C8RTMuq83xiJzm7z5orskggPoNrZGEs+Wrg6X0OM3WzEm4a6R3fp9q4ImhvVleKvhxhjZ18bPIYkKzcteYAHEcxIiScRS5Q2WmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTglNGrDJJWpKl29INb1DnGOtARubllJ2wcCKQp5y5k=;
 b=ijoYhqLuMbs2QI5SFqZ4fWWLWwZp74WL8WQIIGchfd12IeC0wJtYU0eM2rJHs40Z7qwbc61hVQTp1kN4/iVBXkIw8eCGBJ7qvp63Tnch6uBlTKeg/H8ZBYSlUyPrwjfV+ng7alksdLHiMxRuaBUGZptbe/TxzVFOkVxK7KCL5Kk=
Received: from BN9PR03CA0937.namprd03.prod.outlook.com (2603:10b6:408:108::12)
 by LV3PR10MB7865.namprd10.prod.outlook.com (2603:10b6:408:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Tue, 23 Dec
 2025 22:01:34 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::61) by BN9PR03CA0937.outlook.office365.com
 (2603:10b6:408:108::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Tue,
 23 Dec 2025 22:01:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 22:01:34 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 16:01:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 16:01:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BNM1TJP3656883;
	Tue, 23 Dec 2025 16:01:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv13 5/6] xuser-account: merge with xserver-nodm-init
Date: Tue, 23 Dec 2025 16:01:13 -0600
Message-ID: <20251223220114.2259233-6-rs@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251223220114.2259233-1-rs@ti.com>
References: <20251223220114.2259233-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|LV3PR10MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: d881c46d-c58b-453b-7c4e-08de426ed675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fx/BeQokN1CwVsA+PnmQcg+U7ewfvrsBvhIKSfnSTmTefcU4iikBVgMcaD2x?=
 =?us-ascii?Q?yLnVG2UPJD+y7JIOxii75nwlY3rqECRa3a+pYJqNIPQzxIBkVCtunYHoilS0?=
 =?us-ascii?Q?DzqGwPt4feiYOrD+Mz5gdknfmLhPE0TjTsFBAKIXwb8yFXHtNwSrTv+dJRir?=
 =?us-ascii?Q?m3rih0McPoFKVpiiqb9OTCoaDEDhR1jtF7dkPOnPu0c4zsOPNE9D27mPqZRd?=
 =?us-ascii?Q?7cADLYU1lgGxH58FuaDQz/Fbkgh9TGbZ1TIcW2FQ1nQfg7jnefwMcNHC6Vu0?=
 =?us-ascii?Q?T0QfpsWOl3L9Lmh4f8UZKfournRyNsLL9ylPwP5L3HV9YrvYjgJ4tPEcPGhd?=
 =?us-ascii?Q?FpuN0coFd8UAvBUkQgzQd+oMQBa1G64g4i7knSB1wz1Tj0EJnLqmG6wGwxOo?=
 =?us-ascii?Q?43NkmuULDwEbExpoqDg7OgqmiPBrEI9IXwXkuzdkBvt+Vwo7GScei4HZVlUz?=
 =?us-ascii?Q?KQA7RSr13iKsT73Z4DmgdOx25Ot0TKnBkMrZVXBiwsoXuEp9OrrXRRy4efsx?=
 =?us-ascii?Q?QI6pKqVboqa1U3hp/dB7jWLM95z4W4Xz8aenF1kr+xuVZ40N8PkYI0mCagid?=
 =?us-ascii?Q?WlLkqr0JuPs/vc6GRRaMTthczeC3JsGofUCxZq+pEGMmJxFP5jx5NbY2tmu4?=
 =?us-ascii?Q?1jxizJYyO6WsSPTEhSrpfXt9g0/CmkR4aVa+Pk5sxzL6UZwnoBC1j2mWu+SL?=
 =?us-ascii?Q?GctyRPFS3+vLGTPEJvhrurO8yVysT0EFC0VDQKwjg4s43WZffzCb92vqGWIF?=
 =?us-ascii?Q?1BxiUrMC77LTEdGpjsAUwURUQSp2BP3HFJVeSCGJGYf66y/5v1kmTCmyIJv1?=
 =?us-ascii?Q?LbIyh29VEMxJhbqydihDma7biPma0clOt9327+udaGw1RlmWocyqCTphDguz?=
 =?us-ascii?Q?A+ar+cduse426TkDol7dWwsHSkjkBtX4wG6//EvqZNQbj4l1IemupGhzB26m?=
 =?us-ascii?Q?qMbBcQV0qbBZ1RdJAQWj0/QP9k4kbFUwiqmKhWl3SMB9L3HClNeZcIBu38sP?=
 =?us-ascii?Q?rpZ+uSgHTG6+qUecyf9rYq8nAXcYPd5CLNtJqBLpv+Cl9hTkYp+ub5XjJLbv?=
 =?us-ascii?Q?dGwJDk5WrN33tOmozxZfyS3quDmdQjt6YMzaR1IMNqoD2LUg0v1JaD/Go6YW?=
 =?us-ascii?Q?+mUUArwIITo3GzdNsNZEIP4Fmf5LBBE6Hf7nwsz79sI8uJ1DkwrHP/72W6pM?=
 =?us-ascii?Q?ythdNfy7kglZTPW7C/Z0wQpbWa6QGIj9MOzCGB2pco9uVx/iQL6sL+XW1/f+?=
 =?us-ascii?Q?H1rf+SQ7IqQHwmm5ZLzGrpxIvWncmubdNsEZdidPmRvgWnsLCNacp02yXmSH?=
 =?us-ascii?Q?4T4HXDVS2VAqxKSSELTt7fUn0hU6bQNIkp/AeVHlQSlCSeLS5YcYmdYWIu2K?=
 =?us-ascii?Q?URNOKuyANyT6KhyTy5beKf9MWhEn+jpFQ3GiUCvN/Mmj9+0VBtxgXK+ZU2K7?=
 =?us-ascii?Q?PR1vSjFCihm+YWfz+JCEl6D0NB2r6me3JkcQpLA+6j1jrO2ALxczFo9BXdCK?=
 =?us-ascii?Q?bsByOVbNsIgIOxJvjcZDnNwDTMc/SKjlQCquFHRjAdWoRTFY7CSpy87fuDeL?=
 =?us-ascii?Q?xJTrCdWcJ4IRK+7nZTI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 22:01:34.3878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d881c46d-c58b-453b-7c4e-08de426ed675
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 22:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228510

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
index 560f089592..faff78b4e1 100644
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


