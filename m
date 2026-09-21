Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B756C982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:45:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46445.1789987530237440297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KhQLyPDb;
 spf=pass (domain: est.tech, ip: 40.107.130.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWDIJQqWAU7RuntoDSAJZxNyJ5cAotL1+K5knMyakG8nNotDQwnMndmmtlYylLDvIoXAvu2HBdIO2S5tqUlPvxcUOQyanuyKzuJKrpsEETcQjDr3Sv8rAEHKeBA6AVzAd9vWrlN/2Y8VcmFXC8gk3aYMkdro+gwhB+fxxzWWJPQ7MgaEKQDJc+J9horn+RqwuFQ5rNJZqhcvqmB5dwmzpmTTX3Z3FfJp2Mje7Y0S9oijcLBrkeFhIkn8xMnRzyYOxnPsUrCG01JRbHGsb9VYGpCRnZAAvKNoDZTYN21nafXo7VuXVijJPeZILXOs9Ue6kGbhtypwJTH2zNTwmB8o9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3ohVBnQU8aZB2fG4Ilx0bKJX/zsk6Gvk6fOja6kO7M=;
 b=hS5JhAFuwUtENDMdokhDprhd/iFwXKXgetLfg9ACBvRJS7wJnkY07jz9HWDmsuedsvVob1lXwTqKfZyBEWFEK9BwnDMezp6JP1SIHMkJX0dkY3G7tfL1P9kOOQK4Ff17fD8t+7qMXAHkAS7ZSBpG5e1d4XJN91+fEUcahAWxWyHmhoBzMGF8plTEegatNCfCioFlGeemcFiGjE0Dbf6OH34LZB+ViM9ybT3JpfkNISTZPTWn2kV7DPlkN+cn1aijoyIblf945CBoPtkmMs16LqsnvfhFCvcFVriug+wlye0xfe3kBvlzhN5wZ2zRmbAk9TeOLnQJ8jJ16d9koVStMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3ohVBnQU8aZB2fG4Ilx0bKJX/zsk6Gvk6fOja6kO7M=;
 b=KhQLyPDblh7jkph8p1qwtr06zNCgGj+uYLCNAZT80nd0J41zPSrJz0+6xugufpxIoJEY1FgS9Z579OnSeW/QAT6bV1DzqLnHG8U1Og3uRejHCrjj9L8hkaQwhk+WpAUuQWZtaNPjiQi74qhEIMkT39pTcrZScfXKEHFkOS2QjuI76QelY36ZEq8DHhjVc+3DbUBcxugx/VGf/0xJZRUQqUBmYWv4zag5XLTmAHjd5F/KrowXBwGgf5hlp/dVF1Oxr6tR6yI64PA6e+ZJQLPuX4FL15DKVt/Rzv2ItzYHdzIFo8rIM8ZaEbbBk216hWx1xYdQuDe+fln3D4jI8iLBGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3532.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:506::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:45:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 10:45:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd: fix musl build by providing missing POSIX limits
Date: Mon, 21 Sep 2026 12:45:18 +0200
Message-ID: <20260921104520.47933-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B83.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::611) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3532:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf11ac2-bc6d-4ccb-83a5-08df17cd70ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|13003099007|22082099003|18002099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	8y8NkLcHdp0c7aZv8xyAWmdST0HNar5ckqCfbnk/B15vCaOvIf1Ei9ahVCGANIdlkB5R8OQ1W8DOMGchAKfvxZ2xL+OzZeif26gm/dTAYF3GuJ7Xxd0hGz0GbKqQzv3BPk1bKdbyrfvw+KDlN9kglDCxVKKCR781nP6wrHgUSrZ7wDkOqwdABi1UAhKSX5tB7dg8m++YrnB/NdMrrKWSmAZ5btuwfy6KpLYB4Eccv2AAYFHOxubh6cMVFPy2JvHj/DNswTqKoldtTBSfjWdlauuKMFBENeS/zD0Wkc4pWrlCp9F4Yvm4xHfO37BoteCXZ8eYQsN6SA9PvMX3LzJ7xubPjtfB9iLRd+d2ZIJJPL46XB1/ftr/83r2kDUx2PEMvnLCrZXMsBwDStfTIHqTM3cAFgYusUd2zERCiOc4T4hNjtuPLOOuZU1KB5MVWOmz6cFfwccA5DfMeGdK+LAisec3A0sP/oPHdebtLY6foipP3yv7yfDNTKfwXCUruINsdJccyt/6Zc8nCYeJSOtYrVHSVUjzwL5t6vwW/m/vPo22Tq4qKQ5G/oK4m2KdoY7N4BGM0plp+ja1Jb2XWvomc4OX0S/Fmh+uqFroR2wLBtnqNXncNqtKAxMSSSPJ0S8zoZSNtRQ9KoJxkZQMkZ/WKvH87vXVImuYLCHpMw4Lmas=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(13003099007)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SY7WacGPowoz1NJbZKHaQC/RHMPThJMccvEMa8ldNu5vuu55ZD8QAA0yz3x2?=
 =?us-ascii?Q?k8eqQQI/O+A6RaYkouC2LOcvvBs3d+BBkFfNOok0+u+IGYpPiTvyNBx1uK0B?=
 =?us-ascii?Q?aaQqDT3uRQNm4XoHGCuRq6VBBTF10vcjwU8fQBqsEMkNPoFcBLd3mvQMYCeq?=
 =?us-ascii?Q?me1oy50oEnvt4o7p7pCg9kioJQRTFK83UJBkvUXcj/EbWkMk0DyO2BIGABb7?=
 =?us-ascii?Q?YWvlm1gfu8d9YLePWx9rIGY2CjYH+kU6QH7kVnj40xcJX+rta7yvUtlo5rRN?=
 =?us-ascii?Q?81YyPeTJdbQK7hIqmZydIfdmvb28WCwNY8HaPY+MTImvU/Au7rhRUK8zioZu?=
 =?us-ascii?Q?dr0RRix2fSSMl7VN6nn3vKptOpgjZUBJvWh09t2k8qs+Y5AkQM5baV4N3T6q?=
 =?us-ascii?Q?V6NsFK/tyvzTbCuPHxDBC+xr5AdUEqe1goAQIYJ70JWAv11Dpv3QY+ETjsrb?=
 =?us-ascii?Q?VnA4eXi24CRt8BkCYiAK+1kXIsAlrE9cDgeKOk2sL5cwBIqoh+jcxTM1vyy/?=
 =?us-ascii?Q?mtqeChxCu/BN4jNwfGNJACB1SUvTWOSg3SNe7usfBMRx4YSBHKfuBkppabS+?=
 =?us-ascii?Q?6BWJs1Rq2EQQOqqsDSoJtdUeLHepfPe08HvjBkcDsV7/H7DJDLig5XA8D8Cv?=
 =?us-ascii?Q?iV6+KDJibOzrG5L7pmhuoMjyrqMLmX5HUaiZu72LZtO9WnJrVeJf/Sey4bE5?=
 =?us-ascii?Q?WWmK691u7va6XOdLQyVO9So454P5NAxd2ASsU5Q8z3xkPr16EHwzFfN8Hu/z?=
 =?us-ascii?Q?qBUvPxrJCID4FrVDqgpntBDNV9cAmptpmB8DrZJNE4cGo6Ovyb+DBjkrrQC0?=
 =?us-ascii?Q?1exbHWNF3k6SqDr72XwKxaDCFpFXzsZqRcsuy2ApyoFD+xnqlmIAYMRtWnXc?=
 =?us-ascii?Q?Kd9aj2+DjnxXWgysfsisvkuqQLbeVNs6Gw0E9bzYy9AsNe0y+vdGTHIqH0cv?=
 =?us-ascii?Q?KIhPueZgxj8R5WreKh4gWsJmbjdYMWRmEhhAh23B+FmH2wEcHxiWGywpyE/c?=
 =?us-ascii?Q?hc3XONSbqiZiNHko7TFmgOB9Awo4UrXxvkXFqikqI/87hvGDtpT0UQ7UPBfs?=
 =?us-ascii?Q?T6rIFiWyDX59YhLLm3yEKEGU5BJ0vdwDptd/RfsOVKYMcJPH82gTWUNvITTy?=
 =?us-ascii?Q?ZojKxPmnUP+u9OHT13OYX6sCDX3nmjTpU/22abj4am9GdikcURtxKki4sBlZ?=
 =?us-ascii?Q?N6tMfccKWkCzjGVXf9SW1RSWqqnUFJC8g64CKtbzgShmOmnJmzhrmFVQbz/k?=
 =?us-ascii?Q?2wpw7wRWwdpI04LUm1MkSjDFPz5MkoS+wuRYKML0LNUjhewWTCOPlTMBOOWH?=
 =?us-ascii?Q?YyvRdpPmYb23R3wRVHSm92jMxZ6WtoQd0NOtcu5zOSzdDfj9FjUyw5uxa4g2?=
 =?us-ascii?Q?fykpQHEPDr1RZvxX5FKxMhWPw/uhpVA32LLeeMTWmelS7gseQTk7DQU//3Cn?=
 =?us-ascii?Q?+sapDELDpxUkJrWlJP7ODC+CIpxMZPxmzbyvJPSSLgLA6692TReoEy6cBFxy?=
 =?us-ascii?Q?bPEDAjwUoAy1ZBQ6v6BgYXhboWMdGkqu1s2Z0MrxvlIcT6frqnnie5eFBrdV?=
 =?us-ascii?Q?DjG0g7p/s1xbHPiEwUtcjSwZCuFQ6pGT7ghMeYhbBuJt+ZYe6BvWHKcy3lQw?=
 =?us-ascii?Q?e2uATK8NONj2teLl4LrQoeT0nIlmzSp4gXyLpFjXXtgby3dF++CkwoxDIiQ2?=
 =?us-ascii?Q?DV1VlqBf53bJIXckDDjZczuiHsaB3e+Z07YGgkdrRlGWnS3KTNWSOaw7MQhq?=
 =?us-ascii?Q?sdytf/01XA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf11ac2-bc6d-4ccb-83a5-08df17cd70ef
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:45:24.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FoXb/TZF0dAq+8tGoWbAtZ3Jr0nsG59YvaAu31SYsal7azXu83O760hduvf9wS0gK4sBT7wNq1PzDnXa5mru1pVO4xcxTSlmbGzzbctArUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246323

systemd's src/include/musl/limits.h override sits first on the include path
and relies on '#include_next <limits.h>' to pull in the C library's
definitions. Because <limits.h> is a compiler-provided fixed header (with a
two-pass '#include_next' guarded by _GCC_LIMITS_H_), the override overshoot=
s
musl's <limits.h> and its feature-guarded POSIX limits (PATH_MAX, NAME_MAX,
HOST_NAME_MAX, IOV_MAX, LINE_MAX, PIPE_BUF, PTHREAD_STACK_MIN, SSIZE_MAX, .=
..)
are never defined, so every musl build (-Dlibc=3Dmusl) fails to compile.

Add a patch to the override defining the POSIX limits systemd references wi=
th
musl's canonical values, each #ifndef-guarded so glibc is unaffected. Appli=
ed
for libc-musl only.

Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/43824]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...X-limits-missing-from-limits.h-overr.patch | 92 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_261.3.bb    |  6 ++
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-musl-define-POSI=
X-limits-missing-from-limits.h-overr.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-musl-define-POSIX-limit=
s-missing-from-limits.h-overr.patch b/meta/recipes-core/systemd/systemd/000=
1-musl-define-POSIX-limits-missing-from-limits.h-overr.patch
new file mode 100644
index 00000000000..3ebe9885e35
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-musl-define-POSIX-limits-missi=
ng-from-limits.h-overr.patch
@@ -0,0 +1,92 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Mon, 21 Sep 2026 10:24:40 +0000
+Subject: [PATCH] musl: define POSIX limits missing from limits.h override
+
+src/include/musl/limits.h sits first on the include path (-isystem
+src/include/musl) and, like the sibling overrides, relies on
+'#include_next <limits.h>' to pull in the C library's definitions. This
+works for <stdlib.h>, <string.h>, etc., but not for <limits.h>: the compil=
er
+ships its own <limits.h>, which reaches the C library header via a two-pas=
s
+'#include_next' guarded by _GCC_LIMITS_H_. With this override in the first
+search-path slot, that chain overshoots musl's <limits.h> and never includ=
es
+it, so musl's feature-guarded POSIX limits are missing and every musl buil=
d
+(-Dlibc=3Dmusl) fails, e.g. 'NAME_MAX'/'PATH_MAX'/'SSIZE_MAX' undeclared.
+
+Reordering the -isystem paths does not help, since <limits.h> is a
+compiler-provided fixed header. Define the POSIX limits systemd references=
,
+using musl's canonical values from its include/limits.h, each #ifndef-guar=
ded
+so glibc and toolchains that do reach musl's <limits.h> are unaffected.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/43824]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/include/musl/limits.h | 52 +++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 50 insertions(+), 2 deletions(-)
+
+diff --git a/src/include/musl/limits.h b/src/include/musl/limits.h
+index 9620a3b0acc..48fe0c68e89 100644
+--- a/src/include/musl/limits.h
++++ b/src/include/musl/limits.h
+@@ -6,11 +6,59 @@
+ #include <assert.h>
+ #include <sys/types.h>
+=20
++/* When this override is first on the include search path (-isystem
++ * src/include/musl), '#include_next <limits.h>' reaches the compiler's o=
wn
++ * <limits.h>, which uses a two-pass '#include_next' sequence (guarded by
++ * _GCC_LIMITS_H_ via <syslimits.h>) to pull in the C library's <limits.h=
>.
++ * With this override occupying the first search-path slot, its own
++ * '#include_next' shifts the position the compiler's second-pass
++ * '#include_next' resolves from, so the chain overshoots musl's <limits.=
h>
++ * and never includes it. The POSIX limits musl defines in its
++ * feature-test-macro guarded section are therefore missing. This differs
++ * from the sibling overrides in this directory (e.g. <stdlib.h>, <string=
.h>)
++ * because the compiler ships its own <limits.h> but not those; reorderin=
g
++ * the -isystem paths does not help.
++ *
++ * Provide the POSIX limits systemd relies on, using musl's canonical val=
ues
++ * (see musl's include/limits.h). Each is #ifndef-guarded so glibc, and a=
ny
++ * toolchain whose '#include_next' does reach musl's <limits.h>, are
++ * unaffected. */
++#ifndef NAME_MAX
++#  define NAME_MAX 255
++#endif
++#ifndef PATH_MAX
++#  define PATH_MAX 4096
++#endif
++#ifndef HOST_NAME_MAX
++#  define HOST_NAME_MAX 255
++#endif
++#ifndef LINE_MAX
++#  define LINE_MAX 4096
++#endif
++#ifndef IOV_MAX
++#  define IOV_MAX 1024
++#endif
++#ifndef PIPE_BUF
++#  define PIPE_BUF 4096
++#endif
++#ifndef PTHREAD_STACK_MIN
++#  define PTHREAD_STACK_MIN 2048
++#endif
++#ifndef _POSIX_PATH_MAX
++#  define _POSIX_PATH_MAX 256
++#endif
++#ifndef _POSIX_TZNAME_MAX
++#  define _POSIX_TZNAME_MAX 6
++#endif
++
+ /* musl defines SSIZE_MAX as LONG_MAX, so its type is always long. Howeve=
r, on 32-bit architectures, musl
+  * defines ssize_t as int. Strictly speaking, this is not a bug in musl. =
POSIX only requires SSIZE_MAX to
+  * evaluate to the maximum value representable by ssize_t; it does not re=
quire SSIZE_MAX itself to have type
+  * ssize_t. However, our code assumes that SSIZE_MAX has type ssize_t, as=
 is the case with glibc. Cast the
+- * value explicitly so that SSIZE_MAX has type ssize_t. */
++ * value explicitly so that SSIZE_MAX has type ssize_t. The assert is gua=
rded because SSIZE_MAX is only
++ * visible when <limits.h> actually supplied it (see above). */
++#ifdef SSIZE_MAX
+ static_assert(SSIZE_MAX =3D=3D LONG_MAX, "");
+-#undef SSIZE_MAX
++#  undef SSIZE_MAX
++#endif
+ #define SSIZE_MAX ((ssize_t) LONG_MAX)
diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core=
/systemd/systemd_261.3.bb
index 1a256a598a8..9413bd7f46e 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -38,6 +38,12 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0003-Do-not-create-var-log-README.patch \
            "
=20
+# systemd's src/include/musl/limits.h override sits first on the include p=
ath
+# and relies on '#include_next <limits.h>', but the compiler's own two-pas=
s
+# limits.h consumes that chain so musl's POSIX limits (PATH_MAX, NAME_MAX,
+# HOST_NAME_MAX, SSIZE_MAX, ...) are never defined, breaking every musl bu=
ild.
+SRC_URI:append:libc-musl =3D " file://0001-musl-define-POSIX-limits-missin=
g-from-limits.h-overr.patch"
+
 PAM_PLUGINS =3D " \
     pam-plugin-unix \
     pam-plugin-loginuid \

