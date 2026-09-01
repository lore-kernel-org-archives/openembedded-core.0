Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696C5C624D1
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 06:21:44 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1704.1788243697599189245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 23:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TPnWjVBu;
 spf=pass (domain: est.tech, ip: 40.107.130.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXmsv+nExe6PHMY8qLDNrrXNyoHGnbDle/nKsA7aKGiWhwqE6/mwr+ma9gFTlwvYguaRV5KvfOKZXyrDqUZb9RSuRoU2Cnk2rTdWdpo3TO6Ej3HsNDTOyUBezH4zzEnZLwtZeok8stNzb85ihB1OM5fbE4cApS7St2lj9nYv3xAhQmtsLJQuGQwbrkf+NWPYCIU/GbavdLmfpOVOpsVYsM/X2wm4cP9tn1hFay7Nk3baVJcEFZWuAW7ntJYY6Kt4Be2+inV/xnGDE/zZh2g1Vl+Rwc7//7zYy3kxtvqW5+6ZbvMDSqSay10Jo3RhcZsWf4eq26eTsLG/9mfZzC1y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V87qZLHvY0qG04LCHhoTx8v+LKYEZQkEf2NZc17Tzbk=;
 b=Du+/z0PFq2K5zaQkw06MSx2SPYBp90iX0K4CHVGmP/+wh1oPZmCSU9ESmvqIzxyqlM6YVrpq6iMnKOEw57wFU5WiM1fGFkrY1qYDmWdBFLVKj9uWYZbMOSpnXpT83aepugnYj1glUurwnQvkCFmkH6fVxUnn2sVopuhLksGWtKNp45R6Sxa+i39OkeI4aHIY8DzO2+H+VIM0AAs+yxY0oH3SXdLmYaY93o/kniKME/W2lqH3L45gJImpj/gR9sDkyOrotNac7nEUUzSWxqXp1gqUTHcQEIn3ayplIUgdQXBYRHC2CXQg4NK88nsXUSt3oBkxV8RhetCK5PA0aCWkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V87qZLHvY0qG04LCHhoTx8v+LKYEZQkEf2NZc17Tzbk=;
 b=TPnWjVBuBR+RIuo/izQH/AXTYMPs+/q5xoHTTrwtO6EeqGKQ3CZuBED+ReueOCgSf95nsM8J7dOjDjSApFz3n4HsJTUFowxY94OVBIgmOmGw7JSrAz27FBUYb3Qh86g5CrigMZmWWLEOwOY1jtSiDpzcVJD0+gUmdBRuVKNsm20coIUUS2gwfsU/ESZi81s/82f2rkZgyfPNlRmXis0FVLlwlEmUEtCsd67c+n7RA9tEuWeVKcYIWHBDxWYriaBaXE8+zSsdfbxXegbJFSpwbHorFtcnFmeDlT4v7KzVbTCCoIyL63pjVoiuI4iYNJd0bc7EaosIlH5RkQe4NLiZUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3535.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:21:30 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:21:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] gnupg: upgrade 2.5.21 -> 2.5.22
Date: Tue,  1 Sep 2026 08:21:24 +0200
Message-ID: <20260901062125.37994-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
References: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P251CA0004.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3535:EE_
X-MS-Office365-Filtering-Correlation-Id: a8760d82-7b42-4309-51d5-08df07f142d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|23010399003|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	4gDSJJ6VjtELpuXkfNPUtgem0HmfZXdM9HhO6rgzgz/i7bQoQTO2DVASxvAquNRsc+IR4LF+WoOAxqZrPLgnlRTKJOaC3+D4epC2nh3HGH44dOqJzK2Hkw/nztnk2yCU3CkJpxCY09ste1KJCEZxFXeHvMVvuziv2pBEVaeOt5uZgN38AHqBH6SaFf9LWgzgtq0U578jLfwAs0xChtuWjGPFizrgxj+z1C0i8P9lTxS72COvfNhuQLZI7/15pIzZ7tNpgykMN2oESedXM25+ms1O7+HRI8/+yiD8BTknseS/39IitOCOotgEiJWHJooXDkhkRpaljNwuJNRP1KGBNl3FwUf0qqXNcF3g2+HgfDyutQkLKhixnlouA3Cxmi6w5WGZhTbHOXzu16A2R6vNjTT5Bz0OTKuGuzGi0r8Y2zAW2d7ueoW2/bxPFJlxdTPlAAMzyyKrETAkDQkkZdZVQ5m54hmWkd0quSLbmEm/ByS34zLvB3x/BsQgK6k3hxLOFVGhbVD5z7zzM17NTBiGxyQb7YW5kSVVcp6mX/UjJXDZKe6NKvjGUpvhRXla7EltrVuOI8ZxJRl1FNxH+8Q75/lbUV4XIrBnK9cMr+XUn14LWrmnOF1AxZzO+Tx5TnUH/zz7mK/DPuW4Tpv6NyeOYZvXMYniRvsSjp157NyfooQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cLniVMhAK4ExIt5A+thr3mPp2tUW5aEv+klsBpELw+vturiKeVWV29JVUPPU?=
 =?us-ascii?Q?kEM4pbk6HMestsuTHvFdJQAUJ5v7k2aA0BLElXZ3Gc3NBloAFMzDaJqBlaXB?=
 =?us-ascii?Q?Tg/34bUEUyKGqjZNlcvFmK94aVMKkkUY0gxRaIanBrEnXTQ7rXriJr6K2D+l?=
 =?us-ascii?Q?in+bHKGsJzvRm+Rj//oYw3p4WLUQbFctkthmtyjy6Zi5gxADKP5gdNEqHnhC?=
 =?us-ascii?Q?kn5gvWCxyivWshk8YGBnmP6MZSfMbrqEmDxP7FqbgwHF2Ks0v8116nIFCI1V?=
 =?us-ascii?Q?4bdvyI3EtV2YjAbAx+syhNC6Zd1tQm8m60Ba/DK6VMTRNH5cMuKCSq9Q8rzh?=
 =?us-ascii?Q?XeLg2qUyKys2GG67l3jsuPqa+Emy4hvJMuugbTjgOyZa/XGQCo/HYBOZFv03?=
 =?us-ascii?Q?IP87dA3J89hlq7hAwCoa/KvInodMxIsYEfvhzJWnI6SE/ne1hXeHtP96+cAZ?=
 =?us-ascii?Q?0SG2GrYSfFRwNA2RMY19kD+gHNT0WCrkN7zGvtop9m/snAojOpckktHOPZp+?=
 =?us-ascii?Q?REw+9tFgoouFLsoMPiJMl1CcttEL2H3OVvkJvP5Cnw2+pwuPpBazsZ8GYHxL?=
 =?us-ascii?Q?BjbomDNsi06joobG4xaaGe10RrLWB2SOskI3mTxtJUTCAzzh2GYVz9TLOaEp?=
 =?us-ascii?Q?DBz7+xIusfB2GEjxSPL2dYaNr+Pr8JamcdG9Fgwxj+VAZZzya82qbNtMDgLK?=
 =?us-ascii?Q?4a4dXG/tWLKTycPAk3+2BgXXrbU9PlRV13G+Oy8dLy5OznvBdy4/tyE0bHCW?=
 =?us-ascii?Q?/UOfKtecRB8bs3Y9te3kt8lXuLfdY/klIS2MKVQYEs/o+JVdunOJsW5U52hY?=
 =?us-ascii?Q?X+4b3ZgD4YTpzUbuIKnmvFDJdz5ILWGWaP36PzqtDkgP3yc4enIZVUpH4xSt?=
 =?us-ascii?Q?KZ8r9OiHIX3rRphJWeAQyvUq7q4yAe30JU9b6zi+LazQh3swTdBA/S+AnAQD?=
 =?us-ascii?Q?V7ywxVMXUkK+x1rcEmDqKzYEw7NwFlPga3OMvEEi9yNsZdK9KLo+t0LuSTSw?=
 =?us-ascii?Q?oZ4cLhAGX6k2sSXl/448a7dulw+NZe6mnfdjqnt8xZA3Yv3GJcHPVFPBh2RF?=
 =?us-ascii?Q?u4tkW4IwQOZOOpGpcHmey5aHw2eX5+ogcM5GRw4CQZ+b5hh9qtGpTG4Ckesn?=
 =?us-ascii?Q?48G6H3sWzRFLBfRp6+2kSvhS86xN9/2oaG/t6ZouxDPG05k6LkI7XpGWf9Jd?=
 =?us-ascii?Q?k5LZgF/t3aNrCRM/lEpTJLOdYiUcPH69xc5oFpVQa5sazd2C4whCneKyp3Vh?=
 =?us-ascii?Q?DpPNZ/k9AJTWnF6XNuzbhql3HJIOyJ3J8GunyOAJBVCGftMG2y5sFKEV0mHy?=
 =?us-ascii?Q?O1Lmja2xR+8Ln5Yw0tBDRDo0CU8Pwfrpij9udMb4y+VHyl16pyD2Ipy4p+sw?=
 =?us-ascii?Q?8pmnGGh8LaNpBV9U0E9vsOk39WZVuXMymcDhMiJ01X+0r6e5Nh9qv7OSdW+L?=
 =?us-ascii?Q?xNRVsxr+ApH/bez3VJNMcyZKeUqsizZdb/x2KOoRLGQ7QHkcQYgs3e1HpejU?=
 =?us-ascii?Q?b9/5yV3wpYm1jaVBUhzj0YfuVYebE6GFiPY762ZACWRyzmrQj+qxQka4wuzn?=
 =?us-ascii?Q?8T/nBxCUSf8RIYvtJvjZkQC8ftbXMSo3FMzpYKwKtucTxfZinyJRWEXSooVR?=
 =?us-ascii?Q?xV5yp+9nMhvVQwMWsofSuvF2K4F8LZO4/5u+mgRctp4B8zleCDtMGkPkv3MN?=
 =?us-ascii?Q?En7HS3Je7UInuseu2l79gZDXSPjKlvc4Ztf0fEklWSG7SB4C8rZtUizOi3Jh?=
 =?us-ascii?Q?wx3o+ZvPXPMDCsZ2fYKl6q3fP2Sw6+CcikhgDQb8StZxpC93Grt1hffRdzzG?=
X-MS-Exchange-AntiSpam-MessageData-1: ILce6Pbfvqi0tL91Y9TgbnQ8TN6ty71Qj8Y=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a8760d82-7b42-4309-51d5-08df07f142d4
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:21:30.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u3CSmKWhFWtzfgwI2QV7K6RSkvFwXbqZ1udeYw3niGZogSINpibFBvboKOOW9VN9n5eldjORpxKaHlsfOOvP42Qw6W0Q3irCSInWgKG/fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 06:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244796

CompareLog: https://github.com/gpg/gnupg/compare/gnupg-2.5.21...gnupg-2.5.2=
2

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...verride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...e-a-custom-value-for-the-location-of-.patch |  4 ++--
 ...-use-pkgconfig-instead-of-npth-config.patch |  2 +-
 .../recipes-support/gnupg/gnupg/relocate.patch | 18 +++++++++---------
 .../gnupg/{gnupg_2.5.21.bb =3D> gnupg_2.5.22.bb} |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.21.bb =3D> gnupg_2.5.22.bb} (=
97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-ne=
eded-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-ini=
t-is-not-needed-with-gcc-9.patch
index 7a3fa59c54..52db780959 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-wi=
th-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-wi=
th-gcc-9.patch
@@ -1,4 +1,4 @@
-From 46db1301b1b71f47aa131b9a3de9d1cf356cf408 Mon Sep 17 00:00:00 2001
+From 8b7d344ed35bc4bcfa0d531a0885fc1bea01ffda Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custo=
m-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-=
configure.ac-use-a-custom-value-for-the-location-of-.patch
index 1c7cd7ba7b..04dd45e676 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value=
-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value=
-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From fd060f524e50c7c3f8694f71630ac151627235f1 Mon Sep 17 00:00:00 2001
+From f86e7337698debfe5152f4f4bc840bf56f868fab Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 5ac4d0b..09615c5 100644
+index 9e2a42d..b48b88d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1909,7 +1909,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of=
-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-in=
stead-of-npth-config.patch
index f4c9b2161a..7553bd9f3f 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-c=
onfig.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-c=
onfig.patch
@@ -1,4 +1,4 @@
-From b8a99b2d9caa05f54be25635e3b1687753fe7196 Mon Sep 17 00:00:00 2001
+From 3c1d201eace11d557eb6c589842e93b8bacbe8f9 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes=
-support/gnupg/gnupg/relocate.patch
index 02f03386ec..234afd16fe 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c70694bd3e71cc1fec6ccb3ea0f694c3863ebd48 Mon Sep 17 00:00:00 2001
+From f49d102adf393f57e6ca7b6ec6969f60115055ef Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for i=
ts
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
=20
 diff --git a/common/homedir.c b/common/homedir.c
-index 835f0ea..0a67a33 100644
+index 7538642..92e8125 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1526,7 +1526,7 @@ gnupg_socketdir (void)
+@@ -1575,7 +1575,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +25,7 @@ index 835f0ea..0a67a33 100644
        gpgrt_annotate_leaked_object (name);
      }
 =20
-@@ -1555,7 +1555,7 @@ gnupg_sysconfdir (void)
+@@ -1604,7 +1604,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +34,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1591,7 +1591,7 @@ gnupg_bindir (void)
+@@ -1640,7 +1640,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +43,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1618,7 +1618,7 @@ gnupg_libexecdir (void)
+@@ -1667,7 +1667,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +52,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1648,7 +1648,7 @@ gnupg_libdir (void)
+@@ -1697,7 +1697,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +61,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1679,7 +1679,7 @@ gnupg_datadir (void)
+@@ -1728,7 +1728,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +70,7 @@ index 835f0ea..0a67a33 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
 =20
-@@ -1711,7 +1711,7 @@ gnupg_localedir (void)
+@@ -1760,7 +1760,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.21.bb b/meta/recipes-supp=
ort/gnupg/gnupg_2.5.22.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.21.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.22.bb
index dc77691bbd..803fb2765a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.21.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.22.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native =3D " file://0001-configure.a=
c-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "e3af2c8caa46a66a9329fa7c6880af260451914d819595beab=
c2c26597b31352"
+SRC_URI[sha256sum] =3D "96e27b020ad26510388e06f5f07f3f70a4ed8916ee995f1b72=
b7a024e6d9d87e"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \

