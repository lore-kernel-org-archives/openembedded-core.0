Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305B3CD3447
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 10:24:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10651.1778235857143625906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 03:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ff8C0XIS;
 spf=pass (domain: est.tech, ip: 40.107.162.27, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOkQBueyUio0oZdl50NY0WBfht/5Pr7IohZ4xg3BA/QhrzxuE4GumTEHAbCfh21AQw/A2Dofc7tcB6u38RtmCrCUxIKz5egGBej0CdXfyfmd3uIpRqFFtfXXRNx5A27TYOH3DEZ9vrBpV3At5i3II2nIOT/AAhhlrM63UPOjOactkLf/tNfuwcVLP6xu9zb0YY7aXy6WkkmlvzUyrewSQ/fEZkry9PwaOlcDu+n43j6wv2i5TITdRCn0ZkbAgQOitWZtv9Eh2j5dJaRLNfyN0ktjWk6jM/Ukj6uYRS7STrtIcr9Fs79LDpT5wvIvNV+TOy1my1QVXh3f1rIUaX2TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHROAT6/6bZhN7E2hwYx0Ci8YYdl69IuhKzFpnMN5Cs=;
 b=oPiE5yxCGBnMMg6DUAzSbl8Eb8wFlSxgYFeOYuVW79fmz141s2houXKc/orGp5C9arXMc5rinAeOD8p2Hgdkg+/FFNWq5ehhYAggVP9wJ8gzivFh2cV0Ey1IeHK7xfOUudmbkc92+LDXQGlGcd6BQiwVFjICnFer+y3a6spufXDsiAyiYnvCRa4WZksxhmggsxD9f1xUbQfi/0+MpBbSw3jDZCJbu/yX8MP6g31Lg0jU6+H5os1ZATmtinwZVfY+NeiTBVOQseQqACTue6sqqDE+qRGWvFMdjbhvOWT0+WKA5ETQuaEOg7tBJCp2MHltJ+kCxBlma3N7RiyKuBRLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHROAT6/6bZhN7E2hwYx0Ci8YYdl69IuhKzFpnMN5Cs=;
 b=Ff8C0XISiE70f+AtDCf6bggZY/064rwC4FKH/WbiB4RZgSFa5AlLYUd0OhlT1Bto+J2rmy4fRMwMnN4stSpgigv13UCQW99CYOsHK7tAEI34jXWhnzkFtfa/dSOHTB7UqWa0UAiGK1SDOWTxjByJQYGMhNZ8FBoJIZKcn1H15Tt/igT13XdiclMTAStE/GFbXsxgaYb2QuYFIDgIQdpsCkCpmStYCdJ87wEfRky6ymRjU1VCxDI21JeK7fWhkM45FyWtqTWm9hbKGKgfawPcTu3P1fTl5dFUH99E0ujftyeDZyxC/xGA9sNcWYTUzb6Unk/7aMOtRZY4J8eMtweH/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU2P189MB2521.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:494::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 10:24:11 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 10:24:11 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libffi: add ptest support
Date: Fri,  8 May 2026 12:24:05 +0200
Message-ID: <20260508102405.16791-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507085242.39646-1-pratik.farkase@est.tech>
References: <20260507085242.39646-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::7) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU2P189MB2521:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c93b9ef-09f2-47bf-8ada-08deacebf215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	x00CJfhBR9rouwr7XwZwaau5Fqa68pv2AhtuMUuYxFrMfZG2uBXhHjik+RKBMVY+IIuQL4ioQDWBqaPmDpFJJS/5YkWjjTIXyhnFGNlFfU4/0HAt4idOQ/Gu+nic0oOPxtBNfCiiiGg7QXgipgZOQFFkBKCtTTfF1/hm0dcanUtVEKIhlTyZ0sr82P9IyD4uDgAYRTNRA5nRBV9Zxou2mKoAG4MGTMHj0lOsI4keEUw/2vX7X3sL+PzKbnNDE6nkbWlMN4iT6IEaIHc82sGPFiod6EMl1k9RRDYjbytGuHk3WrQX05xYdgB4u5uVYx/aYM3RBhzKHweTnbNicceI7eFUsyljpJ04KUJbAVz9i4/0QOxUdgNpuq/nxYDBs4TBUywtSoxYYCLSbZyDdmJXzvdqjTlEFd+WE+/H+Ks/ksH29+qnohvhFyRQEXt/Fvtq0bVWYvANRgdsNmeYjqTUpMG0BDK+rgTlJ+IK1/vtYVzdqnrYkGjpzN79wyqui/985JMXVszSKHsIs7n3SQvCJzVHbv0iK7//w6OusIEnRvy+F//mLKN+iNrSaBahgax0XaSfFqfzg1t6K46N13WoiGkPnqacwaMnbEt5TfM7LbD7pxPxNqb7MmJ71iPj/pL39pS/xYKS9XZRFAnTRZJ3uYoBo0JRth96TKJg7zp2TZHEVY2m9F7YwFim84URsO49
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uYjF96facsDRS+wTJvXHNfjDokGok4eBjKaujhqu10HpQDgoT1FThTgxLPlG?=
 =?us-ascii?Q?yG1TGz4CNy7SpLnVyY4W9LGNGDpEZ05Djynncw7KfCaPhSfX/Cy0n+kMqu+a?=
 =?us-ascii?Q?OgU4sOE793Y3NiDzeeI3/6Fbbp56Il+usnp6CHr4CBwmZ2wqPlVCH8w+vxWj?=
 =?us-ascii?Q?8LLIfYB/Yt41XninI4tCxambXqF3hQXNmPYNu7kTQEF7zDJro0UDXBMvdHTY?=
 =?us-ascii?Q?+GguFDt3v0CcDflVGJd1nbVPZywHLpHvGyvLZbFlL09QV6ALNHVadw8EMArn?=
 =?us-ascii?Q?J3NU00dN1EkxUq8+L2VSyaVKUaXKHh3OdzoDgfQufwwhBKnsykb4q9br/O5G?=
 =?us-ascii?Q?6LrTr5l/BaudjsC4hss8SAjXwsoicr1Qn8K6rU7KHcsghDSFDDKssKCZKqQD?=
 =?us-ascii?Q?k+7X45xvYd+Z+XTlkXnjEjU64NZm2FT/bvfIYFgagG4t4n16g/DvD2y+HNpv?=
 =?us-ascii?Q?XD2fTtWvSgzaX0yQIdLtYLm/RN0vRd07KCqWH+H6ZAvEuNAdn8MgG10C2J8u?=
 =?us-ascii?Q?cSSiGllMtPqL35g7RH4z/LAv07FHkrocRzlAE7cn4UGzRenxmZN0Ril1+kRK?=
 =?us-ascii?Q?nZFXz9NfpyTiSNlr7EK43hZvt6e32FqckTxLqF2LHVbwkMK8Jijw06AuqvFP?=
 =?us-ascii?Q?oVPZyIXzG/NZzboVsNPJk0+ZzvbdBn/TG21WAzTo8qxfmNUhfj4nS3nAqtTU?=
 =?us-ascii?Q?4vrD0vVJ/1urzrkaCdrSx3GBakmueaql1fMx5LWyMQOAZ5PKjUbUw7PH03sc?=
 =?us-ascii?Q?wALP0oV3IOZg+YxERTI5SqoNwdXWC3umCSS/PwqqO6Qs0vmG8X9ytPtDsfjf?=
 =?us-ascii?Q?vIqA1TgQsGq/glml7jkliEXgvKf/IRKn1DyPy1xInP586Ag5SYi02kQYpt7q?=
 =?us-ascii?Q?AtQaOtGGaSwn2HDXrPC1UM1SPwopTCPDaqOVQDK52R9ZErtB11G76Giw1QpE?=
 =?us-ascii?Q?tzUCVPeFUojBDI3S1XGmehCB3db/ktluwoXkMMiGHaAvtnOQlLikBrz7HBmq?=
 =?us-ascii?Q?cAenLpSXDO85sa6cinNe40A5PcrggZH5jQhRU+OXgEyYD56QuSc+LRIISzer?=
 =?us-ascii?Q?z7jgE3Y4smCUf/7zttSy5Zi7/wZYmkmLfl1lNRwcFlwreQTlcoNFG6+lnjs7?=
 =?us-ascii?Q?+KexxqDwWON6e8v1e5YyJyV/HTJxUgfmHSGci3haPAXm4d+RtAtVVY5IItVa?=
 =?us-ascii?Q?5kzsryZMiFNQ6muSLyRnYJy36KUp5OLj0BkWQcK1OLrlKAEJ2gvF0HI8fpqk?=
 =?us-ascii?Q?kMGa3yaKL7wMCdVmck0zKx5aCNEaEwUKqEFgSwg7Kto3s0gG3+qhQtUcVJNq?=
 =?us-ascii?Q?fFey+mUj4u+GDv+ILHXylwHV5xfjirobPinYg2zt5ZvdtU7cdXfD9KpM26i0?=
 =?us-ascii?Q?+hy20cKML1onkJX3HoRrpO+v4+/mpm5RC640lNA/xuc+AQwwd24rA3fs6+8w?=
 =?us-ascii?Q?C5SW/aklat7tYRGmT3evAsI2mFEg3O5VYEZA6OZfzGh882QMJmjfg1hoZq/l?=
 =?us-ascii?Q?451VrrHPjpU9Ts2Daw2+WXvc1AVdudTZiFaiyYDs51OsXJI6M2pxHmTXDwCo?=
 =?us-ascii?Q?aFi58Fx2feRWKddUyZgMtRQFO2ZvXDNnf+wWWXQW31BjuRSYi3ppueehGoDl?=
 =?us-ascii?Q?hd2NeLsbxNIONSO/gboc0iiCwhbQGZ3vQRgvykwEzyvMITq2Wl6VfM20WlAi?=
 =?us-ascii?Q?HJObPun6+zTZZfHpYrj6V0r1iIZR+AYXpMxaS7gh531pS7KIXhsHBUa5u8v7?=
 =?us-ascii?Q?D+yaZC+5Zg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c93b9ef-09f2-47bf-8ada-08deacebf215
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:24:11.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nO8AJpp5y7HqixCSQATIYg3CdNWA/xqHD6txgPLN3ttATxQvprIKJzVdOC6rcVDOCRJNIN6Bmlwu7hsGITSuhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P189MB2521
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 10:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236704

Add ptest support for libffi using all upstream test suites: bhaible,
call, closures, complex, go, and threads.

Tests are compiled on-target against the installed libffi. Headers
(including the generated fficonfig.h) and a linker symlink are installed
in the ptest directory to avoid depending on libffi-dev.

Tested on qemux86-64 with ptest-runner: 199 PASS, 0 FAIL, 2 SKIP (349s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
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


