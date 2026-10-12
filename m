Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE49CC6B07
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:27:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3966.1791836850017089277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jJy5Wsw9;
 spf=pass (domain: est.tech, ip: 52.101.84.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnicYyezIk/cLzWTAo05xNgCFYAPR1q6msw/GpuTeLaRm/WLpVbzx7fWhIlrRSJtAoVYOj/g47jD+nvQqd3ZFqEl36gYd/NfiEk+8b5YfKTnOcBh7AMHAHBby4wkwWbnUBwPnaUPq0nv2Vz8rCE/JiUpAuYabAeQdpu6nnDDAutPsvOyhJtLw2Ke5DiPimVZFhzj9Jeld/Xe0U7rnMbmZJxn4mLO8HTB9gGntRU06c9w0MLWWSLnoklPTWmI0KkR01IbHQsC8b/MEgymwu2zRdQ1pbjAFUL1ZDhWHKlmQ0/zPwjldEsumiegh3o3sOsDQACkVFCwNw2pw7XGuSebpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkCK8L3GEVMOEE4GCiVZmsw7wBeO+ZTcYGJ2MXyyRUw=;
 b=JS8B1Ez9PXGebM1bRiqDO4hGVCBT7HGIhgypexmIXXIvG1ssLcqsEj6BrWE6lbV4EyU3nvVyjaTa6zsVdsQmHY4pinA/BvuhmIuv94YStGVB1bMjPXa2hbbG8szLWc5Yf3MumkIbiTP2y9P2QCxP5o3Aubb9Xhd85JStC74YvRimqABhx4KBJ1VxHHvxH9FhOIL33StfYBRJXg6WJtRF7jXQhnFqJG8NxZvQqcwaqlndYlA34kRONPStAKBXfaLhdZs+moiDPlBnMVpzkS2SgQIp4lq128vyWqSKRFnid509QooBSX1ReIBuT922cYz0e5tBfVKqD4Jb9u2ERsocSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkCK8L3GEVMOEE4GCiVZmsw7wBeO+ZTcYGJ2MXyyRUw=;
 b=jJy5Wsw91SaRXpcD8cDGNIPKFvKZy2wpXHfLZc3R7URmjXd7hhwsp6A7s2TnU/o+naDwR09lKqfaLO3JC3GdjbBqORSylrJNNMxm1OJ3XV7XW7PMPFy9c2xQnp/AdTrMTpWFEGRxHNPqp8Sng5+Q+dahiIRvCifyyC0hoxhNm1Pq2P36/uQaG1RN7/6PFeClZuJ7BRCAQ8Qh6q5WOPW8PX1cG78QzbWNQ+48zd5mdxGg5dE3m9kaEIFSGOFYZacJqH9Md1addnAyjP0USvvIv09YsJT1K01cYW7HkSfGXjAGes9/p4L2vuvxaKKF7WiUdAZNULsIAOnRo+3VyQdwvg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 20:27:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 20:27:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 06/10] gstreamer1.0-plugins-bad: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 22:27:12 +0200
Message-ID: <20261012202716.38597-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
References: <20261012202716.38597-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0256.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3295:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d86d174-7d89-4db8-5c3f-08df289f3baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|18002099003|22082099003|260925021911599003|260925021311599003|260925022911599003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	XSrnEDbXX9ufuu8EyYSRVyn4DpEmIb0myezj/BEj7jgz+sAdurvReDo9hE63+mTNbB4ALWoqroRK0SqaX9+sP5nIxDb+2iB0PHnYuJIEUwCE36gnO2jlRmpvx3Hh4WSa9P2zbHomMCHnujjNNz3pLY3kHIYJrMV2mMCFgdZ2QrsRRrcsed3N9qKR7yyfkv8OCs6O0bFg/QMdoaXBOVZsFEY0mMMXOEB9IQsbjt9Z0BSTVLmp36MImv7d5HDFO/Ni4WWZCyCgoMrYWKbC6uU20ANAy1/mwPy3Vv+Nl0oJjw6N/ilmMv4E058rt8T0kl+ghfiHJI01/2mWEaKq+x1rH8ANAf8FgsyDlGk1SuPwF1SK9zCF+mP6b9rFVemSkGsGn29SP1QpWw2QLhyLubCz1fhEC1pwu7YvdGVhWhtzVPNdhUI1d7UjBHCVhU96pw4p1Q7OJJpWhJqQtUuP8mWKEmFWW6QBkBq+rVbZ11dW2lN+vMp0ZniPqxfgi6l9/1rl6ri6zBLrqkL9KP84KbHYnnP7AaMMZTLvfJW37WMnQJtfJoXPGM7MhRPiN/yirRXSlpYEexQnMQ1kLh/2THHVqCij7hdk+Pr6tw/iXpnWA1A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s+ESUq6HdE2Ajd+H0JgM38aba3xQftGufXCNB9XtsMzuDVQbubkfOyd9Rdtt?=
 =?us-ascii?Q?++UOUrkdilMWIWnO+jZ6xqbtPnZMWDrV0uR4vDlakA/uOaltOULCWGgSf/XP?=
 =?us-ascii?Q?bL8kSvWbO8XB0j3cBi1ZKAYoid66iMNmGP4hXCPtqmu+UPnK7ngk2iGGD5DI?=
 =?us-ascii?Q?MUE6f9bbyG82LVsSpLhXI6qYim9p0qGRtRgD6GO7l43dzfhk+kc2XRgwChRV?=
 =?us-ascii?Q?/ZPmHWZEhPH9N5SNZtKsZ095OiubGVewGG2DrewWU18MnvBYfh/8QT2oRGkD?=
 =?us-ascii?Q?8yNvQKc8kR2wUb/ZTvQxDjMhovWt3ygHHCh1FVlgDoFROE/LYv1WZuGV6ewg?=
 =?us-ascii?Q?yzXs4uET9f8vjGLj3CTJp+kwp1dySDptvHG0M9PcX1R92lwwr+nV2HzRA+Hi?=
 =?us-ascii?Q?DXtU7NRdMdIJKoeTYbOUHy3HyYqQSk9o+EuDm8PWUk+7Vo3tDeNMlhR0Pzwn?=
 =?us-ascii?Q?oCXbq1UNaumNo8/jvjuFmukkE3TEW6vBsA33FtUsaBJFZGwL7MqvyI8fWreo?=
 =?us-ascii?Q?8P5JNWtbp29vJ7wirEm57pC+HEwKVzoiOXuS1UbEtLG4Ihff9IzugRe5Gywy?=
 =?us-ascii?Q?MlHo6b3o2/a5CTXjbEBRTtnkCKAcV690u8r45usFSPjrzBLGZQfXtRA1QYI9?=
 =?us-ascii?Q?hFaUiwZienqhrattOYy8jAeFNmQupGEamf15mMn3a5s1+vz73OIVCYTSQ89L?=
 =?us-ascii?Q?Tjt5kMnNFGmUAbZy1KZjz5UXe3dLs0sym+Ud9919bHyHay4t+J7eWodUeGh9?=
 =?us-ascii?Q?CALZz9efcWTmzWxPO6GRTiz31M+x9uwR2YEAKrlhSAoAiNZErvDfXZZDLaxl?=
 =?us-ascii?Q?qWHvdQmt9iCmYQqeNbhZpOi70RfWiJAAkRxmoM8lbIEKfUbtNg6344DRkGfC?=
 =?us-ascii?Q?K6RwsgGKFnChIVOBBkjTyqYTs/T1c3z1dILP4R317NRjPwt/9d3vZ0pNHjpE?=
 =?us-ascii?Q?Nz7OuBgql+fDebGhwtfNbhmPMC80AIlreVEQyYuOGOivNde8+5f+oxg9EZ7S?=
 =?us-ascii?Q?2WCv2C+usHiU0EGlQdZC2nSifLCdtvn1WTPFJD92R/H+dxNu7JnxdNaR1b3w?=
 =?us-ascii?Q?B0Gpbx/wePqoCq5OptO65fnWm3hvzBI8hAblxPCaPoG0rV08+tdDXHlSPtaj?=
 =?us-ascii?Q?R22gcXbAqNl8fJ8Li3hkxDi96X/ehL+YUdqikmA2eYu3+rvwmSA4Zp7zDId+?=
 =?us-ascii?Q?ih1gNeOLY7D1jtohOAbw/rMxVZNHzD3dVp70qkA1qJzkVZHofzFE/KOtJrlO?=
 =?us-ascii?Q?BYcqnHRfu12D1QbFHI+N6Gq629T+xwKzEBjBq2U0l1REqrh//STtoouLyV3+?=
 =?us-ascii?Q?mJPoRhT5uYmWQMrAD/ZZTowBW5MQws4paT469TiWXKPBpBIs0AOMX4/FkYFP?=
 =?us-ascii?Q?f+tZ3ixuu8vklKTaV0PODRdxIW/2hhg1Gnu+yTL1DradVg0MYTi84rJvzaEk?=
 =?us-ascii?Q?+aeumM7JdwDPVoJ8erAQ/Ban9jTvpn+u91SIXk4fFuZqg6aS0MEFEy3jE5AA?=
 =?us-ascii?Q?kL8eu8wizV0G+ydMqaRa9QLLeMLxvctzHDg4FNNPz6jSPJUFtpswtOmN/wYQ?=
 =?us-ascii?Q?D4YbAvfKGlUau8BBC4l7KqJcL/jADgInrlGF2h0oLjYtPM8AK0HlykouGHxy?=
 =?us-ascii?Q?LU/uD0/4/7DIkbWW208tsQhl2U1Dpp/rsCUhIoLSGQCu65Wu/36uGGqpavgI?=
 =?us-ascii?Q?exoF1hrFuH2tUOaKvbAF4n6voBh9B3AtjraxKD9qixrmKPZJyb4g9jaL4Lio?=
 =?us-ascii?Q?HaP1wlIEJQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d86d174-7d89-4db8-5c3f-08df289f3baf
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:27:27.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4k6sLO93BhvbIrdnwk7PpU1RprOhB/xrBy6firJfnrxFKYAe+WsQua1bgbclLVXFMTQcX5kyWaMiDDONwF+fVjUR1g4055lBbSDgzfqfWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 20:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247681

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8
- Refresh existing patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-uninitialized-warnings-when-compiling-with.patch |  4 ++--
 .../0002-avoid-including-sys-poll.h-directly.patch   |  4 ++--
 ...solve-missing-opencv-data-dir-in-yocto-buil.patch |  4 ++--
 ...andle-padded-buffers-in-wl_shm-buffer-creat.patch | 12 ++++++------
 ..._1.28.7.bb =3D> gstreamer1.0-plugins-bad_1.28.8.bb} |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.7.=
bb =3D> gstreamer1.0-plugins-bad_1.28.8.bb} (99%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
1-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized=
-warnings-when-compiling-with.patch
index 39219f3f24..92749fa1aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-m=
aybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-m=
aybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 82e81317ef3dc7c12d6a75a9bc3cbdfedafcbdb4 Mon Sep 17 00:00:00 2001
+From 8dca97000e03e05b1bab63aa0bfd9df58dfc25af Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -11,7 +11,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codec=
parsers/gstvc1parser.c
-index d91cc3feb481..c9058cdcbd44 100644
+index d91cc3f..c9058cd 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
 @@ -1732,7 +1732,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, g=
size size,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
2-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patc=
h
index b9a8315ba2..897898e68b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid=
-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid=
-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From c35690641af3eac21dcb7a010620e7fbd8ad975c Mon Sep 17 00:00:00 2001
+From 1bc330b8c29888178d736b13744f004072be7558 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
@@ -13,7 +13,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index ef565f7dcb60..625442066533 100644
+index ef565f7..6254420 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
 @@ -98,7 +98,7 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-=
opencv-data-dir-in-yocto-buil.patch
index 640a5dcd87..85da6c5161 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-openc=
v-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 566c97e20bf023278db486ab07f13a4217358a6e Mon Sep 17 00:00:00 2001
+From c867736716d52af0d27a540e51426ccd4b4576cf Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -17,7 +17,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.b=
uild
-index 4ddf71f9f823..1fd341c9ad79 100644
+index 4ddf71f..1fd341c 100644
 --- a/gst-libs/gst/opencv/meson.build
 +++ b/gst-libs/gst/opencv/meson.build
 @@ -64,6 +64,9 @@ gstopencv_cargs +=3D ['-DOPENCV_PREFIX=3D"' + opencv_pre=
fix + '"']
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
5-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-b=
uffers-in-wl_shm-buffer-creat.patch
index 01e9987e5f..1aa6ffa5d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayla=
nd-handle-padded-buffers-in-wl_shm-buffer-creat.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayla=
nd-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -1,4 +1,4 @@
-From c1680a0a91fd383cfb918f3baf39434be75add36 Mon Sep 17 00:00:00 2001
+From 05a5f586e0b216ad11bf1b37ed3d5f6633798d61 Mon Sep 17 00:00:00 2001
 From: Tushar Darote <tdarote@qti.qualcomm.com>
 Date: Mon, 8 Jun 2026 18:05:51 +0530
 Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
@@ -30,7 +30,7 @@ Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
  5 files changed, 52 insertions(+), 35 deletions(-)
=20
 diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
-index 7844645818b9..13d846e083cc 100644
+index 7844645..13d846e 100644
 --- a/ext/gtk/gstgtkwaylandsink.c
 +++ b/ext/gtk/gstgtkwaylandsink.c
 @@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsin=
k, GstBuffer * buffer)
@@ -73,7 +73,7 @@ index 7844645818b9..13d846e083cc 100644
 =20
          if (G_UNLIKELY (!wbuf))
 diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
-index 3aa454076609..0baafd7e453c 100644
+index 3aa4540..0baafd7 100644
 --- a/ext/wayland/gstwaylandsink.c
 +++ b/ext/wayland/gstwaylandsink.c
 @@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, G=
stBuffer * buffer)
@@ -116,7 +116,7 @@ index 3aa454076609..0baafd7e453c 100644
 =20
          if (G_UNLIKELY (!wbuf))
 diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayla=
nd/gstwlshmallocator.c
-index 671f2b7295d4..11fb22c797b2 100644
+index 671f2b7..11fb22c 100644
 --- a/gst-libs/gst/wayland/gstwlshmallocator.c
 +++ b/gst-libs/gst/wayland/gstwlshmallocator.c
 @@ -76,32 +76,60 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * v=
info)
@@ -206,7 +206,7 @@ index 671f2b7295d4..11fb22c797b2 100644
 =20
    return wbuffer;
 diff --git a/gst-libs/gst/wayland/gstwlshmallocator.h b/gst-libs/gst/wayla=
nd/gstwlshmallocator.h
-index 4309bd7f4950..38f3ba53eba3 100644
+index 4309bd7..38f3ba5 100644
 --- a/gst-libs/gst/wayland/gstwlshmallocator.h
 +++ b/gst-libs/gst/wayland/gstwlshmallocator.h
 @@ -33,7 +33,7 @@ GST_WL_API
@@ -219,7 +219,7 @@ index 4309bd7f4950..38f3ba53eba3 100644
 =20
  G_END_DECLS
 diff --git a/gst-libs/gst/wayland/gstwlwindow.c b/gst-libs/gst/wayland/gst=
wlwindow.c
-index 3c5c3cc017dd..cd9c964f7cfa 100644
+index 3c5c3cc..cd9c964 100644
 --- a/gst-libs/gst/wayland/gstwlwindow.c
 +++ b/gst-libs/gst/wayland/gstwlwindow.c
 @@ -985,9 +985,7 @@ gst_wl_window_update_borders (GstWlWindow * self)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
8.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.8.=
bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28=
.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.8=
.bb
index 7964d5b6de..159989fe49 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.8.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-bui=
l.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-crea=
t.patch \
            "
-SRC_URI[sha256sum] =3D "dc525383c18b2c265bbe6a43d498656cd918aaa130aa4e3abe=
abcdaa741c3ffe"
+SRC_URI[sha256sum] =3D "670d888bde8242579b0d8e91f60cf337aa7be20ca7c315ebfb=
dd6e5a9218d104"
=20
 S =3D "${UNPACKDIR}/gst-plugins-bad-${PV}"
=20

