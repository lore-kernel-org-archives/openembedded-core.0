Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5D4CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13141.1791811218138366613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LAMI7qaI;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZby6Qu8g1QueV6XZh3ksH98+ruogQV36Aeem/7zqnHG0rUdmbmkVSTD1QYkdoSKSqEz1rd3ebJQG24Wys7K6xHsLOUyVsUyqrJP90E4Mu+qvDCHErQcevTCopX4IJUTU7iTjM+QoGAnStO/DppbDbxLnso7ocT2UAT6zaStv6a0i4bWTznygfeUZwkxO9/ZS3exxCthVo26DsnVN5k5XOMMEbbYULX+zrschaSveaqbnz+hBf7hLONo0YcZLY5iJNZmYCudpaeqnUXfKkKmcpwy2ssRPDXVHg/JXws6RyX3x5MtzQNFzIixbuGj+3zpJB0UJWeT6tvI+o1wN7t8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqJI0rGPthoC4fEcIRoHOXd6Iobo9iFssYnDkoETExo=;
 b=VpOXjwucy+TMXFHspZd6eKZk9nwsWSb+cSF2CcrUVz9uolhN2VtVOzsvXLN6XuLZeK1Xfqb04Y0KI7L4C8x+h2GYVkbmTKaDdh4PS1AK+Dba07wdxq9V07Vfi9nvmgbIYbdhJ2xKexxVjBxSPYJXEGMed3TybR8cVzQCQ60jFcpS9htsgGPdTfX5GvRUWyYgAHYdZvCDVnbgKwApIbgvSsRT/x9Hk05/Uii8l+Z+BJ9+ED5LdEc2MxBmB/Da1tX9eP/w3cWu8J4ASXv8Gc364hEfhwAZzOPuBkGIv8aStFDvpXJMEyj8Dwey2nndtmdl9PyiqfhX5H/VO82tP+aVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqJI0rGPthoC4fEcIRoHOXd6Iobo9iFssYnDkoETExo=;
 b=LAMI7qaIlL3SJ1XzagRhpz+Gu0PJ9EuZKGLIaNCXd20C2Jb8LjSxhfS8w2trUQB7cvgox+1OyUxMjd2wJz4SjYU9X7pjDu5nEg1yY71ZU8zCgKlsx7SgaLFWhxKhPVkFJCPKIafvnCYQlBbMOd1luL52fGOjy8UW27KerWgUyFFue8Ts4MPgkejoFl0MM6dvkGKlOnGjKm8t3xwuYHzewcbRELOwhUEtNMbPEtak7VAP/rBiCRfhujf4xSNdj8e09oKchrGKhxRfH4T+JqgP5h8FLZ0aZs79xQB9Y4ppt9gbtzCjlpaZXP0nscjGVjAsOgqwHaCVNKjGVk9ZmWnkOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:17 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:17 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/18] gst-examples: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 15:19:53 +0200
Message-ID: <20261012132005.23909-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0373.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 5507989d-64d7-4447-0883-08df28638e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|3023799007|261009223027099003|261009223327099003|261009220027099003|261009221227099003|261009221727099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	9sMlcn/NF86FHa3/ZqF/X2egBquWQ56bHL9aUx9RCcneZXg0SHYEB4QZZXk8JITh/5a+Fn0uZVggkengzQ9SAxRYmAFDzqFSgr757VyKp7rVfegUMfcS8A9MtNJn3dE4oKM8QrjTnotm4yO4sdIbMRHrUYSL0484oSvuJIgcme/17YcK/G7Oz2V80f6XCjvuI3wWcO4nnOOwBT2h78GaXediXMVwmoKM8fpuc5a/MiyMMIXgqObTYgWZwzDYSVlIVjFJwV8XBX8miEuUV9CsyOqfPJRUgKGw6t/pr41rCA5U5gHl5QaKVmfHVtCY+YbTvSAdfyx5FkNmdWih4Xit2sOsu6hpGSCjZuXBdXR5CUzypAfQw2SrUwe5rUEXMY90ocmcjIwQzn0AZs4xVVykBeilX2SX+vnZ5jI9/i64XQyBlitUiGfZBQrSvSnCn513fPvJMyeu2wsjpy1792Q78ROt7o9IbI7kev6/wbGwo3/8FHyV9fJMT1tXNDLZUyJC9M9uUS1DN+RmezbWQMJ+/vuVn1h9nwGZyU0InUFirgnru1nvelX49F4NAZk8EzjFLaoHDLpYYlW9wDVE1uPofdTXtm6IPmwsLD74d1zXSoA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(3023799007)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(261009221727099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YeRw/o9sb7FVXwpl4wf/XRCW+d+dks1Q56zBfoWrPb0BR1JWepD/+NRlOIkL?=
 =?us-ascii?Q?CLZW3rQzMLPuHEXjttCm0sd1yq47aMjnt9OAMPG+kQf55hB/WwoNvsj3AheP?=
 =?us-ascii?Q?kthg08/rHRYGd3qlWYvTwqo0C6DQsKZNb0ZEe2l6SQX1tiFApHcYIrvZ0xlk?=
 =?us-ascii?Q?KYtvQlwYSSQ8/QSxUVZbGqitFI+uSPJyQkZ8kn6dO+qlTKiuEGQsVaL85Jde?=
 =?us-ascii?Q?uXAJ+/6YUDpmoPtFhZE5IkpTjZLajbaI4r4cuMe0Snf8MeIxb7zyMqUwflQK?=
 =?us-ascii?Q?ajUj2GAR+SMzygWcUEvJKXMKEDd4QQzg7Usr/Wq+ZsuJzFcj+M1llMJGshFY?=
 =?us-ascii?Q?C7yb666JVblTuSuNFcPzMMXEh60oxa1UK8N4kmS8g/F+XlaDbuFtowGHjr6Z?=
 =?us-ascii?Q?1xBRWC4LHnGuLqbC4KqF7tSR0E4M76B5ZCsuDMPVzmV0FtYeIZ1GONvW9y6u?=
 =?us-ascii?Q?9dHlt3AcFsL4u6J6Nu7fslIc8yw1qixeTD0Ojo+Sz6Sz9zI7XMexy5S+D0pZ?=
 =?us-ascii?Q?trj8PgrAnTWiKKcxD+IC9cRlpiPJ8LsdeZCkGN0vcxckmO3I2opKkiJzDgAh?=
 =?us-ascii?Q?0pdOYxdckmhPCSGENO3/0Fs7nDvYia0oGJGq6SCbDMwsPKxDFBofHPBky0/N?=
 =?us-ascii?Q?rozqqyO1hVRWNIz8FEmzhg+U/xUy5Nw23H7VO+kg7Y9fB7QRvtB1zyj53EIo?=
 =?us-ascii?Q?vWA+81EJ41aALO4K8kuheJrqpxRDuq9J1krH8Aka9716VCQu/HjhnH1/zDvm?=
 =?us-ascii?Q?vzVDayS3XktHJs1HJnkMmzoNp4Y1qIDqEJ1OW410RVmVWwsXiyrGPLUiZ0gX?=
 =?us-ascii?Q?kH1NnI4q7klYFrJZAiLpS0EA3qr55tfU7nl7XTtqU7Kd8OJoBmaWNjmPG+3r?=
 =?us-ascii?Q?5IrKZKzv6JE75m9z8VtfvTBpOVMabobrZOzElXw7Ab0DsKaFu6BMlbKP+hpb?=
 =?us-ascii?Q?QqmSRhA3TdFAezA3gJRCt06hCEgaiqIH8nxQl7R5oSIvzK8r2EGyA51SxWZr?=
 =?us-ascii?Q?JQJvt5PBhHAE3dsjlew+E9V4NgWnMzQsAO+50ZrUykJPB5kFHqM20joaS93i?=
 =?us-ascii?Q?uQewPj6XDgjkPPe5mlSnT7kdZ1Yq2GWD+rz4HXg61oFu9SgaSAM1qMPD1Alz?=
 =?us-ascii?Q?aYIr04Xx9KaHpKASp7XrCp/7lIpOjND8gH0vYf13QRCIE5TU7XEV+CYfJDR4?=
 =?us-ascii?Q?IUv5QAP8w660LCg4WF+vH4kM/2phJYJhoAUTdD92D6flCf3mJHvk2I/44Oh1?=
 =?us-ascii?Q?pq/aNjPIxDAXHH8M595LBDChK4fjOue4fjKF9A7mmhYgNq6xSpCDHkMsse7G?=
 =?us-ascii?Q?FQ6WhFiZ9Sux7dhhC/IvHIAy9JRub4Js2M5SYBaMTlXCyWoauE5BLGOt7VcM?=
 =?us-ascii?Q?Teqd3+AZeilbwgVih0zGrqCfrOqD/PRiL+8xfX+yHluV63h1tG7VMNqkdbBw?=
 =?us-ascii?Q?0WDZrKbYhq1CaxbPg2M+uKYbxIkotWcj3lDrTEsz7SLvXY+DuhUX/sgJ3KdL?=
 =?us-ascii?Q?odJrSwxIsPGay7LmGdAUWuB29PuP9eclbFzy9iZqObZ7Q4IlM2k6ce5TtJ6P?=
 =?us-ascii?Q?gLRasxkWEHNzBqZMv5iAP9gtXp8zUrVxLIv1jhUdNkPLaC7Pv1rFJvYwyw8+?=
 =?us-ascii?Q?UBuTvzRrY9sgsYx+yc37lhSy11TU2ySQbFxqoMeOoY7FToGiwKzgwCoyrdCV?=
 =?us-ascii?Q?JuJEPtdx3DJ9tO/O9WnBJ/LAVZVCd5IjN3oEfw43yW4ODimahlb+p0duqlPa?=
 =?us-ascii?Q?l+QTAxiXyA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5507989d-64d7-4447-0883-08df28638e80
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:16.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrQoy2wTlmTEFGrJ4U/r0YZlMRRjVtZ0XIOkCZTANjSCGubxfsW89RPkt18aD3HuDhxhuD0YCW6qSHZ2x/OXICCSJCHeAtOostTKXyL/IUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247650

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

