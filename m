Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BB1C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:43:06 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18369.1786020176416194687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 05:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TX2G/7vA;
 spf=pass (domain: est.tech, ip: 52.101.72.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppRKEPaaW+TaMAxwbPX51gzZda4ewrpxhbXX6wKbZUfB/K62f7odP/oBvCcqM9tY0EMj93FbbQkofVBaUGWs8sgyXWm/my78XkZvY+Jpddj5CpXPkaBG5M/x1CJt4opm3TgXO0BNZCwQMf/1A30DjNv+q49ZNOd8fxTRCVFcSNL6QwdGWX8PZ25Uq3nINA4XjwjRwhcG3ji8W/KlC+vOEpHHMY78lV+Cm66FanomFSnJB7caaiVg6NCJ3SlPwgFeXVvrie+Z8UcTuGlX4xezIUl0MJ16eK0wFEGNMtwQczuJiug8ygkgwNut8gxy+2x6Z8s24ruz11efi4+eFOYq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieZTAGvI+hKlFn45pUbBr1r/3H1WvcUCDWT33joRdtc=;
 b=KW7blgNBYzvQHkfKDEWRHMHmbOtjx461MuOa8ne9UZLTDQYt7/n3AX3OhtC143IlQt/YixjvTYIYmaeA+sSQVAyHUMQcEE2NZpLmRzBaPMpCIiyH3DBYzw3Hv7qz9nsAMJ/wOvudrcfWqf8TZfJkAHFGZxgICwZpLXInC7PBpzPi45BOAkK1uUYF7kcfU0yCm4BMe+El7LA5gfTnGPLf2PmWk78XCBXn6ijOqgtnqnJvFM6u4nfSUJytC91Wi81Ty2T+1Ar67svF0B7+1ZrLPHUd54hitdTVD0KyZlZnp+QYtn8eiUCjvgylfVbh2WqK61KZTiEHJlukI+ti04/Yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieZTAGvI+hKlFn45pUbBr1r/3H1WvcUCDWT33joRdtc=;
 b=TX2G/7vALhWQn9tY9O3P76HKcfkNThekfu3bBpiVvHwCgQN7KrJFJUOiIJertQQuGSW/uwoBv7nQxYMEBGcoEKbmIGoD6ewmE8tNQ+tiQhufAJPC6lwCUMErshRE2nlBYsgu5kFRINAWhAW5ZuBoaTfQq5qXZG0H1OFLJfPTWKIN33XibF1rnEzK2rl+OR9a37M2x0Y/0Zeag+zgIikcRBiS3yd5onUEEWy+FcvX+Ln2DcWuDCH1a1ktXtJ5KjSrPuS+LgqTj7PQXNRf6/vqI7OWVkYstN8PpK1uS4KEhsx6tPdzMKT2mR2IWiDKv4bOMNbycc4q5SCtK/5OL+dQDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3603.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:500::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.4; Thu, 6 Aug 2026
 12:42:51 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 12:42:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] python3: upgrade 3.14.6 -> 3.14.7
Date: Thu,  6 Aug 2026 14:42:46 +0200
Message-ID: <20260806124246.26004-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0614.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3603:EE_
X-MS-Office365-Filtering-Correlation-Id: 33693af0-dd61-41b1-3c7d-08def3b83a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|11063799006|5023799004|12006099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	RGi2LEvhidr1kxSflRp2RAdhVpbd1+u8qVlGd2tXNjwRRcvYSHnC5PS5MI1Dhrpw/igSJFyluXbjZTSI58cd5DawYFlw+SsEpAtTTNzgMP+espyfTw8SZct+QWKmr1oOWNAHEc+uhQSc2cXy0ts1v/u37cWBIPbOTFSor6TciFdcKiGF9JN/10pdvw6a1nMkFU16d7i7GjLKd/R1UvpLnCr6id7xKfa9E4lNNkhYnDwEwAatKVwqyU7YI0Bcwu9zMfMAxD6xxdAFqpruN1RKqMEVz7R7W+DOtwFHLIPzr3Wn5PtdmMuEw8CVmHBh1qxdQTOxo6Cohs7oE1z0gG7c466V+c28Yz6JlYHM41La3Po+HbDERpaWELQV8QE1KCYkLHopuD3auvph4pmb36M9rGB3mI7iBqI8nrFlw77akONPbDDzm8jaNkj0lmichQ7aGBQrsWI5hIHHFPpusfXMi/TLozmS+oUgOnpk2wUUKh23lr9+BJCqf09diAUPJyZFXICpVX1K7gIfEqMnfvGMv8Yms+GCMUdvVzl+cxCVFOU8KElyXmtuFLp+F8Lc+ZTKs5+uhHX8SCfU7iGYXJ6Qxp37NzDBmXJhWDCAL8dV7wJfGK3VEnjgDqhM6kbneGa+VL8yzW09sUBMFtGkgNZuNREIBcxacAG40rr9IkiaeXs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(12006099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fR360dBL6eYbkhmhszMFgxcGMbkERQ2k/AVvpyRSnJ8tjRkrqgwf5TsnlbKw?=
 =?us-ascii?Q?t6rR8xM+OdjwbJj9AxXBpgBKJ/xoEzYQjno0sOQLAzq6gI423JvUe4wZCI/H?=
 =?us-ascii?Q?MqnLZhV7cOYF/ltJL+jy4ccbtMUP293Sp2n1rwuatD/wydlclzKcQvSIZmtK?=
 =?us-ascii?Q?gBQkOMxQtX/2qKstUcf3w6U4p9yoKgfF94AyCYPBVeHYWgmZsaC9R8GeV+oT?=
 =?us-ascii?Q?hVVKenAasJEmVwp3i2w7cx7j1Aaxw7AG83N+riuzgMzTlbHNq2S+bZZA+DBY?=
 =?us-ascii?Q?XjOt036Zjczh1zvrlzl/YKdL8/6BIWyIa+V9f7IyQ3aDsoTqoyHUF7OvhbCf?=
 =?us-ascii?Q?SUuNs88nBOzHDQhajzixMRVj0nSTanSq7UoaK+y50dsYLIIwW6ZbJPYVCEaG?=
 =?us-ascii?Q?Vn0lgrECtc0jEBMeYAbOrwqr0LgUQPRyOs0uePpRN5gVypdARaWjEShbPMiy?=
 =?us-ascii?Q?PFbCkuz7BkR9GEuPU2LJOVBnHHwC0/BZ80Omdg53xBqYAtRjibAt8r0nPHBE?=
 =?us-ascii?Q?SyAf7kAl/Q6wPnfMQWXWpga0RiS24CljISc1WtnXwWWEKrxhAKLyxFIUiNVZ?=
 =?us-ascii?Q?A+GjCQboteikmM5RnXCRshioOlJjj4VzbZ1Aw4fjt7YOnNjyHOAwIm1yaGvd?=
 =?us-ascii?Q?JgqtzTpCCXjBse1/xqbax4T91TPL1tkE7NpiFxQWZTdWLZGNFXVWJ04x6CK8?=
 =?us-ascii?Q?z7lwjOQ1AQOwYGyy3qkaEUqkPmnEXwUUNM2ZxyxkOAhKCqTg5l47g0d2MbBB?=
 =?us-ascii?Q?THNDqvPBo+URGRFaKjecd05L/jrul3Uo3O8i/gPygEK8VDyTMGTF8jDNZrQi?=
 =?us-ascii?Q?3z+AWf2SY46QtKz7RERTOLDQY2oA6IlhRIKpzUcfrHzCtonA/Nt4jhOZ2Vzp?=
 =?us-ascii?Q?5ObYbax2ZJhOzKYZgz93dAQpC24QKbFnXT86JSnNyOSWy4RA/tbtUgr0W9zt?=
 =?us-ascii?Q?+goGAQKhKgSaeY/NnHWHC3qP5AwJM+z1CjJ03Ukesqg+Sjza/gmDvVgjjEQ0?=
 =?us-ascii?Q?uu5ewa8SyMMM+Guu2eO4r3kfy1GEGIQGX3cs0FBl+sr8+OHRryiWK6L7138Y?=
 =?us-ascii?Q?jL6hW2tuENTojFivaaw+TBEJwEnXf7isGB4Gu9NCGgNDAhXRGJgVgXZznuEK?=
 =?us-ascii?Q?9T32DNLK3uQakHMZ+F9K/T0HYJHSixKzdj2C9bbm6XWGaJdxSK+I1hTgCcln?=
 =?us-ascii?Q?NjsgjIWaj8fSu7K5haodcbU1AbGSvxTgIBd/qOwhkQkEqn5hh2nHHqUkS0nq?=
 =?us-ascii?Q?wo/IRs+vfd/YCaJ3QkSkBrygCbJDIzuu9rOPxMNCktmQi7wbygYgWEn7jUe9?=
 =?us-ascii?Q?gPuZsvlxxFiy2jQovqfxL34qo+1GsK2gymVT8bp1062OkInZ+ye99Hj3tjzW?=
 =?us-ascii?Q?cQxUShzPKRkbgEA52c8Z+4tlugHuAqO5DVwcPuNUJHn61/Gxo+/xM5HNLQaw?=
 =?us-ascii?Q?SvCbKnIsRXyko9tAhoJNXVw5wrLF6BDTiMzkXitUaGO8ZRT5Qt3C63fLg6jd?=
 =?us-ascii?Q?uTPOqhf/LLH3a1evsHEBp2pgkrymkNslcTeNnwJvb4+O5opLQ9I43wVG5oGG?=
 =?us-ascii?Q?DphUU6qiLVtjvFCGcz6BusghupMyv4VUyPqZPwLHA+pvfW9uyLO6FSn8VSN5?=
 =?us-ascii?Q?M9MPY4u0msgfSZrd1BcuN0vrb12TeTSMAxaKbtVDrIo3+ehOMQfUcH/by39i?=
 =?us-ascii?Q?GDQ7tm0xl8IELunzqXKQfetnRoysLlv57kChi38wooVOyvojWDnj3Hqif5OD?=
 =?us-ascii?Q?nwMA/2KwpeF8aDxCqG55egtyGc8SO84=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 33693af0-dd61-41b1-3c7d-08def3b83a20
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:42:50.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjMEZWDNzzXP+luHTg3SZRR1p4N+sWF6ruDUu0LFbKKA2etYl10dic9wUAov5tPqmuKk3+SeMKwnSEvvOhr6kreqczNnBETMTi6GP/v2SG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3603
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 12:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242941

Release notes: [1]

Resolves following CVEs:
* CVE-2026-4360
* CVE-2026-11940
* CVE-2026-11972

Removed patches included in this release.
Removed obsolete CVE_STATUS entries.

[1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-7-final

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   4 +-
 ...-use-prefix-value-from-build-configu.patch |   7 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   9 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   4 +-
 .../0001-prefer-valid-entrypoints.patch       |   2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 .../python/python3/CVE-2026-11940.patch       |  67 --------
 .../python/python3/CVE-2026-11972.patch       |  61 --------
 .../python/python3/CVE-2026-4360.patch        | 148 ------------------
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/valid-dists.patch          |   2 +-
 .../{python3_3.14.6.bb =3D> python3_3.14.7.bb}  |  10 +-
 14 files changed, 26 insertions(+), 310 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.pat=
ch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.pat=
ch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4360.patc=
h
 rename meta/recipes-devtools/python/{python3_3.14.6.bb =3D> python3_3.14.7=
.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overfl=
ow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Av=
oid-shebang-overflow-on-python-config.py.patch
index c2106f9437..7a60538364 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-p=
ython-config.py.patch
@@ -1,4 +1,4 @@
-From 6b111a328c1c57b1580d63894b2b5d337316f6d4 Mon Sep 17 00:00:00 2001
+From 3f2df0e1fce8c7425998dade00d084f1b101a982 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
=20
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9ec3a71..f7d5382 100644
+index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2829,6 +2829,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/=
python-config.sh
+@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/=
python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >pyth=
on-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-st=
din-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index d9072a36f7..532adfe69a 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 129ee75863081d9e3418acca3df1e47667f671ad Mon Sep 17 00:00:00 2001
+From 9cd44429215352eb2753e0fd8e25fef24f714006 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/=
O
@@ -29,7 +29,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 4 insertions(+), 1 deletion(-)
=20
 diff --git a/Lib/pty.py b/Lib/pty.py
-index 1d97994..fa8821b 100644
+index 4b25ac3..d6aac07 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
 @@ -149,7 +149,10 @@ def _copy(master_fd, master_read=3D_read, stdin_read=
=3D_read):
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use=
-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 285580195b..60391e726b 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From e3c6e770e73e1329958db0a73883e42b01763ae3 Mon Sep 17 00:00:00 2001
+From b5aad6a9b6c5add7a85861aed8aa030c1ad3d52f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configurati=
on
@@ -18,7 +18,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 2ecbff222fe..cec54cb23dc 100644
+index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -538,12 +538,12 @@ def _init_config_vars():
@@ -39,6 +39,3 @@ index 2ecbff222fe..cec54cb23dc 100644
      _CONFIG_VARS['implementation'] =3D _get_implementation()
      _CONFIG_VARS['implementation_lower'] =3D _get_implementation().lower(=
)
      _CONFIG_VARS['abiflags'] =3D abiflags
---=20
-2.51.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qem=
u-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index e25797f57e..c7f14cad1e 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From e7a8a7385f561f214054cf95f0a22bfa064eee0b Mon Sep 17 00:00:00 2001
+From d6f77e3a934616d1f6c083b7144c50a32e08b70a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile dat=
a
@@ -15,10 +15,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
=20
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3bd4495f95b..8e8fc60bc76 100644
+index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -857,8 +857,7 @@ profile-run-stamp:
+@@ -861,8 +861,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
@@ -28,6 +28,3 @@ index 3bd4495f95b..8e8fc60bc76 100644
  	$(LLVM_PROF_MERGER)
  	# Remove profile generation binary since we are done with it.
  	$(MAKE) clean-retain-profile
---=20
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfi=
g-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
Update-test_sysconfig-for-posix_user-purelib.patch
index 6a62c6dc5b..5509b7475a 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 5bf5aa6eae1fa3eed66893e51a1858ab481426b4 Mon Sep 17 00:00:00 2001
+From c608cb4b3c8c31f1aa25ad1264ff58733fb99769 Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -22,7 +22,7 @@ Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index 1ade492..4e94889 100644
+index 1fe4b68..383142a 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
 @@ -434,7 +434,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironm=
entMixin):
diff --git a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypo=
ints.patch
index 1250dc9ff0..ae3698fac4 100644
--- a/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
+++ b/meta/recipes-devtools/python/python3/0001-prefer-valid-entrypoints.pa=
tch
@@ -1,4 +1,4 @@
-From ef33ac27e3ac1b9cb159d7eec0ad1af120cd9dc1 Mon Sep 17 00:00:00 2001
+From 8d7fcf04c6513841c7985e64b746b1ef5de0c426 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Apr 2026 16:53:42 +0100
 Subject: [PATCH] prefer valid entrypoints
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-pla=
tlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
sysconfig.py-use-platlibdir-also-for-purelib.patch
index b9c68a98d7..7807827d9a 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From bbcb17dc1ed283f41c8cd94d39f70898f0c45583 Mon Sep 17 00:00:00 2001
+From c10d1b295a9fb93836830cce441da3f22e5c7cd7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 80aef34..f8e1c7d 100644
+index faf8273..0a8bcc0 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -29,7 +29,7 @@ _INSTALL_SCHEMES =3D {
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-corre=
ct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001=
-test_locale.py-correct-the-test-output-format.patch
index 201271b0c0..a60d082e2f 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch
@@ -1,4 +1,4 @@
-From c1f3cf625c0f011060ddaa2a4096f6aa13dd1ee6 Mon Sep 17 00:00:00 2001
+From f0ac5b479b99bfb7f5e937a941b31a596f4caafc Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -31,10 +31,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index da4bd79..fd9e67d 100644
+index f918435..1910a43 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -500,7 +500,7 @@ class TestRealLocales(unittest.TestCase):
+@@ -499,7 +499,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc =3D locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch b/me=
ta/recipes-devtools/python/python3/CVE-2026-11940.patch
deleted file mode 100644
index 05a5802c39..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11940.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From e24b4e95524fbe8cd0f46aa3292e8040f0e07c83 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 23 Jun 2026 15:58:47 +0200
-Subject: [PATCH 1/2] gh-151558: Fix symlink escape via `tarfile`
- hardlink-extraction fallback (GH-151559)
-
-CVE: CVE-2026-11940
-Upstream-Status: Backport [https://github.com/python/cpython/commit/27dd97=
0bf6b17ebca7c8ed486a40ab043ed7af8f]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- Lib/tarfile.py           |  3 +++
- Lib/test/test_tarfile.py | 24 ++++++++++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index e6734db24f64..63f23490e8a1 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2782,6 +2782,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
-                     "makelink_with_filter: if filter_function is not None=
, "
-                     + "extraction_root must also not be None")
-             try:
-+                filter_function(
-+                    unfiltered.replace(name=3Dtarinfo.name, deep=3DFalse)=
,
-+                    extraction_root)
-                 filtered =3D filter_function(unfiltered, extraction_root)
-             except _FILTER_ERRORS as cause:
-                 raise LinkFallbackError(tarinfo, unfiltered.name) from ca=
use
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index d974c7d46ec1..0fc7413be8db 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
-                     self.expect_file("boom", symlink_to=3D'../../link_her=
e')
-                     self.expect_file("c", symlink_to=3D'b')
-
-+    @symlink_test
-+    def test_sneaky_hardlink_fallback_deep(self):
-+        # (CVE-2026-11940)
-+        with ArchiveMaker() as arc:
-+            arc.add("a/b/s", symlink_to=3Dos.path.join("..", "escape"))
-+            arc.add("s", hardlink_to=3Dos.path.join("a", "b", "s"))
-+
-+        with self.check_context(arc.open(), 'data'):
-+            e =3D self.expect_exception(
-+                tarfile.LinkFallbackError,
-+                "link 's' would be extracted as a copy of "
-+                + "'a/b/s', which was rejected")
-+            self.assertIsInstance(e.__cause__,
-+                                  tarfile.LinkOutsideDestinationError)
-+
-+        for filter in 'tar', 'fully_trusted':
-+            with self.subTest(filter), self.check_context(arc.open(), fil=
ter):
-+                if not os_helper.can_symlink():
-+                    self.expect_file("a/")
-+                    self.expect_file("a/b/")
-+                else:
-+                    self.expect_file("a/b/s", symlink_to=3Dos.path.join('=
..', 'escape'))
-+                    self.expect_file("s", symlink_to=3Dos.path.join('..',=
 'escape'))
-+
-     @symlink_test
-     def test_exfiltration_via_symlink(self):
-         # (CVE-2025-4138)
---
-2.54.0
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/me=
ta/recipes-devtools/python/python3/CVE-2026-11972.patch
deleted file mode 100644
index 12a79754fe..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 2d256d4bfd654bdcaf2d96733799be73b8ff8f69 Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Tue, 23 Jun 2026 15:13:30 +0200
-Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
- (GH-151982)
-
-Co-authored-by: Stan Ulbrych <stan@python.org>
-
-CVE: CVE-2026-11972
-Upstream-Status: Backport [https://github.com/python/cpython/commit/f50bf1=
3566189c8d0ce5a814f33eff3d89951896]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- Lib/tarfile.py           |  4 +++-
- Lib/test/test_tarfile.py | 16 ++++++++++++++++
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 63f23490e8a1..399f906efdff 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -524,7 +524,9 @@ def seek(self, pos=3D0):
-         if pos - self.pos >=3D 0:
-             blocks, remainder =3D divmod(pos - self.pos, self.bufsize)
-             for i in range(blocks):
--                self.read(self.bufsize)
-+                data =3D self.read(self.bufsize)
-+                if not data:
-+                    break
-             self.read(remainder)
-         else:
-             raise StreamError("seeking backwards is not allowed")
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 0fc7413be8db..045377d620cc 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4786,6 +4786,22 @@ def valueerror_filter(tarinfo, path):
-         with self.check_context(arc.open(errorlevel=3D'boo!'), filtererro=
r_filter):
-             self.expect_exception(TypeError)  # errorlevel is not int
-
-+    @support.subTests('format', [tarfile.GNU_FORMAT, tarfile.PAX_FORMAT])
-+    def test_getmembers_big_size(self, format):
-+        # gh-151981: A loop in seek() for streaming files tried to read t=
he
-+        # declared number of blocks even at EOF
-+        tinfo =3D tarfile.TarInfo("huge-file")
-+        tinfo.size =3D 1 << 64
-+        bio =3D io.BytesIO()
-+        # Write header without data
-+        bio.write(tinfo.tobuf(format))
-+
-+        # Reset & try to get contents
-+        bio.seek(0)
-+        with tarfile.open(fileobj=3Dbio, mode=3D"r|") as tar:
-+            with self.assertRaises(tarfile.ReadError):
-+                tar.getmembers()
-+
-
- class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
-     testdir =3D os.path.join(TEMPDIR, "testoverwrite")
---
-2.54.0
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4360.patch b/met=
a/recipes-devtools/python/python3/CVE-2026-4360.patch
deleted file mode 100644
index d381508959..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2026-4360.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 66c8bc346c0c614edc05535145c0424a14fba213 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 29 Jun 2026 21:11:22 +0200
-Subject: [PATCH] gh-151987: Pass filter_function to `TarFile._extract_one(=
)`
- during `.extract()` (GH-151988) (#152609)
-
-(cherry picked from commit 7ccdbaba2c54250a70d7f25632152df7655a5e0a)
-
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Seth Michael Larson <seth@python.org>
-
-CVE: CVE-2026-4360
-Upstream-Status: Backport [https://github.com/python/cpython/commit/5e0ef3=
f1afe892e4f64eb83368db57ac4c40cba0]
-
-Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
----
- Lib/tarfile.py                                |  3 +-
- Lib/test/test_tarfile.py                      | 92 +++++++++++++++++++
- ...-06-23-14-19-30.gh-issue-151987.8mNIMf.rst |  2 +
- 3 files changed, 96 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue=
-151987.8mNIMf.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index e6734db..2c46179 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2510,7 +2510,8 @@ class TarFile(object):
-         tarinfo, unfiltered =3D self._get_extract_tarinfo(
-             member, filter_function, path)
-         if tarinfo is not None:
--            self._extract_one(tarinfo, path, set_attrs, numeric_owner)
-+            self._extract_one(tarinfo, path, set_attrs, numeric_owner,
-+                              filter_function=3Dfilter_function)
-=20
-     def _get_extract_tarinfo(self, member, filter_function, path):
-         """Get (filtered, unfiltered) TarInfos from *member*
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index d974c7d..9a15585 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4399,6 +4399,98 @@ class TestExtractionFilters(unittest.TestCase):
-                     st_mode =3D cc.outerdir.stat().st_mode
-                     self.assertNotEqual(st_mode & 0o777, 0o777)
-=20
-+    @symlink_test
-+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
-+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
-+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
-+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
-+    def test_chown_links_on_extract(self, link_type):
-+        with ArchiveMaker() as arc:
-+            arc.add("test.txt",
-+                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
-+            arc.add("link",
-+                    type=3Dlink_type,
-+                    linkname=3D'test.txt',
-+                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
-+
-+        with (
-+            os_helper.temp_dir() as tmpdir,
-+            arc.open() as tar,
-+            unittest.mock.patch("os.chown") as mock_chown,
-+            unittest.mock.patch("os.lchown") as mock_lchown,
-+            unittest.mock.patch("os.geteuid") as mock_geteuid,
-+        ):
-+            # Set UID to 0 so chown() is attempted.
-+            mock_geteuid.return_value =3D 0
-+            tar.extract("link", path=3Dtmpdir, filter=3D'data')
-+            extract_path =3D os.path.join(tmpdir, "link")
-+
-+            if link_type =3D=3D tarfile.SYMTYPE:
-+                mock_chown.assert_not_called()
-+                mock_lchown.assert_called_once_with(extract_path, -1, -1)
-+            else:
-+                mock_chown.assert_has_calls([
-+                    unittest.mock.call(extract_path, -1, -1),
-+                    unittest.mock.call(extract_path, -1, -1)
-+                ])
-+                mock_lchown.assert_not_called()
-+
-+    @symlink_test
-+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
-+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
-+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
-+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
-+    def test_chown_links_on_extractall(self, link_type):
-+        with ArchiveMaker() as arc:
-+            arc.add("test.txt",
-+                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
-+            arc.add("link",
-+                    type=3Dlink_type,
-+                    linkname=3D'test.txt',
-+                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
-+
-+        with (
-+            os_helper.temp_dir() as tmpdir,
-+            arc.open() as tar,
-+            unittest.mock.patch("os.chown") as mock_chown,
-+            unittest.mock.patch("os.lchown") as mock_lchown,
-+            unittest.mock.patch("os.geteuid") as mock_geteuid,
-+        ):
-+            # Set UID to 0 so chown() is attempted.
-+            mock_geteuid.return_value =3D 0
-+            tar.extractall(path=3Dtmpdir, filter=3D'data')
-+            extract_link_path =3D os.path.join(tmpdir, "link")
-+            extract_file_path =3D os.path.join(tmpdir, "test.txt")
-+
-+            if link_type =3D=3D tarfile.SYMTYPE:
-+                mock_chown.assert_called_once_with(extract_file_path, -1,=
 -1)
-+                mock_lchown.assert_called_once_with(extract_link_path, -1=
, -1)
-+            else:
-+                mock_chown.assert_has_calls([
-+                    unittest.mock.call(extract_file_path, -1, -1),
-+                    unittest.mock.call(extract_link_path, -1, -1)
-+                ])
-+                mock_lchown.assert_not_called()
-+
-+    def test_extract_filters_target(self):
-+        # Test that when extract() falls back to extracting (rather than
-+        # linking) a hardlink target, it filters the target.
-+        with ArchiveMaker() as arc:
-+            arc.add("target")
-+            arc.add("link", hardlink_to=3D"target")
-+        def testing_filter(member, path):
-+            if member.name =3D=3D 'target':
-+                # target: set read-only
-+                return member.replace(mode=3Dstat.S_IRUSR)
-+            # link: don't overwrite the mode
-+            return member.replace(mode=3DNone)
-+        tempdir =3D pathlib.Path(TEMPDIR) / 'extract'
-+        with os_helper.temp_dir(tempdir), arc.open() as tar:
-+            tar.extract("link", path=3Dtempdir, filter=3Dtesting_filter)
-+            path =3D tempdir / 'link'
-+            if os_helper.can_chmod():
-+                self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
-+
-     def test_link_fallback_normalizes(self):
-         # Make sure hardlink fallbacks work for non-normalized paths for =
all
-         # filters
-diff --git a/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987=
.8mNIMf.rst b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987=
.8mNIMf.rst
-new file mode 100644
-index 0000000..9eea7b3
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf=
.rst
-@@ -0,0 +1,2 @@
-+The :meth:`tarfile.TarFile.extract` method now applies the given filter w=
hen
-+it extracts a link target from the archive as a fallback.
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch
index b29ea56cc3..248a521118 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 2b458b4e1bcd57e3f135d3f0e715f64b98b27906 Mon Sep 17 00:00:00 2001
+From b41557f570ff4451c477669d6ca5bfacabe21c66 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoun=
dation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index be1b9ea..9ec3a71 100644
+index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2735,7 +2735,7 @@ COMPILEALL_OPTS=3D-j0
+@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=3D-j0
  TEST_MODULES=3D@TEST_MODULES@
 =20
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/=
recipes-devtools/python/python3/valid-dists.patch
index 38b6ebc5cb..7fe18254e5 100644
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -1,4 +1,4 @@
-From a65c29adc027b3615154cab73aaedd58a6aa23da Mon Sep 17 00:00:00 2001
+From 66874ce1a9f21b4b00dc85919734d58e6243ca29 Mon Sep 17 00:00:00 2001
 From: "Jason R. Coombs" <jaraco@jaraco.com>
 Date: Tue, 23 Jul 2024 08:36:16 -0400
 Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving b=
y
diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.6.bb
rename to meta/recipes-devtools/python/python3_3.14.7.bb
index 77333ce3e2..7c0bd41337 100644
--- a/meta/recipes-devtools/python/python3_3.14.6.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -22,15 +22,12 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch =
\
            file://0001-prefer-valid-entrypoints.patch \
-           file://CVE-2026-11940.patch \
-           file://CVE-2026-11972.patch \
-           file://CVE-2026-4360.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \
            "
=20
-SRC_URI[sha256sum] =3D "143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c5764=
20d605e9f30c63"
+SRC_URI[sha256sum] =3D "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e25=
2c11a66be27f81"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -589,5 +586,6 @@ py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
=20
-CVE_STATUS[CVE-2026-6019] =3D "cpe-stable-backport: backported to v3.14.5"
-CVE_STATUS[CVE-2026-7210] =3D "cpe-stable-backport: backported to v3.14.6"
+CVE_STATUS[CVE-2026-4360] =3D "cpe-stable-backport: fixed in v3.14.7"
+CVE_STATUS[CVE-2026-11940] =3D "cpe-stable-backport: fixed in v3.14.7"
+CVE_STATUS[CVE-2026-11972] =3D "cpe-stable-backport: fixed in v3.14.7"

