Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA952C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 13:03:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29723.1786971798729159557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 06:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LZrg0fAZ;
 spf=pass (domain: est.tech, ip: 40.107.159.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DARWy+I/cpLkTqBKoIWRhGsfYaIESFHXfuajnrNwLAxEMXYsnWebV4WNpX1VJro2/EpovagZDm4jxy/SCdWpLdz/Ts30yDZ9Y9Z57ycs0Yyc3rlH8qilJluFU9SMozvMJw+YFqWv6qUoBmPrJUQs+CnxT46+Kq18zyOHwxaWJaDOXteOGtcpb+3wX6Ps7/xFaKbkMHBdmp+h3/LwQ9xPsYymoqltD53nihS+ixTP8Hl1HuvLXLeXsfMInl7orW2ZBc2zU4XNC/FtcAtI11efHqbZCApDrOutqiIhJmjRHcxOTE8bxMI775210ILnH1i+5mNYsxxXBTptLl2M8Yh8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuinQiIIuWW0JOgBx69jXZv/4i1mZmhSzia+OafTpd0=;
 b=ucsZjdUE/4WrSTGC0Og18T/AT4BBCegFcgSpqRPS6K1ejIOGuQzn57pLK7DlZ1CPJTdKQ9S3yp9CXFSNdCYhzVqXA4XrdoIrBYuBzVaRguF4DCn9VoPMCzKekyaU4sHO4I2t9LJPm+nOSOuwKNgfclH7WLat0FLln4ZiHDUs/kJEe1h/ZEHf+20QmGACrg+IbZt8QpHGRkXF1IuZQdzJgck4zTvKB6OyuKhDV3xcX66OYUCCdkq+n8or2BmUzdnJGTX9EV/89bPD9oqPP+bh5OfM+TfeheoEVCA5W0esfYhBItGWqq0XsagYCYH5//d6q3jPITS6h2MkSlXF0KVDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuinQiIIuWW0JOgBx69jXZv/4i1mZmhSzia+OafTpd0=;
 b=LZrg0fAZFjNRnBM1ljHwRBjifmuPwWhPtMd+/uyMsgRWv6vJ9ZEs46bLxw0eVr+kErbd8qEwB3Dg/wmz94fpWCtViJIC9zLd6f+XCoaLgWw1GIcbhPbXRE85ojHm7E7b5WqIv+Oe1xBcQBtW5sin95BcLhBLwyf8JbYPpJwSDiJWaYrX5XIqKU+5WAVaOgf9RH89VPfXtYPkxj5bJ4bK9oDqE+nAS6HSHanjpW2sMG0yzsNTfz6qGpAyc1r6xNEzRrExI3pjYNHKr6cs7wh7EOoU8T8SyS3BTIt6vWNOViNe8+IVXnf8vOeWPRXMvKKoCxDTAwu6w818l/Xeg3NhuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0972.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 13:03:15 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 13:03:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2 2/2] boost: upgrade 1.91.0 -> 1.92.0
Date: Mon, 17 Aug 2026 15:03:00 +0200
Message-ID: <20260817130300.47761-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260817130300.47761-1-jaipaul.cheernam@est.tech>
References: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
 <20260817130300.47761-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0972:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f5ea4c-01f2-4cfd-ce6c-08defc5fe6bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|12006099003|56012099006|10067099003|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	c0VjAh2VkC8bW7mDYE7fd4pvpBkLXlifHXiayDwBcUCwcwybetmXsRTUCKDLJ8aECMZCLlWc6L+564bPwx10OW652Qi12p/cmmYvD60Ti3RslKqFVdgEKhyo3CY3HrxbcZXnkATERFO9TyDH6NS4SBXO5nWtQC+Y8ZL3Nc0PNOa25wD8j5mz8kkJicdA0EU+ynpuqrJmcWCMsU3U/uDhXyE9EpZS5EydcI470Hh4Pd0ea2nKO1jaI3nZdGncAFJOphtriMELrpQuUGD4oNd30s3SgFebe/XhAEQ6rJSyncOEQdUnJwhl6lsVFKI6UztB0fz+b9QRrepN2zqALZCMb3trJyrGHuK9lG8o1WVhV19Zpgj/j/bsDJuVdJuiyrqDaH8NOUMSknNXLnU3Zg/qwaOjmkQVUgStVVPiLc85o5zhgIeh0oFNT4yqpfkEKqdGpljpgsQi+4XYZCpzwiJFBqFVGrpqgfpfzw9TAJ5dp0WlTXZs3n3I0Mm9SdwAltkci7eAcdMHY66QmtJbBX8DeX4WtjHT16DbrjlWkurm6X1aPVyZyYn0S1m1yNmRr+9P9CED2pYW5mFSkJnpfsaibz4w6vqxUrbhvznKXyplphA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(12006099003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KwuGRov3K/IpaPZR7hqIKetIHW/BQ2j8qlHspfFMkFuUMDUfC0tNPLzx383L?=
 =?us-ascii?Q?2zXlXY9ScILKpVsBTKyr4sVDrVOdXdzOY7EvxZAfouOhUUG1L/jbUKcGRq3E?=
 =?us-ascii?Q?VWt9Lt0M/qq2tOadtxsTtsLSelRkyPRXfr1nFF+1D5J556b1b+RBlRH+fr7e?=
 =?us-ascii?Q?tChjMePT2hCpxayPzgC1lMMQIiusyvuPPdaTgl+ZfN1e15c9O+pMVP0Luju7?=
 =?us-ascii?Q?RBiJ/9blURUBU7RpetB/x/2kKNUOEqYedGb34L1iFcdueEwJ7rc9k4fdtfhy?=
 =?us-ascii?Q?O/VUI+Eh4gOu8vrtZKkme1pUyWmpKRQSk88/z2OT4EhiQKNUZPAgyGgjakfB?=
 =?us-ascii?Q?4a+McH1olfq+53RiEwVyJ4AjY0pJYEvonqf+Eiutn1tGOQozrzXQGTWR1jcE?=
 =?us-ascii?Q?b2ZY0Vh3noF7Iy0nJ9gMTrFJHraf/pA7vhFt26T+39ypWLtv5i/kWCzlKaQG?=
 =?us-ascii?Q?p/s69MBTiwkwHKVbz+JiC/0tWjyLKGBLuBzHmea+29tTuI+p3QYrkIL3jxpr?=
 =?us-ascii?Q?o7Y5Ft1xg39YKUF/NYu4lHRj33wbyJNHaWqPJzr/2mfoV3yFB1gx97ON9ofl?=
 =?us-ascii?Q?vcUrfZZm+3ISLVmD7sFvgGDdaSufRN7n22gW72FTCmR7uGi59YaOvhR2HZrh?=
 =?us-ascii?Q?XXPHF4yu/E+kFNYQWaBUT69ysSf+hryRQiAvW/frAhDjiPb+wayqN/72qz8f?=
 =?us-ascii?Q?7fZ98TSCU1h6QeWaYGPvmC6+wnkzMWSMi/fcFeTMYZsdXukI+UmfR3+2wDRr?=
 =?us-ascii?Q?cZfbgfLVX+4ZXct+1feBcytyUP/7EpfiBoqkuIrKcjJ0jVzYQlh5vUgfV5Bm?=
 =?us-ascii?Q?ISPdpu/cp9B4Q/I5GM6CNDy3z1mhe+H7mhAtWiIXhC9MMkdPF1jjP8rp4vS/?=
 =?us-ascii?Q?zLOjEmNnUvsadb9+vTApxVnSVrBLHarKL91rlnn+WrxKld5Axj46e8ljZvV8?=
 =?us-ascii?Q?5BchPcEyy1w4BSHNDAonZDLAYP8EeHRBextbVcYSNACPGutyIMVsJcqKhtax?=
 =?us-ascii?Q?6YcO6YSoXwfGH5d+56fzDr8bJyzBr8U4dAkFoKl00W3/vW0q73LFnE91CVLj?=
 =?us-ascii?Q?hcN3abeb1hCf+xp9oPunDozGT/pOML6tAzd/XuY7WC7r9jSRtZ3k/hWRo8kQ?=
 =?us-ascii?Q?gpfGAqUL3v5PD/lETYPjb/9xhFfp7UsV7SgpxV2ppIj0xiy85rKGPMF+xwCo?=
 =?us-ascii?Q?v1cwBT+/25j5u4L91+1cJjEgIUbLEB+CqL63QDAePYTZYyVOCkwxbQgv/Izi?=
 =?us-ascii?Q?VqhvkSZ/lFn88sgZmpCfMnvbvuUWHequ3Ors2fJQX6AU/2v6ZhxVhE4UMz+v?=
 =?us-ascii?Q?zAg4pu86GpzYscDKzA9AfD2602IuyHEn6S0qwLxYBgr7g1qcV2IlM9kcez7w?=
 =?us-ascii?Q?idCEqoCOYDYMt8Co6WIrh5TYaG/pEJwEyEMD/YrBUDVJ8TMhS0Olt+4TcHqZ?=
 =?us-ascii?Q?v6YpO5NaunJRYinjoSKNPXZenQ1m2CjFzeEcP1VyeOG9x4FTxQKYdR+wOSVL?=
 =?us-ascii?Q?f/AEbq4R3bp5cnFFMZCz13YaEwxv8Zg+6gby+Z3iFzU05Rze14iZqt3k+I8k?=
 =?us-ascii?Q?1k2Bz3CsZ3d03ujU1NX9TDw5Oy6lYIDcZI/qXtRhRiTY4+8ZSvLQEohQMtrK?=
 =?us-ascii?Q?kHPaU6gbO8bvvbJie3BIj5RtoXZb3jEfmes+RvyZcOLiUogvtDKjn22X7sTw?=
 =?us-ascii?Q?gEvaY6IwhSCDKzEkPu/hYqLYc8DxShsIrVePta2bFwrQjxqSy/zn6nrXUuIl?=
 =?us-ascii?Q?lEX5vEESjBby3aAmKnNylxsPO6ji6+E=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f5ea4c-01f2-4cfd-ce6c-08defc5fe6bd
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 13:03:15.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9/KP1Wktcmp+27I8uWett/h1I17fPOgwWdcAb8pljKZrCaw3b6UXTHQncv/GSGB0Rl1pk3zMbgm/rD2pSRUZqTsbvtI8lVftgDVmjdU2VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 13:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243622

ChangeLog: https://www.boost.org/users/history/version_1_92_0.html

CompareLog: https://github.com/boostorg/boost/compare/boost-1.91.0...boost-=
1.92.0

Backport fix from upstream for boost.histogram build failure caused by
<local-visibility>hidden leaking into install targets (boostorg/histogram#4=
25).

B2 1.92.0 now triggers boost.predef's install-data target during install,
which was not invoked in previous versions. Add --prefix to do_install so
the files install into the image directory correctly. Ship the predef b2
check tooling in boost-dev alongside other build-time files.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
- Drop rm -rf ${datadir}; ship predef b2 check tooling in boost-dev

 .../{boost-1.91.0.inc =3D> boost-1.92.0.inc}    |  2 +-
 meta/recipes-support/boost/boost.inc          |  3 +-
 ...h-instruction-set-flags-we-do-that-o.patch |  4 +-
 ...01-dont-setup-compiler-flags-m32-m64.patch |  4 +-
 ...b2-project-requirements-out-of-build.patch | 85 +++++++++++++++++++
 .../boost-math-disable-pch-for-gcc.patch      |  2 +-
 .../{boost_1.91.0.bb =3D> boost_1.92.0.bb}      |  1 +
 7 files changed, 94 insertions(+), 7 deletions(-)
 rename meta/recipes-support/boost/{boost-1.91.0.inc =3D> boost-1.92.0.inc}=
 (90%)
 create mode 100644 meta/recipes-support/boost/boost/0001-histogram-move-b2=
-project-requirements-out-of-build.patch
 rename meta/recipes-support/boost/{boost_1.91.0.bb =3D> boost_1.92.0.bb} (=
76%)

diff --git a/meta/recipes-support/boost/boost-1.91.0.inc b/meta/recipes-sup=
port/boost/boost-1.92.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.91.0.inc
rename to meta/recipes-support/boost/boost-1.92.0.inc
index dc68d7a336..98c2ec5aa2 100644
--- a/meta/recipes-support/boost/boost-1.91.0.inc
+++ b/meta/recipes-support/boost/boost-1.92.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2]=
)}"
 BOOST_P =3D "boost_${BOOST_VER}"
=20
 SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar=
.bz2"
-SRC_URI[sha256sum] =3D "de5e6b0e4913395c6bdfa90537febd9028ea4c0735d2cdb0cd=
9b45d5f51264f5"
+SRC_URI[sha256sum] =3D "5c1d40cb8e19adbf740a4ec2da35b3e58f3f5804b1dce44deb=
53df72193cbc6c"
=20
 UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX =3D "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/bo=
ost/boost.inc
index 7a343e54f6..6cff7c0f8e 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -89,7 +89,7 @@ FILES:${PN}-test =3D "${libdir}/libboost_prg_exec_monitor=
*.so.* \
=20
 # -dev last to pick up the remaining stuff
 PACKAGES +=3D "${PN}-dev ${PN}-staticdev"
-FILES:${PN}-dev =3D "${includedir} ${libdir}/libboost_*.so ${libdir}/cmake=
"
+FILES:${PN}-dev =3D "${includedir} ${libdir}/libboost_*.so ${libdir}/cmake=
 ${datadir}"
 FILES:${PN}-staticdev =3D "${libdir}/libboost_*.a"
=20
 # "boost" is a metapackage which pulls in all boost librabries
@@ -200,6 +200,7 @@ do_compile() {
 do_install() {
 	cd ${S}
 	b2 ${BJAM_OPTS} \
+		--prefix=3D${D}${prefix} \
 		--libdir=3D${D}${libdir} \
 		--includedir=3D${D}${includedir} \
 		install
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instru=
ction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-=
Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 92bb6e55b3..672a41cf45 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-s=
et-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-s=
et-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From 98fff479c074472833dcacb815115f247e9023c7 Mon Sep 17 00:00:00 2001
+From d43269dab039cefe841c7fe9804d0cb6b5bbc393 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 153 deletions(-)
=20
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index acf02ce26..becd0ad05 100644
+index 5359b018d..ac313ce0d 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
 @@ -1150,156 +1150,3 @@ local rule cpu-flags ( toolset variable : architec=
ture : instruction-set + :
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flag=
s-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler=
-flags-m32-m64.patch
index 229e5ab8ea..271220e589 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m=
64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m=
64.patch
@@ -1,4 +1,4 @@
-From 03ec6a66ad60d224d56c0b85eae843b469b572e0 Mon Sep 17 00:00:00 2001
+From c10c18b6d48304efd7e9d07fc46ab6db932f9694 Mon Sep 17 00:00:00 2001
 From: Anuj Mittal <anuj.mittal@intel.com>
 Date: Thu, 14 Nov 2019 10:13:53 +0800
 Subject: [PATCH] dont setup compiler flags -m32/-m64
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 16 deletions(-)
=20
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index becd0ad05..e39bf8454 100644
+index ac313ce0d..9221f8615 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
 @@ -375,22 +375,6 @@ local rule compile-link-flags ( * )
diff --git a/meta/recipes-support/boost/boost/0001-histogram-move-b2-projec=
t-requirements-out-of-build.patch b/meta/recipes-support/boost/boost/0001-h=
istogram-move-b2-project-requirements-out-of-build.patch
new file mode 100644
index 0000000000..ee3324f95b
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-histogram-move-b2-project-requi=
rements-out-of-build.patch
@@ -0,0 +1,85 @@
+From 6f9d9d2c7c9736a8932460ee6c03244d55d24539 Mon Sep 17 00:00:00 2001
+From: Henry Schreiner <henryfs@princeton.edu>
+Date: Thu, 23 Jul 2026 10:12:17 -0400
+Subject: [PATCH] fix: move b2 project requirements out of build.jam
+
+<local-visibility>hidden as a global project requirement leaks into the
+install targets that boost-library generates and breaks alternative
+selection when building the Boost superproject. The warning flags,
+/bigobj, and hidden visibility only matter when compiling tests and
+examples, so move them into test/Jamfile and examples/Jamfile.
+
+Fixes #425
+
+Assisted-by: ClaudeCode:claude-fable-5
+
+Upstream-Status: Backport [https://github.com/boostorg/histogram/commit/6f=
9d9d2c7c9736a8932460ee6c03244d55d24539]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ libs/histogram/build.jam        | 11 +----------
+ libs/histogram/examples/Jamfile |  7 +++++++
+ libs/histogram/test/Jamfile     |  7 +++++++
+ 3 files changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/libs/histogram/build.jam b/libs/histogram/build.jam
+index 3adb8997..4aa62f46 100644
+--- a/libs/histogram/build.jam
++++ b/libs/histogram/build.jam
+@@ -19,16 +19,7 @@ constant boost_dependencies :
+     /boost/throw_exception//boost_throw_exception
+     /boost/variant2//boost_variant2 ;
+=20
+-project /boost/histogram
+-    : requirements
+-        <toolset>clang:<cxxflags>"-Wsign-compare -Wstrict-aliasing -fstri=
ct-aliasing -Wvexing-parse -Wfloat-conversion"
+-        <toolset>gcc:<cxxflags>"-Wsign-compare -Wstrict-aliasing -fstrict=
-aliasing -Wfloat-conversion"
+-        <toolset>msvc:<cxxflags>"/bigobj"
+-        <toolset>intel-win:<cxxflags>"/bigobj"
+-        <local-visibility>hidden
+-    : default-build
+-        <warnings>extra
+-    ;
++project /boost/histogram ;
+=20
+ explicit
+     [ alias boost_histogram : : :
+diff --git a/libs/histogram/examples/Jamfile b/libs/histogram/examples/Jam=
file
+index 655c0228..33b98d0f 100644
+--- a/libs/histogram/examples/Jamfile
++++ b/libs/histogram/examples/Jamfile
+@@ -20,6 +20,13 @@ project
+       # list could go on...
+     ]
+     <library>/boost/format//boost_format
++    <toolset>clang:<cxxflags>"-Wsign-compare -Wstrict-aliasing -fstrict-a=
liasing -Wvexing-parse -Wfloat-conversion"
++    <toolset>gcc:<cxxflags>"-Wsign-compare -Wstrict-aliasing -fstrict-ali=
asing -Wfloat-conversion"
++    <toolset>msvc:<cxxflags>"/bigobj"
++    <toolset>intel-win:<cxxflags>"/bigobj"
++    <local-visibility>hidden
++    : default-build
++    <warnings>extra
+     ;
+=20
+ alias cxx14 :
+diff --git a/libs/histogram/test/Jamfile b/libs/histogram/test/Jamfile
+index f69299dc..c156e124 100644
+--- a/libs/histogram/test/Jamfile
++++ b/libs/histogram/test/Jamfile
+@@ -30,6 +30,13 @@ project
+       cxx14_constexpr cxx14_decltype_auto cxx14_generic_lambdas cxx14_ret=
urn_type_deduction cxx11_user_defined_literals
+       # list could go on...
+     ]
++    <toolset>clang:<cxxflags>"-Wsign-compare -Wstrict-aliasing -fstrict-a=
liasing -Wvexing-parse -Wfloat-conversion"
++    <toolset>gcc:<cxxflags>"-Wsign-compare -Wstrict-aliasing -fstrict-ali=
asing -Wfloat-conversion"
++    <toolset>msvc:<cxxflags>"/bigobj"
++    <toolset>intel-win:<cxxflags>"/bigobj"
++    <local-visibility>hidden
++    : default-build
++    <warnings>extra
+     ;
+=20
+ # Check consistency of build systems
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gc=
c.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.p=
atch
index 178c1dd416..eb6781f3b7 100644
--- a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -1,4 +1,4 @@
-From 2dd80802e0b9747ed32f45a886c7ad21b7fa61be Mon Sep 17 00:00:00 2001
+From 698ccf919d6facfbacdeeeceb7aeff1431d12316 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Fri, 23 Sep 2016 01:04:50 -0700
 Subject: [PATCH] boost-math: disable pch for gcc
diff --git a/meta/recipes-support/boost/boost_1.91.0.bb b/meta/recipes-supp=
ort/boost/boost_1.92.0.bb
similarity index 76%
rename from meta/recipes-support/boost/boost_1.91.0.bb
rename to meta/recipes-support/boost/boost_1.92.0.bb
index 4b580d078b..01fc6bea66 100644
--- a/meta/recipes-support/boost/boost_1.91.0.bb
+++ b/meta/recipes-support/boost/boost_1.92.0.bb
@@ -4,4 +4,5 @@ require boost.inc
 SRC_URI +=3D "file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-=
o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://0001-histogram-move-b2-project-requirements-out-of-build=
.patch \
            "

