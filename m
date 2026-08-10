Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21280C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 09:45:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26231.1786355111132147835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 02:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=h1VDUacP;
 spf=pass (domain: est.tech, ip: 40.107.130.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbAjyGrWAlxWhDM5qDPbhP0JKx/S3zypSmZ00RIwfhovLFhsqx0pj/oR72qr+FcXAOc3ACAQ1mIhHu+G0n/551Jxm6aj90IgEexKQTEm1F0GgEb4Cc36r4DQBwSIVCkUJ/i3nk4GQgPO1wj+5z9uW3EvMO5/Eu8feDGa0jf3ZKippfPuwwFo511odhxm+GfR/5xOgTBB+3PH5xkKf5DPuCr3OJo8tcPdA+QadPUATTYbmHH4UX3B18YVjjH9+SLG8Y8LheWMHI50qBTHC3R64Ok516Wuav7BJZaaJ/hMFZeA1kI/LAdlroBDV4Q4FWVbDfdqZvGce3Upv382tJS5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rte2NvzDA4tpqShEYerTf3JxLAm7Kao7C23HTuMg5BQ=;
 b=AuftBMroWGwDsaxHTtmDlLMFcxkffaJl0eu7zogUPCw/DExwJSY9EjE9WSAul4TqcENWEOt2RvktC4sToL3waymNwyNn08Z/wzLbwXPAgA4qUi4f25JTMcd3wA7qV+oLbEgKcMsSgBFBO2Klysz3VjoxhLuQRktbhSMUq02trZN+URc3yHV9kzELWNxCqlcDzkzEVmanpWaFtgdH3lJ1xkNtGFqVAzK/fwJROkbaFtcOf+WumezCDXly3MpHhc3aoFeZHAUY7HgpDxunuyoH90G77RhNz4BQ9lyZja9eaa1oeJPmFk6dNXBYxHrGsr1en8ifO/LWu0Km2vkEnxsLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rte2NvzDA4tpqShEYerTf3JxLAm7Kao7C23HTuMg5BQ=;
 b=h1VDUacPO6H4bCIMD+zG8dc5iUi8AgjvfBX5legood6nzBT34UoO5MSlpDlYGCtCZMeJdkZfLFQ5AzErWfiZKkVkbziVykd45rmMSefyH1PF7rfUZMcnfnmEvbOeR4aHlKXI4wIK3esfNKCQwkcQ/n+jZU2ka7HDzihjkMNeib5V/kOfwAiozWXMCeyjeV3tkz62VyjZmctShUDNHqcDr4uf4p7A+DJKZLhEihB2rV2nd5gQiEdneRqugBtfltFosRTTapmjCt1VurrNn55yvNdHY7NZN2zum2YXXaBL7M2qhiYOc6/Fzor9le44IrWwvH2qaMLzVxK2fryzuddsnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU7PPF1F0458E20.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::acb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 10 Aug
 2026 09:45:06 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Mon, 10 Aug 2026
 09:45:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2] shadow: upgrade 4.20.0 -> 4.20.2
Date: Mon, 10 Aug 2026 11:44:56 +0200
Message-ID: <20260810094456.9931-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Reply-To: 20260810080517.8329-1-jaipaul.cheernam@est.tech
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0649.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU7PPF1F0458E20:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e85032-190c-4fe9-e323-08def6c40f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jldtX+50q+t6VlhLj07ATqr4lak/nGY7x05mT1K0FrVRp5FbpYVU3WIMq1RZAyluac/RL1ModZ+YGkIaK1nFfsy5Q4Kvd0eu39zZ/muEsRnlemy3L4SlsLJ491c9YV84ZeM6qD9IxGMD6IX3JAtEmGdNGena0nzioS965+GtaQND6jwG7cT+e4PvvtpJs2pSGZB7jkrHv+Ce0XpcZhLCkr76NMmMLnM7YkoVv6KwVEkwpd6CXyPKDhmProrYektZpwlQhFw8Qs15YRVY7IOH8E0CkaEiCTtl1Dly7QLmI7mITuy0ZtoV5QfY52912RhOVk0vS32pv/uPbgx0xytNBD8Lp3n7ThpdjJ+DOEeForI+/Q2Zx7gat9ujWfy6uMM3tF34d1PCWdjSMRgOjuo4MMmSv4FS8Cy2tDO5CdNACqojW216mQ8D90/Hz0FOU8nrDLGxhF8chDX/V0Bq45k0Aj/UEY9IVAms2I9O7hZ2a6wqAGUfIYCNvVaHRodLNo46KUC/Ee1HK+uHkK2o5URWphiDljhJCj0KXLooE63AuksRjfJEaoXdZetFglScoffvZ6quHeGHhhtCwSwIzoUdT2I0vUB5CaUDjXIQrF7u07zPZiXYWAW9EdEALmvyOwrh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?agEZi0j2JBcZMc/iutc1+zXKJbZv5Tn0E5kba9DSnmDC2e7PLZoA7GHbJtxP?=
 =?us-ascii?Q?uWGh12zwUyMHmdOwOYOuVOKcBejnTBqCC+cPoGigVsfbJCT949bb6E4VugkO?=
 =?us-ascii?Q?1Q7k/ZzIDeJIofayG9vKa2nZHePxURAJ7hK/DHqMOSH2IXlDMtHWo6JJ0m95?=
 =?us-ascii?Q?cKTMmO5ajbt2fD8Bzh97jm2c89WC2INJtC2RWKng7F1gqLsrh3iiaNpdoW6T?=
 =?us-ascii?Q?wlUaB6L2uw1afPKFMKXi6T9azw19gIfrIR547TUWYW/bBAtST0ixoti64MKG?=
 =?us-ascii?Q?2P43sNDUnZP/AJUPb3QxI2IZjKoSdlLCmMCP63poRaGyPMFpX3RV8wvDT8yj?=
 =?us-ascii?Q?aDYxes11BfpjsNbSmLxcDWaDMUxll0nS/VvdpHJModgsptPozdHTnP+LZyRu?=
 =?us-ascii?Q?llZEpzKLWDlWvy6qUsa/3AtgWNCiR+h0rnHv120wl6EwaYeAMxBCNBSowP1T?=
 =?us-ascii?Q?ra2tXw1JYbNErZ/2I18TT8EgZJH1p5zO0lbP4UyS3814LSQT4TvNIo85TMRQ?=
 =?us-ascii?Q?OH7SP61pjU7aFFGIXk9TO7FI9/AImWzi731p5lqbXPY6BTX+cA8AenRsKJ7f?=
 =?us-ascii?Q?TubJw0qZ4YacpOLck8D2oy0QR4NKcQ2ZqBnENKml5u57xs0Cd64MedLbyUMX?=
 =?us-ascii?Q?JiRCYVbIaE0DLfcLjxmp//QMEpXrUAzuBRLlg74sB3E/7H8wElJ5CGKSQ13P?=
 =?us-ascii?Q?ZyfsNOxEOINBtUopScBv5fv/ztu2a6r4pUZHHSdjUQ+r3GccOW/UN8bVbkxy?=
 =?us-ascii?Q?OVkIrdmx/J/EeyWEPh+dOpKn3AahSn1NLt1StpyL3wN/22ms3SfPf67eGrIb?=
 =?us-ascii?Q?bd9X/+fN/BIhusvXYIM3qYclE5LimvX9v7qKDfAeLmU2xdez/Xs2SYIbdeO6?=
 =?us-ascii?Q?WJpNnaeIAJJ5YV+f717+efxUkTY/fYU0KuDbSPQrfFyuw/D78N6eCCBhMysK?=
 =?us-ascii?Q?9sk941g+/UVePu4u+fu8ni3XLvmpJySQVXJbnLJ+nUjXpFpU3qF7BfsZnFn/?=
 =?us-ascii?Q?SMvZOC7rv1ab2ZKsmqdI5oLCnTuVP3KfHWsegV/xBWza8Pz7/xCZFl8kn5vB?=
 =?us-ascii?Q?bOWZYZJLx5hXDOSmkf/x/9WYS6GKIrQuzWACcidjOG9+2ZyY1qzOcCc4gzXD?=
 =?us-ascii?Q?c1LjS67k3idtPttkhdDVs4tNL/Vrmb+oYnsvM5BK26lBkkxmPXlHGCf+ROht?=
 =?us-ascii?Q?uN0vY927vjwOkyGKLIlNH0pZMdRrkDYRAENmucSVKpmWzJWsmc/so/R3Z8h/?=
 =?us-ascii?Q?y+UNPxnpnmO4Uk85ZdRNI+VDsRyUukjz4ts3f8HrF+42b8Dvgiz0leg03ZMm?=
 =?us-ascii?Q?Ymbp0mIkHjwHn8RAqm6Y0SWzTw3PayDnJzkMLi21qzI+xFkFhesYcKT051eS?=
 =?us-ascii?Q?1XZg7l3HrorEAcqagzFMFvswEtYPZa+sSxSzDeX0pT+MyRiYIpcqR9OHBpr8?=
 =?us-ascii?Q?xVPE+6v0hFeQ3GGj1dY2EiGsNPDF5wI7N554yfWggsTLkT83A9IHEauSddIo?=
 =?us-ascii?Q?kUzygiGGV8xvCtrqNvO88m9l8QSMbK4iRu2hDtuXFNdoeJ9oI/P0JJstIsOQ?=
 =?us-ascii?Q?snLTrjBlllSqr+PdirqGHalLj4EQh0kl2dI4QuxDwgVJCxIad7riR3x3OzKc?=
 =?us-ascii?Q?zHfR9KxoRMGi98ripBPxx+x76d3cV4bfDOuv3C4HY5tzjsuy+MiCVp1tBOf3?=
 =?us-ascii?Q?kD/Rv0Pp0BZCKnm4lO2ZwTYhvZrl33N8OQC1AnHTQArjToKeDiPsDzE+vy2w?=
 =?us-ascii?Q?4Ye6+plMcQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e85032-190c-4fe9-e323-08def6c40f01
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 09:45:06.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arygxQaenhnLHuwVBhOC7Og4vJzDS/5iWycPVoWfc6Wk9/HKUH5OziYYxqlyQqef7sTy0j6qZXvnLKDA+UL/FrcUczXD0HwQg3Ir9/Te61o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF1F0458E20
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 09:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243123

ChangeLog:
https://github.com/shadow-maint/shadow/releases/tag/4.20.2

Compare log: https://github.com/shadow-maint/shadow/compare/4.20.0...4.20.2

git log --oneline 4.20.0...4.20.2
f8331a33 configure.ac: Ready for 4.20.2
6dbdb68e configure.ac: remove --with-attr option
0182cfc9 subid: Add `<stdint.h>` for `uintmax_t

Drop:
0001-subid-Add-stdint.h-for-uintmax_t.patch
(fixed upstream)

attr and libbsd are no longer dependencies, remove the related
PACKAGECONFIG entries and lib-shadow-deps bundling.

Refresh notallylog.patch.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
 - Remove login_defs_pam.sed added to base SRC_URI by devtool
 ...001-subid-Add-stdint.h-for-uintmax_t.patch | 43 -------------------
 .../shadow/files/notallylog.patch             | 18 +++++---
 .../{shadow_4.20.0.bb =3D> shadow_4.20.2.bb}    | 10 +----
 3 files changed, 15 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-subid-Add-stdin=
t.h-for-uintmax_t.patch
 rename meta/recipes-extended/shadow/{shadow_4.20.0.bb =3D> shadow_4.20.2.b=
b} (92%)

diff --git a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for=
-uintmax_t.patch b/meta/recipes-extended/shadow/files/0001-subid-Add-stdint=
.h-for-uintmax_t.patch
deleted file mode 100644
index 5679be0e61..0000000000
--- a/meta/recipes-extended/shadow/files/0001-subid-Add-stdint.h-for-uintma=
x_t.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ba4419c57b222b0d34a2b933e7ee92914a51b596 Mon Sep 17 00:00:00 2001
-From: ojab <ojab@ojab.ru>
-Date: Wed, 29 Jul 2026 15:07:43 +0000
-Subject: [PATCH] subid: Add `<stdint.h>` for `uintmax_t`
-
-```
-find_new_sub_uids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)
-find_new_sub_gids.c:80:27: error: 'uintmax_t' undeclared (first use in thi=
s function)
-```
-
-Fixes: 4d800cf2eb9e (2026-04-09; "subid: Add deterministic subid ranges")
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/b=
a4419c57b222b0d34a2b933e7ee92914a51b596]
-Signed-off-by: ojab <ojab@ojab.ru>
----
- lib/find_new_sub_gids.c | 1 +
- lib/find_new_sub_uids.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/lib/find_new_sub_gids.c b/lib/find_new_sub_gids.c
-index 3971ce922e..de514d6b09 100644
---- a/lib/find_new_sub_gids.c
-+++ b/lib/find_new_sub_gids.c
-@@ -8,6 +8,7 @@
-=20
- #ifdef ENABLE_SUBIDS
-=20
-+#include <stdint.h>
- #include <stdio.h>
- #include <errno.h>
-=20
-diff --git a/lib/find_new_sub_uids.c b/lib/find_new_sub_uids.c
-index 65f6815467..f0b4328387 100644
---- a/lib/find_new_sub_uids.c
-+++ b/lib/find_new_sub_uids.c
-@@ -8,6 +8,7 @@
-=20
- #ifdef ENABLE_SUBIDS
-=20
-+#include <stdint.h>
- #include <stdio.h>
- #include <errno.h>
-=20
diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/rec=
ipes-extended/shadow/files/notallylog.patch
index 94773ace2b..6d6957bbf8 100644
--- a/meta/recipes-extended/shadow/files/notallylog.patch
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -1,13 +1,21 @@
+From 20dc49519cc177d4c829f4dd5cc277ada24376d7 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 21 Apr 2026 11:30:52 +0100
+Subject: [PATCH] shadow: Disable tallylog execution
+
 We don't want to call /sbin/pam_tally2 in the native tools case so
 disable this function.
=20
 Upstream-Status: Inappropriate [OE cross configuration specific]
+---
+ src/useradd.c | 3 +++
+ 1 file changed, 3 insertions(+)
=20
-Index: shadow-4.19.4/src/useradd.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- shadow-4.19.4.orig/src/useradd.c
-+++ shadow-4.19.4/src/useradd.c
-@@ -2046,6 +2046,9 @@ static void tallylog_reset (const char *
+diff --git a/src/useradd.c b/src/useradd.c
+index 5404b46..78bb70a 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -2015,6 +2015,9 @@ static void tallylog_reset (const char *user_name)
  	int failed;
  	int status;
 =20
diff --git a/meta/recipes-extended/shadow/shadow_4.20.0.bb b/meta/recipes-e=
xtended/shadow/shadow_4.20.2.bb
similarity index 92%
rename from meta/recipes-extended/shadow/shadow_4.20.0.bb
rename to meta/recipes-extended/shadow/shadow_4.20.2.bb
index bb247cee9d..cf7d253a7f 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.2.bb
@@ -14,7 +14,6 @@ GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shad=
ow/releases"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', =
'', d)} \
            file://useradd \
-           file://0001-subid-Add-stdint.h-for-uintmax_t.patch \
            "
=20
 SRC_URI:append:class-target =3D " \
@@ -24,7 +23,7 @@ SRC_URI:append:class-target =3D " \
 SRC_URI:append:class-native =3D " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] =3D "5e1eee2709a540ac07e4e5bb0d30f7b97d6ee1e3714ef52704=
7fe2ffb5fdaa5c"
+SRC_URI[sha256sum] =3D "e5016b40541ee6fa02ea3d409547cef6e7eea9b31f0e3482e4=
874f87c1d0c7c5"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
=20
 # Additional Policy files for PAM
@@ -68,12 +67,9 @@ PAM_PLUGINS =3D "libpam-runtime \
                pam-plugin-shells \
                pam-plugin-rootok"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl audit pam =
selinux', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr'=
, '', d)}"
-PACKAGECONFIG:class-native ??=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'xattr', 'attr', '', d)} libbsd"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl audit pam =
selinux', d)}"
 PACKAGECONFIG:class-nativesdk =3D ""
 PACKAGECONFIG[pam] =3D "--with-libpam,--without-libpam,libpam,${PAM_PLUGIN=
S}"
-PACKAGECONFIG[attr] =3D "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] =3D "--with-acl,--without-acl,acl"
 PACKAGECONFIG[audit] =3D "--with-audit,--without-audit,audit"
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux li=
bsemanage"
@@ -163,8 +159,6 @@ do_install:append:class-native() {
         binaries=3D$(find ${D}${base_bindir}/ ${D}${base_sbindir}/ ${D}${b=
indir}/ ${D}${sbindir}/ -executable -type f)
         chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
         mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
-        libattr=3D${@bb.utils.contains('DISTRO_FEATURES', 'xattr', "${STAG=
ING_LIBDIR_NATIVE}/libattr.so.*", '', d)}
-        install $libattr ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LI=
BDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
         install ${D}${libdir}/*.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-=
deps/
 }
=20

