Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC55C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 11:29:49 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29057.1785151749555936180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 04:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qAKozwJt;
 spf=pass (domain: est.tech, ip: 52.101.72.22, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkFHqmTAouUruLThnRgmm7pLCGyR3agy6pXWR+4Ai/kSswP4LjTVO/ERYNgTXpHvVPtbmRZHVhhAfUJ+/aQaODY5FG/fuzcQOPkTgnn37MV9OZTFtCTpC6p3rrBBQjX3OuE9MQPOv/WjhY6YqCaJeS4ZP4vZZkdyg7cgYaAnCemfUN+Gl6L/pRzCNWIaWC+IjCPYV/Df/pInK1ff9l5TeY2DNdJUAG12WvzUk4y58xm78RrmERhHHO3mlWd9rghEDL943p60Ue9zayTMsxPtr92KfdcMpwMs4FHJ5WvHlz5MIoDrQ19Pl/vwcBdGhH1rcd7NAPFMAWXLJij8a1clCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSCeaqnq+JdCbmZgBaEWae0a+LCxv0Z7V23zvybdJ4g=;
 b=ZXS/mlq29OPItXr3997Lnr8MAcun3s2AfzwL8in+WalmYjKfPcj+X9wmyvIJK9MG8LXRDA+ZIMmMnboahvAtrrZ3WS6O+YJOJB47xBqXHWlE3IbWofNOtw0KW8Fa/2I7NgFy3Mh70bPhOVmwvAmaDb6/NEUBufpvrz8l3zFFkns4CTDfdwGLpqd1G+TVRgCpbmgMDwKMcZDclWKoO/3x3kEbiEeH3TmAHmiDuvdEt+CKM+LqcSMrFbLLrNvuC+UP3DmF0gyooc19KJDKQwqRi7spxernoMOUx/6dCzqcRz/tr6FG6s64bers10wo8CoXM4MpzRlzufEKZHrqZIVo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSCeaqnq+JdCbmZgBaEWae0a+LCxv0Z7V23zvybdJ4g=;
 b=qAKozwJthFTcUIvhYvdtsCQ2R3nwR8Q0ZtZtwDY6KIY6XNbyKbm5w9n734N6Ln/hHFd8cajfyzQaSClbwgIb9Govp6SiW2l5MhHcur55jWZxd9br2Zjqbp367TruyGcGBNECr9gqYQ5RC+RWvIhUUhC9cZgmAtuvXH6oeetcZ5sohPokKv95IlmPUsYxEWF1ChYNl/Q6Rvwknd9E6fJtsjbhxPZ0L0STAAWNxpqN9rG3akdDO7M+14uPV7Nf8c/hpO7KMiEPUK+79ELcx4dZ5YL1vMn07vXdaruzvezrURZwKdvgCQhzKBUTVHui8WuQfvfOmSo1M563GR/ZYd4m5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS1P189MB1814.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:48c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Mon, 27 Jul
 2026 11:29:05 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 11:29:05 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glibc: stable 2.43 branch updates
Date: Mon, 27 Jul 2026 13:29:02 +0200
Message-ID: <20260727112902.1653529-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0600.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::20) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS1P189MB1814:EE_
X-MS-Office365-Filtering-Correlation-Id: 379f832d-e1e2-439d-c52c-08deebd243f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aKGa2TzTvTAJFFpQrrKEtxet1pLx01PEryFgMTkogM6uN5XeFPm5b+7h5vPSPcFDksQPbjZmRMzBiiDmQl+zFB2RIQ6X4Sf6MIqr9VAK7fDFMD7ejNWVndks/vBCsj2ZAiNd9GlWcDoTRK+IqCOzedvWPfOtg2rm1RpJmS9BskDM1Q9Buo9vGmxZI/RAbDGerM6uMFRDvyh7iRjwm509orlxMvGgz1XAcL2m7cVnqUGCFThmy9JTKaYvGuNv4T5OJGCwdgn3rviiQKasZ6hUpHnVYIt8D7/Hshxh2OaH90VVoJDsU2ChOTW+IcQdRr1Ht5G736FIIYj61uXxFdSTmiAr4uSY8+99ZHEFRTl/zkFcqIZipAe8cSMY6FOxoqzsyPmR+zK6QZiiQ/wy6Nr22FYCf6SLf1I5gPl9rF7wy0kWPw6ScVVYGV2YMRbwqmecc0XJ+8R60GfEMl/1wiIecAxrw0k1A0wesXNxuUWEkYtPoIWvRAiuvrDN5E4Zo2QRp9k9+MRqKBr6OQfmlSQVMlLApVmrIphjJdh4VkCzKKfst/hYUO0TZMBFzgINxeun9A9woItOqa4mojtfEzp4Zg/RaTGtmeSaiOO2nimOeRi9RopoLr5kkQgRyRyoE8sW9Efh8eA/4sV4EWgOVy8oAi2RXdta3m/AysD56dXifM0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l29twXx0ZQjMbNDGYg7shX8XFYMLjDPhVZ2uqh3eKCOnkjyWzh4xcrJvD0nU?=
 =?us-ascii?Q?mDgKUBkukoQYxJUWCxphLiy+Qntsv1+9KT9t0+fv2cHrphiBaFXEAJliBfQM?=
 =?us-ascii?Q?fmZZDB1AAZYOGCuOJfihVWryBM5J11XfL79D1aRFzSyQQw791fMCMBg65Y3Z?=
 =?us-ascii?Q?y0IV20Z68RvNDb+as/FKgQr7rjTvHgFRFQM/P+TCB/rWp4VWkGwdzxJVWBbi?=
 =?us-ascii?Q?H39osnlLh8s9iZvcAyjKeMbV5jkwAhC3n/MGqP98xjUwmidHdOatX8N62FRP?=
 =?us-ascii?Q?tlfF4TLi00xHUv67aBKJVoumDr/7MNkALStfbzLbIGk9/ubOepiVmLFDF4Oe?=
 =?us-ascii?Q?UI13JPgjptcXXHIRIgR47V2xgyET7C2E7YR26t1uB9jCYu8h/PsT997714pA?=
 =?us-ascii?Q?j48cj2q0MJeyP1aGkcv745Cn2O+JEy5hz9P5pPJ4UpKqVj6bFTcbJMO8fFkI?=
 =?us-ascii?Q?jAJ0oLj+TjcpZsi+ACGAmkMpja8sqLGcMBAz6eEUGhj2cKk/GePHD2U1a1H5?=
 =?us-ascii?Q?ZVNvaseKq6pwSjchUXayyc1JMqof5ZgKkqIeDttgaWzE2N9BrOtJNdO0B39Z?=
 =?us-ascii?Q?jYzf0p0/BwZbgwar7RMnfMwysAxQaMh1WOXNefOllEs2hmmZlh3EEtVGigr+?=
 =?us-ascii?Q?qX5PkRN1MxSVYBe+C0YoYpd4AgYhtkpZ0/J3uOTMYRgXpl92uSLKMNH+7YGS?=
 =?us-ascii?Q?Ci2N3vP9W69/H8KIu+0q+ByQ+sG+MG/OVSN13P9jbtI68rKN6B3EfXoyOh0X?=
 =?us-ascii?Q?1w7W856AMmQRMJiSin0cX5Ipx99p99xYvAL+mu4fR635Z9Oil8lUfyeTOcw8?=
 =?us-ascii?Q?N6xcY7kHuF1V4NCXzYTbm1+yXwoL0j/AKd6hQz1HlJr8D0CUsJQtRlwc3nul?=
 =?us-ascii?Q?mniExwzh2Q2aKFohCm9n57r2mX7ijn7x6kmRB2GJRdGczoOf6N5qGG7guccx?=
 =?us-ascii?Q?U+CaZjekT7sQc2y/e+k05ZvGsM28tVOhxqOe6pBNGBuhUiAJAOPkzMsF1goC?=
 =?us-ascii?Q?wgkKebdhVvP3C9WHLkrxffLW68MoLq6TGb5NLE779Beo3m35GPmisrcl0mgN?=
 =?us-ascii?Q?XZyCzA9djDKivGFIO4+1Ao/F1uQ0rTv7wB1aps23sfQp0X4i+8Rj6gC/f+tG?=
 =?us-ascii?Q?y56xekLh1aeajAcJoQ3kv0viw19vsdf/6DzFsjvyxMWixNevnAaeCuB1/aRy?=
 =?us-ascii?Q?iBcc14EFqezdl3QQiuzeD9tmwKSXHVsjiL7sq056cqMGnSdZsjbObJh+q8cv?=
 =?us-ascii?Q?OCIQxtV4Zwofr5T3Bi29dDBZ/BwXZpI9p6tKrJH4e4/hIo+xWBk2jxf7gGLS?=
 =?us-ascii?Q?oRVElY+DgSNAjp76sliPl7rSNlKvFLTJ40vpKdrswjRVwU5O5wlyUyBgi9Mj?=
 =?us-ascii?Q?kHnUxrJxWBJzt7iYaHoJFCIzMHoxyQCrYTOKzPLM9kLI1v2l0CF7i8uat9rt?=
 =?us-ascii?Q?FnHPajNDBGO5oTiTmeeSs5ltAw+hSVm1jgZQWigZ0nosWLi6saTimLriwVs5?=
 =?us-ascii?Q?9mdZrS0AB63CtR9VIO1u3SQS53CID5sYHUwdQNo4jMQKtBuG9KhrV5oqjfle?=
 =?us-ascii?Q?/klR2EfgST5h+/8DMbd9MWtvGEPVr6i/dPjghHHD+Up+pZyDUFM/D+9Nwixy?=
 =?us-ascii?Q?MR0eh/kT80rwFqfThu1+7GgnYHe51t27err2vte+oyF3e3Vd8ZkxQYXmSVk7?=
 =?us-ascii?Q?rNse04MoYjpLwV8QwHrwlUqrGIJcWeYYlLXuF3SBaSEX6J4hJ61Vbttl8Ul3?=
 =?us-ascii?Q?lMoaT+zJus9JFPDANpILV0xC5EtzE6M=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 379f832d-e1e2-439d-c52c-08deebd243f8
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 11:29:05.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKVlBrZrEq7Jfjsg39KzeiPuHnnZ2fOoq9Lj//pSLNKVXUOF/kRit6Sak6nQ0swdFhrh/yvoYOs1e+H1XPvUp6tcnJmhvcNUEgWnM65bDuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1814
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 11:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242088

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

  CVE-2026-5435  resolv: More types as unknown in ns_sprintrrf
  CVE-2026-5450  stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
  CVE-2026-5928  libio: Fix ungetwc operating on byte stream [BZ #33998]
  CVE-2026-6238  resolv: Fix buffer overreads in ns_sprintrrf
  CVE-2026-6791  posix: Fix stack overflow in wordexp tilde expansion (BZ 3=
4091)

Commits between the old SRCREV (e9517114ac) and the new SRCREV (1c9988e525)=
:

1c9988e525 rtld: cache cpuid results on the stack for intel
dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091, =
CVE-2026-6791)
8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf
c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf
1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug 3=
4289)
349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use
fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)
a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, BZ=
 15792)
fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)
22f3d24a6b Hurd: restore some SIOC ioctls
a13ebdbc7e Hurd: comment ioctls which cannot currently compile
446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines
ced45fd472 Hurd: comment PF_LINK/AF_LINK defines
89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cache =
[BZ #34210]
18b97b03b7 Rename __unused fields to __glibc_reserved.
a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64 (=
BZ 34183)
4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]

Testing Results:
             Before    After    Diff
PASS         6609      6611      +2
XPASS        4         4          0
FAIL         131       132       +1
XFAIL        16        16         0
UNSUPPORTED  554       555       +1

Changes in testcases:

testcase-name                                before  after
resolv/tst-ns_sprintrr(new)                    -     PASS
nptl/tst-robustpi7                            PASS    FAIL

[Note: The uplift adds new testcases including resolv/tst-ns_sprintrr
from commit 8759917de5, which passes, accounting for the PASS and
UNSUPPORTED increases.

nptl/tst-robustpi7 shows as PASS->FAIL, but it is a flaky test under
QEMU user-mode emulation (PI robust-mutex handling). No nptl code was
changed in the SRCREV range.]

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index af3db54cee..cf5a444095 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D "release/2.43/master"
 PV =3D "2.43+git"
-SRCREV_glibc ?=3D "e9517114acc77c0b8af9da6700107df16882b701"
+SRCREV_glibc ?=3D "1c9988e52540c844928c6d93ff45305adc2c24a0"
 SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
=20
 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glib=
c/glibc_2.43.bb
index b84c55ca17..9f3a3814d0 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -19,6 +19,7 @@ easier access for another. 'ASLR bypass itself is not a v=
ulnerability.'"
 CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-15281 CVE-2026-0861 CVE-2026-091=
5 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \
+    CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 =
\
 "
 CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availabl=
e in used git hash"
=20
--=20
2.34.1


