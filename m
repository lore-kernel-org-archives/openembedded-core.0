Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264BDFD5308
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 18:31:54 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.102.137.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103217.1772217108679685636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 10:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DT6/dAHl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.102.137.20, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNZ/rSYE2ZfP14TZI75oQOmXNs/Hj0fRWmPtzONC2C7HiigL0wKfXNFWmSHUNr9oFjnObsSEy2hfwmN9Q8V6dC15/J9s4ZPSL9XSphF+eX7jjXO4wCsqG09X/w8lDg7MruMrTuwjwOTvGixmYwvxkSksFt+ydqXRw3BPiovQvhvnLRl/BpO3rTtQ3ya0/RBFAJBIoLvHqUjAIIPlSCBV/65X3bHcqJxxrRvVq2KErdVs9uJjN4pJAXQKPiLJCpH/MKKMDdTKPFRmTPWyG+Rzpe2tIOSDeRmcm2C4HsUMyz2h1hyQVHNbAt4fMsL+v+WyVsCGFajbJHF3gED3eWAe5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UA/LwN2w3bU7XoesP6MctELJ5xRKjiFtaI/xhfEmd0=;
 b=cad+paQwZL8plFsLAuncbaW9zvKulLxH76B/oh2/ek4r1Ua3Gfz2ZnUYJT7wllQxIKc2ISFMD9zfah8a/XROfc6vkIVUOTfohcSKRgVa/TwvJJkBRbafCpwc6FXHtphFLmokVM2h1a1l7Q+kyjeiXRVzvceZ7JjHdd3f1U1KApBxmXiXMGxQzR8Hs0QN5wb1TTv9vSi5juX8a3/Rcbrl6H/MUwMiVjdMnQyGOE+isvU76lS4ii4GQf+3WQqgFllPmHOTvG9U5e5CaqKuR7HQN7FNOqSh1StJyEwOR8SWFwSdsIKsSsXfF42ou0lKcU0VUL5oCSly1p8ol3B8N9ucZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UA/LwN2w3bU7XoesP6MctELJ5xRKjiFtaI/xhfEmd0=;
 b=DT6/dAHlCD0R48w/kxXSQABv+CCi9cQLi74za/CWyCbJT/xda2fKH2VztVchJsz00FRWTnhwlz6ILVYXsOMJB9g85OGnoEa8OanuUl+4voGFEFQEcMiDr7PspU1WZYq/SGg09aZfT6e/R9gBmcIZqJeDkWvULAdgZnjUazlnECU=
Received: from BN9PR03CA0945.namprd03.prod.outlook.com (2603:10b6:408:108::20)
 by DM3PPF4A29B3BB2.namprd10.prod.outlook.com (2603:10b6:f:fc00::c25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 27 Feb
 2026 18:31:45 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:108:cafe::5e) by BN9PR03CA0945.outlook.office365.com
 (2603:10b6:408:108::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Fri,
 27 Feb 2026 18:31:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 27 Feb 2026 18:31:43 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:41 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 12:31:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 12:31:41 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RIVeRa012242;
	Fri, 27 Feb 2026 12:31:40 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv16 5/6] xuser-account: merge with xserver-nodm-init
Date: Fri, 27 Feb 2026 12:31:34 -0600
Message-ID: <20260227183135.64544-6-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227183135.64544-1-rs@ti.com>
References: <20260227183135.64544-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|DM3PPF4A29B3BB2:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb00d45-242a-4946-26fa-08de762e74ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|34020700016|82310400026|376014|12100799066;
X-Microsoft-Antispam-Message-Info: 
	tkOLv1bCyAbpTLDxhHInwuQjZJdgadZKcpXjx7+XvkT9gjhG5DDcjo5qWCwpHB3a2kvkhTCJLxEGEOJifnZSTyuagnQnokpzhv9nAB26Hd60VaU2eFSQ3cEZ2UdhIrPiRkMEo354hd3AhAtYQupo/iFt2Ww2361nB4v4m35IUBLhuBkqrl0xPbi4TZZEmNmIKlG3TsaQMQUWr35NaYw+KV+kS/GqZvay9hI4TuAS2oRGLw/7KgPp0fRaC4dmgrFIxkwvo6JC2JdVW0z9xXnTGiEYHZCiZnUVO64WQ7eih3P71LHzdJ/jUipF5zkGYdMhockpUZH+T0OUe2esNyT1YmvtOD7mknXMk+OnE+slNsEBa3L46yHe5AKubyg1aOJSi3sXE9n5ON/I33WK9oKO0CYuxxyxXG5K6QRoECy0ODeWUnJvgkIghXxkMGZZn8iJhCYZlHhOofWrZOf64Krwv6IEaI+WloofHs912wQjZZZqAdEwp/WBw17L9hGWiqQ+SgE1Y95G5/QPUVIlzgln7k1u8B8xnCYjSAhLmFUgZcWmiF+W4uRvFsASUuOGIhryBJC0zxB2nUyuMx8woNSqizfGx5AZV8beS1HstfjcCSNJIWzgcfwEEU0zdPZCDwoPjlC6X07Jg+5l3UvljpIYYgv7YVdU18QgLTtWdldP3y7VL+ZavR13viecTk9IfPVxSoaiaWVsG9ofBeP89MKccT2qaoqfcMkiLA/jG3bqqYUmDvqYTTtvaUdom1zbnivk5OEfUV8OQBePWvcfh8I48LNyEWNLMR2AJL3hsJkMUd2KeZ9PiIY2wiXkUHP54TM7mTTbJfluc7bqMUQG5Cpnxw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34020700016)(82310400026)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gWdSSWCBU1dXRcFZBLYDrwKYo9WfT+h9RqT6JXGXayE+jcspL9yE0NS+xpPsxYUKY/PVkZKiKVYK3oB4iz4+AN8GjG/hm+CqBwyd8btleRUku3GpkgMzMykhfJW+oj+1nrqMM9+oaiRVH2LqxWhuUl4Li/LLogOvAUo+03bQ0DLzW6Z8LGzPtdtnFxA/4AGqePlg8flPgt430X6/jP/vRU8V0hN8Y3JeQ/7mL4NW+5ytNEcue7GIyZSzBFjDAIUlzv7O/s66m9cCCHTW8jLfKHh+FK2hwUZzxE8KKKEeZABieCc57fnkpFTr09tmy0tR2swQCFGzSMmfntuyF1o69389O6YUzEnlM2XturYqc0jT9FNruyhjEAl6gAfnrHwdWCx6WhBzQeM3lWVQKRImDikGIGkcyq9EUPJutZQFIl90fUwOnIEZnFmd4VEjLbXv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:31:43.4447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb00d45-242a-4946-26fa-08de762e74ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4A29B3BB2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 18:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232105

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
index 7c95ac5a9a..19fa6c977e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -934,7 +934,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassigne=
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
2.53.0


