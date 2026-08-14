Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F77C5DF69
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:18:46 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6891.1786684720015305589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0viu3FKS;
 spf=pass (domain: est.tech, ip: 52.101.83.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePt8Wsw1PFprYRa4E0zY8iO+YnOr5yo2xhk6flz59eF5KcNadAuZ/KXoiZob3X0pWbdIO4MpghmPc/y8Q8WMQWHDbsM+vbyZSo/WaQAj2rqa//TkqZ/e4zAumDmx3UwmC38AUnaTqEbeu6r4QZyORQzxCs43uA2++EvgDArPSMhswp7Tm9JHpVSWHSnFId3FxRLBsd+FImiUrYgFvqzd3pky0MdYjvD32aOjJ8XqIMrTQAPLY4M8RjlJ/E9m1AH9axHDE8yAw7LcX1/n4h1S2dmukZZlc8dgVdtvcvy7N9aY8/FmYLclxLzOHykO4xxcy9LOgUE+ATmmin0OjCjZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cvMv0cksPvRpkDmU/S0hrEVeuEzMvyiThvxnD9VzFc=;
 b=mBoLjrbVQ8/cofwLxdXZwZrrqx8TCrvJOf3seyDHo5rK4y42NUJ2HYEu5k4sOoDd6zwNomlprRQ6Ih+FDnwc9lUEPexsi2GjBTY4PA7lLWqgodWMp2HmEWcVgntTOIIJ9y6y8oYQAWz8tqZV4xs0LI5UyLYhvPSoK+bKCOMXp6yK9rGyZu+az6j02pXFWUQ8/xh3g1lH3Fg71LO4X9NygEJ1+DLgaFvTKS3T1OgFZBQfCF16raU4XGlAp8Cxobhu6ca6zqtqFTMl0yFj2dC8Ys/6OsTzxjJ1AAX1rAh+N2xskqpPZyY36RNsRXthm+pKRk+0knVdl/RwrVPLGiO8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cvMv0cksPvRpkDmU/S0hrEVeuEzMvyiThvxnD9VzFc=;
 b=0viu3FKSlvqoINXiBgZyMtnCG50Jy8VihCKyUhrZ+D+C7RXt7N+Q6ht2NW+rNCuU41oUsKUNnWUJ9X/35mM+culsVbi23u+1Bl7ctNzQ7/fiDE8LYavr8A7TOXjcjBBPjATbbLlIgJfTrGTNCUrjAeO2beaBMgGLSTCkddyx/x4GvHxzORfre8OBnSV8M1iyY08udyhZ/oW/6nQyZ7KN0eLUTHA95FKkiqsEnXNUTT2tF/WN4xpBoGUDueWvZGz45gwbK2C+xHAqFM/4eJc0FsjwnQhOnKlFhyQldn+e2Gs9aFvYpsGr0Jwj5ZlDlWzDFsCCuDMdAwbs5A0gs/qfZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB3385.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Fri, 14 Aug
 2026 05:18:33 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Fri, 14 Aug 2026
 05:18:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [RFC 0/7] openssl: upgrade to 4.0.1 and fix dependent recipes
Date: Fri, 14 Aug 2026 07:18:22 +0200
Message-ID: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0224.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB3385:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fa0719-ec20-45ba-f3e1-08def9c37c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|366016|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	vqugNvByd/CJ7MjikKdeslDpk3aJbiyXf+6RkEF2hO3XPP+0qYP0Z4r6gGg3jxd9W2342t0m2vGl2Iqb4zt67b87wRYR6yucuDxgV9ybSqAd29nB90zLJWOrQ/PvrZC3YRaD/s9boDWukX4XWNgTSP9+iLPsghd2I9sOc7CLSlPIXjVPfm1s0vBIS9tzBCjgJNOTrXglj2zZ/Pv16Bu06DhszW2uAsXRRrFjDw0yuRgiPjP0tHnsgwtEY8bw0QVIuZLwA7mlR7NeBcUpV3EllUs74J+WwnGn8C0/sQrsow1GXk4F9w4KgEbXOlk8nTF601Ni/D+VinTBAYCyZaDPaxQDIsJhaPGiG7NN+ojT4wQzpXk/TfvshRP/u76O5H5CaXPMOp2jau/22UqFzNJ1pEgOiZ3YOx2P9KFi6eMqOrCtWl4kg0w1NKHO60q9vnTyIU+hWN2SIEOGL2tvl/FxsBHb69J/wGKRHFf8SUG6i/ln9msQXdjVn2u4QmSStAF294hxmN+nkDRRQDYgk/DcCSG9V4td/TGcrW/AXsdaC230LuWDIci3xw5ztj3285DS76+HBJPqjt7QWMW5wgtfHx/JxMPeJtJ/uXn2K/JvV+AyJ0SvS5xzLRubxbfUH5raLJUJyeG4r1jnF6ISmNkVZoyFcUVVb30MuJyw9syJq+0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a/qJa5mQsard47mjNa5BYkvIESLA4JNbtmYwNS45oasH7KBOodbicEdezNgO?=
 =?us-ascii?Q?b5qWKK5yIoTAvB8ag7OY345DmBUqcvzVur70xQWINZcR0YrReEwYVIPjyPJS?=
 =?us-ascii?Q?gYWE5FUSE2YbodV7Z0haHTR6a/KVjXXQ6NbywxcZl+APZ0X9SNSz+mjAB6cg?=
 =?us-ascii?Q?vH6o+VIHncXsY7amoZc2+pekL66/x2/6a+1XdPoD1iJuARJ3+GTrAUXUDiJ/?=
 =?us-ascii?Q?kj9w04tyelfM9t1U5DBtApKdFK8x6CRi6SXGK3njlyXd7bxqxA+DMI1Lx2xO?=
 =?us-ascii?Q?zPrPOc0rG7uethynfuu+NVx5OsM+d3xVfA4wHSn02Wr6ElW4pD9BJ/9QvAnK?=
 =?us-ascii?Q?jpT5A9HVcKHWM+8vaRG418KDStooSgR1D5EaaJ9PeHHEvMiWZwgw0YVBjNO1?=
 =?us-ascii?Q?kfEAqAkfwJIc+ISd4o20r3b78r8eoYn2NtJdGOyXh7/6UpLjm5TAhEM7UR3s?=
 =?us-ascii?Q?0rX4VsIIFwGNSqR5+NrarvVS1TbsIztSeaooQH8E75ogZQrD+1k5IXK3NNCY?=
 =?us-ascii?Q?56yXc1X5x94dnbP74omoGscaveg8D6ZNHDvT+WAsi/fKFqIW3J+QyX7soAs0?=
 =?us-ascii?Q?yNHBaUp2UJyKDwwKLzkiERDC5DkCIMAe/jq2kRwYkSA/c3hNHWKDwOiBQBBw?=
 =?us-ascii?Q?zaeGw2djFtUyBF/v6wlBGc+edvZPhzNKpoexe0LkYThILr6Z89vdZXDqhsXG?=
 =?us-ascii?Q?/c7dkdkvwLYMk+rNmEntZ7hsJSwBk20IP2H5jaskNF+0Y0bYOMY7xofR08gP?=
 =?us-ascii?Q?OZrpNusTeMtph6ATGEpvldG4tnRwGGsPZB4wiC6A0N+MuxQStZCMVJRB8vEw?=
 =?us-ascii?Q?ongSpEe9XkJNOPtHEPDf5MFc9KdJeM1DlOQGtLz2JqawoqPQO/M9KZJem+XM?=
 =?us-ascii?Q?fSltG7wzPKYFcd+z1F4PM52lHUbYWWa4NRZqrAvJddtcKyECWBfecfAK0Wzh?=
 =?us-ascii?Q?DxXmpZMF2RIn6ICkOIMX+JDpeAKb3J5EniehHFqSxQbq3tyiLL864Q0o1n5D?=
 =?us-ascii?Q?uEKZNIv+6YBKy+wzZ+GFHZo03IJXoQIzA8q+MmMbCE3zYIkqjeU3OGgjogIX?=
 =?us-ascii?Q?sAKOLtS6syy8xwzW7BiDRahBIwR5e58H8oLqVCFakfHMVw/9CgeoTos8u2+B?=
 =?us-ascii?Q?2N3qtrUAk75FjliUrK9qMiR+VFikxO7L3jdmRkLUJEBuKo7Dl9BCymPhTlgZ?=
 =?us-ascii?Q?3qorEQSOI2fVyHvR4AzPO+eMCO3Ndg1f1LZRJlkmz7rd320f5nfQNC0kjf2j?=
 =?us-ascii?Q?Vr4uabcireyYU2cqF35AxTOQPgQVFe/B7zCG7qFwXC6xRRsobncjKXjAQr1p?=
 =?us-ascii?Q?0LmVkcMuEIh+OLh1rUgYaU0THsKdrglYbgpZ6C+epLEeZRlJKRBi2ujd/5vo?=
 =?us-ascii?Q?TpitnsR0LpY8tYKNiv0MzvlmvNg7HyRk7XS/XQ6hR0jxwrSxcsLFeRiDVqU7?=
 =?us-ascii?Q?QtoxCviPpLB5XVZM/XALw6nXyHul2Ghr0hEu9dU60hEP6FYdcjveuzqjhbsi?=
 =?us-ascii?Q?DKpkTxxfUUIo6Zki2JwCvtz989woYfClUmCOwE2ypDB6HraxHapgrGSuCnbV?=
 =?us-ascii?Q?3GfhWcUQZ9fRA6B+JUHyNBUcLFv3UzVNH2drx3EG5GjqOs4nWU9XroIfd8e2?=
 =?us-ascii?Q?yOCEJyPeZZVpUVI3x0WyNK/F9z5pkkegHRHsUcBywRk+r8Q1IBBopdjK5C4I?=
 =?us-ascii?Q?D/3vAtAS6Mv8P21sRxGQbabIMWIotWZIx/kQYSwleitzU3j8jYeV/P3faiL1?=
 =?us-ascii?Q?ByXEiwwV3xkmxVlXnaFfdsgXZpjg8YUhMZ8Ouy8V8PkYcpXE1WUFlAfYvFe8?=
X-MS-Exchange-AntiSpam-MessageData-1: 2VP6+K+gbl0dJOVbB5EJ5cVb9kdkPFtwOJY=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fa0719-ec20-45ba-f3e1-08def9c37c19
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:18:33.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RdiYhA6FtdF28rY2SFOP8DQa2Le4vjbD8DfTMGj2jIUBrE/MxoWCkvRJW+cjqdZtE9waY7rTXxLyONv8sCQns1eYdMock4DCi9z+KRX2+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 05:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243396

This series upgrades OpenSSL from 3.5.7 to 4.0.1 and fixes all
dependent recipes that break due to API changes in OpenSSL 4.0.

OpenSSL 4.0 is a major release with several breaking changes:
- ENGINE API fully removed
- SSLv3 support removed
- Per-version TLS method functions (SSLv3_method etc.) removed
- ASN1_STRING made opaque
- const qualifiers added to X509 getter functions

Patches:
  1/7 openssl: upgrade 3.5.7 -> 4.0.1
  2/7 python3: backport OpenSSL 4.0 support (CPython commit 3364e7e62fa2)
  3/7 socat: fix ASN1_STRING opaque struct access
  4/7 rust: upgrade 1.96.1 -> 1.97.1 (openssl-sys 0.9.114 adds 4.0 support)
  5/7 serf: fix ASN1_STRING opaque struct access
  6/7 u-boot-tools: backport Provider API (replaces removed ENGINE API)
  7/7 kea: add const qualifiers to X509 pointers

Dependencies:
- wpa-supplicant 2.12 upgrade (already under review):
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260811035602.3=
661581-1-ankur.tyagi85@gmail.com/

Testing:
- bitbake world: passes on qemux86-64, qemuarm64, qemuarm, qemuriscv64
- openssl ptest on qemux86-64: 362 files, 4310 tests, all passed
  (338 passed, 24 skipped - fips/lms/rc5/tfo/compression - all expected)

Notes on upstream status:
- python3: fix on CPython main, backport PR #146403 closed without merge
- socat: submitted to socat@dest-unreach.org
- rust: based on Deepesh's patchwork submission, fixed missing
  rust-source rename and dropped merged 0005-remap-OUT_DIR patch
- serf: fix in trunk (r1935023), no release yet
- u-boot-tools: PR #918 open since March 2026, under review
- kea: tracked as issue #4673, milestone kea3.3.2

This series depends on the following patches already on the list:
- Ankur Tyagi's wpa-supplicant 2.12 upgrade (under review)
- Deepesh Varatharajan's rust 1.97.1 upgrade (we resolved the
  remaining issues: missing rust-source rename and stale
  0005-remap-OUT_DIR patch that was already merged upstream)

Sharing this early to get feedback and see if there are other
recipes that break with OpenSSL 4.0 that we may have missed.
The wpa-supplicant and rust dependencies are not yet merged,
but the series is complete enough to build world on qemux86-64.

Deepesh Varatharajan (1):
  rust: Upgrade 1.96.1 -> 1.97.1

Jaipaul Cheernam (6):
  openssl: upgrade 3.5.7 -> 4.0.1
  python3: backport OpenSSL 4.0 support from upstream
  socat: fix build with OpenSSL 4.0
  serf: fix build with OpenSSL 4.0
  u-boot-tools: fix build with OpenSSL 4.0
  kea: fix build with OpenSSL 4.0

 .../classes-recipe/rust-target-config.bbclass |   5 +
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |   3 +-
 ...Add-support-for-OpenSSL-Provider-API.patch | 300 ++++++++++++++
 .../u-boot/u-boot-tools_2026.07.bb            |   4 +-
 ...-qualifiers-to-OpenSSL-X509-pointers.patch |  49 +++
 meta/recipes-connectivity/kea/kea_3.2.0.bb    |   1 +
 ...ke-history-reporting-when-test-fails.patch | 366 ------------------
 ...1-Configure-do-not-tweak-mips-cflags.patch |   6 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |  11 +-
 .../0001-extend-check_cwm-test-timeout.patch  |   4 +-
 .../{openssl_3.5.7.bb =3D> openssl_4.0.1.bb}    |  23 +-
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |  31 ++
 .../socat/socat_1.8.1.3.bb                    |   1 +
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 257 ++++++++++++
 .../recipes-devtools/python/python3_3.14.7.bb |   1 +
 .../rust/{cargo_1.96.1.bb =3D> cargo_1.97.1.bb} |   0
 ...lain-syscalls-as-their-time64-varian.patch |  81 ----
 ...xplicit-tail-calls-disable-two-tests.patch |  39 --
 ...lls-ignore-tests-on-unsupported-llvm.patch |  96 -----
 ...ild-script-path-leakage-in-artifacts.patch |  28 --
 ...ibstd-rs_1.96.1.bb =3D> libstd-rs_1.97.1.bb} |   0
 ....96.1.bb =3D> rust-cross-canadian_1.97.1.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 104 ++---
 meta/recipes-devtools/rust/rust-source.inc    |   6 +-
 ...source_1.96.1.bb =3D> rust-source_1.97.1.bb} |   0
 .../rust/{rust_1.96.1.bb =3D> rust_1.97.1.bb}   |   3 +
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch |  35 ++
 meta/recipes-support/serf/serf_1.3.10.bb      |   1 +
 29 files changed, 759 insertions(+), 698 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Add-support-for-Open=
SSL-Provider-API.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qual=
ifiers-to-OpenSSL-X509-pointers.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Added-ha=
ndshake-history-reporting-when-test-fails.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb =3D> openssl_4.=
0.1.bb} (88%)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fix-build-wi=
th-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-146207-Add=
-support-for-OpenSSL-4.0.0.patch
 rename meta/recipes-devtools/rust/{cargo_1.96.1.bb =3D> cargo_1.97.1.bb} (=
100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-riscv32-Define-pl=
ain-syscalls-as-their-time64-varian.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0003-explicit-tail-cal=
ls-disable-two-tests.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0004-explicit-tail-cal=
ls-ignore-tests-on-unsupported-llvm.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-pat=
hs-to-fix-build-script-path-leakage-in-artifacts.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.96.1.bb =3D> libstd-rs_1.97=
.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.96.1.bb =3D> rust=
-cross-canadian_1.97.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-source_1.96.1.bb =3D> rust-source_=
1.97.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.96.1.bb =3D> rust_1.97.1.bb} (98=
%)
 create mode 100644 meta/recipes-support/serf/serf/0001-Fix-build-with-Open=
SSL-4.0-use-ASN1_STRING-accessors.patch


