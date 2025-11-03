Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC4ECCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15248.1762154821041164393
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=lpluTtVs;
 spf=pass (domain: navimatix.de, ip: 52.101.69.138, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMTIENeCYdDlMznCTTdjFvY97qeMezh71JvLVsfeL04tNa/jV1p51eaiV0QQx4Ye++you+XfHNSuMJ5ubfOTJnPParkIFw7phbE3YJVoC2Aq65UiJX3gfXfNK+itOujKDMaPq0QQTkW/RlZN8p/SAIoOYlcRtdB8uauXs8l8Pl5Q5P+gpWyuwBQJgLK0Ia3c5dhGE0yDKChxrHnFg+bHrjcIIZ2F/hw5wjDBIFkj8KtXtpOarGfBC5CFmGGE/sSaXzNnuZM6TQmo8wIzY6BFAltWByYyB8f5xsqYM9kWwM3ypP1cENz7sOksRplJLhmuhkTEmvgP4B9AXoFaFmXwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD0Xv1qmHDzxgj2uUGs0LhXpKSLrwigCy/pnTyiHqOE=;
 b=lDMa03sI9570/tH6RGZBnEju2X4ueMCMMLSKmQr15gWwlfqiNIEyLegopf7JccP2dnKCIG/gZAXFZZzNBzTz6eRP4zWifb4mcAumhWEgptrxgmS5VY7rAtRDYuvlufTpWhJezC4/O6agFQGsaNhB7MhkVwc+uclOrz9OrcRmKq7QHlcgHHfrzN8e0Uc85EGt06YzCf7PPTrtNTUOquZU/QJ+n2AgUiCPnTI9oxqr5tIUxZlAv/nBlPpFljkaA8UoqNhxtvAg2rIuJ7c4TlfFsh5mkiBdeWh2grE+ftncptEkYYAV1imZaWvG/ssWQAnls1HCP3OWfeUjd1JUqpCznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD0Xv1qmHDzxgj2uUGs0LhXpKSLrwigCy/pnTyiHqOE=;
 b=lpluTtVsDNNQ47upB/jE+vCeQc6uzA+Xv3VkbpyrAkaxhA5ocaYIXnXGYr4/dUw+8zfX4nMYci+8R7qd+PUu77UeWK9TRISKnoCzfDc0GVoKqmNpjOV0xF/jkcbR1OKy6NeXMVDrSVIr17j/ateVcFp+0WCbbfNzCxBqUaDkOQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:00 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:00 +0000
Date: Mon, 3 Nov 2025 08:26:58 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 05/18] libsoup: Convert to gnomebase
Message-ID: <cd8ced6e63d10ea161ac23d335052ba903902328.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0456.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c6de8f-eb6e-45dd-a258-08de1aaa608e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZGLcyCKhH8mq+tmhhKXqq8KY/x/nfqQR/6jn9EQO2tk0YeR/yJWQN56h0Cup?=
 =?us-ascii?Q?euCIocYZUPLjVXW5OjRHxQlf+5/1otTmtM1iuOoEYBBLSnQ9up924FquptnY?=
 =?us-ascii?Q?NWMicAXQtk3SLj8fLYc1n2vfe1IBMs+w7F2plLtrUdR+byl4+J+yPQNL/9GQ?=
 =?us-ascii?Q?Okz4NGznxX8QgcQUpL/a10BUnJlymQT8IdX9HcNa9088CK7ZcmNekOx8rEZg?=
 =?us-ascii?Q?oJzYQotoytp9RtCFHQDyRoTmyoiWDm53HlQ/Xq6UXzQcPX8Tg+wuFEeghQ77?=
 =?us-ascii?Q?9FBCcYaeItrwTWml2hewWolWWQ3usEZrBaMpWCIj2vsEVeTBNvyX/mb9D6gy?=
 =?us-ascii?Q?hUZ64w/sS3qfLm8J8fImw4rGE7DuJskjDyseGWxFbv9b3VVmmy0ga9TjtlQc?=
 =?us-ascii?Q?M9E0oTJM1eEbdrDivM/y2PrHwQmXPDRG3t1UDFQjrJzGX07lji/D6Ym8XU+I?=
 =?us-ascii?Q?m4/QGM1UT/qh9VXuYxtn4dyuLjCa/nuwoebsPOaJwQJVLkjcz2R7MNjAMrV/?=
 =?us-ascii?Q?+HwKvptDEdfzofjGp/DP4oMP7ajoUW99ZloezLZDVFdt02fdczPMlclPxwJe?=
 =?us-ascii?Q?4rPbr/bPJNhaMVJEqCROf3/rRsRE0LuKXME87nbAcHya7tEld8/8J/CCpk2d?=
 =?us-ascii?Q?9wHetXWqzQa0bvuVLe+RDlfDye7ChxHVWr4oG3briZHuq/LH4gmD0oSRs/3R?=
 =?us-ascii?Q?CCapGfjznpl16b4UVE4tYRwqd54Wle5xMs/IfYeKLhl+Nv0rQMicU+tE68Tg?=
 =?us-ascii?Q?J+aBxvu14UdAcYwP6RCmjbV5yhdQrSMjhw9tITtERGn4kOxLMQ6D3GsN1Wih?=
 =?us-ascii?Q?1TeTEkkp+VY3BRTD6EMWhTNSee2iVvW2PpLzCP4MOrdO9nDM4Xb3OovrQCMW?=
 =?us-ascii?Q?JrFG4Bg9wvjAdJGHpd2D8XH59koD3aRtRnUS9ItNZouoCJBQQwDdhGVr9NCD?=
 =?us-ascii?Q?C+qGkLhEa18GAg8YyMM1zZfmsrjXdHb0aZoagco/pBR4TEtYbJrbo2o/NvEW?=
 =?us-ascii?Q?qRX4wehPenjlG4Wf2q16ow+l2k3ZQu0zqkv5SYKlnqAp4qMt6a2Zb+VyF0lb?=
 =?us-ascii?Q?4jlWVcOJUgkMIRn/XoioLq55H9d4QBEZBxOSKg0QFluyZfyyp/ZIFeR6xFUw?=
 =?us-ascii?Q?z36B9fVvVckQpUKhZDDwP/6i0nmwC4Qad17t/tIkcXbliTHxogD5SwgZtru5?=
 =?us-ascii?Q?ERJ99E3zD+X2Ez/5Io21gp2f5rqVFFmBoHCn4A3mD/eXSUp4UhH5zTYSpdIo?=
 =?us-ascii?Q?7ZncGfJIiLk9mSCF8Sc7Punb8ONmF4DODyeY4tzDxntrYzCBEvaeW0LMVHH+?=
 =?us-ascii?Q?EbyJRUehZ48oDBbW3GnYCpnpJaTzRf/cLBgFiWD5amNo2FrHleAehCzMWfXU?=
 =?us-ascii?Q?UyaDiBJO0GGP8/zSavQ/xV5yftoX4xt9uAgdlrtPqPbJr1hrhctpoSr+5K4P?=
 =?us-ascii?Q?PCB8NxZBa9rINPa9zqc4jT4kR5foA9y5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+FKsahq/1pqwhBi7WY3mg5weOmZLEbfL+Msci8cgALfNLNVMkYiYJCsQLj00?=
 =?us-ascii?Q?gLVZLlLbbNPFdMeOn1QF2whw+IRU6k9XGHKtV5cpJ5Ek3vWvzylYpLYjrZsY?=
 =?us-ascii?Q?btTbKGDnHynPSX5Kmr4gFjCXnGXsaVHArWYizXdW+y3WOYHgW/z8yqIV8EYZ?=
 =?us-ascii?Q?sNNC7JOvAXD6I253XNJZ1H6a061fmnPFN2T4A1woVA5de9TkPJxsiYo5ULYK?=
 =?us-ascii?Q?qD65/p9bMv6oNV7RP+QrVbKJc3oYE10Lm+Ysoti31JZincy71MyxfeM+92Pv?=
 =?us-ascii?Q?AyBW4Qhx0c1XN7RtZr4jmzJ3UDhVxHE5VhGUoo+suN1I+FaMZuHyrP9Qs1Rd?=
 =?us-ascii?Q?WupGB8EF5BogNFRsu4qhMaCw1P8ZQdb3WV0tUG1+W6aEsaO4ItaIpi+o0CKI?=
 =?us-ascii?Q?SXpnhasOUdBktV4maUgRXxhxTkeDaMoPS/Tgf9blpK0yV0QHYOVABQinnbrS?=
 =?us-ascii?Q?24dLk+Yck8cBFpAvipK0EZNfwbvfD4sMtrCeOPwHdgDLau9PgBVu8jlC1RON?=
 =?us-ascii?Q?i43ePuTYcXRxi0j5QxfSZ4zjGQOmtVXINKqiBb9/VMTuueCT82x2JPnEDS0O?=
 =?us-ascii?Q?OM/FptwgCXF87jkBfBrMlH/3I7PzEW+zTPPk9beHTA3PQk3QBIo4NwkDee0Y?=
 =?us-ascii?Q?0UIB6dYQXR8Hz2dWc5/P4FDI4OUFqapphvraThWg2VHehmsUyWiP/cqWpWvr?=
 =?us-ascii?Q?fFgPM4dfi1w4fgcfISIZQnSzU4zTILqD+H064/Er7TE953L7L1wVr4PjrlUC?=
 =?us-ascii?Q?mDccW4dviKR3QjyZlBzxRQ1+vx7+fO177iUuYdcUu/7dc5PUvo0dFikJtik1?=
 =?us-ascii?Q?0xA+VNUqNEw4AX+ZcpUV6knu4rGlLHzLWbntHRLCa8SFD3oAWiYrlJN9iXQf?=
 =?us-ascii?Q?vEoQ9At1C3neJyjJiBgQi4GqshWdg4lMaHS+sWdfAfxm6RmXaPMPjhuBk5lp?=
 =?us-ascii?Q?eHbwjZj+saQbBO6o4V5W3Ju4RD0VBWI+3jKN4AxBFVD4OjcSG5sj2fBXRJBo?=
 =?us-ascii?Q?jXUqtTd8FuJUiqZR+yG5d4n49YtzTFRLZ9puUDEWpKOkkrtCyE1FCSc3SMF6?=
 =?us-ascii?Q?zpm9I0Ae52uuPeKQYnDDdSSedfvCehlu7c+abe8kmG1S07OFrQXf+Fzt5GUR?=
 =?us-ascii?Q?z/Y9ni1ZfZy69H9xn1y7VDZBCa3SExaREnt1YK/A08FjYUSVIUgS90oFbzYh?=
 =?us-ascii?Q?5+EyDedL0sPMqZDhHHsYfFhqKSM2xUKqcyU5ehDtHsfOIvhhCtnGkVeI1bd7?=
 =?us-ascii?Q?lEsfSBE3HevzWKcXdNcsjieY8Lk2Tzf0VRtLNtfY+seDrZZasGI1Ywy8Iphe?=
 =?us-ascii?Q?TyBlKc0tMceXRw35K51chu2ZdSNiO/gmsPdMoiWD2XFahVkQVp56NVsSpqLv?=
 =?us-ascii?Q?6D2WIw1dMdOyFbKk+2ExoLOjlJ2cgtS3tQhrHf7xdpCEwqDzdQ7PvUZW883x?=
 =?us-ascii?Q?8nDZg6mxbzLVgRAL0iJA3IVmsCkRJXuHY49Vsz/9fbve14ZyMa16FDAfB7nI?=
 =?us-ascii?Q?1kBIINbOiMyqnAlkpVeUftzZ3a4z0db7TlCi+pxPNNGPS7KZ0UCEjI6kaHyQ?=
 =?us-ascii?Q?QkJJut6ombXGP6h6JSNnSIQ+Z64mocbP/60xa3/jJJYzCwguKwXqyxSk+Cwd?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c6de8f-eb6e-45dd-a258-08de1aaa608e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:00.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E70gkLDq8wgFl69MUPGCKLYlvUmm2Rzi3WiisSO/PsJky8BMQoFq7PvtKgVbNAhCvfRPRDG3slpg39WtlXyir2yvT020QxQeNlEVXe/H4G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225596

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

* Dropping CVE_PRODUCT, because it was equal to the default.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-support/libsoup/libsoup_3.6.5.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-s=
upport/libsoup/libsoup_3.6.5.bb
index 29e45dfb97..a9f1e0d96a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -9,17 +9,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
=20
-SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.'=
)[1]}"
-
-SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460=
976fbdb7ada234"
+SRC_URI[archive.sha256sum] =3D "6891765aac3e949017945c3eaebd8cc8216df77245=
6dc9f460976fbdb7ada234"
=20
 PROVIDES =3D "libsoup-3.0"
-CVE_PRODUCT =3D "libsoup"
=20
-S =3D "${UNPACKDIR}/libsoup-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
-inherit meson gettext pkgconfig upstream-version-is-even gobject-introspec=
tion gi-docgen vala
+inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.51.0


