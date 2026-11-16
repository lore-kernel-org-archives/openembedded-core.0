Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24474.1794822765407200786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 01:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HQhQdEf5;
 spf=pass (domain: est.tech, ip: 52.101.65.12, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0cRcfL73T0WkDtsdF+N6UZo8+ZAzijiW5tkhUqqcCKvZyReNtIck0SIG3fAr60wyTnjLVIJU+qNpZUv694R8xH+hMcKSlmcIgHs7RHTR+lEFRm0iE98wOb6I58acUIMz3an5tQx/sd5UUU8WPpbolWv60w/BosT77b6YO3pD6mYRAc0hi9P6uzAjubhyIcCqz9/TyzC8K0K36MlprxEC+M7JSdq+H2Tmg8BTWsuQR4SkqdQ7oP8k0xIhwEmbYaV8L+xWfQZAkggTO8AYfHB5cG+fu7TR68gXxFyUtC/n7liDPJ7N/D+RsC73vBhXmRMH9tmRL4/7IR0Bt12eKvgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0iTnK9c8MZEThpvcne+FCCDusASAXCgbTRzPxc8GW0=;
 b=XQDU2qNXK0SPLKEZrz4yUx7l1PhN+X+krW6NAxNPXhmIBbkW5YT3Mw+ILaOXPPL7nbatVyrALu2MaYhwbvOuLsgQYsU6K+uIzNdtdIdVyfyRUr9sX17kw0gp1OILZPdmfLrtlRrzu9ca+OVU10iVUaeJkdIxoKoxYlhAPVJHGVoFZ8sl4goIGv554W+O9elmfw6PnrzRVZXmHcKQnZuYRif/Yg49D2kKkXmx/pRZcrbZ51KTmWXh0KQ/yWKS4bwizaa5aHmKoLE11Qc2iHwRnUlSgDcqBUcMiAQ+Mg+Jg9m4iRKk+SGEoIJS3ltQ58F2rC9CghDjnHu12znzG46kqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0iTnK9c8MZEThpvcne+FCCDusASAXCgbTRzPxc8GW0=;
 b=HQhQdEf5ZKOVBIPFPoeaWgeBbwnrRNewiqsEohR6jKpmRLhCuU8m5uLzek9odG+zwu0CDyd6XYGgROg4fJxQhv2yCDqddX7rH80yaR9md49uGGp3foY3DaUSBg0Ks6yi8UVUa6ogTFgPzfZkFFjPaOOU+aQSQDjqu/ojni4vu2hEnaDSAO4L1/r9MS7xjuCvEqaj4ihs0lUek6azkm/HKPQDOC9A8bT88dv7gHqPtn+rGNVzx3mB5n9ryyKlJYKg6DX/zBDJTDeCxQGlx98g1EDmvVqb30s0NC/vyDvhgUgnmhYIdZmZR5SsNEdQTz37VoZqF3AQfJ5R3vgYp7NLgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU7PPFC171F960C.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ae3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:52:40 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:52:40 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] lttng-ust: add ptest support
Date: Mon, 16 Nov 2026 10:52:36 +0100
Message-ID: <20261116095236.15158-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029131154.7487-1-pratik.farkase@est.tech>
References: <20261029131154.7487-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DU7PPFC171F960C:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e4125a-f585-409a-fc72-08df43c75a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|260925021911599003|260925022911599003|260925021311599003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261102130727099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 65cDnnk9JVsZ36lRGmY3blgn0EN79W87tKaLOCcOJdEqh7pmFwyNlsDxvnX3QwAmWGvUlouMkykMNLldg26U1PJbmr/8VjSXEuNaNc6MJAdxnSX3L0nihTMQqwKlLatgAxNw0g7kkzmjZRxsMO1VFfhegL8ny0nPY4XUUQCVUuE5CVyVtSBXeuyqaxPqIxz1gRlYWbHLDwmeS611t9EaAI7qy5YDoHpEzeV3UFiTHe11EPRsDMnnq9Pbr4JXXnCTmFSD0ythkQh+I5Ag2X64V4xG6JDNud315r7NLToMVOZS7E1vsVI/VgZ6mVOTal8ATktu+qMFRi/Z+nVtTUN822Nzi5aGNJm7Jm3C8mToiB/NZrfpLPDskdoZFVIp2WIXJumbox4pcXpcCmXe0KFI4o931QLlmQm+WCO2ULTDTdcAOgVWYua0kMrgu8DaQ1AUZ1FkhCNyPiUIJ/5yoIqsCmfsQJ0CgXWv17eRlTlXZquiJwT5GEaFNPOysRVpCG4le/6AWVnjMS+wk0EfQSHMkvIRKIOTjCxTsjf1wKH5LzaniAs12D58oceFp3a1kFsET/yY02hqXvpo+rC/BTD+18KFkWhrCwzpM2SqU4uR9uU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261102130727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9h46pkrVuT+vza7Tz2XlPv63Fub+abZ0fYKXKSdQre1qcjQnvzFFC6/WkX9n?=
 =?us-ascii?Q?XJ4U/iWFPi7yv9y01cCexipIW3JZX8PZ6rvk8wgwIOxWwLPiPcWSKxu1cwDF?=
 =?us-ascii?Q?5UEsj42qrfyH3Y80Hp5kSc6XOoukkCtUmuD1clOx8usJfU6YWM/9Z45oOvZa?=
 =?us-ascii?Q?CeKZf+qjyeLauzlvrNWyo64TALafnnN+UY4a5dOR/Izbdjli0RsIbTIW+pgt?=
 =?us-ascii?Q?mXCXk/g7k0N4F3q0uBUdqhWIG26dmY3OZwFPaboconzz29IcT4+FOrXKArPG?=
 =?us-ascii?Q?uhZgUObl1DJU+/tYtD+2LzYUaIKrhXSlrUNmxc0hfHl0jK3+SS9TLv6YCdPA?=
 =?us-ascii?Q?ShJiowdWTz48nj0vndmj5il80JaeyZxqF5QYS9YFgp/L5+MPY021/uSN9R0i?=
 =?us-ascii?Q?QtIHUs/UBtBCqe7+rksbeAZPKIqQb1+hukxaW0HeNnsxgm0l8JhPfKfehrrG?=
 =?us-ascii?Q?PugSz3w+KQ8OOUKUdWER9lTJxW0dyN2m+s5yPGpacbdTcx+3U7/fWqCBdf29?=
 =?us-ascii?Q?KCZd70yVXi24C8WKBCdrf0QOwsAp0e66grUMNm8QWRW4Dh9xtc+wfhYowm+b?=
 =?us-ascii?Q?yp6nYWD4knpyvLjsSMmFg+DMTml9CXULktWuHMJHdTwXqWe7TGP/tvUO2/1J?=
 =?us-ascii?Q?jx+sjKBpdPrp9uZR94ntwjr2oBeVK2vX5sG66UTe0EEQRIWlo0cfA9nbMEQ9?=
 =?us-ascii?Q?am+eSmxp0LP2LQx3t8BnM49hvicOrWyTiW8S2wDIaHa3I+aVms8OYQQg4Itc?=
 =?us-ascii?Q?nG5nzkzqNKVkG2y2g4eGw/aJMr2Q0luF+SMg51yIXwsSu8pjttwdyiN00bor?=
 =?us-ascii?Q?BsUk/YuSlcwgzS+YRVpy31sz9k/eoCChkx4Y0qWoyuqTYg68MndTwO2zHhQg?=
 =?us-ascii?Q?oSgamkHiWDwiu+dDj2L3OFMqjO15T1mcDPgk+Va51Fp+2EhGVrjc8seTipZC?=
 =?us-ascii?Q?PmNd8DqAwh0iZ2VfXd04KKmqhYR8EvewQVZ/MkvLDxdS5mQjEv92wuYm2heZ?=
 =?us-ascii?Q?oZX+H0bnd+8VrR5IWECoTlaMv3AIXDISbk5SvduKMfQ9EAXRkUs5H2BnVuMh?=
 =?us-ascii?Q?XAmCJmgn1I5JHDFQBaxr9UU8JQ3OW3OWUvec0dzKVfGbVLoP7NYgkzRjrlIV?=
 =?us-ascii?Q?4OH9YzWsZvmCW7L4UqQgSZSnwCo1ON+HieK6FZBmMIf6kCAQH/3YEo6Ogy2J?=
 =?us-ascii?Q?TUp94XiqS9/ngjSiDTb66pGsU5lIDfKqAUEBknzvxHVxwVxRhFbiIQsfKANP?=
 =?us-ascii?Q?Yzx2+G52o7kdmbK07UkVsT+JoPJozywOZYuwITV2otmcslEmPAdJsU5T1qsx?=
 =?us-ascii?Q?Yt/IHkN+GN+8CVTrt6yM61cqHh0Zlr1Nypw0hkBA439dRKhxsUBQ0o0btMOg?=
 =?us-ascii?Q?78gc2EHOoPS+4zrdg9IhwvlBbLqOd09Iq2cklr21DCdYJlkq2vXd6NKakI9s?=
 =?us-ascii?Q?Gw8ug3qU8zKsvlwpqsYhLn4itsZCpF1wKA0HaS5dR4a8Srwc6N7VxLopppzU?=
 =?us-ascii?Q?c3r4qmaR60zVSDzc9nHfrAZzpNARFuUVujpMNC/DNw6ImN2KtIdtvcapMOeg?=
 =?us-ascii?Q?+ToO2j/jrcBqLdarYojDBYq3xFMVdfi313U0tJQvitGOHFyTJmVOXUeKYDgy?=
 =?us-ascii?Q?5m2OVgK14GsyCpTjURov+Asqyvn9N28LBSKiLiVkLIkKAJU3R1fw0K+l9wo5?=
 =?us-ascii?Q?n4z4T8UPi3qCVXA4vAoYVrgfC85mUrbei1JcaiUUd0Il7DIX0vpJ1C/+fgt7?=
 =?us-ascii?Q?6rF6DCdCwg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e4125a-f585-409a-fc72-08df43c75a24
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:52:40.1311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWWaRcqjB2auPHsUDdHgEIkB/BC7jA0XrLN938clDldtzH22/z+9TpfsMMOKvW4Z7JJOzAj65vXigIp3KMuaRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFC171F960C
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 09:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250326
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
    v3: Derive the test list and directories dynamically from the autotools
        TESTS variable (makefile-getvar) instead of hardcoding them, per re=
view.
        This also picks up unit/ust-utils/test_ust_utils_cxx automatically.=
 Drop
        the buildpaths INSANE_SKIP, which is no longer needed.
    v2: Skip unit/ust-error on musl (lttng_ust_strerror() negates its argum=
ent,
        undefined for INT_MIN, then reads its lookup table out of bounds).

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-kernel/lttng/lttng-ust/run-ptest | 16 +++++
 meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb | 61 ++++++++++++++++++-
 3 files changed, 77 insertions(+), 1 deletion(-)
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
index 0000000000..b1f85cef81
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+PTEST_PATH=3D$(dirname "$0")
+cd "$PTEST_PATH/tests" || exit 1
+
+export UST_TESTS_SRCDIR=3D"$PTEST_PATH/tests"
+export UST_TESTS_BUILDDIR=3D"$PTEST_PATH/tests"
+
+while read -r test; do
+    [ -x "$test" ] || continue
+    if ( cd "$(dirname "$test")" && ./"$(basename "$test")" ); then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+    fi
+done < tests.list
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.16.0.bb
index abc701cb79..684855839b 100644
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
@@ -52,3 +53,61 @@ do_install:append() {
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
+INSANE_SKIP:${PN}-ptest +=3D "arch ldflags"
+SKIP_FILEDEPS:${PN}-ptest =3D "1"
+
+LTTNG_UST_PTEST_SKIP =3D ""
+LTTNG_UST_PTEST_SKIP:libc-musl =3D "unit/ust-error/"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests/unit check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/utils
+    install -m 0644 ${S}/tests/utils/tap.sh ${S}/tests/utils/utils.sh ${D}=
${PTEST_PATH}/tests/utils/
+
+    tests=3D$(makefile-getvar ${B}/tests/Makefile TESTS)
+
+    : > ${D}${PTEST_PATH}/tests/tests.list
+    for t in $tests; do
+        case $t in
+        unit/*) ;;
+        *) continue ;;
+        esac
+        for skip in ${LTTNG_UST_PTEST_SKIP}; do
+            case $t in $skip*) continue 2 ;; esac
+        done
+        echo "$t" >> ${D}${PTEST_PATH}/tests/tests.list
+    done
+
+    for d in $(sed 's|/[^/]*$||' ${D}${PTEST_PATH}/tests/tests.list | sort=
 -u); do
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

