Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E2DC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 08:00:43 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2165.1790150434494859510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 01:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vPqg1VvV;
 spf=pass (domain: est.tech, ip: 52.101.84.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AG0uHa2GYlkFqhkDoLP0ZFWKUXRp+8arz8BGF6uc90uvvUhgO5/LTPNhP49SHqvmNdL7h4LHglArKttj255KjjlGcykss8lxt42VAF7lT3bvlo5laPlb/egQRBqSAmxMC0CKYEuxFMZ5YY0frrz4YAjVdLMZdiasfAhKGl+be3BNZlcrZi+hFazm8mSzcAMEcL6bmc1EUgm94o19T9In0INnZ7wnvAGErWk74Wseb2Iu8KeLWEhrVznWLht+1wFR5m32LNPkTuHIJxSpOUnieUy8WSOVFSyxvNW+3gS3+yK/PMRYkY+LkwQfYMW46TBwyz1jfm0sQjFlLDxeZef7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xbHgBZ2FBsGerQpwJ2ACYEu1zrbzUxaEKyBOqSmOjA=;
 b=XD/zkWPB7uAyp+gIjkHP0+FhNe1jnMLorYLABAnrT+KO0Tm6s3rMa9lGloTHI9Mp7Eu4E86ecQ1QB3vSNBhNlGkoKzeM1FcW0R+iT6lKux2KgvF0g4E6TA4ddqG4G7Mk31uuJt4w7QUsP+AQtENnvZMZZl1+aRIFDw2f2MEVLWnsleCvV8Gw3xHqgcg1IioK4CmJWYR2ay5uhPvWWbhJGvWs8RyAGHb9XDvVe3ZN0XOLX+2GutoBNQU4KT2JLfuedzA/PxEvYISNBNOmmhmJkc6NrcemNHQUT55/lM4fG3cEDb6lSszksVp37x5p76rG+9bMC2Ll1KA5Jk6GJkjNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xbHgBZ2FBsGerQpwJ2ACYEu1zrbzUxaEKyBOqSmOjA=;
 b=vPqg1VvVHBDGK4HekccTr2/KBKkl0NXNZUk4uIi76ESVlI8ScYLClyGEoLEBVZyiQVJVfndbvEYiArbUwR7kxuiKV42nlzjYY0VVjvB/cA6RteA1TnBfd2hLaWjbKmA4tf84IS8FKkzk77YXJ069Dadv5dFZYKGEvnVovQijm4D2ZXieBD4Y0GuL1c4gpnHL0CfZu7MDYytShyut3pcjFRvufhijoCGnFcF899eKRY7LZo1NUVj7n57cxApnmmvGWZnboOdtnhI462tj8HHNM5/0OU4wbQM0zHzz+KFo8XE6PkKRVHiaBSibB3smqUm13z3L9wDp+UZpZ9EB9BG84A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB3275.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:00:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:00:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gpgme: Upgrade 2.1.2 -> 2.2.0
Date: Wed, 23 Sep 2026 10:00:27 +0200
Message-ID: <20260923080027.22367-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0422.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB3275:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8522a6-8981-42d0-b3e9-08df1948bc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Kg/FneJ2OSgZOZoe+rvfV12PB9G+h4ks569qjnO/nam//KG3XhUAzD4q+xKYj1+fQl9ztMP8OXco0foK2jv2evu8BVe5ZN6h1X0Nh+LIydIlqAt+Ac53HSbMAZpxNdUaeaVGgfm25HqDWVGn/q1n6niRj2A7/2H6drPmLybU8r5SZc30E0utfAisZHtk79opReMhNhQUT9tilGMIHoTDSi6tTfQBThWe92qJMvhDNipdTexmKxvKLaYTXlgVg3JjyT3LKlLELZVQf7g5gsR1BBJdFTphxkfon754gYqXMyyrk7NI85QTWxhGcWpnqA67kwDJzAXTFbOkmerlr4973zSr/McA/WArF7ibuEST6LZyjWkOHyeLaYg3vqsUwwTEdDPHxNSSi2mBNHaqOy0wfIYLfpY8tpeyCMAosu6BJ5wqLm7UJnXLOp1VASOUonJtEqqbiwTFLg1ZYDqPglUaqtF8jEXKg1Ec7RFAvQvHBOvrLFORhipK+ZmiRHhwuuzUS1NiiogJvihUK/ESjC+Gifaz7CvNOmIVn3MasbLLNtgRgvEEjmQ0ezD1Gt9xVo7HX9f79Nrwu9nCDPsH3v6CFJKIxog66P0Hhd9oFP941SJc1XDGUDY+UW27j42KHrDFVhc7EhdWayby7szmJwVv6/TLpy8vphg6wqGoCbHplH0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QQFBj9/hASGMEgY3beWCZjti21J9MXfVo9M6zqvoYpEBg9ITY74hEuZiPdXH?=
 =?us-ascii?Q?6cQ3PtIgM84PAwED5rZAhp0nkPwgW3JGf35VUbdxa0s7m/SxW6/Ysv2M8ID3?=
 =?us-ascii?Q?6rNlC1IieBi1ZHIbIVQQRrAfFM3uZZakrRwaC8eumE9k9EvR02YRREIR4iXX?=
 =?us-ascii?Q?et/ss02uPQIgVibSnU97CPxvZADlyrGlGnnZyBkN3O2xTArSRv6BSjjVecnS?=
 =?us-ascii?Q?i8t03+KsDQMC+Dq83YX9iQg2HFCqRflDLtjPwZ/ido2G1Ye4soDFLPeK8mka?=
 =?us-ascii?Q?mBvMXtNKthCncjZucVuvw0p6618TS9YzmB+NQvAqWMxXa+ev/DegxJoB+//t?=
 =?us-ascii?Q?yyCm3BjwcmGWDRE7jQM93zEPrbPICe21QgW1rL6GxjclXmZ1eXNEDheXQt6e?=
 =?us-ascii?Q?EIap+PlnkpvaEqlRQftQUr/gXFwKa/DOnPt5w9fYTHndZiU3mTpJYvKNkEV0?=
 =?us-ascii?Q?knmktikuUQXrdIUTxJyLYTzrsxthsMUxnh5hZdYs/HNReoXYM96a8N+s+23x?=
 =?us-ascii?Q?EIwMQsvr83guaMtkMYwzDLv8sPohC5WzkA9e+h7AJO4wbsjsvQa+VY0xmnMc?=
 =?us-ascii?Q?/Y3rAUFT5rAnYqWyh16GgZQJX+weMQb8bQ2LqZ7BkILNFCavyj1SxPRHaQgq?=
 =?us-ascii?Q?MvlhnPXIFqJ+IKRbqrsUKCs+XhgDCNj6VA4MIXkqS9nUyzVpXFa9PpQdf4qJ?=
 =?us-ascii?Q?pP2B9UwfTKfo4UOVDq6K7qIriDkSqhJSA1bU0X3+0th+DkBJAEcLWIXfSSJy?=
 =?us-ascii?Q?JguaXIVgMp+Ja5A5XM1IoXKNciuSHKacwUrbWCv7He0yRUroBEnS4k6P5Brm?=
 =?us-ascii?Q?KHh8J+hx1QDxJhaZWqEn6+VqdKt+bj5OKgzs5IRHer/qe8Q4uCWhYzhB8lYm?=
 =?us-ascii?Q?KxKS9p6aEtnSb9TglSlwljAoYIkIOzOf4LN+E3vzKEY50ACaey22wgWOxIjc?=
 =?us-ascii?Q?8d39ZSqdA2pnkKf3vEAEP/Tz0ar2OHC8TXM8NOF3nsUZe9435xTT9MUE8dsi?=
 =?us-ascii?Q?0f8UQDQe8wbioUaMhU3Iri8DpyikjC3giz+fRqTAv13LLrK+qgRiY4dULJ+G?=
 =?us-ascii?Q?VQYnSQAtFSVAphcYgHdB/jcY2c+IFAOcfHErU4IpQW4hr5Q7dKe2A0nFBPGl?=
 =?us-ascii?Q?k0wLh5OJPZVaSSVYtzjo5nWgDYv8G436QsnUHhtDurQsvObiK5zRj3h74K5o?=
 =?us-ascii?Q?ibGa64SC4/8vb/hcABiGsacL4+Vn9JTuuvNYjp4/Mb9veO/vDym8dbkm+fXK?=
 =?us-ascii?Q?K8NdlSN+bzTbODCreZ4WJCLEtUiyRnIXopUoYXi7xcnMtqsIDk+68YzYWbtm?=
 =?us-ascii?Q?AJgPvL/YmH7FZSGj/vn7x4M8Tl1zfFHM7JuKhwoz5c5RtKx3c9H13+mwOmui?=
 =?us-ascii?Q?BDfKWd+qm0PqzxA95MJWaNGyhaFQO4V6DdcxwBPJhsdeXKrwIFUBN5JneOUO?=
 =?us-ascii?Q?tQ6D8EhtmY1sIoHheWQxJYChEDPIJ1hasFnttEqN2hQFPGogHaZq+euuHjob?=
 =?us-ascii?Q?ewSAmd9+rfvHZfgRZKjE0Ak5S+2h0rrERDaixjnhgOHtoQr5ZydfUwLlSJdG?=
 =?us-ascii?Q?x1+BpqU+aRgCuxNa3hI4YhLuPto0Kwz0NeLSiuBTLJV1AtdNCZXZ/oMwez6E?=
 =?us-ascii?Q?8vyC1ylIcZVZby9bn3lne/P8NshxLVIkb+mpDmFFcUu7zmfP3/FiQ7fgQzBW?=
 =?us-ascii?Q?x5dsvQ1rswRIzgmgdZlPm/JswLL9jIHairwa58a3YbJegwV3qUNMuJCpkG3X?=
 =?us-ascii?Q?TRGx08OXMg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8522a6-8981-42d0-b3e9-08df1948bc47
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:00:29.9375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pab1o2ubGQ1/t7BOlyEbk9pbzf+CBQWe2p8eRhyX6sKobIQ92EF7lyutT68mUJe4cT/2D3eImJYr6hBxgK62fvDPiU3IeKuyQxrNAuYFmdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3275
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 08:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246459

NEWS: https://github.com/gpg/gpgme/blob/gpgme-2.2.0/NEWS

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 2 +-
 .../gpgme/0001-autogen.sh-remove-unknown-in-version.patch     | 2 +-
 meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch         | 4 ++--
 .../gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch  | 2 +-
 .../gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch    | 2 +-
 ...gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch | 2 +-
 meta/recipes-support/gpgme/{gpgme_2.1.2.bb =3D> gpgme_2.2.0.bb} | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.1.2.bb =3D> gpgme_2.2.0.bb} (96=
%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.=
m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-=
Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index ec0c4239613..2a1cccea1aa 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-=
gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-=
gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 11991439661faba92e2a3966084d40fc8757557f Mon Sep 17 00:00:00 2001
+From 1f5bb22e9ef35e18649ed35097be46279ed843c1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 14 Oct 2025 14:12:55 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknow=
n-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remov=
e-unknown-in-version.patch
index 579f47c173b..2fb0960feba 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-ve=
rsion.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-ve=
rsion.patch
@@ -1,4 +1,4 @@
-From 7f374b5827f3d5d7f57e9045259f5aca703fb1d3 Mon Sep 17 00:00:00 2001
+From 7be35847fae645873aa65aafccc5d45a110c6ecc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/r=
ecipes-support/gpgme/gpgme/0001-pkgconfig.patch
index ed3b3db2613..25e9ed43075 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 04838f9ce25f6964254310b66069ed1b37b019ce Mon Sep 17 00:00:00 2001
+From 36e642f39cc607a5e2132915c633ad6bedd1128d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
@@ -29,7 +29,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
=20
 diff --git a/configure.ac b/configure.ac
-index cd0af89..5ee3891 100644
+index ee56d99..51c0598 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -845,6 +845,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-ins=
tead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Us=
e-off_t-instead-of-off64_t.patch
index 16df7fff1b9..7f05987a125 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of=
-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of=
-off64_t.patch
@@ -1,4 +1,4 @@
-From c069f75821abe4fa7765556f2bcf3af8b04a6eaf Mon Sep 17 00:00:00 2001
+From 83f407dc19254d87a8df570d5d8a7232182b6e8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-a=
nd-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-o=
n-linux-and-glibc-2.34.patch
index 0c00cb00f85..868596fb83e 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glib=
c-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glib=
c-2.34.patch
@@ -1,4 +1,4 @@
-From 116b3ecc954387f141f7cf9f5e01185919130f18 Mon Sep 17 00:00:00 2001
+From 30c085ee02dfb819c07f0b6ec06730b7fa0c8ff4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-li=
b-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-=
gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index a71ec8e7625..3427b37f165 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-us=
r-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-us=
r-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 101b5ffa3742d7e71e75f5e22aa3efe0f4c283b5 Mon Sep 17 00:00:00 2001
+From 59bb7404bc594a6a724eafa38322b57422a66ab8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme_2.1.2.bb b/meta/recipes-suppo=
rt/gpgme/gpgme_2.2.0.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_2.1.2.bb
rename to meta/recipes-support/gpgme/gpgme_2.2.0.bb
index 32db75fdfd7..bffa0b40e41 100644
--- a/meta/recipes-support/gpgme/gpgme_2.1.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.2.0.bb
@@ -24,7 +24,7 @@ SRC_URI =3D "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
=20
-SRC_URI[sha256sum] =3D "0687a95b299871c4141f507c0f740de6b429c9ac067d0fa4e0=
62e3264df5fb77"
+SRC_URI[sha256sum] =3D "7160e80e84dafd00d956c84891c533bb7ab16a6a54fbe1574b=
2f3acf0496977b"
=20
 DEPENDS =3D "libgpg-error-native libgpg-error libassuan"
=20

