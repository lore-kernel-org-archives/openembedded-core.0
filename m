Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEAEC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 08:54:35 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8371.1784192070939004486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 01:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SffStLz4;
 spf=pass (domain: est.tech, ip: 52.101.66.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV+jMJyfyJCaqu594K6dJzje4wisvzj3l1yyJUf6UPIj1C4PWMjVkqE97Kqn0QHBXDEmuYVGFVi1gfQNVYxynL04zx0CypObxE1EANt5QNn8LfwafRzXDFijfX3U5rEyPYUO63PNJ4eK+fOBGnLh9jYAEyQsokIFtdIFZ4eGyRR0Mdb0Dyl4ThRgiRnIfxaR1idLMEB6twk1SoYUoXxJ3YlZ6AjLQutmf9pCtPT0RmhcufCiATClvpQrcFjkhcr+o7iqi7QMETpyVbzXMWZtakLHdfHs6at1l1RlTmteEZlfk1dxsKjmaLc+c1hR1oshVmR4Cf3NBAHi6r69cs8zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bx6qSRKRn8cjJGheI0ioKPC8e2iuSd0pxB4cTT/Fmbw=;
 b=FKzwurvfOI94UVIkykKhTi3kzLjPAHOVQ9oe3dHpZ+eprbOlKTvQNLunFiBmoNyuo6bqBLJjZc0cB9bAd5iTuQzxgndxMM7hqFN+UoxBio4CEqeMyRgWmC9ZWSdZdl8DhA/im1mb4Ad2UxRRTpthTfUpXSVqCZ2xVyyx4wpPAi3akmtQJrtf7JeJaOJgBXeT0TODZMgZPYDr6L00dWUQFtCNQGMeEUQrFQFCpGza46vqIW559jnss7uwiY+gSRBzQ3NZGLfulxwXQ8+iwrwU1qZ98ihZpb6uJVx1W7oFcFbYcMwXRfElicf5zJcQZiubm/P5ZRwk+Hf4AEi5HZDKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bx6qSRKRn8cjJGheI0ioKPC8e2iuSd0pxB4cTT/Fmbw=;
 b=SffStLz4Gb+racibN6Ip6DRann2Am9RhcffipObo/RLfBtHEFxbaR7l+JoiYZN/g6fv4+kMTGNPHGrG8/1HkujYjlI9MmxieVxc1bWka5Nsf3yPnZjPdZ4nCFhj2aKgmbmFjd7I3zbrpSqpt/QaMn+UAVJxjwaeGHlGX9cXZg374NbsTBMlImW31NE99gAUgbgGRnBpKuRvfSaAe6rZsszS1phZFnDQn9SgTwaPmOZd0jL9CiEPTLDqiX7+rqp6DMe2Kj9s4pOoyiC3zqJrg0rYX+Y5/LbxbB61fWBu77YuCdEgz5OW52/2ZKCZLWaE8ey6nmqgnH0BZUwDg1zloEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2117.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:526::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.4; Thu, 16 Jul
 2026 08:54:25 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.003; Thu, 16 Jul 2026
 08:54:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang
Date: Thu, 16 Jul 2026 10:54:22 +0200
Message-ID: <20260716085422.20905-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2117:EE_
X-MS-Office365-Filtering-Correlation-Id: 189ebaba-3319-4b57-acc3-08dee317d61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|12006099003|18002099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	41SngOyzyb1uuFpzPcTQCDi+GgJlEObQaEEP3eS/9547hCouhYwBPXfccjhgnmekzCNzMpFPdm6akPYGPTZSUDG9QdAu8Nu4sgFiarOjg7bs0BKzrmDPIO/iF9o1BDRAjqq/47Xo52Omw2Q3HtgHnfhyPQ4un2x2MDkHGViqgwty1YAYsKpiD+bariwoog9//zeJTjPQQot3GxipEUNMmQxwaFICHzv4UtJBDUZIWO9+WaoVKNSJATeA3QFZW/TJY2lRO/y8fNA1JxJhz3ODrvSxiwpqYoRgYu1XAtLYTJV25Rk3rHdE0aKtUojYD0R25EJ9pmkzm2yronNDD1i9qudJdjIMjFZTqe45vEELWM80qFLCHjESOAa81/v9xZuE2dtWZwKF6V3LFevAgWbqgm1uUyIuKsDjEqm70jpAbLq2lRWsQ9Uu92kaPdfkKaFr6vtrMiwR5uLxqGFRHTZNfBEkTSkW8o50sezUkdgQq4aY5QW/9cdfuswEkKyEMme3vnnOOf9/UAyuUjo7Tl572SZNRtJPX3ItU1c1sD6p0nz0ughsP5E/tqv8IgfPliPxq/FgpnmwQbpBtH0Nm2g0o1kf3MRRn9e9AwTw67OQMCItFt128PJxilQIQS0QPm5zuYOZlNRLtz0mcnJIwv3rwC7UyMQ1RRCIN24SQBnt1ZI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(12006099003)(18002099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VVcEUzeKB34uzQV3xz+M64p1eTh5eyWs1d7Cf393WImL0EXsa0Db6BhTgiwM?=
 =?us-ascii?Q?Uo970j+6bq2/UrSA9q6p0ZnOYticPM1+ydyrWkfzwNBE+8rXW5qszgdVW5YB?=
 =?us-ascii?Q?YNznEeLvRUdEDCnAoUYg5NxZA8T1Ja3peKbIl2NhJkTbLDZQ09M7KmVEYX3n?=
 =?us-ascii?Q?UrNuvWt7sS3ANmhG5/M5awtkkpdg5BqEJYDUWjRVl7iXot8PQ4kXKAiVzwpB?=
 =?us-ascii?Q?gOujeorjNtC6moOcTmb03An+vG/zhBAcm1tScSk6z+0TvBu40r32XbxBGXWU?=
 =?us-ascii?Q?A8U4w5jhl8BQnk9Si+6OAjJqI8d0eLPF2MA0gQFoqgnJ2VNN2EJOBD/KGtOw?=
 =?us-ascii?Q?3Z75VeEuqd4LDU2YZ3K+jgdYgNmc7XN7m0HCHm4DblpW3CX8EG+rOcsWuqA3?=
 =?us-ascii?Q?mTFUxX+2kjbHf5ZXtRx5qlpgiL03guxg/Mxp/nnWFUIan6DFDTyIW/DMQQaG?=
 =?us-ascii?Q?8UNrv+jk5GKFVJ4sa2KMmp8J9tCTatEmubcv/ZexTSi0l8mMiWgppped7szl?=
 =?us-ascii?Q?lyLLHqR/V5E9bhs1O3NL1L5kdnoRsrTytbaNXfPe7QPxWaxKLG3IWNRuMtIJ?=
 =?us-ascii?Q?IfCvtoYMb2+4kDA1Uo2XvKjETrOHWiknEujuo+newci0hhlbKWR1hwFHIECp?=
 =?us-ascii?Q?vMayDyHz9Tc5Y8qom7/sfBgEJktI9YCP6q12I9a5OpMVmSyf0q95y0OghAl+?=
 =?us-ascii?Q?PQt46jy0vTHE+KnHlXUjx8qV43uA4XK8Ox4+3lp4wjxlWQlwPx6RtHr4FrGv?=
 =?us-ascii?Q?lKt56Ovv/PE/gXH2PQfX4kFc7EHoKsgMoTv4fC8vai32FbtFSZVbnjalzIex?=
 =?us-ascii?Q?DBB2XIJzbkx1pAfkO7edUaK1Fj/Dn4oyNzSkcKC1eEF4ZqJh8XQgW+6k0/za?=
 =?us-ascii?Q?GTLPIm3a2P57I3ZhJHToAde4lhzOGt19OdzobuJqLcUnKyij9x3+a35UN5+a?=
 =?us-ascii?Q?sfO4mYY4LMELeTMNV13oD1X4FSSOnRdV/hCjcHKi7WfXcxfedO1x1GnlMcqw?=
 =?us-ascii?Q?Gavv9EnsiuaAYkQmR99AeZfdyeK7S5GyrdGQkUP66r3IHHfOOHUth9Q6rOxn?=
 =?us-ascii?Q?/9te5i2uvWkEm//YgKeKsT61mK3HQ+LWIuVeJNCr0oKtJwnhVTLL+QloYgTP?=
 =?us-ascii?Q?4tvsNiGAKiY+GRBrGGxoF3F0WWa2GzY6QjydemA0c6g/b/cFj0ljtRPtBKMQ?=
 =?us-ascii?Q?tuCbsOU1oyCNbqjECfAtvJxddw/KXZ4IHbBnTfKOAUoZIRt3wno/IB2WYIPD?=
 =?us-ascii?Q?CY74rFcCEj8HIIwi5g22H3DKIQxTmohjyRYZcO4XggBc8k43dd9SmKZrLaH5?=
 =?us-ascii?Q?2sScAoKniKE5g4gPwyFdUUAJU6qUAgCq4ZLMqkwREtQRPZf9Q2ltS465uYf3?=
 =?us-ascii?Q?v/gUZr0Kx8JaN1QMLmbMdlxSWK5BIJI/ZUpRO7dTf9P2XWQmD4OBL8hKP7Ho?=
 =?us-ascii?Q?OXqBqXODU9z9uQrWKZxDy94EHlAxiYB+fdz+J9ip5bijRjDvAvWQ3YTJQsOv?=
 =?us-ascii?Q?AbfUzjKi7dHFp1B663/vpcslqnQrh7wBMbiV9eFk+XEV2eBfKsRBQrGI3HqK?=
 =?us-ascii?Q?4n5Xt8PM9T9I6oH/962al3av7CwYPt5PL0hnditrhgiyH7vI955ZAN9A/QYr?=
 =?us-ascii?Q?q8dyEYAJeNUJYgvvlYQMpoT1SUa3KJRz87ijTnd6Iy2Cp4VsaZvTVPaKvYsN?=
 =?us-ascii?Q?laijuGCuq/1AY8Q8RO7S5EjejbmUgL5t584i1d9k6L0fPvxz9Jt2I8NPkYr3?=
 =?us-ascii?Q?Xzp/2MMqkOj85Rkz9MJoWU5PXOxFLOc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 189ebaba-3319-4b57-acc3-08dee317d61b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:54:25.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgCibVtzytCgotGJC8ikSMLi4WzSjQfq7rJbCfiKIuzsImou9cxBiF3jVb1XVUOZRwWIucukNuUJW1YMp03DTnvADiwWPXimyDkgjXtfh18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 08:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241070

From: Hongxu Jia <hongxu.jia@windriver.com>

According to [1]

As of the current version 1.0.8, bzip2 --version will print version
info but it will also continue compressing stdin:

  $ ./bzip2 --version
  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.

     Copyright (C) 1996-2019 by Julian Seward.

     This program is free software; [...]

  bzip2: I won't write compressed data to a terminal.
  bzip2: For help, type: `bzip2 --help'.

Debian (and its downstreams like Ubuntu) will patch this out [2],
making the < /dev/null unnecessary, port a part of debian patch
to fix the issue

[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a-=
program-like-bzip2
[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.p=
atch/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae4fe4263ba9d372f9b9e80df4ec4697b51c1f9b)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-fix-bzip2-version-tmp-aaa-will-hang.patch | 62 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-versio=
n-tmp-aaa-will-hang.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-a=
aa-will-hang.patch b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-versi=
on-tmp-aaa-will-hang.patch
new file mode 100644
index 0000000000..84206b2a4d
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will=
-hang.patch
@@ -0,0 +1,62 @@
+From a9dd6acbaca836fc4e943e69a31b2e7acda32045 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 13 Nov 2024 19:49:23 +0800
+Subject: [PATCH] fix 'bzip2 --version > /tmp/aaa 2>&1' hang
+
+According to [1]
+
+As of the current version 1.0.8, bzip2 --version will print version
+info but it will also continue compressing stdin:
+
+  $ ./bzip2 --version
+  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.
+ =20
+     Copyright (C) 1996-2019 by Julian Seward.
+ =20
+     This program is free software; [...]
+ =20
+  bzip2: I won't write compressed data to a terminal.
+  bzip2: For help, type: `bzip2 --help'.
+
+Debian (and its downstreams like Ubuntu) will patch this out [2],
+making the < /dev/null unnecessary:
+
+[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a=
-program-like-bzip2
+[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.=
patch/
+
+Upstream-Status: Submitted [bzip2-devel@sourceware.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ bzip2.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bzip2.c b/bzip2.c
+index d95d280..6ec9871 100644
+--- a/bzip2.c
++++ b/bzip2.c
+@@ -1890,7 +1890,9 @@ IntNative main ( IntNative argc, Char *argv[] )
+                case '8': blockSize100k    =3D 8; break;
+                case '9': blockSize100k    =3D 9; break;
+                case 'V':
+-               case 'L': license();            break;
++               case 'L': license();
++                         exit ( 0 );
++                         break;
+                case 'v': verbosity++; break;
+                case 'h': usage ( progName );
+                          exit ( 0 );
+@@ -1916,8 +1918,8 @@ IntNative main ( IntNative argc, Char *argv[] )
+       if (ISFLAG("--keep"))              keepInputFiles   =3D True;    el=
se
+       if (ISFLAG("--small"))             smallMode        =3D True;    el=
se
+       if (ISFLAG("--quiet"))             noisy            =3D False;   el=
se
+-      if (ISFLAG("--version"))           license();                  else
+-      if (ISFLAG("--license"))           license();                  else
++      if (ISFLAG("--version"))           { license(); exit ( 0 ); }  else
++      if (ISFLAG("--license"))           { license(); exit ( 0 ); }  else
+       if (ISFLAG("--exponential"))       workFactor =3D 1;             el=
se=20
+       if (ISFLAG("--repetitive-best"))   redundant(aa->name);        else
+       if (ISFLAG("--repetitive-fast"))   redundant(aa->name);        else
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-exte=
nded/bzip2/bzip2_1.0.8.bb
index f922490868..fa205edbb0 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${P=
V}.tar.gz \
            file://configure.ac;subdir=3D${BP} \
            file://Makefile.am;subdir=3D${BP} \
            file://run-ptest \
+           file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=3D=
${BP} \
            "
 SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] =3D "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248=
e682cd0c4a2269"

