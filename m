Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725CDC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 15:45:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32665.1786376731760683571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 08:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fIo6Lwxw;
 spf=pass (domain: est.tech, ip: 52.101.84.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNhkXO/vmZ2sFmn1F8qzwjz2fGemZHVBF5XwqGlEQDogFA2Xv2jhXZLXwATMW9VbVOAl+lPBWHcSMOq+7FT3HhXmnkb1wuiJAGA0CBgwE5IPJFw3JmOiFnKrD9lanPehng+5UMFqxVxXdCANeAy+5YlqOa61/Ia2D63Hnd5zci6aLvBIdTYzlc9C0Q1WoKbdgpsG8EW5sVx9l5Qs5/Z6Kk5IQN+IyjQ3MuE0XRykWmbLRCr+F9g0sViQCfcthyl2Rqq7EKHGB+Zt+Y/hOAJrPP3GnJpwMoSupkc9RCOvjuAtdtcUJc7fd1uOmx+We40B+/J4JzuteGRtKGpY/Blffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=IcXAJ8NO+NxF7BycawhZ2Pv7pzF6I03tCn5zOWnL7NN1lV3ziSp1deE8dzcxML3I24LvyGFdC3bjeqjbAnGRloRc+EZcClLIRu1eiOuPnbf7u1SoUyKGiH2a7ZE1Rrz0hbZ+cbI0Czw5dlx1NE7RMSINkOJGVTsQt/WhCd22bk9nIHL6UjfliZ559mabCZWTV7kN5BjAcruBsBQXtkxGe/kaw/AY3UyZ42iqKEuG05WLvbVTkzmQtfSumYFqXD3un8UmwmPwve4GQr6sEjAnVWitI4nZQ+1etPjFMTlXJ7nnPQTT5yTLStGYjmieDJ4Pm18s14jhrvYQWJajdZrzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJZmzcAhnU/8yO4wXe/84V8vOM3cMiaeUPDsbDKxW1U=;
 b=fIo6Lwxw9foXKpcTJrafvPaJGDKuTy3AAqAOaAlMd+TWr+a08sHnhEGuVs/3s6H3hh8Zx0tc45NJcXOyQ6afJNWuf3W20eawH3ssCfkRo/XaCfbH5mx/o2Fr653ZyGezD8SdPIyrY0Zgj1h/lXGZyOlc70i81L/jnWeOWaJh3XoaL1qKrGS4eaJgrEKJ50poUurzx55Kky3Q/kpR7EsRTk6DAOEEeAuI415LV/U/+WSlfIChxD48x03YDshyAeY6apZ3796qQ/cWos5TuLSiHtuFB9LqqkxFz8khE7FgceOMHBsFShzIubI3tPtBns3TBDkUrh6L50LweSii0WjKSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3616.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 10 Aug
 2026 15:45:25 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Mon, 10 Aug 2026
 15:45:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] swig: upgrade 4.4.1 -> 4.5.0
Date: Mon, 10 Aug 2026 17:45:20 +0200
Message-ID: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::30) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3616:EE_
X-MS-Office365-Filtering-Correlation-Id: 1635fe31-dcfd-499e-1201-08def6f6656b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|10070799003|366016|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	adftS2ncYmfrvlIsbY5Sq92kgDFOMtz33zCy/xd0/1AeAg6eaZlFLNfGrB2r9uLf4PLI1MC9dmmb1uVJoJjoGXpi5OXaYKu2LA3sQBZ3rtnkpOM0OfZhvQBx1Tu771y2vrPTFch9orHJJW8EcqWeGvP07TCcFgpjWBX3CDPmkjWBdlcow6D43dqsGN9tc5rs/4c3+UZ+jRy5o/k5shFseVyCOi7B9OUgAEhvM16llAxMCgushFXf7hQALWb1Tmh+1V92R5Po5NZUPWAv5pFUh4Fh/QX2V40yNASRbHVvU/Lae2Nhu9XJdu/Jb8/h7EVdxrX1qawFRS0B/PBQUmgsESAWH79sNbl4Eqww4Cft1t8QDeQlzSMW99uSa/OPPXJw0HKC7LO09h/bS50TWEJCogQqPRmzURcAQdU1NqgV5eriYRGVME17yZ+kLA8L9lb/Y/iN0z0/Rt+pHolaFts/NRXpVrm6fNHt7tXwEYwyXFEtyfxd+zZ6TP7Cp5p29riw6QWjaTHzO5Cl95YH1bI0atw7yoafbYMTt7nxdIm8SjBESuXLH+DlVYLNhLdS0xVtavWy9w8rU4GmUgPaNZ2JiXHhP+xQVEhWFZqkVkLphJy2VkHdfbeSU2ANYkdgUMn/kKkU2eEa2rDUBw6QpMhZ/kWz+8VPrriOjyoMWuC+zpo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ujt/YF/plab/5n9Du5/RQst5kDv7eozg+Wb0uflPAMNWg+1Zi0URy4rqwMKR?=
 =?us-ascii?Q?jcS7Fa6Aw2hY7JWpNuRO4RdqvGrHrxw/tvVaSwKLlG4TGGbdobIoefsnhDVL?=
 =?us-ascii?Q?yvNORxipobVzabNlRx6x/2q7v+bKLOlA+3OvYE8HeYS8uivo9fkV//maU1Cp?=
 =?us-ascii?Q?SH3q3lmmz83Ld9XTpZ0GhQllbndgjWfD9NDmmK5Mo9ebRUwwWs7of9qiM91e?=
 =?us-ascii?Q?7u4Kar6htQGle0N9ZbvLgk8UvnjiUCriw4asnKBwAk1CTdNaZye3rHsQl616?=
 =?us-ascii?Q?Wp5rVZntf9s9PNN2PX362YlA1zZVO4TxijBs1y3h0VP6ZptiTqyl9/OChewq?=
 =?us-ascii?Q?apBKOHxmgeeA9PlXF/oQhEEl/0ik3n1QsyUX+cTve09MOyCD0P7OoVa60CqE?=
 =?us-ascii?Q?KY39DSW5+gkqBW04mIQXpW3+Rvv7ESsVgyHUPpgl3TMC65d15zWk7k8x5iMc?=
 =?us-ascii?Q?wQJwz/fJinMjomJpMmlxPv1zsUTc0EXl+8A0MKIrsNMVqYtoeDAMRP3OQtW6?=
 =?us-ascii?Q?ljeRzIizlqjJqRcfQXd64dwanYPevEr656nkBVeeeZ/HDE2n3WY7dpbiegZm?=
 =?us-ascii?Q?z6459iwtrWct5WVu47Pkfl+dSD7m3RDrK56O2r9JlMqGHf3zRpSkNaaghLJX?=
 =?us-ascii?Q?zIw1DGvgn8ydoFrUtYtDIygkH/N+zzbB4L2F1DcBLeEsCQv8eU6JUYsgxyc/?=
 =?us-ascii?Q?6H+hldoCmT6CoQ3EZXsoeQDyOs1o3UqUCeU5uOw25To3ciFM2LDZdYGlZ4DI?=
 =?us-ascii?Q?0lbPoB/nl+46r6g5Ov7+c/4xDpv4XNZ+k+Jt39Zi7dgOBVQdS9sJUqoNFT/x?=
 =?us-ascii?Q?W72Om/5dt/h0yj61XG2lE6b+CATNFPKz+lWiEpszYBlz3MmJUz4rCZKmZvkP?=
 =?us-ascii?Q?IV7aCd5TrrDT3aZth899iYxKfGiOHNP+MChTFNelrX4c8sLgyiXFlyrSovpF?=
 =?us-ascii?Q?K3qyAmT7ydkjJW29322DxUpgGAZxhrjtjaPVZOSCsKXFHhheZ6URG+1cLORy?=
 =?us-ascii?Q?CMlYiyxSoDeI10g024xBwEvFrXAlh6Rglp5AFrWi8In7GsPAwZ3WJY5MLCpf?=
 =?us-ascii?Q?eWpkg/WqyrosvZYqtyhN/s/bHGSOMyRB4iDpmAyd4vDpYZ+59hSJ7By9t3ch?=
 =?us-ascii?Q?4Q0l0OEI6GYc+6Likt9LBN80ngcRpN9y1XUsAjBZ43hDbGc5RVpZx31Bjyoy?=
 =?us-ascii?Q?bHt6cSZ4DYHPtxGbDu/PJiyV1oPgPlKLtQ7CkILFO8P00mkud0BKdjrhn24c?=
 =?us-ascii?Q?wNhD0CGpxhGwNMBwUhkVqrgtzym4+FyuJfxC9aKSTa0araj0HKqdYfEkt8lh?=
 =?us-ascii?Q?nX47Wzrsg9tCuUwoQCUVacG7e55p92+XoV1uhujgE3V5UxSAwk+/lqAB+oAj?=
 =?us-ascii?Q?H5v31VYhanZSNUZxz2UlhVwP/ej8NATiblkMEBkUK+QCqy3jCVpPZiY8LZb9?=
 =?us-ascii?Q?gWK0VHXyPjEZ6kXugECIvPbNdLqlLuUgkuk3F19IEYjyC2xmP0tOup1DWUwF?=
 =?us-ascii?Q?JLV5Y9+k+DRYfHnjRDNzT66qyWJlBrvdcDxV/gXPi4uYa80sukiGlnpy5DhA?=
 =?us-ascii?Q?0dcNfU5SUOqMZUPGhhpRu5tr74nirwj/i2y9Bp8yUrIURc9qJGd+z9M/GLjg?=
 =?us-ascii?Q?efWnLVtntvomIfmg34AG7pDWFKbvuEhlkwf5rCZWxXYR6PijNQ9s2xlQmece?=
 =?us-ascii?Q?etcCWGNYoWZmjhD8x5cmlA2qV+M1+eTLd/P/XAhTzxLs91Y3wyLFq5WQm6S0?=
 =?us-ascii?Q?M+mH3liwV/HpPtnlXs5cb/msr/HPLT0WxoYogNm+1pLOCxxa6R2bKKa/M7K1?=
X-MS-Exchange-AntiSpam-MessageData-1: 8IAEM8c/pVJXg2nQFFiw6w/YulenmDa56xQ=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1635fe31-dcfd-499e-1201-08def6f6656b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:45:25.8123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QY6RqvRW3SWoC8o0LnjzX/MyyLCQdNiehzphrp9XyrxGbDQEXEQonXtf+La5QKBxa/Ht7iTr3GvJWgikufjSD0RnIVUvVkzzTSdssKUjQ3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3616
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 15:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243135

ChangeLog: https://www.swig.org/Release/CHANGES.current

Release Notes: https://www.swig.org/Release/RELEASENOTES

CompareLog: https://github.com/swig/swig/compare/v4.4.1...v4.5.0

- Refresh determinism.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../swig/swig/determinism.patch               | 20 +++++++++----------
 .../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}     |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb} (92%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recip=
es-devtools/swig/swig/determinism.patch
index d6af38248d..9b021091cd 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,26 +1,26 @@
-From 7df78bedb666e49131c48f1854c6be1597bd133c Mon Sep 17 00:00:00 2001
+From 218e2a20ff978cb28fefdf7b35af8a27768df4db Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 1 Mar 2021 00:11:10 +0000
+Date: Mon, 10 Aug 2026 11:13:20 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
=20
 Remove the compiler commandline/platform from the compiled binary as this
 breaks reproducibilty.
=20
-Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to=
 take]
+Upstream-Status: Inappropriate [OE reproducibility fix upstream unlikely t=
o take]
 RP 2021/3/1
 ---
  Source/Modules/main.cxx | 1 -
  1 file changed, 1 deletion(-)
=20
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index f68b609..0c2aba3 100644
+index 83ab22a..79a513a 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -633,7 +633,6 @@ static void getoptions(int argc, char *argv[]) {
- 	}
+@@ -642,7 +642,6 @@ static void getoptions(int argc, char *argv[]) {
+         }
        } else if (strcmp(argv[i], "-version") =3D=3D 0 || strcmp(argv[1], =
"--version") =3D=3D 0) {
- 	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
--	fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATFORM);
- 	fprintf(stdout, "\nConfigured options: %cpcre\n",
+         fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
+-        fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATF=
ORM);
+         fprintf(stdout,
+                 "\nConfigured options: %cpcre\n",
  #ifdef HAVE_PCRE
- 		'+'
diff --git a/meta/recipes-devtools/swig/swig_4.4.1.bb b/meta/recipes-devtoo=
ls/swig/swig_4.5.0.bb
similarity index 92%
rename from meta/recipes-devtools/swig/swig_4.4.1.bb
rename to meta/recipes-devtools/swig/swig_4.5.0.bb
index 842a7b0945..161c23f0af 100644
--- a/meta/recipes-devtools/swig/swig_4.4.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.5.0.bb
@@ -13,9 +13,9 @@ SECTION =3D "devel"
 DEPENDS =3D "libpcre2 bison-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-            file://determinism.patch \
+           file://determinism.patch \
            "
-SRC_URI[sha256sum] =3D "40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306=
a0a554c6281fcf"
+SRC_URI[sha256sum] =3D "22ae0e887f8cca8031a325c67d005207653200b40e71edb3f8=
8780e28e47d0ff"
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX =3D "swig-(?P<pver>\d+(\.\d+)+)"
=20

