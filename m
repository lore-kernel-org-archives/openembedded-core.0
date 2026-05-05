Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE4ECD3436
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 10:45:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36257.1777977921874876221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 03:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=P5zABAxM;
 spf=pass (domain: est.tech, ip: 52.101.84.30, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xs2JJrbFdY4mWeUzSEBECupmZs+NCb0rPZl+aF3Wy4FP+8HrjVH0XdO+eura877CP+aiw0YoiOjFFwNaqrOGQz6Ga0C8tS3tHUaCCeZVzDTXcob7YjUbGetJvmmZbdRDDIATNNUaFFPEBsBIXrG5/Ddel3OdSb1t+p40HNRccQVtSiuEfIOGoIcf3SlKIDJtp6dy2OuvFMB31Ji6/z+y5FxcnxwMeVj1KcAZBgBebGE4bTaXkFfU9th+n63g9BDCo1U20ayLHD2sZR2h0gcJtJVJZCUr9jTySdywkgtcmKEYSsGcFuVnEoMex4S02pbw5KcZH7rbeostsAeOS1wKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98bnVSIh6//g6tjxiUD7vxtVIhDv1XXWLLkdazt4wRs=;
 b=acZ02Ya+ba/0RgU3B2aQQYIxRuL1o/RdBnNzTsZeo6qO9I+T8XLz7GlrMIMkFMI1ZjAvAsDt0LWp4c7ATuCKZI++ENpeBGFxlDh7bStJZWoA3CmG1mzI6+sj8C5DufcpN3EWPjcq274rlCVgspKfi35r9+S/p1W1OBA/MzsuxiY9iQynb53j/ufj9fF9fTfLNlYf6tWSOZWrjzW6Oyn+6meNCgI4qY6DXlWKMnqd89ylQeED1rLIcdyIZVC1vinJkyqdRf2AYYYe8kgoI3bOC/SrNZjB3QiXYH/tUFlOBe5WFMV8qTQeHovZgE2zQ9quYzevovkGiDlY8TpFlLzVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98bnVSIh6//g6tjxiUD7vxtVIhDv1XXWLLkdazt4wRs=;
 b=P5zABAxMJSxfikvnnfve0Du6GDH3yrAux1WPUvUgE51y6KEnGgdEqivcapNnJogpytjHBN78jOFJIY3Ys1ruNOoWy6dZ3x9/e7ReqQoqqojMC8i4fyJE8PPV9TOHODcYbNdsh1G6AqgQQdKKOV7L0dhDpAG9gW022KZoXQOeWeDOEHku6AmZPDhc2/abUSKa74rjxGZvwVoqy1iJkCQV6HU0Cjeret6k7lY4vWSDINxPNOeZFTPkxRdaQEmx+BUprUb6D8TkTOpGPLqqVjL0vUvKED6X7266ZjSzmjOUtVszEt6W6gVdvz9JHlIMiPoHbYAUNm+l+DySxAutVTE4gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM0P189MB0659.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 10:45:18 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:45:18 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] liburcu: add ptest support
Date: Tue,  5 May 2026 12:45:12 +0200
Message-ID: <20260505104512.62425-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0336.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::21) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AM0P189MB0659:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0da16e-a77f-4f5c-6d85-08deaa9365ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|18002099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	xumWvxDONt+h2xnplaJW8A43dQ0peReXPGPGrnw6sTfuDTBK03Z10QeZXuZZxXqDqv+8BRSalKPgykroWO82nqjwUaRy1uHBJ+PJzrTvs59+5LWVlK41e3X2BkqDKirL0sOKFNZqCcvSgqs5HQTZ8vxvOxLkU/pvev3tuXTlpxSoeGnVGHvCKqiQjkblDcpZO3FwwLrAK6hL0Q028whwZHA4gO8UfgaO4ZnFN5PBHMPApbeyQqM6+CB8ufJC7ZL4bvhu9c/yvjeXMj2SrjkVYhWAvuDPHa/s4GytiC002zmjHpibV/1a4EIxuZNSfMeFMfcXR84BAI8w7Q7pkdWLnFIPx1f3EG5utMYowlkHZunFtiUlav5RyDm9G5k93uqACpTWmTV9P1YgjaU44yhZhgGvc9EiFKZjbVLxYZOGDub8m4McKX2fcaxTXBAus5+jfQ/xqqyngh05J8k50biblgjXpDXRCoWd5JlRimFkvmeYDC30E4S2vMHKBt+DjVSJTku3bn70LY8hfZWGIT2pEk78MwEdp5s1ik5q2q0YmL0H6fRDv5lPEhMnPCTB5U0VyWhiqk4z7tGpHuPdzrxYEGFqbBQeDtkwCsntXV+APtI1tarajSlFBf2/l7aXSwCA4YX+IQkUlrw5lZnoiAibhzWKqsuigJDIJIEAe3U45nLnIhlUpw7IV1G17IyJRzCx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(18002099003)(56012099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WwoQAzn18QTT+LQ2XRDoVqS8j8CfbW2usSztSbvBVsoAcjUEWTI5D25iEDrZ?=
 =?us-ascii?Q?d/12m/96BdZW5g4TSkvUUn1L3jiUBNNUtvYo62iyDivjtEjOlLwF4XIigcJ2?=
 =?us-ascii?Q?Y9mk8d78oadccY5dp8ZU9s/u3ABf3crwcrtNkK8BKSlx6BSkNl4z9qPWRT3j?=
 =?us-ascii?Q?9mPAI9714Reap9h+7Z2limE6F0k2nG3pqS4oRxjkLzLxF3c2TjmKNcPzwfI3?=
 =?us-ascii?Q?a0Y3RsH0VSM0xXarBPmI7IfcP6OamJ7z/hBM9u1GCMkZ+lFaX6fu6ZIj1bp2?=
 =?us-ascii?Q?BOrIfBS0Ux0EC2rZ8PrKFRmPvoZEA5TzRxEKbO3wS85nowOc410tc+CFx6Qt?=
 =?us-ascii?Q?FMEgogf67JF+zGAshkE/TNnhQKpR87mdHc4WSch+m1xyirdxLklVS+tdTry9?=
 =?us-ascii?Q?zE71yKw8EkBrwgkntu91iathD+qSTSOQi31oIFzOstnWurkmwwmK98rMpOw+?=
 =?us-ascii?Q?2j5y5r0QOzdXF1l4T0pvt7eem1kjZVpGN+KHIdYPhzTy5ZSm1ODtYN2e3uM+?=
 =?us-ascii?Q?mNv1kSHnXGv8aNO7zXs9SDaLllvp6NzwrzJJkAnJx8530MZv7RJQRtIrclpH?=
 =?us-ascii?Q?ZR+Q4IytqEM/xqmI+GCXbXmGDSPQEjDHyIr5A6RcfzB0tN5s82ZIjFXhVRze?=
 =?us-ascii?Q?Q8YRUHTip0JfqGnpuzj2/m3MjZbFgrSlIXR7A86hDbGeJO8zSuTdDXt5fq6j?=
 =?us-ascii?Q?2bXR0D/+SFPur+a4kggdcwPm+CdOa17Ttnov/0Kr+IixEKcbDMSpB36z2wPg?=
 =?us-ascii?Q?kIxf+JWgj+PGFec8EPEeazzh6l6lehwiTt26GvMsSWuVZlafkd2ov/pSYFKe?=
 =?us-ascii?Q?bRuNCTxCaJvmCmW0cLPgelCMQL5jATZ+ai5Sacc65U9wP5qzvonPzC5mrkFT?=
 =?us-ascii?Q?kkDQkKC1LcefeXg96Aw0ESfBW8+9hxHxH/5wK2WItr0thSNSie+A3quBB+KG?=
 =?us-ascii?Q?XOKLs1Xi8Ro694aqspnb9CihNnTi6aDTWPKFKpLvx/GWZ7amf8QtrWGLAw6R?=
 =?us-ascii?Q?E27AVsiSUw1bo+E6JvmZXXDfViqioXSEjZvVImWDs1hYQ3URWt42dHnMoPqL?=
 =?us-ascii?Q?SGFm6cxHNRPyWErqG+nr65yb93H/S0v8Q/G4ko7AaqmYeH4kyJ54uzqXUtps?=
 =?us-ascii?Q?z1vhr81WM8KGVTOcwvmH4RNT3H4GoEaW1nloYIr2qS8yemamHzhfzQTP5i+k?=
 =?us-ascii?Q?8V9iWc4LmXmtOTprZFQlZl9EERDJwr44rwF1sI9qExXWrxMR9gNXhGEAo94d?=
 =?us-ascii?Q?MqPUQWvJ1d+C5vn014afChBIq6nU3+Wo8sQvHKNMb7DyhxHkAf0lDOVSIq6X?=
 =?us-ascii?Q?WOQ4ngaH3tlKa7G3u7xTqatXCz897eRug2ikZClBZQji8WAE3EYDeuFvL0rq?=
 =?us-ascii?Q?JFaci7w+qHoBuxsoNfC7IpzUkGyWY9El0S/yj9jZv02sH3CDJ0rvUuZmk4dD?=
 =?us-ascii?Q?frcltQVNEnLvCIytpIWmDNJofqiWFF4S770ZP7rEiBPBQU9zfvcjpmuIC7Od?=
 =?us-ascii?Q?VSUrpl7p6+y7iyz+owVRqsvQz9JHEO7Fx6gI3qRZaqLINufpE5aG3JS9Jln7?=
 =?us-ascii?Q?4IMEGZy5spaLzaPA5M6ZOZDKE83qPnktDy5qRgLxrqW2xrvmSeFw6jbdyejo?=
 =?us-ascii?Q?cntsFLK+/NVNdFlCOH40Xkgr5aUwciIM33bgfTaYm2/E9o9adqg6t4uwHjYf?=
 =?us-ascii?Q?ZFYkMnbhAs9Ei+ZHusp3UKjsCiIMwJiT7hb6Ho34NoBxf5xNBEvgBnjLn4de?=
 =?us-ascii?Q?c/da1cnGrw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0da16e-a77f-4f5c-6d85-08deaa9365ad
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:45:17.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCK0lllzhTimwH09MQtFWlC386golvw7d7caSH4m1m0u+mbJiNa/zX29401PwtxLZxV9adPT24592lKPQRutgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236481

Add ptest support for liburcu, running the upstream unit test suite
(674 TAP assertions across 24 tests). This covers architecture checks,
atomic operations, multiflavor builds, sysfs helpers, and build
verification tests.

Tested on qemux86-64 with ptest-runner: 24 PASS, 0 FAIL.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/liburcu/liburcu/run-ptest | 17 +++++++++++
 .../recipes-support/liburcu/liburcu_0.15.6.bb | 30 +++++++++++++++++--
 3 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/liburcu/liburcu/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 50b6a8a41e..ed89f9dc76 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -48,6 +48,7 @@ PTESTS_FAST =3D "\
     libtest-warnings-perl \
     libtimedate-perl \
     libtry-tiny-perl \
+    liburcu \
     libusb1 \
     libxml-namespacesupport-perl \
     libxml-parser-perl \
diff --git a/meta/recipes-support/liburcu/liburcu/run-ptest b/meta/recipes-=
support/liburcu/liburcu/run-ptest
new file mode 100755
index 0000000000..5f8fb4fcfe
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+PTEST_PATH=3D$(dirname "$0")
+cd "$PTEST_PATH/tests/unit" || exit 1
+
+export URCU_TESTS_SRCDIR=3D"$PTEST_PATH/tests"
+export URCU_TESTS_BUILDDIR=3D"$PTEST_PATH/tests"
+export URCU_TESTS_OS_TYPE=3D"linux"
+
+for test in $(find . -maxdepth 1 -type f -executable -name "test_*" | sort=
); do
+    testname=3D$(basename "$test")
+    if ./"$test"; then
+        echo "PASS: $testname"
+    else
+        echo "FAIL: $testname"
+    fi
+done
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.6.bb b/meta/recipes-=
support/liburcu/liburcu_0.15.6.bb
index 1cb349f55d..e02f797041 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.6.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
@@ -11,15 +11,41 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dc2a92498b=
6e88e276f986877995425b8 \
                     file://include/urcu/uatomic/x86.h;beginline=3D1;endlin=
e=3D6;md5=3D358d69272ba7b5f85e29e342430d440c \
                     "
=20
-SRC_URI =3D "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+SRC_URI =3D "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://run-ptest \
+           "
=20
 SRC_URI[sha256sum] =3D "850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e=
3986908bac414f"
=20
 S =3D "${UNPACKDIR}/userspace-rcu-${PV}"
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
=20
 CPPFLAGS:append:riscv64  =3D " -pthread -D_REENTRANT"
=20
+RDEPENDS:${PN}-ptest +=3D "bash"
+
 do_install:append() {
     oe_multilib_header urcu/config.h
 }
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests/unit check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/unit
+
+    find ${B}/tests/unit -maxdepth 1 -type f -executable \
+        ! -name "*.la" | while read -r t; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 "$t" ${D}${PTEST_PAT=
H}/tests/unit/
+    done
+
+    install -m 0755 ${S}/tests/unit/test_get_cpu_mask_from_sysfs ${D}${PTE=
ST_PATH}/tests/unit/
+    install -m 0755 ${S}/tests/unit/test_get_cpu_mask_from_sysfs_cxx ${D}$=
{PTEST_PATH}/tests/unit/
+    install -m 0755 ${S}/tests/unit/test_get_max_cpuid_from_sysfs ${D}${PT=
EST_PATH}/tests/unit/
+    install -m 0755 ${S}/tests/unit/test_get_max_cpuid_from_sysfs_cxx ${D}=
${PTEST_PATH}/tests/unit/
+
+    install -d ${D}${PTEST_PATH}/tests/utils
+    install -m 0644 ${S}/tests/utils/tap.sh ${D}${PTEST_PATH}/tests/utils/
+    install -m 0644 ${S}/tests/utils/utils.sh ${D}${PTEST_PATH}/tests/util=
s/
+}
--=20
2.44.1


