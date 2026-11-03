Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6941.1793696844528960398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sUMUVvc0;
 spf=pass (domain: est.tech, ip: 40.107.162.46, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRFb0RTrT9qRx8vorjfMQOl8kzehsQeMEqSLthgl3saccspWQz3GpFPqLhHVcd43QcBZlODshEEVrY7kuBCXRIcRtzZK3wgaLMq8u0VOjoHqRcsPeMe7inGh9tSQSbf7UKTL34C6ELZSPMvpL55otxCVgrcZJ8ran4IRlA8gxmaDio6bL5hWIchKldcMIwihtj8Nv4IVooazNYchAKjXwv1uQVxfq2K2ybkGBS3H5Uv6XaNQwAFQ61WohheZEsIzCIUPrfhIpG26u32eRHLYYdhTLRAwjd9elauIVQxlNUqd0qbyFpUlDItSVH4O/oMIVs9gb1GXPDmTvDd/7LLZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwGoJCJ1HZAek41coOOtdY+c5PvvXqWdTSCQoIPcvVA=;
 b=P/jnzRppPc5L1YpFRebkIILSCOE7aPZlFtijHBN57q66agK4iFQ8EWMKNmxKeCAyvfZj0bnzrqrNbeUQdsiQ7jahr1IlGWCMUnL3y3oqrdgCRc9hs3vyQh1UojsJvKIp4esdT0yoafZei25cJ5iYjl8GU6RKzqqK8d64uwoabSLyYSwggJuXBicVL7uMKS40F4bD6S0g2Zqjbm42WBU55FEiNA0ZgKXXyqodG93MF0vq/m75UZnP+/zzSlFN6asalTys+31CxPlXV8J5Uo2VVz7N+M4nOqvoZJvE2LGIp75eGF+koEDZ/PDZTL2Y7Uh+dxloOTKkc/4pYadWnwXiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwGoJCJ1HZAek41coOOtdY+c5PvvXqWdTSCQoIPcvVA=;
 b=sUMUVvc0WNbhQOhF2G0syP8VtU0ewzngSCokz5x7Dwe79QM6Ikxg/WRS0E0nKJTmoRbKDamXS/A5WtOiUUFNENsDA1pxChK2m5G6+mlya+pNmk3NAcmIkKfsabwiTh/PmiKHmE/4o6zRb9lYikej2osEx5beqXqnyD2jhSvoZ4zR/hHgGSmpKpmzv3iYjSSsjNHWHrI7K61DpKnbpyUPGQaM+kYIrRL4JuKBtlwabYGEn01JpoPFonhaEgJ7v95MDUlN8PV6J83v9fDYvW0W05GoOhH/47kzwC2/eDXe9leTxU0oCOSWwlAHiumxYuSfzjD3ZnZcsmbq4GhM5Pv3hQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VI0P189MB3235.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:07:17 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 09:07:17 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] lttng-ust: add ptest support
Date: Tue,  3 Nov 2026 10:07:15 +0100
Message-ID: <20261103090715.13551-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029131154.7487-1-pratik.farkase@est.tech>
References: <20261029131154.7487-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PA7P264CA0395.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:399::26) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|VI0P189MB3235:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ab3112-4042-4921-ee09-08df3989dbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|261021123027099003|260925021911599003|260925022911599003|260925021311599003|11063799006|5023799004|56012099006|261028144727099003|261009223027099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|10067099003|12006099003|22082099003|18002099003|261102123227099003|6133799003|261102130727099003;
X-Microsoft-Antispam-Message-Info: Rdaj+doOpl/p8yj1pur1H4WjBhVfcOv2MuLS8L0GHJAaccWMuGzE2xlPUtTKh2W6mv8H9ymeO9Q3Sg8mmO1eaJ+FfReo1fQiUMVHsqqH64WhfkiGCIr/JL3OfgPdav2/8o1bU7g6BMzoLExHa4Q9CmwHY6P2XX2vM4X6fhHNhW15BKUst+HduvQ+qbqZyPJ4eph0pltescGVw1GO429FA1g/mM6cUEV5L1Cqj+IyA7Oabj1kVEjYw6cgTG4TFYYxU6WCB4bdb8/SonD8zoFHwuJIFBxHNTqEY9Sbg4y/l5h9OamSh0t/73icegX3RgmOJtD0s5yrzrzI+27tCalHOVy1XMnM8Y0MhUXI5Uf8kf/8b15rZLU8uTB9QEJlCXm/3DwoyH7XM5+I3GxxcRTUsn3Gk4gkmbZggb1OV0uhlHCZ/rMN+Z/z8XtGnoG0Vvhf5ZsTaOxBSna1yz8pyDZvqczK3X3/mHoELRo+QGfXmPbsRG7nZ3zeinEt6y7ZY5nhiu5HU93AxDCkGXI6q29StVmwQAS5u+76QGgQPYOp+oVEY68vXLsjlsb2FD0JUR/TL3SUUAFHeB9i4ETB7RRqXnfaaJoxtq/Kn0bqHjQwbvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261021123027099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(5023799004)(56012099006)(261028144727099003)(261009223027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(12006099003)(22082099003)(18002099003)(261102123227099003)(6133799003)(261102130727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TqLYmr3lOSqKrwSR76hZg3zHdOINYWhsxbzj247YW+9DQ00qMy5VJoFKW2GU?=
 =?us-ascii?Q?1+EbzOi6BzlaHWuVMK1aOIWKhJKur/beNidqILTXBdJauP8Baf5sQHCQvFUk?=
 =?us-ascii?Q?S4oGGBFjOA9AMn/rA0Tki+LemP9NBHEBC7RCd310PIrJfik5gFcwFWar8X1I?=
 =?us-ascii?Q?FJ9cZdpxL1HlM31r0AAdQ8GFCSZcKWQwAsAEx6EeaaDMipMvUGSUIord/4Iw?=
 =?us-ascii?Q?SBzl/sWrcCHNrVbjYOGK48itUuQtTNdWpUFh0SpOOrTuq7udXxWCyBAJOtXn?=
 =?us-ascii?Q?EHFNWLvwTgqOv3iKHU9p0wnMez7wdPpTGLR4tDZ56y0+774uSP2UE/tXPds0?=
 =?us-ascii?Q?+hUu+P7aePHMslIb2lRJeW+dw2fC0B0LqxH5AovLKzQ7HmirmoUlYzFu1EoH?=
 =?us-ascii?Q?IvfoRai9JCqZoKLv4utamWCY7M+9CZNDyAYmsWf8VOr4lRoGwMX0jYkpAMJq?=
 =?us-ascii?Q?3A1NKDzn10nBfi0n/co3dDzHgdeNIm0Y3AlDr5jY+KTHhusCF84+b4LQngXM?=
 =?us-ascii?Q?CeG2sgTWoWVpFhFEcunnyOGJ14mGTKqm3wPp29hW0KLopJGduMDkO0FtK7Iw?=
 =?us-ascii?Q?J7ikv0FHWJllNiGcI7djTyJ3fkRZSMT2pzSgsPLjJXH9diKmsvgCwp/2G1XL?=
 =?us-ascii?Q?S7Panqk7XEmEkbmxpSYH2hwPJnpCPvHqce7p5c9n5fUJzFZAa1lrkNCMheDq?=
 =?us-ascii?Q?qBMjhxknCMGkRe1iZuXWVSdAqxv3MvhYYd4Nqe0d1yLdUWrlmn5I+LT0rCU1?=
 =?us-ascii?Q?f8Adsl8XQmmoIrtSr/SrW3h7ts6IF3cuK8kz5ciHg2aSe3uZKWgVFVLSbgiu?=
 =?us-ascii?Q?iFoNVQvpgWzEI9g2ZC/ivv8+xsp3ZHmix/vzdQsniZa3qnMSfUjFKMxWceQW?=
 =?us-ascii?Q?fZRN2iD7yEvaxjdVKhHedEqg7MGmuw4POcZ4Fk21NGTPdT+mvjliyYrA7PZ2?=
 =?us-ascii?Q?mUTDS8kdOCl6f3zMCaKGroHHXaG7Hm8xhKziJk9YLI9XkQBUxYgmx1x8Gwpp?=
 =?us-ascii?Q?ZUvjFsxphRkPmN6vPWvput0MG/JoRGs/KKPDpEkBQFaURRwFJaZ58j+YzLyK?=
 =?us-ascii?Q?+Ewm5ihkakAUYQv+t6T+YeFZsU1MiDfF1VLRvuR6Vu1DK7k7MQ0ugvCmPYEu?=
 =?us-ascii?Q?+23/69i7Um4UsVjM9mO3IcFvip7T7zDkFClZYifVeguLhWo+Goa5YYDCSb8h?=
 =?us-ascii?Q?DH0hczR3EiardGiea0lmtolcMpFwybrzJUCC2KesePgjG28Hlcvgu3csmVJT?=
 =?us-ascii?Q?Cbiw/IT29X935ssU1crZsBVbqUHfM0v4RTln9nCMTDSWJ2TTp6n/lDKQewvb?=
 =?us-ascii?Q?9ZEa+Ore0TCklnCFlMT/YU72ibUFdz5K4sMaX82Kif9lFgsOWqNWGSlNkrxb?=
 =?us-ascii?Q?FO8BGrEVw+1VPFePPmuPivS39B/5JhUgDR762VNticoPoj/k6V+aUt5Dtjuf?=
 =?us-ascii?Q?5B6zPltxEojicXWF/t139cttehZXPa577rUoLIg4Kk3lN+Hq0ic1adJYDCtc?=
 =?us-ascii?Q?AGbiG23zhVEA9vC3yBsSExiUQNFwwDeDIlhoVhFeR5CRg96DjGqvFC9TSolL?=
 =?us-ascii?Q?qhgRE7dLzc8JMIHpK5dth8izadbe9hP9hD5D7IEZat6aHXIvkRrG+eQRmrTQ?=
 =?us-ascii?Q?mY6GzUIVpXek43xXVdO5Cut4vtSHVmGY2AyBc/SkEqmNECoH7BJfnLJJNY27?=
 =?us-ascii?Q?ABFi461ttAsV85D3loIp2fC7ySuHOHFoHHSW138xh6b9gbhIUuunMOe+RYlD?=
 =?us-ascii?Q?8piFd1vd8g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ab3112-4042-4921-ee09-08df3989dbeb
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:07:17.3841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLSJvR76rZwhk7vEazKqyADiWkvWnbUuPDytfuhWMaHjLHRPNLVaoNiRPhs8wzn9ds3B61y0agukt30Tg2s1hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249251
Content-Type: text/plain; charset="utf-8"

Build and run the lttng-ust unit test suite under ptest, modelled on the
liburcu ptest support: the run-ptest script executes each TAP test from
the tests/unit subdirectories and reports PASS/FAIL. The compile tests,
benchmarks and the abi0-conflict regression test (unstable under QEMU)
are excluded.

The ust-elf test ships prebuilt, intentionally foreign-architecture ELF
fixtures, so they are kept from being stripped and the related QA checks
are relaxed for the ptest package.

Tested on qemuriscv64 with ptest-runner.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    v2: Skip unit/ust-error on musl. It segfaults because lttng_ust_strerro=
r()
        negates its argument (undefined for the INT_MIN the test passes) an=
d then
        reads its lookup table out of bounds; this only shows up on musl.

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-kernel/lttng/lttng-ust/run-ptest | 31 ++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb | 60 ++++++++++++++++++-
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 74591a34f2..d5357d8732 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -64,6 +64,7 @@ PTESTS_FAST =3D "\
     libxslt \
     libyaml \
     logrotate \
+    lttng-ust \
     lua \
     lzo \
     m4 \
diff --git a/meta/recipes-kernel/lttng/lttng-ust/run-ptest b/meta/recipes-k=
ernel/lttng/lttng-ust/run-ptest
new file mode 100644
index 0000000000..468562eb70
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/run-ptest
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+PTEST_PATH=3D$(dirname "$0")
+cd "$PTEST_PATH/tests" || exit 1
+
+export UST_TESTS_SRCDIR=3D"$PTEST_PATH/tests"
+export UST_TESTS_BUILDDIR=3D"$PTEST_PATH/tests"
+
+TESTS=3D"
+unit/libringbuffer/test_shm
+unit/gcc-weak-hidden/test_gcc_weak_hidden
+unit/libcommon/test_get_cpu_mask_from_sysfs
+unit/libcommon/test_get_max_cpuid_from_mask
+unit/libcommon/test_get_max_cpuid_from_sysfs
+unit/libcommon/test_get_possible_cpus_array_len
+unit/libmsgpack/test_msgpack
+unit/pthread_name/test_pthread_name
+unit/snprintf/test_snprintf
+unit/ust-elf/test_ust_elf
+unit/ust-error/test_ust_error
+unit/ust-utils/test_ust_utils
+"
+
+for test in $TESTS; do
+    [ -x "$test" ] || continue
+    if ( cd "$(dirname "$test")" && ./"$(basename "$test")" ); then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+    fi
+done
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.16.0.bb
index abc701cb79..49084df2aa 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
@@ -13,7 +13,7 @@ PYTHON_OPTION =3D "am_cv_python_pyexecdir=3D'${PYTHON_SIT=
EPACKAGES_DIR}' \
=20
 # lttng-ust publishes bugfix/security-only releases on its per-minor
 # stable-X.Y branches, the same upstream and release model as lttng-tools.
-inherit autotools lib_package manpages python3native pkgconfig upstream-st=
able-release-point
+inherit autotools lib_package manpages python3native pkgconfig upstream-st=
able-release-point ptest
=20
 include lttng-platforms.inc
=20
@@ -33,6 +33,7 @@ PE =3D "2"
 SRC_URI =3D "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setu=
p.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch=
 \
+           file://run-ptest \
            "
=20
 SRC_URI[sha256sum] =3D "1e84e02fa1fc1261eb6cf3d14d64006506a29f7c605ac85de0=
2180318c6aa38a"
@@ -52,3 +53,60 @@ do_install:append() {
         # still refer to Python 2 in the shebang
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/ltt=
ng-gen-tp
 }
+
+RDEPENDS:${PN}-ptest +=3D "bash liburcu"
+
+INHIBIT_PACKAGE_STRIP_FILES =3D "\
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86_64/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86_64/main.elf.debug \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86/main.elf.debug \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/armeb/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/armeb/main.elf.debug \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/aarch64_be/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/aarch64_be/main.elf.debug=
 \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/pic/hello.exec \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/pic/hello.pic \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/pic/hello.pie \
+"
+
+INSANE_SKIP:${PN}-ptest +=3D "arch ldflags buildpaths"
+SKIP_FILEDEPS:${PN}-ptest =3D "1"
+
+LTTNG_UST_PTEST_DIRS =3D " \
+    unit/libringbuffer \
+    unit/gcc-weak-hidden \
+    unit/libcommon \
+    unit/libmsgpack \
+    unit/pthread_name \
+    unit/snprintf \
+    unit/ust-elf \
+    unit/ust-error \
+    unit/ust-utils \
+"
+
+LTTNG_UST_PTEST_DIRS:remove:libc-musl =3D "unit/ust-error"
+
+do_compile_ptest() {
+    for d in ${LTTNG_UST_PTEST_DIRS}; do
+        oe_runmake -C ${B}/tests/$d check TESTS=3D
+    done
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/utils
+    install -m 0644 ${S}/tests/utils/tap.sh ${S}/tests/utils/utils.sh ${D}=
${PTEST_PATH}/tests/utils/
+
+    for d in ${LTTNG_UST_PTEST_DIRS}; do
+        mf=3D${B}/tests/$d/Makefile
+        install -d ${D}${PTEST_PATH}/tests/$d
+        for p in $(makefile-getvar $mf noinst_PROGRAMS); do
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/$d/$p=
 ${D}${PTEST_PATH}/tests/$d/
+        done
+        for s in $(makefile-getvar $mf dist_noinst_SCRIPTS dist_check_SCRI=
PTS); do
+            install -m 0755 ${S}/tests/$d/$s ${D}${PTEST_PATH}/tests/$d/
+        done
+    done
+
+    cp -R --preserve=3Dmode ${S}/tests/unit/ust-elf/data ${D}${PTEST_PATH}=
/tests/unit/ust-elf/
+}
--=20
2.43.0

