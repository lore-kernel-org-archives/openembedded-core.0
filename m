Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E054CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15246.1762154815247262870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=IWAkEDeT;
 spf=pass (domain: navimatix.de, ip: 52.101.69.126, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVe3oIZs4QzCeGjhiHLNxvTH9AI9E0c3IxRZH3rz9QVgsJjZOKL7S1My6XiXEtHLdtiPW+ayMDoESJS0QEWlbVqSzqVO28vtbSBaS4r7upZkWRO5OpS5ZwXrsIf0BFXf+DER5MsGT30GQX7lafNRd8udy69YyoZrvW6m0GIVH6as6H7xYsfNycICwB5k70nzjSfDcHoXfvVdrJwHo+tZSa3mbhe+I3fYKMLNaXwsTiGpLfIkyo6lGmUTgVTVR6L3g1Q+GCuUnyfUzu1JhksKjTlmrnwQ3jg/r13kfOVOH/lNednyf4q2QtcYTZnx8OX2LR3A1LejPfJeVfS+3jtK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLZ2KpWmAN4D+B2S9x5XXjUxvKwLIlVXzH1X0XhDMeg=;
 b=oNVFyaQ9X+KhjJqOwVnNvNvhNlzDil8txXD2Ko4zRTqG4AHgmcPNTJ/BVk3jpUnbFhnmmwCFsxvYjZAT8m8PcdrN/SGp4ig5fI/oi9z5TT4oQgyHmJZhOnDunhArUjUI+WOhGAg/1g7vZajKVptqp86Hw60Gh2qwC7lG3cGYVJ0hpJhJoR6BlpY1JFWfSaTS2FgYeiY4tcWxRqhd+m5f9uUxdwc5gMb8oo2rtyjwfek24kjBrKAqQY2pR1Dz4DsgPJJH/nCwG2vwkvahLy8g/sWBa6bBHGIooogKLI93De71FX6XvPgpUaMsApQdtP8dPtEv0Kp2VY/tpUpnuBc/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLZ2KpWmAN4D+B2S9x5XXjUxvKwLIlVXzH1X0XhDMeg=;
 b=IWAkEDeT+da8MoRDyWY3t9qGIlga2VzjHwzkRtWnDHOuZJoJYIB5LwA7vEGqKj3o81CA8vF5QhJPwth2H8ZimVfmW6jKUmb1L7jbch1fkkkwWYK6macLlrtHyeAW6/KhAkfSTVfm53vMZszDCSTXqFR5EDnCM0kiszqEwzOB4kE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:26:54 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:26:54 +0000
Date: Mon, 3 Nov 2025 08:26:53 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 02/18] vala: Convert to gnomebase
Message-ID: <d92cac1aa71e8d049a33deae9e349dd21a95cc72.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0307.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2a6117-55af-408b-6982-08de1aaa5d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B4f9JWdcg5OXWwWk3dhRsZ8+Vad+k869NtSA8HgHh26GbK2mdTC1oDRmD4dU?=
 =?us-ascii?Q?MEu3TfxTcLtBKTP4a9C7AwljIu4jdXCKCxQeIKK2JSVgokSasPs6ZEEOgTSU?=
 =?us-ascii?Q?eIxgntSXtUojBmTrqxmjtzbUeE64bNde6S6Efu76h2eVFwjBXCTrGy39GRMk?=
 =?us-ascii?Q?jJnjZRCcCMqmbb093U+Azr390KwlWOz0F74ZQygfA7htHTjEwgfq3QKJD8io?=
 =?us-ascii?Q?Yzdkl04ySDBeJ67atNGqHP/FdACSbLe+y4wQzS4MxgdaUOrEXK/xVaOTnIwg?=
 =?us-ascii?Q?sd3Q7R/9Px2mE4yb9WBhARatW9FzbsdAlWHCAqTFlH/YhGR9UFVAorbqWDF9?=
 =?us-ascii?Q?Fffg37L8hs46EX8PVnznekTGUNy9Z3omzxuHW+5mXLtcyUUOnRkTuFQEpjVY?=
 =?us-ascii?Q?/Fsa7vVm9KH2/uDSHWzJ9GUqOUZy7VWAtZKAyur4idv40nZh1hY3d7XKVUh1?=
 =?us-ascii?Q?csUORH7NGVkYlSxkoi1ShyWHkTaSw93byzrvBxVWiAew1t0xmnrEoRaZabSJ?=
 =?us-ascii?Q?v62X/KiWYWLhkD9E4QzP1RMi0D2bfI02YUGteidKdscYGeyWPEklv0T0SsKT?=
 =?us-ascii?Q?a/7q394oLHKHWatcRpbYbQGHZkfvaybNBvVszrJ1xafU3FlPgugf746FW2Ye?=
 =?us-ascii?Q?Uq0hmXuWTO3WEqVinCA+9oXIV0nuHgdgI4bb0dJXsFxS48H2A8NDkJfzHUCL?=
 =?us-ascii?Q?8dRito1DAPpgCDB8roGm0PZtYP7sXa03tqntGNSaDaSmhCBWj6WoTiR4msRz?=
 =?us-ascii?Q?pPw/yu+eGvYIVwW2QhRQJmKPsaAgEwpolT0QYgl1bVFDwB1Bq4+rINb/a+V8?=
 =?us-ascii?Q?o8wpFC7RlgA61ZujmVEGkxZDOgVntrP635Fl1vo+qv4/QSIig0gl7616TLo7?=
 =?us-ascii?Q?nKQlLE6OuvXHtRGAYAVh6CfYWBudalMWA57vL1vUlb44cF+Jvhrb36/kJ+No?=
 =?us-ascii?Q?fo6Kl3raUKzaZSr+59cE7jRKScI8ixb8JxNVHsYFVoR4k7KRDGysQ3vDO0z1?=
 =?us-ascii?Q?3ux0nFObBp340tcrkRSaCzH7Q1m/ZtNAoY7oFhlKAKRd38epWhLa+i9PADIs?=
 =?us-ascii?Q?Gj2A02gmV4UpPpraoZERAZ7kaRV/v26DeLwM2u34TrSvaYpfXeACVvGVrYpY?=
 =?us-ascii?Q?IzBGMEerOim9/0SDMHp78VeVvgucTIZe+44vO6fXhumWtqYG4CaH0xmuy/WW?=
 =?us-ascii?Q?UncpbAA9pXMJ8JLFHY4CmfWCuf0OQGSNpIjM6OcX01Uun1akloXACedAfVJs?=
 =?us-ascii?Q?tCoJtiO2DU/fEkij6o9xuDMOjB9kPacwXQHshCRsXTbx0s1ZJ0rvMdpfruWN?=
 =?us-ascii?Q?/oRaRXLQRDqa4DumrqAOCTaxGbdpQnAgNAnHTxIAw1syJ30GKkmZdiO6VmYd?=
 =?us-ascii?Q?Ha2bwmQej66t6FVwFF8yLXwChqcqhcR9vxHm05LRjN4ew7A6jX558sn/O5Rh?=
 =?us-ascii?Q?fUYZpjSIlP8sWQqsQbMMXhK4bx0AnlJ5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?shV6p3yJ4kW1HKZ1QFIMlvfFOcZHNE4/tR9oNdTMcAQVqp3t2W6Ubswbz5Vc?=
 =?us-ascii?Q?ZQc09nx+D1LCp0+QBeXaUzXE145AmVrMRtQQZdlo5dD1SVC8ZYuS+KKAuQkh?=
 =?us-ascii?Q?NXC2lZBLEMvvWQhLGoUkHUP6QJTP69xyLwfBq7TQEGsKNvO/hSBewR72+qN0?=
 =?us-ascii?Q?FaV5PFG2l3T/F7amPxvOpb7RIrPI2h+M84dvnlkPspa4xxnHWXC7UZ0vGiGA?=
 =?us-ascii?Q?WhF2T4F5xPy8TOiwrgyqf+fisbdWwniLn8iHDycrOJ+TirvwxvvOs9gP4bBy?=
 =?us-ascii?Q?0yYSZUlwrXnXwF3fPVx4yL3o+9n8diHRs3BSilnd1/4QuJJZreHrythCxaqs?=
 =?us-ascii?Q?/n4QWB0R8BGKmMuSqHqNYuN1MxKbcpVnVaJvshWK4Klrg9KvTnuTuRXzxeXM?=
 =?us-ascii?Q?MvmLAjM3T2YPD/pxSEshEhpYjJ7iWQCsaGfoGOIBkAAUbio8jICD0ombJ14V?=
 =?us-ascii?Q?bWX4MbbauceRFf7yE01hBNuJmN06Su5Qnc2GQfrvmnr1zBN+1Rd1SK5m7ERo?=
 =?us-ascii?Q?KMVLTvi/zRiz6TIZwoIVgM9yD4wzBCB11wxJW/r2X3ZX0OToAKFCWwPh3EME?=
 =?us-ascii?Q?RCWa9QwfOF7G9KPqb1zfoT5TSvCGDr3vj3dx6EPPbEcLTIxbODJMGQJ3WEgl?=
 =?us-ascii?Q?5RKjVDqZA4g9xPu1ETzb4WeyBkWVstwJL+ivISh4sq9Oe/JJmZmQ8aCXcQ7X?=
 =?us-ascii?Q?w/aNkohJUcCgBExA0FZiasBflBAPF5z/Jh0axEa0aFvVqloiWXTGNNtKUh8E?=
 =?us-ascii?Q?dMxd2zG1XO8D/9+WpQwzVG2H3WhIgygqrZagMPf9A2cfZzKlWlFRJen0538b?=
 =?us-ascii?Q?EFN9QH12Yim7Y3dUHxRN573LwOmaotnUBRDGiCaYE6v9wmms4XRXefDBqeD9?=
 =?us-ascii?Q?dolcxNzcjR6cqDWjdq9N+41ZNg2n6uIHBED1e/Dw4oFA3Yi19EMBypoWwWVn?=
 =?us-ascii?Q?OtL+aD+++k3XZSG0CIej6dx32lbP6kbvnOqvGQX2m5uNiSMLQB2FUPNk9PcT?=
 =?us-ascii?Q?kMyJZpfjY7vsIQP09gU0NVSrqyHn6xu0RejCYVnblUmFqouKrurYjeGHD1WS?=
 =?us-ascii?Q?Fdi8UwoyrNXfb9reoSTe5DREsdHHe9DIQpWym+PnzBA+MHb9/8uNSUvOGsL2?=
 =?us-ascii?Q?0koHK5XPEHBxKVc70IoY9ixOlXL6SMq8F4kWsxtVWJrBPnFDEzirxa0XrME5?=
 =?us-ascii?Q?nmniUPg/5G5pQCAwOD1ihRU2DbsNcCjNv03t76VFL2e2fGZkGMRM8vKIeJ7I?=
 =?us-ascii?Q?kyk//JoZXY5RA1C5DvpAcccoxFKCemMA2L2CKIvU4b/fRe28I979u2y39fdL?=
 =?us-ascii?Q?ymqwvE7nIQZqhEWDkELqa5qkhVPDrHYkac/x77PCL2V1wVKhzaXkQoEsMYG6?=
 =?us-ascii?Q?SQ4GwI75mp4Tpm3Y+j0SZoiuGZ7dbboK27GT3by2AgfHO/y9HxK4BKe0Jz6w?=
 =?us-ascii?Q?dQe0YjCu/D0jRHZlbvrzL8UxwPg+jXjlrIrfcCrulM7Cx9N6wsk5wQ7+83rU?=
 =?us-ascii?Q?jXUjcxtPqMzYf6ko7cF0lDXr5V0cmtgJtvcbxwQOJwXMUerCXcxII4iO2pnf?=
 =?us-ascii?Q?Ua5CNOSoT73ENfsXBIGBVe+mccenkvUxS4JMmOlixSnBBOq/VDs0ioTxlAk2?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2a6117-55af-408b-6982-08de1aaa5d32
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:26:54.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CeIrpppRzwgAuZlZGUlPvj7PoBOU8ptYR3jmPNnzCTUWNmb8tGX7rHk0W8t5jRIXbDYlEzMjybB9QCQUzjbOGuCtfLk7eISPrM1K1YkPHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225593

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-devtools/vala/vala_0.56.18.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala_0.56.18.bb b/meta/recipes-devt=
ools/vala/vala_0.56.18.bb
index 32105a3c23..16e5d2b7c8 100644
--- a/meta/recipes-devtools/vala/vala_0.56.18.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.18.bb
@@ -16,15 +16,15 @@ BBCLASSEXTEND =3D "native"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c2=
4"
=20
-SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.'=
)[1]}"
+GNOMEBASEBUILDCLASS =3D "autotools"
=20
-SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${B=
P}.tar.xz"
-SRC_URI[sha256sum] =3D "f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c84ff2d79=
5f482fe926a382"
+inherit gnomebase upstream-version-is-even
=20
-inherit autotools pkgconfig upstream-version-is-even
+SRC_URI[archive.sha256sum] =3D "f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c=
84ff2d795f482fe926a382"
+
+SHRT_VER =3D "${@gnome_verdir("${PV}")}"
=20
 FILES:${PN} +=3D "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SH=
RT_VER}/"
-FILES:${PN}-doc +=3D "${datadir}/devhelp"
=20
 # .gir files from gobject-introspection are installed to ${libdir} when mu=
ltilib is enabled
 GIRDIR_OPT =3D "${@'--girdir=3D${STAGING_LIBDIR}/gir-1.0' if d.getVar('MUL=
TILIBS') else ''}"
--=20
2.51.0


