Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2355DC36011
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 23:00:58 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web10.399.1743116457566450790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 16:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=I9VlE1OO;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.50, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM1dqrRu66m7dRdGRWKFlVxD43fh9skIpqjpspwC4YU6HaOzDI5vZMdadbbepVifZ7fdvVfAFFSFXTZ4seq2uwY+L+ZYnDwuyb9DePdSdEy96M1poj6k/ORZehtB3kZH/2muupnhPtG529nFcJXvJvQdAe8XKDS9+A1+teCWQu7AHfBhS9Ca15vjOfEf1U5yOT9TcdDGuYWJcRDRBnAspsj5Jb9Xa7bCBLoTIn1rfeOeykB+PhgYF2OD33Vdr5Ta5WfYnf1QUc8Xb4FOjxzURtPv9qJkMCzUZGH/ClOTJ5n0TIMscbshgm2+AJ5pXWgvyFDt473IMb2OoUGekF6Ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot0AVNRxli4EAhfBj4To9JW4/9OVwM2+ng3hb2BEszM=;
 b=XnFoUxWjNvKvzV8N1OInQ2rGqOMOM1yNojw2Tjqpaz5TZM+rYzYPfYGlbo6LjKtSb8VKi+27T0DXWdcCZJGJceJSKeLJEZFwcPNjUsk2/Ng4p7O58yv5IeDwWjfV4Wt3I1SWMD6AKhaAIqCQGuJH67K5m3syG4VVW3+Ti8/WYeHLi7aw5kl3N058UeqwJDFc6cli04om40GcnhWrPxvGkFAAmIiXCL2DNB2Hi8ooXa4xDj4gJWYZupYriC3Vo8JJGXF/JQk3D4arIVMWByWskCXnNFBTOAmo6/mNOGD75HMLTM/FZ5ARmR7ZYdGIMB2FTZ8nghrJs0++CRsoAFozaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot0AVNRxli4EAhfBj4To9JW4/9OVwM2+ng3hb2BEszM=;
 b=I9VlE1OOgkTrHe+8wAzUEd4MSsHP/vqynLGVlePDFS/Wahy8xeMyEBMvEqWxWCz/o51ku92SRQdJB+7+EW/S9K8KrnlUNAqrSiC/eBXNyFXHpHTsgzz1hvFzotIG0upEOqsxi7XBYGW8TJUF8zUU+AhG2IK5lbVdcViPmuVTPy1ShMn0D9pyba74T8063WP9gibJIgRvejot6Ky6FieqdBP82JePG8aY0s5n/5NXzEhS+0hVEtdudojGaY7OlDkmfIWbwkK098kngt6sXB5+MwB9uV3B2CDy+lwJkjEDmorkHkxaexcQxsXwpQo4JaN+xsThp9g0qnTgpYAXbO8SLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8801.eurprd04.prod.outlook.com (2603:10a6:20b:42c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 23:00:55 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 23:00:55 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH 2/2] meson: Fix host_machine setting for native cross-file
Date: Thu, 27 Mar 2025 17:59:59 -0500
Message-ID: <20250327225959.3611495-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com>
References: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: a90b1a93-54f9-42dd-61ad-08dd6d833adb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0DyLt6Tu2POAwfNoFgGO5wC2oay00OQahEbTKujBcsM/YqXNwPxfomAwNql2?=
 =?us-ascii?Q?OZEDwC840MRxWlvJtskpUdJJVAVNuI6TeUnA4Gcs6RX+qXLDGRGtbhoKPc5n?=
 =?us-ascii?Q?YW5wYZtfhnglfGuVrMtrjGID6r2n4l9WF2n3/qjlgjblEIA4F5irDT47a14J?=
 =?us-ascii?Q?ONVimMdVO0VQgm2LCrl47cdSoVYpudfzq3gkPyFx9IKMVVqqlAA6cZUxN3hS?=
 =?us-ascii?Q?OgGg2FX0Ga7VC47mej17nfky473/Y1Fdei0XRCl5Cyxpeud6cYflA1BSCem3?=
 =?us-ascii?Q?0dNRR5o89onwPCIH9EpIJTayrbm2rIpCtC6HlEbCEMWUerAsvsz464q27ZNh?=
 =?us-ascii?Q?hAM7t3ijXsEjBKspBwP2LjuF/8XeTR5fAn73KaMzS/YKKFTkRI3dRsG/foyj?=
 =?us-ascii?Q?Q9hpH5kBBF3meWzkKM+P+vLBxzWb9XpfYvXPA2s1Pd7vX1vUVFggFtZRsepd?=
 =?us-ascii?Q?YAokWotfzcmROMepaYCZdmChlrbSJ8ZT9OgWocRtMcRdHNJVPpkfRuwXYJAf?=
 =?us-ascii?Q?T1lysZ24DWJYuw85bgC7xQLbDsOrkNKpkiUnVTonOouIX8p2wN61GD7K3k0I?=
 =?us-ascii?Q?MDhOU/bOR5U7VJJ7pVYK+32NLBlnhrySPm3n2IEdRAmWjQ5bbCdtfqRzgTno?=
 =?us-ascii?Q?MKSgEnE92Simyjr6KwDWazZOPuVS0lnEMyle0E14BUSvZqoxPgHBitaI4YD5?=
 =?us-ascii?Q?t8ExUoqpc3IJJkKuFmIaGNfam6bPoJtF+oJaQYaiQGwago+OFYjcEOPNMECM?=
 =?us-ascii?Q?+lwtwYi9ZK+q47GwhQ4qtw9WInNJuqC847fOpsht8Fn+FUdpGPOG8Y8vdnPk?=
 =?us-ascii?Q?8z8S6NyXs30AqZgej2D5bbbDYfKAehDCHSbxR2oWw7Xixmk4hyBJKoFN2PPI?=
 =?us-ascii?Q?uyU/3eFynuPBrpvYr5j3nz+/Vr0RHHahqAmN2wp1MTJvbHiGlQx3Srdv4TRh?=
 =?us-ascii?Q?4ehGuTd2vwvfO0lANuEu43+Ia7YG6gyrvIqaDXQRWthiA3uvdsl+dEmoqCSM?=
 =?us-ascii?Q?YdSIhS+zY2xtAhEDJo2UZR5ja6ZNEzGnL3ZIclyxkh/4a6ay8+bSPz4u1MqE?=
 =?us-ascii?Q?ljIUaMNYlbdffXxj1KM+MQS6Cp08IqHbl1eJ+SN72GEU7jJr67oSPe2Zt2B6?=
 =?us-ascii?Q?2el7Hx04PlqfpIjqOGU1dVH6j4+Gdya7lOiFA4/YMH9RLxMt+Ssscyuelj/K?=
 =?us-ascii?Q?eeMbSUua3dW+m5aPJ73FngqQVLJoxR38QrplDsV6pZRnVWEJdAQ8Qz9RUr2A?=
 =?us-ascii?Q?B+APwsjk1+u3pHL3iCgvm0J0h5ifKF5RIAWz7unkk7Na+cThnoYq1FclPhde?=
 =?us-ascii?Q?soK3Jf05Wp4inuGxW0d27xRoJgyfi2s8D2lnv/Vg53QSU7ldkTBwCznchy3j?=
 =?us-ascii?Q?lLZCy4K6+xi3dwtEee0oZhodNNNNPGHKMN2g2N6durWzsJATFA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KjAvQvFKPFJDBfuQgr9yGQrRCKuXTZBk/VcHQWCTYd2w74kllq9iMWB8m1x/?=
 =?us-ascii?Q?1Z56DnscINZrmBZLZ6JSz4v1W6VHXl+qGiPrj0FfVxu4lRjq9nZpq6x/nRgP?=
 =?us-ascii?Q?Abdu/W4wUPXZjRDc70kkVHvHk96KyGWJVR4fcNuv9dSFFXwmUugAPvWlOjOL?=
 =?us-ascii?Q?quUV9C9dr4os3Y6Yrx2ucXifQ6rPh2pdIycMPoCmRKGComqDS6nVMxD7Qb5v?=
 =?us-ascii?Q?49FLBrpfihzL7Fc/tnIwRceLiy+2qAZQdxnHTlHtrh0la3W2Rdg5R/CboX0/?=
 =?us-ascii?Q?WA1gsoikcLKwDj4Cz1JqFsa/7bfSGbVLvN4WnoNjwJK0Jx5FfSU0emVjQtOO?=
 =?us-ascii?Q?KY7KUdIR4u2Uxlqcvc6goqYAAu9TdMsyTdBqEUmvwdbEADQKSGNRlFN8YwRk?=
 =?us-ascii?Q?wlVkm25QXajgJakMDUBOuQeN5AzuCns696V58DGZL4v4rjYzuj7ZKP3PaUNz?=
 =?us-ascii?Q?5wlQ7pvamXR3+G4yDe22FvN3J9zNazkTStXW2e7tm5+2MM/InsNZy/bRQ5NV?=
 =?us-ascii?Q?15XXK/c70HOoK7BHb3W/YGY+euIeYCo3Okpc2Hn25ZQKMEmHFBmPgsTjtA22?=
 =?us-ascii?Q?04LGEZb6SnyHgjAZFK0gMre6+E1H/eKdL+4JAtqOii55R5XGkQJU/pmz+aDe?=
 =?us-ascii?Q?PeCB1iHWM2ACRQviDdD8LzaXylAoILfejZUkQcOsP0RW8HisS881n9fCtm2+?=
 =?us-ascii?Q?7mfws1qmwv5D1IlTpPpAy14rHtHRCHmsjaqxHiYxnLyqa+xok8uc7mP9NNoI?=
 =?us-ascii?Q?0oN+xDAjLe/XE202m66WKSi+q8Cd0PVbP8NKvnErOkmUGMMJ0j5WQlPM9ahm?=
 =?us-ascii?Q?UGDM8uaugTxPw4mm5dwuVjleQojPGHRQtdWAK1c3sdQb1uG4mlM3QhRjeOUs?=
 =?us-ascii?Q?PHd0B2TpklLMPp5tr8cViuqk9LtGAm/npZtrmiGNy6YORbHeBltsPdrcKJav?=
 =?us-ascii?Q?4SdQiDC2R0ShQuSvDj7/LHVsuGSbocLJfYLKLuV6vgJyaDDM8zbyDBmRfv9T?=
 =?us-ascii?Q?IsfgxXV41FR5a6H+dPD7IaIznIDFbWa1q488EFo7K1fP+XtbLdecO96gF/bQ?=
 =?us-ascii?Q?KVnL5Bsh/uISd0bTHKH0nE95hwetogfiBxH9Zs3cn94leIU3DvYQF/Yeb/7P?=
 =?us-ascii?Q?zygjro+NvC+Sgdnz1PHSsAisOhN2DVrt12eGza3gNyD6O4Ynxla8d3XEgZAc?=
 =?us-ascii?Q?KN9G0QTXA0o3RV864MKzXmafFghKGWclodNOLOnJokMlMHwJNmojWZ9jPbhH?=
 =?us-ascii?Q?0+pGtp14qatg/XL2cYdLfdg/4mWEE1fKCK39NHO+DctxYLbWOgazR9DDQ2z7?=
 =?us-ascii?Q?nZC1PanqWx4Z2eZZC0CEOs8x9PXyzphbm9ScfH5rQT0YDAYeeMgsbWY32Sr6?=
 =?us-ascii?Q?q6kzMoWIXjJvA5zxGIXxm0DbXYLLRm9I0ZW2aW04PkpxvWmGlIthi5RH5/AZ?=
 =?us-ascii?Q?Y2nbUzWckoNKmXZnqr4H97Tvy5y4XGBGPwqBr/FWuDqmA/bf38Kjp2cKXgBX?=
 =?us-ascii?Q?tmyhxsF7QWQV9n+LTDYamsU9EjIV/fKNhHadq10UUqOjlqXXxvlF93G+j9kI?=
 =?us-ascii?Q?v3UaLDr8j3cLxiZ8aXo63sW31pgJzAKOrXlfuWCd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90b1a93-54f9-42dd-61ad-08dd6d833adb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 23:00:55.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTJjmhzwt1Ai2ufgSOvcSXS9ZV/bLE3D8lMFn2Aj1w9wTFgIdHdDW92nCRwDGEBvWn7EHMgnwq23NnIrIGFSfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 23:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213802

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson_1.7.0.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.7.0.bb b/meta/recipes-devt=
ools/meson/meson_1.7.0.bb
index 44872a5f7b..e1c6759d5e 100644
--- a/meta/recipes-devtools/meson/meson_1.7.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.0.bb
@@ -118,18 +118,14 @@ needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT
=20
 [host_machine]
-system =3D '$host_system'
-cpu_family =3D '$host_cpu_family'
-cpu =3D '$host_cpu'
-endian =3D '$host_endian'
+system =3D @OECORE_TARGET_OS
+cpu_family =3D @OECORE_TARGET_ARCH
+cpu =3D @OECORE_TARGET_ARCH
+endian =3D @OECORE_TARGET_ENDIAN
 EOF
 }
=20
 do_install:append:class-nativesdk() {
-    host_system=3D${SDK_OS}
-    host_cpu_family=3D${@meson_cpu_family("SDK_ARCH", d)}
-    host_cpu=3D${SDK_ARCH}
-    host_endian=3D${@meson_endian("SDK", d)}
     install_templates
=20
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
@@ -143,10 +139,6 @@ do_install:append:class-nativesdk() {
 FILES:${PN}:append:class-nativesdk =3D "${datadir}/meson ${SDKPATHNATIVE}"
=20
 do_install:append:class-native() {
-    host_system=3D${HOST_OS}
-    host_cpu_family=3D${@meson_cpu_family("HOST_ARCH", d)}
-    host_cpu=3D${HOST_ARCH}
-    host_endian=3D${@meson_endian("HOST", d)}
     install_templates
=20
     install -d ${D}${datadir}/post-relocate-setup.d
--=20
2.34.1


