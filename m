Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499D0C28B28
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:05:59 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.130])
 by mx.groups.io with SMTP id smtpd.web10.49556.1742209556295276925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Hibuli8R;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.71.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fo6G0JbYQJGDgM6Ur81qLjD96q9lfQ53mP0+oiv4+oevHcHKlM9HG5PDYUi2yXL+ulHPia9tp2HbxRaGnndd0xNsGpL464U5C3xs1ACCqPWA5fDAhB6r/TtwrHtOxTlqQXsVh2OJ8349ylxl2UG53vh9JCI6u7sOm1Cnrnhzwbe9d3yrmdh0kCUpreu9Wt67+8bRAEPP17OHVWJE8AsN5uxnCYnOUUoIYwKTe0T7Iha7WubstDW5RnU8UvYeqSvRwIaxJlKl00dXI50iAnlVIH6hh7Eivbtq/a+vQzS361CA7X+Rq9V06gZbv74cbUeWPeI5dCVCZ6+ccISHvPFp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YYj8M6Fww64vnRyuqlyWv9/XaApwCLwHqL/pFws8Wk=;
 b=WtepicqPK1dtWLV9HThSheu4ehrVAA7vjmb4Q+FLFaI6Z9R5o/ABO9g5fPe00XqBkn9I0UeGtNyb2E8AWhgYO6bNBwcAIKzD7CAhYrP16z8YhzYzRZIrlAdOBCVrZP4MmiGuy26S5il7iEy9ga6isDwCynXU/3+N2KmtIJ0RxNfoQsWl41Xu2VE/CGoRalujxplb/Bov6pxYC8KCSYyt0FOLVEC5rlbpUZZfdRWOGEbrfTeOPu6wColHfJRTBWUzoOu3tehIpLHtOg23AVkaCUEH17Ym9BX5w8fy9KB83gvYknawMdyaL9HgyJmm8aN/bKru0sPRy57jfW5RXUFpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YYj8M6Fww64vnRyuqlyWv9/XaApwCLwHqL/pFws8Wk=;
 b=Hibuli8RCRLR7B+uahd9WLg7aYotlQPPsT0RczVO+W143o0GB03NRyhLCCztn+2lojub87e9WojCwt3R70vWJUfLS48gPX0lYxXt/DYfJ1y/FOj8Cy3/fQ2vfPGobCUqwODmoo7V1Bz4+kmjGEcNpsWaow74ERqNRQ0Y1trD2D4s+nnhffEFY3mM3mgoFBQ+JQ5WioowakKFgcE9hlo5zhW5bH5/T8wD5gKWJTZ+SIB8lv8N6hbG+koCQY+TmW9cBKh1wZiyd701f1xBwhU7BP/1l/QstCe0MQDMrBAn1dHzqbQryrqHkNOIa5OVe+g7oI4JEj74DaWWqFSi4VQi6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8485.eurprd06.prod.outlook.com (2603:10a6:10:36f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:05:53 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:05:53 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Qi.Chen@windriver.com,
	raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] Add VIRTUAL-RUNTIME_dbus variable
Date: Mon, 17 Mar 2025 11:05:18 +0000
Message-ID: <20250317110519.1562513-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317110519.1562513-1-niko.mauno@vaisala.com>
References: <20250317110519.1562513-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00007A87.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::614) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb70820-5781-4ffd-9288-08dd6543af65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P4UtMqt68++SqQjtjiR3tIukTX6DaUzxFpnP2e4MEojkgdcYlSFboJix5cS8?=
 =?us-ascii?Q?01ZpoJ3LNnavg/Nzt3N32QGY1uvhJl9GgzDu+PlTa+Xiu4ZDrVB3s3SebkMR?=
 =?us-ascii?Q?raptlTuQWVpUU8+t9LKTDRmy3MCpGGjIHCmeUQc5CNCGHzjsJTu079lkSKmb?=
 =?us-ascii?Q?Iqae1qVOu3WQMx+SiqOwjHjNMmezPIYVUBCrhxjxpNfxZbLXTd8wfv+l5zeg?=
 =?us-ascii?Q?9jiPavT6q5nXr3wgyflh92tiyFwZQLRbzFXCTXMlOm/x+V6F07s/qu+YuEef?=
 =?us-ascii?Q?JPXC5Bb5s1+ARzxY8R1id7sfM4+0ciVSt4jpW+xBbjAfl4ZrnajuDTpZZCI/?=
 =?us-ascii?Q?JW55u7CrQFD0HHqLDPFDZ/JpGsP4D/3+nb9/JlogIbmhNruDb3gCKkhHJn7a?=
 =?us-ascii?Q?+biamqatWmeoICPyZH11qoCE9yojsH6itHp7R3+IWCKrvfu3zvpZ3e13IjP0?=
 =?us-ascii?Q?HEbs5JiCiYG9dUvmU8yLRuQ7wWO4HuJ44Ej4P7RpjbUeTjKOXnmXVqb/qO3d?=
 =?us-ascii?Q?BqQ+xczigRQnkVh+fiWTWEdVBqHfUTqGMY+M/TLjywuQo0xYz38QTfcAX09u?=
 =?us-ascii?Q?jMiREGXqZlBiwN/D8KnpnU1E9An/LfLt0aS/J89d8QklTC1ql1lLXP2zmq5o?=
 =?us-ascii?Q?H+1/+cUqb9g2u5u6tK/p/EGH6m5PnxeaEhKN98ZSTEL/+SxcQxfviOHZOkrr?=
 =?us-ascii?Q?bXJQ9KePupphY3D1GIt7fBeDMbG77LGWREAsqu2KANQOlQDZoT695WnmiC8l?=
 =?us-ascii?Q?ewgeO9091btOXelXJISGE7L2O+iO79Mo9TVzPm3vKUe9A8hPRQyNSmiIaDhn?=
 =?us-ascii?Q?YmoLR/dk0Q5Jogw6zS4bpFkQm05ggHtesRelhG53BfrIMdWkjYatExK+vbYz?=
 =?us-ascii?Q?yyZIBQq8rS4/4dTVlFbdh0zLdoklWINPfApiNx6UlZ7z0akwQCoP4orez+FU?=
 =?us-ascii?Q?jPNyVnigcdmSlqv0RnGYezAWok+4mGNBcZ/S5gyqal5SGHXsgZg5FZWOWHRs?=
 =?us-ascii?Q?6iiOGF6hMK/AkKVmpf/XHQmBqC0eCZ32N7x1XJwpAJs8hVnAWYxNA/oYp8xm?=
 =?us-ascii?Q?a3psjyLvpnZ1YUsJA7qiAcKzVDp3TeUFnyNGJKCkcLF8KGw0jWvggKTCnC99?=
 =?us-ascii?Q?Q5clzEEIu2msDxIJwu77fTC/582TT9EraxhN+oeasaZC6ZqRz8KIR0ORCcgf?=
 =?us-ascii?Q?j1X3QuvW1dXEFmfEHOJBsy08fJN84GySF0hz1pHKJT7dyQsinA3J/RgwYiO1?=
 =?us-ascii?Q?gQ3ANOkleuiWoKXLKO71xdr3ud1eE7zu0nOveVMZMmjNjR43HnkFn5qeqtnq?=
 =?us-ascii?Q?5CiMcAfrsNdzq1sG/BbGyPr1IyEvFRxbdnk+uNVcvwHW4qvtoctp1kKVFjSC?=
 =?us-ascii?Q?vcKszIfVQbDqGziB7sDALp85FuK27nMRI3litB5aZNXUdK7vLuPH7Cc55nZJ?=
 =?us-ascii?Q?x1D0oGeNCE/OZWhGTneRqRaR/XcAqzd7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KLp2U5Y4eC0UV+OHVcuOmCojyNwXUyrusWZuk+O9ZTH2ynQN030W5bu5fW1k?=
 =?us-ascii?Q?Nh0dxXYhZo1rXoH4+EubQWYpGECqSkQV48X1x2byU+sF6WN9WF/p8D4XUzew?=
 =?us-ascii?Q?S2nUXPCZ+EzsWuw9GbjUzEYIfUWDMrDYL2a/+5lqs/5goMH/7metmusm55AA?=
 =?us-ascii?Q?N5Q9abuVT8SU0NCi6pVGNsAHaSw/AqzR1yhbN5I0M9TUpFLVrE0aATBasG70?=
 =?us-ascii?Q?Hyp/85LDCOj04svsZyaSrVcnyQSi7XyA+gQewI0Gdm1lAQPJYdwUSa7viohL?=
 =?us-ascii?Q?Ii5HpeJhjzm3XK3qAF7XtXPShBlo6tadoXz9+m0cvm+cnpv7riSgeXK2O2IO?=
 =?us-ascii?Q?aQCtLL2VfELY0jH9TkT+t36Gf7Bmh28w4y9nFT8Yf3g0nh0E7rBe1iO5goH6?=
 =?us-ascii?Q?83zK1IvVDFrdgqnNN2xRurbck4RmW53FMdE4fZgKsgjeMA2pmQOhkAKIAoow?=
 =?us-ascii?Q?3Vfu7KdfEFQbKyK7wnXWTh9n9M+dNYSs1gJmGMs4IsiqgC1o+S5AcGNiA1M1?=
 =?us-ascii?Q?FJTMw4VoOoH4KkbxOm9n7ODlhY/N0mw520C6hwoHRgVREGuF4Mo6/F4oJOAk?=
 =?us-ascii?Q?zYovmj8obiLpjv3uqu0wn0688L4sf62pXeDmrRs79udjCGc1hRb5e1NrdyyE?=
 =?us-ascii?Q?/jc013PyAu+j85rPObfxPafCgwOTcWRR6PKnbpR/g0eEH+qeoTsh+HpOyApl?=
 =?us-ascii?Q?P2GwotqYYlLAL8b4BaHDP/0lud13u7HjktNmYko+RvO8LdqVoBtkoDOTz4t0?=
 =?us-ascii?Q?TBMpvtyd5uIH2ym3my/FPWCFAuRsN/wwpFGvMto+UdR2x7TYf0i0kkcgnHBW?=
 =?us-ascii?Q?ipPoYqE2NqCba4y1izxZYs5DGWRMbXFQycvdaS3VMZsZRQCQG+Qc1j6RSbsH?=
 =?us-ascii?Q?eTBk6YGiMeZwCLIo0LhfR0PSfvnnvTO795/MVUqsONKTC0WRAAzzE0h89p6m?=
 =?us-ascii?Q?lNUwfIwVf0Nc3mkrdiabkbsbUF0KskbfiHCLMhCwlg/ophFUNHrH1owNbLxa?=
 =?us-ascii?Q?baj+D6JXv5o/OlCrQC9K0Sqcl694Dz0spca1Chyk0T+saVQZLfF71rl2xL99?=
 =?us-ascii?Q?D4LUIr0Gt0utQ8XzdTRtf+1Kxr3cMfesg45wCZDZmZsQH9xsAGqWCSTO6fsV?=
 =?us-ascii?Q?FS5Ypl/uVZBn/7Dabe2KRRbdwwkD3sc/nenFh6Qzq5qFie9/20WhFDqOtMC/?=
 =?us-ascii?Q?tSgkX+PGoJBidBIm43biufgTWIIPiJOkF6H18mCnYlNqTKDBjqbwXUJTjuPx?=
 =?us-ascii?Q?y+P3lIU+aYzoJWgxPHpdXTCj5itkrj3eKDBZPvI/O8rEQ9kPbZZHVMLmrE7n?=
 =?us-ascii?Q?2i25SoB8NxmBqwWFp45P+w8Uc7Zn9bCjaKwnS1KccCrpxXI8kyKhvn0G0/+q?=
 =?us-ascii?Q?WXULjkgxz/1QzgcWulezLqd0BYsiz5G2ig9fVi7E5Y5ouY2NNxrAp4l/9fRj?=
 =?us-ascii?Q?izIinsHuUKPKNVCRgTRVdVxVKhSDR2X+IhtEWghy9LdwkHEmQzBz7HQDRRuO?=
 =?us-ascii?Q?tlWNLsMHs1qjVdnTt6HucWeYQ9RecfowDNFepdStTDRvt36fjzfkC1KM1me8?=
 =?us-ascii?Q?FdL/aRVJdT+rDsu/QODow8MTj4COo9oQxBg84PjX6nzO2YlNEbGj4Hwnlp2y?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb70820-5781-4ffd-9288-08dd6543af65
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:05:53.7486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JR933zJauNStsJmK6d7c1ldnKLgFj3U3opfyoY3tgNZTCnqFL5BWjlIbL7/FZLuPDaxKH+0yeY6UHiZk5xvc5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8485
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 11:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213071

The default value of this new variable can be overridden for instance
in local.conf file like

  VIRTUAL-RUNTIME_dbus =3D "dbus-broker"

to use an alternative implementation of D-Bus, recipe for which is
currently available under meta-openembedded/meta-oe/recipes-core/dbus/

The functionality is accomplished by changing references to 'dbus' in
recipe RDEPENDS and RRECOMMENDS to '${VIRTUAL-RUNTIME_dbus}'.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 meta/recipes-connectivity/bluez5/bluez5.inc    | 2 +-
 meta/recipes-connectivity/connman/connman.inc  | 2 +-
 meta/recipes-connectivity/neard/neard_0.19.bb  | 2 +-
 meta/recipes-connectivity/ofono/ofono_2.14.bb  | 2 +-
 meta/recipes-core/dbus/dbus_1.16.2.bb          | 4 +++-
 meta/recipes-core/glib-2.0/glib.inc            | 2 +-
 meta/recipes-core/systemd/systemd_257.3.bb     | 2 +-
 8 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
+VIRTUAL-RUNTIME_dbus ?=3D "dbus"
=20
 #
 # Default recipe providers
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index d31f4e2295..76d8d9ccfe 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c=
09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0=
e09 \
                     file://src/main.c;beginline=3D1;endline=3D24;md5=3D0ad=
83ca0dc37ab08af448777c581e7ac"
 DEPENDS =3D "dbus glib-2.0"
-RDEPENDS:${PN} +=3D "dbus"
+RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_dbus}"
 PROVIDES +=3D "bluez-hcidump"
 RPROVIDES:${PN} +=3D "bluez-hcidump"
=20
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-c=
onnectivity/connman/connman.inc
index 133e8616da..fa546ee872 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -119,7 +119,7 @@ RPROVIDES:${PN} =3D "\
 	"
=20
 RDEPENDS:${PN} =3D "\
-	dbus \
+	${VIRTUAL-RUNTIME_dbus} \
 	"
=20
 PACKAGES_DYNAMIC +=3D "^${PN}-plugin-.*"
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-c=
onnectivity/neard/neard_0.19.bb
index 94df1ac3d6..3652d3aa30 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -37,7 +37,7 @@ do_install:append() {
 	fi
 }
=20
-RDEPENDS:${PN} =3D "dbus"
+RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_dbus}"
=20
 # Bluez & Wifi are not mandatory except for handover
 RRECOMMENDS:${PN} =3D "\
diff --git a/meta/recipes-connectivity/ofono/ofono_2.14.bb b/meta/recipes-c=
onnectivity/ofono/ofono_2.14.bb
index 9a91afaa7b..400b5611fd 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.14.bb
@@ -41,7 +41,7 @@ PACKAGES =3D+ "${PN}-tests"
 FILES:${PN} +=3D "${systemd_unitdir}"
 FILES:${PN}-tests =3D "${libdir}/${BPN}/test"
=20
-RDEPENDS:${PN} +=3D "dbus"
+RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_dbus}"
 RDEPENDS:${PN}-tests =3D "\
     python3-core \
     python3-dbus \
diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 9475e55b57..0160f403a1 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -104,7 +104,9 @@ FILES:${PN}-tools =3D "${bindir}/dbus-uuidgen \
                      ${bindir}/dbus-update-activation-environment \
 "
 FILES:${PN}-lib =3D "${libdir}/lib*.so.*"
-RRECOMMENDS:${PN}-lib =3D "${PN}"
+RRECOMMENDS:${PN}-lib:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
+RRECOMMENDS:${PN}-lib:class-native =3D "dbus"
+RRECOMMENDS:${PN}-lib:class-nativesdk =3D "dbus"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool =
${datadir}/xml/dbus-1"
=20
 RDEPENDS:${PN}-ptest +=3D "bash make dbus"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 9d50a95c40..67860ddef0 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -162,7 +162,7 @@ RDEPENDS:${PN}-ptest +=3D "${PN}-utils"
 RDEPENDS:${PN}-ptest +=3D "\
             coreutils \
             libgcc \
-            dbus \
+            ${VIRTUAL-RUNTIME_dbus} \
             desktop-file-utils \
             gnome-desktop-testing \
             tzdata \
diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core=
/systemd/systemd_257.3.bb
index 64fb8fe69a..24aad11c0a 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -752,7 +752,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/inter=
faces/ ${sysconfdir}/rpm/macros.systemd"
=20
-RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck uti=
l-linux-swaponoff util-linux-mkswap"
+RDEPENDS:${PN} +=3D "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-li=
nux-umount udev (=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty ut=
il-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-g=
enerator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} +=3D "volatile-binds"
=20
--=20
2.39.5


