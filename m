Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921E4C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:02:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.81])
 by mx.groups.io with SMTP id smtpd.web11.13335.1743174120694761555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=t803deFs;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.81, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywwnHZJGO9x1mJp/orP/RWNdG6E6k3HRh2RLL7XP1uQMW3cGc5GUmDw+cppaXRgWrK72UxFX11yGDqn8CrBxtW1uwJw5226SVfWnlfj9rg2f6RJy7pe+Z4fuLCZ1e2arGx1r2bTJRn762J9Y76zyfoLydEOVXMEnY8NDdOk3n9J0u6XrlEj4f0rqXbGON+MGbzpcfoWe8TTNZHgaGjcuN5iyCox1tgnWmmDs+hL5iawvn0gK4qhjrY/DdX8AD1TWq50DryPIWVFyi+pJzx5vlKzIw/rZKN8wNVpimsMK+IGgSiwPcQmZfMoKI8I0tRnks41HoW8J1RD071xWslMB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1rhWWMztVuUbvUj4lBGeL7LWzZe4rUzVNVVWQMcxyY=;
 b=euebR4Idf/aHXcZDSF2M9v8Nczc5iXJZy1BgBYxGmjNL0qapYbclLIJ2Ll4QkyJqHM6lDqm66j1iExySCdfHtDVPeOrPlFcrNE6Ug+9m8RjqzItirLD09BvTpxkZxeTEFV2utWl0Kz4IxZPVcrM0/+wpFZcknFKVVhQkXrSD9Jh/tqD6Ciht58l1dL5fbLuZMzD0YOjrirWPCOkgneRsrFCIfX56lAN7Rj5BN3Czb5D/JJh+t3GCTLuGrTfgbMqxBp5CNejOIpIoIrVNqpPHz6jlJTwfG4KMDtdSvOKX5QAbbWb3IB0kaCWPD8aeyV/kM62TCm0XMCeYs2MUFV1tAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1rhWWMztVuUbvUj4lBGeL7LWzZe4rUzVNVVWQMcxyY=;
 b=t803deFsFcTG24ar1bNqVASkrEgJIRmYGjTvCxnhBJz4WJuhP1OLDkEehzGFZ4c0MLdrprQZZm/1FbfxZgfyQBxebEKVmwR020d8fv5IsLqjfsnULt43FTs0ew6+1iA0BzbyNriR9VhgFIc5mRoj2n+FFhdoY1+3rvLNLR+hbKE0+6wjg/hVmKy7HWfeJlnsagzJuIcbLAFyZJ5ZttuIprv8vun6iJCCaXGDu3UruSNYQoz7S/v7KBoh/5KJE9Dfqo3XsfmAUeEUGI6n60zp+WE9yvqA6LMFDMnxRUHDmiGHHzCfjaRwDEwB5D8ClEpiJBMNYg6k+WcZ/A6qZmAD7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9285.eurprd06.prod.outlook.com (2603:10a6:102:455::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:01:59 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:01:59 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 6/6] recipes-connectivity: Support alternative runtime D-Bus
Date: Fri, 28 Mar 2025 15:01:36 +0000
Message-ID: <20250328150136.1855862-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328150136.1855862-1-niko.mauno@vaisala.com>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000045C6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::43b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 575b9bcb-bdfc-4a90-090e-08dd6e097d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DsAM2Ro9kImvZhhYZbnANw2uwRvsJTjXuMoJTHGZfcvt86Zc1wZTMh4XNjTB?=
 =?us-ascii?Q?Ko6E2qI0GgBLb+Fnj0N6VaXDBPCrL72DDY2xP09fmvsMuj94CzahlHWX9Mt9?=
 =?us-ascii?Q?3OHQRMqN3aN5OW4ktj0CkltLO3jAwGl1UQArBCmHDrX61Oap2O2CFfbT56mz?=
 =?us-ascii?Q?VEP4MK06RWj8BrbkzqOquTMCvnb8n9s4SmsMctFDCVxWvBsI3mVA6Q/GhG+n?=
 =?us-ascii?Q?VAje/mEzoGzDK+XD0RtcL3xQtaXrc/O7T1tdwf5J07N1JruzYBKOykVBM5u2?=
 =?us-ascii?Q?PzVhvH736DorgqOTcp4rBjdrc2VD8nuqOS7mQS3vKbxashf3HcNOu5ucTvyL?=
 =?us-ascii?Q?wXmL9dfUwwrSkD+BhgmkO1QCFaA+2xrWqrSLTEUS7dtEzN1SM7vP40e6PQLm?=
 =?us-ascii?Q?XaZbSCpUI7HFbKl4T35tGY92cEyy1bsZw4YvXoO5D5qXZKxLns+hwi70P22f?=
 =?us-ascii?Q?sbEw+/1KI5Cn1Ksn7/rVAjKyjfZERKE+6JhUgKRMMYV2ViKwRtEKnf3orVKT?=
 =?us-ascii?Q?pZ1sOaaGoIlzpG9cvGK9jXyhHmHSxbT7jIt2H//bYUZh4itnEAHse8x38zJt?=
 =?us-ascii?Q?YU9WlDjedTUoP0p5aRqZilQBbc0EvF/FiGO6MVqwQ9UKZ8yMjBYGPXxR54tf?=
 =?us-ascii?Q?1j27iaCOZcVBqpPEccx5apKIEQUaQSlMlVc3sYTMIY1FPMLajioARFQhSwIb?=
 =?us-ascii?Q?Xbnqq6coVdhdHMUqm1H3AocmMWH4J13XJ7i9y4rl3ZJSq76vvn1mGmrZ8MMk?=
 =?us-ascii?Q?V6VX7OSSYcIcejbUHbkuUDxRfLB7K9IAccK9uk2/2mFbq2KrZ6eUQrcwWKSy?=
 =?us-ascii?Q?2w5hiwKG1wPsCiooAGOjnI6tptxg4HMBkCkAM5asCzbtG3rs4FxOJCyrtlUS?=
 =?us-ascii?Q?bXNznfSih9eKzikbNVEZslKI4UjPm6ESbH4WbfJ4sETrfb1faYGZI4MAxqw0?=
 =?us-ascii?Q?r7Ev0kjv0UrKOxQSEzfPZwINiSlaBS5Z/bSpG/5viyF5xqo+pLi3AbsW4ff0?=
 =?us-ascii?Q?/D1jtyU37htKBYzbCCAlzCuzL2iTV9xKjrV6koqyZZcSuPz3pVibXRlvQI5o?=
 =?us-ascii?Q?D02qmzM00Ke4Dx/x1smfVISzwv93E+Ph5+C/esOODOK7THFndZ8PQkOcmT34?=
 =?us-ascii?Q?U1Z/8lJF6NaKqy4EwQlAqXW1LQYp7t7APMoOhrqJj8B1Qww2vZ0947YnrH6b?=
 =?us-ascii?Q?Pu84V49yYLkLO8Y6Z1WDDEZY72MNBeRDbFzvr6gwWfK4Wta9i/qXdHv6juHP?=
 =?us-ascii?Q?mmAchlkZu8M4S1sjRTqbPI7M64p+fEjHFg+t8L7CXaQfxDnjn57AUWuH34rM?=
 =?us-ascii?Q?C2Tzju5zgdi6IX/riIQW9rqq6AFZ9Nuxhl6ytif9DmIU9ZGqNOPFXBJbFlM/?=
 =?us-ascii?Q?BEEVbq4wm34K7X7d3CH74DZLoeLbHhAHm97hsktfdh3ZUBczPMfZwz87dsZt?=
 =?us-ascii?Q?SU0rWSeQDqcJJV+8OUV1YWzwFPoQH2xfIiXGYGFKgS9y5+C+E3IWTQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jFf6xZmmyDiTLyV/1G08GErD6jXgdcSVyMP/tRyL+Fc0XJSNG0hQMhwB01hx?=
 =?us-ascii?Q?77xHjeNozTiyyLAssHeRlkLcD57AxEspnQPcT/bV9b4z+zptLClOlA3WIOGd?=
 =?us-ascii?Q?DWyjcszAYbd9VMaUWr6B5Izo1ci7Pcp8w5GmefiZ2vSlQzBX6aFntQXZF41u?=
 =?us-ascii?Q?jHYYE5VhAQVNFZaHqKX8FPgUcIgmpoX2nxrtlT0uXlgq8ai2cjM9XMu9JnZs?=
 =?us-ascii?Q?oCpJb6YLfJ4nXYKdUlgvs//gZPyLZhbnOuv553FCKLsqWLwbBPrbtYXqtgvg?=
 =?us-ascii?Q?nlmyR5k4vq0teWQuzTe1yVwHUPSwtdAhePYLSThkM+268KMoGWL9eh1c/mGF?=
 =?us-ascii?Q?dp6ZYq5ZjCg00B0q1V9YNcOQOguUnaZSYzyV6c/C5kEh2gGCJy4B1BSR7A6Y?=
 =?us-ascii?Q?1K6VpEy11YRDfBWq5HzXoGTy6lnH/Crv8Zv2bS91Umheal3gGRQSeK9Ybcuz?=
 =?us-ascii?Q?sEgpxlum/1VtICcPkHI/2AkN16hoxPodugfhxrk/wdXE0iC4qr2Dy0bm04O5?=
 =?us-ascii?Q?3hhNXsLEQOqqH47k5FQvl/uGZPFEM9GqcNTWj/E7tOmE/cQTIWH83iHBQu+p?=
 =?us-ascii?Q?pEmVMBVhKKHa4oDKW+N84LzJV16+nqio3K1bMIgjyGQKPXmu7g34G1VHusFs?=
 =?us-ascii?Q?92bYHnXuq/cWo9R2TvaLRM9EzFBTYRhXfyJrfV6naaJ335dRFt4cetXIkDUm?=
 =?us-ascii?Q?/awuT3pWhjKaFZgxswSumVK6SDIMbAjk4o4MxzXfSN+kZ7Qh4oatmLwW3wR6?=
 =?us-ascii?Q?ovXkeTfYzzSwlfv00wcgWTPC54MHchmc7drYms26migTamhhfjTVyk+KdUVE?=
 =?us-ascii?Q?JfezgsaCjs5XJ6S2yMN0e+eHJJtXxtY9l33QzP/HBy5CX+6guXZu+HauFkXm?=
 =?us-ascii?Q?XjTCEakkOirAfFHSE4dYUe2oYI63UvNwTxdtuwdu9S/Kfr6fZ06I9vLHGVM9?=
 =?us-ascii?Q?MeXV5/45245b9sPjBE7hAyDJbrLdG5t6ls40Cmz4UR5rfekN8W3JyqwtTXmX?=
 =?us-ascii?Q?Rn1dizbyfaSflSPWw/wDPre/tmz6E6wMK0vzakDGI6isJMJf/mWmVWLEL15b?=
 =?us-ascii?Q?VfwZZcC2ViGOLfUg7WYFNlDKcuG5RmUDKbz3ZIgXr0Q4jQWkvv3hZrPP/XYl?=
 =?us-ascii?Q?vUF7gDP32nkSEYwNKJ1Vow52hlqH18Fmn5iG0C0igoberRhW1u7iWythMitG?=
 =?us-ascii?Q?Nrc2mBtn0tnDuefaxOp2KG00n+1jYfm0vQDmnRYc9wCgD48yABkrBNSPcxjB?=
 =?us-ascii?Q?G+zsBZ+e87JERKxHe4RLytZ1W8IZvEH7mAHfMuz3DXOffQ3MFVJC29rIWRtE?=
 =?us-ascii?Q?Zlxuxeb+qwQLVMjwhVllh+1K/6cHsCKpqEulvQZbzLYT0v3C3v8ur5vKJhrJ?=
 =?us-ascii?Q?EZ9IA7ZLTrnnyArFJkxVOzelWcSgwKkZ+fNArRT0tsY0IX1u887pm73l0ek8?=
 =?us-ascii?Q?PPdtLiproDQ+ZcYXS1YATZ2z+e4wOi+aq/ioF/w561mftckNUUgP/5NMOlcn?=
 =?us-ascii?Q?tADuypk9m+Lqktn7wOegQg55HNar7O6NggeobouH6TM5oqEkYKmjRN+Rrqp6?=
 =?us-ascii?Q?JZWNyV5vPzrIYSkIYVDgtjeGtUnYqHvDQU2HNra9gariMgTdfT/UA592A7uD?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575b9bcb-bdfc-4a90-090e-08dd6e097d44
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:01:59.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBFaB3r1/YElEJjjlLGB/S+jHCSWVTWw+DRECPXZtKQpBLuLX2xku3uFOA4E+cb5zstiSt+5s+ogaAlcTdx8Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213850

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   | 2 +-
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 meta/recipes-connectivity/neard/neard_0.19.bb | 2 +-
 meta/recipes-connectivity/ofono/ofono_2.15.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index d626872103..09afd8f7c9 100644
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
index b04187bcc5..6a1314a957 100644
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
 WIRELESS_DAEMON ??=3D "wpa-supplicant"
diff --git a/meta/recipes-connectivity/ofono/ofono_2.15.bb b/meta/recipes-c=
onnectivity/ofono/ofono_2.15.bb
index 40eeb3a086..fddd9b8738 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.15.bb
@@ -37,7 +37,7 @@ PACKAGES =3D+ "${PN}-tests"
 FILES:${PN} +=3D "${systemd_unitdir}"
 FILES:${PN}-tests =3D "${libdir}/${BPN}/test"
=20
-RDEPENDS:${PN} +=3D "dbus"
+RDEPENDS:${PN} +=3D "${VIRTUAL-RUNTIME_dbus}"
 RDEPENDS:${PN}-tests =3D "\
     python3-core \
     python3-dbus \
--=20
2.39.5


