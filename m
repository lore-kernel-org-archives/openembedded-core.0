Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9D7CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15256.1762154834368359678
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=2+BNz6qF;
 spf=pass (domain: navimatix.de, ip: 40.107.162.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbx05rDIeT6N9zERd6Cv2c2TlA8Ao0JLx9rjTjiHrAgv7+K4vjT6vwZAzZzzTtIUfagtX4vghTqPxgEweg7QXYX2/NdroM5XbJon6xjlcRta5jvyu02t0Mr1Xe60kWJEGAatwVs7/VXcuEDEfa/z9rsKv1qYK7I7/EohcAj+e6bwenyaXafLyij7pKs3NE6OOFT5tfvG1v664WvIKnG/aHA5e5aKFfRcLeC4to6iooSSOlInRdETflgMY1k+PK/6YVdYXKLEEw0N//kxJdSoqBIz4JHouGdY976nvqbf0Fx+od0ciOwwKeaxksjFiIqW8BYBsFrPCBa5dQTQpLpGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPNm0X2omhCGt9oX6TZX30h6riCwq2+h23eRRfhQtgE=;
 b=xgJqF3e118fzEMNs7fUwAF3m08+IEZFPRKnUxL4lM7RoTebLWkwXSYL/5IJqszuIyABrh195uyPGFzA9QLRaopli5edNmmCDjnzBwfwd0ZsFUf3P0IjZzO61RpK7dfmp8OyAJRGrKHCFsFAICMlvHTSEojf6mxDvR6KovDLFqbGJ9UNqAG18YcjjYb0TFZddZqcxpkiSaJGb0diZIvUtGKtRu7rYdTShbk7upVodOpHPr53QyvIzpBOG2F+3E8JmSeO1g/Ft6oGov0gWq8uYfvfH20JN1DYls1UEwYMCOW6YjrOCgZib4lpwbzAlth122zm99LWHUvh3dUEZyCsWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPNm0X2omhCGt9oX6TZX30h6riCwq2+h23eRRfhQtgE=;
 b=2+BNz6qF3IKj4dLbY/7fkAasvfHXG4Gip9VvCZ0zmUL5QRao9OEUwF0swxL4lIOGNIYjNPfknjGN4f/TQEixL9xS6up3TdrIfXpBmLUGr9H/QHb5/Lv5J03xWQggewsfdc1wSe8p168eJZfre6WEbIozyXgITkFt69VpgIBcvo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:11 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:11 +0000
Date: Mon, 3 Nov 2025 08:27:10 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 11/18] glib-2.0: Convert to gnomebase
Message-ID: <d6d1d79075e8bc32aea6af306290334354539a7d.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a547ab-36aa-462d-d139-08de1aaa6728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1CGCpC9CovVgBI3+zonotub3XIoSDkc3r0QxqYOhQF+F5Dsg45PMQyuaOi54?=
 =?us-ascii?Q?0fmr2wShgX9BIlRfUr1cVksG1SCLyt3GGkHlOycMVsCGcGff88ochmBzKk2O?=
 =?us-ascii?Q?WLJVMYix/CH9z7HDpwrhhXBpKUa9hBSucma72dczboIvxixbhgvJ9lwWch1U?=
 =?us-ascii?Q?x1AvcF5WtaNf178zq8bF8nlgVNKXPtgYnG0I2swj5I+baQwerBSQ4pRDbYif?=
 =?us-ascii?Q?1fWaqX5qnqhYFFe36gtLFY11aoBjzenfQHmB5c1fnaoi7xl95RhHjTqt8mAr?=
 =?us-ascii?Q?9QzKt0HwCZXU6TZd4nxTTBwJ9XpX7X9ZvgzGTvE8OUGU/rd8a+lqJisl/zrO?=
 =?us-ascii?Q?YElCxsPXCHjnhTfjb8XcL5zqM9EQv4aOnaHMBnY+CFHC6sXIXZJiUpGIap2H?=
 =?us-ascii?Q?9aH0wXpf1F5w/mwGxdhkrpilLxWaqdWtp8uiz0JC0VAylpwervEfzhPrD9zm?=
 =?us-ascii?Q?2vQTAyxiy0I+3FFvE+XQ9sP8/apRLXTTmwR8l8Tn9xQVUmD6GdXStwK7W1f1?=
 =?us-ascii?Q?41KWemZ78lcM7HDsLS53C11xUneiyBdIowfzMueKjLX08W2SjSUdpFMeFGRs?=
 =?us-ascii?Q?c1+3tgGMoEA8RTCItHooFd2hvRHinB2KG5vYlRM9T/9rNi4zunA29pwtI0Y9?=
 =?us-ascii?Q?uIUAWeH3QPjPK/du3cuRy2tdWRGfEg3xusNwvfhO5ORwzA+Y+mtJSd1UwIlm?=
 =?us-ascii?Q?uEidxIvxFwLrdpJPyDq75SIgtPps0wckabkwt6Q+XlgiygmdLPqo760V0zBO?=
 =?us-ascii?Q?+QUe0h++doGkzGvZ8oAgUgSIMmhdnWyCzia1RhC0bfwEy8NmOW5TRIDTVduG?=
 =?us-ascii?Q?MuhELpSIEKE1pQ7IKqjIk1Xe3CmI8GTHLfZqAlYqGiTC14fU0W4RxBKG1fo8?=
 =?us-ascii?Q?qqYs8EeK7/2wJcS8208ujlxyBpPDXciMfZKztlJTQ8E1+qfNqZTAoH5McE9Z?=
 =?us-ascii?Q?UJEPuR37mHCINs4f2Kiwfg8Jgd1Pqe6JuSQuqsJReJGYF7ZaX3W34wMWIwWM?=
 =?us-ascii?Q?DF1FyXK1dE00HXBJJcJUCA0e0Xc9DF0as9CH37FamFgND9ykL0Y1IdNW/MoJ?=
 =?us-ascii?Q?pR5pBfHMr5QqVMg3bBwrP9jgOELqZCpGISozPY7dXLTb6fUA7JgPcAK5kAjn?=
 =?us-ascii?Q?9MmgJebROrOlzu6hFbDo0oQIXgogzwnex0tDoV5Qw0w2jjmTg6yWGqGvqKZ1?=
 =?us-ascii?Q?8BvCHn8+qZAR88+UwD4IUyc/Fu2rMHao7FgsBSeWtDiQ7cgeSmj7UWKOCzxw?=
 =?us-ascii?Q?EAaUi5fxkMTaloGmVaOqDoOyBKH9+mdcv6cfiaPN66s61PZSwKS0FzX8lzw/?=
 =?us-ascii?Q?gCd5F56GTXsrk8r4y8Ll+lIJnuPfD9UyEq20gMbtPTB29uhIt3GaaLungJNt?=
 =?us-ascii?Q?ZdKryf7nzrF6q4Ilbg2M20cQRY/x+/tTLHpG4fNyCkunAe3aEMoi5KiTKipi?=
 =?us-ascii?Q?hQxP8B3hezrNZEDrOuknOxLIq2OO9a+w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S/0sqAdXp6+FuKswE4JCMzlARbwgebqKUmD834REBZibJve3B7jKYPs9T7h/?=
 =?us-ascii?Q?nuVqj5CjCQoqRuzMYvc2NZjv6c/+MSyBVfeTMN/xeBM5XcBjTskIrXVkMjK7?=
 =?us-ascii?Q?HbwdmCd2rwpltZfMGYl6b2rtMl/q8sNc9qxiEWuRBEL3NxfB1S+mXeAo83ZH?=
 =?us-ascii?Q?e2DHDyMUE6x64ffDvP+ZBB6LiK04XEqxARqi2/StWb/RvNVwQgkzD0+AbAA6?=
 =?us-ascii?Q?V0muooDC4Z/kA1hog6N8jzGhbgmNctYHSVMQacdkhVvCRNvbMjBLhjyuhzFf?=
 =?us-ascii?Q?t10cVKnIx6wzmlS5udFK0DhQSQMuiFSzoPdFbuNvptLDvyx9tLU91S3IyIJX?=
 =?us-ascii?Q?iteibZTGTB8z27C40aN0hvLFUYiYrkiOookI/v4MaQEMmWdqtgYXf+eAUWQR?=
 =?us-ascii?Q?5S9qfc2vhuooMmmiaqxU6U4otDTgXHf8uyjG6Y43WPv9IlGr4TKYGIO1hehE?=
 =?us-ascii?Q?SW9K/re1MUPQ4lcW63MoHugYqzHLOfDUH8Wo0NK8+bi8SRqTPpN9SLZxO58v?=
 =?us-ascii?Q?C7m9sQJKizVWbbnaueXCAGzJN3L2al+MsHVzryCS6qKvdP6ka8EyNzS9WzRT?=
 =?us-ascii?Q?GtlaNUY81kz/oSU8CDJLMvcKv5NvrzzaibZBqXQjdEGy0OWUXc2msF0r4yfs?=
 =?us-ascii?Q?H2PqRWNes4X7WEzBBmXl1RaSw1IZ5jeX4k0QoPB6q5d5z6+NNZPzlvuDw/OQ?=
 =?us-ascii?Q?2wrYXfFtfwC8nMLmQx7xjjuM3BaOxC7smCDTHa9GWDXSaWPZRnoS0cSOul5q?=
 =?us-ascii?Q?mZISFfmA0voWMZYE4by8OYHMtTMsWp+meLEg2HlUvXKUkpTuRuc9BQ5E+VRM?=
 =?us-ascii?Q?khd75FfwkMjZPxK4+TtCzGl/OL2yC3vhPGMq7bNBlLj3tu7/RlzI/WziEMUX?=
 =?us-ascii?Q?s1JKH+dQ2FzZTBpx+ngOE2YIWZrPN8O3rHM70tFMZBy15HGv2ESms9gVxiEX?=
 =?us-ascii?Q?N2OMrqJH7/TxajPbRcyiBuoTkcRd6imo6NR6D7qZDWw+j31GGdwNOJXyOVna?=
 =?us-ascii?Q?eey7nx1ryQy7lWassb6ZbTOEPjQM8wrhcgyti8Cxu3AwF8zv2KzTadIL1uok?=
 =?us-ascii?Q?ZJUTOq39n2E4G6HhIFvn8pyP32rC4yza1K0l0qsPpDwbdLfBZ3nKlQSVDQfr?=
 =?us-ascii?Q?AW1r8drdn9Qo4T5chpvvCeNlQL2RjDQyb6gxsGqD50Xbw3Q8ACn4HvVdZ8/w?=
 =?us-ascii?Q?GX1vbwAd+U83s/yC386mQxHgyhQtM27QH8nAD4TsrDOIFdPQm+gqig/UXfM1?=
 =?us-ascii?Q?eRnmaCtxqckLOT5Xn2yuEFOhxIWYM4CmF+4dDxAC1kmTMsqYz8M8+SK8Tl2i?=
 =?us-ascii?Q?H972roAnZTe4YCvvaaEDmRrhNw44OuRGilt/6rn9EZPFyqR3IyO8LDcNpCnq?=
 =?us-ascii?Q?tRjHceQ1UBmzRdZQOhs/exGmNnX+xTfhrElDydOkmPpGQuwAY37BLAgBzPQ1?=
 =?us-ascii?Q?MmaGS1Yt0E313KDTnjrprAwtUb59ntnHMej23WHdQrQ6bVTQu3KdCke1+BZy?=
 =?us-ascii?Q?lZ7U0zGlfXqbDZ2TQwnHZxy39Br1aS2/haVgQcMTnTo4qMVuJz+IQlZ4CykE?=
 =?us-ascii?Q?Hw+G0wTAt578Pl3ao0kdwNWpiP9B2u6TzXHD1Wx4aQOdmtlpqpteeD4y/qoE?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a547ab-36aa-462d-d139-08de1aaa6728
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:11.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMzCONFUJeOnMkxymqQmDxhBkp9L8sSleJavEP7imNQmMGTUlmSijM1Ki9TXYWZgC2XjVibuXoRVVk+dDbepa+1csR3ZAEMMYWovZnrg5xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225602

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index f9cb3417ec..2e8dde2820 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -28,9 +28,11 @@ PACKAGES +=3D "${PN}-codegen ${PN}-utils"
=20
 LEAD_SONAME =3D "libglib-2.0.*"
=20
-inherit meson gettext gi-docgen pkgconfig ptest-gnome upstream-version-is-=
even bash-completion gio-module-cache manpages gobject-introspection-data
+GNOMEBN =3D "glib"
=20
-S =3D "${UNPACKDIR}/glib-${PV}"
+inherit gettext gi-docgen gnomebase ptest-gnome upstream-version-is-even b=
ash-completion gio-module-cache manpages gobject-introspection-data
+
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 GIDOCGEN_MESON_OPTION =3D "documentation"
=20
@@ -219,9 +221,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
=20
 PE =3D "1"
=20
-SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
+SRC_URI +=3D "\
            file://run-ptest \
            file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schema=
s.patch \
@@ -236,7 +236,7 @@ SRC_URI:append:class-native =3D " file://relocate-modul=
es.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d408=
e4d1faea580d6d"
+SRC_URI[archive.sha256sum] =3D "b5739972d737cfb0d6fd1e7f163dfe650e2e03740b=
b3b8d408e4d1faea580d6d"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.51.0


