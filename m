Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6617FC36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.113])
 by mx.groups.io with SMTP id smtpd.web11.20054.1743516309641251854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=y45UyCyD;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.70.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQPCJQuXuTRnpq2feOvWIv248vXdPwCv7A+cjcorA5YtUhtx+K5HjgchaPv4fdWxhqHBzOhyCV7SwdGGTElXJ0IsN5EQmnheFbUBVhWwDQJrK7G/ibvQiqIz8TbW4HF8ln1CY4elEFrdgoZ3cbDhjHWtFW9EhgG1uXo0rdH8aXmBw6Y2jBl4vf3ZgeTBwJJALQ8v9Ferh5Zl9tJFGXX51puGPX5XHgluZgGdv08jI1nmBf4ImAIG0omZ+FaC3/6W20xEW924VdIK/DiuXGxKLqrbqs672vh0gx2zWhENJ6sY9pxeNdACWq2pvC5vXnWgayBaVYzVesk4jcvwXAwKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSfWam6klg55iMxT+O+BcgW+5YNb/KHTskmpUmG21rk=;
 b=HoU+5nwiDP9XgdvsQKdq6s82ukLaGH9FQ1NYoKI5nE4dC5i7zRf0TuFaczcVBh3GF8hFyMotQnUAejaDZDZ0cjOgTCJ29tYewOe2ObKtB3DvLJaagePi9OuWaHCAcmlcqR8CGWcyYpQduo9TfluJss3HozHsQaEVJq/pZuw3kadb4JRuzbAzZfTtrd61DCE3+arUamwQfAE3DxU/Xbc6xpQad1qyNMpFeEwZyAYiEE9xcpE7o5qTmL45prdlcM68i0C/xynn5kn9leZoelzkoSvkZCOCfSTYDWTLwcADhMwhlrXssrfIYXH8K3zfIJVzC7KsOuuhlQZlH9jcgtWdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSfWam6klg55iMxT+O+BcgW+5YNb/KHTskmpUmG21rk=;
 b=y45UyCyDscRyZyQJXeEnTS6cj2gYySmwIFIBeCUKeTgkymofNJtnTOfzTAHHU9ZHQwP9ewr94K/De3BA3JSQjB0LjV+x5Rb2sV7hx2Jp9PEI3jfH9mDJYfNut1qzZhSbutVZSoZuiUECPO8TmPKqAVJrvfcK4NfsbKxTsrQTbv7vgqk1aXYBIXP7hV9CdzYoqWLyVFSVbj3WVmd16mQeeqitF9UJfWg/OJGpxIFdYA6fuDBC+RMFgA4DO/EQRHxvKzRkMA5X8sMXP10Sw065dwmz/yy0WwAFxXJf9x3vKK29TWXq3i7DP4yLzNCFo9H4FI7hjVhG39WQCOZ2+RAVGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7088.eurprd06.prod.outlook.com (2603:10a6:800:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 14:05:09 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:05:09 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 6/6] recipes-connectivity: Drop dbus from RDEPENDS:${PN}
Date: Tue,  1 Apr 2025 14:04:30 +0000
Message-ID: <20250401140430.13837-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401140430.13837-1-niko.mauno@vaisala.com>
References: <20250401140430.13837-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003849.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: ad742ea8-c743-4856-43fd-08dd712635fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZzEon/6B06CwzgKW1PSGapVXZRQr246pOIE9Oo9zUBqndPg1InVoOMV8l41K?=
 =?us-ascii?Q?aCOH6iNLQXvw/p7zU+I8hvmQ8xaRu6XfUD3GMsyP0Q7GPDP4rjVFbEYAJJQ4?=
 =?us-ascii?Q?yWw54djyGc6QKKsWQawttEbCZH99VIDPyIslhQMThv6QaaTGH/rC0j8Eezg3?=
 =?us-ascii?Q?Qg4qM1pnYQHBZNsHUx3VSH/WV7nDXTY7SsJ7n+l0+M2Xvm4WG/5aIf0Ps5U1?=
 =?us-ascii?Q?BxJnImYeghptao8aVLjH67bU+SiXJWpuPbybJUnMkKTWCOTU5S/wNl8AWsSc?=
 =?us-ascii?Q?+Vuqh141MzhKKND9KS48si5z9QLNtC0oCR88owxtq8ysmhfidmRwaAwsY7LZ?=
 =?us-ascii?Q?sIYkooQXrX1odALZtcRtDnz7KLqKGI3FMoZ9BjHeLsadVkM94wf/yITj56e+?=
 =?us-ascii?Q?5oN2eIfu6p+bJorO8bvdAzdu5jcs/ib6KoOmvYIwstXHDQy6e51oMrNB+tEa?=
 =?us-ascii?Q?J/obXf8dCORDab1FPJqLP8dQ9cNQlv1BouryQ+ZMM3cDLjflIewCU0eJsi3y?=
 =?us-ascii?Q?bB7E8cfCfg0ZlmKf5Cj3vyNt73R3sS8SRX6np6yv5HFFb6sMP5mYLicohG7o?=
 =?us-ascii?Q?xzLY41qErB/KPQTu/wgSjbHkVNmr2KTmBvKMfnZlSf3PLFPhI4UT6hDm0EQb?=
 =?us-ascii?Q?apcyT4dBpHLp7fGvysXamgJUvmhTJFAkQBLNsVaJOu5u0fZnpDNh+oPHYima?=
 =?us-ascii?Q?rsjiy3PqurdQXa3uGT5BjVavsiNx+u4175kU+we4NlLOH/TfngB56d+ytBRY?=
 =?us-ascii?Q?/0aY1eQM/7X/CnhN56GLuRERTYDVmg+tbC6YJIbfrISDN9/QXfJozKOPqIyx?=
 =?us-ascii?Q?+ENvESQUri6hpqnghuXmWQOipu2BZUKdZqRYIEm1ZtCxCGSO0s6qJxkTJm4q?=
 =?us-ascii?Q?sG2w7oBxBugUUuMi6fpIARt7u32iZG/2pHuVMaz+lspliyfXcEB8nZ3oXWfe?=
 =?us-ascii?Q?v7Gtb3KLvABbSlrTlK0DrVfGjHAykSlTWTn5BycNZCQqlI6Uwgl5MimgCs4q?=
 =?us-ascii?Q?UB/yKFGqSxz0xNoTzINtZ0uBOWHoMtZhCB/JFywT1n9GBTVQLNFxuspQmOO5?=
 =?us-ascii?Q?Aqz8Rpt8T1+calr6M2FN39QtxFikSqHL4h9VmCab3Gb+On8TrGgiRQJG92yM?=
 =?us-ascii?Q?YC7b53mNSDhVHz+BkxVaUzORZHOhkEcumhdsLQTzRd+TS6ZsG/HRHDr7MliP?=
 =?us-ascii?Q?tEtmIHyoQ9ioURewg9b2gGeuio+Gx2+/6KWWF89VLSL60SDrMgdAhTQ9L50t?=
 =?us-ascii?Q?R/wo9LPZ4D9YJ4VrXWaRFf/IZwn6p7VZJ0Li4o2aUX9T5YTSGRcyBLy+5Agg?=
 =?us-ascii?Q?eLZo8VH/ayJRV4jWmt/P9OsnZ9JJICkly07vaZvZEHr/11TVbU34Ov737e+F?=
 =?us-ascii?Q?5eXGvEzn3G7nnPwaqgx/2WHDVEPwH4AerawKx29U8R94PXMmn5m2shrn6TJr?=
 =?us-ascii?Q?6ZO4ujyABQvg8JZE7DlZE0paUV60fUXN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eSERU9H6+hr04T1S8H3bAKgIiIabR+rPTfZjw7GNUPdGSmeGbod7/jcP6Q5o?=
 =?us-ascii?Q?wwmbPZkHouREdqj45XQnknBDhOgPnStKLEKI4WR2yY2WsTfxVWgmtmjgZMBW?=
 =?us-ascii?Q?CeNxtBv9djbmohjONi2XdRsKV/eT9AMzWr83oWZPgsZRdqWvfGcFVO2xr7yy?=
 =?us-ascii?Q?RzKAOuUn9WskzVanZ3yOGiYOpPkT/gIJoR/pFD4W2PY6Sft0J+LaHEgyFrNX?=
 =?us-ascii?Q?PQ0UlCYpFihjGy1wnxOgkuUQ45dbOBVEkjQ/Fl7CYVpV/V7hrn5QBuD6JFoY?=
 =?us-ascii?Q?NjTXT2rQSTluxh6CwEWstK3HLfqFGaU5Wvt3ryiWSEGvpdzu7cVTY3mjPNba?=
 =?us-ascii?Q?bJHD65BqM9ZY450+lyQXhdAla2yj+AnDsPJ13V7+QJaniRNnT5W+Dfms1fcP?=
 =?us-ascii?Q?w5JR6O5fEjpl0PRPREj2ewn49VWkc7kFLTSJYDolU6EX0jlikeGSfeydIPdH?=
 =?us-ascii?Q?MMyjxd/taJmOOcXVgX9o95nzmCvL4PIsse9Je1UzTP5brU7mIyzEnbjUeXy3?=
 =?us-ascii?Q?ruZhGBkj4+fytv3dHKg0zIA/LBeOaN46GeZvFKGyz51pudljuDCStENIE/2v?=
 =?us-ascii?Q?KiC4XkCLFvWrDhmr0GH6F1PdzCNL/qWKXPRxqqabGUMWx5aoPCusjmMfpqgI?=
 =?us-ascii?Q?FTWxLihrTfvBJa3AYi7VsoXFa697mZfC92IonO2m0r30+5Xoa6XuaoQLPzb5?=
 =?us-ascii?Q?8aGuDT6hmTbnQYuklF+8aLy8MuE1xnR7UiTRE/rMkZb2AZhdK34XMN4uWjgd?=
 =?us-ascii?Q?MK7kqwc4m87LkpRBrtEuVg3TC/h2lcCEJpyZq9FHD4kipMCCNs3iTMxm63c4?=
 =?us-ascii?Q?QztrFyvVnKQ2IAwhaR3qKlEmQqWPGXmgKMoWFGs2xKhoJBde7V1kLWi8ezFx?=
 =?us-ascii?Q?WlxLKJP+Qeq+mi409W0J1A1yWOqcUXtlHd0+eWUY2re/U4DnwcNHU5cNo5k5?=
 =?us-ascii?Q?/Zy6x6rt0h5uQNc7XO6n5QGTktB+Qtfkvf4zDB5A4W/KZC+VNdAVqE5xdKgK?=
 =?us-ascii?Q?D0OVV6GORdU2qsAJGgRJyDeWh1QjjIbBCn0hcYUJc7DyF585iQ+HGGnlWk6Z?=
 =?us-ascii?Q?r1PJyGkn4v4miaT316HEGkl+amb64nVWaM8x7uDRLEH/7PHHjjVM7tXjlggS?=
 =?us-ascii?Q?2e5MNUKXrqxEkcORrmbV3Pq0RJXgNsDYGP2PjvL8A+h8FSTx3CCCutRHI6Oc?=
 =?us-ascii?Q?Z1sT4Od4L2/T27AyqdFPttJN6HuACCkjDAsihNK0tu+iIPwrbpBDNdBohW2S?=
 =?us-ascii?Q?kK4canEPuqhev0n+0TyBfvXL0FXIHbZYynuxfJGwjzLFp0mIRzWydevx8N+2?=
 =?us-ascii?Q?JobSL5aK8dr4ztzmV930vRzrRo+sV1VPqiqTIWM72KxQH2RS3csTEnYKohE/?=
 =?us-ascii?Q?a3pUlCVZohBcmIe5Jr2n/hDwRZU50fSQb4jW6htJhADEpRcNZWPVAXmFF9E7?=
 =?us-ascii?Q?KoKZM84R1yn5cTBAl781HHzWZ6ofY1kS5lzTqhu9IwroKo+7DuISnM1dviOt?=
 =?us-ascii?Q?EOPzP2TGXnrQ4WWjQGqe95Ccor4uCvx4/aTglJUZOZ17rMMWqA0U3fl4uogX?=
 =?us-ascii?Q?4jQezBGGVq69st+YqnP97EIKJr1+F6FiLyqcUBsuwuWs5siZD0fb9oVi76g0?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad742ea8-c743-4856-43fd-08dd712635fb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:05:08.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkpcmlF4s4aVR37FTYeYkcR7ZlItCIHeo7c0QF38Cb+hxbQljueng1hyYvFZePaVScPhXdGJ/BMnHMnnHS+yhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214134

Since each of these recipes already have 'dbus' in their DEPENDS,
explicit runtime dependency declaration to dbus is not stricly
necessary, because dbus-lib has runtime recommendation for
${VIRTUAL-RUNTIME_dbus} which in turn induces pulling also the
preferred runtime D-Bus package to rootfs.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   | 1 -
 meta/recipes-connectivity/connman/connman.inc | 4 ----
 meta/recipes-connectivity/neard/neard_0.19.bb | 2 --
 meta/recipes-connectivity/ofono/ofono_2.15.bb | 1 -
 4 files changed, 8 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index d626872103..c1f52c5f1b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c=
09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0=
e09 \
                     file://src/main.c;beginline=3D1;endline=3D24;md5=3D0ad=
83ca0dc37ab08af448777c581e7ac"
 DEPENDS =3D "dbus glib-2.0"
-RDEPENDS:${PN} +=3D "dbus"
 PROVIDES +=3D "bluez-hcidump"
 RPROVIDES:${PN} +=3D "bluez-hcidump"
=20
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-c=
onnectivity/connman/connman.inc
index 133e8616da..804c2db9a7 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -118,10 +118,6 @@ RPROVIDES:${PN} =3D "\
 	${@bb.utils.contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)=
} \
 	"
=20
-RDEPENDS:${PN} =3D "\
-	dbus \
-	"
-
 PACKAGES_DYNAMIC +=3D "^${PN}-plugin-.*"
=20
 def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_ski=
p):
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-c=
onnectivity/neard/neard_0.19.bb
index b04187bcc5..9e0ac6aa69 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -37,8 +37,6 @@ do_install:append() {
 	fi
 }
=20
-RDEPENDS:${PN} =3D "dbus"
-
 # Bluez & Wifi are not mandatory except for handover
 WIRELESS_DAEMON ??=3D "wpa-supplicant"
 RRECOMMENDS:${PN} =3D "\
diff --git a/meta/recipes-connectivity/ofono/ofono_2.15.bb b/meta/recipes-c=
onnectivity/ofono/ofono_2.15.bb
index 40eeb3a086..bb4133eeda 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.15.bb
@@ -37,7 +37,6 @@ PACKAGES =3D+ "${PN}-tests"
 FILES:${PN} +=3D "${systemd_unitdir}"
 FILES:${PN}-tests =3D "${libdir}/${BPN}/test"
=20
-RDEPENDS:${PN} +=3D "dbus"
 RDEPENDS:${PN}-tests =3D "\
     python3-core \
     python3-dbus \
--=20
2.39.5


