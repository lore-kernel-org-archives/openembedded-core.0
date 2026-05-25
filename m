Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB353CD5BBF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 09:30:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12515.1779701437883293961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 02:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=s1sOVM5J;
 spf=pass (domain: est.tech, ip: 52.101.70.6, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLtu12+0qJoqCUPBGtgrau/yhW0sYm6DxTaQjKM6I0Q541WtfpEC6ikcykxA/HXCyM34nR//pY73UxyEeHR/iM6ENRdGzOsO44i8TIAWwUhyd4inEnyBWvTEenFxyxSniI0gGld3COxih/E9uNeZ+nlZix0QMOXgcWypyBjr7WZU6+M59TbcR20gAbG3f/RqaCXwR+rozsjtRUwLwOR3RzyBA2ElBxufQztwKXdQG1nrqTxwqE0auqiVRz1PzUYi0got8Uu2ZRbktrpV8c/RmSg7eklWjEmpBI/bNUwTavLoKEVytgxP30YWqPr3R1GaiMKPIKZ+/sU3PM1pop2HPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN1krRkZh+B3sxzkN43vKZmOma2rXzquWuyU8tHIQ6E=;
 b=eZPduqgbKCBeBJrw5E3lee+uA/bCzeBP2p4x2X0KbCq8FXV1Pn6IA27jUzWQnqUdAGquOobeK76yx6PotOR8Lt3fHEnBcrDJUk8C6eKP2X6yv5S2V3qKJgCsERSIWsAxPEW3sXADFc7SDJD7EG4THNvoamg0I9cs62/ZzrocXTlTRlOUTaY3V2ev8deExLJSY/YJUi7CurOp0d0jjUaWPFpJKL06CO1iquYU/91gGNihASrG3pFyZ/LXcGqpaKK3Q+OS2amam5DaW1DnHTQD8A/jh84cF9DZ17K8kl0dqijMk9U8ED/APpFYCELyh9pVV+IkqgKQ7wNCwHMKustJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN1krRkZh+B3sxzkN43vKZmOma2rXzquWuyU8tHIQ6E=;
 b=s1sOVM5JhbdyYT6Cd0Obecu39FdUrmIUVQ5EPg6kAqq0FI0pgLQvABC1rLIF31CeP3iUlnYIeadWVy533qtZrwyRH9KRzCVEFL2zId8qWoMtkyLZw89xErzSsuokcV9eq0FxO/LnBD7JeFBsoKDYvlEzwRKUrNHJ58zrsMWMVZcR3/GRAjWqPULUlSqFItxuYrVulCQXybiX9lBtsHWogFIQ1T/yr2EjtQKwWHid3ZQ3ZmPlcnB5sElsMw9u3U6qLcIoGvCvlvXzVuzhkrfR6Tveo3Dgfxs+WBJHsER0gtQp6H/6+p2G9V7STXT26ZlplJuheyH11gr4YrJHJvY1Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB1077.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 09:30:33 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 09:30:33 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v5] libffi: add ptest support
Date: Mon, 25 May 2026 11:30:29 +0200
Message-ID: <20260525093029.21456-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508102405.16791-1-pratik.farkase@est.tech>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0499.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::6) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB1077:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c4ff91-1e5e-4f88-d947-08deba40453a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|6133799003|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	d+icIYZzZ9zybqBUKaHLTcv1vxQ14gOBLcV6VBvjFmvWAuIeT8D1RwhU4PC6q0reXerGu6q5rwBDcZYcVjuFytuajncDOgxKmL8jwj9b/ABw4aqQ29LDj11Dp0qMj5ULeeuEBbR/RXJEhKKTwHm9RDyuub3yGqiB5ORMuQ2AYitCui8HxOvjb+sUAv0SqLK3OLQWoA/1qJ3zHvgXAseqTPwrsl29Dwv0BzRAfruZJqFvZl1ksXi1FXFsjHpjE+dXHSl8f0uddDerR0/PVV8khphw8l4OHaug6yDjbM0DHifOrgTLWqb0M1H28TwikIRmmRIxeCJZ8rSrjkMi+x1qplID1yTlXDK7CSV5U3M7wDc1ljzIrhYcz2qo/7FiI4n7Lj66gjcb7m+/WEcbnPA8AmflrQMIPsCca42kZyWTctWqdSfiIZlBN5WWtAbgp9sQ1RPMy6rfjw/vdiBLBxmvd1UFqLtaZX6pS4Z8jiuxXsKKR8JP/K7iCydtNhdyb2jwSm6HyprqFYEwQYfTiXgDvFgpG8CpzuuaXkVc8jrYOADCAB/C6UelAFlo/zvbI2uwkkdHNXZgmaqh8Apqy5EGUeqAHymh9KrQ4XleWDsgrP+H14QBIhQu+sKHyL95ICMHy8Tqh9q76Trf6VtIMoUgQ4N3ZDiwMHdyToCyyun5YBa5e6iXqWZrF5yoq8ipL++d
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(6133799003)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y4z/ViSqrjpuI0iElpaEWcFsXBzYjPgabgz+CS2mDwC6+dTbFi8Q+ifoNn7W?=
 =?us-ascii?Q?sU7G7brSLTGw8eR8dE4FnOF2FW9kYM4g9nxsZIrmZCRW+oM/+nxFCk5EEmt6?=
 =?us-ascii?Q?pSPlEy3D/LcV3GSFlTElrz8JJL/PFFvpM0JgdlwTx5lcJqrHY5LUTwkUxfIY?=
 =?us-ascii?Q?LeyqoCMY69mYNcuJOyQWohwRxxtyI4HVIrChkHm3ir8zNly0t4tWnjqgWYoi?=
 =?us-ascii?Q?88XzRY3xRVnviQ/RPqGhcJwuxWlNEkoFt/c1U+4PhRlHFLijn1+yFT1CHhTR?=
 =?us-ascii?Q?eRC9H5/4227/MlJ7vRRdbfLI3iW6U3GL2i/9/5kwqB8oyOaGFiVa0D5FnXJ/?=
 =?us-ascii?Q?NkeIqV39C18lC+VtS7YnxBrmE3deO6lPfjHkv6YazFDeD86oTiOk0jIgl5Ui?=
 =?us-ascii?Q?+4WzNxpAiNf4Y5gqxGA5IYU0tkmy04khVYAizuqO1m9DEdQF4QliKf/LOvKK?=
 =?us-ascii?Q?JIdJbZ14IgQkMjR8vMgHwWTgf8GIXGEMWi575/vsM7A89z+mDdAridO+yG2k?=
 =?us-ascii?Q?bo62QYBkIJmpsstfH96oGGlr2NwrP7TaVOfPzvS07VFuPhVnZDziibOMb2MD?=
 =?us-ascii?Q?mn/+t9Bp7udkFSRTInEzZBUgqXNCqCeoGBV3IDDw+3/WhEZfC5KV+m22smQ2?=
 =?us-ascii?Q?3o7lAWJPFOzk8RxZzQ/AFJZzRuKC7LkFTu6Tf55U9XIorwbd4i0oesHDzM8/?=
 =?us-ascii?Q?JaEGs815XATPRzRW5zwopzgM7+vrCJFiUzLAy3ULvitw1Q7chwf13fKZKZfM?=
 =?us-ascii?Q?jFDOJHst91umJsbIoTu+nZWx/eaLwLNvbDF5A4qoocKtFrKX6qkGD3Th+umn?=
 =?us-ascii?Q?CL1hhZeTOK088240549Pew0/7S43jG3367FafiMCxOovrsJFanjGr5rwbSS7?=
 =?us-ascii?Q?fOOFa/U8OzihlPyuloZpBa1ZEOS26rO/7i/3xXSbhGpa50nVDxsxeDFmTgps?=
 =?us-ascii?Q?dH/d76UZlffnCZEU+YVYE++/rUYgFnA1TIBx3hXk7cA2HOcHI7QbCIrV+zyI?=
 =?us-ascii?Q?22fmNEqExyaTONrCojBbSGqSDoa3FiJCXqyMZNp/Ou7UHryl15sEQOR64Ewo?=
 =?us-ascii?Q?W6tdrh5uzOOQFF3u6OTBEAiH6xQ+1t4F9AUKSjK7zqXT+m1kw5X9Wl2LVMzo?=
 =?us-ascii?Q?0z4f5udb7nOJozmd7x8I2JeM9a4A9dOeQvQ00ChG085GmhhE2sZWymrW/oZt?=
 =?us-ascii?Q?k4NltMQpIfcXblvJI7DmRAMvcj+1MlhneLtnVrIOQEHDuVQDNC0dnUBn4Nuq?=
 =?us-ascii?Q?hNLMclJlSq5cPPhYz4qJnwvyNcMP8NyQE32HkZrBg7v8RA0X61d1/BDYVls4?=
 =?us-ascii?Q?MNjQAeM7wHfB87FMIRUwRHDFuJsyeLwAufk9qNF7W/3jUDt+KY84l8GGm3Dx?=
 =?us-ascii?Q?fEAAgYZ91jL7ybEntt3slO/H8bFZhxBhgFF7iG63a8pCfuYpDHPPZdGiJwzC?=
 =?us-ascii?Q?TDB+7cs2nwYuNLjKG0moqngy1tdsITclhvAd+VBWTqQE9ao2k5XkE9hFVkXo?=
 =?us-ascii?Q?QlrHZb/hhUAKHMwT5t1V93Hg/gLAZr0ORPu10rexXuw8V8abozsgW9qn3JAX?=
 =?us-ascii?Q?O9PMqdfqohYk6UhdpTvLmxik2qN53+Mw4VqWRWG+UDnPmRBMUopjg9v4q4J0?=
 =?us-ascii?Q?EvlSgiZnQJj7NALEzDVUyfqXygCPvD5dk1jTECsa+9x52Smhd0wbA2+y/vNq?=
 =?us-ascii?Q?aJDwS2JQrUV3ksbTQRAQp5jzCCInVFUeBdC/+s3Gq80dmp2t0PI7qPETBv2p?=
 =?us-ascii?Q?zuplWhiFgw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c4ff91-1e5e-4f88-d947-08deba40453a
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:30:33.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHivrgq8G6hOTeffJUu7IpG+uFjdJ0fRXml8jifkp0umdDVZr0bSRKORp56DolKY8x/DtE3JccMr8sVHRXP1uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 09:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237574

Add ptest support for libffi using all upstream test suites: bhaible,
call, closures, complex, go, and threads.

Tests are cross-compiled at build time in do_compile_ptest and the
binaries are installed to the ptest directory. No toolchain is needed
on target.

The complex_int test is excluded as it uses non-standard _Complex int
which is unsupported on some architectures (e.g. riscv64).

Tested on qemux86-64 with ptest-runner: 198 PASS, 0 FAIL (5s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v5:
- Cross-compile tests at build time instead of on target
- Minimal run-ptest that just executes pre-compiled binaries
- Moved back to PTESTS_FAST (5s runtime vs 327s previously)

Changes in v4:
- Replace packagegroup-core-buildessential with gcc/g++/make to fix
  multilib symlinks conflict in lib64-core-image-sato-sdk
- Detect compiler dynamically in run-ptest (works without symlinks)
- Exclude complex_int test (fails on riscv64)

Changes in v3:
- Move libffi from PTESTS_FAST to PTESTS_SLOW (349s) runtime

Changes in v2 :
- Include all upstream test suites instead of only bhaible
- Install fficonfig.h required by ffitest.h
- Add support for C++ tests (closures/unwindtest*.cc)
- Add -lpthread for threads suite
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libffi/libffi/run-ptest  | 31 ++++++++++++++
 meta/recipes-support/libffi/libffi_3.5.2.bb   | 42 ++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/libffi/libffi/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 50b6a8a41e..79b541a199 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -34,6 +34,7 @@ PTESTS_FAST =3D "\
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
index 0000000000..f25366111d
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/run-ptest
@@ -0,0 +1,31 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for t in *; do
+    [ -x "$t" ] || continue
+
+    suite=3D"${t%%__*}"
+    name=3D"${t#*__}"
+
+    case "$suite" in
+        libffi.bhaible)
+            ./"$t" > "$t.out" 2>&1
+            if ! LC_ALL=3DC uniq -u < "$t.out" | grep -q .; then
+                echo "PASS: $suite/$name"
+            else
+                echo "FAIL: $suite/$name"
+                cat "$t.out"
+            fi
+            rm -f "$t.out"
+            ;;
+        *)
+            if ./"$t" 2>&1; then
+                echo "PASS: $suite/$name"
+            else
+                echo "FAIL: $suite/$name"
+            fi
+            ;;
+    esac
+done
diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-sup=
port/libffi/libffi_3.5.2.bb
index d3aa90d429..987d0f59c9 100644
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
@@ -30,3 +31,42 @@ do_install:append() {
 MIPS_INSTRUCTION_SET =3D "mips"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    mkdir -p ${B}/ptest-bins
+    cd ${S}/testsuite
+
+    for suite in libffi.call libffi.closures libffi.complex libffi.go libf=
fi.threads; do
+        [ -d $suite ] || continue
+        extra=3D""
+        [ "$suite" =3D "libffi.threads" ] && extra=3D"-lpthread"
+
+        for src in $suite/*.c $suite/*.cc; do
+            [ -f "$src" ] || continue
+            grep -q "dg-do run" "$src" || continue
+            name=3D$(basename "${src%.*}")
+            [ "$name" =3D "complex_int" ] && continue
+            case "$src" in
+                *.cc) compiler=3D"${CXX}";;
+                *)    compiler=3D"${CC}";;
+            esac
+            $compiler ${CFLAGS} ${LDFLAGS} \
+                -I${B}/include -I${B} -I${S}/testsuite/libffi.call \
+                -o ${B}/ptest-bins/${suite}__${name} "$src" \
+                -L${B}/.libs -lffi $extra 2>/dev/null || true
+        done
+    done
+
+    for t in test-call test-callback; do
+        ${CC} ${CFLAGS} ${LDFLAGS} -I${B}/include -I${B} \
+            -o ${B}/ptest-bins/libffi.bhaible__${t} \
+            libffi.bhaible/${t}.c -L${B}/.libs -lffi || true
+    done
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for t in ${B}/ptest-bins/*; do
+        [ -f "$t" ] && install -m 0755 "$t" ${D}${PTEST_PATH}/tests/
+    done
+}
--=20
2.43.0


