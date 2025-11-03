Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2F6CCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16039.1762158108538159684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=0xxeui5+;
 spf=pass (domain: navimatix.de, ip: 52.101.84.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NN7hjHoHCvJW7vR+ay8zgrpwu4oSRlGG/cTxzhswZAbCi9Kpcm7QtG6lHrJMBPCYLgYvDOWp3l9ZYgAZHOTdh2dXpUpYaXmLWOZf5c3ZTPSATYmMBK3y+esatAF7sgg+LHuxy0fEOfCjFZi4kIvvtXYP/djyPjQRc36wYwRvityJFhbYQvKqGEvkKsHK53+1OYHZyggzW4qLSnUkbUqcGYDNpG6XwjlCKcig/QAn0D03dTaLNQEVNXzoy71N1T+nijlHh9DdgCvIELehoKIfRl4bAIU2piaz3kryBF1yvNXaPYcjN8fJKAcxxnIob7BcdgfDKb7Qt3S2fH62ypPWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwRUv/4sdGlK9871pehYiEsbor2uLHGx5T3gIQS/wAc=;
 b=jyeMmKYgLP+r2md7I9I5tshAHTiAifA/YbXAK9mZ9WZbbWd9ay4AoBjHYOMRP82wfcEpZlGDTVu3bA0xPj3lrZOudvJdZIRvV0PVHyOjOtRJ4N30tjHsm7uUuXl1ipur1MEwcTrBr5Xgi8KEAgnRiYqH/cH6dAUU21G3DgM20msR60k5bNre1zteHMRa5sLrAandS8FJYQDyJOonVQuP3Q3exgGiG8oocODidEvA9bPyBnMsKQsTjUQR3CbeSvLBO0AGgMmgQulEz3GyMU9nk9uX79E9JUln7c1C54tAMw6JNK46PrFt9UMnFq5mHhXJ7eVl+bKn2lz4J1eKq1KOmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwRUv/4sdGlK9871pehYiEsbor2uLHGx5T3gIQS/wAc=;
 b=0xxeui5+vYL8cNvqzxqMUTMiFn4T5Du2oSfnEdVbvXQNz2aU8gJPuO1Vdh+9OpUAyI1ZLOBuXyuAEB/X2YiI4UQ3eTRBkViwdKj1/h/j6fsgKamQi0juJ7lGM6iYITr2t6WHrMxB9BURh7Q+HxRIa2TI9d+X2m3mZpAhv8MOP3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB9432.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:21:47 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:47 +0000
Date: Mon, 3 Nov 2025 09:21:46 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com, 
	alex@linutronix.de, alexandre.belloni@bootlin.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 04/19] gtk+3: update 3.24.35 -> 3.24.36
Message-ID: <fb9d1aa7963c18b6b319bbbf8232a08992aee790.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 7902d3a2-b7b6-4081-acad-08de1ab20827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UDBe1YeQBCoNgxasa97FxzDrnQNiGgRkSh3x0EIl8KOYMNwAneF7qzaBPmk0?=
 =?us-ascii?Q?fWY/OQKf3EIfKPnTZSZqn7JbGLIHLUto63Wq3ohq2k1SPThrph2hMvwdAqTd?=
 =?us-ascii?Q?17nY3+lxISCmJpG84/uF3aJAPA9bpJKeB4sSzZ/hbAnsj/kIsLmVmmgI4OPs?=
 =?us-ascii?Q?pteQlTz3L9DghpUodeR0RduUeq+J6joWcyzoudlCToiAZuDDOHyB9XpGB06H?=
 =?us-ascii?Q?3lYY+q/DZeBj3G1qblua5lpnCEKTEkoiLIq+Mz1T5EIvsS0ITPYhwYKDZCuY?=
 =?us-ascii?Q?ioyRLwfRps9iY+4I+ia33AOYwZ24mj8KfxIUN1EiuZAACHnCu6d5k2D6wE4V?=
 =?us-ascii?Q?EZMZgoT5LKsX+WeThH21nvhT2Qc+u7rYvXoolouXer8FYeRTJ4H+Li4fBxqK?=
 =?us-ascii?Q?sLJAf3EwaEq36YqnM6fAdkiyixrWJgTl5l0iPOvBl9WQZ9tbir5DRs+xvSyP?=
 =?us-ascii?Q?KrXRpZb2OErOXBvBGjGNW3/brBrJ6FHLXqbpX2ws8BBVlHnomnIwUenQai2Y?=
 =?us-ascii?Q?oVk45avR/G3CYcB2OjqytdZbr3Q2C7oZ2kZikOAKhCLL+jgjkdPFkvVCqdNk?=
 =?us-ascii?Q?Cxc19SLxv3WdRBE4f06UwLYe0mZtMy8lNFKMRL1VYi8HZknycUjJLAtu/9Ah?=
 =?us-ascii?Q?yKJztof3FZrAvCmtfnvmcw7pSJDWPXs0yd+VrXLwZN6Sz3Uyzg270R9B16NT?=
 =?us-ascii?Q?1KmOVqEIl564kNhZhLPoY1OLAU2I5WM0rKmBD5MEA4lvLRGLbBdioJQaiG4Q?=
 =?us-ascii?Q?/eimGiLLZRHCRdkzfjwB0SFLVGyK8+rOH1d+mREysd7uyb+Op6VuepsGbCyE?=
 =?us-ascii?Q?/QYLkn6MSUHqiPxIgEC6/ETMuu/GYyCLkvlHB37o/My4fwpxUGjxFUBVSEFt?=
 =?us-ascii?Q?215M9TgAECOUDo+R6eFN/07XsHuifECES6Tif3vDQS4QvbY3oi76cey9Y8FD?=
 =?us-ascii?Q?BqkAmTiNWgPkDL2try3FyFi0k/MH6ceXZnQxOwFlewRrdxQ7pIwyngyHiYmc?=
 =?us-ascii?Q?5e8eAJaMd+M0Jbndt2f3qjIblmWd2ZgViT4fRUPNGj4vZwoxGCKUex1c1dtl?=
 =?us-ascii?Q?Tuw/Ac0UWdZNvVT3S6AbYsPgpdSNa7rPCHkl57BNctC2Jv0rhpdvQW/Vh+QM?=
 =?us-ascii?Q?wMuR7nVLQzUvWS5JcZy4+hUIrYfcO1cYN/8rrJpY56uxAdvARc5OxaykIKl+?=
 =?us-ascii?Q?LTzo3yMN59joRt3hHcW58RnmHqjQGAJvIaWJAJ4t6tNhvN+3WcS/JMYdB3F1?=
 =?us-ascii?Q?O9kWmrfVTrcz5tu7NoziVWflQ7pg4N9RVbMIKNd+0Dv5FenbWwO9APTB4iuQ?=
 =?us-ascii?Q?z+wenIXOKahc52BqerRc+1zJ32/7ZXCVgUUUDLf56uUrZkGPv9K9yewfnAwi?=
 =?us-ascii?Q?O/gwR4vsb+EUhyWgrmxZUsZ2j4TzUjk5eBfPe3Z0xRcBJDQSTvD023vwdcBu?=
 =?us-ascii?Q?PV1U/AbQGtknXW3MD794OsfRd0bPZ7p5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6S//n5oBKIGZSo/Yfyvjm1+0Ec6IjLS7Cjtq5UkygMvwBoa6I4dovOyBgDz/?=
 =?us-ascii?Q?1qMjaF+EP71K+ATIG9yXMeeHWpnWJTfqWvl7Egqb7q3hGZxlGMQyL4EjUeAc?=
 =?us-ascii?Q?vT8W0/Nooe0mwqEJ/nz0X2R6CC6cDT+0anlGEvc1QTWj6qbojWN5OSIwHmhu?=
 =?us-ascii?Q?7xIjy3AoIgwO7Sx9kBCKL4uXkM/5TynBUWr/h79+DkFAQfylYGalSxwHWjch?=
 =?us-ascii?Q?Wgx6jTH7KY3dZMuRxSXxhMuDOw9CNpEt6OtqBEKxufDw8JdVuVp8NEpvlUeK?=
 =?us-ascii?Q?R1Cn/O4LLlic3Ni0T18+ynu9GyX5ciJWpD6levxfab24CexMLLt1dcp+MEZl?=
 =?us-ascii?Q?xW//+qNnjvgunINtsl4D8obvum1ZXZkhJuHMgkXnMctogPUFtdPSQqaSBnXA?=
 =?us-ascii?Q?AqKh4JvhjNKF0M8nKDs+HZN8ubC8r7yUi4MlHv+H4tBKq+a6AlGAH4dd6kfD?=
 =?us-ascii?Q?fD3uktn+b7yDUHVHTiDBXTtgxUuQCgxHAlqL/IvRXGEA093lNo+jv044YlQw?=
 =?us-ascii?Q?BFUlgVZG9CLRaHJO5qvrbOl+8O7fLkJNZG/7H23nEKacbbul8W1hUG1B41k3?=
 =?us-ascii?Q?5yZxjRITDuU90OHekVkVb1QmF9GMpEx40FDzf2zPrqv8T/WdxZPUUaoZ+CCH?=
 =?us-ascii?Q?7Aa7aoSA21X4xywVB+SHEysMXRveIkhvFeyeUAUDpYdi7L3WDt8P4W7zCeHr?=
 =?us-ascii?Q?8njo0SOnymIp+aqN846OxcPvQd92UEKOPjo7oXSQbhEr5nk3AUNe2I5s42Cd?=
 =?us-ascii?Q?XUxfzZU9zMyZ4R98T9mRUgNnXfs4a948TkG1m2kzeLNDSX0UDVEEZvT25966?=
 =?us-ascii?Q?kMZ5pD65hvp+1UQLqzFiW3Fr4ey1EWyGysLkAn63u/Lod7EbMidcLiLma4Wv?=
 =?us-ascii?Q?uto17v1gWyvK4WqRDq//ux9lKbCRfr+iLDDI4fZaUfVxwPDYz7+ioFPXKa6b?=
 =?us-ascii?Q?nF5bZQgM4T1kKL+daFM7hu+hl/Jke9MuW5erxeMjhNApxa9hwYN5gdmqASO/?=
 =?us-ascii?Q?EvUcj3WLhQANy3nddyCyNQmb2AjY3R5LFoRJcLn5d+pe4LG8aDIYYWKManVP?=
 =?us-ascii?Q?mm6Lt83tJLJPIcoyhlRLHLEaKSGBGJ/6GF7cXadDk1H2+hXnL7PrZEK8yjWW?=
 =?us-ascii?Q?mPpOZG0VYRzqtzbOcmsBqeN19DMEY/7SDSfbM8zkLa07gmaYQGoyDr8d0Ivk?=
 =?us-ascii?Q?GkovMjUXUnIipcixDmrfIgghw849Fp8LdqaOChBOUMWciY1eXNiBDi58wj9k?=
 =?us-ascii?Q?otv0OXlwlC1NaVtxmEKWZK0LeMwTnZEfGGX0lJydLI+DzASl1MPX8OUVHTYn?=
 =?us-ascii?Q?BNwJT8wwWn9GsAoagmJKxmL7FS0PEP0E4OE6W+8qfhO4UnRpFu6VIifpAVCm?=
 =?us-ascii?Q?OwB3gZNVsbnmMPYlwfm+VJ7b7uLLarsk8S9Xwvl7M6SQ0B3nUzMVDX3oeGaT?=
 =?us-ascii?Q?LceFpg0cuAXgFWGqqhZ9NjqKCju28ZHgFNSab/GdzL7zzGyn8tmkIyIlS5v/?=
 =?us-ascii?Q?NfAt06wwxnIROHpJDvzpLalOKfz8ddDQuPET6CmuxN2aaIttt4huWNYTwCEk?=
 =?us-ascii?Q?4aUvd2DKNcYwX2zod4kwlAJevz7gzfNUF8IXGOB3pj2p1UBcABnSnJs2gngc?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7902d3a2-b7b6-4081-acad-08de1ab20827
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:47.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7knqc7UXpHJH4izgQ2JTDYpvKiforj+t/UqGHUjB7jkZyOrI19QWi8xxuAbB+LcdJB5HKBppIk0tfQ+bJj3R5Pg9QjmJwT3ow6MqXJ28VME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225618

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop autotools-specific chunks in opengl.patch.

Drop add-missing-meson.build.patch (.35 tarball issue)
Drop buildpaths.patch (backport)

(From OE-Core rev: cd3cc911ea565a740b377fcc53cab1b754971d8b)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 82ed25ab1af6272d0dab419964c69d56ee7f2d00
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 ...d-introspection-according-to-option-.patch | 34 +++++++++++
 .../gtk+/gtk+3/add-missing-meson.build.patch  | 38 -------------
 .../recipes-gnome/gtk+/gtk+3/buildpaths.patch | 57 -------------------
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 48 ++++------------
 .../{gtk+3_3.24.35.bb =3D> gtk+3_3.24.36.bb}    |  5 +-
 5 files changed, 46 insertions(+), 136 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-in=
trospection-according-to-option-.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.p=
atch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.35.bb =3D> gtk+3_3.24.36.bb} (7=
7%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspec=
tion-according-to-option-.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-meson.=
build-build-introspection-according-to-option-.patch
new file mode 100644
index 0000000000..11effd421f
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspection-ac=
cording-to-option-.patch
@@ -0,0 +1,34 @@
+From 6e533d5598ef875f30b84d931aae11b768465869 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 2 Jan 2023 15:00:02 +0100
+Subject: [PATCH] meson.build: build introspection according to option only
+
+The way the check is written, if the build is native, then the
+introspection option has no effect.
+
+Particularly yocto project does want to disable introspection in
+native builds and enable it in cross builds (both via the option),
+and without this patch the former is not possible.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk/-/merge_req=
uests/5382]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index bfc33af0f6..94ffaa7769 100644
+--- a/meson.build
++++ b/meson.build
+@@ -854,7 +854,7 @@ endif
+=20
+ # Introspection
+ gir =3D find_program('g-ir-scanner', required : get_option('introspection=
'))
+-build_gir =3D gir.found() and (not meson.is_cross_build() or get_option('=
introspection'))
++build_gir =3D gir.found() and get_option('introspection')
+=20
+ subdir('gdk')
+ subdir('gtk')
+--=20
+2.30.2
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch b/=
meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
deleted file mode 100644
index ef971ccff4..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8a00d0269d547799b598adda364ad6c6ee328e6b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 20 Dec 2022 12:09:07 +0000
-Subject: [PATCH] Add missing meson.build
-
-This file was missing from the tarball, but will be in the .36 release.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- gdk/wayland/cursor/meson.build | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
- create mode 100644 gdk/wayland/cursor/meson.build
-
-diff --git a/gdk/wayland/cursor/meson.build b/gdk/wayland/cursor/meson.bui=
ld
-new file mode 100644
-index 0000000..94cf47a
---- /dev/null
-+++ b/gdk/wayland/cursor/meson.build
-@@ -0,0 +1,14 @@
-+# This file is missing from the 3.24.35 tarball
-+
-+wayland_cursor_sources =3D files([
-+  'wayland-cursor.c',
-+  'xcursor.c',
-+  'os-compatibility.c'
-+])
-+
-+libwayland_cursor =3D static_library('wayland+cursor',
-+  sources: wayland_cursor_sources,
-+  include_directories: [ confinc, ],
-+  dependencies: [ glib_dep, wlclientdep, ],
-+  c_args: common_cflags,
-+)
---=20
-2.34.1
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch b/meta/recipes-=
gnome/gtk+/gtk+3/buildpaths.patch
deleted file mode 100644
index 627d1d4b7e..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Use basename not full filename to remove buildpaths from the packages.
-
-Upstream-Status: Backport [8eb4e59613a0979757332eb833231b947d61f13d]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/gdk/gdkenumtypes.c.template b/gdk/gdkenumtypes.c.template
-index df9edfefa1..c5104e0e0d 100644
---- a/gdk/gdkenumtypes.c.template
-+++ b/gdk/gdkenumtypes.c.template
-@@ -5,7 +5,7 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/gtk/gtkprivatetypebuiltins.c.template b/gtk/gtkprivatetypebui=
ltins.c.template
-index 2565208bfc..d7961be8ef 100644
---- a/gtk/gtkprivatetypebuiltins.c.template
-+++ b/gtk/gtkprivatetypebuiltins.c.template
-@@ -7,7 +7,7 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/gtk/gtkprivatetypebuiltins.h.template b/gtk/gtkprivatetypebui=
ltins.h.template
-index a21e9aac05..5ecd4d392f 100644
---- a/gtk/gtkprivatetypebuiltins.h.template
-+++ b/gtk/gtkprivatetypebuiltins.h.template
-@@ -14,7 +14,7 @@ G_BEGIN_DECLS
-=20
- /*** BEGIN file-production ***/
-=20
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/gtk/gtktypebuiltins.c.template b/gtk/gtktypebuiltins.c.templa=
te
-index f4d748b7b9..9a5a360f09 100644
---- a/gtk/gtktypebuiltins.c.template
-+++ b/gtk/gtktypebuiltins.c.template
-@@ -6,7 +6,7 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnom=
e/gtk+/gtk+3/opengl.patch
index ddec2c72d7..7354265e10 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -1,4 +1,4 @@
-From a6fb8ee9cfd5e0f8c4450d48b582614e2de8201c Mon Sep 17 00:00:00 2001
+From 4a0716f04fb25b51b08e994bd5a900b2e7f7fed5 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH] Do not try to initialize GL without libGL
@@ -16,7 +16,6 @@ before calling epoxy APIs.
 Upstream-Status: Denied
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- config.h.meson                   |  2 ++
  demos/gtk-demo/meson.build       |  5 ++++-
  docs/tools/meson.build           |  7 +++++--
  docs/tools/widgets.c             |  6 +++++-
@@ -26,7 +25,6 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  gdk/gdkglcontext.c               |  6 ++++++
  gdk/gdkwindow.c                  | 13 +++++++++++++
  gdk/meson.build                  |  8 +++++++-
- gdk/x11/Makefile.am              |  2 --
  gdk/x11/gdkdisplay-x11.c         |  6 +++++-
  gdk/x11/gdkvisual-x11.c          |  5 +++++
  gdk/x11/gdkwindow-x11.c          |  4 ++++
@@ -39,21 +37,8 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  meson_options.txt                |  2 ++
  tests/meson.build                |  9 +++++++--
  testsuite/gtk/objects-finalize.c |  2 ++
- 23 files changed, 130 insertions(+), 15 deletions(-)
+ 21 files changed, 128 insertions(+), 13 deletions(-)
=20
-diff --git a/config.h.meson b/config.h.meson
-index b502611cb7..0bf6678d5e 100644
---- a/config.h.meson
-+++ b/config.h.meson
-@@ -20,6 +20,8 @@
- /* define if we have colord */
- #mesondefine HAVE_COLORD
-=20
-+#mesondefine HAVE_OPENGL
-+
- /* Define if the GNU dcgettext() function is already present or preinstal=
led.
-    */
- #mesondefine HAVE_DCGETTEXT
 diff --git a/demos/gtk-demo/meson.build b/demos/gtk-demo/meson.build
 index 252da16d05..4b57cff6ac 100644
 --- a/demos/gtk-demo/meson.build
@@ -367,19 +352,6 @@ index 4bb1bf2b6c..64172b8d3e 100644
 =20
  gdkconfig =3D configure_file(
    input  : 'gdkconfig.h.meson',
-diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
-index 32b1f24434..d73eee604a 100644
---- a/gdk/x11/Makefile.am
-+++ b/gdk/x11/Makefile.am
-@@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES =3D 	\
- 	gdkeventtranslator.c	\
- 	gdkeventtranslator.h	\
- 	gdkgeometry-x11.c  	\
--	gdkglcontext-x11.c	\
--	gdkglcontext-x11.h	\
- 	gdkkeys-x11.c		\
- 	gdkmain-x11.c		\
- 	gdkmonitor-x11.c	\
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
 index 7e08f472cc..30fd7b6089 100644
 --- a/gdk/x11/gdkdisplay-x11.c
@@ -642,10 +614,10 @@ index 4fd0c3039c..a8e59ed077 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/meson.build b/meson.build
-index f2e63a8655..eea5347930 100644
+index aed48fc3f6..bfc33af0f6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -136,6 +136,7 @@ wayland_enabled        =3D get_option('wayland_backend=
')
+@@ -137,6 +137,7 @@ wayland_enabled        =3D get_option('wayland_backend=
')
  broadway_enabled       =3D get_option('broadway_backend')
  quartz_enabled         =3D get_option('quartz_backend')
  win32_enabled          =3D get_option('win32_backend')
@@ -653,7 +625,7 @@ index f2e63a8655..eea5347930 100644
 =20
  os_unix   =3D false
  os_linux  =3D false
-@@ -450,7 +451,7 @@ pangocairo_dep =3D dependency('pangocairo', version: c=
airo_req,
+@@ -430,7 +431,7 @@ pangocairo_dep =3D dependency('pangocairo', version: c=
airo_req,
                              fallback : ['pango', 'libpangocairo_dep'])
  pixbuf_dep     =3D dependency('gdk-pixbuf-2.0', version: gdk_pixbuf_req,
                              fallback : ['gdk-pixbuf', 'gdkpixbuf_dep'])
@@ -662,7 +634,7 @@ index f2e63a8655..eea5347930 100644
                              fallback: ['libepoxy', 'libepoxy_dep'])
  atk_dep        =3D dependency('atk', version: atk_req,
                              fallback : ['atk', 'libatk_dep'])
-@@ -496,6 +497,10 @@ if tracker3_enabled
+@@ -476,6 +477,10 @@ if tracker3_enabled
    endif
  endif
 =20
@@ -671,9 +643,9 @@ index f2e63a8655..eea5347930 100644
 +endif
 +
  if iso_codes_dep.found()
-   cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_pkgconfig_variab=
le('prefix'))
+   cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_variable(pkgconf=
ig: 'prefix'))
  else
-@@ -926,9 +931,15 @@ else
+@@ -912,9 +917,15 @@ else
    gio_packages =3D ['gio-2.0', glib_req]
  endif
 =20
@@ -690,7 +662,7 @@ index f2e63a8655..eea5347930 100644
                       ['fribidi', fribidi_req]))
 =20
  gtk_packages =3D ' '.join([
-@@ -942,7 +953,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
+@@ -928,7 +939,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
  # Requires.private
  pc_gdk_extra_libs +=3D cairo_libs
 =20
@@ -761,5 +733,5 @@ index 24540e313f..e0f863ab6a 100644
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbu=
f_loader_close() */
  	  all_types[i] !=3D GDK_TYPE_PIXBUF_LOADER &&
 --=20
-2.34.1
+2.30.2
=20
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.36.bb
similarity index 77%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
index 52e3a59ad6..3df4e6164c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
@@ -3,12 +3,11 @@ require gtk+3.inc
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-$=
{PV}.tar.xz \
-           file://add-missing-meson.build.patch \
-           file://buildpaths.patch \
            file://opengl.patch \
+           file://0001-meson.build-build-introspection-according-to-option=
-.patch \
            file://CVE-2024-6655.patch \
            "
-SRC_URI[sha256sum] =3D "ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06=
965629fef60bd1"
+SRC_URI[sha256sum] =3D "27a6ef157743350c807ffea59baa1d70226dbede82a5e953ff=
d58ea6059fe691"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.51.0


