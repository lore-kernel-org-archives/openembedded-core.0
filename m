Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3E5C36002
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 16:49:42 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.40])
 by mx.groups.io with SMTP id smtpd.web11.28094.1743958180083281429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 09:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Kp1LChjm;
 spf=pass (domain: oss.nxp.com, ip: 40.107.103.40, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE7G48oQqlAtZYeugPIHfUNHRM6V50OhTJmqUOoaP2W+D/hAiok8D/ucjieilPGjh2qKbulwh6rlhWfX3k3t96DIn1S5TRLQVfpEpJh+46IMP49MQE2kmLH1vKpt9/Kp3O8l9zwj5Q04aY9RwH/L1hL/ov7YJkLpUj9mPxscle2J3QXnLhMaNDIpFFq6CK5FLeGRxTD6GFv5G0fIEoBINC1TP4hciswvKJnFosf+JVzk2y2pcco9xJE72VaMM55C8xgDIveBq6YBqdFfKxNsZleh013j/yB+mRnOaTHzgJrPIwkFFRguNvoVdRRytxL8rDM/6qwuco8/e9YlQI0nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u9G6gy4ewDxffdqS/LgiHGS/TP17SZ70KjAyJDKqjQ=;
 b=lGZKLA/tAvvNS7QGDa/ieQeTalV8mbVkFvgMCADEikBb6pJ8fYDar92LlCPC0HKu7MrZrYUyw+LMhYeHNaH8ThX3JQrGRotQ2ZNOFui9BruRXu/IO1XjBu0c6EkO92IfQnMJkTaWMm+DomTnSoHYm4fKYmYW4G5JjVqI786eojvCYrOFTzrKZZq9uubbXOKJslBi6I8a1WxIyVypJloxtYXqWr/C8Q/N5Eo0c5ua94kqUiaI3x4QGtObxeLmmtH7dNeK4onnG0YCZZPiVUkkcjtmsbhlS2HxXE3pD7zIXz0BFQI7iC61EQXckAgh3qtHV2r3z0lo+Hd2M3ZPy6slvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u9G6gy4ewDxffdqS/LgiHGS/TP17SZ70KjAyJDKqjQ=;
 b=Kp1LChjmdEhb2CUZRh3E9D0LUTwlH4hTHUm3qQGu4BW+fsxx8pVA3OHQ4ygqHbv3xXmRkzLBw3Ics0jWhNL83nfaewyoKuxUlR1V2HHzhrOfLMw+wI0HTgybeV/NGt3CogOdP6piGnJAxOaqSSYIhXtAj3kPPtkOGz3tZckDVfgETR5tZU+d6qrz4yw+VTjuZeeQ44GY+irfkv8n7CPKNdM3+SCDP6eu7VhXeDQjEvLeXuE6gc/jVwMO9GAZkxz89rHfXOYMF6eoRIdrXwo3T6mmLA9mp3ZqZ8NIQJgaJopHdTgQsT2sFFpAgNUqzjxid4B16n+jE7ejHk8/5xCDXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA4PR04MB8030.eurprd04.prod.outlook.com (2603:10a6:102:cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 16:49:36 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 16:49:36 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 3/5] meson: Fix host_machine setting for native cross-file
Date: Sun,  6 Apr 2025 11:49:07 -0500
Message-ID: <20250406164909.270945-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
References: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PA4PR04MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d03d6f4-320a-408d-0734-08dd752b03df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?462abhPjXB6v0Sz3psNqsCEwbiwJkcDStuIRJO1rI2omR9jgFcMAtbbWGOyw?=
 =?us-ascii?Q?ap5h/5RbwVZGfG9xr4ab6/NUcAHPuLETVdxZcQkiBbitNi/CL+9f+KndukcR?=
 =?us-ascii?Q?OlVXubb7vQyoMhfsbxmkxxijZJl/R4edD0qLZj779OqpdfQCJBCK+yee6z5H?=
 =?us-ascii?Q?hZRFb9RaZjN2i/NctV3qj3hyTXZJS6rzCnMuqByXZvEGeyCeMRBCTYsD4ash?=
 =?us-ascii?Q?vakYJagUT/8oa/7kDi3VwIcxo4HP75yplAlzj4hM76NOH/EjQNqnUJ89vmcf?=
 =?us-ascii?Q?7GSNdlJ+vPiwTYTWUrwRPJ5eQLGdFqH6fEdb7NLjIg0tj/JW2jWdDh1Phpw+?=
 =?us-ascii?Q?7xOkxCqqaES3MpGi1AuRCEwfpwBA3PqVfMbdzQ3gT5rTXrD0pd7Tf4T4rKOx?=
 =?us-ascii?Q?aertNcL8S3GSmdhLjJK7IPStubF+nge/Pyr1JIElPyjmGYxv0HN5uRs3K5Pe?=
 =?us-ascii?Q?2yRTh7GgOcv7b3xcnxPUfj7tUXF5n5Pnm5ka87NzmShjNUXTHffUYuH8gtpw?=
 =?us-ascii?Q?+8kp+qUPt/koIP+B6IboPyirVqTvZcUldjyG3r3iTK465hD67GbWriWfClD/?=
 =?us-ascii?Q?4w5Yv8xL9WgrfxQg0srK413w4YnGN8ch7US1uatH5tf7m2lhEjVvRGgirH/2?=
 =?us-ascii?Q?EKSt/o/PmO50RIbjpKdY4uq6oHgs47mtp7OQMvUda6Ao7MU9zq5RBBigUnR8?=
 =?us-ascii?Q?TxTJWvZ536APONdtYei/a84GSb30PZHPg0ErXqHSatlM4vcvi5rVD2jgP9o4?=
 =?us-ascii?Q?wSlh7pbO0H04nuK+XXtdQo5ImlZTQy9NZUpx4S2CX1wydCGS2UVCvnwVXzMd?=
 =?us-ascii?Q?ZJx8Yr3gs8GqZWY34Md77EIKeGORb5Nzv/6Rz+uVsI9WYNtnJZf1HxPCv4Ez?=
 =?us-ascii?Q?T/DcqeSCpnF/Zc+JnVe1lCXe5oGJqcus0oX0T6bFLIm3YxjihYMZlreD3B7f?=
 =?us-ascii?Q?FxxVnqVQwlCA/OQ645do3PzgsrP8PRvONQkbUbta2BEKHzsKl8Ea4ZMmrLc/?=
 =?us-ascii?Q?ZyToD3iUU7NJVg6yW4Gdg7rhpnVUC5N3kZC7pLtyNUcCaIyYkg0VpmI1xMRj?=
 =?us-ascii?Q?pP0oFPVu3GI5BuJPzKW6ma7aoYkKspxHRwU5B5xhsrhDTiJq+e//oI20iLSu?=
 =?us-ascii?Q?CIVNSOoayge9VjBgj6kga81aVK8z5ShA53KKFGq/E67IbwFw9jAVyzPtWi1F?=
 =?us-ascii?Q?HzwceMAeNnzufAFy1stzRi5JP0Ch2DUmcno7xTkyan2WdP2Z6k1k8bvNV899?=
 =?us-ascii?Q?CyMY/3SsKJ3IC8V4uhndfGZnAUa1e1a1BdxX1u/k0X2DzL4shty0mb2SNygx?=
 =?us-ascii?Q?jsTOBz82161guM1/Tm95FIgp9EaQiE9dlbhGZ1UA12Sxzt/w0roQaVV8PlxZ?=
 =?us-ascii?Q?W4KuqRJURd2j4v/2XJNEiouHFn/g?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hMqzrjsdJzBO+3mMkhSDfGrwORzj3soDc+pyyva5x+3fDV2JYza03TdnDG0H?=
 =?us-ascii?Q?GmKjopbMs9vvYpblbx7EkIqAmXGR4ZqvdR32nJnlg3TkesI0gU+cdSDxtFvy?=
 =?us-ascii?Q?+oL51aCnJcZBngiuIn4za9W3hQqByD4RKqtP/UPejBjCJ/qZymYMLM/UrMfj?=
 =?us-ascii?Q?sEHbFawM0s6vNkjkxtPaGPvt4IZhIt+YMdxm4nK9yANGD/yvr1mgaXnK7+rH?=
 =?us-ascii?Q?AxgKTnihlbplTkbVuqLKPksV5Mbeb9J1edxsKRpl/uErubT19CPYkzD4E4SB?=
 =?us-ascii?Q?B1N7hiT3q06ZG5iV+Vea8SVsGRCtYbG4TWdYsrQsXftaroob9RekBvWs2/Xj?=
 =?us-ascii?Q?b1FxUwWvVEYom1LNEgTk694WBUNqI4sd1rdkmrBjNRk4/DROaxEgYbdDNHOP?=
 =?us-ascii?Q?J6eTo4dXrnBAaAFbCUfapNT4qoSlWDLTvp2jXXSDqXc3T7IxdeG0Zq94FCYe?=
 =?us-ascii?Q?LsxEpDeRazQJH0/PChT/q79fuoZdzADH1l4WmzsBwkXZOsd4MZTEK5V1wAil?=
 =?us-ascii?Q?olm7aKtf7rZnR8raiHHyNHYWm7dVlHDc0M1rS8847Uvv81wGVq7efKa8S2d7?=
 =?us-ascii?Q?cJJp57+eM0qm0gmrtYiUqyjhO0LirFzH0FU46QEXDzKk8CGqGXD3LTOx5Za7?=
 =?us-ascii?Q?Y54zM036DmeG4K+YiCrzJgCRyMmnDIltlt2zYs9dNhbRqPv4r9oSWpwhZHDQ?=
 =?us-ascii?Q?XLAt0FNY7LBtkQEN9pZk61g7kdtbfI5csqkuopAWxd8g+QuKxQzbXCDoe4GC?=
 =?us-ascii?Q?MbCnUpX6PR/+Sl775B/6C/IaVFa+p4rPQGLNvBX4OGlTaGSS1cpBojeclPr7?=
 =?us-ascii?Q?Q6ipic7j+3jVWY6zEM5KCjVJXMhI80UXRapk5Ay+949Ygcl65Hd7nfGVGeeK?=
 =?us-ascii?Q?RBU0r7FayrlAo4BJsi4hPPbkOkPqagCIS9Xbk7q/v/6a+3QGmhiGO+TJ0z7s?=
 =?us-ascii?Q?4jWsYVs9vbuYtjVHcsg7ke0bqpZgp3Wz8nQ87409zOhZUi1mfhnA+wN12Z8x?=
 =?us-ascii?Q?he+j7f4LAJF0y8BkNYy9elojf973js3Vt6rrU6T4JRD9CyzBcoDC5qNBIzNr?=
 =?us-ascii?Q?IvNxlvJzsmL3rL9zboooKoO3IBcm4acSUnLViq6QdKXnoB4rKcuE0zf+ccrq?=
 =?us-ascii?Q?29dOprsCdTbtGdTXkdM5XqRRBxIUF9rSFWItZo4xpY9iqiK6r2KsaOrzc1kJ?=
 =?us-ascii?Q?bbcKgJ9FcvOW+0IG77V4O6wd/b5xh964IM784Ez5bjX8d+ar9KXnyfTvzEiY?=
 =?us-ascii?Q?jD1dDdjrWyxWec+FtdYRFDMQeMiKhgKIxnUFJohl2aVzxHfots07M6CwgZ0m?=
 =?us-ascii?Q?7msQP5X/pGnGOWTtJ2bbrpOdlBxKtkM8DZO5KT1ApfKDZUoqqDDfaNn+n57E?=
 =?us-ascii?Q?T3SsgOjmT7dragXvpnGlxmpx5t52fI+TWTr0V80Aee8MZAsc/UH7VcbRilkg?=
 =?us-ascii?Q?L24fXYtNn6NcspNSEZLC8OZvMVHljGM9JfYZU5h65TiDuhiWWx7GhU/dgiXI?=
 =?us-ascii?Q?jQi4grMjnX9KxGKeqYJ3PAPGRc3rWpe5SrrVJ9bKPjq7srRUkehNhyJwMCBm?=
 =?us-ascii?Q?OU+Zczs6TRNZJGLVqcVcuu0M7Ym5mlGECSkC5+hL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d03d6f4-320a-408d-0734-08dd752b03df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 16:49:36.6753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GfYAo4kc/Y8BrcyeGBv6++sB89d2O+4JIrdwgm9xkgD6hfABgqmMqCRhWA49XaLZwrrP2J7vAAngFuDc5U5Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 16:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214384

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson_1.7.0.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.7.0.bb b/meta/recipes-devt=
ools/meson/meson_1.7.0.bb
index 44872a5f7b..3e89669807 100644
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
+system =3D @OECORE_MESON_HOST_SYSTEM
+cpu_family =3D @OECORE_MESON_HOST_CPU_FAMILY
+cpu =3D @OECORE_MESON_HOST_CPU
+endian =3D @OECORE_MESON_HOST_ENDIAN
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


