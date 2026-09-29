Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C48C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:26:13 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1921.1790663169963565784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pPOFX1ND;
 spf=pass (domain: est.tech, ip: 40.107.159.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOZBsdBB8+9UO2HlB8GSjXgCRdiFPXI/tjYpYXVol5CslNo502gZ8ytNfjrV/Pr+wQ5qbg+IECi+5r9OHlPNmBB5UNwJh4mDmvCM0SkcoceSjfFvlZjFTrBdDl2smW1eaFcO/5iJyjRQGE6HCIEKXIRkfC8XRjBw5YZJwXNalb6X/KmIyAw/3B+6g85TZ3QJ4Xz2Yaihl2u8P4n94csCEtKtoLWR30Ty9/wGM97PFlGYtSTuhzIQZUwYitbOlZk/AsRPMNzMmBCWvfJtLF7L2QiEOhuECHbObEze/7sua6m6eUnqzt14TZVgyWKVkvdZEkWlLVLAkgNyJSkuFkBbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRkmaZRT4s5/C0jBpFShZL6mOnmqzCRwHzkfyfeHyLw=;
 b=LTIRkqlhRMQ/BTsm/JERT5rzr0OUcXiwm5ezvFspgNSMgyoe4j3WFHR5dHltyI5yYz9AvEdIlrxNuKTLiZq4Lb4PphBa6eZj1Vlv80Lf12YNykIRc8cnYrBVgQXR8Iug0KrITimlRIPywMuvY95/f1gpAnZJ5yh7TPIg2apK+PN/xD6ga9NXG3FpPrk28b5jlKOMqt2Z0BzYiI5HhShk4BwFKGzWBsLjB9g40/lXhk30VeDaYqqEO/4Hcbk8x6nMWZNV8iUaSg4JfGpZYXhDOmtexw3DitwjTNnXE9iF+pFC6fxdlbv4rrvEw1Bs/Ukqso1HmqaYnsPz4DtlwkSMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRkmaZRT4s5/C0jBpFShZL6mOnmqzCRwHzkfyfeHyLw=;
 b=pPOFX1NDYwUH1J4+4WdTm0LJSH6O3ivdeVQWcmfskhm6bt1evTn6FqMzcTLBNuEB2nYruJ7T39oYcNBuAr6oDANaoYoV5OhGkPYCsBGdqW95ioLR5lLsmantWAFMjFxmGRgU5r7+0EEI8WKNr3NR82w06cYkCBx1VYMd4098T2vaoYu1sLSWNIpFpi2D1AiAQQrkd3K3nG6I4ldcH7z2PQRzADbNizcyUKViZmbquQ3XbceTNDWzsjynlYZLMnkPTgM2fN4e7BYVbfMa3DTn8vEUye4mEXsBC3a/6uiDKdpqM4o3cXPS82Kaw2OvCefHCaKik1NTdprWDX1YXOf2ZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 06:26:06 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:26:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] perlcross: Upgrade 1.6.4 -> 1.6.5
Date: Tue, 29 Sep 2026 08:26:02 +0200
Message-ID: <20260929062603.67218-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
References: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1033:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b931465-90c8-4662-2030-08df1df28b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|260925021311599003|260925021911599003|10067099003|3023799007|260925022911599003|11063799006|56012099006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	OOmn6+G9XnSH+JZFVIv72yhFuPmklDEm4IRsoDLiR3AcnggAGCdOsLcUguzlIeJ43QtoHvBJJS1hLU1PNrrSta68k4uO4JSGqajjTRPQLXHIMii0dKr2QcUuHSf/+YEcp36ukMH9zHmhimunL8p9BFMsHvIn+H7tYAFhNgRMQmEwD8SCnj0vnpL23urCE061qNEoL6I9j4FI12VmR/ifPlqmr4ZHiYL+dVVrMyc/IxuFpVstSioK5IuFo4Y8LVN2sPo2kj03o2D52kDBtIZiUXrkXRWK9TWbCrWySMVu089m+xXgf+N13QzG4v+Hkhc48Xr2gc79y2tl+Oic87bdBcIi/ywFNqJE3jf3pfTxpb9Sdu7u8Ny9nIkalI0cFk9XbEKdcly2j69Y+TarrOXyjiMoRqKudiNuXCSu//Ohzic8TUhwxx3aOQicL8Lyvfv6IjClPmThIraLDPher3o+TAd2/PHHvFjSGvTUXavSLNlwArWlBW+F0pZD0aIHCwSBR07jun2aqXITlQornVGgLNSNdDawHNxPaczTb/b7/cvTsI6ZUlTfLrhGX+2b5c8kcrTD7SAyLrWUy4mhvN7RndJtQXuu7NnSyqBl+P+xkpdhweMCS0sSWRBGxmyqvpYnpZ1GWeCOPpLpeyFd4NnpncVi07Y1jEHqkeuPZAob980=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(260925021311599003)(260925021911599003)(10067099003)(3023799007)(260925022911599003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SOFwpU5W7VLtlaV+HxsbG5rUA3DRkuJTUCTqT/6eeNgIdTLv2WPHEEthCPPu?=
 =?us-ascii?Q?CKOoq/geMMGDruDj4WSW/tTon1ID0Gqnxuw+I3IBMTbLsyoyWPaBbhuA9ydm?=
 =?us-ascii?Q?y7e8kms9P/jGBbIzYVXyX1DXTjokwtcZSSoVZtebqB4o8+MjYgFO12cNaRjV?=
 =?us-ascii?Q?zdDtF4jzuLUrNjj1DhkwmNntjrfI2O9TmFVG2YPtSSZnYT+nLlV6fpJ4SjKb?=
 =?us-ascii?Q?4U9klrTmKFkazMY/hZvuM/HfVAENG9rKzRaFWWQ135gMM47NqC3fZ2AE1eMd?=
 =?us-ascii?Q?y7hkjUOQNTX0fGMG8xTogOR5YRGD90+UmSw0N4ixN640D10p6WLohGkOVFem?=
 =?us-ascii?Q?eKGAj5OHqfVsawcCNEF8gCQUKIRq+7HZQE5igJKJ7k0jsQmGfwmLhZgAYoXk?=
 =?us-ascii?Q?1QNjlg0FfvRxlYWiqZ5LRSIEKq4FEH4l7UejMwg7GH3fkXPId2hjMueSBwSC?=
 =?us-ascii?Q?Fjo2DDhFRBEJqn5oAAMj7rQ2u4rpHLS/izU1HRY7foczWv4qcyw94I8f4Q7+?=
 =?us-ascii?Q?GkyxAIr0XUE5811UXstxJd5Oct+xGfUpRgl8X9AWDzXDtkyBGa6qgtWzEyti?=
 =?us-ascii?Q?/2I9h0iPtYuf6TdyLm0yFczPLLSxx1dQ81j3kt9Ovi9ckNo4IxSX1Bq1z/zO?=
 =?us-ascii?Q?lJqWMmxEz5l24vWFrr2FdEH+IBgo2nHXRIV7ONuhuwdd1AvhgY0i51cMpjBv?=
 =?us-ascii?Q?Y47Oc1CSsn3oTVwXM7ass00hXLjLV9P6E/Va6Hos09lFiSnEqe4qqfUUOth1?=
 =?us-ascii?Q?YXX/jZGoDvhL+GoeA+LEE9kIpxms2Qlds2ZET08dBZIpVXFjQ/GkrbxoLM/8?=
 =?us-ascii?Q?xxt6Xo39lQOChV3t9cHz6QqtPcNO+j6d1LGXSmzIsNDPvoTTbcFaafQYkf1E?=
 =?us-ascii?Q?xH7Zq5Ogy4ZiokmVOLnIzjJxeUsxVeaeY0ym881M/4xoYb/zBJX6EyhAqTZx?=
 =?us-ascii?Q?6Pvd9VCyrU+cpC1YQeq7bWto8CttypnpdMjq6868cjyu8auQnQdua/f/tMuR?=
 =?us-ascii?Q?ZyxuXfmTMlkc/QcfCNpGa7NGF5DHLn+EdJbPeZQRLSwrFBUJd34rghkRqbov?=
 =?us-ascii?Q?KtjdzOkVU914PyAzy/J86lm752YCF/v/aUVDAjz0mYINosza2eurh3DYo60O?=
 =?us-ascii?Q?bFP5aHJ67CSIHMIElVo05mb3e7/B1LqTaX943LhiXlLOQN7E1p7S9DRvQLgU?=
 =?us-ascii?Q?JQu/qAL6eX9Zbt8FKeqpZnABdz3WUKX0J82Wco37SlwSHEqGjKovlf8j2Jak?=
 =?us-ascii?Q?CYgKYPCo/XizNo9+WohDr8eD1NdCeS5UWmNGgFCja/XVT9BzBiahouFGT3o3?=
 =?us-ascii?Q?zDu3ng+ZJNjWvi+GcECOuhVXqO7TWAR8CUomps8/UpmXuH0MsEJQl+9uQcHQ?=
 =?us-ascii?Q?oE7R0dIlwbNNCr4N8CxygaOUOd9ZDGJubq9yrt6MNZIDXI2PsOKfW0Cb+FLK?=
 =?us-ascii?Q?HkZj8NrccLFd7NlkQl5FST+dh/VRvhOYkd59WW6H9CGP7ERQtC3Ht9l6h/CB?=
 =?us-ascii?Q?G0l78OUMJ4LUwev3gAYSfOl/7MHXpS8bpQOW1rBzWbWdLuBu4Z50XHhlN2ig?=
 =?us-ascii?Q?7FT3ylAsRpT49vVZPoq8oOhePI19w8SGtmkS/h/odc/XK2GSvZwMwrmVrjx6?=
 =?us-ascii?Q?2rFSCMry+fPg4iaRHxCdbyPQHhjA6EGM+IcfVGOzLBEz7M7Tm3JQs0I5odFI?=
 =?us-ascii?Q?eBGQqmOjxWqhpuVOfsENBFF1hVjxO5FQoUEz6I4sUFsOjzaFVJIctSIqhCFA?=
 =?us-ascii?Q?F3RDd0PpCQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b931465-90c8-4662-2030-08df1df28b33
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:26:06.5713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3CIDHUrXlp+HLlEq9a8cTb3/lvQ8W3IOuBOsAOYaxub3lykANghbkswuQisWQ8FxUcJ+YCakTEVGFIH55LgDLmUlQ8qfGf2+B/YT+/pZEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246840

CompareLog: https://github.com/arsv/perl-cross/compare/1.6.4...1.6.5

- Drop below patches which are part of release now (more details in compare=
Log)
  0001-patches-for-perl-5.44.0.patch
  0002-Add-configure-checks-for-perl-5.44.0.patch
  0003-Fix-checkfield-for-C23-compatibility.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ile-check-the-file-if-patched-or-not.patch |   2 +-
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 ------------------
 ...oss-add-LDFLAGS-when-linking-libperl.patch |   2 +-
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 --------
 ...Fix-checkfield-for-C23-compatibility.patch |  35 ------
 .../perl-cross/files/determinism.patch        |   4 +-
 ...{perlcross_1.6.4.bb =3D> perlcross_1.6.5.bb} |   5 +-
 7 files changed, 5 insertions(+), 200 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for=
-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configu=
re-checks-for-perl-5.44.0.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfi=
eld-for-C23-compatibility.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.4.bb =3D> perlcross=
_1.6.5.bb} (80%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the=
-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001=
-Makefile-check-the-file-if-patched-or-not.patch
index 7efee733c67..aebd1691265 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-i=
f-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-i=
f-patched-or-not.patch
@@ -1,4 +1,4 @@
-From d0292a4f91ca22f8919a0f13d8961f98743bdbf1 Mon Sep 17 00:00:00 2001
+From 685f925eafa58630b1539eb97386653eadb95f23 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 2 Jul 2021 09:08:21 +0000
 Subject: [PATCH] Makefile: check the file if patched or not
diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5=
.44.0.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-=
5.44.0.patch
deleted file mode 100644
index 36f065419f6..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.p=
atch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Tue, 21 Jul 2026 09:10:00 +0000
-Subject: [PATCH] patches for perl-5.44.0
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- cnf/diffs/perl5-5.44.0/constant.patch       | 1 +
- cnf/diffs/perl5-5.44.0/dynaloader.patch     | 1 +
- cnf/diffs/perl5-5.44.0/findext.patch        | 1 +
- cnf/diffs/perl5-5.44.0/installscripts.patch | 1 +
- cnf/diffs/perl5-5.44.0/liblist.patch        | 1 +
- cnf/diffs/perl5-5.44.0/makemaker.patch      | 1 +
- cnf/diffs/perl5-5.44.0/posix-makefile.patch | 1 +
- cnf/diffs/perl5-5.44.0/test-checkcase.patch | 1 +
- cnf/diffs/perl5-5.44.0/test-makemaker.patch | 1 +
- cnf/diffs/perl5-5.44.0/xconfig.patch        | 1 +
- 10 files changed, 10 insertions(+)
- create mode 120000 cnf/diffs/perl5-5.44.0/constant.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/dynaloader.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/findext.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/installscripts.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/liblist.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/posix-makefile.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/test-checkcase.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/test-makemaker.patch
- create mode 120000 cnf/diffs/perl5-5.44.0/xconfig.patch
-
-diff --git a/cnf/diffs/perl5-5.44.0/constant.patch b/cnf/diffs/perl5-5.44.=
0/constant.patch
-new file mode 120000
-index 0000000..065e198
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/constant.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/constant.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/dynaloader.patch b/cnf/diffs/perl5-5.4=
4.0/dynaloader.patch
-new file mode 120000
-index 0000000..ffb73eb
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/dynaloader.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/dynaloader.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/findext.patch b/cnf/diffs/perl5-5.44.0=
/findext.patch
-new file mode 120000
-index 0000000..9efbe5b
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/findext.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/findext.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/installscripts.patch b/cnf/diffs/perl5=
-5.44.0/installscripts.patch
-new file mode 120000
-index 0000000..1c05e0f
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/installscripts.patch
-@@ -0,0 +1 @@
-+../perl5-5.36.0/installscripts.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/liblist.patch b/cnf/diffs/perl5-5.44.0=
/liblist.patch
-new file mode 120000
-index 0000000..5037380
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/liblist.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/liblist.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/makemaker.patch b/cnf/diffs/perl5-5.44=
.0/makemaker.patch
-new file mode 120000
-index 0000000..d7bd609
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.38.0/makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/posix-makefile.patch b/cnf/diffs/perl5=
-5.44.0/posix-makefile.patch
-new file mode 120000
-index 0000000..29463b7
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/posix-makefile.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/test-checkcase.patch b/cnf/diffs/perl5=
-5.44.0/test-checkcase.patch
-new file mode 120000
-index 0000000..36c5186
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
-@@ -0,0 +1 @@
-+../perl5-5.22.3/test-checkcase.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/test-makemaker.patch b/cnf/diffs/perl5=
-5.44.0/test-makemaker.patch
-new file mode 120000
-index 0000000..4e970ff
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
-@@ -0,0 +1 @@
-+../perl5-5.34.0/test-makemaker.patch
-\ No newline at end of file
-diff --git a/cnf/diffs/perl5-5.44.0/xconfig.patch b/cnf/diffs/perl5-5.44.0=
/xconfig.patch
-new file mode 120000
-index 0000000..87ac501
---- /dev/null
-+++ b/cnf/diffs/perl5-5.44.0/xconfig.patch
-@@ -0,0 +1 @@
-+../perl5-5.42.0/xconfig.patch
-\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDF=
LAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/00=
01-perl-cross-add-LDFLAGS-when-linking-libperl.patch
index 6d387fe66a0..dbddd9bc616 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-wh=
en-linking-libperl.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-wh=
en-linking-libperl.patch
@@ -1,4 +1,4 @@
-From c4ebb6d11d690185f66a3f0a591f193fd6611122 Mon Sep 17 00:00:00 2001
+From 10140792a3d9100ca38ddda5f47c0faeb26af1d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Nov 2018 15:37:40 +0100
 Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
diff --git a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-chec=
ks-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0002-Add-=
configure-checks-for-perl-5.44.0.patch
deleted file mode 100644
index e7fd9df2f50..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-=
perl-5.44.0.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d6010680c68655b782c2e07bd0d38562c1ad0ccb Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Tue, 21 Jul 2026 09:28:12 +0000
-Subject: [PATCH] Add configure checks for perl 5.44.0 new symbols
-
-Add detection for d_getentropy, i_stdckdint, and i_sysrandom which
-are new config symbols required by perl 5.44.0.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- cnf/configure_func.sh | 1 +
- cnf/configure_hdrs.sh | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/cnf/configure_func.sh b/cnf/configure_func.sh
-index 20f9cdf..4cbee2f 100644
---- a/cnf/configure_func.sh
-+++ b/cnf/configure_func.sh
-@@ -104,6 +104,7 @@ checkfunc d_getaddrinfo 'getaddrinfo' "NULL,NULL,NULL,=
NULL" 'sys/types.h sys/soc
- checkfunc d_get_current_dir_name 'get_current_dir_name' "" 'unistd.h'
- checkfunc d_getcwd 'getcwd' 'NULL,0' 'unistd.h'
- checkfunc d_getespwnam 'getespwnam'
-+checkfunc d_getentropy 'getentropy' 'NULL,0' 'unistd.h'
- checkfunc d_getfsstat 'getfsstat' "NULL,0,0" 'sys/types.h sys/mount.h'
- checkfunc d_getgrent 'getgrent' "" 'sys/types.h grp.h'
- checkfunc d_getgrps 'getgroups' "0,NULL" 'unistd.h'
-diff --git a/cnf/configure_hdrs.sh b/cnf/configure_hdrs.sh
-index 249f5bc..b2d9d88 100644
---- a/cnf/configure_hdrs.sh
-+++ b/cnf/configure_hdrs.sh
-@@ -64,6 +64,7 @@ checkhdr i_socks 'socks.h'
- # i_stdarg below
- checkhdr i_stdbool 'stdbool.h'
- checkhdr i_stddef 'stddef.h'
-+checkhdr i_stdckdint 'stdckdint.h'
- checkhdr i_stdint 'stdint.h'
- checkhdr i_stdlib 'stdlib.h'
- checkhdr i_string 'string.h'
-@@ -88,6 +89,7 @@ checkhdr i_syssockio 'sys/sockio.h'
- checkhdr i_sysstat 'sys/stat.h'
- checkhdr i_sysstatfs 'sys/statfs.h'
- checkhdr i_sysstatvfs 'sys/statvfs.h'
-+checkhdr i_sysrandom 'sys/random.h'
- checkhdr i_systime 'sys/time.h'
- define i_systimek 'undef' # not a plain header check
- checkhdr i_systimes 'sys/times.h'
diff --git a/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for=
-C23-compatibility.patch b/meta/recipes-devtools/perl-cross/files/0003-Fix-=
checkfield-for-C23-compatibility.patch
deleted file mode 100644
index b92995b131d..00000000000
--- a/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-co=
mpatibility.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7faa8a36afb579f07101a48065e4a19729034807 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 22 Jul 2026 09:21:26 +0000
-Subject: [PATCH] configure_type_ext: Fix checkfield for C23/GCC 16
-
-In C23, 'void foo()' means no parameters, so calling foo(value.field)
-fails with GCC 16 when -Werror is used. This breaks detection of
-struct fields like tm_gmtoff and tm_zone.
-
-Use (void)value.field instead, which works for any field type.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- cnf/configure_type_ext.sh | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/cnf/configure_type_ext.sh b/cnf/configure_type_ext.sh
-index 0136c90..9ecd3fb 100644
---- a/cnf/configure_type_ext.sh
-+++ b/cnf/configure_type_ext.sh
-@@ -7,11 +7,9 @@ checkfield() {
- =09
- 	try_start
- 	try_includes $4
--	try_add 'void foo();'
--	try_add 'void bar()'
--        try_add "{"
-+	try_add 'void bar(void) {'
- 	try_add "	$2 value;"
--	try_add "	foo(value.$3);"
-+	try_add "	(void)value.$3;"
- 	try_add "}"
- 	try_compile
-=20
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/met=
a/recipes-devtools/perl-cross/files/determinism.patch
index 71a405ab6b5..cb4c642d8af 100644
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -1,4 +1,4 @@
-From 8fd84d6d760b21bad2c499b572951cc3f2235953 Mon Sep 17 00:00:00 2001
+From 454646b5ecd14e7bc1b54521f78b1af69549c108 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
@@ -39,7 +39,7 @@ index 2f451c6..86bc865 100755
  base=3D${0%/*}; test -z "$base" && base=3D.
 =20
 diff --git a/cnf/configure_mods.sh b/cnf/configure_mods.sh
-index d4ef5a7..8e88b48 100644
+index da463d2..4299c1b 100644
 --- a/cnf/configure_mods.sh
 +++ b/cnf/configure_mods.sh
 @@ -108,7 +108,7 @@ extonlyif() {
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.5.bb
similarity index 80%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
index 1aeee7a2c9a..77ca5b0e302 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.5.bb
@@ -15,13 +15,10 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cro=
ss-${PV}.tar.gz;name=3Dperl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
-           file://0001-patches-for-perl-5.44.0.patch \
-           file://0002-Add-configure-checks-for-perl-5.44.0.patch \
-           file://0003-Fix-checkfield-for-C23-compatibility.patch \
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"
=20
-SRC_URI[perl-cross.sha256sum] =3D "b6202173b0a8a43fb312867d85a8cd33527f3f2=
34b1b6e591cdaa9895c9920c7"
+SRC_URI[perl-cross.sha256sum] =3D "81130cd4b8c6d9eb2a1959f37d44391a46ad6a6=
794fc41fed5441f74e85e3dd0"
=20
 S =3D "${UNPACKDIR}/perl-cross-${PV}"
=20

