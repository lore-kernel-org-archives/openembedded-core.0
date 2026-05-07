Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE00CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 08:52:54 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7582.1778143971446994052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 01:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=m4Xv7KFk;
 spf=pass (domain: est.tech, ip: 40.107.130.29, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOu4BOa4STIVGKL9DW74B6AS1hzVCoAiOY5kIXYkyqWJqkPLskz99tEGQlJVx5j7lcgr8WImUFFqaRjXMagjLJmCAHUKfNxGmKCrUXfc36v+bzv5wMbwxmgdfhjXSE4+jE1dqBk/iI4zYu3pk/L3h5QeHHQr5w6qMWp0e8XOV2Zqn82IN75NCb/GH3ASyK8YKIwVxNVSYJ009oV2iTeUZVCX2fGWJgD4oy9hjKgMRcWRdv0m1g6p0rbhlg1Lb0JQ0sPSNpSzf8E6vrvW0Qc21W2/y6q1hKM8ucEe2gKnVjOM/3GvWNTAnlz9vPr3dAYu0pLreF5R6lrUJ0v6U8H9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEchNpUtRTSsGgNtGpQuPzRGmQDQXdn8DIsntLpFeUg=;
 b=SxUMYnxYwJHTmjFWweKQMOCVjHaXxiQf9ohWD77oemGOch3exGptU/15M9oYbAWsEAHcsV5jRzK8R2L9Ptg8miVc0t0xZL4DYjySqbO2VZtjrvRyIjN6Gc+bskCEwMdeRet9W8gIzm6fQ7pyHnKHwdvByVHSc2L/+OF3jzSyyKzzJuvOXITBhLH85CtFzWMlLYYQhOrqN29cs5Rb/grVZ9CLCLxsBkeMAIvsG7+64i9y8Wi71mKq5B1DnAKPn0WuZbZqXta3Ee5iUHRmVeDAbzEdX8RI1ICXpp0q0WMhrB68frPUF2oNpkmwUAyNDlQGn3fjRHcDoXIHIFyP1FGuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEchNpUtRTSsGgNtGpQuPzRGmQDQXdn8DIsntLpFeUg=;
 b=m4Xv7KFkzpVl/5i2Dwz+EYvF5Zysw1I6rXOGsQ9Qh5w/f2gGZ5HcdvsmAP9WmJYCcoy7LfGRyzu421gHGPltLxKY9p2EhCvMZRdDqbSKWQpKzCRCl15lAOavnITL7vlFWhpqSFOdYTEmhjqWeTT+3S8FvMhZyUS5ECsg/zBihp5L9I38lbWKKxwQPwjIJumrmOiMd1cIEDm0rPE9KlsaNc1pxD9bflBiPgtmLKm4iNw5QvbD4FL6T31bo6TK7a2EsPm+QJ6iujp9pYZklPhyL+apjLowlplbdaBAwMFg6llqZpvYBvuddwS4CQrUbCZBU7PDIGAYy/yn00DbiiL7ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB3229.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 08:52:47 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 08:52:47 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libffi: add ptest support
Date: Thu,  7 May 2026 10:52:42 +0200
Message-ID: <20260507085242.39646-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU0P189MB3229:EE_
X-MS-Office365-Filtering-Correlation-Id: 906325a2-2740-4b73-e98a-08deac1602c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0yhmdDxAbbieDbryMrRYleNXqpBog4Kn9gB9g6O7Rw4sxB7SI2FtgrKtXxfrzrkO8rAB3vIq6vB9ZMztywfcwNvfG/WjgTq5EYdvTPqmnn6Ab4FeEmcZm9Av1gObf/zaMq14IZGsAYaozabfpwD177YLub7qQ36pZcrS610viZ1gLMasG9fci1si3QLRe4KoW1kyPQC/VIu1Q566UWpJfImFd95EQkxcxEEhzO2k4q0Zu/ZnQ8JJDZ2V+Nu0n0GOxYzIX2a8RBDN/HaG8ueE+7/LRD7uAuDHzTxvcwWTk+ktErbqDRnHvKnqf8C2tJGC1gXKUp1VMbMeHzEOC2dydaft72ZaT2jIXHcA2SPtzP5G1iVd8P6ujNY/RenetJmlyEB+EDGAK+cUr1O+35+4aAf+JMWfRfWfGt0tbCKbFC1rv52Zo6LnOobewxw9iap9d/2C36EURwbYm1ZYN0/TMq1flNckl3Ov2+pWO+/iZeArEfFlTQVn9fwDWqPw8o3ztJerMijmxKi4nA4jWnztwadtKWxfGw8v7detFLDoTWD+v8J3/cMa7wMTJEilTp2P9BBjyQWaaMgn/R0aXEENp+10ZTQ+h9y4JqFblQ6fqTMxs27zWcM3HiKF0wtxMruTqFtKaoWO0Rih0Nc6gAIVmdUHdAEoPMdArLGz6C9yu4AZMkqf1XAqf0GIWdyAbzqc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hNccKrJLB2CcsQoYJmo5SwfOkgaVlcDlIXZ+kmwl1yNx491bz1iBcy02rFz0?=
 =?us-ascii?Q?H9gmC9zUTlNiInP1nMX5WHE8W4POP7Avy+80jMr3d5wjJUru9fGvCirryC9x?=
 =?us-ascii?Q?B6hcF1lSMwydVyizza7zHlQoNi7TYo6mnTCxwozFEwztv2+KoYSUijDw6oKt?=
 =?us-ascii?Q?t7qUYuG0LJYv9DN2QHULdC7sP0IoZ+y1m9xKWBqC2+g9M1ZrKhbskRBHaxT+?=
 =?us-ascii?Q?NhqPJk2PecXOOGLd/CTQiYd9G7Cyaoy74J1+JZMpcKsKVzDpBaC9erpmskwY?=
 =?us-ascii?Q?aPzgBXyRSKSaZ6jCTzFL2c1zL0//6GmzM2tMqqveFtep54uU5oXDcWbYvKE2?=
 =?us-ascii?Q?8cpNU67rqmii70P1XrwUwaAu/3W9ubF8vbHxdYWERxFABkd2DOw7R7C17FL2?=
 =?us-ascii?Q?XGBsjDygtigCPyjWsTm2zr9nqanbmorgJGuGT/m624Kv27sGbdFiJxyRFN68?=
 =?us-ascii?Q?w4PLBTEvtbr8gE22LEtq5lUbIzaNxnrdPcZ0AN2cFjj4ikbgYyYiCBuOcykw?=
 =?us-ascii?Q?EAzp8ajXdOSMVypQw41hQUb5hNzqYCjQbIw0VSU5vKfgvIKiUKsQMVrZ5zzk?=
 =?us-ascii?Q?/AZ6ix/qJi9wB2zazoTg3NPL9C+KhFHYoFihb9eOMBQe6CrEtHfKRgA9+KOp?=
 =?us-ascii?Q?qurw1p1YnMLaYoNpwaWXmh1vUJBgOXyUxvOS1XASBh1kFbFTPS5+e3DEeA5b?=
 =?us-ascii?Q?iQcbCV2xz5Qn+rLE0cOXm0u0Z1rSnmo/v9gXv5CYY/wDtXnGQHuQcLj4vr/0?=
 =?us-ascii?Q?lvaYaOlpID/eAPW0UferJwSRNt6+rLm3S/2mH0ztdcDBKILq6wLmFoYZOQNV?=
 =?us-ascii?Q?TylgHszXxEnmd9tKPplmrUnL1A5sq+esCMO1E1jzJx8rzLGjseZtHZHWJTXc?=
 =?us-ascii?Q?0lj0AqLbCbruZLO8nlG8IWDTd6OCT9VSk0/xxsq6n2as3lJZXc7u4w0sMIEq?=
 =?us-ascii?Q?/4AGm2WhqUf8Urs/1ivIeQlmUs/MUa9pKczSarOGPVUjQ8qJd0lm3CYiQgaw?=
 =?us-ascii?Q?8WTnFiEwYmUxHYE6kr0+m29afEyf7+XVgchwubonfgn8D5XbdgKNuxyv/Fzs?=
 =?us-ascii?Q?9y3Wf8EI60m8Yf8NNg4pxPOy0rnRzGBWa3nn8paxgo8BTVk944En7ClPZIzv?=
 =?us-ascii?Q?utIMwOLHRVxTP7zuu2b1LiKAClOxj5tzIBigT168b3RdZ3DAN9aOKMmj2UHo?=
 =?us-ascii?Q?+hKrHHNgsY90+KrCq3VGGPNkZvvuP2h12SD6waWv6uzJfb0G3aCJns8ztl2K?=
 =?us-ascii?Q?0GimEz2lH5urd76ySF7FPh4nBquzF4GSl9xHqImLksRlvIVYEmqdGTefz56x?=
 =?us-ascii?Q?1xYXzQrEDWOAiA6KnbAEGzRrNiDycKsz6Xqyfqi6/qj5UhizrNYLgdL0kDne?=
 =?us-ascii?Q?paZ1lu+ZSalpb+4W3Xy6fVBuQyunPSy/HM8IGvQe45CYC+DfvlnCuePEonpH?=
 =?us-ascii?Q?LmkO2qekSJegvJoqPEYZHd8KSfvnSerGeq2ijPpCzNBSZ1ByNCJsNDOgsGx3?=
 =?us-ascii?Q?EzqZ0BpitTr3kdEBOtzljA4/rl31fa04iTVszmfCHDs3fOiaAo1PXGW4Zlif?=
 =?us-ascii?Q?mDOyiyh6G+AXhJkndI2Vl9PeKKWGIcUxmVwFzyMRSlEahWEigaM0PzZQkf8O?=
 =?us-ascii?Q?bj8KPuwhgZxFiDRcCkfH45mVdxLfozg/02Lc8R6vAq2p6B/iuE1gPqokjBSA?=
 =?us-ascii?Q?/mC8iZgbXh6IgSOdUVV4Ut0RW2msVExn02/Akx9FnE1Bo0+6hiskGqmuchob?=
 =?us-ascii?Q?xdaHt9uUEg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 906325a2-2740-4b73-e98a-08deac1602c8
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:52:47.1288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: julxvqG7JwfUaYOUiz3yPPwnQPqj1IKaEvfEFszufFX5vosipiifraZ8mhWeYz+v/Ui1rYpr6Bs2n3Foz/nQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3229
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 08:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236567

Add ptest support for libffi using the upstream bhaible test suite which
validates FFI call and callback interfaces across various calling
conventions and data types.

Tests are compiled on-target against the installed libffi. Headers and a
linker symlink are installed in the ptest directory to avoid depending on
libffi-dev.

Tested on qemux86-64 with ptest-runner: 2 PASS, 0 FAIL (29s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-support/libffi/libffi/run-ptest    | 16 ++++++++++++++++
 meta/recipes-support/libffi/libffi_3.5.2.bb     | 16 +++++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/libffi/libffi/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 566445187d..0918507ce5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -36,6 +36,7 @@ PTESTS_FAST =3D "\
     libconfig \
     libconvert-asn1-perl \
     libexif \
+    libffi \
     libgpg-error\
     libksba \
     libmd \
diff --git a/meta/recipes-support/libffi/libffi/run-ptest b/meta/recipes-su=
pport/libffi/libffi/run-ptest
new file mode 100755
index 0000000000..9617977b00
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
+cd "$PTEST_DIR/testsuite/libffi.bhaible" || exit 1
+
+for test in test-call test-callback; do
+    gcc -O2 -Wall -I$PTEST_DIR/include -L$PTEST_DIR/lib -o $test $test.c -=
lffi
+    if ./$test > $test.out 2>&1 && ! LC_ALL=3DC uniq -u < $test.out | grep=
 -q .; then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+        LC_ALL=3DC uniq -u < $test.out 2>/dev/null
+    fi
+    rm -f $test $test.out
+done
diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-sup=
port/libffi/libffi_3.5.2.bb
index d3aa90d429..719c46865a 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dce4763670c5b77=
56000561f9af1ab178"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52=
e335676bac82dc"
=20
@@ -19,7 +20,7 @@ EXTRA_OECONF =3D "--disable-builddir"
 EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
 EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
=20
-inherit autotools texinfo multilib_header github-releases
+inherit autotools texinfo multilib_header github-releases ptest
=20
 do_install:append() {
 	oe_multilib_header ffi.h ffitarget.h
@@ -30,3 +31,16 @@ do_install:append() {
 MIPS_INSTRUCTION_SET =3D "mips"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:${PN}-ptest +=3D "packagegroup-core-buildessential"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/testsuite
+    cp -r ${S}/testsuite/libffi.bhaible ${D}${PTEST_PATH}/testsuite/
+
+    install -d ${D}${PTEST_PATH}/include
+    install -m 0644 ${B}/include/ffi.h ${D}${PTEST_PATH}/include/
+    install -m 0644 ${B}/include/ffitarget.h ${D}${PTEST_PATH}/include/
+    install -d ${D}${PTEST_PATH}/lib
+    ln -sf ${libdir}/libffi.so.8 ${D}${PTEST_PATH}/lib/libffi.so
+}
--=20
2.34.1


