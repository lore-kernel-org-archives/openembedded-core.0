Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25457C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 08:05:59 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25286.1786349154422356148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 01:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Q/dyajvm;
 spf=pass (domain: est.tech, ip: 52.101.72.9, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OszT4ZMtrfp3NL+7a80rM7nSRZoO7Y+LkSyShS1/snmdrJpOua0W3w0cPkTcyD/A62aCdlITVqg9Hh6tKzXcJ3bqsqAxC2Qzk90bKhwrdIPBmn1hDmsj6CbuiPg8SIUoXj/L9RBAE1GE63FYzZQsX1aJ1M3rXdLbFmeAu5fN29C7pOFBLkdQICqP3podJVI1MqZstMr5RpubLMnaYD+Mkf9UeK+JLXnKt6GmfcTXkG7uDEBDmQj7L52tWPkFoVqziwZ1m1ocFQKyUSiWp+R6J4PW87P/rvaFxNQeiJfu+PqlyRdl575gW1cSx8lafIagHJ2Txh0WWPtTKR1ZyAHlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYUfyWT7TRgdkRwdthOzr7IkKM/JsSavQaLqA0uGgn0=;
 b=adrLVfkF97rVRJUZ7PdyU4IF/BWMrM/FaRp4G7M5kx3vx6FBrjB4GZYwolW9CxesLqeRbz63taoLU2e9r3frfpdWzjaxGyJe5EYVnbvI0X47EBSgk6J+0Ht+gNSFxlHxONmE1bn2xKx5y+SqnVcQ6VYSW1VtuRmIRENooyZlEV6ruS2oBSPnWGyM124+RFUSI6NNDfc9Ch/OOzSd6idsrKb9xcUPvzniS5H1iFf4iysH0FDk8B+ZkvxwEU8PqQBxHdBL5nbU29ymHSqXBY+Xpb/YH/vfYd/SrI8U/zhmuzDKIIMfdwwtuxXzUMjz9h1pfJS68WjWiw7B1uBm0nQdwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYUfyWT7TRgdkRwdthOzr7IkKM/JsSavQaLqA0uGgn0=;
 b=Q/dyajvmqqLVwvioSALs7no85z0UxWINkYJhljCFBrBturICtNNh1D9/OZcd8PbMVvBi3bmXiuuFxe7KLF+XHbJBat9hoxON1Hs8OvRCzuKIIc0c/xeZWESggYnGjIjjTpfynTMwJ2Os4eZh0qz0jz6zsYMqYaKCawXwY5+bRVzNLIQBkKnTU9o8l0EnC0dUdX0OrImnChyQWAimbujalzu7zYg8jWa/C2fo/KEoe37ItVU18KCjfDCS2Gsjr2oCxl6cbwazTyJWTX29T4rmg7U27/gWZJYdVBfyvXnGHpEEDdc8ZDxuBvXyxuEgTvUST+YAmDIgkV/ocYSnFg7/Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI2P189MB3561.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 10 Aug
 2026 08:05:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Mon, 10 Aug 2026
 08:05:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Upgrade Helper <auh@yoctoproject.org>,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] shadow: upgrade 4.20.0 -> 4.20.2
Date: Mon, 10 Aug 2026 10:05:17 +0200
Message-ID: <20260810080517.8329-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI2P189MB3561:EE_
X-MS-Office365-Filtering-Correlation-Id: 07130427-b8e6-4aca-64b5-08def6b62fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qHC6+J11G5kvV8new7b/uIVQLz7z4iL1jSy9QfA32vPvrqRROWJc4nHouAwu7SzEaBLPGYEXww3RRR61gQHPzifubPIPC6Ag83epoe6wvVY2YdgtnARIzNovhYXV3A2U9f18u/rrKOHyIUe0rD9hmC+W3sEYnkVeFczT8344pTDFv38Mb6QW77J9czVOm0eaaMvYhs5+E+npRLyMEx7bWOkpPbo6oEIMtwXg4nJtNBKg9Y4V6uj5AtvbTdBK9HbemKt80jLckYQp0OnVqN9Iq4DKUKsa7Hg3xB7Pufn3XUZbWqQzuAT/mi/LWTvmtV1Pbf+r/2V9FtthGjQO3/LwwevaxdJjzO0lcNGsSkr+HvnQFSfQarK6Tvh7og5/t8p6eUu8yb2tdMpW2bJUkI4+21078ynDbxVtNIUgIe/4EvZrTtX6GEFYjpKHMHLaIFSmjQXdZ4s0xHD5Cwr2l2Ptuqi6KiL70IYxknyWG9C0OXGd8AvGtz84ZCnuW2pONhiHu2Jd2KbOtrXvC1Zw03m7k0c1zIw6DFLOzE+Nk3tLZa22DvrhkGD93MQK503oPRQ5YN5rd4Ty9UrCas42sGP5oO/gmEc2BTrkH65gniX/tdkil73UfoNEaytUhhWuyKA8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hZG/HtGrE+j/5jGM2SIz62Y03bN3T61qW6TJva22dy7+ISFlcUrqW2/MJ+03?=
 =?us-ascii?Q?ggXMueg7Pjnq9ujLkfEHcA3Z5d1cvsxfiL3zpUmyWYvnh4v3oRMvA0zdfNgn?=
 =?us-ascii?Q?FJdLeDa8ForRY2K1+8uus8Vtruw9yGfnGHndTK6KcxqF6ufkq7kI+vd3FJ99?=
 =?us-ascii?Q?p4IsbUYCBwz/ck5I3NWrAf5N89yGxv0pcrMYcjQMWmaizFrfWncy6fQOo9uU?=
 =?us-ascii?Q?UdvWHoLY/rFj53lYmm9wUqWPJeSpBgocQfC1Ysi4OYl+aI90Zk/czyNGJXg2?=
 =?us-ascii?Q?/3dnKRaoE9fIj71KOviApFXx/ZovEprwFj/48kwjynMXOJaua92OELMnWVgr?=
 =?us-ascii?Q?tBibasVCSvA45WiZnDeJ0h0VLT9dGqWHoHMj8fo47/WAjXeY6ZraJqpgOPcZ?=
 =?us-ascii?Q?3f6lghJB078DWDQNBB6evc+R4X2mNKMPNiCh3uZiaLKTAgNLV33LMMSm0JxT?=
 =?us-ascii?Q?tf7mszK/vrlQ/45q0pbPfx6jzbTKo9lmNFlAVfyZfJ53zcXGJby/w9RzfTVP?=
 =?us-ascii?Q?8AuzUBVfKjvsy9bjvIqzDvtgAB1c5deqvnTtpzuSjXUgPAVVag7QSGqL7MTs?=
 =?us-ascii?Q?qwARiWuSR0Vu2EqV9ZWBHy/uSJ6fKA8oOsrdjfi7m139yqAKDR+zQ8GSBhgp?=
 =?us-ascii?Q?kdRQu8THDp+T4IkQ5UmeYpagjcxirCJO0H7KFx3ZIvxpt87myij8vZneIkM9?=
 =?us-ascii?Q?4kqrO/X5GxYi9CsbZ2zi796QMIsvpy86QpNCrx16ZTHCA0jCcenwMaYEthem?=
 =?us-ascii?Q?iVg8JhIllyDmJwG8v222TUeOXTQhEkGMNA1YLNoqZ9tnVowmkhZORrjZAFLM?=
 =?us-ascii?Q?4P1UeKnylrFFrfvDpTSyaW+3ZtQ54hXROOeozMWJtrxAxrDllHkEkvm2YW0k?=
 =?us-ascii?Q?A68DPu3bLpUux1yesRloSGpmJEBkO+d0MURrBL3qIZWA2Sg7VEcWeOmirAHO?=
 =?us-ascii?Q?PcDPnL81YHX1NfY6TGEi/xsLM4MV/YnnmxYrn0ByA+i2gVqO5HvpSdDY7FJ1?=
 =?us-ascii?Q?mUoKVGCUnSrcirYNTflq54wI5KVTy1xwYwAe4/nXFReLC9wGcoAKI/jmjYf6?=
 =?us-ascii?Q?9H1ODe3mtA9P1n2hmki3Z5/1QJdQ6nnJ2YgsiInBlGo3KFyqPqk0VICUpE1e?=
 =?us-ascii?Q?NLHkLV1LBz7rgWQJ2ZSfOqUsS/6vUN8HP31+2NxuNa/Eck4WNmt7kIb2FuPL?=
 =?us-ascii?Q?hVM14tgFwlCNOuP78lXP67WcVB8K3cGS3SX3jTAuXz0kBGnZuSoYivhIzRSL?=
 =?us-ascii?Q?OZzSNQgGqqzvKaS2KDkjS1kb5MOfp+Op8theCR+67i5xdcMbCIm2O32s69HJ?=
 =?us-ascii?Q?gQAdo6pnmsV16w8Bg1tIF5oEmeG8GT4TZG8yFUG8iEsPyPsBDtRwkQuWGa8h?=
 =?us-ascii?Q?3+k4vbjmzPLJpTV2XMZAC6a/+H00r33pHNjgAlq/JLJnCOhasRz46WCuOM4s?=
 =?us-ascii?Q?LkvNidC1ig0diaLT/10r0t1fOru943bdWXkTPAsVcz7h9deWtWqq/Cf9PP9J?=
 =?us-ascii?Q?NTi+vbo6vHFwvXGMJe7rnTCDlrRGq1GOWxygDJ08X6VJrN6sShJyGw1J6uut?=
 =?us-ascii?Q?2Ph6LVRHGwGs5lNdRHqcnO20i1G373hCvkw/vbSuVofGZuVgM+v8bXX8fJ8S?=
 =?us-ascii?Q?DbrM9qGVP4GydXFQ6V5BG7ZVBxnpWiISSzJeUmaO8Zj3RlftXe1/NgwjbylP?=
 =?us-ascii?Q?Tv2xb67OzM/ubXdBk/e8Gmkovzc2PavXUmTkWVQtJCFgdDSwua7NpDMWkW1A?=
 =?us-ascii?Q?3O02Dksi0g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 07130427-b8e6-4aca-64b5-08def6b62fcf
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:05:48.1618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xizur+mBmylbbTix513WcBeTIjuWxzwDOhK0WvpIrpeJ6OSFTRmkl76W7psw1CTei2saomQv6dDbyYy/OWIOmQwHmZ65adhgljnNnfdi4xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 08:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243115

From: Upgrade Helper <auh@yoctoproject.org>

ChangeLog:
https://github.com/shadow-maint/shadow/releases/tag/4.20.2

Compare log: https://github.com/shadow-maint/shadow/compare/4.20.0...4.20.2

git log --oneline 4.20.0...4.20.2
f8331a33 configure.ac: Ready for 4.20.2
6dbdb68e configure.ac: remove --with-attr option
0182cfc9 subid: Add `<stdint.h>` for `uintmax_t`

Drop:
0001-subid-Add-stdint.h-for-uintmax_t.patch
(fixed upstream)

attr and libbsd are no longer dependencies, remove the related
PACKAGECONFIG entries and lib-shadow-deps bundling.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...001-subid-Add-stdint.h-for-uintmax_t.patch | 43 -------------------
 .../shadow/files/notallylog.patch             | 18 +++++---
 .../{shadow_4.20.0.bb =3D> shadow_4.20.2.bb}    | 11 ++---
 3 files changed, 16 insertions(+), 56 deletions(-)
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
index bb247cee9d..2c1092765f 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.2.bb
@@ -14,7 +14,7 @@ GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shad=
ow/releases"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', =
'', d)} \
            file://useradd \
-           file://0001-subid-Add-stdint.h-for-uintmax_t.patch \
+           file://login_defs_pam.sed \
            "
=20
 SRC_URI:append:class-target =3D " \
@@ -24,7 +24,7 @@ SRC_URI:append:class-target =3D " \
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
@@ -68,12 +68,9 @@ PAM_PLUGINS =3D "libpam-runtime \
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
@@ -163,8 +160,6 @@ do_install:append:class-native() {
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

