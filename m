Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940BFC44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:43:51 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23135.1784641425000002276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nhhyZnLC;
 spf=pass (domain: est.tech, ip: 52.101.84.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8/9vRVfZwA1SFqtu308C0107/vpKOe/CUtTphjAYOQ+O0mu+6YVZqVGCALGMTvT/r+Qr2MKxkuAs5ZlO1xcu8koUN/wkvxsPNsW7iWGgC/oFCteftsVTvhSTa9bLgjlwsNAQdsXhEHND2ZfMr5W0CGX6Q7SMJv94/JPBeGXGKhMtAMydz53yQcNg5ML73RXFodsCci3P4UBT8V1cs43an2gYGN/Y4ehs9/1+WwS9vHrQyyKKlCPKK7dn+SWgN7k2AmlNV1zlzjsZge8QsGi7HUL8N/Gox+ephsTeZQvdvo1W+kpGk1T5TChWYgjDEkZfs/BK0WKceWfJ2B7xYTorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B6ZNdgTljp1mdJ6C/l4sYqgRXRffTvpc3pucxWsMIw=;
 b=cQMgIfxgfOLvqE2nTqjBCE8/PoxHFGQu+6ogiJTfS2aA5VBjYM4aN6iN3PXYSkwMkQmVhrM1LSqv3Dpk2lXYWP+UfJO7dafKFeg0ochaQ4V4c3R2rg/a/OnMu8Ql4cy1/7G68N+oiBfWCvp+6RJCkuP21cgVtdAo1HzAUIdmwQ1fZDlA+Uw6qtA5ygnTmW0qNfvhgPIM8AHexC+eHBKw/KC3wGYoatjsXYfgXFV4Pqz6iyF6+jpkPJAGostat7vuwyD4tzTZ2+xM920k9bDzNxGXP0BAI0hRHo9k6NXejAEcc73PptLnAoqA77EWQEQCadC8qK/tCrwSngJAznrSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B6ZNdgTljp1mdJ6C/l4sYqgRXRffTvpc3pucxWsMIw=;
 b=nhhyZnLCULvFp//W0v7lDMt55AS7TandpCiBPsqiHxWs1BcRrKQB+8+JHQSWqUxk4Yqk09FMRr4jrkDKhbUzsFnz1d4ohrzhr9/Gv2MLVlK+rNwuGQpPACTu1Ep6C6nY/5EMxEiWZ8rRFNfBKBPkha+5DoOs90jyc7H2Ror5v53SEj8hL5Uz+7h6Ze+eu8aUv/IIe6XH5h0nfE+KKf1kpKHCeNm/qvWLkmJA9GgQC8QDvOLODaKDSsHxyE2MATC1ptINS38hC2CJtQ3+GmEbILU+ZWipDQkGmtDdUaSPTqntVQMD+VXzqMtdAc/glbhhDhyW44qmG4R750uBKFKulw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:43:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:43:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: upgrade 5.42.2 -> 5.44.0
Date: Tue, 21 Jul 2026 15:43:39 +0200
Message-ID: <20260721134339.16175-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4f9154-44b9-49ba-123f-08dee72e12e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|12006099003|3023799007|13003099007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	pXFX4EPUSNLFt2hKqgPGaKGDxua7TpyxJjmk7b0LJYJtE8AnOtJAvld6NS10I1xxOXTOAGk+ORNhJpT71KjrLK3I3+dJtfTy0wf5JeoWaqDtP2qcOnfs3hfKGy8K9WtjWqqSHrSbYg6GEDwlFoZn71l2zBMY3HBA1XbeZgO/DtYyL3TiWA0kUoMLGgWvvhicDSPJS1dEBVIo1ktC0jAdS/KsfedMO9fIVv3QG9TIGQRu43Tiuo/iYA60rEx2BEleiydJcyBlo0UXgwv2VyFfWEWLJl7KMxPIxCbaWagRRTskEQh7ot2sY7JH8b6BU1sa4D8SfKYw8yxUTqsz/ifW+x8EQkp6cZSC61E8loqlnE1PrC6rHX5kdUyT1tt4uidh2YmdU469iRB4LBsBxe/x89xSvLjT4/GBLRZRsUB3bL+xnvaC9Xy/OsEv8X5UOAeffCDLgFM2DZHlEzgm4GsXmPtXiqwJzOWURsA4RE2XKDmD8qa8F/JMhol5rW6RwhvTW0AHRcshnxbdcSAZuzsO+HLAhbstCtoYTqJsdoOOMxq0M+Z1Gmw+dimtEBrgI9OLeJzyST4RSiUKn9E9hrX+iH64OiasdAjIt1YLcA3j9ZVU6a88Cn4H4roY4h+EZEVZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(12006099003)(3023799007)(13003099007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sBJPJfsVsafUP4z0+8PA1S2kRzfjp3Uf8nMEUu5XveYAfdiQDPYZKCESDTBU?=
 =?us-ascii?Q?/tVkC/WalPHwRzabTCTphBMy6eWdirAQCHsRmnUMJ9wt8sLjBiXo07jTDF/G?=
 =?us-ascii?Q?Z+BF2aGsHYgFJLH6okFOECo+GiPToTIAT30ssLfQ9oXv0qB9IObUVXDwg6Dx?=
 =?us-ascii?Q?r4U5W2AtCLEBDTfv9ub8aJqHiP0Be6gpqAFlKqO72/XHElmWQ+PFKVoAF+zW?=
 =?us-ascii?Q?X0VQX72iiPgltQAyE1pWlDarHM7sMgG39YaKe6KHOPz27VU6KRfY6sAxdN4x?=
 =?us-ascii?Q?gQLldSp6SzoTjG6+nzR/XoWgWCbhcTlgpa3pMubtA048uVJsJGLkVoOotadI?=
 =?us-ascii?Q?Bs4af+clXpQuEsaxrt8W0q1e5fnTO0pZ1kpdYCnYC9yXOvsvP5WN47ayjQh1?=
 =?us-ascii?Q?HqstHMuYc8oxETpIv2k2bhDba5BxeuMub4YOTFcOnKjKVvg2zF7BXNiUksQz?=
 =?us-ascii?Q?rOAQ3n/Ckp/I/TRwpzdFFxHCMwioAg9i88487diUBgt8WX+yNkxS/z9NRL6N?=
 =?us-ascii?Q?clpU25r3XHKMV+8pK6yaJiqUjv7QcPg3GdrqEC8wc9BQBoWwUJ+OnpkYAI0G?=
 =?us-ascii?Q?flDv6CRPprBpOQlQHWN34S+x0u47f8OE7TesRX8+YyAOu4FaVgBdq93MUyLr?=
 =?us-ascii?Q?uLJl+/3gCq9RX4yiPqrz2bo3J+AK+oPc0as/80sef+8hy0N1/9nZyCatArAB?=
 =?us-ascii?Q?gmxVHYkb6/88ErOKrJzXe+ZDO4qdzXR6Evn8LtOaDIfV/rIwl1C4TUF6twIO?=
 =?us-ascii?Q?gJ6zc3K94lk2PwLAb8m7a/Uhg3kSUp/sKbgbX+envfc+TNbR0GTI9cl5XfTu?=
 =?us-ascii?Q?aeqbrxKL3B05+XVrw6Ph6igpNRD7yU/h2fzD3DnuHhLK11M62/IhmBMYztWO?=
 =?us-ascii?Q?AS49cCtyxbm6PWoeEfylplZ0OTVvGJ/7VkA4cESw9SPJTboUZoBeArhWYyx8?=
 =?us-ascii?Q?UPQN1f4GPqT9okIQB76gzjcKHPUyv9MeXq5O7g0A17yYEereP0fa5YTCIjy2?=
 =?us-ascii?Q?Aux1g1ucxwgCmemg4VEF3X06v/LIB2UCrgxCEblWnL76srZwcMBHIUrm7RiM?=
 =?us-ascii?Q?bWBeV0znEXFWPh8NJA1r9bxmMm1VKp2Q/zlYKo2PisMT7AaFkF8zwz7hfDkQ?=
 =?us-ascii?Q?uqn/Oft6ghPqgSdGhnA9xIeCv/bX47wQZmpO/S/9U3YXlfmtn6PyTgPA3+2c?=
 =?us-ascii?Q?28UtYMuuitsUGUCOiTbuE3C7E+zcNL+QYroVt9RlZMCG0Fxw4RXjp5oJGKt7?=
 =?us-ascii?Q?E10qtw9TeZl8AhPMm3M8AmoSZFmu6tIC/Yu/zv2+1xvtW/BNzaRqmih9ArJ3?=
 =?us-ascii?Q?gihoSq6h5AswAUvvQqqbwquT3WUJ8fKQn1t3yxmApNTVf5NAN0a7b/vxDtpY?=
 =?us-ascii?Q?EYXiHLX3HTUefBr8GjAh2cT//gD3mWuajHS7aUWm7RnBsx1cd+nNbi7dAXuD?=
 =?us-ascii?Q?/Nk4XxWTF7W76w7FLzundtoJA0F01IJlCQjqBDNIoMONCzFgA4wBdxSP7ImL?=
 =?us-ascii?Q?DrRMYp2HwqVfIoIGwvVDVtAmVNDWqL6w8VL5Nw8N7mkj3/ymLaIdNaSmOvht?=
 =?us-ascii?Q?hXalOU94KKis0dbvrYjIJRUYp++ro5RwEg4N/3pgeuPAWLETVWvCAEKDrGC9?=
 =?us-ascii?Q?vEIjc2qOxA8PYjMCyRgRB4I8vT5D73po6SZbeyj3mzZ/0PM/DnQUY+zO9n0I?=
 =?us-ascii?Q?85Tm8Za0Y/Cwvh9EmM/jRmXCXSsUL+BdhPKaJBJlKSrhsjkLuUJ3T4Pk05XD?=
 =?us-ascii?Q?0Y6OZ1F3fARX1ftg2SrNdpqYeMwXpoc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4f9154-44b9-49ba-123f-08dee72e12e4
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:43:40.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFKpXdG515tWCPb4rJLmnX4GGaSsh97qT9UE9ZzbNA1CDKzrdIy9BkIU1gDVZ2d32UcM4Q2IN7Ieo1dhxePIkOo215QaTumgltf8eG17rCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241521

Drop patches already included in this release:
- CVE-2026-8376-01.patch (upstream commit e842efdafe7c)
- CVE-2026-8376-02.patch (upstream commit 5e7f119eb2bb)
- determinism.patch (Encode::Byte sort fix)

Add perlcross patches to support perl 5.44.0:
- Add patchset symlinks directory for perl5-5.44.0
- Add configure checks for d_getentropy, i_stdckdint, i_sysrandom

Changes: https://perldoc.perl.org/5.44.0/perldelta

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../files/0001-patches-for-perl-5.42.2.patch  | 110 ------------------
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 ++++++++++++++++++
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 ++++++++
 .../perl-cross/perlcross_1.6.4.bb             |   3 +-
 .../perl/files/CVE-2026-8376-01.patch         |  62 ----------
 .../perl/files/CVE-2026-8376-02.patch         |  49 --------
 .../perl/files/determinism.patch              |  51 --------
 .../perl/{perl_5.42.2.bb =3D> perl_5.44.0.bb}   |   5 +-
 8 files changed, 160 insertions(+), 277 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for=
-perl-5.42.2.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for=
-perl-5.44.0.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configu=
re-checks-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 delete mode 100644 meta/recipes-devtools/perl/files/determinism.patch
 rename meta/recipes-devtools/perl/{perl_5.42.2.bb =3D> perl_5.44.0.bb} (98=
%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5=
.42.2.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-=
5.42.2.patch
deleted file mode 100644
index 8d9aa26293..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.42.2.p=
atch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 61e182b82c13111c91ccbe9f6e94ceb4164b2aea Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Wed, 29 Apr 2026 12:43:32 +0200
-Subject: [PATCH] patches for perl-5.42.2
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/174]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- cnf/diffs/perl5-5.42.2/constant.patch       | 1 +
- cnf/diffs/perl5-5.42.2/dynaloader.patch     | 1 +
- cnf/diffs/perl5-5.42.2/findext.patch        | 1 +
- cnf/diffs/perl5-5.42.2/installscripts.patch | 1 +
- cnf/diffs/perl5-5.42.2/liblist.patch        | 1 +
- cnf/diffs/perl5-5.42.2/makemaker.patch      | 1 +
- cnf/diffs/perl5-5.42.2/posix-makefile.patch | 1 +
- cnf/diffs/perl5-5.42.2/test-checkcase.patch | 1 +
- cnf/diffs/perl5-5.42.2/test-makemaker.patch | 1 +
- cnf/diffs/perl5-5.42.2/xconfig.patch        | 1 +
- 10 files changed, 10 insertions(+)
- create mode 120000 cnf/diffs/perl5-5.42.2/constant.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/dynaloader.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/findext.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/installscripts.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/liblist.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/posix-makefile.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/test-checkcase.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/test-makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.42.2/xconfig.patch
-
-diff --git a/cnf/diffs/perl5-5.42.2/constant.patch b/cnf/diffs/perl5-5.42.=
2/constant.patch
-new file mode 120000
-index 0000000..065e198
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/constant.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/constant.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/dynaloader.patch b/cnf/diffs/perl5-5.4=
2.2/dynaloader.patch
-new file mode 120000
-index 0000000..ffb73eb
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/dynaloader.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/dynaloader.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/findext.patch b/cnf/diffs/perl5-5.42.2=
/findext.patch
-new file mode 120000
-index 0000000..9efbe5b
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/findext.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/findext.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/installscripts.patch b/cnf/diffs/perl5=
-5.42.2/installscripts.patch
-new file mode 120000
-index 0000000..1c05e0f
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/installscripts.patch
-@@ -0,0 +1 @@
-+../perl5-5.36.0/installscripts.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/liblist.patch b/cnf/diffs/perl5-5.42.2=
/liblist.patch
-new file mode 120000
-index 0000000..5037380
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/liblist.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/liblist.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/makemaker.patch b/cnf/diffs/perl5-5.42=
.2/makemaker.patch
-new file mode 120000
-index 0000000..d7bd609
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.38.0/makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/posix-makefile.patch b/cnf/diffs/perl5=
-5.42.2/posix-makefile.patch
-new file mode 120000
-index 0000000..29463b7
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/posix-makefile.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/posix-makefile.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/test-checkcase.patch b/cnf/diffs/perl5=
-5.42.2/test-checkcase.patch
-new file mode 120000
-index 0000000..36c5186
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/test-checkcase.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/test-checkcase.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/test-makemaker.patch b/cnf/diffs/perl5=
-5.42.2/test-makemaker.patch
-new file mode 120000
-index 0000000..4e970ff
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/test-makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.34.0/test-makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.42.2/xconfig.patch b/cnf/diffs/perl5-5.42.2=
/xconfig.patch
-new file mode 120000
-index 0000000..87ac501
---- /dev/null
-+++ b/cnf/diffs/perl5-5.42.2/xconfig.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/xconfig.patch
-\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5=
.44.0.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-=
5.44.0.patch
new file mode 100644
index 0000000000..36f065419f
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.p=
atch
@@ -0,0 +1,110 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 21 Jul 2026 09:10:00 +0000
+Subject: [PATCH] patches for perl-5.44.0
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/diffs/perl5-5.44.0/constant.patch       | 1 +
+ cnf/diffs/perl5-5.44.0/dynaloader.patch     | 1 +
+ cnf/diffs/perl5-5.44.0/findext.patch        | 1 +
+ cnf/diffs/perl5-5.44.0/installscripts.patch | 1 +
+ cnf/diffs/perl5-5.44.0/liblist.patch        | 1 +
+ cnf/diffs/perl5-5.44.0/makemaker.patch      | 1 +
+ cnf/diffs/perl5-5.44.0/posix-makefile.patch | 1 +
+ cnf/diffs/perl5-5.44.0/test-checkcase.patch | 1 +
+ cnf/diffs/perl5-5.44.0/test-makemaker.patch | 1 +
+ cnf/diffs/perl5-5.44.0/xconfig.patch        | 1 +
+ 10 files changed, 10 insertions(+)
+ create mode 120000 cnf/diffs/perl5-5.44.0/constant.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/dynaloader.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/findext.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/installscripts.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/liblist.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/posix-makefile.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/test-checkcase.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/test-makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/xconfig.patch
+
+diff --git a/cnf/diffs/perl5-5.44.0/constant.patch b/cnf/diffs/perl5-5.44.=
0/constant.patch
+new file mode 120000
+index 0000000..065e198
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/constant.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/constant.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/dynaloader.patch b/cnf/diffs/perl5-5.4=
4.0/dynaloader.patch
+new file mode 120000
+index 0000000..ffb73eb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/dynaloader.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/dynaloader.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/findext.patch b/cnf/diffs/perl5-5.44.0=
/findext.patch
+new file mode 120000
+index 0000000..9efbe5b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/findext.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/findext.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/installscripts.patch b/cnf/diffs/perl5=
-5.44.0/installscripts.patch
+new file mode 120000
+index 0000000..1c05e0f
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/installscripts.patch
+@@ -0,0 +1 @@
++../perl5-5.36.0/installscripts.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/liblist.patch b/cnf/diffs/perl5-5.44.0=
/liblist.patch
+new file mode 120000
+index 0000000..5037380
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/liblist.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/liblist.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/makemaker.patch b/cnf/diffs/perl5-5.44=
.0/makemaker.patch
+new file mode 120000
+index 0000000..d7bd609
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.38.0/makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/posix-makefile.patch b/cnf/diffs/perl5=
-5.44.0/posix-makefile.patch
+new file mode 120000
+index 0000000..29463b7
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/posix-makefile.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/test-checkcase.patch b/cnf/diffs/perl5=
-5.44.0/test-checkcase.patch
+new file mode 120000
+index 0000000..36c5186
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/test-checkcase.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/test-makemaker.patch b/cnf/diffs/perl5=
-5.44.0/test-makemaker.patch
+new file mode 120000
+index 0000000..4e970ff
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.34.0/test-makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/xconfig.patch b/cnf/diffs/perl5-5.44.0=
/xconfig.patch
+new file mode 120000
+index 0000000..87ac501
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/xconfig.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/xconfig.patch
+\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-chec=
ks-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0002-Add-=
configure-checks-for-perl-5.44.0.patch
new file mode 100644
index 0000000000..e7fd9df2f5
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-=
perl-5.44.0.patch
@@ -0,0 +1,47 @@
+From d6010680c68655b782c2e07bd0d38562c1ad0ccb Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 21 Jul 2026 09:28:12 +0000
+Subject: [PATCH] Add configure checks for perl 5.44.0 new symbols
+
+Add detection for d_getentropy, i_stdckdint, and i_sysrandom which
+are new config symbols required by perl 5.44.0.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/configure_func.sh | 1 +
+ cnf/configure_hdrs.sh | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/cnf/configure_func.sh b/cnf/configure_func.sh
+index 20f9cdf..4cbee2f 100644
+--- a/cnf/configure_func.sh
++++ b/cnf/configure_func.sh
+@@ -104,6 +104,7 @@ checkfunc d_getaddrinfo 'getaddrinfo' "NULL,NULL,NULL,=
NULL" 'sys/types.h sys/soc
+ checkfunc d_get_current_dir_name 'get_current_dir_name' "" 'unistd.h'
+ checkfunc d_getcwd 'getcwd' 'NULL,0' 'unistd.h'
+ checkfunc d_getespwnam 'getespwnam'
++checkfunc d_getentropy 'getentropy' 'NULL,0' 'unistd.h'
+ checkfunc d_getfsstat 'getfsstat' "NULL,0,0" 'sys/types.h sys/mount.h'
+ checkfunc d_getgrent 'getgrent' "" 'sys/types.h grp.h'
+ checkfunc d_getgrps 'getgroups' "0,NULL" 'unistd.h'
+diff --git a/cnf/configure_hdrs.sh b/cnf/configure_hdrs.sh
+index 249f5bc..b2d9d88 100644
+--- a/cnf/configure_hdrs.sh
++++ b/cnf/configure_hdrs.sh
+@@ -64,6 +64,7 @@ checkhdr i_socks 'socks.h'
+ # i_stdarg below
+ checkhdr i_stdbool 'stdbool.h'
+ checkhdr i_stddef 'stddef.h'
++checkhdr i_stdckdint 'stdckdint.h'
+ checkhdr i_stdint 'stdint.h'
+ checkhdr i_stdlib 'stdlib.h'
+ checkhdr i_string 'string.h'
+@@ -88,6 +89,7 @@ checkhdr i_syssockio 'sys/sockio.h'
+ checkhdr i_sysstat 'sys/stat.h'
+ checkhdr i_sysstatfs 'sys/statfs.h'
+ checkhdr i_sysstatvfs 'sys/statvfs.h'
++checkhdr i_sysrandom 'sys/random.h'
+ checkhdr i_systime 'sys/time.h'
+ define i_systimek 'undef' # not a plain header check
+ checkhdr i_systimes 'sys/times.h'
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.4.bb
index bc5bb4f4d7..bc8d085ef7 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -15,7 +15,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross=
-${PV}.tar.gz;name=3Dperl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
-           file://0001-patches-for-perl-5.42.2.patch \
+           file://0001-patches-for-perl-5.44.0.patch \
+           file://0002-Add-configure-checks-for-perl-5.44.0.patch \
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"
=20
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-8376-01.patch
deleted file mode 100644
index af94eec29c..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:47:31 +1000
-Subject: [PATCH 1/2] perl/perl-security#147: test cases
-
-The suggested case from the ticket and an alternative.
-
-(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe=
7c51a687a4907e4887988fe6a025ef]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- t/re/pat_psycho.t | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 336039521d..73a7992372 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -10,7 +10,7 @@
- use strict;
- use warnings;
- use 5.010;
--
-+use Config;
-=20
- sub run_tests;
-=20
-@@ -31,7 +31,7 @@ BEGIN {
-=20
- skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
-=20
--plan tests =3D> 15;  # Update this when adding/deleting tests.
-+plan tests =3D> 17;  # Update this when adding/deleting tests.
-=20
- run_tests() unless caller;
-=20
-@@ -211,6 +211,20 @@ EOF
-=20
-=20
-     }
-+
-+  SKIP:
-+    { # sec #147
-+        $Config{ptrsize} =3D=3D 4
-+          or skip "these only fail on x32 and use too much memory on x64"=
, 2;
-+        local $::TODO =3D "This crashes";
-+        # original case
-+        fresh_perl_like('/\x{10000}{1073741824}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow");
-+
-+        # synthesized but similar case
-+        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow ag=
ain");
-+    }
- } # End of sub run_tests
-=20
- 1;
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-8376-02.patch
deleted file mode 100644
index 39b3d510fe..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:51:00 +1000
-Subject: [PATCH 2/2] perl/perl-security#147: test against the actual chara=
cter
- lengths
-
-(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2=
bb1181be908701f22bf7068e722f1c]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- regcomp_study.c   | 7 +++++++
- t/re/pat_psycho.t | 1 -
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/regcomp_study.c b/regcomp_study.c
-index 9106452dd5..05f1b017b1 100644
---- a/regcomp_study.c
-+++ b/regcomp_study.c
-@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
-                                                (U8 *) SvEND(data->last_fo=
und))
-                                 - (U8*)s;
-                         l -=3D old;
-+
-+                        if (l > 0 &&
-+                            (mincount >=3D SSize_t_MAX / (SSize_t)l
-+                             || old > SSize_t_MAX - mincount * (SSize_t)l=
)) {
-+                            FAIL("Regexp out of space");
-+                        }
-+
-                         /* Get the added string: */
-                         last_str =3D newSVpvn_utf8(s  + old, l, UTF);
-                         last_chrs =3D UTF ? utf8_length((U8*)(s + old),
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 73a7992372..9fd764fd5e 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -216,7 +216,6 @@ EOF
-     { # sec #147
-         $Config{ptrsize} =3D=3D 4
-           or skip "these only fail on x32 and use too much memory on x64"=
, 2;
--        local $::TODO =3D "This crashes";
-         # original case
-         fresh_perl_like('/\x{10000}{1073741824}/',
-                         qr/Regexp out of space/, {}, "ssize_t overflow");
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/reci=
pes-devtools/perl/files/determinism.patch
deleted file mode 100644
index 61ba1a5791..0000000000
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 012e670f8fb6d4c6c196c91909c95358ca9f6289 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 5 Feb 2020 23:54:02 +0000
-Subject: [PATCH] Fixes to make the perl build reproducible:
-
-a) Remove the \n from configure_attr.sh since it gets quoted differently d=
epending on
-   whether the shell is bash or dash which can cause the test result to be=
 incorrect.
-   Reported upstream: https://github.com/arsv/perl-cross/issues/87
-
-b) Sort the order of the module lists from configure_mods.sh since otherwi=
se
-   the result isn't the same leading to makefile differences.
-   Reported upstream: https://github.com/arsv/perl-cross/issues/88
-
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends =
whilst
-   there for good measure)
-   Submitted to upstream perl: https://github.com/dankogai/p5-encode/pull/=
179
-
-d) Use bash for perl-cross configure since otherwise trnl gets set to "\n"=
 with bash
-   and "" with dash
-   Reported upstream: https://github.com/arsv/perl-cross/issues/87
-
-RP 2020/2/7
-
-Upstream-Status: Submitted [see links above]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
----
- cpan/Encode/Byte/Makefile.PL | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cpan/Encode/Byte/Makefile.PL b/cpan/Encode/Byte/Makefile.PL
-index 6824bbb..4af4a50 100644
---- a/cpan/Encode/Byte/Makefile.PL
-+++ b/cpan/Encode/Byte/Makefile.PL
-@@ -171,7 +171,7 @@ sub postamble
-     my $lengthsofar =3D length($str);
-     my $continuator =3D '';
-     $str .=3D "$table.c : $enc2xs Makefile.PL";
--    foreach my $file (@{$tables{$table}})
-+    foreach my $file (sort (@{$tables{$table}}))
-     {
-         $str .=3D $continuator.' '.$self->catfile($dir,$file);
-         if ( length($str)-$lengthsofar > 128*$numlines )
-@@ -189,7 +189,7 @@ sub postamble
-         qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
-     open (FILELIST, ">$table.fnm")
-         || die "Could not open $table.fnm: $!";
--    foreach my $file (@{$tables{$table}})
-+    foreach my $file (sort (@{$tables{$table}}))
-     {
-         print FILELIST $self->catfile($dir,$file) . "\n";
-     }
diff --git a/meta/recipes-devtools/perl/perl_5.42.2.bb b/meta/recipes-devto=
ols/perl/perl_5.44.0.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.42.2.bb
rename to meta/recipes-devtools/perl/perl_5.44.0.bb
index 30e707df0a..a449b904fa 100644
--- a/meta/recipes-devtools/perl/perl_5.42.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -14,10 +14,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz;name=3Dperl \
            file://native-perlinc.patch \
            file://perl-dynloader.patch \
            file://0002-Constant-Fix-up-shebang.patch \
-           file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-deter=
m.patch \
-           file://CVE-2026-8376-01.patch \
-           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \
@@ -26,7 +23,7 @@ SRC_URI:append:class-target =3D " \
            file://encodefix.patch \
 "
=20
-SRC_URI[perl.sha256sum] =3D "9384e8deb75b7b1695e5637971b752281aaecd025a3d5=
d4734d33c1d0adfee47"
+SRC_URI[perl.sha256sum] =3D "3b855066b92491cb40e86affb1ca57d1a388aa43e51b9=
1c7806a32c2f65f96c3"
=20
 B =3D "${WORKDIR}/perl-${PV}-build"
=20

