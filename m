Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9B7CC6B01
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13139.1791811212025663397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HyXuMxO6;
 spf=pass (domain: est.tech, ip: 52.101.66.48, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZjmgPvTSJY34ohzJCAWIuXxm4qCF9d7VAm+JFgEvtQomv2XwTVE/mWRy2od1i+SYsJitDVuJm8duPFSvv+qboWAu8TJdx4px2SE2CLH5QW8TTUEdIJFd5Ztu3ai1oo0VvVB6yEkha/DhZyK/vFRBvT52ZiEoG4SKGO/O50NsYmXnYQ9CZSyqTJU1hOC0gBqQSfMfK1vtn8qiX3a0wWM/D5eXT/xvckOGQ66qydMiTAbOWlnCJVmpKyO6AuXis+rtTq8vJcvByuyZjGeE1X/Sj/MryY4A3ZPQ7ydwANCB03HCuazcZwiK0kKVZeGFwEwFKHgIiIMsSDaK4qoafAmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZHCW6HDRNECePIRGJSs5+ILuXtjexiH5E+ObMI0mQU=;
 b=xyblVqVoxh6vazVK7kJ62n+eYyJJQqTY8y0ewnBy+I7Je0b75sZtFcChh8GwO9oRwDJrhb3aGZrScvB2rbUlca5xjVfbGWUDF6Wtn8REUeyTE338xdTkR99e0fAT/zmemlHcLjDAwHBjWjUPjgbRwPFdIgNhk9hjpSBgKK5/L6hwzUImvWuFioLFQIY8wtb5Yr/0L3A+mXrO/zYNh4TiBy+Sg3uvh020vh4mKoUucvNRREi7kgny2kfQj4PD4sheuua9kKmBY2vnYnr5V1d8UWbUCjrlUkGom/mKBGRrvjDyMAo4cPg4tKHooSntv+2WOfrOgEYFcxS3J6mL/NZHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZHCW6HDRNECePIRGJSs5+ILuXtjexiH5E+ObMI0mQU=;
 b=HyXuMxO6lnnsckpM0as0DMBQQxybkWA1sln4PknS3MVbWruDQdxkhuJ+EKq2xhl1LF8C46jepxQb4WMWb+ZYsUzPDUmYr0EiL0PGJt0cMyvVoAtnF0XIgETFPOipidFk2rMePT6v0KshrWRoABBBb4evA7G+clHi155PNrn6qvD5WglaopfUw5sc9opOclF2FRA8efDHysLy5tY6uzVWKyvB3z7KGjLI82bg22c+0fzdJNkBN7/A+ZiOqsoYc/ihy95yM5hEWKgOhdhXdKdnVPKalQnUkyqATEq/jbCH6Xh/XZAv2I7p3g/o8iAwE4mWz6pspKCMupqyqzVc8uIlDA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:10 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/18] python3-uv-build: Upgrade 0.12.21 -> 0.13.0
Date: Mon, 12 Oct 2026 15:19:49 +0200
Message-ID: <20261012132005.23909-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: e31c81e7-a627-4668-c00a-08df28638a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|260925022911599003|260925021911599003|260925021311599003|10067099003|261009223027099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	6leYPLkECLIG38BG+FSDrHAA21YjaO0YDLNheV538PMzzTFuijZNgMAHVI0I5SZ0tvWF95+HPY5BbFYzdnrsGaWe4d+1fyb2FemalhUbyV5WcHseU/kRYMpp/6xqn57ilyd0r0A+UlahRoy8RUQs+6fxYjOacg/eDVUhCSGZVehUEuKS039Ek/Wv73ob6f6PR97EdTmQKLBbixIMwcsFuR4yjQkivBPv0+WsXUs8xaRRwC6VWbmuFrr41y0HuC21qXGt9Pn17IleHGHC7n7KCTM1++irwn3ZlzDTU1RCv8wQgPrV164+cbgc3iEZN6nYlT2Dg5dhPQqV0iXQ502+V2hBpSHeugv7jho9OxcHZ+D58Xwat4s41vavK/3CtR13jmMDIveQ1lTZSZ3n/7CdQ9kP1k7hZPMfbCLqH3E2iq/EJMfIjIAN+0rryHexcAlDmpY0FjBEUDE2SyoVT6pZRfrqt8fK8F1nPW7Lb1DO2dUGXyMIHgjRqTXTkgdPeqiFpMU5TIRrq7lEMcfhsdehhyCdnRp/mKVtnZFvTSRjWlOzVySmkOa9mfFmnqVt1XvjkSQdfzaXS1PrIGwA8M07qzuNDAXeVHOUAWSoMOw+UFaHimNS1gmS5M8ebwew7H1+nNKejFq6GVDjfmyYajmT1RWYiBZjR5i+9BiMWn+2/5U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(261009223027099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4AlFORkGdtSkiV8sT9j07gn0kjJmdidEisuvKFJyKMJBJ/plSIE6BWdM8XPe?=
 =?us-ascii?Q?TwgODxZV4s/QO1lQ9FPoDFMnZggO5MYfVnqOSws0MlM2eLpGd9fRbuibqscV?=
 =?us-ascii?Q?qylUcv6KqGQjhW2XMBCSLTP0Y0MKcWb2vKRgLzCy0oXo3BGEtz7qLq4ZXcEe?=
 =?us-ascii?Q?BDVS93lNfdMKk3Sb+SkJ7ECVSnzPKsd8yTwh39jJz8UnWZDq+YdL6+X1aebA?=
 =?us-ascii?Q?MnliTpJi+nToKa+WPSShDrQdtodJvpEZtAQsKrS/4IsfV7rooXRCHpOo1qP4?=
 =?us-ascii?Q?QQTJRCWJ31IRJj7803zMHPiUlb4F7e69eN1TRDyPeo0k6rbpOUuL8NsY8Ik9?=
 =?us-ascii?Q?mOO7I3u+vcs88Daw98Mv526+I94wXVwlQnWzHch2Szr4TOtoMcJh/IzW0sEQ?=
 =?us-ascii?Q?JDWHxhyR8ZE88KiI9sF5/lFDKCSAJJOy4M3kQ205RvYlV1tqhFdsVcmNuY+t?=
 =?us-ascii?Q?NH5wEok47PpuPi34a26c5RxnoA1F1oMTKywWRh1qRjEeKpsB21t2KEGj0huZ?=
 =?us-ascii?Q?micSDSUmqqlspsgDx2BJEZl7OeDu5fNIQVrjfwN2++GvgFMkm//1dTxrZL8Q?=
 =?us-ascii?Q?kiITiCLC2IMtrW0U29zfFZwKX6h9fC2uXR4G2UgVv0yS+/JYCSRyl6Ulccmx?=
 =?us-ascii?Q?RZZhQ0hI0+P6PMfZCyYJ/W24qNFCSQOYdUTe3IuvMFXqJLe1shwu5jzFlqK3?=
 =?us-ascii?Q?sppr+PtNfLTKIAgc433SpkZaTuDeV9+EYeqOas1piPj+ZbdgFkGp0sMBgrKa?=
 =?us-ascii?Q?Z/KkU8CW3Okn+2uwB7avI6LmuB/hvxBmrBJU4JOct/JrTxjnfgbow4ljAkpY?=
 =?us-ascii?Q?bPduAgpN3yHKoNnqZRxNjfbX8mdPn9yLeyLM3NSZ0VuCJoJjD7t07XLjWVX2?=
 =?us-ascii?Q?gVKow6/NyWNZBdMb7m2pqlOguAY5BKqchoAh8F+oUwCTCYAHBaxGbvxwDZiR?=
 =?us-ascii?Q?4lCGVpVc/2f0CVxZmApV300NZvwwic7RUs9ges9KpLlMm1dxnYsqis6feaFl?=
 =?us-ascii?Q?kFHxa1nTmP7hejpfg3QL5VRJ1fzhyX+C9c3X2QKgQUZz2Y5/qAS37VV42LtY?=
 =?us-ascii?Q?e8NDBJSWsYUo0QAdvRDcBtzo+3wrINiW/MHIb64ls75D4m7R7RHkBBlu6K0d?=
 =?us-ascii?Q?vvjuMyn0MkBU/DgJ8nK2SL7aOmYtwAOvQMklRh9uF0VznD7UCadiTO+rYfcJ?=
 =?us-ascii?Q?+CIDqFgsYhmfgFRfxR2G38ugF4nDQvHI9B+ZRqBhFrVyzwloW2oe+fLfQ41L?=
 =?us-ascii?Q?Pm2i8SlkH4Jn3n0uHe+rN7AtAqbQ9k6ZbUwDuhAYQVvU6D7AQfs6jJS7BOS1?=
 =?us-ascii?Q?KZbo/o015vqE0cv213y20kqLyRYeC1EGiCom+HT1iyMo/8MUkd9E19NBvfYv?=
 =?us-ascii?Q?3d3zy61vyk2cuaJLoX2SP0g85xaw43AP/1rsw0A7+MCeuPVDldMmY4e3Lzen?=
 =?us-ascii?Q?a7yMg3o/i5qyvzF4EWT1nTPwMPRqcAqbz/m6U5HsE0bLAusxe+AJioW11xSJ?=
 =?us-ascii?Q?UwgmAip0Jx6l38BQK4lsBOLAVS4KIV3xRHZlhlTBaWALIkXj6g2l1XZ2meX9?=
 =?us-ascii?Q?TQl1qerZJrqX8oDoep79cToFW8OJkhwG2XLyGrhZ19srYE7g+ILdnYxRx/NV?=
 =?us-ascii?Q?wMkd9aD/u3rAEwzpnG9N4tR8ccpgZJJPzINtMyUHqRzb5wD0DCpYRMF7Kxee?=
 =?us-ascii?Q?KVNA2lc58ffOEnDYVc5lCfIDVd3FYI7TuhvpKq1ohbjMzV8yfjon5uxgrkda?=
 =?us-ascii?Q?cqu8kGRilw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e31c81e7-a627-4668-c00a-08df28638a98
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:10.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsPRD3HRV7cV8cGaIwIBwptzta+EnXPJysTMdj9xe99O7p7ESy3yQ3iDBQDVBJT+ax1NxMeCgFZas2zJgQVRBjqUfv3U/rL3KnALBhIP2p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247646

ChangeLog: https://github.com/astral-sh/uv/blob/0.13.0/CHANGELOG.md#0130

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-uv-build-crates.inc        | 36 +++++++------------
 ..._0.12.21.bb =3D> python3-uv-build_0.13.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.21.bb =3D> pyth=
on3-uv-build_0.13.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/met=
a/recipes-devtools/python/python3-uv-build-crates.inc
index a21746312e..40087d0541 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -16,8 +16,8 @@ SRC_URI +=3D " \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.7.0 \
     crate://crates.io/astral-version-ranges/0.2.2 \
-    crate://crates.io/astral_async_zip/0.0.20 \
-    crate://crates.io/async-compression/0.4.19 \
+    crate://crates.io/astral_async_zip/0.0.21 \
+    crate://crates.io/async-compression/0.4.45 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
@@ -33,7 +33,6 @@ SRC_URI +=3D " \
     crate://crates.io/bytes/1.12.1 \
     crate://crates.io/cap-primitives/4.0.3 \
     crate://crates.io/cap-std/4.0.3 \
-    crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
     crate://crates.io/clap/4.6.6 \
@@ -41,6 +40,8 @@ SRC_URI +=3D " \
     crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
+    crate://crates.io/compression-codecs/0.4.45 \
+    crate://crates.io/compression-core/0.4.33 \
     crate://crates.io/console/0.16.4 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
@@ -68,7 +69,6 @@ SRC_URI +=3D " \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.5.0 \
-    crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.10 \
     crate://crates.io/foldhash/0.1.5 \
@@ -118,7 +118,6 @@ SRC_URI +=3D " \
     crate://crates.io/jiff-static/0.2.35 \
     crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/jobserver/0.1.35 \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
@@ -152,7 +151,6 @@ SRC_URI +=3D " \
     crate://crates.io/pin-project/1.1.11 \
     crate://crates.io/pin-project-internal/1.1.11 \
     crate://crates.io/pin-project-lite/0.2.17 \
-    crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
@@ -196,13 +194,12 @@ SRC_URI +=3D " \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sha2/0.11.0 \
     crate://crates.io/sharded-slab/0.1.7 \
-    crate://crates.io/shlex/1.3.0 \
     crate://crates.io/signal-hook-registry/1.4.8 \
     crate://crates.io/simd-adler32/0.3.8 \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.15.2 \
+    crate://crates.io/smallvec/1.16.0 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
@@ -210,7 +207,7 @@ SRC_URI +=3D " \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.118 \
-    crate://crates.io/syn/3.0.4 \
+    crate://crates.io/syn/3.0.5 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tar-codec/0.0.14 \
     crate://crates.io/tar-framing/0.0.14 \
@@ -306,9 +303,6 @@ SRC_URI +=3D " \
     crate://crates.io/zerovec-derive/0.11.2 \
     crate://crates.io/zlib-rs/0.6.3 \
     crate://crates.io/zmij/1.0.21 \
-    crate://crates.io/zstd/0.13.3 \
-    crate://crates.io/zstd-safe/7.2.4 \
-    crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
 "
=20
 SRC_URI[adler2-2.0.1.sha256sum] =3D "320119579fcad9c21884f5c4861d16174d0e0=
6250625266f50fe6898340abefa"
@@ -325,8 +319,8 @@ SRC_URI[arcstr-1.2.0.sha256sum] =3D "03918c3dbd7701a85c=
6b9887732e2921175f26c350b45
 SRC_URI[arrayvec-0.7.8.sha256sum] =3D "d3fb67a6e08acf24fdeccbac2cb6ac43058=
25bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.7.0.sha256sum] =3D "6f2e989b33246fe9240d39accf4=
dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
 SRC_URI[astral-version-ranges-0.2.2.sha256sum] =3D "81129e143a7bcea263d5a2=
c50b8be47ac58365dde618bc1ac50f69f497c9cb63"
-SRC_URI[astral_async_zip-0.0.20.sha256sum] =3D "bd939d79959c3f49a648a1d785=
7d63cc62548725a6b060b8dbf0ea5c92470b63"
-SRC_URI[async-compression-0.4.19.sha256sum] =3D "06575e6a9673580f52661c921=
07baabffbf41e2141373441cbcdc47cb733003c"
+SRC_URI[astral_async_zip-0.0.21.sha256sum] =3D "13f4a9bc6289d907c8e883d250=
26a54751d686da9926af271d0fc4cbe58a7f4d"
+SRC_URI[async-compression-0.4.45.sha256sum] =3D "24a8ec73eb862508b7041723c=
89386365894b4e7d9f6998bf1b8529e5b0ee254"
 SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] =3D "cffb0e931875b666fc4fcb20fee52e9bbd1ef=
836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
@@ -342,7 +336,6 @@ SRC_URI[bytecheck_derive-0.8.3.sha256sum] =3D "46d07918=
caa9eeaaf06b7873925c53a61da
 SRC_URI[bytes-1.12.1.sha256sum] =3D "fc652a48c352aef3ea3aed32080501cf3ef6e=
d5da78602a020c991775b0aff04"
 SRC_URI[cap-primitives-4.0.3.sha256sum] =3D "8b5f74729fd2f44701d1a8eb47e90=
6cdb3ccd9ec0f02baad85a744b791940b18"
 SRC_URI[cap-std-4.0.3.sha256sum] =3D "c1ec78e242cfa2cfe276807ac2ecc00315a6=
c97786977414bcd1c3963b6c91b8"
-SRC_URI[cc-1.2.57.sha256sum] =3D "7a0dd1ca384932ff3641c8718a02769f1698e756=
3dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] =3D "f1f927b07c74ba84c7e5fe4db2baeb3e996a=
b2688992e39ac68ce3220a677c7e"
 SRC_URI[clap-4.6.6.sha256sum] =3D "473c7e07f409a8d772161724aa8db6a765a2532=
a70f9667eeb7b49d3d02fbdca"
@@ -350,6 +343,8 @@ SRC_URI[clap_builder-4.6.6.sha256sum] =3D "7b48fea5a88e=
9ae728a2dcbedbfc0e730f7d60d
 SRC_URI[clap_derive-4.6.4.sha256sum] =3D "d012d2b9d65aca7f18f4d9878a045bc1=
7899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.1.0.sha256sum] =3D "c8d4a3bb8b1e0c1050499d1815f5ab16d04=
f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] =3D "1d07550c9036bf2ae0c684c4297d503f=
838287c83c53686d05370d0e139ae570"
+SRC_URI[compression-codecs-0.4.45.sha256sum] =3D "98fc98460ba0ad5317075d36=
32b8dfc45d0be8c4a49347c2a38272019717614a"
+SRC_URI[compression-core-0.4.33.sha256sum] =3D "6e8ccc4ea9f6acc32d102c0f6d=
471d11d913ad15f20c04de743374861fa1d414"
 SRC_URI[console-0.16.4.sha256sum] =3D "4fe5f465a4f6fee88fad41b85d990f84c83=
5335e85b5d9e6e63e0d06d28cba7c"
 SRC_URI[cpufeatures-0.2.17.sha256sum] =3D "59ed5838eebb26a2bb2e58f6d5b5316=
989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] =3D "8b2a41393f66f16b0823bb79094d54ac=
5fbd34ab292ddafb9a0456ac9f87d201"
@@ -377,7 +372,6 @@ SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0=
bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.10.sha256sum] =3D "d2add8a07dd6a8d93ff627029c51de=
145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.5.0.sha256sum] =3D "da7c62ceae207dd37ea5b845da6a0696c79=
9f85e97da1ab5b7910be3c1c80223"
-SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D "5baebc0774151f905a1a2cc41989=
300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] =3D "1d674e81391d1e1ab681a28d99df0792=
7c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.10.sha256sum] =3D "6e634e2e0ebac1ee034020da1ca582e17ffe=
4e0f5e985823721e168928136dcb"
 SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca40b3=
9fe946cbe4c263c7209467bc83af2"
@@ -427,7 +421,6 @@ SRC_URI[jiff-core-0.1.0.sha256sum] =3D "7feca88439efe53=
da3754500c1851dedf3cb36c524
 SRC_URI[jiff-static-0.2.35.sha256sum] =3D "3a69dcb3a21cfb32ce1cd056169337c=
a284af0766dd766e7878819b251a49204"
 SRC_URI[jiff-tzdb-0.1.8.sha256sum] =3D "142bd39932ad231f10513df9ab62661fea=
d8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D "875a5a69ac2bab1a891711cf5=
eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[jobserver-0.1.35.sha256sum] =3D "1c00acbd29eabad4a2392fa0e921c8749=
34dbbf4194312ad20f04a0ed67a3cb3"
 SRC_URI[js-sys-0.3.91.sha256sum] =3D "b49715b7073f385ba4bc528e5747d02e66cb=
39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] =3D "160f2eade097f30263b548aae5deb12ad34=
9c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
@@ -461,7 +454,6 @@ SRC_URI[petgraph-0.8.3.sha256sum] =3D "8701b58ea97060d5=
e5b155d383a69952a60943f0e6d
 SRC_URI[pin-project-1.1.11.sha256sum] =3D "f1749c7ed4bcaf4c3d0a3efc2853884=
4fb29bcdd7d2b67b2be7e20ba861ff517"
 SRC_URI[pin-project-internal-1.1.11.sha256sum] =3D "d9b20ed30f105399776b9c=
883e68e536ef602a16ae6f596d2c473591d6ad64c6"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D "a89322df9ebe1c1578d689c923=
18e070967d1042b512afbe49518723f4e6d5cd"
-SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c704c=
14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20cb=
e2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] =3D "091397be61a01d4be58e784=
1595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] =3D "b73949432f5e2a09657003c25bca5e=
19a0e9c84f8058ca374f49e0ebe605af77"
@@ -505,13 +497,12 @@ SRC_URI[serde_spanned-1.1.1.sha256sum] =3D "6662b5879=
511e06e8999a8a235d848113e942c
 SRC_URI[sha2-0.10.9.sha256sum] =3D "a7507d819769d01a365ab707794a4084392c82=
4f54a7a6a7862f8c3d0892b283"
 SRC_URI[sha2-0.11.0.sha256sum] =3D "446ba717509524cb3f22f17ecc096f10f4822d=
76ab5c0b9822c5f9c284e825f4"
 SRC_URI[sharded-slab-0.1.7.sha256sum] =3D "f40ca3c46823713e0d4209592e8d6e8=
26aa57e928f09752619fc696c499637f6"
-SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
 SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D "c4db69cba1110affc0e9f7b=
cd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
 SRC_URI[simd-adler32-0.3.8.sha256sum] =3D "e320a6c5ad31d271ad523dcf3ad13e2=
767ad8b1cb8f047f75a8aeaf8da139da2"
 SRC_URI[simdutf8-0.1.5.sha256sum] =3D "e3a9fe34e3e7a50316060351f37187a3f54=
6bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] =3D "bbbb5d9659141646ae647b42fe094daf6c61=
92d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc58=
6479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.15.2.sha256sum] =3D "8ed6a63f02c8539c91a8685a86f4099661=
ba3da017932f6ebbea6de3f0fa7c90"
+SRC_URI[smallvec-1.16.0.sha256sum] =3D "b9be42f50aa861c555654aa3a37f52f4b1=
074bacf4e48fe0ef7fa584e80f1f0f"
 SRC_URI[smawk-0.3.2.sha256sum] =3D "b7c388c1b5e93756d0c740965c41e8822f8666=
21d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] =3D "3a766e1110788c36f4fa1c2b71b387a7815a=
a65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] =3D "081670c233dfbed55690cc0cd38424e0e24ac1=
b2673d0b408b3f7b684738dfa9"
@@ -519,7 +510,7 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2be=
8dc25455e1f91df71bfa12ad37d
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] =3D "2a8f8038e7e7969abb3f1b7c2=
a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.118.sha256sum] =3D "1b9ae57f904213ebb649ce6895b8a66c66f020=
3b9319718f69a5612a065b1422"
-SRC_URI[syn-3.0.4.sha256sum] =3D "e6275cddf4610d1775e6d1fe9469b2e77d0f39fd=
98fb7450901b821e0c53649f"
+SRC_URI[syn-3.0.5.sha256sum] =3D "12df2e0110f65b775f769bb17ef989067a1d931b=
2eb822bd4346631eeada89f9"
 SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7ae=
5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tar-codec-0.0.14.sha256sum] =3D "7ea42eb144d30fcbf32c26dfea8959175=
bb8335bfb7b18d20c6ed32edecf0551"
 SRC_URI[tar-framing-0.0.14.sha256sum] =3D "783223a7a6590be4227cb821e7ce803=
72575511f67c824921aba0752d8ad5573"
@@ -615,6 +606,3 @@ SRC_URI[zerovec-0.11.5.sha256sum] =3D "6c28719294829477=
f525be0186d13efa9a3c602f7ec
 SRC_URI[zerovec-derive-0.11.2.sha256sum] =3D "eadce39539ca5cb3985590102671=
f2567e659fca9666581ad3411d59207951f3"
 SRC_URI[zlib-rs-0.6.3.sha256sum] =3D "3be3d40e40a133f9c916ee3f9f4fa2d9d634=
35b5fbe1bfc6d9dae0aa0ada1513"
 SRC_URI[zmij-1.0.21.sha256sum] =3D "b8848ee67ecc8aedbaf3e4122217aff8926392=
31befc6a1b58d29fff4c2cabaa"
-SRC_URI[zstd-0.13.3.sha256sum] =3D "e91ee311a569c327171651566e07972200e76f=
cfe2242a4fa446149a3881c08a"
-SRC_URI[zstd-safe-7.2.4.sha256sum] =3D "8f49c4d5f0abb602a93fb8736af2a4f4dd=
9512e36f7f570d66e65ff867ed3b9d"
-SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] =3D "91e19ebc2adc8f83e43039e=
79776e3fda8ca919132d68a1fed6a5faca2683748"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb b/met=
a/recipes-devtools/python/python3-uv-build_0.13.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
index c2808203f9..2ad38b2054 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-APACHE;md5=3D86d3f3a=
95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=3De23fadd6c=
eef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=3Def7a6027dc4c=
2389b9afad7e690274c7"
=20
-SRC_URI[sha256sum] =3D "616d1ecccca300b240e65a88644f8c2996b858ff039f759d71=
7249d28f94a2a6"
+SRC_URI[sha256sum] =3D "bd2614f24a58dccd4865d4f86ddd91dd01fd0efab4632e0331=
86a8423b8a3515"
=20
 require ${BPN}-crates.inc
=20

