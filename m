Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278C6C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:27:30 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7761.1787732847841191793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mLPiwxtp;
 spf=pass (domain: est.tech, ip: 52.101.66.66, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2lMQ9oXEl8MAtJuiPISeJkYv6Sl2c+fXxoAqd3fewA+u4YT8NgI+hagBN7blvwZKBj8QxD9yTUfBq5Y0sXRUfLo9C+LkLzxcC3207ZxxMJg+YOXFS3Vcub8CtHNf3TxxpvrNpThMWUh3Jt+s3CX+Ly/rBIhvcnmJIf3A6lj5iF0Ypw8LsV2kqPcvczEtiNQmSuCZbHVhNyc3PNjE0/LZLLZeGUWwZYQe4IHFlvazzEcSRYmNDkjzgZ80zKOTQ41qBazrehTjx7cYs4Q5dCRXvNqsbTp2Yqv/q+5dImcIDPUgaYSX7yG5z8LjYltHRoc5IcmzuouOvLgqJAdiT2sHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycShxHo/UwVroQcyvpZkHk6tx/VSftztnQhnBAhrZL0=;
 b=jtBlLArZNE1rP3Zq+23c6gHGQTcXdydRAvInTAKbt68i2didJWF/mI0I3Vpetjn31NTE431pKX8urE90vm0GpDor28wJTeulfUfUKmoRK5ZnK45Au9nHP/r+IXHXdcdllrKq6XcspQm3KTQ5JR2aHS4MoKWP+BNcVBQmH8H1Luncz70pXPoUbEa1e0sHtTThCO8yuJhRV+Wh548i3/AbPtlM56+VK3IzM8b/bMPahM8aPZH4EsyBlpSI5YswGA9ivH2oIehfQ0QUQECuNMfKAHriDmCfPCcIl48oy+pLOD7U7i8V0PlzuT1bfmi3i1uQWkhuiysR032foH5O0hy8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycShxHo/UwVroQcyvpZkHk6tx/VSftztnQhnBAhrZL0=;
 b=mLPiwxtp7gmfOhPA+GPxYXBCxf577EkeEZGN6ur79oBZFXVVzh4beIJSoI/IcyhmZdaalBQkZMZ9WQ6NMxhXHnROpaE5idqCX/aYTVP9QY+UJcovmrKC7k1ZdcohRb7Scqcf/qR5RCk2aBMhojDc4CgD4WdDI2auITqYaKAKjKOXdIjcDgxHI/fCdCd8yG2jqd58//bKWREflfvfe5ftJvdq4MxyqvuQjEgCoGQQ8OoWc8R5lv69fV9RLs7GmhGx4mvQxVhfNwFh+n+V1QIQdRLYVtFk/C8ypDvhkGIHPQkj2n1xA0jkp9PR1J8iaIdI5VZ/6BtD32AY56FEVQePLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB0839.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 08:27:23 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.003; Wed, 26 Aug 2026
 08:27:23 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] zstd: add ptest support
Date: Wed, 26 Aug 2026 10:27:16 +0200
Message-ID: <20260826082716.15560-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519090816.17783-1-pratik.farkase@est.tech>
References: <20260519090816.17783-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::24) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB0839:EE_
X-MS-Office365-Filtering-Correlation-Id: eee27dd3-d857-4cca-25cc-08df034bda79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	AvUEyNua1MdFu2s4rRNEF8FX56NUF3FMNO+/g3+CGRR15HGixbhMAI70bRp7yJjPJiVfh/Cs1dcspfFBNLsyP34viutciKMr9AmG+eaqw5dKxvbOzh0MwlzLq9yI4k6SFLHOE1vlozO27u9QuOv0qMsqhs/eyhk1yxoSb+o/NJE3G0IPt8MsjKwM4RXGr05y6X6Ul57F9aA6YaRDHrfHZ5/2f5O7n3GsgkYPe4y+ZYGtkgxHGbmkLExc3GfemHzQqvX6FOx+m9onEAnY1ThHeisneOk8m4rE+gSNHudWxtEseOwKWExox6f1IT2kw+47Ldhs/N9S/wf4MMpQcPle52M8B8yFFYb5ADhhADNIjvRwtnlCAC64cjKgmSKx4/Em22TAQWjptfFQsw+brPHJZAxFYrQyzID+XCHPF+lmxtxdvn5QHCqQT9hTQYGFcJq27A2K/jiH0SsPoSNYdAS4/v+YrnDBVbZc+qFgFhj26zSu3LozpgSUtlg3WWWUdhclJdp8NvHEWOgEEayDbmt1QtWXyd+G6ihY46X9ena6yAX7r6jzFmV9kXiu3jYIKVWVWbTvzXxcENdR6OdeCYfJXzA04/A2YZjv3TcdHIR6yva2XMv1FrIU1kV7tPzT0cRwzjzdU486K7Rapuc0z3nDzlA9XJlCzXATuX16lvaIbnY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aUyZjHtHDapRbGuCeLQeMfSrytvdGJ2vjT5fB+xLcd1svaWAOa2lQ9a0cskK?=
 =?us-ascii?Q?zZwGRkif6uggkEuoYNegrimnFr1ibKe4A1dX0V8yQX6xpGAxFPhGCBiEiAb9?=
 =?us-ascii?Q?v6gU7LqhdeGtuWEQdtkCLgmaFi5Pc0Q4fR2WM3RvJiiQkJUl4/l8v+zYZVdi?=
 =?us-ascii?Q?zIVqmNhDiWQ8W/eZSE/giRkQLGhkYG7bAqgf8kI3OZlKmupiw/RuTLUJtk2+?=
 =?us-ascii?Q?IGTO0q0Qn20ij9kDiTP256e13slgjPyYuKjTOZz5/YZbqntSzRG1Zi0bCAJY?=
 =?us-ascii?Q?tUPt9ikyEg5XMuYQRvA8XPBWYPLnMmV3hoDOw+Tg/MvuMtE02a3Cs7nQtNUb?=
 =?us-ascii?Q?LNAOTP05M99sV/Yh/Rp5r2W3H0y4mOEyYiBjuU5zgcdaHPVwuKReAJcNUOre?=
 =?us-ascii?Q?uQ+vJuhFGdHEdagFYgkoEhua9TIl7T5oxtnIK9bygZ8lNfmC5ouxNQjFAnWb?=
 =?us-ascii?Q?nzhuByimSmudFb4m48xT2aidcUGprkw6muMiT8BiPPsqhCr+aAcjgcRYjyyL?=
 =?us-ascii?Q?vw1AM9POHT0px4NZgSIyg1O96k8LU3/qBt+HssMs/k9wn79rLBFBRumMye/x?=
 =?us-ascii?Q?Wf6lVoj3ZmeltDK7wdlmYOA1iZQkn8Dnb8EeuxbTtOFaOwR989T+kb3PVozZ?=
 =?us-ascii?Q?dBnyi5zQWHTElVAKzwxqXHSHTEf01zNxb/PaJVnhyrOuJltzo9sE0oQijrNS?=
 =?us-ascii?Q?nsdlf4wMueMJYW5sAnemabkQ+pgGQOE1lPwSWheltwuWHFURvBEclL1gZMk9?=
 =?us-ascii?Q?f8VhOdrIGge5T9BK+znsHdZItV5W+qOMiGx22MoNRUe2EjsmNc6TDXowUi05?=
 =?us-ascii?Q?4gIS+bYgyq+igWaLDz8Skl+dXyjVYcR1pi8Z/fTN1xk6JTUEvoHfp6N3mame?=
 =?us-ascii?Q?u64n9h2BzdEXXXSUpIJyjwTafusvO4D+z5Nc6z3gLSh82SlmrOz4N5mAarSf?=
 =?us-ascii?Q?03AM/S1TiX8u68SlcZW8DBefqBYHS0dJbVAr40zUq/pizTZhGS+32f6Q2fSW?=
 =?us-ascii?Q?Z4AHgwh3nvvqJrjhu3wVFv2K0Xx1poLzf75dRnZ2MhfN6gpe16SdLWpNei/7?=
 =?us-ascii?Q?DtOJPEgFT7SvU/JEw+A7zMN2mo8bLNVAPc+bX6BPaCQBk/4urOTBAZbvoc5o?=
 =?us-ascii?Q?yl5Cex0ZdbhEwdBDYg73y7VMoCvc74M82h7NedUmMZFZxdeVPAU2uDepWBvt?=
 =?us-ascii?Q?zXRlv1q5MCoVs/VH0/DWT/zJkb5dI9rPQDp1zMZ5ac7JXAac5rryyDT//+L3?=
 =?us-ascii?Q?Kfda302BwAylD1tVg+pjPYBi7Ix4OQdP4VOTUH0N3dhICIW2Kx9+DiM+Y3ci?=
 =?us-ascii?Q?ZQ6dobFftyZ6lAeJr+QafPwr43i6F9CO+9qbQFafgS7FObcQBbrYujUKLeZY?=
 =?us-ascii?Q?Smp+grsFo80yEJkucLj/f6038gJT6w8VVM0SULnGjjhceqwcPyegChWanhb+?=
 =?us-ascii?Q?dXfGOrCFBRHu6rPEnSzTbhBug9jwKJrmSYI6//HdN3C2gM1mBIhuap9Y0S0s?=
 =?us-ascii?Q?VC9IaxEKhY1xRG3cjdxT+Z43ip7F/HRr3siH3+VAUmAOZG4CWfu9Z8FjLWIu?=
 =?us-ascii?Q?L9sKmFQCkKUN5H6Vdb2vF3g4PygM3+5lunNhAKxeJEODzkR92pzn/eD8G2dQ?=
 =?us-ascii?Q?M0M5GteEWvrXZIZiV3G7Eca7qelAXWDpuA/ToFOJFpnFtOEvu9tSPlbfHIE9?=
 =?us-ascii?Q?uSK7mQ98wK/lrDcyPSd/WzWtZIwjgupFFbhaZtcVnNwEx6qEyq6GYexpggHn?=
 =?us-ascii?Q?FSGzvUEHcA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eee27dd3-d857-4cca-25cc-08df034bda79
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 08:27:23.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cl9uMnkQ8pzly0mBkzzt8x/c+KcAvH+OjfNsvMU+sQeBUz21SFeguim/Fmc7ekS9ZZiQPahjC32AY10V/sVzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244365

Add ptest support for zstd running fullbench and the upstream cli-tests
suite, providing integration testing of compression, decompression,
dictionaries, file handling, and CLI behavior.

Tests included:
  - fullbench: validates all internal compression/decompression functions
  - cli-tests: 36 shell-based integration tests covering compression,
    decompression, dictionaries, file-stat, progress, symlinks, and
    multi-threading

Tested on qemux86-64 with ptest-runner: fullbench PASS, cli-tests
36/36 PASS. Runtime is ~32 seconds.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v3:
- Reduced test scope to fullbench + cli-tests only
- Removed fuzzer, zstreamtest, decodecorpus, poolTests, invalidDictionaries=
,
  legacy, and playTests.sh
- No longer requires 4GB RAM (removed QB_MEM override)
- Moved from PTESTS_SLOW to PTESTS_FAST (~32s runtime vs ~13min in v2)

Changes in v2:
- Added source .c/.h files as training corpus for dictionary builder tests
- Fixed cli-tests invocation

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/zstd/zstd/run-ptest     | 18 ++++++++
 meta/recipes-extended/zstd/zstd_1.5.7.bb      | 41 ++++++++++++++++++-
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zstd/zstd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index ce6c0a2d76..3f3a38f9e4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -105,6 +105,7 @@ PTESTS_FAST =3D "\
     wayland \
     xz \
     zlib \
+    zstd \
 "
 PTESTS_FAST:remove:mips64 =3D "qemu"
 PTESTS_PROBLEMS:append:mips64 =3D " qemu"
diff --git a/meta/recipes-extended/zstd/zstd/run-ptest b/meta/recipes-exten=
ded/zstd/zstd/run-ptest
new file mode 100644
index 0000000000..5d7ba5c352
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+run_test() {
+    name=3D$1; shift
+    if "$@"; then echo "PASS: $name"; else echo "FAIL: $name"; fi
+}
+
+run_test fullbench ./fullbench -i1
+
+if [ -d cli-tests ] && command -v python3 >/dev/null 2>&1; then
+    ./cli-tests/run.py --exec-prefix=3D"" --zstd=3D"$(command -v zstd)" --=
datagen=3D./datagen
+    run_test cli-tests test $? -eq 0
+else
+    echo "SKIP: cli-tests"
+fi
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extend=
ed/zstd/zstd_1.5.7.bb
index ef0bd54c9c..ae52567c8e 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0822a32f7acdbe=
013606746641746ee8 \
                     file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f0 =
\
                     "
=20
-SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps;tag=3Dv${PV}"
+SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps;tag=3Dv${PV} \
+           file://run-ptest \
+           "
=20
 SRCREV =3D "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
@@ -44,3 +46,40 @@ PACKAGE_BEFORE_PN =3D "libzstd"
 FILES:libzstd =3D "${libdir}/libzstd${SOLIBS}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${S}/tests fullbench datagen \
+        ZSTD_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    # Test binaries
+    install -m 0755 ${S}/tests/fullbench ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/tests/datagen ${D}${PTEST_PATH}/tests/
+
+    # cli-tests
+    cp -r ${S}/tests/cli-tests ${D}${PTEST_PATH}/tests/
+
+    # Golden test data needed by cli-tests
+    for d in golden-compression golden-decompression golden-dictionaries; =
do
+        cp -r ${S}/tests/$d ${D}${PTEST_PATH}/tests/
+    done
+
+    # Remove tests incompatible with ptest environment:
+    # levels.sh: --ultra/--max levels require >8GB RAM
+    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/levels.sh
+    # window-resize.sh: 1GB window size requires >4GB RAM
+    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/window-resize.sh
+    # compress-file-to-dir-without-write-perm.sh: ptest runs as root,
+    # which bypasses filesystem permission checks
+    rm -f ${D}${PTEST_PATH}/tests/cli-tests/file-stat/compress-file-to-dir=
-without-write-perm.sh
+    # cltools/: zstdgrep requires GNU grep --label option not available
+    # in BusyBox grep
+    rm -rf ${D}${PTEST_PATH}/tests/cli-tests/cltools
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash python3-core python3-modules"
--=20
2.43.0


