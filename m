Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6793.1793696265130141104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 00:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lhl5zkwT;
 spf=pass (domain: est.tech, ip: 52.101.72.10, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4w7QSplftnRw0CUIQquMnA1qG+XYP9LR1Vf8syr4cXytsHY7ZMLUetogYZW+Wfxwi0fUlKdyzCMWo1tpjCo3F+mobznophF9Pk8aV63ceeYySk9DxQK2Xf58zUQVrVVp6ykSV11aDF55+8uQdnQXCuwOIuqqpkxGDL5F1CIgbzWwz99UQy9BiKTnG3a/lLy2OQbcAMoqlFk6g5STUXmb0qofz64QsmmsaHWr2a56KAzfaNpM/4bCJZO4QtjNpmmo4nGlQYfZe2xWqSll/Ah8eW+kuMlK0Mm3lTbAdDsrKnEMQu2tq6CiBhNZW3CZLAH916Geb+i/rZPtawSySgtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ny6MdpfFzw0GCDxyv6JKy5kvIKFwb2075fIOAkI+lQ=;
 b=bg4I6FHtAo1WAQXvMpHltiUbpA6IY4VGjg6bzFmx4cCv0cVDu6oeozfpPJ8bcMYXOXPD5OTL7stAdLFv5Tv/sJ1aZzZmKDVyg+4QKS4n5x+lXkYf57EBw4A8TOdTcSLn3draxdC6cdMfRjS3EBlhfBR2tFia50HPus2lPcMVn+GVqvi7ulHcaxTq4wHJ3Lhxbc1gFPyCEau7g3Bqgy/2pWlRjzNqAoCe267E8OY/2Zn/E7kNNDSEJoKIZUBNFZvyUDNWDlLHah9QYW9rSGfBRG5WirZHvCi2yKTWGebGPrA1R2BS76UEyvuGvlFbK/SLaPXMvL88GabhhEsdgH83XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ny6MdpfFzw0GCDxyv6JKy5kvIKFwb2075fIOAkI+lQ=;
 b=lhl5zkwTLbi6nFHBH1tDXgs5jjVK9bWn988LhBEEVpDwA9tyV/ALOhL+K/mYgZuHST2ReqkVVD/Efr743hPKbk0msOdUckd9UOetI/m32xgt7Ox8t5f9Ty2StHGjfjBw8b5DDFIbdBlfU2eiI0FIi6gS/xw+plI3/YYmiya9v1+z89Uka3wyI3Z357beNI4kXTt5EJPV34Z8ESr4mIPVpFipqxoiDo94rb9SbIrtoBFi4sAhaGzl3CHULaoi1nlr0ZxREHZXZWXVUsEpachXIBvxe9LP71spwVcINM2nWKjpZih+06x7pdxFjXHyfMDqnTjPLxnF/1a18BKamhGCQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by BESP189MB3177.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 08:57:38 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 08:57:38 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] lttng-ust: add ptest support
Date: Tue,  3 Nov 2026 09:57:33 +0100
Message-ID: <20261103085734.12997-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029131154.7487-1-pratik.farkase@est.tech>
References: <20261029131154.7487-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::18) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|BESP189MB3177:EE_
X-MS-Office365-Filtering-Correlation-Id: c348145e-3e78-4bbb-4a9d-08df398882f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|261102123227099003|18002099003|22082099003|12006099003|261102130727099003|56012099006|5023799004|11063799006|261022105027099003|261021123027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: 87RRIo7Wh7xfCyGzguSobX1gpKmzrilECqOtghsG7G13hZzuerT68ibj47AEKdXTf/dOQ/4AD5vHBKo7lmwGibQeOVczBVJlSnQm+mZVFEY48nu4kUjBU6qpe3OT3SKIqWSOg2Kwh5HKZzc6UQZPRml6EWc2+PtxGt8CRAIMg5lJ4aeB+KHxsOEk0AKc2cdQ6ZrKPEzQ9bI16bjMjLPynwPEitiBYWfMe5dUaqgjt43IZZY0pxypQmgQVHFvEksxLwa1lCvWhRVy+OKh55GybL0KzUlrt9ag7SFifAs9CvktB/W1gc4PWDD6Bwo3I/xvN2BTlRvk/dYWvks4YFz/URk64+guJSon8beQXp8MEeo1VkQRPDu/NAPj1/EeI7MlvoGKP1aVEzDJeFIYcWmhqkh6zMzhyp/JStS8rXuiC/BLi2iJGhZe7AIx+TxzgLwWuOcgwYyTZbgStvrbKDqV9/oQIM9ydcmexHMzgYFaM5eWtAniG3oRBwnpRKR743H/2NDCXTwNxoF1tGIOHRU25i5QGHJAlXzAcIuPHkaefmtFq09QQnr7itjPG4yHzecXl/oEm/kU3qYqi8W8SVGFy2jHFWtZ6QA1pQmlXOnwOMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(261102123227099003)(18002099003)(22082099003)(12006099003)(261102130727099003)(56012099006)(5023799004)(11063799006)(261022105027099003)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wqdRGtB+ERmLzPG3H77llI9DD4hATmSx4hFlAJyd8rkFPcDsx4pT00nyOAU0?=
 =?us-ascii?Q?JnbqAWdAZ+vsZB6S0t2oMO00lHSsoy4hCi0tJmreUNqvBdixZ24WGAxRHbTf?=
 =?us-ascii?Q?gbRSoEkobOVJk+xYTIdaDMAz+KQ9xFdM37GQXDfaIsHBfPw960lb1Qe2aW0i?=
 =?us-ascii?Q?taQSICwxbmTwgkWrgpMtc/p+EnGqsHNyLY3ypy8pNPx3+GTH+QzUoDb3aVrY?=
 =?us-ascii?Q?KZ+6x/9js+rni1aIchko4BO2f5PnB/L2aUdoibssXiK7AJJAgZg1k6e3om6Q?=
 =?us-ascii?Q?wnkr+IIxYo5ilpD9Pvr/rykEzjqCdhWoPlpebJTAJKT38j3rs1W/Jiay1SsV?=
 =?us-ascii?Q?ULtfKazb0MDU27FNGTEzFsHUyoDHUEwEzBd1qehEUZzReAqJN4Qy9mLEX66v?=
 =?us-ascii?Q?RUG+pAAOiibHLQE5a46WTnaEU2gMLy9iVPWRqqsqwmvf7pxUZdExmUyqGuHh?=
 =?us-ascii?Q?VZMN4dG2NTih8CKCZgRE/TOD1XyyoWrsYh3q2GdeVpn8JoiNU21zKt+UMrX/?=
 =?us-ascii?Q?J4cSG8xQh0afojZKKjXRFH0ywql5ll3O+OQEwHqWxo2ykpqX2arlVVVlgmZx?=
 =?us-ascii?Q?84Pm9XosMJJ+jjggjUk2wKa8XmVlFhb0iWl9Ypt0NJ+iaYbdcOt0i8fOpATv?=
 =?us-ascii?Q?PZcaXeXmnBesGIWDBKHsi1r1OdmOs78bWb9dFI2Mwo9/4LVnhGvgUd7zTu0t?=
 =?us-ascii?Q?WF22DzWQTZCaiM2WKECGq0ZOmI32lwDkh4/Rh8Y6YtGYr/1nhCbT1tpo4dSP?=
 =?us-ascii?Q?oz++kyr0hOII66fVsEPnLzCfxFgx1JZrzeMhhheUVZnRIO3ICIr1Ikn3ylVV?=
 =?us-ascii?Q?CO34sfq/60Oqsvd+eilWitF8ZWs/9Ey5paBNt8IjFzmiZ9KJC23X0wYrHlvx?=
 =?us-ascii?Q?glps1qax95AG7jItYbfyyX9LYYZk30ppB3IoigNJw/C7bvrBrerUSP356/+r?=
 =?us-ascii?Q?vxnYfDjt5QFtUbcObjDEP0Q8z3uUHJ8PAkmKQFwe71FMPVW2Z6T2EvNjlvUi?=
 =?us-ascii?Q?oZm6/undJRLtxAvDpQ0aSROqj/6AzYEzPzPr7j/YowycDjqZH2XB3WN/lZy5?=
 =?us-ascii?Q?Us3RLwxHc2R0xsaRqdpNpg+ssxlSoFRkXzbQPetcetnUruGB5M0/bdb69pVr?=
 =?us-ascii?Q?hUuiLe4rW2nn+KECUocDHOOMyF75FQs6f2MuIu/NPaG9mGxm1auZmo6tX0gQ?=
 =?us-ascii?Q?/EY4QHIiXEYqGkuc7E3M0TV5anJh+LaKSDgFdtPYw0qSC3RUfDxOILNwXj8N?=
 =?us-ascii?Q?oHkZB16mGi2vBmMGS4q3c5Fikr440lIKQdE0e124cxS8mlVDX3T4oGS7Ddjo?=
 =?us-ascii?Q?L+1JfmBBNaqSVMQsEGS+Fn67HbB3N1k3zoAq5eCw1YNVfHSKeLcXziAoI8I2?=
 =?us-ascii?Q?8Bw7E227vIcb3V7KjjnRKkIjnl8XaMMGTaGeTKsGimyja1UnDupxzPCVLLnE?=
 =?us-ascii?Q?LPMPVr6kpEx4NL1thisY103c6RVS4KmOmU87t1veL74mQX8COk0Acvb5IzwU?=
 =?us-ascii?Q?bBUYbeM8NvLXNBz+2d2PFPKtP4vdVot1Q9DzHitSzbgWXWKClZWLzahrkFzV?=
 =?us-ascii?Q?AJcBtd33GnbuIn24qQa77kKLuPWH7rv2meKHI+lkox0ssdIk1dYFT+NAd429?=
 =?us-ascii?Q?4xV7rIDhyNLt8xX14YHF+P/BlmNy3Euj6UXdt+7M65kXuueuG3yQX34NBTq9?=
 =?us-ascii?Q?5RkMArL0xGhawuBcUL1RzCKa9ca/bo5kSzYnZ+MZ+6jMC8LaMircdzvS7ApC?=
 =?us-ascii?Q?OyzyVOgviA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c348145e-3e78-4bbb-4a9d-08df398882f9
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 08:57:38.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdC40JYZmen0ZJgZCPYVBFShPr/UKBp8PqsYMSUWCzvinXxzk7dqj9IEz7wvIgL+y3XKQyWcCPlk8zNFQePfeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 08:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249249
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
v2: Skip unit/ust-error on musl. It segfaults because lttng_ust_strerror()
    negates its argument (undefined for the INT_MIN the test passes) and th=
en
    reads its lookup table out of bounds; this only shows up on musl.

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-kernel/lttng/lttng-ust/run-ptest | 31 +++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb | 63 ++++++++++++++++++-
 3 files changed, 94 insertions(+), 1 deletion(-)
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
index abc701cb79..2204993b12 100644
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
@@ -52,3 +53,63 @@ do_install:append() {
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

