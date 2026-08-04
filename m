Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4515FC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:05:24 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14803.1785845115472724680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oDzGCsVI;
 spf=pass (domain: est.tech, ip: 52.101.70.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUQ1ULWkjoNygWD1OOWaPEeBNNm8Ln6RCzO2lGJSgyj0AyKkv664fwP7UUJ/Occ+o9lwfeWYnUXBYNRokpZ3mhcKQWlSnKaM/Eu37ptkQ5yHLOT48st/DAq2qB+Il4UWCURLYdAGelfJF59OienGc4eN1WoUp/1sfzIh1L+dfIcvHwEEkyk/DLg3C1R+MR+5D0XhtX+zhuuOCJWRVHBcQkCKsASFKOsWjTuIxjUPgmBfcKwyDcXd/iwoHkmeuhsWGU2KTVpAtAGfS4IrP8xJPm7imq9qekOSxjetDs3Icmi0fnxtT9Ut99cCruQFSdPQHeWj8SGf4f/Ver8mblG1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM5GfjnLiLuWF4SULG6emDyPzHiB6mmzp6B23j5YW/0=;
 b=lspaUpHg1crDA+jCm3RRGsYwF8hBZVApYqcikDM+q+0mzSz/nQ218F/YjKAj/YJM5MO5K2zqPm1F4WU+O3Vwk9KHEbof4ygLq6LIL9l8DO0cgyL+XKltght3CeeebPDAsMsFa8bZagpF5qRUehc2xFnvUsoYHdVbpUWSzEYLj1BrPGbTdwCXSXI2uNBqmg68KoPT9+PbLydKh69bHBFDlUaQ30elafwyqy5N3BpNn/jVjQ+JHAZm0I9qIdFjJHMB8rhHS9x4+r7JxzEz73pmNKwDbrzRAp4RsDcOZP2yzdICkHse3B+T4XGFgbxWSy9d+v3I6JKn/neQGoAFfnRqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM5GfjnLiLuWF4SULG6emDyPzHiB6mmzp6B23j5YW/0=;
 b=oDzGCsVIXQaI59ZKMHhXBQtfE2O7HSE+AnXSK25QdMsaybyqpAQdJJlfeoXpndBHrkiPD70oIOhUVHvJon0SIcZG7AOQyfqML+SiZlmlCfilqnK4cqYaYiT18q4EU0jwowsJnOh/DD9udkqwH9HPtYs7MPqJ48/Ijixln1s12ITCvmab/OK41jhxG6sZUEagv25xb6WkfoSka4AjUEihGwBe2YqUE6Glnatruo83PGtgYcskhDuVBzUGC0hm36I4G3qy6WSbV4iACbj7zVoq+YQCov9nphuwUqKZK50fwYwfsQlXm6vP+ksBsm/RKx1s07ee54BeLSj9ChyRc4UQpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:05:10 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:05:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] libtool: upgrade 2.5.4 -> 2.6.2
Date: Tue,  4 Aug 2026 14:05:03 +0200
Message-ID: <20260804120503.2878-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: ff523b13-73d6-46bf-8329-08def220a178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|6133799003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nQhIXnE6J+pI4a0v9PfvFSuIKrHVWc6rHZgfK4lIoAPVgSQzeE2fZn8PUTyX+x3b/PAEc3lQDeBjct0ThUmlcE2j3EaB/7333dsw2P3lP0JHQHTVKwWWKelUEHoDShRtUogRfczFhwdXzKsR4Uqp+9i/xRyBobG4PyD+A8vBQRYx2vAlI15pNFzAgFJfqUINCZCzReebP3BnojonkYVqd0XmFQREnjVbn2s87R7yRUS/9dV6pWEaWQFspwV/NY33uLAiCf72eej/N5DnEbEss9ZXxrPYh+yIF0TFc34IO0rs7u95zYlbKiNlH2mVBa7dVXgTQ9qBGrBKaQT9ZL1Oiy113qOrWkiSO6+x2KgdAhhnfVJnd6Bs7sXapx0VO4KO/yptt5Ey8/PxwnB+ZRMyQAM8a/4qyO8AyWzy7Yc46/ehKZq4JJlWxCs91yoUJG/SccEHvFGYhQSACxg8FSdKh1T/UF2nkratfa6ObCn4ghFmzP9ThOQ0SuOPpsy2Grye2OaS6MZxqgJuAZFkL8n9sGitGUSb3N67ZqMh6el8vTpG/TuoxvFgquKQ2jDRpoAtODr9DYPeSQW+lP0YAUypFQpn1L5uSxnKjY8kBomRBWY8uZH7zY2M4v/K3IEf6HZu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(6133799003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XTLk0JxGirosCT6Adg6SAbx0sv71CIaNAO7M0g2VrEm9aKTp4+PXHgRrSTSu?=
 =?us-ascii?Q?9wxnPSE/Kk4wRNH4DlOMfeTYL5LJp1050rMw3iadCPi2R49/dWFjAiEfgpVr?=
 =?us-ascii?Q?YqNnPn1ocMLjwyyt7Wg3cCm1dHflV6wDFQgkINrVKDs2RF+fJfpIHlzYo570?=
 =?us-ascii?Q?8WA/ZUuxnw89CrI9NBo2ztvrQIPmVMayafd2MNs1bb4UPdAV7hTkjrWzXAFO?=
 =?us-ascii?Q?sglAbtz1KzL5naVwmhpb+ibwRoevCgUjVTvH6iT1B/hgPR7IXq567ufczP+Z?=
 =?us-ascii?Q?+iLfwlgli4Hb0LfyYYQo08XbzR2fWxvJ1E0RIehFjvtrrcIn8ax6/9c1ovhM?=
 =?us-ascii?Q?iIZafm2Rm77VtZnE52pa6dy1meWMeGt7+VRjCU9uUGAngIfHxGZ442bY0LF2?=
 =?us-ascii?Q?9zL4h8+pUL5OTTzSIjrPQBumE2KjHyNgvaYTCpsafHfhf9vYumkqcDzcz2Tp?=
 =?us-ascii?Q?2UOV3d+VRYSaGGRR5pl7DbcUDJqyCvpAKvWw7j6kIzgeZG7P9FlywM/Bo5Ox?=
 =?us-ascii?Q?rzXC+/C1CpQQdSoPTlXXeyuu9DcPKVkwRq2ntYh0m0yWs+O/yGtJh8WDBKQs?=
 =?us-ascii?Q?AJSwkNEypiQ35Xfn61OECwrr+oZrmI975nLFyihgtUqGN06AeFL8dxD+GbOM?=
 =?us-ascii?Q?hCEILnBZS4Ae1uFQA0evcyhQVkvVFmLKD8BuaC02OIZh44T2ggcUyHsmNK/m?=
 =?us-ascii?Q?P766e6sQEaV103FdfnGOwj99Za0L57ZXhECfndpxzY3nJUoK28GbVMWdrbk4?=
 =?us-ascii?Q?9p7LUbo4ylqiUdmg0s4rwkn8h8d70PMRZ4HI25j62DmMCur08gsJfS2nuBwx?=
 =?us-ascii?Q?WWYr/P7zkTft9OjKehQTlWu0svu58e9PbKfmzg+yHqHXiEu3E68DdVe5SNtk?=
 =?us-ascii?Q?wlqcZHbhIxROyqbcnuG3Lxf5+0e/jEYpgi2+glXFmjtjwGRiAWepJIm6YHoT?=
 =?us-ascii?Q?Vp523CfGX3b7Cb3mwbN0tFoQJrqXuUl8sgi8g6mmGAunv86lQfCrXYCT/Pf2?=
 =?us-ascii?Q?XZxjc1ZKvIEMBAeipAi/ike6IsX9Q+jjt90wQQ/ME2feDQbQNhuReKWYfjXp?=
 =?us-ascii?Q?pJUpX3xmqq8SlHEl9sTrgLVPPg9nAIEMkIL4cHn1Tgn8jGuAZXaxEJZuw8lb?=
 =?us-ascii?Q?M3wDwJq8zO0RGAMmiW5DZMu1b/xOzheJKow0RrHTk2l96QPotiHv6pRADZGo?=
 =?us-ascii?Q?jHmUcydxO+7psB/xHUOJLosj2eXCM2j9WlNDk9MB6jZs9D89o7e0JqCG2S/y?=
 =?us-ascii?Q?UOVIAppjfMJqrtzoo7zhdVcxqgyguTY1TgPtStgOYlqrMSXpMk3+/VATuUbN?=
 =?us-ascii?Q?lPvNYGkPVW3XpHwVXouF6K6CSaaSOn89eOfYiF6VKOi2yp1kGQCephoMDnuS?=
 =?us-ascii?Q?ZMW6GnHdDj8UWcUjt/3K07WH7xTxLdcCFHH1tirTOrbjJhzoRPTkdjQrYqsQ?=
 =?us-ascii?Q?qOi0r/zKTanicr6OkRBh7yvLJkReWY9+hBpMWT/bUKHjP2voTJ50KzaAf0xh?=
 =?us-ascii?Q?y4J4bHaBvyEtSCqPbE4OgZ518lu8rHiArowGuqS+yJ5LNstGrJVs6BANqwoi?=
 =?us-ascii?Q?sfrmZo5eHrN+T6/JeoTOfJSNokqetBY7OeMw6EJpf/gWIGhrsY1W+/xbJ4Y7?=
 =?us-ascii?Q?AEZlBnT4wGT4qk25nD9eik9rN0yB+x5Lo42o3XjhlNNaOcoB18V8QVv69AmP?=
 =?us-ascii?Q?OJn1ZfoX4C+cG0QZK0Hef1I3+UcY2GKZ5AP/Hv5iYVF0Od3zSKK20zHiBrjZ?=
 =?us-ascii?Q?OEEbmyvcOBGw1j+ZQgBFM9y4PO3K44Q=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ff523b13-73d6-46bf-8329-08def220a178
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:05:09.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ar/KtC2dYaP/7NaW8MG6cnf7zW2xr9UxiLh1G38zF0WqkbP6e/vsFG6EQAsTg+78/uUnREjjCwMmWmVJAEKqFs1ifdUyUhbe6QhdDdT+BSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242734

- Upgrade to first stable release of 2.6 series:
  https://savannah.gnu.org/news/?id=3D10914

- Notable changes since 2.5.4:
  - New libtool-next-version tool for guiding library version updates
  - Objective-C and Objective-C++ tagging support (OBJC, OBJCXX)
  - Allow statically linking clang_rt archives by absolute path
  - Fix overlinking of dependency libraries on ELF systems
  - Pass --target architecture flag and resource-dir for Clang
  - SlimCC compiler support
  - MSVC and MSYS2 improvements

- Drop 0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
  has been merged upstream.

- Refresh 0003-libtool-remove-help2man-dependency.patch for new line
  offsets and to also remove the libtoolnextv_1 man page target added
  in 2.6.2.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{libtool-2.5.4.inc =3D> libtool-2.6.2.inc}  |  3 +-
 ...-cross_2.5.4.bb =3D> libtool-cross_2.6.2.bb} |  0
 ...ative_2.5.4.bb =3D> libtool-native_2.6.2.bb} |  0
 ...3-libtool-remove-help2man-dependency.patch | 22 ++++++-----
 ...r-static-libs-for-internal-compiler-.patch | 39 -------------------
 .../{libtool_2.5.4.bb =3D> libtool_2.6.2.bb}    |  0
 ...ol_2.5.4.bb =3D> nativesdk-libtool_2.6.2.bb} |  0
 7 files changed, 13 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc =3D> libtool-2.6.2=
.inc} (88%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.5.4.bb =3D> libtool-=
cross_2.6.2.bb} (100%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.5.4.bb =3D> libtool=
-native_2.6.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0005-libtool-Chec=
k-for-static-libs-for-internal-compiler-.patch
 rename meta/recipes-devtools/libtool/{libtool_2.5.4.bb =3D> libtool_2.6.2.=
bb} (100%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.4.bb =3D> nati=
vesdk-libtool_2.6.2.bb} (100%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.5.4.inc b/meta/recipes=
-devtools/libtool/libtool-2.6.2.inc
similarity index 88%
rename from meta/recipes-devtools/libtool/libtool-2.5.4.inc
rename to meta/recipes-devtools/libtool/libtool-2.6.2.inc
index c646ed33d6..b418490919 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.4.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.6.2.inc
@@ -13,12 +13,11 @@ SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz=
 \
            file://0002-ltmain.in-Don-t-encode-RATHS-which-match-default-li=
n.patch \
            file://0003-libtool-remove-help2man-dependency.patch \
            file://0004-libtool.m4-Change-libtool-to-handle-sysroots-by-def=
a.patch \
-           file://0005-libtool-Check-for-static-libs-for-internal-compiler=
-.patch \
            file://0006-libtool-Fix-tools-path-issues.patch \
            file://0007-libtool-Fix-problem-with-libtoolize-in-multilib.pat=
ch \
           "
=20
-SRC_URI[sha256sum] =3D "da8ebb2ce4dcf46b90098daf962cffa68f4b4f62ea60f798d0=
ef12929ede6adf"
+SRC_URI[sha256sum] =3D "24adb3aa9ae035c70faba344af57d73215eb89281045af6c7c=
cd307751f8b0bf"
=20
 inherit autotools texinfo
 EXTRA_AUTORECONF =3D "--exclude=3Dlibtoolize"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb b/meta/re=
cipes-devtools/libtool/libtool-cross_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb b/meta/r=
ecipes-devtools/libtool/libtool-native_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-native_2.5.4.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.6.2.bb
diff --git a/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help=
2man-dependency.patch b/meta/recipes-devtools/libtool/libtool/0003-libtool-=
remove-help2man-dependency.patch
index b174827eef..3e592e2eba 100644
--- a/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-de=
pendency.patch
+++ b/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-de=
pendency.patch
@@ -1,25 +1,28 @@
-From e3e8422333239c47ad613e2f41ee04244556d3be Mon Sep 17 00:00:00 2001
+From 2e3de3787e5693e43af09f3b0ab325091f69450f Mon Sep 17 00:00:00 2001
 From: Marko Lindqvist <cazfi74@gmail.com>
-Date: Mon, 7 Jan 2013 01:49:28 +0200
+Date: Tue, 4 Aug 2026 11:56:37 +0000
 Subject: [PATCH 3/7] libtool: remove help2man dependency
=20
+Also remove the libtoolnextv_1 man page target added in 2.6.2.
+
 Upstream-Status: Inappropriate
=20
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Updated by: Robert Yang <liezhi.yang@windriver.com>
+Updated by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
- Makefile.am | 17 -----------------
- 1 file changed, 17 deletions(-)
+ Makefile.am | 19 -------------------
+ 1 file changed, 19 deletions(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 51c1fbdb..4962c3ad 100644
+index 52e0047..1e2f66b 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -408,23 +408,6 @@ $(notes_txt): $(notes_texi)
+@@ -419,25 +419,6 @@ $(notes_txt): $(notes_texi)
  	$(AM_V_GEN)$(MAKEINFO) -P '$(srcdir)/doc' --no-headers \
  	    $(MAKEINFOFLAGS) -o '$@' '$(notes_texi)'
 =20
--dist_man1_MANS		=3D $(libtool_1) $(libtoolize_1)
+-dist_man1_MANS		=3D $(libtool_1) $(libtoolize_1) $(libtoolnextv_1)
 -MAINTAINERCLEANFILES	+=3D $(dist_man1_MANS)
 -update_mans =3D \
 -  PATH=3D".$(PATH_SEPARATOR)$$PATH"; export PATH; \
@@ -33,12 +36,11 @@ index 51c1fbdb..4962c3ad 100644
 -	$(AM_V_GEN)$(update_mans) -n 'Provide generalized library-building suppo=
rt services' --help-option=3D--help-all libtool
 -$(libtoolize_1): $(libtoolize_in)
 -	$(AM_V_GEN)$(update_mans) -n 'Prepare a package to use libtool' libtooli=
ze
+-$(libtoolnextv_1): $(libtoolnextv_in)
+-	$(AM_V_GEN)$(update_mans) -n 'Determines next version to use for a libto=
ol library' libtool-next-version
 -
 -
 -
  ## ------------- ##
  ## Installation. ##
  ## ------------- ##
---=20
-2.39.5
-
diff --git a/meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-s=
tatic-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/lib=
tool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
deleted file mode 100644
index 5a4411c8e5..0000000000
--- a/meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-l=
ibs-for-internal-compiler-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9f16cd0624641e489665415150792d9054af8a7a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 26 Nov 2024 09:57:39 +0000
-Subject: [PATCH 5/7] libtool: Check for static libs for internal compiler
- libraries
-
-Libtool checks only for libraries linked as -l* when trying to
-find internal compiler libraries. Clang, however uses the absolute
-path to link its internal libraries e.g. compiler_rt. This patch
-handles clang's statically linked libraries when finding internal
-compiler libraries.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-https://crbug.com/749263
-https://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D27866
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-pat=
ches/2021-10/msg00016.html]
----
- m4/libtool.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/libtool.m4 b/m4/libtool.m4
-index 3650c87c..51493a10 100644
---- a/m4/libtool.m4
-+++ b/m4/libtool.m4
-@@ -7708,7 +7708,7 @@ if AC_TRY_EVAL(ac_compile); then
-   for p in `eval "$output_verbose_link_cmd"`; do
-     case $prev$p in
-=20
--    -L* | -R* | -l*)
-+    -L* | -R* | -l* | */libclang_rt.*.a)
-        # Some compilers place space between "-{L,R,l}" and the path.
-        # Remove the space.
-        if test x-L =3D x"$p" ||
---=20
-2.39.5
-
diff --git a/meta/recipes-devtools/libtool/libtool_2.5.4.bb b/meta/recipes-=
devtools/libtool/libtool_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool_2.5.4.bb
rename to meta/recipes-devtools/libtool/libtool_2.6.2.bb
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb b/met=
a/recipes-devtools/libtool/nativesdk-libtool_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.6.2.bb

