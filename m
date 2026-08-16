Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1653CC5DF6D
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:26:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12743.1786897581017369743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zd3lh+yH;
 spf=pass (domain: est.tech, ip: 40.107.162.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCdWqynrWORw1r4dkpI8gAr0TreVWWkbr2j7ZZSSixTpBYEhLSQ0U60PARLpR0ONemgrRgWXUZRzIyXonKz9lKbznQkA0OU7FnkvF38LY+8InDwb6w49NfHvlSWLmbAcHTPYfxpwIZ5BU/81td5XgPY75LKRNGX4JiwXZSN2G28aUfyrM61Tc+lgztvok7NcVEkOXxDzVN6tPD1SIc+Lm6502bUG5J9pD1uxzWD8XXpVRBaC+yOJ0+JiRvsr9wPPdJg5oebJjJMFC9dO68vbHqCBG4FYPj4+aC64kE9fnd4J1CG6YigGWagNK0DzKNnuYiFG30cKI+nAkHnoLMGJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qIGTlM6kiYbVgZBSwrvBq8rxKyBvtPxf6s7MyLgJL0=;
 b=FoL1V5gEvXE+05BUxmcI/PLQxbpLJSB+/3SYt7XABwAT6pADzj6qC/TYfO650GUEFn93bWDirkOX72Xezpj6oLIphJZrl8FEoA7x5X7QyOso6OToVPBNPw1K3KNkR4jxwatgrC+rFNSey7SUI7SxMIsGY3VF68Jdx3zS+MuP9SPi1HXuNg+xZk3t7IMldWt1YNKNne2k8j11O7tVRGpBXzO1p56qhCjPUjogGEbcghKPRl7Zc2LhnTywej3xTockr/XRpd/HCXJqBi4Lw7uhzdDTAx4BTMvzHmmrqgfiq8c1x9wlJx2hMZm7Y11srKb0iwUFlZDkNZaE2EFeRmj2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qIGTlM6kiYbVgZBSwrvBq8rxKyBvtPxf6s7MyLgJL0=;
 b=zd3lh+yHHkSKM7DzDFWpaOcT2qXKcEo9grmlPL3jLExc3nE2sanm9BIVQIEptXd7Top1FWCpFneEpZsCOyckGjgsNAJZXOqry/TOBnKyl+gmhhNUdXN8KPD2vUZPqr2eQ3sdwVXK4vHNV5tMwSePrfUo5WrtGvK7yX/wr7tPww/kneF8EBDGUiBtN+Va2vzcobVrkqI3YaRwr7A/Ykg4ZHCZZXCacG3UM2PDQLwUgWGMJTw27pXcxJ9WWAtrzB8UZYdOVYTrij6ighMm1EQLRWZXJQSaf1EkqTPRuNXOXDh6ohF6K5r+ijnjtKrSEzcWe+XxNd7QECRT6Mi0CtgxAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB2751.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 16 Aug
 2026 16:26:18 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Sun, 16 Aug 2026
 16:26:18 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] boost: upgrade 1.91.0 -> 1.92.0
Date: Sun, 16 Aug 2026 18:26:11 +0200
Message-ID: <20260816162611.41933-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
References: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0222.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::29) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB2751:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c31f104-2a76-405d-7462-08defbb319f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|12006099003|3023799007|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3tF4TsmfbzbGjdBZKwY39Gzh/GB7XCmKT9xOOEurCrKC96b4SxHRER8XuinUL9pXw0M9Bi2Pxx+nmnmGbJ9hhMOsqQyKhb5am/5CtIRLofysi7Lh0tB0R3UatgS92kjKLoJl3XWC1HocKjDGdQcoBDrG6Qw4sh6va02twTteshowbxA1v0Qn1nZqlHg8yilxUXMYWjT8JJ4DLt/zisDqMVE/TMIZyn2egH2UZkfWMsYaAbSGZtPQ1i36OPs8kcXvmODI3v9bXVVnps2PgEjELUC93PvlTYo24W69DcJ7G6c9kOjqvXL7bAkGTzbbTsDYAgJsJxfjTRtFs54r77tXKV2kOuY+loj4Go/nUdybBHDlqblmnIjhYaJ91YPVCh6i5sWTECaYMG58MK2GtRXFg2vCmQbl5UQyvRcSGb4pu1wQf5tMa/WIyovGCSgGSFiDrARz+Mz+XYTV05dUanP12t5QqFZkYj0B0bM/wadKTc3o1vfZySBEqBoUdmJFkTQm5tRQTMs2mG7Yu/YrkfgZnP2NcuvV3shjajfymAMLVE0qvJb1UxKGFRmW8YWOj6ACqRBZp1LW3Z3UCrU6HfISS2AzEA4J39H4yG8WJb6r5Xs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(12006099003)(3023799007)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZHxnq6fA3Ok4NuF9VBAToBaq8uJRFKZNKurOlYCDvjAyd35p0PR8BVClCUOY?=
 =?us-ascii?Q?cglABCT06k2Tc4JilskBRmZlZiREfK4yyO1idHPwH5K+t0lbYlsklxOqcvXI?=
 =?us-ascii?Q?KUaraxGvx54skQeHbs8tHfMiGEY5MmPCkSCe4HulJx0GxKF71Na+HNq9Ktfp?=
 =?us-ascii?Q?TK35SMeVu+yQM+0GdPYtAQFaB5rU5mCEjPeXtSvCn0BSrZWb5UsgOzJWLENu?=
 =?us-ascii?Q?y7agyW/TQtKoqHwCvips4Z92W1N1PXuDtSMEhAb3YiB5TZKAcA+a2iAjy8KO?=
 =?us-ascii?Q?vWqK8TBdLTpGrhUfb7KLji48ZmXv5oNWtW82hiVKRWkyxuYbUhh/MUP/I+gK?=
 =?us-ascii?Q?GNykabbFLCkksObNGjifq67xAYe3wu8RfHc5UrNwnzmNmD4pk3GVjMnxnP2r?=
 =?us-ascii?Q?4pIDLjKJUfCJdslPFvIsdoshfh7hQKdk2p5BI0fGK+UF5Gapxm69/bEmrWub?=
 =?us-ascii?Q?bInqbeI520YwZcoH2iYT4SByN7vmlUfAkDT4hbetgMVboSiliR2sxTnhhNP+?=
 =?us-ascii?Q?Ass/g+unNL+i65H//uH49wijqFLbwE3xaKry/1ltfj3Y7gf2k/wu0JibUPgu?=
 =?us-ascii?Q?YaiPkrsHjxtyZPBlw9DpnXZynDWoverOh704gUdKlrmVfuZB5v1vWf4TmRTn?=
 =?us-ascii?Q?zFm8Rvr8v5Uf2zn9ciejUd2lBNt6JYjYqE58HzKYTgS0DBdR3vDwmnk3DhGc?=
 =?us-ascii?Q?W9V8HKu4k24hl2yp5Ocs+PDZvcD3F5b5/VC6tpeRZjkhkjjM9w2rMyDhDMXA?=
 =?us-ascii?Q?CWq2qzCICi9/XWoB8cuuHn6GI+feM4J8GkiB4yPLLQh83HZG/4vYRoCnKrM0?=
 =?us-ascii?Q?yQF+/gUZZ897W/id3bLtRMsSw/O5TYU3g42AJ3NJ96zja39iuQ4l52Mi3sF6?=
 =?us-ascii?Q?aO3B8hNtHnoJZPlaSMl03WPjbe1Aick3ablMn+bSkcTQdjEdycBXocpHkBaj?=
 =?us-ascii?Q?gXcsgxzrryHMKA8//jwxlEczwmbmU0Bqil1FE0SvvToyundy0nkRage2F87h?=
 =?us-ascii?Q?kjdk3K9NePS1ZYRfA0mM8Y9nds3Mfd77M6Y+hAPJUUi3PzLauXtHvchO2Ag3?=
 =?us-ascii?Q?IhPMYl/QwfDIawErC/nVbfBQamigAq1lTUlclhvLDk/h6aKmC8c4xDHD5ygI?=
 =?us-ascii?Q?UuZ6nHEWIxrrck1STHvC0vBqXlXBnSIwfHBFAzh0sLDn/+lg9B+UDJhOuHh3?=
 =?us-ascii?Q?3DqGt0mWr4l0x1TYDCXW2GAw6+ejUyYQyqiEuOUvz9jO+weAWDD5JBXRj/yx?=
 =?us-ascii?Q?B9LkpIi4M9fYJRRaJkKl5pc6acSN11pvc20vjJu69vhqbATCDKDwh6jyeQIk?=
 =?us-ascii?Q?OKJH3notN0+BjkbbvGd34fIru4jPZaef0L3K5zrHzGZ3x+S8f68QWJ7zms1U?=
 =?us-ascii?Q?A0M+lh1kkvI4xC2TovD1XWUyBgIlJUh2SJX+bmLKNEGK+SVvAi0hnNseWX+s?=
 =?us-ascii?Q?5YdCumt+IWIsL+pqYRSzOUV8OCFnfcPbJV9tg4A2XouJL6ety7pAYLM/99Cd?=
 =?us-ascii?Q?A2uKz2H7Z1f/ZsWK3EgGpT+yy39z/Mgc8HJFLZunRLBCbaAWyPcnIdF11W5k?=
 =?us-ascii?Q?Pe9YoOO4N/I6wNmscpuBocmyoEr0YXhn99airr9YAm2FgtMH2vKgG845AcFG?=
 =?us-ascii?Q?U6207SYSzf8qytlfOelCiqhbfFUANnXVs8KmxUduKibuCq6U/VsPUSUG7Dvx?=
 =?us-ascii?Q?b588Q2PnMD+hOh15GNISudsk3iiyvcVAMLZlxSmvpxQENDD2O0yKdisRlqRp?=
 =?us-ascii?Q?N2t/dPItQJGeJje/d9lTcRj0BYKGWJ+Vvze+so4uEh7FNQdUAH9B+siyrwzH?=
X-MS-Exchange-AntiSpam-MessageData-1: UBn3fly6fGjnAyV+ZtAKKLNoQtTn8vn6CRo=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c31f104-2a76-405d-7462-08defbb319f2
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 16:26:18.7087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nRQshPhJXWr+sP3ok7HdIr/9Cabk2twpAOO5m727OHQhE7/AylTHbmCEP1CRz5TM0lDiMLPgznaHe7yl55pOLxgdqjo+xwliOQujbsuSf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243538

ChangeLog: https://www.boost.org/users/history/version_1_92_0.html

CompareLog: https://github.com/boostorg/boost/compare/boost-1.91.0...boost-=
1.92.0

Backport fix from upstream for boost.histogram build failure caused by
<local-visibility>hidden leaking into install targets (boostorg/histogram#4=
25).

B2 1.92.0 now triggers boost.predef's install-data target during install,
which was not invoked in previous versions. Add --prefix to do_install to
prevent permission errors and remove the installed b2 check tooling as it
is not needed for runtime or cross-compilation.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{boost-1.91.0.inc =3D> boost-1.92.0.inc}    |  2 +-
 meta/recipes-support/boost/boost.inc          |  4 +
 ...h-instruction-set-flags-we-do-that-o.patch |  4 +-
 ...01-dont-setup-compiler-flags-m32-m64.patch |  4 +-
 ...b2-project-requirements-out-of-build.patch | 85 +++++++++++++++++++
 .../boost-math-disable-pch-for-gcc.patch      |  2 +-
 .../{boost_1.91.0.bb =3D> boost_1.92.0.bb}      |  1 +
 7 files changed, 96 insertions(+), 6 deletions(-)
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
index 7a343e54f6..6e9b1dc89c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -200,6 +200,7 @@ do_compile() {
 do_install() {
 	cd ${S}
 	b2 ${BJAM_OPTS} \
+		--prefix=3D${D}${prefix} \
 		--libdir=3D${D}${libdir} \
 		--includedir=3D${D}${includedir} \
 		install
@@ -217,6 +218,9 @@ do_install() {
              grep 'cmake$' | \
              xargs -n 1 sed -e 's,${D}${libdir}/cmake,${libdir}/cmake,' -i
=20
+        # Remove boost_predef b2 check tooling - not needed for runtime or
+        # cross-compilation, and was never installed in previous versions
+        rm -rf ${D}${datadir}
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
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

