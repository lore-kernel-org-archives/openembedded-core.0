Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE58CCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.108])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16040.1762158119656846786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=khA6uf5/;
 spf=pass (domain: navimatix.de, ip: 40.107.130.108, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGqF6i4ppc+wASMKq+5njCPfWCiAZfx6+BcAjDkTgBDepHMkpqhRRP8e06OWd1MpkGmFdacTOOzf80KlmlFD7ctcye4OdUxy+jeey9WGG6ihpCgu4tUF4LaPZx3+i/fzppU3e2AN3PTKKqwc32fRFnI+d0lki9LoLc4/r0RKsy6kfOYb9F0yaeZDYLJ+WQh1uasMhI+ZPV9oAvphcuKJUioP2Olfwl0zUyZzTlzauBlAIRUuvjaKEJ9p5MYvrwBnYnnHWaECpNpQNqLbnTKuWKn83HurV6Sj5AKvXf9RYaxmNprnVdONlmBmKDyMdgHdLLhdH24n5edFaMFlcdTG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgXxk+drCuaKWC/VLe//f5YN2WLQARfCPzxDQW7CDL0=;
 b=NC5dfWlk8wpJlkE8jknUQU5+wdRohOw9mGAPyGqda51NVW13KzTIBth43vao3JeZ71qFH0bNZ99avH3/L0e24HiXpNOOeJ2vyejkBHJquxBg3iHG4f0XGVPbjCCltMoBAzPQMs/RCjRPD/t42VC37VN5L1fnjRm+966MjEreBNHzu1dy+wUrMHYguJGCnf9hu737GRYsut6lBRcunCnNkynY5us1zo715/FoYEIkzUPVh2i+B271sH38yr8wNKLgNzZ1em5of9rpqMrRDl5izP9HDprH2KJQ9zdGmqGW9l5l3vnkMQtu89TVF/YrD4q6JTdJ4B+OhDzen8wnq8ew4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgXxk+drCuaKWC/VLe//f5YN2WLQARfCPzxDQW7CDL0=;
 b=khA6uf5/P6YU1aLvVg6+E/Ih75/l1SXZYta6J5ipAUY63/GnLIBs0qPR10e62eluKWRKmRS7Uq1VDW2xfloCWTZdGvg1VSB8MPlQuF1DBnuIuqpEbST4WG+EJybGToIMLVObVX+e9PG/YYwVFuOCf/MANz1It847fVR1n6+nQW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:21:58 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:58 +0000
Date: Mon, 3 Nov 2025 09:21:57 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	robert.joslyn@redrectangle.org, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Robert Joslyn <robert.joslyn@redrectangle.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 09/19] gtk: Set CVE_PRODUCT
Message-ID: <b36a08c45c1302dd10cf7e2174e9289399c66639.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0311.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::12) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 546a0ba5-5ade-4040-1eb5-08de1ab20e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?quaPFJlFiqz7R+YyWB3fMit05f9TDnnzt0T8L7I5z67ryB3wqtfb7o+QZCgz?=
 =?us-ascii?Q?NkGFYh4eFU0o7iBSQaBBGN+ZY+nSOJ2UtmJCVH6Eqf6sQd793Yyqk+V1q/ff?=
 =?us-ascii?Q?iBxf3e/gmInZrvQRJMsedMMGWdoiiyDB94RRTGyRw0J5ouaVPhhyx99QEC6R?=
 =?us-ascii?Q?k6viCo/J5jihWjVqGcjEpvLKcQ6H4OSzqprvTz7m5bWwdzSo3h+HhzycxmCY?=
 =?us-ascii?Q?cPvTrT0sZz2JNNjKr/lvdXvhtuh8/gT05CItmIPRRyI9roCvpxIhXH7fJtdJ?=
 =?us-ascii?Q?VFGwTrQbkqXLsj65Z+QCU7ZcUmoj3MKGuYnAlKTiNCtCDjk2BN4Sh1xQxHi5?=
 =?us-ascii?Q?JCmsdpCx/SncYhSELVYjhcZF6N3p3RfNc7Dts/d2Du0Ebwtxw305VZvQMwg8?=
 =?us-ascii?Q?XtiRX/UuMseFsQSE+QD3t7BB9H5kbkk+Vz0o0BEoSQh8ZMHgnoVRozpEZ6hZ?=
 =?us-ascii?Q?LV8dmKedJSH+jkqPwTZXhhDeemwAPzwoolzV7m+1u6UVG98o2QlyVqHJr/gk?=
 =?us-ascii?Q?qBAgWexiz6zja17ZZ4tY2F5BGL9o1THk3Q9cnlkOsgaUhMIZ7XjlJMQU/acB?=
 =?us-ascii?Q?EjoAL9odCbWkBvXrV/8w8/GffCFOfVAm5djnfJv8WqhFH//3OIRMrgY70sLl?=
 =?us-ascii?Q?4CP0cK+NwpKqdmLz+yTJ3gPtGxIv+v2mZUKRXdE7Wi6P2ruYNpIJjHmeQ2+c?=
 =?us-ascii?Q?1AH2hHihSjLQ9vUOj5dHIT7/IIVHSEFMdn52B/MqT19683xHFPn05TxzcJij?=
 =?us-ascii?Q?xT7IgiMg2HjxyRM0ITV8i02bu2+H9W1gNo7wr7GCmymkHpf512xnbC4bQ3TZ?=
 =?us-ascii?Q?hDM20+Abvg8unSdyYTusYVWDS6tmgOdV34Y8vN3MS6WEs8JTMRFzrcWyd95m?=
 =?us-ascii?Q?EWve4KR/HjoIS2Gl0vKK7r0m3yMnivm2DVTtpO4nqGIDa46V1PHcLB5wNxhX?=
 =?us-ascii?Q?MHA2Nhd/9UkDkgybUx7BDvT2KdqKX17hZRB3M2A8muc+/r1FLGtEc1zJbB7h?=
 =?us-ascii?Q?1M80p+lEC/XRLTA/YOHRJ7Kf12JclT2qKEIoLYkeARhBxS4VrF2dEL4S6lxd?=
 =?us-ascii?Q?cz4HjEiXK9XSiDTEsSdev0wNYuwCOdoaTRR3K+SCko+340GSvOrowfZmbICp?=
 =?us-ascii?Q?v2cLhTkd/NftdBDn9XFDeiYHVrBxr8fhOGRHKo5UWglFVyOd4L0d25d6+eOP?=
 =?us-ascii?Q?xNHB3zw4MXMMP8LN+utC3ckYjz7OiYZYbCIe/0KSJrAa0o6eegprkX9PGOev?=
 =?us-ascii?Q?l7tt6+PvPQeESsCu617724iU+CC73XuS0GeXOQh0zdRJHMAYh+KlXw44e6Tk?=
 =?us-ascii?Q?2oZ3ZrpEDxsxEyg92CcfOXgOf6wKYY3ImI+G/TktZ6xsBUi4I+I6C/B+0i3T?=
 =?us-ascii?Q?FlINlrYf9PIFvkEdll/MIAgL4WiOwBH8P8qbxeExRL3z4viezgSZ94wJrnE8?=
 =?us-ascii?Q?0XAkPLHnbDWpoE62kZLu9CMvY3nqfAow?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/GA6yoWoNeedXrHJTQM97rQyeDU2MxykS4Uqd0lJomd7pDXPsd2ujNIW19VS?=
 =?us-ascii?Q?PChBxETnYxG2JnMpOR3HshjvPIHIZEr1OMMZB3KKPv+jKb47OSnzROP9fQNb?=
 =?us-ascii?Q?XkXxmLwyoD8Q5vJ+x+0IBrJQQiZ7ekhND4hfHiNPZ7KSa04vaJ/D4qC/A8iB?=
 =?us-ascii?Q?rjUPQMgirgOx4XQQRIW+gFLRgCw7T7GnK1m7ajBkPNPmh5fxwnII59K97Rx8?=
 =?us-ascii?Q?wthcX/L51FTishtg8M/y2fn8k601Ko1NecdLx6UvqXbUiMWLYDuNxSTRAMmz?=
 =?us-ascii?Q?+JLdQWXluE0+0lruaYKHPXBJT2ebdONeTeZzR8GYPtYvZ2Ca7HLn3/IBj8pi?=
 =?us-ascii?Q?vyAicdTLmux5diRAjx8Nnu5Sd6Py6PlhWfXx6sNylij2dLL6WE4aX2LHReUD?=
 =?us-ascii?Q?rbpmRS1+SzDAkP6QLmA6eD40yUpST9Mz7q9AUDMeg4u8BcByIuZ8s0VGO5zm?=
 =?us-ascii?Q?kOU2DA4j5bZl1/2kT8Fa/+QQcZC+M9CV6NhnFKIufJEFG84B+bMtJa4d6sx9?=
 =?us-ascii?Q?f+Yicgl7s8Wm6XOVYZrd5mEAjivDLqWv096Wj1RG0yGjQtXIlMYbm78enmQZ?=
 =?us-ascii?Q?fL8ttOt3uhgT57QtYTJ2mEkjy+zjeovHWQz4OpilVZSjQ+bf2mBahWDFjw60?=
 =?us-ascii?Q?ttub/sony/61Emp/fcZTwnzmEdXjAyzYsKpijgAOj5by19+wZ2Pp8Zdg9OPb?=
 =?us-ascii?Q?0phNPMzA6ewAb90uuStM5v6nCIBu/MuOxogb4QYGQWPkbeGxk/n2W6ZrosG/?=
 =?us-ascii?Q?0qYgRz2q+jLsqwMS7jtkh9Sg4iJfi3auz7KhjCu6M/b7Ru2fIXqjYWHTZT+e?=
 =?us-ascii?Q?anvy1tnUq1BIO5KZ5t45DDNEahmdf0MJp992WO8wNt+MQU/+D3HaBiSaceah?=
 =?us-ascii?Q?CYYZJ0uAE6QXv95nQhe1l/nNZhW1gpQBVKq6V1vLdEL44/X29gDMM9SICBW+?=
 =?us-ascii?Q?hFPbA54fX8QGLQsYlUzSE2PkFA6ZGBLffYqeP3ZUquN2TQkZJxfwuHaOX7Tv?=
 =?us-ascii?Q?AE6TZTu2SFUxU9qwsCDTlXpfFUMUTbK905i0tQaD0ZhAaLipRhCqgcsHj3qU?=
 =?us-ascii?Q?UA8JhhjZVqCbIscDZcoz/b9hcBJPVSvtKSE8JM6dlC82PDrVOFMFXVtDoLL7?=
 =?us-ascii?Q?Zl77J/ZCrsS3r2KtGrurOK2EnauDBMULrh0rNwj4BDMxxRT+qGvMVA3NNXkS?=
 =?us-ascii?Q?jXcmBQEnB53TN/+EsG1l9aqnh4IpjMp9XbJ0UNA/b1szmf7tQEYhV8yWk5v0?=
 =?us-ascii?Q?IOAEqCClEzlvOkhwSZw/jeQTbWwUZQe+lwuWm5EmonYnJDa+98G7CfBjaOc2?=
 =?us-ascii?Q?h6/W4hhjem8mbpWaPpK9fsDyciu0oxcqoEUWo2GoFvcgzSiVlNwTPA6N+/qS?=
 =?us-ascii?Q?TLzSaY3yI9kMoqouAyTZKFU8U89/kjRGVEp8PNnOU2oU2YPQYa3MRnNGeDNn?=
 =?us-ascii?Q?Zrk5tEsvLqqdWZ6JJtK9gI1uxJW50zLBWqMFGqnqqpIm8z83IHdcmGlUHOjQ?=
 =?us-ascii?Q?pY5AR6lZRdibQbTSowo8r0ea2p4vEyBHjyunaLRQ/vaByrGm0BSkFlqyAzYX?=
 =?us-ascii?Q?IP9AWYPVKvSPGUWrb7kmtiL/FyZEdo3V2aMh2uUNP7atlwew//nthv+U09Rc?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 546a0ba5-5ade-4040-1eb5-08de1ab20e6b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:58.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8asXXE3CalhBXpcEexgzVjZxZmYOt6FHacPh5SwGSzzGXxKdkrhS0dfUjCmqsjsh+zGDbCfhYMoWb0wkt3JJ2zpgmT9G/D8bEjebajeP3wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225623

From: Robert Joslyn <robert.joslyn@redrectangle.org>

The CPE vendor is "gnome" and the CPE product is "gtk" for both gtk+3
and gtk4 recipes. Set CVE_PRODUCT so we properly match the NVD database.

(From OE-Core rev: 253f5f745d66acefcc739f1c9ad2dd46be630e47)

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 17a2c6e38d306de3367478e3e24fe2d5c1f4c13b
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.38.bb
index 7337591fa5..3bcb9793ba 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
@@ -14,3 +14,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287=
a271dce88af737 \
                     file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d=
3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=3D25;md5=3Dcb732daee1d8=
2af7a2bf953cf3cf26f1"
+
+CVE_PRODUCT =3D "gnome:gtk"
--=20
2.51.0


