Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283A4CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:18 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15413.1762154827579534555
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=TWII5jiR;
 spf=pass (domain: navimatix.de, ip: 52.101.69.89, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQrdSuSaBQ3iyJe8RhSti50BVXJ3ZVVtOqbX0WxTomBfKpRVf5RGmkVOBj5NDs/i15nCYhYFTJ6fkYqWNc+Mfqv70tK0WHslJq8U5LBIS6LRH18y2EmJW0IiKIiM3KOTYCblCawi77yVx6eEV+3Vg+S3uyTD+7vmXeUUjjYCsNGT4t/8XVSiPcqTuGdG2QbQ3NYa8+mT0tx4lOLa1kPi6Ps5lIVSa2T/0CCKpltzYp09VyP7iHGF7VFox7PIgpCXgPWuP1fsCbBGWtllDYgq7MrYYFHCbyrVq3h1kqP136v3FfsBJeFe9vTvv0Dl8H167qCkpvG+78O0ukkur0g75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjS0TLFT3c03yRxnbQoFxAiXlsNKm7xeEdLgIBaCwew=;
 b=yxmRJRUcOIc1x2MmyKbdwjrlNDwcRHyp+Zng742uE+0dd2eu0DesSgC234FheY+jZDZPBacbSTZyfFCRsJs3dSq4Oql3q743Rw/DlOOhm/6x4FvYlDI+g/arIjLZVFyEqHGpTPf2t1rRH0q52NvZB2a6rZxHI2kIE+A5SKiscODtu7VbnZxd0/CIxJnQK/lr6Y9WwDEJBYpPPOK18MYU+S7p7NCTYD4DcrgsNPsON2bpYje/QPfU5A63DRA7qNQqXcMXI8wp1ULoP1ir2oPAsZvfQ2jtKMUE3tcqu3XG/nKaoiuwPCx9WoqlDXTwwKbVdoMbT6rCa+/V2f5XPntfLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjS0TLFT3c03yRxnbQoFxAiXlsNKm7xeEdLgIBaCwew=;
 b=TWII5jiR5NjywHG0AZxqloskeRTjP1Ab0mUaHz3quJ0qmsRGYeIvzXhquBoDxfxylzuqWZGY3EzGJnjbviQMBNFOhoJQPJqX5RI1+Nc3wKo6kRaf2W7uN25lN12/Fd7Z/GS93FCldRZCVvpi6Hpdq0pb9DEf96L+4Rzm0Y3SAeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:05 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:05 +0000
Date: Mon, 3 Nov 2025 08:27:04 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 08/18] gdk-pixbuf: Convert to gnomebase
Message-ID: <ac6b70e59ee5eed9cb4623487b02eafaee623b7f.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0453.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::26) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb3a53b-cf7e-4267-1441-08de1aaa63d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WNiMStIXPkDOsJ0H4ZBRSK5AKNg75Ad0BnGlJcxVotu4Z00/ZSaaOsH5o3VU?=
 =?us-ascii?Q?rRgDrztRMoRALpNco0N2CbMBZNOpWmywpcWj8+1Ku4toZdWeCKLgtRLIE8iN?=
 =?us-ascii?Q?+Axp5RDNhGGroR9NrtFTq87dh9s2ipHMgOnEQ8uG9oG6L9RIziCLm+1C6KI7?=
 =?us-ascii?Q?tAdsTYeoEb5mqo8gjtRzzoCo43RQJWUb0KVeJQxMc3NcLKUadDbMONobjOwg?=
 =?us-ascii?Q?xH8bllVwm9N5iGZTkroplpDZh+7Ru3tE08bvEM6NmQXU+rxHOFKu//snuDN1?=
 =?us-ascii?Q?xOb0gVTYL3qx19hVtwkU5NbIqr+6yTJMSNbaaujSnCuXrqi3l/varcsBhxRK?=
 =?us-ascii?Q?yB7WlQnHKey+J/7qqIMHf54DGYorw3v8kKZqtLbLPav82tuNheITvzWJBJTH?=
 =?us-ascii?Q?I09LLil972rM7/yYXUBcsySpdtOAduXyzrhLjw56S1Qq0bbmyNbVftIYdJtC?=
 =?us-ascii?Q?FV5/VWIa1emE2t2UmNIT+MCx8yr5HefZJDWlYhHUwVG6yT+eL8B3wYpdeOIe?=
 =?us-ascii?Q?LQQUHGvMrgnBur6yRc4XVSo+9CvmdmDYZnOUgePt9mV8g5laXey0D+3qbcC1?=
 =?us-ascii?Q?zCowOnQXTjEg17ZMMirSPHYW6jth4dsAi2XbIFsDOhrM/4zizRkPtEYoXXE1?=
 =?us-ascii?Q?Zlr2k+dyAZkjywV9+gKeSM7YNemLOLHaT/ecw7Ne1BHkqOP45r+9bAnP+BkX?=
 =?us-ascii?Q?2CnNeHaNDLL0QNJ/7yQVBaJ2ZPuqVmfQEYnKVRE2iQ4394aJ8E1xedPIkJx4?=
 =?us-ascii?Q?M+KvfDajbpUTpOQ6J+oGOb9MdK0dy/4Fl0gx20EF2bMHlXM4F3uIaPj1lpwg?=
 =?us-ascii?Q?0VU0JgsbaTMG+KHZwMmwUKEorRfsK/BNhhtSIXmpMsVAVFPyE8Lv4qgX27kG?=
 =?us-ascii?Q?HMeg6U5d+cSfxfF+nN0ktgNSdmTAj9ePLE0ELoX1zsyILg3LKgIthp7HdhWX?=
 =?us-ascii?Q?QO6PrrigOZH9Xji9kNaxugZGHvJe0n7KF2hLGumQVfGe51cayAFmEC2gTuZZ?=
 =?us-ascii?Q?WcK26zg192e/RSl5MGZYujyFPNRemT0I4KxKqaFug7K6c/wc3no+BIrSNNUi?=
 =?us-ascii?Q?eWxmiQpPr/HH8J8zRHUtho2hYczvql6O1/1R6ilkg6Kf2ltIdwO6bvxg5/xh?=
 =?us-ascii?Q?fPm0cHaRhMQiFDrgB/aGMJLmnS5ZISyu7sZbLGx590wvd0a9p/eY0h2GlQSN?=
 =?us-ascii?Q?2P+IA+h1jZz+mohHm+DjKiKVUueB9mUn79LNxOIhcN6Qu63uo1XSM0zuUO3K?=
 =?us-ascii?Q?JhHRSZyiSxfKzH/fCbDqM2mROSIQlpObHw3mvw80GT1kF6iBNHvlKjZ5Jxru?=
 =?us-ascii?Q?b2m81VpYYDwi+S1aLCnlU9fza6gCIs3uI06RWlLYtNNOj/F1LS8Xxo9uOs8l?=
 =?us-ascii?Q?SkO4KxOZnYGspG6SNq0iwqTVRdGNTgAP0Pb+gcs/XYUNsr8WxjOvzrros/j/?=
 =?us-ascii?Q?cJ4hAoaePkzBbgtYqR+wBz6DQtXWMA7z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XtWYM0bhOq9Cg0o866rqMZtn8BupKeJV23HpQiq0Lh7LJkDlkCEipYLK6oBF?=
 =?us-ascii?Q?1WuDOvWMDSlcTdDL4FX1GhvyjFKmvF9OFPEcxmQpc7EoKARJ9TmCbllnUyep?=
 =?us-ascii?Q?9E+3IaAz3qgrtgF0CpqmgRqL+rP7nDB7eDprUjBapuXU5fnYdmcsS5vfQNPB?=
 =?us-ascii?Q?1IWSmNWfcM6IfC/ikWZG9z+VxJ5a318ZMiJoTzZD73Rtf0+5qqVvd40UxegW?=
 =?us-ascii?Q?6/CMTPyElQuwt7LMD0/nCMYXrQsmsj3HYi1wDDgElyk2YXKcBvLLh7MwnGHg?=
 =?us-ascii?Q?/NjUbmQv99b8/SVG2gMEm0XyOY4G5LYXvKgtYeYpN6VVGGsHPEY5NpcmsKZi?=
 =?us-ascii?Q?TW+uoXmS4jLIswMVunDsf1DgkndOTesX/SPS4N8hll16sxXNR5zH5e/fheLM?=
 =?us-ascii?Q?rMCRUTDPfpfQqXmv8GRDIl5T93gGTnn7ikGK/qd2v3oTuvS1XGHACncKjv7C?=
 =?us-ascii?Q?/PjN7Mr947vyT/vS7pcQTo06H4wrx2R4jvoxBEzY/htxed3nWlObC7kaeKQj?=
 =?us-ascii?Q?QfTH9B4FfqrvQ47TrauJAstH6SyAe4/dmVQcgjeg5xKnKyup6fYJyHnG+fFT?=
 =?us-ascii?Q?REoBgII8HNwRpJqvQ9mCXwZyzYqleUA2pqJzZgU9FjqEm5Cyb2VBdDkIPAkp?=
 =?us-ascii?Q?yOoruY1H2NaSCsxQUIj69z/JxQOoqa9v2TNjXwUFNsPWrNjJNizIobyJNaee?=
 =?us-ascii?Q?NqJY2xCp4gC0kicUe+L5NdX20u5zjmW/u5kilqdszQd9ww8V7v2S2wYCvxxk?=
 =?us-ascii?Q?ZliuErXdolYYzpIb3Hv5PTAyeoDCXhy/QfsZdvov/6jiuR5nyZ4WVXyZmgaE?=
 =?us-ascii?Q?HzFBPG3yiu5X2ih3Hun3M5Tf87e/jGs1ITdmxR9QF7cU1hGIrf8/eBAVJZ4C?=
 =?us-ascii?Q?xSevgeGbiBpswNnMVEWHohjjQX9xTwAhkTIPRfOc0SNzPV2wU5fBdSLZTCI0?=
 =?us-ascii?Q?lA+MkdSL3KcJzqhYSFTwmMM4t4NYFg8/ydAq/2CiEZuZzEf25+o0XhIwZLP5?=
 =?us-ascii?Q?cVgKqUloJfgZfmkPjM0riA4nZABGXZI//vL2LmLNd0eFVHmriMIqxfhwxnct?=
 =?us-ascii?Q?J8YT+lfi1Xd9WIfa12ziA6ggo3iKBmXeOBx08XjeOhfN9rfarY7choVGl6k2?=
 =?us-ascii?Q?YisPlDtgAajDw6SK/MWrCzqwGnAYsB7Ht3ta0Gy4QMKY6OwYLjzLrmdF1t09?=
 =?us-ascii?Q?ZyUSPnsnIe95LgHONV57ZmlxA6uhwEQZeABaeZFQ+ngwcXMGcBDygVxUMaWp?=
 =?us-ascii?Q?wqyXljFgAzlVOnGZnvSQeiccjZUzC7jgJgzk+O3Hd3ItKrpyzrTJsd38w46C?=
 =?us-ascii?Q?Kt/gV5J2va5Fp5UR60KhV6bBamu3tSyVuk/GfvWzqsbMZzRYqBAlWemrUFqg?=
 =?us-ascii?Q?ioouFiiAKOnWUhWberYxL5xllrKUgWWZ4W+JD9Fh0tzC4WaY5/tjbZX5rpj0?=
 =?us-ascii?Q?ZcwVvzRI+89HGdVkT8khVJP2KfE8RTq8heJ/W0mI3UxfOLNI8Sw7WdCkvfIf?=
 =?us-ascii?Q?X9mZWe6W3pNlKcpmP118V6hdy2NRU5Rsz1OYSZReiWXPFgmOoiT1CJzirgdk?=
 =?us-ascii?Q?pirneWws50ABbFW5wrDD5h1DWpffUMs3yJPwlEYKUdtIh9N0u59bFlICOjHk?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb3a53b-cf7e-4267-1441-08de1aaa63d6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:05.6438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsRCnJe80wsjmY4EvNFhK5MQCQWrnvgUtK6vwwXF4DFY8W9lTW3IzW33BceBwGCvOcviw0D8t/Fn7abhIFgSaZuQtOJQb/g4OA8cjWuptHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225599

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/rec=
ipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index a468cea74b..98993cc07d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -14,18 +14,16 @@ SECTION =3D "libs"
=20
 DEPENDS =3D "glib-2.0 shared-mime-info"
=20
-MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI[archive.sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3ac9=
4c95a148cb669ab748e3c7"
=20
-SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even=
 gobject-introspection gi-docgen lib_package
+
+SRC_URI +=3D "\
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compil=
e.patch \
            "
=20
-SRC_URI[sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148=
cb669ab748e3c7"
-
-inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-i=
s-even gobject-introspection gi-docgen lib_package
-
 GIR_MESON_OPTION =3D 'introspection'
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
--=20
2.51.0


