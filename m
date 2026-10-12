Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52344CC6B04
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3961.1791836843813899989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=veaLCdC4;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYirm2ADojS5L5NUlLu1LTThAY+iZWNDe0kxWn1rLwJO6aDL3aGnRXVNlytve7HJNYQs+73/msSZiIdsoaHYH30RPPkq6ZGgGIC/M42PxHufbV6k+u8vx9O/z+iBqvgmoF0VS5PH1v/Uw5NO8qye10BDibIjnitia9/VSE5n9HYdSMCQj0vTqH2wwfp1uERxt1ooSVDV29V6oa6SIjVdWN9FslF3baKBNok5a4YL0Mp2KAJbgnc/u2AOuKRHq3MomYoak06BqC8Fk3Nf8hdu/EmM3p1FMHEtb+5v6jJnDzPaNZp+QM9/Wau9MgKZi67iVG1anDSpjZo20yGBxes7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqJI0rGPthoC4fEcIRoHOXd6Iobo9iFssYnDkoETExo=;
 b=gczBHdulAQ1kQhbUsiqBSXgqMTIVQcaQba2G4SJykI37cmu2M293a4NgskY/V/ZMotdpIipNvnAYFk4wkBkOsePnpGmH7ho99aK7lD//YSxyOJi0WBEOj/Zp7HyVVUcUgCb1lwFCtHpsRVD+S4DpAAvkt/aQtNeCknq7QCbjPe/1UkqUVFJtDRg9COLx2fo583eFBBbBPQ3Csz2CNG2c22SxlP0etxEJ/2pL7CTrVXbExKANGK/9eOQ4BjO53FAbCnHl3VWwI14HmjkrprE8TQ7/TkwSGfsk6yy/dBxdpY5KgGIY4WwB0i606cK2i7s7ewu8tFb3RXICheRIriuR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqJI0rGPthoC4fEcIRoHOXd6Iobo9iFssYnDkoETExo=;
 b=veaLCdC4OtClHIdQdPwwr494VU9CmtmtpyhU+8KZMKguYdp8w1oubQOls2Zc+m2pVBpk/YGt1vWjJMyN3g9at+xcxtotpiMv/jO6e/I5z5PbeMdD1pmkFTP7I6+IPpA0ynHRc4tOxLSJ0kvavvwAoOWTjXhO3v/ggkPkLa0dsOY6yGX5rKnev3S9EBQ8hKgCBtxr+Sz/1gXTHSULsMJBEF7dyHRJdDsJ7xVUPakc7/se3OUELKvHgvaNeLAgc3I5u13Mf2bHPzGH3nwEzCGmSIooU+MzgrLzVJ17ihAS06gbFgZOM8Mr3jPjD2eRTCxg7R1+4uw72F/p7JySx7T1wA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:23 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 03/10] gst-examples: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:09 +0200
Message-ID: <20261012202716.38597-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 1474de56-c9cf-463e-2ccc-08df289f38f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|18002099003|22082099003|3023799007|11063799006|261009223027099003|261009220027099003|261009221227099003|261009221727099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	24h/NrAmJYrjBLxj6P+cwyGbcMHkApH63lhzDd9NjL5D7cO7+z9RSNy29Iv7baf1bIRYGCNfzggTMmpLEVasfcAMxwwMqjJThFwSnctUDD9Azr66xj4cbu9b4s97IMYWG2yHJFACLfU8MCj8skWff2dg1xaSnEt1v4hukF+zFtnnSDlC/vaN6e/SNFD8tUYlQ/rFiaF1yfZZWDnd0sSH5S7ayReEo/0NhK8SIKO+5AT4h74nw321GuYJTz2xks5XQgrBHPL2Srt9dnQBjfPOs5mdc3frjo7webf6vzxxRJwIubkqnfRumZ4eLwdV5h9Hk0+vcVT4N2edGlm3Dytp3cgH6V3WaUbypfCBguotn55b1mnDmhRLxnotD7qzsodaGzXkzL0rG1Cw5HPNhrLkduD5DU0O3tYYpP5ja/HG/ghjPdDaU0QFb22fvHO19urJBOJ2Vej11Sk2CLL9SVW10qEWIYCeughsQA3qU+fiynaWx6CC3crt1/eLflNLPDsgcSngfwUgNfOJI9QR6C1wPCl7hl8JqDvgwK1kHg8dHaOeVUDzDzQeP4owUbDD9r9/uMGJtwkdT/zy/QQJPFUsWYGQ0rNlQHinJxdxS+zZ1Eg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(261009223027099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l1AxCcxZVU8gQ2z8raR1D89HkaOO/g4V7qQN1DsEa5MXJ6DaB8dAnQoGqMW5?=
 =?us-ascii?Q?FrTjfZ0wI1fTz/odETo4gBtVlBJMyrzfbvd+3CI0MP04PseyyGGTl6L2xuyD?=
 =?us-ascii?Q?RP0dqyAca6f86IP+bHkNV9/ptORWqwLdTSMEWtN3+Daj5LhKIUsoXkTU3JBd?=
 =?us-ascii?Q?Isjj8F1pTNeuAMojSAUMncEUv9nkc45sJXuUVD5LE55PU6kRLJQt9ZLlUftQ?=
 =?us-ascii?Q?RhnRxRo/XfmgKwWprV+1aRsp477JUT/yNz1FB5Jr+3fYoZ2kMOQmaUAdyxw+?=
 =?us-ascii?Q?UV0j5cEfz4u3YoD0y/i0F67aNiXyeQA6fB0+Fz4alP6ImOiu2KSbBiVz+XQo?=
 =?us-ascii?Q?4TNTv4QsPInQcswik8ZDnDE1oKoxFB0UZ4z09srIQ16kIbpxjBJsyTW8Jvw8?=
 =?us-ascii?Q?AfXlZbZhQ2Tt9gZwF538EjbanAdbx/i9Roh4+hCf/QgzIDnSGthqqdgjqA6x?=
 =?us-ascii?Q?NEFYexJQnjGkjxQLNpEAygDT2V/MKf17BbCOsK+hPe0Roje8PXhwgwwvZJ1S?=
 =?us-ascii?Q?5CZ0/rePkWgrQobXtJckphZW1QWtjaq5wIw25WLxx1B9Qp6wTlKEoJJvqhvf?=
 =?us-ascii?Q?d5XaA6ixbd6TShMW69i0C0ZhPyJNSWrsXCV1MOVC7lW50/YE1w8ZjDCm5/HQ?=
 =?us-ascii?Q?CEtjdun1BrPHdNc6BF3b4cOOSeXP28/mH9xvcyktRTuP0eVJ0RyZNZ85GLCW?=
 =?us-ascii?Q?7bZIFne/zwWNIicZADi6uAXDafu4Rh3RNFCHuihlKRWlQggHhSOgMUn9oZYZ?=
 =?us-ascii?Q?4N1mFRQ4XYMUu1Nufc19xUizZbXx08sydK7TkFmPtIqzrUnn+g6Y5Q0CAVAS?=
 =?us-ascii?Q?q+j+j6Eok+0Xo/IcfXqKD6lOBGmzg4JiihBh2szSR+lkoNeLL2JHYg339aIk?=
 =?us-ascii?Q?QPyXP7gsS76dRWGoU+GvEiYrIMWzyksYlPdvifTMSnMCcPHSONG19KBxRZ31?=
 =?us-ascii?Q?dYV1vLIM/0oIPqrvQkKI/bgQReKiMt+0om82u2NpVuVBRgFgxNJtc/n9n25e?=
 =?us-ascii?Q?bB2WKSdytrPiGHH1Zw8T6Oh0pDPm9/lxtT69WJPyQ5cUvv7h96ku/71xyOYO?=
 =?us-ascii?Q?QGr0ryraa2l5sCLfNuV0wbLMxy4Z/4BhQa3YO1AMDEoPhQlynuQntKMG3D45?=
 =?us-ascii?Q?fBlj1MvellIVG7EzsIQUFRDetyU8Dh+kJ6w5Th4PFkwnTX7cTtTsyolZyVXB?=
 =?us-ascii?Q?H4wskbqsmCYmQ+uFiH+K9FDcKGy+R9PE89MnoFOWKuDlmew1uAPE9J7iPtk3?=
 =?us-ascii?Q?fjO3zSAuRn+14xzD5kxhTf+BFIPf+k4r8yDiZGHbu3lDtfiO7c0A7ZPRaIlW?=
 =?us-ascii?Q?z8LafNN4zGX9QJ6v42VCiNIqyEMZ75bpg/yANSg6y4j/0B2IBy3VSwyZ5cLU?=
 =?us-ascii?Q?gklMlyWj0HEb1nrsAVYocC7VbeKIusWXDVta5mJsi1CEtQXq1njHH4P/a2PM?=
 =?us-ascii?Q?kRfnZr1FjOTSpYl1zDoKY1+fJ19vcI0Xi+a03Jy64gN2opePoqNfp0f/Mpcy?=
 =?us-ascii?Q?uOdBaAqJS8vsdhLefckmHjbVCzjJIRJrUIT7NEfDzLDhg8qY5C4DHA3NoQIV?=
 =?us-ascii?Q?XsxKAW0vuyopWqgnrgq7W3wr0rKinvw+dj/OC6bB1C4RuIMw4cmqF7HRlaEt?=
 =?us-ascii?Q?t4kjsG2jb9xzKGcV29Ciih6t/mvOjMHWfTDq2kwfUY1PicjYFjyXRxOlZ4BE?=
 =?us-ascii?Q?sO0RMop8x8YnDqZRfwyMBVSIs8DeWlJWK9eO3vKyHphtM7XOm53MG5a/Qj1e?=
 =?us-ascii?Q?2Nnfaak3zQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1474de56-c9cf-463e-2ccc-08df289f38f3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:23.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPuwLd1sEp85iYpMeqnGnDy9JIEsx28brnFo9lEQ6P6PTMpCAw+8GdfDlt7bIe6W5kXFsxuB4GX8f/y8C7hzTejHsdNzZoiJk55JAvvql6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247678

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Make-player-examples-installable.patch             | 6 +++---
 ...-examples-gtk-show-player-warnings-in-a-dialog-box.patch | 4 ++--
 .../{gst-examples_1.28.7.bb =3D> gst-examples_1.28.8.bb}      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.7.bb =3D> gst-=
examples_1.28.8.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-playe=
r-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-exampl=
es/0001-Make-player-examples-installable.patch
index 72fe5a26aa..ab5bc03de3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examp=
les-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examp=
les-installable.patch
@@ -1,4 +1,4 @@
-From c93f7aba35171abfc913684a26f85a03714e2a4c Mon Sep 17 00:00:00 2001
+From 92694bd5103b3a6e655aad0fed9c0c2ccdc20e50 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -13,7 +13,7 @@ https://bugzilla.gnome.org/show_bug.cgi?id=3D777827
  2 files changed, 2 insertions(+)
=20
 diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build=
 b/subprojects/gst-examples/playback/player/gst-play/meson.build
-index 5e80ca8dd4a8..129e5bdcbe3d 100644
+index 5e80ca8dd4..129e5bdcbe 100644
 --- a/subprojects/gst-examples/playback/player/gst-play/meson.build
 +++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
@@ -24,7 +24,7 @@ index 5e80ca8dd4a8..129e5bdcbe3d 100644
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
 =20
 diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/su=
bprojects/gst-examples/playback/player/gtk/meson.build
-index 6892f152544f..20d7505877c2 100644
+index 6892f15254..20d7505877 100644
 --- a/subprojects/gst-examples/playback/player/gtk/meson.build
 +++ b/subprojects/gst-examples/playback/player/gtk/meson.build
 @@ -21,5 +21,6 @@ if gtk_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-g=
tk-show-player-warnings-in-a-dialog-box.patch b/meta/recipes-multimedia/gst=
reamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.=
patch
index 6c02d8d71f..60169dc944 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show=
-player-warnings-in-a-dialog-box.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show=
-player-warnings-in-a-dialog-box.patch
@@ -1,4 +1,4 @@
-From 1609881b8d1246e85d9eb68275d54d28e2170301 Mon Sep 17 00:00:00 2001
+From 1ef021f661d6343eb2be7dfbd12f4033bb2b5cc7 Mon Sep 17 00:00:00 2001
 From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
 Date: Tue, 25 Aug 2026 11:03:34 +0200
 Subject: [PATCH] examples: gtk: show player warnings in a dialog box
@@ -13,7 +13,7 @@ Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-bria=
nd@bootlin.com>
  1 file changed, 20 insertions(+)
=20
 diff --git a/subprojects/gst-examples/playback/player/gtk/gtk-play.c b/sub=
projects/gst-examples/playback/player/gtk/gtk-play.c
-index fb83f6be29c5..2310c716f2e9 100644
+index fb83f6be29..2310c716f2 100644
 --- a/subprojects/gst-examples/playback/player/gtk/gtk-play.c
 +++ b/subprojects/gst-examples/playback/player/gtk/gtk-play.c
 @@ -88,6 +88,7 @@ typedef struct
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb b/met=
a/recipes-multimedia/gstreamer/gst-examples_1.28.8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.8.bb
index 9a4c73f092..f108e62037 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.8.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/gstreamer/gstre=
amer.git;protocol=3Dhttps;b
            file://gst-player.desktop \
            "
=20
-SRCREV =3D "070125524a8422e29d3b69a372ed4f62fd343ffa"
+SRCREV =3D "1b2a95a1b72787cda146b46df9605b168e5b683b"
=20
 S =3D "${UNPACKDIR}/${BP}/subprojects/gst-examples"
=20

