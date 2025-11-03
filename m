Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8283CCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:18 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15847.1762158135843570868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=UGKtYtOJ;
 spf=pass (domain: navimatix.de, ip: 40.107.159.72, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etpOEVjloUt7T26xb9Q184461Zw/M++pvfdNN9toH8u+Hsn4J6LVo1TNnTYbYEYJK/HMSk+LMg852SUpJfxKNxxJslyv9mbdJR/Gp4nUKytACGdDNKGph+PHecQ3ar+wV5Z91j2ExMk5tWMs7Tvx90PyL7F4txqUnPoDkvMYkQsLI0iRnAhqQ3lh6hVNwQm3GDL3YnSRFjvn5pgoP5AyTGT57h3mIz+V+NKqoKWbp393ODvDpEuuh/c4s2NQGvYfBQ7Y9FomRNDKXO6UODV0Q9j0kFBd7ffUJfpt7JjXsC8RLZM9V1UP6tTWYPxKQXYFkPjEZqqFxd5r6b4ch5veCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MEF2GBtIiToeeB80je1uQkLE6DCcjzzU22zEosZy2w=;
 b=V7ZAMkxAuOzsBV+ut/pXELhjZAJFBlRqPgRuScYO4SOdj0bcTsZAplXXgdKWxzzVQGOaZG9uXq5k/ropFjbX1MZRs9iqeAfREVUZC0xAP2E3fE461DR6n/pPkyAwHoc4C0ak3jI4evU190kO319flumtdi9CECkyK3Da5d6LjTnj6ysVh62+BDugWnntcbNULHmpDiKxguQ0wlHvlFSn5Qo/Aw4rJ2iSin9U5221UCMupo/Qajt15DufDVM7RoDTHO+9CdNnvkGSMUDpdD/PqEdl1pwTRLRlj0Jg0AMLJKlftKg+bSUMU8DEDcCcK0u328qK4Y/GKu7AN7oNdhQFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MEF2GBtIiToeeB80je1uQkLE6DCcjzzU22zEosZy2w=;
 b=UGKtYtOJs+IPUTSR5opGLmmVUHkekU8kIvRAbi3prrrs44Ky1o7dQVH6vBqRbwS2lrqYGmftdTHgYAKPycSnWpQFRDS3uAAP81+cU+2+6WI6cMjVl//kUzwDOyy88MiQFNjfvG1GpyTQgh1dPO9sS4zvN/Izbh44RvR46OxqBDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB9432.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:22:12 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:12 +0000
Date: Mon, 3 Nov 2025 09:22:10 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 16/19] gtk+3: remove unneeded .inc file
Message-ID: <cb90fa655f1648d91624d6de255563b61eeafcc6.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cf4c1e-600c-4b84-bedf-08de1ab2169c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HV0RS28GIFNtLebvQpXzz1JQFmFJlVRDjaCIFASzbfDvWoGPWs/5aKoQdDzw?=
 =?us-ascii?Q?GGGmBkYVzVO+uUOJgpjXlE3lUpaNfS5ZRuGcP7B1Rk97KfT6bVR+WmZRyTSl?=
 =?us-ascii?Q?ghDB9toUeHYRpNJYSqewJ49f7pWvoxZAry++NPplLyl0GfZ4zqzu98S47Bp4?=
 =?us-ascii?Q?3BovSweyXbIdzxhT9OjycrxNsPi16yQGjf7bzgJOWKHiooze+p68myEe1TWt?=
 =?us-ascii?Q?NHC/FXuRNIciAM7Yicn+7JeUPETPwImHiQYIqiDgfWDcF2AwyYzE47LNXZvq?=
 =?us-ascii?Q?Wy5Oc0M0pki32trn2Kej1RixtcY6D4UAbZ2ti3Wwx26EIO6GVR7q1GbTdKdy?=
 =?us-ascii?Q?mmhTRwJr89vPxY1nYMYYbGZEjB+t5fHQJu88jnot4fFNPQMdF9NWbFzbJMy5?=
 =?us-ascii?Q?SdqnugURCCCMksnrI9SK0qvxpAGMgkN7QeimcoMe+gcqGprHnL4B84HMsOzt?=
 =?us-ascii?Q?fkBecmslUxo67ZZYknUvmS2V5iBRCFDDmrYGH73dYh6GD4zcU9hEe0K8rZMq?=
 =?us-ascii?Q?yEc5GTKqv5m2UO9Mn9IRKDnqWmctQmmjBKVNBOrbYtsBgAv2crYYg13ZcSEv?=
 =?us-ascii?Q?YYf9mtjObuQyezKT4OSnPQuBKkVh8Yag+pcT5w28d0p12eXwFpGdJcS0hbnt?=
 =?us-ascii?Q?ZPZMyX3/MyFD523WmXTG/bKwd9j7PWvYIe5aSUA30i4d5OTQI3sZXaTy88Dj?=
 =?us-ascii?Q?hf3BykT/GjP118+FUabAqUwuZ6m3ImTUzTnraPY++poVOTn/5inoTGJf8qR9?=
 =?us-ascii?Q?v73sR1Gayn62nHESJnmPNf9mrQHjjXQPSL99x0j2qer4kIbu1GEgmmJKO4VI?=
 =?us-ascii?Q?GzVAq0SHYQKJDcD9u+mz9e5aX2fKIr8bHd1JRGZ4BhTLo1W2SRu+wwuk1oj7?=
 =?us-ascii?Q?JBv/nXxM1H91c1mOVIQyADRVe2zDBB+1feykNsstBwpX/FQOxKPxvnPVuEyU?=
 =?us-ascii?Q?gekA7TiM8zUH8XrscVlhrnR/8qG1/v0iA0qJphcSZFRfXhVLFViDR26FfAnc?=
 =?us-ascii?Q?sKJFPQNlwGVd2iFhzF/UwEaYE7HbZ7FVDSR9dBdUWJ5eBK9+YwL3gYFwS+/q?=
 =?us-ascii?Q?MFtOfAmGDJ8jBZTMAsTZscSH/3T5AUgGMvfyCFQ7krUYD7lHt+kvA5Vb3Zt1?=
 =?us-ascii?Q?3H1RmZgOWGPb1HfcnyVtO9IKH1VOtqw8iG2mVh1tBOi34v00gTXxl509LdGP?=
 =?us-ascii?Q?KsVUvvFKnQnZlIxcx3fW9D57PRMEbLZfjHIKEAzh4umOyftS+jOXDBdL9lRv?=
 =?us-ascii?Q?2mFsfhij/RPEXzg0ZmOqggD5Csq688ZgkTw4C33dtgahp451zgmkjZAF8Etv?=
 =?us-ascii?Q?PhgC+mWnf1x1TI6LnWwWJ+qbPGUYkVRJ90zTJB8RdXu54xrF1WAduhpalaCn?=
 =?us-ascii?Q?9TvHT8Rdma3VHYf7aL5LMeXznlJvERZESRxYVaC7ejfPMf+9VQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kruNWpNqVd0SPu7CEhN+ZMBM2Acz/vsBUaARt4fjz1bbM5Yp4JSGxfwRkjdi?=
 =?us-ascii?Q?GwqhF/G+o9ZR9anTHIUCxI0ZgBi7dvJLjdSFXEya4vIqRyFCbcI2PwyuPI96?=
 =?us-ascii?Q?5JwzIyvE9y/4Hyy9AHRztCwFyalvZDK7eLLdp57pTu4qXXlvfeRrcy10pQ2t?=
 =?us-ascii?Q?tyIZR8UdLaB2IDWyqH50k7tLlCHdDElrtPDIks/sxSWG1hxqkMtUi8W8WFzt?=
 =?us-ascii?Q?obT1ZrRNkY9Q2e4Ny8OgiW7s6s9OwjGmY0VcE533RFegkM9xOJvW60fwK6DH?=
 =?us-ascii?Q?kbVEiTC7ehtipklm44tAfpqpBxZW7PEz4gPw390NS7QRArfvk2lS0GR6+YfY?=
 =?us-ascii?Q?Hcd4qwBcNdEGSHLcIQhWHxTZPx3e6aHtSnZKYCTs86o7zOFaGvA8BCuQDMr7?=
 =?us-ascii?Q?iOkWXYIAWvYTczZGItejDScw5b/+wsXlf6mE/U5jkqy1vCNFcXXkEFi3a23n?=
 =?us-ascii?Q?UGiGTrKcvQK3Uyyxc5eO8mfx5AM1y1oHr1c+wkSBqUqVd0bXMnypACbhUu55?=
 =?us-ascii?Q?0O4J6GCuVTr5yYWJiMrqKuwflSAzlvPZjETXGgpxUZ9fKleBbFNJI9oGnfDO?=
 =?us-ascii?Q?nHsyrsd1dL7CurrgRU3RbLfZmkYasIcvVAENJn8AY6hWPXhw9xTEQq9jZUI8?=
 =?us-ascii?Q?Nxed6Bk6VHpwb5Mabqg+PD8P9TUbvD2x5FmXvu59KgGaf26MiMcth/S0Gqqm?=
 =?us-ascii?Q?p7LHIW0YpDEA5wc+UKk6aiPF1bbnNuNxPLpmadq5vNn0bc0HIDvdyYPObP05?=
 =?us-ascii?Q?V719IbeA+GDPkXt8vneZVmB89Y4FebDSmV8Mhimyz88QJij0ZLmgzB7Wn5JC?=
 =?us-ascii?Q?cI5MmPP4vIUsuDdCcBbK6MG7JUfyyr6XCxCLqfgOxswjtzRQ9idUpN7l6cB/?=
 =?us-ascii?Q?HBmOF2uQYMGMuv/aR4hcmFVr1buWeV8rcKs62fkiv4PrsEBzwprxUh32Hyq5?=
 =?us-ascii?Q?D3OFb5NVQY7VGTxo4HUyFEOTU0Q0UHE019pPHk2mAcql1kbqdn93pK/05P3o?=
 =?us-ascii?Q?yoRDDHoXrHNIEpDnx2jxKZUeVr4WK7evSU0vBzSxutcxeuk82gcAnzC4baiM?=
 =?us-ascii?Q?eIeKuVeNqLm5EE9WbGqx32YrnqGPiDRmW5atzuYBIQ3qEOaF3EjU1zK0EaeL?=
 =?us-ascii?Q?TZ+XoAR0UCeOnFuNMAnWkvDo3TvlhIhrs5SVoa5403uM1dl/CBZuBJjHMTGS?=
 =?us-ascii?Q?CfwcmhapyykEM6QahRlFLi0vFagtDIFFrvIEi7cYSbrFp0JIlfmkuGGwk2ZB?=
 =?us-ascii?Q?7xndXYVaXZv69VgwfmI4TzYT192t6CC7NK5BYkMeZ0PxkSFdlP+tKitl2LRP?=
 =?us-ascii?Q?d0UuL0inO5GjZU8IYlfMcOLgM0E8S9RCxH9C1X91CUPtoS2aevhvZDSq+le2?=
 =?us-ascii?Q?VdQneBtPHe0IHLBcnVdY5LTe9UL2lTUpk2PwqT6b/Q3w6lVLd7OgYHNWmpi9?=
 =?us-ascii?Q?pYlSW5/cLS5Koe4rggssozPDvRiUvWr0xetzLy29AQ3SnP3gic/SlhsC7RbC?=
 =?us-ascii?Q?+YjsIJYOJAZ11WYhzhaET3wSjJaZrUBHL9bu351gJebcRQQPJuKHTdhfqn3T?=
 =?us-ascii?Q?4xqfjQvQ/QR3PLKk+JPLjqNaKiI3kN2X2mLCnjI5q9WIRRogJ/G/fQFFCndT?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cf4c1e-600c-4b84-bedf-08de1ab2169c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:12.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hEjHrllu/qacu0MQre6l9qPnorviayzKvOn6ywqyjFAQm/uK7/G8Z/VKRRg1ZIek1wuBMXxZECSHv76nvQmsV8lt1B+C8qtijsKYjd7yRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225630

From: Markus Volk <f_l_k@t-online.de>

(From OE-Core rev: fa8d6a892c4cb8479602298997140e531dbb8230)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 5ccfc9f411bb19a5d47e1f42784d259160778741
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc        | 154 ---------------------
 meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb | 164 ++++++++++++++++++++++-
 2 files changed, 157 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3.inc

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
deleted file mode 100644
index 03913768b1..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ /dev/null
@@ -1,154 +0,0 @@
-
-SUMMARY =3D "Multi-platform toolkit for creating GUIs"
-DESCRIPTION =3D "GTK+ is a multi-platform toolkit for creating graphical u=
ser interfaces. Offering a complete \
-set of widgets, GTK+ is suitable for projects ranging from small one-off p=
rojects to complete application suites."
-HOMEPAGE =3D "http://www.gtk.org"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
-SECTION =3D "libs"
-
-DEPENDS =3D "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf gdk-pixbuf-na=
tive"
-
-LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
-
-inherit meson gettext pkgconfig gtk-doc update-alternatives gtk-immodules-=
cache gsettings features_check gobject-introspection
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-GSETTINGS_PACKAGE:class-native =3D ""
-
-# versions >=3D 3.90 are development versions, otherwise like upstream-ver=
sion-is-even
-UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.ta=
r"
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-do_configure:prepend() {
-    # These files are generated by wayland-scanner but will race over modi=
fication
-    # time between the copies in the sysroot from wayland-protocols and th=
e copy
-    # in the source tree. Solve the race by deleting so they need to be re=
generated.
-    rm -f ${S}/modules/input/*-text-input-*.[ch]
-}
-
-GTKDOC_MESON_OPTION =3D 'gtk_doc'
-
-EXTRA_OEMESON =3D "-Dxinerama=3Dno -Dtests=3Dfalse"
-EXTRA_OEMESON:append:class-native =3D " -Ddemos=3Dfalse -Dexamples=3Dfalse=
"
-
-PACKAGECONFIG ??=3D " \
-	${@bb.utils.filter('DISTRO_FEATURES', 'opengl x11', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'wayland', '', =
d)} \
-"
-PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11=
', d)}"
-PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES', '=
x11', d)}"
-
-PACKAGECONFIG[x11] =3D "-Dx11_backend=3Dtrue,-Dx11_backend=3Dfalse,at-spi2=
-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxre=
nder libxcomposite libxfixes"
-# this is provided by oe-core patch that removes epoxy/gl dependency from =
a X11 build
-PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,-Dopengl=3Dfalse,libepoxy"
-PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwayland_backend=3Df=
alse,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wa=
yland-native"
-PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-cups"
-PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
-PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovider=
s=3Dfalse,libcloudproviders"
-PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tinyspar=
ql,localsearch"
-
-prepare_gtk_scripts() {
-    mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-c=
ache-3.0
-
-    # duplicate gtk-query-immodules for post install script update_gtk_imm=
odules_cache
-    mkdir -p ${D}${libexecdir}
-    ln ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}=
gtk-query-immodules-3.0
-}
-
-do_install:append:class-target() {
-    prepare_gtk_scripts
-}
-
-do_install:append:class-nativesdk() {
-    prepare_gtk_scripts
-}
-
-do_install:append:class-native() {
-        create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
-                GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixb=
uf-2.0/2.10.0/loaders.cache
-        create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
-                GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixb=
uf-2.0/2.10.0/loaders.cache
-}
-
-PROVIDES +=3D "gtk-icon-utils"
-PACKAGES =3D+ "${PN}-demo"
-LIBV =3D "3.0.0"
-
-FILES:${PN}-demo =3D "${bindir}/gtk3-demo \
-                    ${bindir}/gtk3-demo-application \
-                    ${bindir}/gtk3-icon-browser \
-                    ${bindir}/gtk3-widget-factory \
-                    ${datadir}/gtk-3.0/demo \
-                    ${datadir}/applications/gtk3-demo.desktop \
-                    ${datadir}/applications/gtk3-icon-browser.desktop \
-                    ${datadir}/applications/gtk3-widget-factory.desktop \
-                    ${datadir}/icons/hicolor/*/apps/gtk3-demo*.png \
-                    ${datadir}/icons/hicolor/*/apps/gtk3-widget-factory*.p=
ng"
-
-FILES:${PN}:append =3D " ${bindir}/gtk-update-icon-cache-3.0 \
-               ${bindir}/gtk-query-immodules-3.0 \
-               ${bindir}/gtk-launch \
-               ${datadir}/themes ${datadir}/gtk-3.0/emoji \
-               ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
-               ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
-               ${libdir}/gtk-3.0/modules/*.so"
-
-FILES:${PN}-dev +=3D " \
-                    ${datadir}/gtk-3.0/gtkbuilder.rng \
-                    ${datadir}/gtk-3.0/include \
-                    ${datadir}/gtk-3.0/valgrind \
-                    ${datadir}/gettext/its \
-                    ${libdir}/gtk-3.0/include \
-                    ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
-                    ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \
-                    ${libdir}/gtk-3.0/3.0.0/printbackends/*.la \
-                    ${libdir}/gtk-3.0/${LIBV}/engines/*.la \
-                    ${libdir}/gtk-3.0/modules/*.la \
-                    ${bindir}/gtk-builder-convert \
-                    ${bindir}/gtk-encode-symbolic-svg \
-                    ${bindir}/gtk-builder-tool \
-                    ${bindir}/gtk-query-settings \
-                    "
-
-GTKBASE_RRECOMMENDS ?=3D "liberation-fonts \
-                        gdk-pixbuf-loader-png \
-                        gdk-pixbuf-loader-jpeg \
-                        gdk-pixbuf-loader-gif \
-                        gdk-pixbuf-loader-xpm \
-                        shared-mime-info \
-                        adwaita-icon-theme-symbolic \
-                        "
-
-GTKBASE_RRECOMMENDS:class-native ?=3D "\
-                        "
-
-GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
-
-RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
-RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
-RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland", =
"wayland-protocols", "", d)}"
-
-PACKAGES_DYNAMIC +=3D "^gtk3-immodule-.* ^gtk3-printbackend-.*"
-
-ALTERNATIVE:${PN} =3D "gtk-update-icon-cache"
-ALTERNATIVE_TARGET[gtk-update-icon-cache] =3D "${bindir}/gtk-update-icon-c=
ache-3.0"
-ALTERNATIVE_PRIORITY =3D "30"
-
-python populate_packages:prepend () {
-    import os.path
-
-    gtk_libdir =3D d.expand('${libdir}/gtk-3.0/${LIBV}')
-    immodules_root =3D os.path.join(gtk_libdir, 'immodules')
-    printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
-
-    immodules =3D do_split_packages(d, immodules_root, r'^im-(.*)\.so$', '=
gtk3-immodule-%s', 'GTK input module for %s')
-    if immodules:
-        d.setVar("GTKIMMODULES_PACKAGES", " ".join(immodules))
-
-    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$',=
 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
-
-    if (d.getVar('DEBIAN_NAMES')):
-        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-3.0')
-}
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.43.bb
index a8cc1152c3..2171880c50 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -1,7 +1,23 @@
-require gtk+3.inc
+SUMMARY =3D "Multi-platform toolkit for creating GUIs"
+DESCRIPTION =3D "GTK+ is a multi-platform toolkit for creating graphical u=
ser interfaces. Offering a complete \
+set of widgets, GTK+ is suitable for projects ranging from small one-off p=
rojects to complete application suites."
+HOMEPAGE =3D "http://www.gtk.org"
+BUGTRACKER =3D "https://bugzilla.gnome.org/"
+SECTION =3D "libs"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2 \
+                    file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287=
a271dce88af737 \
+                    file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d=
3e7c50e08086f2 \
+                    file://tests/testgtk.c;endline=3D25;md5=3Dcb732daee1d8=
2af7a2bf953cf3cf26f1"
+
+CVE_PRODUCT =3D "gnome:gtk gtk:gtk\+"
+
+DEPENDS =3D "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf gdk-pixbuf-na=
tive"
+
+LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
+
+inherit meson gettext pkgconfig gtk-doc update-alternatives gtk-immodules-=
cache gsettings features_check gobject-introspection
=20
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
-
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-$=
{PV}.tar.xz \
            file://opengl.patch \
            "
@@ -9,9 +25,143 @@ SRC_URI[sha256sum] =3D "7e04f0648515034b806b74ae5d774d87=
cffb1a2a96c468cb5be476d51b
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2 \
-                    file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287=
a271dce88af737 \
-                    file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d=
3e7c50e08086f2 \
-                    file://tests/testgtk.c;endline=3D25;md5=3Dcb732daee1d8=
2af7a2bf953cf3cf26f1"
+BBCLASSEXTEND =3D "native nativesdk"
=20
-CVE_PRODUCT =3D "gnome:gtk gtk:gtk\+"
+GSETTINGS_PACKAGE:class-native =3D ""
+
+# versions >=3D 3.90 are development versions, otherwise like upstream-ver=
sion-is-even
+UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.ta=
r"
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+do_configure:prepend() {
+    # These files are generated by wayland-scanner but will race over modi=
fication
+    # time between the copies in the sysroot from wayland-protocols and th=
e copy
+    # in the source tree. Solve the race by deleting so they need to be re=
generated.
+    rm -f ${S}/modules/input/*-text-input-*.[ch]
+}
+
+GTKDOC_MESON_OPTION =3D 'gtk_doc'
+
+EXTRA_OEMESON =3D "-Dxinerama=3Dno -Dtests=3Dfalse"
+EXTRA_OEMESON:append:class-native =3D " -Ddemos=3Dfalse -Dexamples=3Dfalse=
"
+
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'opengl x11', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'wayland', '', =
d)} \
+"
+PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11=
', d)}"
+PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES', '=
x11', d)}"
+
+PACKAGECONFIG[x11] =3D "-Dx11_backend=3Dtrue,-Dx11_backend=3Dfalse,at-spi2=
-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxre=
nder libxcomposite libxfixes"
+# this is provided by oe-core patch that removes epoxy/gl dependency from =
a X11 build
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,-Dopengl=3Dfalse,libepoxy"
+PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwayland_backend=3Df=
alse,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wa=
yland-native"
+PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-cups"
+PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
+PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovider=
s=3Dfalse,libcloudproviders"
+PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tinyspar=
ql,localsearch"
+
+prepare_gtk_scripts() {
+    mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-c=
ache-3.0
+
+    # duplicate gtk-query-immodules for post install script update_gtk_imm=
odules_cache
+    mkdir -p ${D}${libexecdir}
+    ln ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}=
gtk-query-immodules-3.0
+}
+
+do_install:append:class-target() {
+    prepare_gtk_scripts
+}
+
+do_install:append:class-nativesdk() {
+    prepare_gtk_scripts
+}
+
+do_install:append:class-native() {
+        create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
+                GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixb=
uf-2.0/2.10.0/loaders.cache
+        create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
+                GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixb=
uf-2.0/2.10.0/loaders.cache
+}
+
+PROVIDES +=3D "gtk-icon-utils"
+PACKAGES =3D+ "${PN}-demo"
+LIBV =3D "3.0.0"
+
+FILES:${PN}-demo =3D "${bindir}/gtk3-demo \
+                    ${bindir}/gtk3-demo-application \
+                    ${bindir}/gtk3-icon-browser \
+                    ${bindir}/gtk3-widget-factory \
+                    ${datadir}/gtk-3.0/demo \
+                    ${datadir}/applications/gtk3-demo.desktop \
+                    ${datadir}/applications/gtk3-icon-browser.desktop \
+                    ${datadir}/applications/gtk3-widget-factory.desktop \
+                    ${datadir}/icons/hicolor/*/apps/gtk3-demo*.png \
+                    ${datadir}/icons/hicolor/*/apps/gtk3-widget-factory*.p=
ng"
+
+FILES:${PN}:append =3D " ${bindir}/gtk-update-icon-cache-3.0 \
+               ${bindir}/gtk-query-immodules-3.0 \
+               ${bindir}/gtk-launch \
+               ${datadir}/themes ${datadir}/gtk-3.0/emoji \
+               ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
+               ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
+               ${libdir}/gtk-3.0/modules/*.so"
+
+FILES:${PN}-dev +=3D " \
+                    ${datadir}/gtk-3.0/gtkbuilder.rng \
+                    ${datadir}/gtk-3.0/include \
+                    ${datadir}/gtk-3.0/valgrind \
+                    ${datadir}/gettext/its \
+                    ${libdir}/gtk-3.0/include \
+                    ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
+                    ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \
+                    ${libdir}/gtk-3.0/3.0.0/printbackends/*.la \
+                    ${libdir}/gtk-3.0/${LIBV}/engines/*.la \
+                    ${libdir}/gtk-3.0/modules/*.la \
+                    ${bindir}/gtk-builder-convert \
+                    ${bindir}/gtk-encode-symbolic-svg \
+                    ${bindir}/gtk-builder-tool \
+                    ${bindir}/gtk-query-settings \
+                    "
+
+GTKBASE_RRECOMMENDS ?=3D "liberation-fonts \
+                        gdk-pixbuf-loader-png \
+                        gdk-pixbuf-loader-jpeg \
+                        gdk-pixbuf-loader-gif \
+                        gdk-pixbuf-loader-xpm \
+                        shared-mime-info \
+                        adwaita-icon-theme-symbolic \
+                        "
+
+GTKBASE_RRECOMMENDS:class-native ?=3D "\
+                        "
+
+GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
+
+RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
+RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
+RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland", =
"wayland-protocols", "", d)}"
+
+PACKAGES_DYNAMIC +=3D "^gtk3-immodule-.* ^gtk3-printbackend-.*"
+
+ALTERNATIVE:${PN} =3D "gtk-update-icon-cache"
+ALTERNATIVE_TARGET[gtk-update-icon-cache] =3D "${bindir}/gtk-update-icon-c=
ache-3.0"
+ALTERNATIVE_PRIORITY =3D "30"
+
+python populate_packages:prepend () {
+    import os.path
+
+    gtk_libdir =3D d.expand('${libdir}/gtk-3.0/${LIBV}')
+    immodules_root =3D os.path.join(gtk_libdir, 'immodules')
+    printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
+
+    immodules =3D do_split_packages(d, immodules_root, r'^im-(.*)\.so$', '=
gtk3-immodule-%s', 'GTK input module for %s')
+    if immodules:
+        d.setVar("GTKIMMODULES_PACKAGES", " ".join(immodules))
+
+    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$',=
 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
+
+    if (d.getVar('DEBIAN_NAMES')):
+        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-3.0')
+}
--=20
2.51.0


