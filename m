Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8B5E7FDE0
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 01:20:41 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6840.1770081635382381586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 17:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZTSSN/DK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.64, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMkMTsX1/eDriUjMxYTiRavZ/8N78COqRt+6H+ONqRzS2vM5thveQ8bCMR2jvStCCluyZc04TP8DfSwxYHv33gPrQXVFPB787CTIJVgPWiWjaTgPiDE1eLOevTqOUdmHwqe23cO95abLhJwiyPOZxQ0nISTgl16Ro1t/LmQ3MmaLtR1gE+dfZAVdTSuu39fmIvdCWNqqHmTvn4F8PFPxoVBARhDd7XzyCpJCx9UADrG+bExJdTa2YfwNCq7IUZk2TlBS3uQ5g65DdHBn1+TKEnj5ATbEsD7ROgwCZsx7mKIx9NI8xtk/OIVXgwi28UdhZIXi6PSb8Z41rVJstLi/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W46n+bH959tfLW1WdKLPyzMIfK8030ekmk0E2GvNtes=;
 b=Ur0jue9PTne7zAxuNnqqcJ9i65r2BoQCe6CwVzpMGmyBy5Tc2iuNL9KJjXDsShZRt8vc7dO39hWYeUk6vNzBSNHImd1xuKwtfo4El1yFbPNdy7JBq3Iy6q4m0fMbquYqyrLPBwbONT+3ccd/Qsog8QaiNvHKtce5smE4Ns2OYevGVpJ1zGRjZYbPIHwUS3DyL8LVIK+HGipHtN+yJgQDCFHuj8sSXnmnMx7tCOez/MDm+juw/kZ8R06wuLCoMzKdZS4i1JWobDbTPSE7ratLDaMy7WQjMWI8bq5W3fQgOqyXsc+viextp3PtOUQbeyG+0nH1wqVibxydPDv9prSLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W46n+bH959tfLW1WdKLPyzMIfK8030ekmk0E2GvNtes=;
 b=ZTSSN/DKjtVfPNEf4okUu+eIGoMW/1lUIy1xFy0dN4ZJ4bXDamjuYPZo5PSBK2eA3z8f2eqBAP1R354F+BXJR6zX9VSr/o2zid2I67OKTjhDLAcbQXFzpYvmXdUqACnjVFGM7sLCk3p3GE5+6302FHmE29qvW6/VZk3BpilcxRg=
Received: from PH8PR21CA0024.namprd21.prod.outlook.com (2603:10b6:510:2ce::23)
 by SA2PR10MB4796.namprd10.prod.outlook.com (2603:10b6:806:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:20:31 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:2ce:cafe::22) by PH8PR21CA0024.outlook.office365.com
 (2603:10b6:510:2ce::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 01:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 3 Feb 2026 01:20:30 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:30 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:20:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:20:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131KTrZ3095493;
	Mon, 2 Feb 2026 19:20:29 -0600
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv15 5/6] xuser-account: merge with xserver-nodm-init
Date: Mon, 2 Feb 2026 19:20:27 -0600
Message-ID: <20260203012028.4008229-6-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203012028.4008229-1-rs@ti.com>
References: <20260203012028.4008229-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|SA2PR10MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bd8cf8-27c4-45ee-97fb-08de62c26be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5is4FBAoqtV2u/8bkAEJKxmEItNeGKJjr58EIlx6yCCnJc4erjoT0SairChD?=
 =?us-ascii?Q?5LuxxfO5zxZiZZET+RZpwQiTeG2Ij2BhNPVGyD0/yZFe9xJl74FGgbltjL57?=
 =?us-ascii?Q?cVmvAsXyg+w5c0c6NlKE0SY0eQzIQLzBFvd26mMAMa+Hn/YIexR66AED5C5+?=
 =?us-ascii?Q?dXZJyxgJ4B2YSxlU/qz/tEDRzStFOUEps+kAfUTCXpDXqARAyIVYSP5K4+Fp?=
 =?us-ascii?Q?zN+m5iAF2e/3jQWE6fDEwtFqCPo/d6Prtb7eGv+vPYMOWPW0ezQ8SZOU4G4J?=
 =?us-ascii?Q?vfJHha+0fmu+82zkZCTzIllriOdJKgzSaSqDbsBmzDFLrbmX/jkmtwW4Q2/l?=
 =?us-ascii?Q?tC0Q9kxSf5qTkeohUN6J8CrljDPK1MfdXL1ifonwjkyaiiZGrcGIeZ2vqYnr?=
 =?us-ascii?Q?UeU5U3o4JTZfrWNKdCTSdAkxiT02MYZYuWmqH1mvaRMhdWHG1az2Ly105Qp8?=
 =?us-ascii?Q?aKczegnrkmCFy3JHCYmETJKoqxSHfOC5/gK8eu0SrcsxKAmctaws9nWBxnPH?=
 =?us-ascii?Q?oqUHPNrAmqZm+oWlWMwClVMQK+xHGXPQymM1DlmQ2/EtSWjeTdYueEc56zgQ?=
 =?us-ascii?Q?UdKRqtU7BG5uBYkfIKHfOwTWBBfkYjA1HVEcczjO0HYQo6bA6MjfmewEUdJo?=
 =?us-ascii?Q?+G3hS0I+3Ma3Z5bbNYAJrX/j83Gxdqa2bS2Qo83iaQe70XkHOdTNnUEBIs+i?=
 =?us-ascii?Q?DIbSfardL6LEJh8iUGgO2OnubIZ6k1vvJ4jtM0D6Gaxga+lYpnA8cingr2hf?=
 =?us-ascii?Q?2N4LZWAF44b8zjZVj/LTAOQF5YJbLYGPPu1cfpDZG/90wQPSRsNp2uU1xY2i?=
 =?us-ascii?Q?jseEHcIGI8K0BTKQS7ocy+YD7cmQ3Xff0Quo1uqLMT0zt9RUSZ1n8d/kThpF?=
 =?us-ascii?Q?QPozZvIsPZ145cp8cSnleuCBT1bUXYju0Yz7v7tUVuigr0pGCAsIbCELG3rO?=
 =?us-ascii?Q?DpeUoAlvIU8yNvog2zMA0uvt4zHQC3axi3RqVQ27DoYOzi8/0ZiZxrkFiPzx?=
 =?us-ascii?Q?QfE220dJuYZmnOmFoj0ric9ES0JZ1G2t0sJVDu/B5sWVsX0YcCW6TKJC+Ny6?=
 =?us-ascii?Q?Cjd4Bwxw9Jr3tyYTEpWmOZ6dfB2RXnUui+G+A7vnVdHyeld3Vii0P9IiqCl9?=
 =?us-ascii?Q?xlIqAIKL9u1anu9eGazTHd/IVoLqHiDrKmCZjjkiKU/FKpftnT46Meb9SKjX?=
 =?us-ascii?Q?LQ0/KJmsU5SmmQ+i7T99KeGyjLnKY/q4hJwMGXhJ6qh9+EaRKqRhJeySr+vl?=
 =?us-ascii?Q?PkmztTqhO8riw5yiGaMFDV1qkwDooTSVWjtKuY7bWT6UCL6HGyEnVkPh8ShU?=
 =?us-ascii?Q?zI3knoDkDZfAxF8HHDa6y/VbeHTJ2p8gcBRZDeC3y5M8O4UGFX18n5ycz6FB?=
 =?us-ascii?Q?zJ1LL30Ucf8QS3YQfpgsVzFc0kMwu+W0+eOMmwJrRmsPj9cNZbMIS2S2iAo4?=
 =?us-ascii?Q?LlIrRCHHJqWFzGmvJqJrZloNEQrCfmA1vcaQK32IDwZrE0QOFdRbhV7Md8jo?=
 =?us-ascii?Q?CIyNoWcEsBuMWiQvhAW1fLx7CQnvhLQ+5gDGWCX3Qi4zE/RFCG+6P9Hm8cd4?=
 =?us-ascii?Q?pvj4gm3uj4GnJ7A3/JHC4YhbSCYk8J4LT87WaJtu1TYFTapw8zhNogiiKDSh?=
 =?us-ascii?Q?8WYdRKDC6riLtG0WBwtBrkz6iHo8CFcV7TM6MBXVd5saIt+BOiseADzDZggd?=
 =?us-ascii?Q?IEr49w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AEw/bvv1KpjzRYLZrQNkWsY/qda5B45o7sr0iVNEPDeSLqk36tabekVOHOMGqbBXt3Bw6UTFDDSo7jaGmrhVbsRQL+588zwyWljEjJaUkSvubDYTNShIeYpDjQGhIoRH5WbTT1evy/4AjnYELB1JoylYYTrWn9mQaubM8zz2gSDUmlExWEsKiEK5pcJ1qfwKSDJ5GSYcltBH0L1EKzkFj/WNzVc4/7GuzsoOxoJYQ+m2DoBmraOJoKLEii8WxKb9Fs0MnYe4brP2JF8GQIVEG7WfIgR/b9RZJvEamt5d6bBfkGOXhZkpctgnt9BvaGTvCzVGh7ND7A7t7284meP9M0vGXwDrH96TXdel/fwzUyvKN1gbIxFB7drrY2ZFGpMkKEvVdRmzRIAYHBmI+FAhIXIE3bj2bB3ESJUxoij5WltKhsnnYu1YVmgHFI2X3+oT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:20:30.5447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bd8cf8-27c4-45ee-97fb-08de62c26be8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4796
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 01:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230410

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


