Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCFBC55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:12:17 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11431.1785417129719232724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=na9V5v3O;
 spf=pass (domain: est.tech, ip: 52.101.69.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtZvp2b3qkZH061TVuI1HeI+4UpIIDTQIlftqU9UZ4mNDjktsqT+bLVeW+WQF0F1WvYTopcxyKMT0x/i2fzBulUYI77TKws0cjMXAe5k8qOWP3ENyxQzhRALS+qXhCJ08MlKDVMwTNy0aqxH9G4ynmIwEC2ajjT4kIFlW2zjXeoMnqN71evaukiSurspD6iQw/dj5H89pjQjoii1KpqXJt5cgxmMRBcpe3e9jUar2BH0287wzESd+R2rPFiRDtc2gZS4fx58RZhNOrAr/aWSqEzfIDxUP3JVbp1lyfiGd8QkHZCaHRgMVn4Mx7B6Gsw+0gn5bTCL3Udk5QEjaNeMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHKHtqfebxHRHJ4O7WWoFA1zWJF0St2hD+2n0yTHs+I=;
 b=yTfyxT8KzhYnrx4D66yscEFzrIaI9ndFNPk5KkESHev+DDfFhJuK+EISLL6HsqL8H8G3HJDnJT/1kjcO6Gubl0nbASbDngfuu4owJ99NJ1kOZITawtWIYTQ31omxdBwDqiT+QGgTR4oQplhAlNVwVPcCsa8mQjSUGuBN/P2Y+W9VSU1o+7wo9WKMuZIwOy4wvY0R7vUfc+vmA2Ip/CWFqN6nRG98V8BAOnPbKItaV1Twa0v7++HVu1ZilO6ipNXhCy/Bg/ysQzWc8eDOQFzGbLpKXYQTEtD38f09w5Snh1HKFoNReRwaf/y0UdjZifHDl0rwDLjMrImb1+2nFj8DLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHKHtqfebxHRHJ4O7WWoFA1zWJF0St2hD+2n0yTHs+I=;
 b=na9V5v3OO4XxV2q29/17dV+Ozf/hxLutReucZzSEZx9UEXP4t4MdMtlVxcpJihnELT0gyf9p7Tm5vneKW2RFjn8YzlvO2XuOqX+cFqqkgA4euk2XJzZZoVqZogIi+WkHaL8Q7bR0LhiScFeSsxkTS+MYr434+rLfmu6qs5JJgfCC9yLQzWSkD2hq1XJh3PJxNCo57/rn0/X7fFkHayEBz7Z02uI+JFM62xMMPHLq5qr8eJgg0EhIHoBn8CCHhsa8hb2cl228xbo04mVmtnVcXyN3dMiqNB9l5mo/zp999unSP1xw8H267R7hlgk6FhPuTRQ1Vg9W6rXZPs/4XjKjlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:263::18)
 by DU0P189MB2153.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.8; Thu, 30 Jul
 2026 13:12:03 +0000
Received: from GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96]) by GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 ([fe80::a7e4:7d5b:ab4a:4b96%4]) with mapi id 15.21.0292.005; Thu, 30 Jul 2026
 13:12:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] glib-2.0,glib-2.0-initial: upgrade 2.88.2 -> 2.88.3,2.88.2 -> 2.88.3
Date: Thu, 30 Jul 2026 15:11:58 +0200
Message-ID: <20260730131158.36515-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
References: <20260730124721.33400-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAYP264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::21) To GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:263::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1P189MB2954:EE_|DU0P189MB2153:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b90a10-2eb3-460b-cc74-08deee3c2555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006|3023799007|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	G+Kt+/Af/O0t0N6LvsjLfwTrPMuzRBnxeevpQvpiht9tYJ7tn4iIGWmXV24FBK0lCVscDJcprxFPkwH9jVWXlQBTj6YfqpHFlgK8d51n9zK/z9bewDek4aSVxWUepwrEvwKY8UrZuCEOXIu+LTO+z7FpYMSpXsPDYV2UdLcUCnwU3Xl5Bi+eWW8urGpxdPCEi4ZQueL9P6wF/qTzVHGKXUl05suBYnTymEyFFR2Tv4PjGTPB2iGi2jelnzIlyVheFgdN+gGHIutPgkcNBbgV36HNwo2lnCwZ60cvfAVeENVYTD+DM9LxiGBDXK5mV3RBpHJ4Y2mV1/7ldP3PECjiZ8YN7M8+N3zyosEl+/ybD1PFxMKfOYUCGhGC0hKlowuA750LW6yOX9Wq2g8MnDXPZ4t0aGeCNDDRiP6qP0EWJzpA8Mt0pp9wm34kWc2AuZ6B/GgUj8ChXMTGkuusfrVpV+TZCdBMqb78PN4ncET0ctrlorj0d4vLC/ClqgqkFoM/M94qqSbYjJTUGJZOp2wMhIAPs3tl2ZEUEybiVkAUl2GOy2Fbr/YFoFLGuf96LZC53noSH7lDgijFB6WvW5F/0nexVH2cbMtfZt9IkB3at2mToN5pau52osqk/BF5iW69+6iLVapH25w5a0r2t6HM88LIUyRo1uOc584J3N+6Nk8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB2954.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2gEfCp+m/R/84F+g8TmKI1W2MYqH13JeajvGuMS5i5FTiLveENNwwJnbtrPJ?=
 =?us-ascii?Q?duNV6vRqc1qcq0BpXQVfUC4e6Et8wEMHNfP+4M2Oc8KQbyCBWMBqX1M/SIlK?=
 =?us-ascii?Q?tkdVCge/TtN1Yo/qGAnyuBJ/owP+XUBWTKWWcvcvjr9j1iVRNq+V3bO3RAD9?=
 =?us-ascii?Q?vknmd8R8yeh3mdPOb0npI9hs3qgO4M3vYhTa1CWEHHg6ntawbNqX6OFkgbDh?=
 =?us-ascii?Q?a+iySQ4z4981AqEhySZuiTySrZJLUKnblu3FFmimd/MnuS2gmhM4w5h7SMPf?=
 =?us-ascii?Q?jWVzy77/VQSwesrkW6RMItz1jiMZ2X1leWhTXf3/cPLB91a9t5o/sT2DeXFw?=
 =?us-ascii?Q?PhVcFyovkBWII5r4IiFlAsNFGd/8kdM1qNKjb8gPIEnBa937TBU9JTsLD26O?=
 =?us-ascii?Q?S6kS0bbER5/pzJLLeXV5oTdl4mra35Ijvh4o5Rz9iLANyRFcC3cGLmb+5wBF?=
 =?us-ascii?Q?kfRCekWIPoBEslJRN+I5ulH4WleSTD9Tu8fLdM7H0OETi/0FHbsdu4ybpovZ?=
 =?us-ascii?Q?qlmlcgGKCPD4/43vpCXiRkenzfk5DaCi+WRavUgCwh+F+wfLlxtAwl9p7n7C?=
 =?us-ascii?Q?hVbtta0cSkW2yoxeejU7/qRoWAb9jUut9DFuNpOULxLcHGWqh4yOCHCT4ixM?=
 =?us-ascii?Q?sya1Q7rkttxvldQuzbpUawd959WrtqjqIJy6cBmQOIedADZevk5mpvEiE/kl?=
 =?us-ascii?Q?CC+wY0bYQ4YshnJNBt0FhA1ETVBjflGvN0XAmZmqqf2tSmZ5i3hKBcUe0tp6?=
 =?us-ascii?Q?TpDpD0qgV/eYeWjIBrSi+fbTddYWcBPLmv7H1hmLSp97Cafed34LPI7gW1Df?=
 =?us-ascii?Q?Lr8MnKdaxRLEvwGFwLxir7GCE+1wli0BfzUGrM4DyGhagY8Ad9/zzMVFDbgP?=
 =?us-ascii?Q?PJjgLE71CrIfU4yNhCE7cyHifqVN9sdRFkxHwHgsRvFqdeBPPPZxk1QvOFFy?=
 =?us-ascii?Q?Y7EwGewA+BBEq3fyClqxFgSoD6C5ySuASXiq3VTRvNsAS6NxkazTZa8cvrAN?=
 =?us-ascii?Q?BfG1PD+ToUyyhtZ1Fki6+bF66AICVEc0RVVJSyumxBp66GERad5GRxwenEal?=
 =?us-ascii?Q?Ckc2elSvF7s5/f5KD5ctT9Tbqu8ojb2+rYOgG9B8wfb6K/oAGxNYpk8ooHQj?=
 =?us-ascii?Q?qfUt3mEgu0YYThsh9nNOHRfLtTPJn8t5ZKVwZ+vjck/nD2i9TBAfSdh6fn4X?=
 =?us-ascii?Q?wH/BbqnosmVLCyBX2tEkyYAbqLXeDik8dTWTr3rlkqdiO/HMf2y/t1ejFIaR?=
 =?us-ascii?Q?Daou6gq91Fj6B7pFLSMToimXP2O7TTsUhWeNEmy8h5HjMSpbGV8q9ofgI8Q8?=
 =?us-ascii?Q?G/DgFrU4bFHsUEtQcbCLSLxZqaV6HL/PqZjeEr7jRgOhFlck/ZSCJf0jpy2r?=
 =?us-ascii?Q?7JmVQy6g+ooCpgQsvNiFKoFUf6MOjtVXYqyDvibOxaRy73exqPZvMkBcPJZz?=
 =?us-ascii?Q?b39MgPIL3NsaHlwENl5L9f24rFjqTA4qNLrpq8giX6gDzpVu2Ow3K798kKOe?=
 =?us-ascii?Q?kwK1Xgl6HyabOQISuX3SMpy5foE6tAwL4VzREvzDZz24paED2mmT74ZPC6A+?=
 =?us-ascii?Q?gVbMn5b10OiguNFHJWIdAap9MbKVmlPC7gI3hhoDHFvFjAM5029mfQVfZ2xS?=
 =?us-ascii?Q?Bc/GdS6aC/xpZ/eCGYHvpjmDAeTnSJ/neisetrqV7sxm13QHLS3YgTEFyu7S?=
 =?us-ascii?Q?JIzZG4K+g0PpC7uzffFtKXJl3c1TdE5/OwysGFcSfY1YiZAyQY9xmCx8BHsF?=
 =?us-ascii?Q?7q3GGvj6VA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b90a10-2eb3-460b-cc74-08deee3c2555
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB2954.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:12:02.6934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTSlvRRx70EhVWScZntT5nIgNnCzPIuQRUfWub78o9mWE7pEu9vMwQXMKtXXp3ix7W9NF6D30nNXXtWGA1PvRQE+W5fThhoM3j/b1aloxkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242353

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS#L1-L17

Source: NEWS

Overview of changes in GLib 2.88.3, 2026-07-29
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix potential miscompilation with GCC 17 with G_GNUC_CONST on get_type()
  functions (#3984, work by Sam James)

* Bugs fixed:
  - #3984 G_GNUC_CONST vs get_type comes home to roost (Sam James)
  - #3985 (CVE-2026-15588) Security report: GDBusServer pre-authentication =
DoS
    via unbounded SASL line buffering (Philip Withnall)
  - !5225 Backport !5223 "Drop G_GNUC_CONST for *_get_type" to glib-2-88
  - !5241 Backport !5240 "gdbusauth: Limit length of lines read from client=
" to
    glib-2-88
  - !5242 Backport !5238 "gpoll: Correctly zero-out heap-allocated fd_sets =
on
    macOS" to glib-2-88
  - !5243 gdbusauth: Unmark a new string as translatable
  - !5259 Backport !5248, !5249: several Meson/gcc fixes to glib-2-88

CVE-2026-58016 patches refreshed due to context changes in the new
version. The patch content is unchanged, only line offsets updated.

Fix buildpaths QA error from upstream !5259: use the .in template
as input for the installed service file. Submitted upstream:
[https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5261]

ptest results (qemux86-64):
                    2.88.2      2.88.3      diff
  Test binaries:       308         308          0
  Sub-tests:          6207        6207          0
  Passed:              306         306          0
  Failed:                1           1          0
  Skipped:               1           1          0

Pre-existing failure: glib/gdbus-server-auth.test (SIGABRT, same in both ve=
rsions)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
- Submitted upstream as MR for Fix buildpaths QA error issue and updated
  same info

 ...t-write-bindir-into-pkg-config-files.patch |  4 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch | 12 +++---
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...es-Fix-installed-service-file-using-.patch | 37 +++++++++++++++++
 ...on-Run-atomics-test-on-clang-as-well.patch |  4 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  4 +-
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 26 ++++++------
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 40 +++++++++----------
 .../glib-2.0/files/relocate-modules.patch     |  2 +-
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.88.2.bb =3D> glib-2.0-initial_2.88.3.bb} |  0
 ...{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 16 files changed, 88 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-service=
s-Fix-installed-service-file-using-.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb =3D> glib-2.=
0-initial_2.88.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb =3D> glib-2.0_2.88.3=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index 11e9508840..c22ef9fdb3 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 83282a978c5107c682ab4c75ac7407961bb17788 Mon Sep 17 00:00:00 2001
+From 94f8f5bf51db5219022f6a646e784cb67d284282 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index c7da257..8a00989 100644
+index f9aa0c8..48ff2a5 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -934,17 +934,18 @@ libgio_dep =3D declare_dependency(link_with : libgio=
,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index 40398f25f7..bd7a04cccf 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From d02e061f830b7051878e8a467f393e85110e4e1a Mon Sep 17 00:00:00 2001
+From c80659ca01051f8e83dccd4eda15a811b0ea377d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index bf669bd4b7..8f6fd98472 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 72a58d19ae7f80985d9c91751fd6c359464ce292 Mon Sep 17 00:00:00 2001
+From 25d6cb83b6b46181fbdad1a6f872a3788d6e4843 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -9,15 +9,15 @@ renamer does not cope with library packages with files in=
 ${bindir}
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
 ---
- gio/meson.build | 1 +
- 1 file changed, 1 insertion(+)
+ gio/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index a3e6f18..c7da257 100644
+index a3e6f18..f9aa0c8 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1067,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
-
+@@ -1066,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
+=20
  gio_querymodules =3D executable('gio-querymodules', 'gio-querymodules.c',=
 'giomodule-priv.c',
    install : true,
 -  install_dir : multiarch_bindir,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index eef7c9db86..d64576b11e 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From c1eaa4dd2e2c09e9930949d4a9ee08e3e21b1a88 Mon Sep 17 00:00:00 2001
+From 29be4e2681b78d7856143056f769040be076b03d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 14c8c701ba..579999fd6d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From d9c75aef8b68887ef4f1dd9bb73542cc0ff02b20 Mon Sep 17 00:00:00 2001
+From 12bf3fded3b4c0c7b2d7ae7810d6eef47ed747e5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-i=
nstalled-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-services-Fix-installed-service-file-using-.patch
new file mode 100644
index 0000000000..fbf017e6c6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installe=
d-service-file-using-.patch
@@ -0,0 +1,37 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 30 Jul 2026 06:26:00 +0000
+Subject: [PATCH] gio/tests/services: Fix installed service file using buil=
d
+ path
+
+The installed version of the service file was incorrectly using the
+already-substituted build output as input for configure_file(). Since
+@installed_tests_dir@ had already been replaced with the build directory
+path in the first configure_file() call, the second call just copied the
+build path as-is into the installed version.
+
+Fix this by using the original .in template as input for the installed
+version and giving it a distinct output name, following the same pattern
+used for desktop files in the parent meson.build.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_re=
quests/5261]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ gio/tests/services/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.bui=
ld
+index 1111111..2222222 100644
+--- a/gio/tests/services/meson.build
++++ b/gio/tests/services/meson.build
+@@ -18,8 +18,8 @@ foreach service_file_name : dbus_service_files
+     # Build a second copy of the service file for the installed
+     # version of the tests.
+     installed_service_file =3D configure_file(
+-      input: service_file,
+-      output: service_file_name + '.to-install',
++      input: service_file_name + '.in',
++      output: service_file_name + '-installed',
+       configuration: installed_cdata,
+     )
+     install_data(installed_service_file,
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index 1fe00df8fc..3f9b9e4741 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From f72296cbd6f04f4f74b49b961f3cb405efa112f0 Mon Sep 17 00:00:00 2001
+From 0530e624dd47ee18aab18c8d403da12bb297f26e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 25802aa..c53d216 100644
+index 22ed181..87497b7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine =3D '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index fa46bee904..0912859698 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 03614474ac998422d0348c16c588a9ad50c97398 Mon Sep 17 00:00:00 2001
+From 0147fb147548e0657f298ab8e050ef8aaad3c850 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index c53d216..330ccf3 100644
+index 87497b7..6955b02 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index 7a2c168756..c032d575eb 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From f37cec951e3c564d96afcfee1279f4a9fafcc822 Mon Sep 17 00:00:00 2001
+From 2bafa636db0241952b9168c62f051900ebf8b058 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index 2c4b248b97..f6883ba85c 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -1,8 +1,8 @@
-From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
+From 9a59b64b294843842efc86148485c8b3530cdfd1 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling for
- <node> element nesting
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <no=
de>
+ element nesting
=20
 The check for whether a `<node>` element in D-Bus introspection XML was
 nested correctly was broken. `<node>` elements can only be at the top
@@ -27,10 +27,10 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  2 files changed, 34 insertions(+), 1 deletion(-)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index c7be334ce2f7..6f722ee6153d 100644
+index df5daa3..78a63e2 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *context,
+@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
    /* --------------------------------------------------------------------=
-------------------------------- */
    if (strcmp (element_name, "node") =3D=3D 0)
      {
@@ -40,13 +40,13 @@ index c7be334ce2f7..6f722ee6153d 100644
            g_set_error_literal (error,
                                 G_MARKUP_ERROR,
 diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspecti=
on.c
-index 44cb7a96af45..daca313f77e7 100644
+index cb99c94..05710d4 100644
 --- a/gio/tests/gdbus-introspection.c
 +++ b/gio/tests/gdbus-introspection.c
-@@ -299,6 +299,38 @@ test_extra_data (void)
+@@ -300,6 +300,38 @@ test_extra_data (void)
    g_dbus_node_info_unref (info);
  }
-
+=20
 +static void
 +test_invalid (void)
 +{
@@ -80,15 +80,13 @@ index 44cb7a96af45..daca313f77e7 100644
 +}
 +
  /* ----------------------------------------------------------------------=
------------------------------ */
-
+=20
  int
-@@ -316,6 +348,7 @@ main (int   argc,
+@@ -317,6 +349,7 @@ main (int   argc,
    g_test_add_func ("/gdbus/introspection-generate", test_generate);
    g_test_add_func ("/gdbus/introspection-default-direction", test_default=
_direction);
    g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
 +  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-
+=20
    ret =3D session_bus_run ();
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a61e35ad8a..3acb16f75d 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -1,7 +1,7 @@
-From a75052ceeebea434f271b670766acd5416bc83b9 Mon Sep 17 00:00:00 2001
+From 02e38caa6265e25da87836ec46c9e514d4a81159 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:08:10 +0100
-Subject: [PATCH 2/2] gdbusintrospection: Add some assertions before array
+Subject: [PATCH] gdbusintrospection: Add some assertions before array
  dereferences
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
@@ -27,72 +27,70 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.c=
om>
  1 file changed, 8 insertions(+)
=20
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 6f722ee6153d..ed0d291f99f0 100644
+index 78a63e2..4df8e87 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1110,6 +1110,7 @@ parse_data_get_annotation (ParseData *data,
+@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
 +  g_assert (data->annotations->len > 0);
    return data->annotations->pdata[data->annotations->len - 1];
  }
-
-@@ -1119,6 +1120,7 @@ parse_data_get_arg (ParseData *data,
+=20
+@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->args->len > 0);
    return data->args->pdata[data->args->len - 1];
  }
-
-@@ -1128,6 +1130,7 @@ parse_data_get_out_arg (ParseData *data,
+=20
+@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->out_args->len > 0);
    return data->out_args->pdata[data->out_args->len - 1];
  }
-
-@@ -1137,6 +1140,7 @@ parse_data_get_method (ParseData *data,
+=20
+@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
 +  g_assert (data->methods->len > 0);
    return data->methods->pdata[data->methods->len - 1];
  }
-
-@@ -1146,6 +1150,7 @@ parse_data_get_signal (ParseData *data,
+=20
+@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
 +  g_assert (data->signals->len > 0);
    return data->signals->pdata[data->signals->len - 1];
  }
-
-@@ -1155,6 +1160,7 @@ parse_data_get_property (ParseData *data,
+=20
+@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
 +  g_assert (data->properties->len > 0);
    return data->properties->pdata[data->properties->len - 1];
  }
-
-@@ -1164,6 +1170,7 @@ parse_data_get_interface (ParseData *data,
+=20
+@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
 +  g_assert (data->interfaces->len > 0);
    return data->interfaces->pdata[data->interfaces->len - 1];
  }
-
-@@ -1173,6 +1180,7 @@ parse_data_get_node (ParseData *data,
+=20
+@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
 +  g_assert (data->nodes->len > 0);
    return data->nodes->pdata[data->nodes->len - 1];
  }
-
---
-2.54.0
+=20
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index 421dcb8f9a..6c982ca735 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d99e85f606530950514446a3113fe39c8c67934c Mon Sep 17 00:00:00 2001
+From 226f4955e53c6b3f360f346e41a0a22b74cbbaae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 25f5324784..7bc83adf6b 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From e19423cec5b32bfa5ff1bcd567e51fa55713f94e Mon Sep 17 00:00:00 2001
+From 64e957f0fb32ed54748ceb4f220cb4773743d6ec Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index fafb7e3391..6759ce328a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,12 +235,13 @@ SRC_URI +=3D "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "cf3f215a640c8a4257f14317586b8f1fdd25a10a93=
cb4bdda147c0f9ad88e74f"
+SRC_URI[archive.sha256sum] =3D "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8=
b8ce72fdf79bbbdc9b383b"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.

