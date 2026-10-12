Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447D1CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13141.1791811218138366613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yH4Ec1eL;
 spf=pass (domain: est.tech, ip: 52.101.69.71, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFORxi55MqvcFP3+UI3FwHHbHlSXFrZOiZE31eRBni9l56GW8YgKAEgqXvK3JfSiHEC6nMYD5S6CgX/et3YgC69CByzOR/LsbUe1eusEGlwT10jcd42qnkM5hHz+7SsRWUdi042RwLCfVdXBdjeCe3oCX35Iov0zrZhftGvImzkMSb3ZPqYcpaN1vZURA2QJ4mKTVY9aIjJY+BXMwLuhxGXfknjGN/EhjOJL1bh1Tz7xTokxxVEyeSNZtusafi9TMIoVYU+oFflIW+St3VveSN3LGy6t1O6EHSm0BM+Ic1yqEwEF4Hn0DJRv5K8H4OGfY8kKU3tfOcOUDZIpDStq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6niljhDoEEQiWWotxQCP7Re2fIl0LN5osTONHSenxyo=;
 b=uPhOXCCGQR08gl8WrdZL1BGIDN4eoRYkw09POKVCFcrr5GuRA+R29WO3PYGzJMYHs2tgYmy4peBXuLO2l84z20cBmLzDG0+NhabJ8IiCGGkW8HbEnJ8vh3L1YiHdbt/GN+sfAh0RzdhWfTBVJHictf2ujznp27WceAq3c0PvNVJWlaVoWCex77ybCLmVGPsJd0dDs0nuYvr7Wls+i+NiBhCtm2nf9Pc7sIT0PFl6/alHbR5nrmbzIwI7zYkJgYAxuoC0A1Wkd49r0zmR68K+m91V1oiJTZmcfm5Oc4vERaYq868qh9AX46+OvFGLgL3E0OwrQyx4qmGfO3zENcZ0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6niljhDoEEQiWWotxQCP7Re2fIl0LN5osTONHSenxyo=;
 b=yH4Ec1eLcEGlVIxv6J3e53uaWaNakJeu03QljrqRvK7ayn9ogzi9aSwp8BY8YDgchcVODrV2Dmlz820F+HK/kuGKcM20MEMcDQgX0fUxWUj501DmxpwTE0IXjtR5BXpll2/Dosuxm4EMGOTEJVn8Wlkwb12g9R3lFQIHSN6A2oF5m+Re4o9Acai4XeDa9NqQbfzN/HBSk50+TNZAEF1fSeK9U+WjDWAiAWa6z71yJcLlxvoh4OeYZGF7znxEbYOpF3i7tjoYU9w2sNVZnjGFSUkWuroWMx1xPKiDsaIRXhwOvyFu8Z9w16+jrewLITFRQOtzOVsu1hp7VoDEjlv5Rw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:13 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/18] gstreamer1.0: upgrade 1.28.7 -> 1.28.8
Date: Mon, 12 Oct 2026 15:19:51 +0200
Message-ID: <20261012132005.23909-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::35) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: bc533766-d816-491f-d23a-08df28638c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|11063799006|12006099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	crQWDlbVQXU4MXnn3Sdpg9+g8sZKctwwbrqX1GntV+a/HfTgctYPaz9Fsjq1+RA+2OnsOE7zXCP645mSLhIwMX8YSRWCDi9df9avTtKI/yBmjS/RD51nfDy3IwumAbP0XgzBzQTcvz+TYqqr/WS1GIPNNghmwCpaOpaooIN6vcoeOCCB04oyciM72WaHV2CmzWATV00gvGlRIw3tNV+w6BVRtJeCYRflLI343GRp3cbonnpwNU5VZaLpPXweqwZ6PSIxFgn7nmErX2cWu6FinhBUqFWr/5BV77MuOPPwDH4ldwjqHLuTw8AT151pm/bPb0yCajlblAkI35UUnn3xRxxF2vO2IbyR/z7E8xIL3V/pnG4TFxEBOdUzzPGV6X47E7mpRrZN01VlP6iG97V4pQt9NpywYyT4BNPp4JqbwODFIdvAQPqvt016Qchrgrzn0Z4GhjkKQr2usrEXlJ50fjE15m5KduxHdsyfW/QrDKTtQvti/95ZvgbEnprZG5btu6CL5XAq+5ADi5x4JI3vxCuNdyQss2DRfMEJ3+nMghS9irLPQRJUNSvwX4ClfG8KGRh1X4defRXPKuyni6znpyxSWD7tiK0w4yJ9MgcZoI0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(11063799006)(12006099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?St/RIUBhm/JiEzp8byqGuQTI6o6BwUcgkWgOjWAu8IQ371FCb9KI0MVQ9/dg?=
 =?us-ascii?Q?CQSnDVETZ8ALnKAGxd4Oez8CeCMS27QVyoVBUopcUvMzFBl//7J5b51w8fyx?=
 =?us-ascii?Q?THKtzlKpmuA2y8hUxjn4dL2TkWQFiLTXBgRz8oEfvWKqOhlNtxUaVvqTQT76?=
 =?us-ascii?Q?Zm4oLHL2kOkiMP3ajFddgKrEqxjNetuSH8lNB+1LFfuqLyqzRxXv2H7KSN5M?=
 =?us-ascii?Q?YxhwlPYjEsNFAs8a82sSLyQZrz4i1TokqZHSKss2zYX5kNITTOHrkN0YFpZj?=
 =?us-ascii?Q?VTuZ4MgB+AxkpgkZ4PNxn7bpPjKq5HX2kIlNcWC1zTNEUVIGNwaIAIc0JCqA?=
 =?us-ascii?Q?5EeB6WH4L7GNGd9xqcxoS77EhSeYMJzu8uVyLo1hreN3KsaJlr4IT8mjX121?=
 =?us-ascii?Q?WrIqeR6Kz55XjnwuGTBiw2KjQqcy+pyvrAb2/dKj0UBKqsX4k+l4zeVZlsgv?=
 =?us-ascii?Q?X8NHDF9oeT3YbrMKm3/rITbwY1Hkf4kTOL61ZsZYS5NrAJiR+fF2r4DpN+pC?=
 =?us-ascii?Q?Mj1LMTBHKUhjclGz+YhX5n0rfHQmGaoc/f8AmxUsjAUIDRhC1OvhKsGy8p0B?=
 =?us-ascii?Q?QNKBlKJIgAgfIvtyZAd7summQvUqEHtbzKam7sVuOXyAuCCYrKvNottndwbL?=
 =?us-ascii?Q?CJZ0ts5o0bI+GLshfGN/LhySxP8QrmcEUmkTnlEYOwmZy+1BasPyfiMGTDJv?=
 =?us-ascii?Q?EmnkWoTG6l+GwaJAif2ozBTtRjFOODtyrA18fH1L5Ncgea8Y+vohpnpa1Tma?=
 =?us-ascii?Q?AIyoSF43MRtYhyw0IoNIHMYnn0+reJmLSiKV1jamd0hiTQhqigB//HqlF2p4?=
 =?us-ascii?Q?NLF/AmH7RgXdFXpp3gTzR8ziuQFH96TIXBi931Nl/j9aH9OSnJTIqKev7yyt?=
 =?us-ascii?Q?xIxmiPSyJ8vqKjGsCL8hhri7PDth/Dmn0jyAs0crbCb/KiEmMTPpZzMRAYOr?=
 =?us-ascii?Q?GD3knMwvnopyU4LFNq/CtFUj+DwiB41jj1tnUUgjG+zvRK+QR+Yka+gFTsvO?=
 =?us-ascii?Q?djOJrmsrdriEx+RM5YUaH0dJXRo5LxnXkpYFLHETlXp0D4fnaWiLpfykhM3z?=
 =?us-ascii?Q?rrOFM6GTZItSRu2kAfNtQu7B6YaW7Os9iSaRttT9FwH6P5kHMpBFR5VaeQJp?=
 =?us-ascii?Q?E36QskhZUsYZXvz1m6Su7YirRTqVbWpLOYif28Cm46qpC9R7FRRrA3q9BD83?=
 =?us-ascii?Q?PjxAfiggLAIxtT/TSv4BkOYgAiIMzKMwVbPv8Ix9tJmb4q+PlPA8vWDpQ2IA?=
 =?us-ascii?Q?FN7LRLynLJRDyWTHTC33SpbWuV2C4XMl1FnzhSoy+E9vnPQWN+6fIcsjxWtD?=
 =?us-ascii?Q?BdDFpmcFQfKDrK+zez8UMqOH/Bmm6UskO9aMLWZgazEsaQLygLtwtDe2Qwqe?=
 =?us-ascii?Q?Q/9JAOyhC3GivofLJiqH2klqk9risjwdbyvmm88i1JYLUFHG+G1t/0WxDZn7?=
 =?us-ascii?Q?BvV38oXgHvcWUXyUPBInaocmbSXKgxIP9RIxLe/ehtM8VLrBWqXraioRi8hV?=
 =?us-ascii?Q?SMtkgMlESf2ps7sMCiVKZv9UkQnJ8hNyYpQCwpLWVW4w4/jmltUcrdMo1iE8?=
 =?us-ascii?Q?bSZj6sCjHPim0GgstrVOneC92SsuwCu69M+SvG1NaIop+Vf9E3R9OJ36cCkr?=
 =?us-ascii?Q?c7+U9zz3lj600kvoalx7aBrfUC3I6aH6mLraIkq6QXCEj7+YL2Oq2kcGr8LL?=
 =?us-ascii?Q?N08E1UU2QZzN+Z0CSqh4lZgjm5k4IksRvzLQgzvCKKalp7XjlKKJ8NLniNVz?=
 =?us-ascii?Q?7d8oDl0MnA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bc533766-d816-491f-d23a-08df28638c99
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:13.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 794cuNUwDcviJrwXMe832ry0WWLXmUApIqQKy5DGDiirxfimO3njJwWRuiBO+ruARohGtuht09Dhh+2HJhV7sBTuyoH/0h9YKzCqut/9/f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247648

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.8

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch   | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 4 ++--
 .../0003-tests-use-a-dictionaries-for-environment.patch       | 2 +-
 ...4-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 .../{gstreamer1.0_1.28.7.bb =3D> gstreamer1.0_1.28.8.bb}        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.7.bb =3D> gstr=
eamer1.0_1.28.8.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-resp=
ect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 61844d793a..aa5db13237 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the=
-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 27bae0561a09f06375c6c6d1d3fec2a142a1ca20 Mon Sep 17 00:00:00 2001
+From a4d5aef324bc7e66d293cb500d077b18fdd7545c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 9752ebe921..7b555352c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support=
-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 00dad437c119cd23883cbef35d2a620ccdf3816b Mon Sep 17 00:00:00 2001
+From 59403a0c5d2bbd3e00cdf4855f0a2d9761395e1e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
=20
 diff --git a/meson.build b/meson.build
-index bffea3b..a51b1af 100644
+index 4abaad7..b08d43e 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -665,6 +665,10 @@ if bashcomp_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-=
a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gs=
treamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 5637eff7a5..246292332b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dicti=
onaries-for-environment.patch
@@ -1,4 +1,4 @@
-From a686b15bf7ec5ca99467f138c57ebb17aa25c24f Mon Sep 17 00:00:00 2001
+From 9e728516ce60c128cb6666820e5449efc7bcfb64 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_test=
s.patch
index eb14d519fe..bb08b116f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-=
script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From e0290fc20f52ad7dfc21e8a572587ad826e5b32e Mon Sep 17 00:00:00 2001
+From 42225b4709aefdd3250be30d79b5646b2c0da926 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
index 0d1a931ced..01829ad778 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.8.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstrea=
mer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.=
patch \
            "
-SRC_URI[sha256sum] =3D "787329b2c5758e228a71d926a6dcf960bceaacca3cadd63874=
ba665dfcda013e"
+SRC_URI[sha256sum] =3D "baa8e86985ad6417cc0ad6e7b79ff2884c6779c8b1c7a6240e=
7121822c86e524"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)} \
                    check \

