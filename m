Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56D4C98326
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 08:20:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3524.1790324439011171621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 01:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EsftJ3Sy;
 spf=pass (domain: est.tech, ip: 52.101.72.16, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozfLxMiUPfa4XF8NgJeOr6n6qJa0whPleJ9fpEsSeEZ8pPS897/wZ9WXS2tz1aO/Rgl8ttlpIQ/gQgNvP2pSC6RNSx0gS3kjen6Tw6iypAjJC0srTVRDuo6ZPV/pX8OWDD/eB77oXTw8PqBxXERCIjslRsSXYIV46IkjS+NQqO6cviwDy9geWB7xwEXeLOGZBiZ9miJ+zNkfXInVrw1Qe9qakgbI6QXXaHYmD+sazeNJYUOXmS2MDNB42ypSYcy1t2qo9N1Fqd/rNDVgxph/dz/VS5rJVs5nQ1LF2D17PkAOhKKFTplAhc2+2Ecm3DnzQfqarsvGampJK/b9VRuerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGU0yXWIWDuzdBIeWIAwhn0Z2GVVp8uhNbUR3LPrfzQ=;
 b=uWS0L7j/OyWeex7V5tgtpBwa51JJMJcAY4edKb8VYg3b5VxX/c8mSWBGGBN7ZoBQzbvFm0ObCw/jLzMSnka81AUAFvn6i3ChM2hugVUs7d3AXy5iqmPXXME5R91ragi13FOYMkR75OBdvK0kPtMnOeQs9tMo4i+8Rut/8bdhauncTsZ+gOq7V56v5K6WqNZJ7Lkaim2SZ/Otg1cFBfg9Mal8vc7dozlV9E/9hWURFVjot1qiepI3GcptZfw+BQ6bd4JaDQ6Yxaku9yAB0AAuc9xw6IdodSVWH3es0PrCEe9hM8A7s83SqEIqHsnLrlXndsRzl53Bnt4FNzY7vjaN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGU0yXWIWDuzdBIeWIAwhn0Z2GVVp8uhNbUR3LPrfzQ=;
 b=EsftJ3SyyUYrcHI0FIr8eA8IDY49ShKwV1YhQAs2NUyopSkvhgh5AGmd0i1FvmtmU4gyWFUlG7JBVYy+YvEy0wnit0MrtfuQEIOXzFV0A2TY3pkZJg4+l0JMUf9nlxOTFjzBdBDAhar0QUYf9EqOHapd4w+Jjs4iy9NUQZBIDN1y7suMXraenzRFw2dWU4GMop1skITi+DiFFWwl2jSC404PyiXJJJN9PHsxr821ikx0F6+QM2Pf+RY3EGMeN65e/2z2B6qwf3SSLK8egzEKzWpPyuCpKrfr7YvUYPqFmlt6R3bVGvreIBLPXQHunN6JNxFq5WePZu+rrcF9A/jO5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3637.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 08:20:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 08:20:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rt-tests/hwlatdetect: upgrade 2.10 -> 2.11
Date: Fri, 25 Sep 2026 10:20:31 +0200
Message-ID: <20260925082031.83588-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925082031.83588-1-jaipaul.cheernam@est.tech>
References: <20260925082031.83588-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3637:EE_
X-MS-Office365-Filtering-Correlation-Id: a94e855b-4608-4600-1d2a-08df1adddf14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|3023799007|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	IHKBr8ak/y6CuiN2mNr1jmZGMQVM9j4N8ieYn1D3SnBqsE+kKAXqviyjfAryv8MydajT8AE9gunpdw8/0TQmCpdJLsNrdeGcElGhlDvAg8K5qeWDfA+sK/oZBLOm8kXV5dZmDN8hbE2NdY41wSugL86pFs16uuYJuHoDLYMeAdWQPP3EhvMhZk9G3Zi+QeTrTx9Rk0cJe7je3xGGqFHMz4wF9DkqCOTxW/5S1NEcpVYhq8fvjvRedjYlfVxU9tLnoldy5K5aYskaNzH6sH2gg6Z8ToNsP1txnOca/wgQqyoRaEFbAZESclHL+vUVxCiWUO4wmm+dACxgHwNt6P8T4PIbt7P52mOHFs73akCXZJ+lFpqFtGgO0gn4OPr02UhnoqLZBMWbJQq+hQ+5S1e4/AN8QuNleGAaduu62tj2moRNSBzkXRHUcoIittIEDgilDOAmMAp10NIghFgnC521S53sBQR+aget1R+3qQof0dKinVpF654kOWi9RQwX2B8Yl1hkwzr4Y6WDFpeLGh+6g5p/mUKi7LlQ3RfeJjRXCZ/ETD9TgToPTeWUyvpFIU61rGohE+0xkG4O1itYh5UgfOGJ2o6bIskrcUtiakEm5Y+FkDT55bWJoM8Q5yIrARHqVyOsp3Sn3b184C4+XjKG6UBRWcvjbWQ4FZCM67R5nWo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4tVVIvHzq8o+QSPpcbKOFevgJ1ZPPXc86ismkTy/PtQ7vMhkDNhsNHaQP37w?=
 =?us-ascii?Q?+QUsS/3wKBDp2e6+c1mCjdNaHZV68A5Q9WQgun6AANhi4BJrvNYqRDaHgeUY?=
 =?us-ascii?Q?zWB7arVKCYDrOyE4xNI9RoUItWsvvYqHkUYL1OEoTUvjVxqeGRqPpfpBxphC?=
 =?us-ascii?Q?g2H/aNwKw+sspWai/FevjS5a330aFaFyQb7hV9fNqv9IRAHUqeNK2jDP6Trl?=
 =?us-ascii?Q?7xb/lWq8qhN7M3mraoGO4vuGY4TDBPV1tWBcVc7HPLLULaJ64mBxQuOUkR1U?=
 =?us-ascii?Q?3gXC78z7JWw3Xe1nDCSL4+4GJFq/Ke48N9JKg1Lca0hrYnmygG1XJ2S8jGTQ?=
 =?us-ascii?Q?qTDVzLZeW9zxr8TpQb0xe4OoWZijN8Dxgl+tqaDs0r+6w6IwFLsPv3Rk1pxZ?=
 =?us-ascii?Q?BD/DLwg7+6soVvCpttBxmRFv7cfl+arIubAjadiAfrSAPiT1d0dCegKeyj4R?=
 =?us-ascii?Q?tXJHKSbxdJ1qwHzpwNzZj+oTAW05MxiBiDayfC/8A/dz758+i1jxiKibsdKI?=
 =?us-ascii?Q?SJ6/6kJlsc2IkbxeT5G4x495ytt2vT+m3C7CFxZaspRi9VecXMk6LsuODn/C?=
 =?us-ascii?Q?/S9FM+A8qhSyDYW1dDPqdWuUmgz8y9s3a40eAn6wsRgmwKJH8ruTDihAqWW0?=
 =?us-ascii?Q?DSWfiIlLnl7/oIZrmQIQPqNYii3l9sw25UYVKeO7aGeMVVbP+SK6jJ5jXesC?=
 =?us-ascii?Q?QzN/mMfnm5KZ6i/K0oAzWeuQIxyDojHqLFYZpBrcq6Gyd6zbC6kXL1zq5Ox4?=
 =?us-ascii?Q?oHUaqqn2FhCKwR3tBA4VGlUChq9e5Gmj/v5cJDpmjGjMYZ5ekhBr+Zv9sZsm?=
 =?us-ascii?Q?N+wIVDTDi1ZMw6j5ui+a+4sAfAesELOgfmng2y7OB64O8dOMemcVlDPdjqX0?=
 =?us-ascii?Q?bUNpDfroJLU3wqwbXfU+Ak9y9GqEbkkdgOk0FepXccjCauzYee9GGN30YvLa?=
 =?us-ascii?Q?CCHKkiGI2TJvYWQHcUb+cxNHSrE1oDvj1L1q1VPWE9Exfin8wX5QCdbitsv8?=
 =?us-ascii?Q?SAxrjNZRJcrLQykLK0voHtVAja4XAzkHHMrGAwpZmpYrbn7P6Z88LiGEnhtn?=
 =?us-ascii?Q?LkRsjOuWHoCk0dntyLIlC+Anp34MlzL7KiLmswYZ19lMNd4Z53oCrx2JoCOl?=
 =?us-ascii?Q?hJwqXGbEICiJq/NZXSLRFwwwM3Nt6ZjMIrWaIFCFlaFtXm6jAHpsmHz2T3Lm?=
 =?us-ascii?Q?yNjtEY4yb5ZSlAnp3JA1a1UvaX7SekZE+bMfPc2dgF5yZM/UuGqnuP/t1odl?=
 =?us-ascii?Q?BK5bFUMsyo5FNFeKjcT/SQp1ndZau3xkvdRheg77RcRHHjAFhtyqjG+0vgYm?=
 =?us-ascii?Q?TQw0tFtmjHsnEAAJ4dlQD7t9Eoqw+tSMPaUUZc0ICpxr1PT0qPNXxF8cuwc2?=
 =?us-ascii?Q?QChOwgTI868kJmzLkzwKNqkxROizQhHItj40MqN71xDdWpymvHzUCKAR5tTr?=
 =?us-ascii?Q?DqzJ/GKD70KOATGEqK2fvxj7SIvpVdOBv07Y1kFlK87wxRYDJW2Yo4NaBzgj?=
 =?us-ascii?Q?FPUZc0DCO4ugWLjYYJqecrA58Lu21oKY6hg6mwjTcnCGyszyMzMelXxaeUKo?=
 =?us-ascii?Q?3dAc/h/RV9HS79w4qDwH6otJexSZEpTk2ay48ahBcPHO/fQHjp8PWAEj8Z0h?=
 =?us-ascii?Q?vT3ZNL9axoDgffNjqJjQkgY128fKULnFmpU6l/G0AQ/iFUxL+Ng4icSKa7d7?=
 =?us-ascii?Q?uNTuS4/OXOJFHjjtXijlV9hneY01Yx+OAv5mIpQ5EhMD2klDYSPrjTp3NlX6?=
 =?us-ascii?Q?TA2EbaluKQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a94e855b-4608-4600-1d2a-08df1adddf14
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 08:20:34.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiUydbkppZ8kIaaJG138/K0I7KRAO9IHJWSV0vowlkDtF4QzXucLU7m0XQYVJhphGeSmQzoGBodX+KLtfetysJpnrrj2nqdH6EAwqH2oMKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 08:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246607

Changes:

Ahmed S. Darwish (28):
  cyclictest.8: Comment-out SPDX license tag
  cyclictest.8: Synopsis: Remove -U
  cyclictest.8: Synopsis: Remove -w/-W
  cyclictest.8: Synopsis: Remove -y
  cyclictest.8: Synopsis: Remove -h flag
  cyclictest.8: Standardize --verbose paragraph formatting
  cyclictest.8: Remove left-over comments
  cyclictest.8: Align source file to 75 columns
  cyclictest.8: Separate source sections
  cyclictest.8: Capitalize section headers
  cyclictest.8: Synopsis: Fix parameters list rendering
  cyclictest.8: Rework the Synopsis blurb
  cyclictest.8: Synopsis: Distinguish --help mode
  cyclictest.8: Group system-altering options
  cyclictest.8: Group sleep-mechanism (clock) options
  cyclictest.8: Group thread wakeup timing options
  cyclictest.8: Group SMP-related options
  cyclictest.8: Group memory options
  cyclictest.8: Group thread priority options
  cyclictest.8: Group tracing options
  cyclictest.8: Group test duration options
  cyclictest.8: Group output options
  cyclictest.8: Group x86 options
  cyclictest.8: System options: Deprecate --laptop
  cyclictest.8: Options: Expand --default-system description
  cyclictest.8: Options: Reference clock_getres(2)
  cyclictest.8: Add example invocation
  cyclictest.8: Reference rtla-timerlat(1)

Costa Shulyupin (2):
  rt-tests: hwlatdetect: Add timestamp delta
  rt-tests: hwlatdetect: Add --time-format argument

John Kacur (13):
  Makefile: Use relative symlinks for Python scripts
  cyclictest: Simplify auxiliary clock parsing
  rt-tests: README: Remove obsolete -n option from cyclictest examples
  rt-tests: Add SPDX identifiers and fix documentation issues
  rt-tests: Add AGENTS.md guide for AI coding assistants
  pi_stress: Fix inconsistent barrier wait logic to prevent deadlock
  pi_stress: Validate numeric command-line arguments
  pi_stress: Improve error message for permission failures
  pi_stress: Fix error and debug message formatting
  pi_stress: Ensure null-termination of JSON filename
  cyclicdeadline: Fix potential path truncation in open_cpuset()
  rt-tests: rt-migrate-test: Report trace_marker write errno once and
    stop
  rt-tests: Create v2.11

Lukas Beckmann (1):
  cyclictest: fix growing shm stat file

Sebastian Andrzej Siewior (4):
  rt-tests: cyclicdeadline: Remove unused `alloverflows'
  cyclictest: Acquire a lock before invoking pthread_cond_signal()
  cyclictest: Make break_thread_id_lock a PI lock
  cyclictest: Make trigger_lock a PI lock

Suneeth D (1):
  cyclictest: Fix BUILD failure for GCC_VER < 14

Thomas Wei=C3=9Fschuh (Schneider Electric) (6):
  cyclictest: Centralize clock option parsing
  cyclictest: Test the return value of timer_create()
  cyclictest: Fix error error returns for uclibc clock_nanosleep()
    fallback
  cyclictest: Correctly print clock_nanosleep() errors
  cyclictest: Allow symbolic clock names
  cyclictest: Add support for auxiliary clocks

0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
refreshed for 2.11

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 5 +----
 meta/recipes-rt/rt-tests/rt-tests.inc                        | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-=
AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Al=
low-for-CC-and-AR-to-be-overridden.patch
index a39781908ec..3e006a75b19 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-b=
e-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-b=
e-overridden.patch
@@ -1,4 +1,4 @@
-From 7cf4cf097895bd4c3f3d3a6f783c766b3173cf1a Mon Sep 17 00:00:00 2001
+From ac0265695bc1cc70fbe06e6b0bfaf46a4c8f234d Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -28,6 +28,3 @@ index 83d2a33..e757839 100644
 =20
  OBJDIR =3D bld
 =20
---=20
-2.43.0
-
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tes=
ts/rt-tests.inc
index e782d990c8a..a16e524d3fa 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV =3D "40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28"
-PV =3D "2.10"
+SRCREV =3D "62da2befac98f811af8e56f2b7992fb09faa33d6"
+PV =3D "2.11"
 PE =3D "1"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;bran=
ch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}"

