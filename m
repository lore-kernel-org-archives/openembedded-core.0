Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995ACCD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 11:37:18 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11612.1778240228035458603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 04:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=p6xFjBev;
 spf=pass (domain: est.tech, ip: 52.101.66.6, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA/uSsVualM07SuSwlOzLIge87jyDaA/YxZye4lAWpddxdIeifxOw2nKAlXsEsVM1kMOSR+sre/gG7gsNaZ84/fqNOurJlHye+Y9NouQjXNNaukS37wfJ10OGqkoVs2FPa9dh6M5KPT6ekS76xSb9+Ct/RXgHwfB4V3fdef/9seI+lXBmIgENWPfWhAla4uM6FfQEnc1JCfz/tP74WWOHWRjCCgEbmIm7W5nYc0UrbUj4Yic34B3JaHmsWtLgceJg4G5NZj1EBxnePigCYLpBvBFn6XqXHq5BnFLuvl2ECe0DTiz5LONWWfsTCyAmtsjaWQEjvdc6CqrcfbS7ajSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz0CdoVSSN+zZHpJSpXKGsmQfdpEy5aB7L1G8hNjtus=;
 b=ZQieYjcRejCW+AzFYKPtZIdJ8O5pKxF6eg6nZYjTnstMHUbp1vRoK9Vjw8PuOt7yMaJE7cGbuJcuHdcCXgEGFNrq+4mbgskT/XpT2dyLn88QxN21PUQlsdKiBhnD2OdTmsMKhjXD3MSpBbvH/PziMWNKybL2uKLyUOyHMbe1oDUEHK3rEA5eX7FiLP46X3GbvwfcD6vkIVwzdFI8Bhfa471ToXaFwbBW83jthPWEE+i33dh3+anUZE/ajx9X+6s6AS9/bbJrpzZH3BedlHZ7OLjkakk7oH4XD0O4aAEaPtelRbCAVgy9i44G0/u02srRgiKCSrYjqejlGFrtp1VJvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mz0CdoVSSN+zZHpJSpXKGsmQfdpEy5aB7L1G8hNjtus=;
 b=p6xFjBevKT/T1m8FFYqy0/4oDOZ8hoZ+fUaXSKbB2IIGfKt+GDAUQIbjele/Qr0xY9b9ktBPua2Bpnc37alPPiOa0BLapESkhfZeHDzYLvUiObQYafUSWpLu8JWE2zYqBN/gZlnIg6i/8H6X8paA6B2/ty/axBI2CePBmSiCghO/Aud4M0qBiNcpsciX7dQNGhMq+4oOh4Kf86jMH7j0czcNNuMlDx4tlOAs+m84hHZHHEq0iKOW2+XQHNu0nMxr+I9bg349p2oWvBe8WYF98wXFZCxWVnoL9FHToqF7aFng+wuTlAzAoTbaWEOsJUKM7vYhb236i/egQAoOXqRqQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV1P189MB3130.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:294::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 11:37:02 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 11:37:02 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] libffi: add ptest support
Date: Fri,  8 May 2026 13:36:53 +0200
Message-ID: <20260508113653.21478-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508102405.16791-1-pratik.farkase@est.tech>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:10:234::22) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV1P189MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: bce46e90-3e9a-475e-55f4-08deacf61f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	khUlk1vEU5xGC2j5JKM40J1aQMkQC7ZcRD8KRz8NAAWxQLux2t6TcidSzGUaVs9XqZnyz8l4jzHX59p/Pwdijcs2DOzhojIlVs6SXhNzPIlamfVazsa2snAR0zR9yghhaC8t7dVWbopkjAYZI6/+TrgJ5w8W2Z/FBV6Ke2XabFClVllr3GVJifbZDzZd0I/RXjCLjYDGxQm8HDyRW0ZmPbY+GIikLTvqEhiK3O+CIsbPiPYqvpK0UUFCTHtyBXkjzxcaOotzbv9BQcWib4aBoL2bAOgkaZNc6UmFBkeg+ZTl2hX3BV58pk1LVltXRcK52ilER9a80jAhhFc7Ur8k1xrPbSkZU60l7CxzmToxOcKGJAplKgTZNdW+q8SunWPtEqhELhzv0j30em6LjtgNKiU2PqyDaDWzA+K9PwzAXdRodxHcfDowfDwfqwjr78Y0nMZPodIOXpTRgcoStJ6v+YTvzXffbzZ0zRvr72IQfbjU62Vi/PuiHwfFLYwXXQcCGDzzaDsjOiaVLbY3mZnG91KpISZFMymbzhGdJKFrKFi2opchAluGbUCYPx46Sbx9OXD/G5L9ZDDucSvpKkQQi700o0hUInDEvQjJigNa8htp9hXDuOvrceF9Un9GBeGdoq54y+gSqmkW+GNdI35d4M3NK33EB8F9WjsbvoZ2MLXO5E4GHIVNyW1gb+K6Lqdr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GT6dKiWKjtT6nDBnUoJY+edZdFXQJ+1YqGoZYPZHwP5OBtULAZfUg+XjuEua?=
 =?us-ascii?Q?zOfyXH7AvELyUYjB85kR4rfbzM3dxDVCwbbgpQr3DdkHRZClgD84UtA81mUi?=
 =?us-ascii?Q?7W0Xkul8d2FNIAzUoZBLMXERK1GLH/XX9VTbDc5xjZWBlExAPaW38+n/su/B?=
 =?us-ascii?Q?k87Ur0I5hnMNSfGTrH848BqJiccuzc2bSH2sj+4pHOwveoqM6RHDjWVa+Ndc?=
 =?us-ascii?Q?a3ewYOqTs5FSa59bfMC8ue8R/z/79hSDg1zw1nhHphc7fmqt5IJdc4uG/2s3?=
 =?us-ascii?Q?Cc5SRRcAzx4AIDia2RzGScljMUtyztgrRgkL0g7XuwmF9PslobEwtmq4nRst?=
 =?us-ascii?Q?nu4umkAzIEwsGydAJkRkv+YvfQ11WZGY/tCrLNBlxefbZMWtiG7EmLSX4W4L?=
 =?us-ascii?Q?ThBUvYgdsUgTTESc+CvLtctJE+0/2Am7XmqKX21ppglO0LRBiXcYEawUVzML?=
 =?us-ascii?Q?KpbHmWO5awUeQHg/0KvE9n3hB+zNIaNlaOv1IgkRFPGAFFM+nwrxFygarql+?=
 =?us-ascii?Q?vT+eHxt/RyFdzV9IC7umzQOQXnaI8rNGcgGgQeBiEpPkUmiABwdJexpN2gI3?=
 =?us-ascii?Q?93ki20X2532O1a9l0rQ0eaGWTQqHmUIeXe0DR9MWlQkzPvAXOWt3F/Nm2Qhe?=
 =?us-ascii?Q?vhjHnBHOvS5R+hFoYTFUmud0pIumxsJpzLvbpICignn5TBMd5ONwavA/g5gU?=
 =?us-ascii?Q?KRvph0HVXXZQToxbIqzDLbMDjhe3eynJcOdslSCWRG30IGNK1Mxn2leAj6Xv?=
 =?us-ascii?Q?6KXcgVF4B7lZUISK01sFci8WeYpbauewEoNqclDoEPV99pBQ7PIsMo4s8CqF?=
 =?us-ascii?Q?thUoHTk1tduPn7SX6l0l7qO6AKtNrVOSYGRfrg1Tf9CweutrTaZ31mdbJkpU?=
 =?us-ascii?Q?yBOF4I3uFObILb+PKgJm76HItlI1fgMxMlddoGDQyO0nTqdMqxyXLSpOeXMm?=
 =?us-ascii?Q?uUtx/SGUlXC6MNlpfOirLIEZ8tgHtlOQ6KBTu5n523Im5ysZD3PQJwP8APN/?=
 =?us-ascii?Q?177JgwCCogUiWnK4Av4NsrYPGvQhZg5AF/NMoKznbnbPRUZNlPlx4dJ1/abh?=
 =?us-ascii?Q?OfkkEDMA1pk4HbArjIYuYPp+qDrkgGmFjn8EVJZJt5C3EWsEohU1D45YiEYH?=
 =?us-ascii?Q?p+F3xjrFfTNK7TWHK7b7EBk8f+tYORr4U8VoEo253WfponuWVrCZYKNpzF0l?=
 =?us-ascii?Q?clJhMbxTMjHcD5T2AspyXJfyOS+YWeN8FhYJhIF4w51jbi/zV9rsAB7AXoFN?=
 =?us-ascii?Q?3vPo+14rv6NERJ1jNYLPtoVCuCz5EeZanz3yFxDGNQUf76lxVeU7LUeDnrFj?=
 =?us-ascii?Q?jmhik0N3cjpu67H4ajqn20gCOzrIVRL+HihQEVl0z1ZivyjY3vjA6mTniYjF?=
 =?us-ascii?Q?xv2+Qw02Ds3Psav5TsMqVu6TX3BI93pbmFY5+4JvIE3M/D4r1Zeqdng3UqrK?=
 =?us-ascii?Q?uj5Du6VWRAQebnKIbWfntQo2KBiKs/NJ+YgRDCDf/VqZ9yqF8KkVrSFN+oKq?=
 =?us-ascii?Q?Nd6KMIBGusaqGsCDz50MvNEVFQZ17Vr//bEpHywTUfb531583RS6DQK60WNW?=
 =?us-ascii?Q?IWuq/VoUJYvJ1Qe9ipRHpc7V76PRlKMCf7IA6L7yxRGTproNXw5/hn7PKr2/?=
 =?us-ascii?Q?4CSCoep/xSKHMKv4Yc4LrGtqkKv/vIA5hIsd3QMKKoRU3esZOUW82dAOLMAL?=
 =?us-ascii?Q?m80+RtKeMEhiMgxw7H8oLiQBWR6QIf/Qxy9H/Z/0ouaeALy2+7PonhlsuUYM?=
 =?us-ascii?Q?xuNzQcQTuQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bce46e90-3e9a-475e-55f4-08deacf61f6a
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 11:37:02.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKwL55y5Ak1XHQCQrqQB4OK5FnMOCsq+9kGKYGWFBi9ZcKHV/aOGac0Xh3gBo0l8ONbzwyMvkmoUwjDp+16NWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 11:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236706

Add ptest support for libffi using all upstream test suites: bhaible,
call, closures, complex, go, and threads.

Tests are compiled on-target against the installed libffi. Headers
(including the generated fficonfig.h) and a linker symlink are installed
in the ptest directory to avoid depending on libffi-dev.

Tested on qemux86-64 with ptest-runner: 199 PASS, 0 FAIL, 2 SKIP (349s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v3:
- Move libffi from PTESTS_FAST to PTESTS_SLOW (349s) runtime

Changes in v2 :
- Include all upstream test suites instead of only bhaible
- Install fficonfig.h required by ffitest.h
- Add support for C++ tests (closures/unwindtest*.cc)
- Add -lpthread for threads suite
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libffi/libffi/run-ptest  | 53 +++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.5.2.bb   | 21 +++++++-
 3 files changed, 74 insertions(+), 1 deletion(-)
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
index 0000000000..9f72becda1
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/run-ptest
@@ -0,0 +1,53 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
+CFLAGS=3D"-O2 -Wall -I$PTEST_DIR/include -L$PTEST_DIR/lib"
+
+# bhaible tests validate by comparing paired output lines
+for t in test-call test-callback; do
+    src=3D"$PTEST_DIR/testsuite/libffi.bhaible/$t.c"
+    if gcc $CFLAGS -o "$PTEST_DIR/$t" "$src" -lffi 2>&1; then
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
+        case "$src" in
+            *.cc) cc=3D"g++";;
+            *)    cc=3D"gcc";;
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
index d3aa90d429..ec2b8032d3 100644
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
@@ -30,3 +31,21 @@ do_install:append() {
 MIPS_INSTRUCTION_SET =3D "mips"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:${PN}-ptest +=3D "packagegroup-core-buildessential"
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


