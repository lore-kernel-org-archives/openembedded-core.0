Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3078CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:48 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.142])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16038.1762158104805408144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=a2/2PzTT;
 spf=pass (domain: navimatix.de, ip: 52.101.84.142, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeSXZrtZWmAkgFf8bkQQg0Ems7QkEo92LOCU/Gd9Jg7HN2Nhl+mv+V7Xy3J3BdKNkbjSQzrVwcw27ejVkObSX0VOb54Fan+GhJ65r0aVOZZxGuq1w+ZJBYm4+mmA49RRcpTfWWVRF6LCRlrIetYRCHriRW75ojezvF/cuX0u5BsuTSYwbTM7vXQH5CfNp+5aMuEAB6QLvWyc6IpM2CBeNvPds5Tqs2pCdusB2Xafmgh8Anj9C2Vt7etZFqMyG6nP2B4mpgGtnpSDZrUxpTedzvwD1iConBGyj0qcQEeD63Y9dxskLEpT3rxdFYvsIHY2H2W7vYEMYqWCm0XvDvG2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9EN/UXJtXYwg91+3FCa5nJYf5TKzOJvTKHOcRDedqg=;
 b=DS+zzAMcnQ732w4oEZVUJA1KIQxQJVWcvMzU9kgztN/XIuJ727P1fL92P6q5FJmnBnblHVfVcTD9kKNbhkgBigdaQ2w2ZNIO/0sgy6bxr2BMgNbzUWTO545Q+N7WTFYKphRsrglOF38sD7n0ASYjN/M1rWA+POxtdCln9NOCdh+aV0e9aWLm5o2PLmEd3d3qtArGVhENhrRZYb7GQNHgh9FkVRL2EjJR+1hHbI3Wo+8i9P/KwKUEJkFCfdY/Nl3I32ZFOuX0OAF03i/uEJqlOxN2L6fT/qzORJTzYDlrwNdAKBDOkb7J1P8ufwkVvgNijpgoR7RE4O75q92rGoyTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9EN/UXJtXYwg91+3FCa5nJYf5TKzOJvTKHOcRDedqg=;
 b=a2/2PzTTjT59LPW5XmZe9T4J2n6uh/mr152Rwhky1Gm2DIzAXMDhWUwxAXSRIBUz98zDTD1ZY1k59Ppkc9I3hDMYsdXo3soEaB4WwgMVjf1DZdiiu+Bk5iFl8D8B3UDi3ZHo9lIs/NR0uLQ4wUFUQx5brCAHHNyQ7QO5A124b0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB9432.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:21:41 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:41 +0000
Date: Mon, 3 Nov 2025 09:21:40 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 01/19] gtk+3: upgrade 3.24.34 -> 3.24.35
Message-ID: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <20251103082021.1301034-2-joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103082021.1301034-2-joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 741528d6-2a81-4d08-34b1-08de1ab20477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CzZDaOSEOcGd53XBOw2awg8WmiOrFa+KptKtQGC0uWCl+PQrE2AieBa2DW77?=
 =?us-ascii?Q?IIU8q8VQ/fhCyJEjBJpb5GnyF6kTPRSAcWiMcfUJYsfrgqf8giLyTtnr/no7?=
 =?us-ascii?Q?jV7Hn5/vifWLFLjdyBzeXRVonxGAyYaVmHvFXTX5y7txn5Sy8EJax8TeJ7bi?=
 =?us-ascii?Q?NFuV+dJDuan2Y/jo0ku0/aPFjYAcjG4o/HyUU11LPFgkagRCi2Uk/aWPnBFI?=
 =?us-ascii?Q?bh6SzNXX3vfO53ek7LrvyAREkZgqRgF7oOQetjkd4jcqR+67i+MhnZENOKTM?=
 =?us-ascii?Q?C7x8ABh8NdDyaSSfXkAlvuySO729d/M+TN5JuVvBbkUQ0fGDeG+uI6UlkP3l?=
 =?us-ascii?Q?wFtT+IyMsE0p/s8+BDVQA2wOgFM8M7IbU/lOG7Yaqk/dgNTS11GA49zVC07d?=
 =?us-ascii?Q?pRsNOle0oAfgVEHKkD0m8zeBdxRL3EyLGaUxgK4dKCY65BeqKuVu23N02mHL?=
 =?us-ascii?Q?iPH86vKr+Ha7SkJyU9/rvytIYFzXC17BEDwupUeyMvHH39tJvmsSL1/2fO4m?=
 =?us-ascii?Q?xSUb45hZSkVp6SH/+WRWsiFfILdjvyTmFglg2pd4aYsf0e7zghGEgDuSmxsV?=
 =?us-ascii?Q?OB0yDZpkZpwaGbv7sN6rh6Vbo+qFYXmRDEjFhwhZLUx47vwdtVBK7m/GSZar?=
 =?us-ascii?Q?Y6S/WDTAPnJMnf7M8FhAWEzCsET9u+QlkY22JCWN8AOORR4RhvZ9BY38gai8?=
 =?us-ascii?Q?RTz1uLVl89/+k6tjLiOyHwZRxzWGreB6Wdws3KKifNDeoMRU1zE96v0UpzgE?=
 =?us-ascii?Q?ZSIo9ukHQasP1mPu48CyjP22jMcLyqdSUV3j5KruQs6EsP5LKkExNQIhJtxg?=
 =?us-ascii?Q?OiEKx7oHy+dzFuU8voDpFY0ibuVvDPNqghD+T3i/ZnZQuraLpbzPgS88QqWH?=
 =?us-ascii?Q?KRquLOpCgE53ADFUp27pVBrIngqZ9Oeqt9nj3gvNI49uKalvXgIILwCfsjBh?=
 =?us-ascii?Q?tAjlNrvrIqNB7dP5oJHD329MzZ1qbqDFmXPZHBtq/q8VEzN5kqqh84WMQDex?=
 =?us-ascii?Q?S3l+VPC/4ZMQsWZv6Hi3B246OzE6RWNE3+jiAtMGQQztfHcHjs2anYlPPznC?=
 =?us-ascii?Q?raJaU+j3Q/qgz4bgCgiBiBuVeneLIIamUa8k4yWYTH0FgWjR9iWKhXauUwdl?=
 =?us-ascii?Q?O4hKUx+e7Mew0crEBzFcdlcWJV1Yi/e4Pto7e556+X1k+lBLIccCAUILCA6t?=
 =?us-ascii?Q?ev8p6zFxCLBGBvZERT2f04yngwUE6rbXGFLnXxVQ7yU7qr43kmCKwcWxD/8R?=
 =?us-ascii?Q?P+54pnt/LJVdm0wHdKbvqb1WrAkylU2teogbGvGMqYgU1LJ5KczZzTzNk/XH?=
 =?us-ascii?Q?n64rsMlFThQNR+7SJlWV0vnqDSYRIwqfTX5ERaCZhzC4UQP/QjJNOxUD6VQD?=
 =?us-ascii?Q?zTYgNz5biPuVMFGomHZ83WJ7CWOjJNKlSN5VyQ5O11vhh38r58a4vA881IjI?=
 =?us-ascii?Q?Zz3aFup12G7oMHaguPGbK9PgKyu+vjY+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cQFpeUnLppEl8nu6iU+y7BsGFAguvYnQ7ifEpr/BaKGF7/GqNWiqBQeuuMZ8?=
 =?us-ascii?Q?KatJGJW+95217vbzUaPzy42BPUUydGrZWw/hXGErkd5SkfD1XsfZ1CrnS/64?=
 =?us-ascii?Q?sroT/CIr6SY4UgTQZwgz5GltRGmatH4Vh0KvuTVSJP7Dk4mCKmzTBMtUdxZZ?=
 =?us-ascii?Q?MKqlT0S6Xk00XXjxFrsEXg7+Sq2N/j/trrALRabfL/hFQ4PhqwG3HTEOs8qR?=
 =?us-ascii?Q?yyS7z8HsPxuyvXspWYIUhj6g5ieTaF21wkJw4viqJpv6YP/7sc/N19mL/mDc?=
 =?us-ascii?Q?Igf9F3+DIUAStjUPzMaEVOikXmL6JB85TAnzrBwgoZ1Vmg3TdcjwEtOTQK/K?=
 =?us-ascii?Q?ySYEVYXiihOswe7Psw8Roj7ZNc2A64Mc5lQxyTtPNGtC8Bp4gR4T55Sl+LYC?=
 =?us-ascii?Q?gFs+5dm/JmreFnkGatmlpxbTE6k4GX1XlpnfV3pjzocGHuPGdE1zZC34hG+W?=
 =?us-ascii?Q?IYkR5xl7cGleYk+7SJqtHxOQ56UPH7OHiHSZySDql5IdsNpMiamxJQBjJnP8?=
 =?us-ascii?Q?dV4l1GzkM2Q8NUlpIX6FGj1KFS2LMCjL558sjWb9e5AzHrmvRs4n/olDosTM?=
 =?us-ascii?Q?c2xoxH8L1ZSsgjnx7DMci55DCewV5FzPRWvqxEtwnGtC24joqHWf8gJDlKpq?=
 =?us-ascii?Q?nYJx2IB9rE6YKqM5SiRhipw3GBbmWKVRtTQHljKG8iFF8+uEaGhQDJ/2mtgT?=
 =?us-ascii?Q?31EovC8BIevQ3V+IcLMl78h8tC5tJbj3lcyjwtjhaUV8BB2knILBcdHkRkwd?=
 =?us-ascii?Q?JR4LONLlyJDWIIlQrxlfRInEu+s6b9pZpzGaSopgVZfUt+g7YNI2gpVRGpGq?=
 =?us-ascii?Q?/Oz/3gDpVIK/MrY8igEZUCI77F6pSgLGlyPVDTc8GSS/Jk7Y3BA/MiPRjOt8?=
 =?us-ascii?Q?hz+umYHIwTU18goyt6xtJqrYDcqgZ6aHIAhqL0ij+uQNG7EaQasLd/bYUC8T?=
 =?us-ascii?Q?N35ctKKmIInR6nL3ZA6ouWloipcXGd8xAWd+QUsLxk1aEUx2tnIgZDxYlXuY?=
 =?us-ascii?Q?rdovvWe/rle/RWZvccGvvvwNdZbWq9T28DG9RUxKeXotCG+ungr4Ks7by5/4?=
 =?us-ascii?Q?VtlwYeJn5i5HFhmIj5H8KPIwLDPz0KaAiTAFuXIedPPblxdVOcuR40ZdoPoE?=
 =?us-ascii?Q?WaGDvbMDT4ZokypqMxlqmaFeVJID5vXFI3SFBaliEHpwNjzecMuvLFG1e9QJ?=
 =?us-ascii?Q?nhxPeXu3PSh1c0aRpGw0cuTy8nfC7LGkbbDjjgw+6ARTfXXhn9VqqDE41Iur?=
 =?us-ascii?Q?CWN2djQJI9dY3U5WsEHwpVmmPxj93t/bhGkMRspkijHTJxZJNVg8Eu/4jSEZ?=
 =?us-ascii?Q?WjSIQv5iZojp7yRlmz6aHuekWxbz0iln6CR/287MkqNHjjELf0xX9qAXIVP7?=
 =?us-ascii?Q?g2x0dS0niFLZdPErHxWiFVJTeZQGeRsGqKlpe8sfXftvm4jkAxFWiOeU8M8t?=
 =?us-ascii?Q?xm6ntgIh+u9GXJgNk5JC2KcK3G8Zk3hRo81QKcrwQQHlXaqGIFh+zSwr8Kmm?=
 =?us-ascii?Q?xYrXx+oUp5lyonopZuPadlgYaCTXrHwq9lPeu5tYtOhrEibYNkRGnXgQfUL4?=
 =?us-ascii?Q?7wzPe+CrNGQ6lid2h45xYrK8DOoJTDhKNOsZMhR3zxYcfBCevb2p+3A87nUF?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 741528d6-2a81-4d08-34b1-08de1ab20477
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:41.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGgy8kiz0BNfu4CU1JyapITiNGDZfeZrvsts+6hZsBciAbXbIFXFQ0jproHTSyOAeczcZcdXV83JhQRPFEF+MPUfQO1ANr5zxOKXQUyxREk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225615

From: Ross Burton <ross.burton@arm.com>

The gtktypefuncs.c removal is obsolete as that file isn't in the tarball
anymore, so remove it.

However the wayland-scanner files are still in the tarball despite
efforts to stop this, so generalise the removal to ensure it covers all
files which may be affected.  Further investigation will be needed to
see if this is still an issue.

Rebase 0003-Add-disable-opengl-configure-option.patch.

(From OE-Core rev: cf5c5b4b83642ea44b21d29e7c59342666fbda6d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 6aa9011ab446b83496b4e682869bd000e69d45e4
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc             |  7 +-
 ...-Add-disable-opengl-configure-option.patch | 86 ++++++++++---------
 .../{gtk+3_3.24.34.bb =3D> gtk+3_3.24.35.bb}    |  2 +-
 3 files changed, 46 insertions(+), 49 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.34.bb =3D> gtk+3_3.24.35.bb} (8=
9%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
index 7d50d7bd2e..5b7b73ac8d 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -27,15 +27,10 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 export PKG_CONFIG_FOR_BUILD =3D "${STAGING_BINDIR_NATIVE}/pkg-config-nativ=
e"
=20
 do_configure:prepend() {
-    #delete a file that will get confused with generated one in ${B}
-    rm -f ${S}/gtk/gtktypefuncs.c
-
     # These files are generated by wayland-scanner but will race over modi=
fication
     # time between the copies in the sysroot from wayland-protocols and th=
e copy
     # in the source tree. Solve the race by deleting so they need to be re=
generated.
-    # 3.24.22 will not be shipping these files so this can be deleted then=
:
-    # https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/2183
-    rm -f ${S}/modules/input/text-input-unstable-v3*.[ch]
+    rm -f ${S}/modules/input/*-text-input-*.[ch]
 }
=20
 EXTRA_OECONF +=3D " \
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configur=
e-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-conf=
igure-option.patch
index 35cbab8761..fe67144536 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-optio=
n.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-optio=
n.patch
@@ -1,4 +1,4 @@
-From eef50c94587fc30cd624adb5eb213eb9fa663dc1 Mon Sep 17 00:00:00 2001
+From e59cb71740ff70022bb2d9bd3685a1d77b43cac0 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -19,13 +19,12 @@ as it actually will depend on OpenGL.
=20
 Upstream-Status: Inappropriate [Evil eye expected from upstream]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
 ---
  configure.ac                               | 13 ++++-
  demos/gtk-demo/glarea.c                    | 14 ++++++
  docs/tools/Makefile.am                     |  9 +++-
  docs/tools/widgets.c                       |  4 +-
- gdk/Makefile.am                            |  8 ++-
+ gdk/gdk-sources.inc                        |  8 ++-
  gdk/gdkdisplay.c                           |  4 +-
  gdk/gdkgl.c                                | 10 ++++
  gdk/gdkglcontext.c                         |  6 +++
@@ -47,7 +46,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
=20
 diff --git a/configure.ac b/configure.ac
-index 851bcbf..6cbf6a2 100644
+index 9ed65e5f8a..70c68364ff 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
@@ -66,7 +65,7 @@ index 851bcbf..6cbf6a2 100644
  AC_ARG_ENABLE(glx,
                [AS_HELP_STRING([--enable-glx],
                                [When enabled Gdk will try to initialize GL=
X])])
-@@ -1345,7 +1354,7 @@ CFLAGS=3D"$saved_cflags"
+@@ -1367,7 +1376,7 @@ CFLAGS=3D"$saved_cflags"
  LDFLAGS=3D"$saved_ldflags"
 =20
  GDK_PACKAGES=3D"$PANGO_PACKAGES gdk-pixbuf-2.0 >=3D gdk_pixbuf_required_v=
ersion cairo >=3D cairo_required_version cairo-gobject >=3D cairo_required_=
version"
@@ -75,7 +74,7 @@ index 851bcbf..6cbf6a2 100644
 =20
  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
  GDK_DEP_LIBS=3D"$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1379,7 +1388,7 @@ fi
+@@ -1401,7 +1410,7 @@ fi
  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
 =20
  GTK_PACKAGES=3D"atk >=3D atk_required_version cairo >=3D cairo_required_v=
ersion cairo-gobject >=3D cairo_required_version gdk-pixbuf-2.0 >=3D gdk_pi=
xbuf_required_version gio-2.0 >=3D glib_required_version"
@@ -85,7 +84,7 @@ index 851bcbf..6cbf6a2 100644
    GTK_PRIVATE_PACKAGES=3D"$GTK_PRIVATE_PACKAGES pangoft2"
  fi
 diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c
-index b51e4ae..82409c7 100644
+index b51e4ae1fe..82409c7358 100644
 --- a/demos/gtk-demo/glarea.c
 +++ b/demos/gtk-demo/glarea.c
 @@ -3,9 +3,12 @@
@@ -168,7 +167,7 @@ index b51e4ae..82409c7 100644
    return TRUE;
  }
 diff --git a/docs/tools/Makefile.am b/docs/tools/Makefile.am
-index bec43e3..189e8fc 100644
+index bec43e3a55..189e8fc926 100644
 --- a/docs/tools/Makefile.am
 +++ b/docs/tools/Makefile.am
 @@ -9,13 +9,18 @@ AM_CPPFLAGS =3D \
@@ -193,7 +192,7 @@ index bec43e3..189e8fc 100644
  	$(GDK_DEP_LIBS)			\
  	-lm
 diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
-index 932daf1..54239d6 100644
+index 932daf1746..54239d6129 100644
 --- a/docs/tools/widgets.c
 +++ b/docs/tools/widgets.c
 @@ -1526,9 +1526,11 @@ create_gl_area (void)
@@ -209,11 +208,11 @@ index 932daf1..54239d6 100644
    info =3D new_widget_info ("glarea", widget, MEDIUM);
 =20
    return info;
-diff --git a/gdk/Makefile.am b/gdk/Makefile.am
-index 710a548..b45f631 100644
---- a/gdk/Makefile.am
-+++ b/gdk/Makefile.am
-@@ -274,7 +274,6 @@ x11_introspection_files =3D 		\
+diff --git a/gdk/gdk-sources.inc b/gdk/gdk-sources.inc
+index 9235edb6cf..349acb8f4c 100644
+--- a/gdk/gdk-sources.inc
++++ b/gdk/gdk-sources.inc
+@@ -146,7 +146,6 @@ x11_introspection_files =3D 		\
  	x11/gdkeventsource.c		\
  	x11/gdkeventtranslator.c	\
  	x11/gdkgeometry-x11.c		\
@@ -221,7 +220,7 @@ index 710a548..b45f631 100644
  	x11/gdkkeys-x11.c		\
  	x11/gdkmain-x11.c		\
  	x11/gdkmonitor-x11.c		\
-@@ -300,7 +299,6 @@ x11_introspection_files =3D 		\
+@@ -172,7 +171,6 @@ x11_introspection_files =3D 		\
  	x11/gdkx11display.h		\
  	x11/gdkx11displaymanager.h	\
  	x11/gdkx11dnd.h			\
@@ -229,7 +228,7 @@ index 710a548..b45f631 100644
  	x11/gdkx11keys.h		\
  	x11/gdkx11monitor.h		\
  	x11/gdkx11property.h		\
-@@ -310,6 +308,12 @@ x11_introspection_files =3D 		\
+@@ -182,6 +180,12 @@ x11_introspection_files =3D 		\
  	x11/gdkx11visual.h		\
  	x11/gdkx11window.h
 =20
@@ -239,11 +238,11 @@ index 710a548..b45f631 100644
 +	x11/gdkx11glcontext.h
 +endif
 +
- GdkX11-3.0.gir: libgdk-3.la Gdk-3.0.gir Makefile
- GdkX11_3_0_gir_SCANNERFLAGS =3D 		\
- 	--identifier-prefix=3DGdk		\
+ w32_introspection_files =3D		\
+ 	win32/gdkcursor-win32.c		\
+ 	win32/gdkdevicemanager-win32.c	\
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 748f548..911ab2a 100644
+index 748f54860c..911ab2a65f 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
 @@ -2420,7 +2420,9 @@ gboolean
@@ -258,7 +257,7 @@ index 748f548..911ab2a 100644
 =20
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 9690077..55f85ef 100644
+index 9690077cc2..55f85ef605 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -26,7 +26,9 @@
@@ -334,7 +333,7 @@ index 9690077..55f85ef 100644
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index 3b23639..1f04f8e 100644
+index 3b23639e1c..1f04f8e0b2 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -380,7 +379,7 @@ index 3b23639..1f04f8e 100644
 =20
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 2de8ba4..1883a79 100644
+index 727b0cf1f4..d4d91b0d16 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -440,7 +439,7 @@ index 2de8ba4..1883a79 100644
            cairo_region_destroy (opaque_region);
 =20
 diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
-index 32b1f24..6352313 100644
+index 32b1f24434..63523130ce 100644
 --- a/gdk/x11/Makefile.am
 +++ b/gdk/x11/Makefile.am
 @@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES =3D 	\
@@ -513,7 +512,7 @@ index 32b1f24..6352313 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 7e08f47..30fd7b6 100644
+index 7e08f472cc..30fd7b6089 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -538,10 +537,10 @@ index 7e08f47..30fd7b6 100644
    display_class->get_default_seat =3D gdk_x11_display_get_default_seat;
 =20
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index bb4df05..46f5349 100644
+index c2b7480c48..114fd4c67a 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1827,3 +1827,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *scree=
n)
+@@ -1842,3 +1842,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *scree=
n)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -551,7 +550,7 @@ index bb4df05..46f5349 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 721d9bb..8e87acc 100644
+index 194bc82e29..0302bb68d4 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -564,7 +563,7 @@ index 721d9bb..8e87acc 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
 =20
-@@ -5881,7 +5883,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
+@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
    impl_class->set_opaque_region =3D gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width =3D gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu =3D gdk_x11_window_show_window_menu;
@@ -575,7 +574,7 @@ index 721d9bb..8e87acc 100644
    impl_class->get_unscaled_size =3D gdk_x11_window_get_unscaled_size;
  }
 diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
-index edb0ea7..a317d61 100644
+index edb0ea7dbf..a317d61cca 100644
 --- a/gdk/x11/gdkx-autocleanups.h
 +++ b/gdk/x11/gdkx-autocleanups.h
 @@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_=
unref)
@@ -592,7 +591,7 @@ diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-cont=
ext.h
 similarity index 98%
 rename from gdk/x11/gdkx.h
 rename to gdk/x11/gdkx-with-gl-context.h
-index 1f64bcc..ae05fa6 100644
+index 1f64bccb6d..ae05fa6b1f 100644
 --- a/gdk/x11/gdkx.h
 +++ b/gdk/x11/gdkx-with-gl-context.h
 @@ -45,7 +45,6 @@
@@ -605,7 +604,7 @@ index 1f64bcc..ae05fa6 100644
  #include <gdk/x11/gdkx11selection.h>
 diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-without-gl-c=
ontext.h
 new file mode 100644
-index 0000000..c9e2617
+index 0000000000..c9e261720f
 --- /dev/null
 +++ b/gdk/x11/gdkx-without-gl-context.h
 @@ -0,0 +1,58 @@
@@ -668,10 +667,10 @@ index 0000000..c9e2617
 +
 +#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 074fb35..4fa9eb6 100644
+index 946e72febc..b01da7f128 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1457,7 +1457,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkp=
rivatetypebuiltins.h $(top_s
+@@ -467,7 +467,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkpri=
vatetypebuiltins.h $(top_s
  	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-=
gtfsrc.c | \
  	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
  	  sort | uniq | \
@@ -681,7 +680,7 @@ index 074fb35..4fa9eb6 100644
  $(srcdir)/gtktestutils.c: gtktypefuncs.inc
 =20
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 802303e..33001cf 100644
+index 802303ea9f..33001cfb61 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -29,7 +29,9 @@
@@ -777,7 +776,7 @@ index 802303e..33001cf 100644
 =20
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index 48237d1..1f9b9be 100644
+index 4fd0c3039c..a8e59ed077 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -33,8 +33,10 @@
@@ -791,7 +790,7 @@ index 48237d1..1f9b9be 100644
 =20
  #ifdef GDK_WINDOWING_WIN32
  #include "win32/gdkwin32.h"
-@@ -196,6 +198,7 @@ add_label_row (GtkInspectorGeneral *gen,
+@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
    gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
  }
 =20
@@ -799,7 +798,7 @@ index 48237d1..1f9b9be 100644
  #ifdef GDK_WINDOWING_X11
  static void
  append_glx_extension_row (GtkInspectorGeneral *gen,
-@@ -205,6 +208,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
+@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
    add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_gl=
x_extension (dpy, 0, ext), 0);
  }
  #endif
@@ -807,7 +806,7 @@ index 48237d1..1f9b9be 100644
 =20
  #ifdef GDK_WINDOWING_WAYLAND
  static void
-@@ -254,6 +258,7 @@ wayland_get_display (struct wl_display *wl_display)
+@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
  static void
  init_gl (GtkInspectorGeneral *gen)
  {
@@ -815,7 +814,7 @@ index 48237d1..1f9b9be 100644
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
      {
-@@ -280,6 +285,7 @@ init_gl (GtkInspectorGeneral *gen)
+@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
      }
    else
  #endif
@@ -824,7 +823,7 @@ index 48237d1..1f9b9be 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f283e89..5e7180e 100644
+index f283e89831..5e7180e923 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =3D  $(TEST_PROGS)	\
@@ -857,7 +856,7 @@ index f283e89..5e7180e 100644
  noinst_PROGRAMS +=3D testforeign
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-fina=
lize.c
-index 24540e3..e0f863a 100644
+index 24540e313f..e0f863ab6a 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
 @@ -116,7 +116,9 @@ main (int argc, char **argv)
@@ -870,3 +869,6 @@ index 24540e3..e0f863a 100644
  #endif
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbu=
f_loader_close() */
  	  all_types[i] !=3D GDK_TYPE_PIXBUF_LOADER &&
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.35.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
index 3e974c91e5..0b27e5c178 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${=
MAJ_VER}/gtk+-${PV}.tar
            file://link_fribidi.patch \
            file://CVE-2024-6655.patch \
            "
-SRC_URI[sha256sum] =3D "dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61e=
dbe5eeefa852ec"
+SRC_URI[sha256sum] =3D "ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06=
965629fef60bd1"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.51.0


