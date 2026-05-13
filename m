Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B244CCD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:28:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7565.1778678885866827413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HbP26wOG;
 spf=pass (domain: est.tech, ip: 40.107.130.49, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRnW5uERx5WvfYV3WRO47DFeDhRbZj6M4Wbc1QkryeuBgO4fUksZX1trHmAaYhfFAOyWFSauYcoQb5KXvSLLqnnejIRhcvAejbr+f7mqp2HG8vU0e1JXdl+DPes6w4gh6wkiHZ9AhV3B8+Z1GSaVqUtLOKltMiPtqhnLgNx2dfCCpowtTzEUmiRo1OCwkP+HMNYPa+8Pql2fDOX11T4NFD5gvJhvS3gEiyT/NDFjaqSAZJSADmzeMJJe9sGGyYMds4XVc1JCi0+Itp9vbxgOwKs9wjIMtAYX3rFqGiMdMr5/pt5yfKHfCMwWS9RThF4MzM9t1K3HYA20A/lSWueSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28vuV+3UtgLwD3xmL+H2XG67CTv0DxbWShnQU2SX5Ow=;
 b=kJzWymf96L/scRL/FxjUOTvXgPpMvENdXVVUYZcSwDWRSYcOHpw2DLJfOZPUvahanTD8Cr0JYpTtpSsWVnDlKhQxLY4qVmafYepmutpXUxpVAXcbX/7WzDSfigjdekGK2qEOXygYOE5r6EZkNEE7vL1hIz3fACYYSq4e7wuIIeoGbO0FncyuxQwcEGnLpqr0Xm1P4k33zm09rhOmHsnE1MZ2+CcxtRYelKmqNmOkOggNH9OrxqKctBrEqchkd42dkuLr+8dWrWVyM3upn5N+paw1AUHjAHS0Gl8YlJ4QoWoi4hkCY/Sb7N6XmQbkVxuxMBP3MdUJ3SDK5zqB0frOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28vuV+3UtgLwD3xmL+H2XG67CTv0DxbWShnQU2SX5Ow=;
 b=HbP26wOGsZ/r9IfWFwRHarNetfj+aJWhoGFEKYlHSVkmK4swKJ1WHYuUCkmSXgAGgFlp4lMvM6YRLtne1phc9+iI8KjT7/lvnpiSRpV/nbfNs+hDBizoSfp6EKOQ/rhbw3L5E3bze/iqgCUmW2JTKd7J+Myrnc7vVgbT9IzkSUSb341H2Kn02fCecvKkQwU8Ied0PVMXKG0AExHQ1Pxwc9M1a8iJ9DjZB9EVaKiJMxUWs7n3hV3pOnqYHoC+8MYkdSB2FkgfNmAII3zaE0mo6L70WaWUgrZlr/3uHSpiARPhN99mQnb6gtnQG643VLSswAZUTRDcpnS7aUvxOo68Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB1916.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:34c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 13:28:01 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 13:28:01 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v4] libffi: add ptest support
Date: Wed, 13 May 2026 15:27:56 +0200
Message-ID: <20260513132756.27283-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508102405.16791-1-pratik.farkase@est.tech>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::12) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU0P189MB1916:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df05412-d1f9-4f81-e224-08deb0f37445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	JqEPlioJN4tVXCcwJC374ttHkn45qhnNVs8U4cpKOvENYzFOh67dBxR23AxRwy+EOPkMpS4ZxsS/F74RkK01b2O5chJijeiv/yqGpf5M2XrOObxU36QhtoJJCc3v8wlHMJEuvsYKQWV/JDd4czhWbhd1y36dLOtP3+2tM70aG59fCrCa2Q8n9aBI8n3rnjg70JXgl0pCqQ/nDKrr1humFxzCyXJz7pmHbNMqgw37GJQPHU/tLTLrfxqjwzejUejNITkDFzstBVCp64963tKtX9Bdn4lh53HWRjar0ZnacnJxEChz/aopJJ0OtNJWfNQhixJRBJkSlJummvqmzy8DpoPc5+KygT49cKgyyD1GMNq99eOueVn459xDKJG37iQ8hI6uRun1lUrUgNmruM4v6jPw7D7RN6qaWIbqBxEoWmtJlVUV6O8T+1JUwIoXn3OoDgJ8n+emuHCgHubRfOgcCaPGZOvDac7OGiOkgccUTFpgSTIm2IDDPzHqVB9NNIVqlDvqDt29MZx3KY9phjQ25VA3aljwX/nDeqVtAx1U1yb7NxRtCeCCFNAHJY1dLEDkv7Q0xqW7cllxGJr9syfBwyHy8LjnRQTk/tj//Lj2OAMX1t2vOL2F0sk0M/WnvrpbcfCqumQEm/MyL9U4wVY5MlvB4EcTw6wuPGqAmJ7oZuCFPrEN0Fj2uhu8eBJ59G4A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0WaPCmDlpJWaR5SrGutzqZ+qZ3Dnyx40PoradW5w25rEtbjdGLD5reEcniFC?=
 =?us-ascii?Q?7qJ8t9eAA7zEUyJIUVjsKHMxMAz5RdnctsZckrJSXq6D87ZzcEAIHtQU0Iu/?=
 =?us-ascii?Q?LU8gdJPdaOAsSdvcqKDE020UmlfIr6xFw7+ykWPfNvcmtckkVHuCp1pVMv+7?=
 =?us-ascii?Q?bB20/noKokngrSBr/YzrL9k9OluKvqoMUwSMZnoO/70Qrmo2QbV587oiXThW?=
 =?us-ascii?Q?ZQsLc8AqSfUTHUv6iQy0Fp2ZQFlpgyKz7zl27Mqsi1pn3EMNx3QuJPX0LkIN?=
 =?us-ascii?Q?mpRYewic5fx9jUtKA4vP6dAVhhzRcc9mcDieOXdHnKNtaQL4VedqixKvjKq8?=
 =?us-ascii?Q?uZCg5vzTs8pQb3wK5PV3xMD5f/SS8+3PVIhLA/UmmWeXka+ce6xtk+ZI6xnQ?=
 =?us-ascii?Q?n341Nz9TiNqNo8B/xyWFXtz2b31y4Msm1uwGJ2DCmJLWuHlaFcjY+3qz2xul?=
 =?us-ascii?Q?C+JDDeALVPyQ3tHZ63qrw0TmN0EfUcLyNd490eIE+Ugd5ppehE5cYD4tH6Mq?=
 =?us-ascii?Q?SD9A4XGycB3HzWoCSnPMuQE5QaVuVSQvuFqXVgZ6lV0ZRJs9bKjPdLcgrChm?=
 =?us-ascii?Q?90C9Beg9y6hKXq0mcSzmI6FCmYKiMRhHLUY/6EEsBosfF1DgDSX6F42vBjGN?=
 =?us-ascii?Q?/HkxOuK2dlypF/QfLyxSjA7XBNVquKuIsVdzxAx378ia/lvK57HyEebvKxOS?=
 =?us-ascii?Q?Yo+kxyWHbFCz+ZGuw6Ls4VLDDNAtxevnHvOeXydWkZXDao+x4cLXqSmsvfyH?=
 =?us-ascii?Q?3vS1pVpXFzix7n0pwHgaEBuyEJPUCkdPyIn1fxrPxYzJXxJKSX5dLn1zKtkZ?=
 =?us-ascii?Q?MuEpt6gAOZE0D88oj808Hy/nMiXKofXYUjv8Z7H8APjQYmH0gKqkGSSUX+0x?=
 =?us-ascii?Q?ftXi/bAJm3HOsLg6slhjG/56ri+yqOfQQ1QdSH3Dj71BeBJgLXdUMbnDuLjp?=
 =?us-ascii?Q?C/mIHULW7pmFecFj6hTXtyYrMcLS080rWO5lOBp1wkccbcR1cJuC1NIxeR5w?=
 =?us-ascii?Q?ZoU5yLneQhEka0mesP+jao7nUsKTYv90kBsTIVaP4WUYS94yMxY5QIPNdYLt?=
 =?us-ascii?Q?igGYCa4BXJHwwWsTStDQdJRL3tLyunvgKjF54bI8EzeFTH19nByaR/HaZiGv?=
 =?us-ascii?Q?fH89JGac/IKfIUrYSRmK/2k6XGG7I17pjE3K28yyQ+27dWZ9WMinsqpygO6a?=
 =?us-ascii?Q?wr2q8JLVMVgFywvxjVrDS6MQsGDI+wOKBYDCBYVCR0KX62wjoRyz3AAOF6R3?=
 =?us-ascii?Q?O8f8ZCcKfUWjBAQgzlcxkkfxdAZtu8eZGYwI0QAdqiDIodlnFbgObyP5BiKD?=
 =?us-ascii?Q?I36UJMd0/AsBpz56F/OyPB7dyjNuW8MyJqLWWM8ZdYt+Mc7EUJyemDhgP7WF?=
 =?us-ascii?Q?hY/U2Oxtm62r5r8GZS0FfCTBaB/Z36BtW7bWEW4p6hJC0ZxNjIo+dtIzmp0H?=
 =?us-ascii?Q?V5ZRjHJecvV8bg17NQoGoF0HB8xsjHZwJauG6CgnE8XflgYFtEIgQ5eYT75Q?=
 =?us-ascii?Q?SxoONXaArkQF/LplAoWPfl0TSr0eZdqvn/SJhItAsZt7G8H3xiaikTnpYLF6?=
 =?us-ascii?Q?t/tElYXH4hsBPeV5xumD13MM7hb8I6MuozCwiJJF22wUmx2RijFcpFNgbcoJ?=
 =?us-ascii?Q?tgkKW+9fySSpDNE/2SI/APmgs4RTldn62s3YhbT4SKePAw1irIOaFHpaaYQq?=
 =?us-ascii?Q?koE2SKAdBByq9y11pYhGYH5tpjrZ1DucS7R4v/Fzg6hOvdQTKl+y/d4tgqDF?=
 =?us-ascii?Q?rQ/j+Bw1gQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df05412-d1f9-4f81-e224-08deb0f37445
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 13:28:00.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO8xfdnp2MCBoq41CXIeQhkYCIMYpTGo9F4KG+G4DOUZM/SxegRk03wt7WdkialqCwsVqCPBzsLWfllua8tHzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1916
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236977

Add ptest support for libffi using all upstream test suites: bhaible,
call, closures, complex, go, and threads.

Tests are compiled on-target against the installed libffi. Headers
(including the generated fficonfig.h) and a linker symlink are installed
in the ptest directory to avoid depending on libffi-dev.

The complex_int test is excluded as it uses non-standard _Complex int
which is unsupported on some architectures (e.g. riscv64).

Tested on qemux86-64 with ptest-runner: 198 PASS, 0 FAIL, 2 SKIP (327s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
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
 meta/recipes-support/libffi/libffi/run-ptest  | 62 +++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.5.2.bb   | 23 ++++++-
 3 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libffi/libffi/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 50b6a8a41e..68189ec2a3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -126,6 +126,7 @@ PTESTS_SLOW =3D "\
     less \
     libevent \
     libgcrypt \
+    libffi \
     libmodule-build-perl \
     libpng \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)=
} \
diff --git a/meta/recipes-support/libffi/libffi/run-ptest b/meta/recipes-su=
pport/libffi/libffi/run-ptest
new file mode 100755
index 0000000000..0a1845b2fd
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/run-ptest
@@ -0,0 +1,62 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
+CC=3D"gcc"
+CXX=3D"g++"
+if ! command -v gcc >/dev/null 2>&1; then
+    CC=3D$(find /usr/bin -name "*-gcc" | head -n 1)
+    CXX=3D$(find /usr/bin -name "*-g++" | head -n 1)
+fi
+CFLAGS=3D"-O2 -Wall -I$PTEST_DIR/include -L$PTEST_DIR/lib"
+
+# bhaible tests validate by comparing paired output lines
+for t in test-call test-callback; do
+    src=3D"$PTEST_DIR/testsuite/libffi.bhaible/$t.c"
+    if $CC $CFLAGS -o "$PTEST_DIR/$t" "$src" -lffi 2>&1; then
+        "$PTEST_DIR/$t" > "$PTEST_DIR/$t.out" 2>&1
+        if ! LC_ALL=3DC uniq -u < "$PTEST_DIR/$t.out" | grep -q .; then
+            echo "PASS: libffi.bhaible/$t"
+        else
+            echo "FAIL: libffi.bhaible/$t"
+            cat "$PTEST_DIR/$t.out"
+        fi
+    else
+        echo "SKIP: libffi.bhaible/$t"
+    fi
+    rm -f "$PTEST_DIR/$t" "$PTEST_DIR/$t.out"
+done
+
+# Individual test programs from upstream dejagnu suites
+for suite in libffi.call libffi.closures libffi.complex libffi.go libffi.t=
hreads; do
+    dir=3D"$PTEST_DIR/testsuite/$suite"
+    [ -d "$dir" ] || continue
+
+    extra=3D""
+    [ "$suite" =3D "libffi.threads" ] && extra=3D"-lpthread"
+
+    for src in "$dir"/*.c "$dir"/*.cc; do
+        [ -f "$src" ] || continue
+        grep -q "dg-do run" "$src" || continue
+
+        name=3D$(basename "${src%.*}")
+
+	# complex_int uses non-standard _Complex int, fails on some arches (riscv=
64)
+        [ "$name" =3D "complex_int" ] && continue
+        case "$src" in
+            *.cc) cc=3D"$CXX";;
+            *)    cc=3D"$CC";;
+        esac
+
+        if $cc $CFLAGS -o "$PTEST_DIR/$name" "$src" -lffi $extra 2>&1; the=
n
+            if "$PTEST_DIR/$name" 2>&1; then
+                echo "PASS: $suite/$name"
+            else
+                echo "FAIL: $suite/$name"
+            fi
+        else
+            echo "SKIP: $suite/$name"
+        fi
+        rm -f "$PTEST_DIR/$name"
+    done
+done
diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-sup=
port/libffi/libffi_3.5.2.bb
index d3aa90d429..09d686acd9 100644
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
@@ -19,10 +20,10 @@ EXTRA_OECONF =3D "--disable-builddir"
 EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
 EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
=20
-inherit autotools texinfo multilib_header github-releases
+inherit autotools texinfo multilib_header github-releases ptest
=20
 do_install:append() {
-	oe_multilib_header ffi.h ffitarget.h
+        oe_multilib_header ffi.h ffitarget.h
 }
=20
 # Doesn't compile in MIPS16e mode due to use of hand-written
@@ -30,3 +31,21 @@ do_install:append() {
 MIPS_INSTRUCTION_SET =3D "mips"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:${PN}-ptest +=3D "gcc g++ make"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/testsuite
+    for suite in libffi.bhaible libffi.call libffi.closures libffi.complex=
 \
+                 libffi.go libffi.threads; do
+        cp -r ${S}/testsuite/$suite ${D}${PTEST_PATH}/testsuite/
+    done
+
+    install -d ${D}${PTEST_PATH}/include
+    install -m 0644 ${B}/fficonfig.h ${D}${PTEST_PATH}/include/
+    install -m 0644 ${B}/include/ffi.h ${D}${PTEST_PATH}/include/
+    install -m 0644 ${B}/include/ffitarget.h ${D}${PTEST_PATH}/include/
+
+    install -d ${D}${PTEST_PATH}/lib
+    ln -sf ${libdir}/libffi.so.8 ${D}${PTEST_PATH}/lib/libffi.so
+}
--=20
2.43.0


