Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADDDCD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 08:35:12 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9233.1778229303377769779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 01:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Sd6nmRvZ;
 spf=pass (domain: est.tech, ip: 52.101.70.60, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9aax7WCCbj/nl97/+nYKq2YAJQyJpDk4zCw8lnw9W4d6pW2JMdfZmf92TuqFAjBHdcPPqXYdBVgwSSnZ1mit6MjGRdu9cYw27SBrjw8ZLdmDz6la3a+MDmT9yxdYn6qHEYWiDiQJo2cdgeGICFg1W7sj3y8FhesrDAmcc+y6106cuo9g/LZK54F4hkS59bm/7LIUJagZuAX9NOe6/VA8F/3sqhu/a4yhP5s5ha89N1sZb0J+LgYD9iy292bvpL5XjUF3vC9/tXsflVabsNMJGCqs1YAH5NozS4TX7rH+MCyxodkXc3ZEJX+A8Sur55SDaqxbFl5sLycKUMj8GPk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Layhwg7hCfxzSLJyQrBSc+hZjegEFnJgaeQ0NdpnhsA=;
 b=YFpEihhYDWUcI+/eGE6rWwU72hK2tsm0sixJAEhK67evBckUVUh95dCv/eoRaoXRYfnrL3zjg8kvkGCFxSEhBprmRjMGxBuWAuiuig5kHGR55edDV4ZcQ5ZT3Oio4PNaZw9YtZt2PBf9FcwrlFD/Hxo6IS+F4+vHSBrQztHZgGE3lSSevV4lzQKbDpba5rBsz+FBW4yYkHGx7gnr6j0RpHgGKVlA3bE+P9g/odXznATX81hhHlHaXhUSXjwkZmmxX3Tgy3s+lRjjpqGoFGOXz6pKL3boUHCjM1pzCux9OQ3NZAHDffnLk4kK/FV2CWFgCkJsQdGM04UBiTpVftizgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Layhwg7hCfxzSLJyQrBSc+hZjegEFnJgaeQ0NdpnhsA=;
 b=Sd6nmRvZEfpTD4TEiIJZXu/PvHRW87KtkmH4K3e8CFl81V0+62jm1U29xgICu4zetGtDtRRq3Y1bxzaze2bmRCaWhK16KXapOXn9BNASH8H50HhN1+hTdoYbfiY7//1IoiZR5mowY8VkdPjjKRXde1FeL2RuaTX7IGMu7dCGMwJ98yZFGevOzOvDkspfJx+3ANYOpHd0tHgoqF+QoXGz0HECKf9M6gheZ5zxYxZnc8VWj+a0KyVEz4ENFiNNapRBXEhWuvrlN0o/5f+t2lDLP4bCMT3eDJxHL1tecnbFVVO5XsbBwlRy3urFNfjT4tb1sJ18wFEG1jcQqet5UTtqRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU7PPF0CB1E7010.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ac7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 08:34:58 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 08:34:58 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] zstd: add ptest support
Date: Fri,  8 May 2026 10:34:51 +0200
Message-ID: <20260508083451.11094-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0194.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::19) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU7PPF0CB1E7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e587bb-9b82-4a5b-51e7-08deacdcb005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1Jjau7Sl6fBgQ5/rUzZFbTy4L6Ja/tRep7S/lVIm4e+m9OY5RZy2ZAoPteLM8/aCQ3+lSu1SYu9UlEzepbHXy/PaMFV3mqoY8lJ1j0ki0D150toGPp0UE7CFRj0478k7axvuSC84tJpCk+ykHSn/L8Ve0nXvMXbJhUx5rU1tl0E04QR3WVHswx7L3W/Zk9NmdD+ngYB4sLqiF0vjCy7ekP2+9EiAd/nAP6IRQ7KpGiHNGnMxWAKR0cXt9HjHG3qq94H5lORTHDeY0HyJh0PUsFvjCoj8M9qzYghWZGFKdsfNMDupr7tgjj16QSI9E6MO6mnTwCM05nWhriAS/OtCvzmUrGxQ9waNAjxsEqVF3acjsuEivs9oHxM74vNTvEp8gQY/POpIVvfoaN9Y2m/tZedz//CS9N5e97mpONsNupAPdnyh4wmxHSrhEVpCx5UDVHsyMaE1lL5R5/26+/D8Ot+hK1/KRaiL5Xr7/sTeYQawtQnoa0YVc+MdRObUJWNuOpbKL4RgUz4DpC27eJ2YUFXoXgl0fm1rf64S+JCJjc4xOOLQzVszC99CmLGwlvs4AQ5icDoASvmp7AFtBZ2m+WKi1ZaonRXMNhyVPu1HRLlRvKbQr7fl4ZWWUdR1BH3g+orNfEVLHPsqEakZYbXe2prfeDnUuWcWykirzXpD8yoMBkKVm8Cv9Yq5gHMc0jut
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Uxz7h6KuPd9hU22ozx6m4u07vYbDVcmBwdjnbxW9pSjZUGb91c18JEissLrD?=
 =?us-ascii?Q?FzXNddtBLTJ9HMVqDyTPL02tS04Bx4JJk6yFrXxtdbqXTbt5fXGOq5uFn7nF?=
 =?us-ascii?Q?BKovZx3zseFocoaGEHEbQtphlfqaG2f963756gBKO4tW813uZq+vWmfwqqRD?=
 =?us-ascii?Q?g7MVsIzGP39Zh3T3XTpRLK/LzBKZLecINw9fBJwDhOsfERyQzJ1thu6B7vUQ?=
 =?us-ascii?Q?MgK5+j3nMoiPoYGpMZWmXRrQwQb81HxrCj/RQ7UcsqM3SSXUgkQb/MWXzZQw?=
 =?us-ascii?Q?gKqaE6+0ebtv4yz79bj19IzNwfnK+v+RoucaKypOPQ98IGN4ee/pEjJSnEaC?=
 =?us-ascii?Q?3sQjp6CCdPkwV19Rt9RcfhNfAXtOJNqFyMeXzlVG2B+/ZKjDBd4dI9QcW4fN?=
 =?us-ascii?Q?w0CxDE8Fk9lKidyLf2eG6PdTJ8c4QJ6CIi0wGtWzCj9bwSlRELsblmu5yIR5?=
 =?us-ascii?Q?pi0t605kmaInOtn54r76DIm/uPEbBNvgDZ1g8I7km+ICnCqh1iiOBzHsHUWJ?=
 =?us-ascii?Q?jpn3jNh+OkkO+fhLm6gPm7gGG5zGrbgVjEyZJ8UQfKlAeZF1BFY8RGWwf7Xu?=
 =?us-ascii?Q?1UQa7Hq8tBC84pc5cv0FkbkW8Y6L5jUTon5RFgCQcRZsjHOVR3LBWkmpM9J/?=
 =?us-ascii?Q?T+wo6lbhv/l1fGUXuJ55pmmOXGO+4mUSlEUVB1yaEGiYEJjBcpZzkZgAuq65?=
 =?us-ascii?Q?s5uArUZ8SJU0huHjMR+2vV/9dJtQ1gMzNZCjiMhTk7zhyh9M416rNeelHAAU?=
 =?us-ascii?Q?7wXL3F6NQABbvRPxBXKSfhIkxcjwY9w/1WdFT0F3Nq/aMvOq+Xl2CWVbwbTn?=
 =?us-ascii?Q?IPOmp1xIGEFOA2XqbOyVpKlDNc7Ku196IQKlPJyK7cO87lWbtljTchZGLXhv?=
 =?us-ascii?Q?6QGHwcKEz5WpUeqfM5v2FDihgi8cR6ea1Ledk5c/rGBWBK4q6uJwhvM/vo+z?=
 =?us-ascii?Q?lRmcAC1hRVmb7PlSydDeNpko/L4DW+ywrv/V2w09XQJTHXtFaqNkHbA4zY3U?=
 =?us-ascii?Q?0EOVlb+8vMgLe3abrln1ZPpqFfmwAOIg8NomZKyDtw3Gyut8aodS6bklhZfQ?=
 =?us-ascii?Q?B+ZdMlvUGjyNGGZf0t6SFBv8q5qnan7er8GKir/04kpRZJg/s4Gf+5sGlzjh?=
 =?us-ascii?Q?/XC4yzVOd0GOb9me9dlbLdzFD/rRn52t5X05GB5QRfm5TIxskzJfMho9eBUP?=
 =?us-ascii?Q?js3WJOBuT6hCOb8GbOIE/oG8KoRSzfxIVU8rcyRuApyruwf40h1fmmQwg3c7?=
 =?us-ascii?Q?t3yGKHT7RRC593u3LxKHIq1CleTUjfd6G1KjO+mYD6aN6f7OOosy7apzZ2b6?=
 =?us-ascii?Q?wJ2AVBjoz9/FjiDQtnoxbpwgC3jE5L3fYWLPQxWjAi6PQLG2WwZOF37yWwIK?=
 =?us-ascii?Q?e55Hu3UqbPvtbRnbL+fwDlJVkKYNWxzy42BYLdO1wfbCSeuayDieLZ+m/67Y?=
 =?us-ascii?Q?bfYnZD+noXzsNk67gabnLle9n8ojYliS9955qTH0BnOaTierDF6YGj3Mz/YK?=
 =?us-ascii?Q?ByJPmlrLYbGVs6FbAxQni8sxQHyIsctwRnzquXaR1IWUiRawbHV+vMK79Rf1?=
 =?us-ascii?Q?6LBS/It9qnIFDUxFDqf4yIH1Oo/AQ0aXCeWCBB29nNcT8U6avVFQuW0+LNTa?=
 =?us-ascii?Q?b3DMIuMAy9H9CJ48q/SZ7TmlxyupfTo6aPo8WNBvOEIllLlIePil2j1LEzmq?=
 =?us-ascii?Q?a8jyowt+t1Kyno+ZyfgAxE6qKrO7kVqbJnc9jplZBP7D5NnoKyXWhU87t1pt?=
 =?us-ascii?Q?ISS7/2fyUg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e587bb-9b82-4a5b-51e7-08deacdcb005
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 08:34:58.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwWnWBbInLcji9cE7EBwaBJqiLco5E07o3tk1s9ECVcy2PCzArZIUoptCxGQpsH7FFmojpZnIfjP2oHwFkwskA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF0CB1E7010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 08:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236697

Add comprehensive ptest support for zstd running the full upstream test
suite covering compression correctness, streaming, dictionaries, CLI
behavior, and fuzz testing.

Tests included:
  - fullbench: validates all internal compression/decompression functions
  - poolTests: thread pool ordering and synchronization
  - invalidDictionaries: dictionary error handling
  - legacy: legacy format (v0.4+) compatibility
  - fuzzer: randomized compression/decompression (200s, ~700+ rounds)
  - zstreamtest: streaming API fuzzer (90s, ~250+ rounds)
  - decodecorpus: random frame generation and decode (30s, ~450+ rounds)
  - playTests.sh: comprehensive CLI validation including compression,
    decompression, multithreading, dictionaries, sparse files, frame
    concatenation, long distance matching, benchmarks, and round-trips
  - cli-tests: 36 Python-based CLI integration tests covering
    compression, decompression, progress, file-stat, dictionaries,
    symlinks, and file handling

Tests excluded from cli-tests (environment limitations):
  - compression/levels.sh: requires >8GB for --ultra/--max levels
  - compression/window-resize.sh: requires >4GB for 1GB window
  - file-stat/compress-file-to-dir-without-write-perm.sh: ptest runs
    as root which bypasses permission checks
  - cltools/: requires GNU grep (--label), unavailable with BusyBox

Source .c/.h files from tests/ and programs/ are installed as training
corpus for the dictionary builder tests.

zstreamtest requires 4096MB RAM for (hashLog=3D29 allocates ~2.8GB).
Set QB_MEM:virtclass-mcextend-zstd =3D "-m 4096" in core-image-ptest.

Tested on qemux86-64 (4GB) with ptest-runner: 9 PASS, 0 FAIL. Runtime is ~1=
3 min.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 meta/recipes-extended/zstd/zstd/run-ptest     | 27 +++++++++++
 meta/recipes-extended/zstd/zstd_1.5.7.bb      | 48 ++++++++++++++++++-
 4 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/zstd/zstd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 0918507ce5..ccac8e3bb3 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -151,6 +151,7 @@ PTESTS_SLOW =3D "\
     tcl \
     tcl8 \
     util-linux \
+    zstd \
 "
=20
 # python3 ptests hang on qemuriscv64
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index 166b4ded63..1c82a9042f 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -44,6 +44,7 @@ QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 51=
00"
 QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
 QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
 QB_MEM:virtclass-mcextend-go =3D "-m 4096"
+QB_MEM:virtclass-mcextend-zstd =3D "-m 4096"
=20
 TEST_SUITES =3D "ping ssh parselogs ptest"
=20
diff --git a/meta/recipes-extended/zstd/zstd/run-ptest b/meta/recipes-exten=
ded/zstd/zstd/run-ptest
new file mode 100755
index 0000000000..fe503ce8c9
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/run-ptest
@@ -0,0 +1,27 @@
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
+run_test fullbench            ./fullbench -i1
+run_test poolTests            ./poolTests
+run_test invalidDictionaries  ./invalidDictionaries
+run_test legacy               ./legacy
+run_test fuzzer               ./fuzzer -v -T200s
+run_test zstreamtest          ./zstreamtest -v -T90s
+run_test decodecorpus         ./decodecorpus -t -T30
+
+ZSTD_BIN=3D$(command -v zstd) DATAGEN_BIN=3D./datagen ZSTDRTTEST=3D ./play=
Tests.sh
+run_test playTests test $? -eq 0
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
index 0e872b95aa..66e326f386 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0822a32f7acdbe=
013606746641746ee8 \
                     file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f0 =
\
                     "
=20
-SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps"
+SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps \
+           file://run-ptest \
+           "
=20
 SRCREV =3D "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
@@ -42,3 +44,47 @@ PACKAGE_BEFORE_PN =3D "libzstd"
 FILES:libzstd =3D "${libdir}/libzstd${SOLIBS}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+inherit ptest
+
+PTEST_BINARIES =3D "datagen fullbench poolTests fuzzer zstreamtest \
+                  invalidDictionaries legacy decodecorpus"
+
+do_compile_ptest() {
+    oe_runmake -C ${S}/tests ${PTEST_BINARIES} \
+        ZSTD_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/programs
+
+    # Test binaries and shell script
+    for t in ${PTEST_BINARIES} playTests.sh; do
+        install -m 0755 ${S}/tests/$t ${D}${PTEST_PATH}/tests/
+    done
+
+    # Test data and cli-tests
+    for d in golden-decompression golden-decompression-errors \
+             golden-compression golden-dictionaries dict-files cli-tests; =
do
+        cp -r ${S}/tests/$d ${D}${PTEST_PATH}/tests/
+    done
+
+    # Source files used as dictionary training corpus
+    install -m 0644 ${S}/tests/*.c ${D}${PTEST_PATH}/tests/
+    install -m 0644 ${S}/programs/*.c ${S}/programs/*.h ${D}${PTEST_PATH}/=
programs/
+    install -m 0755 ${S}/programs/zstdgrep ${S}/programs/zstdless ${D}${PT=
EST_PATH}/programs/
+
+    # Remove tests incompatible with ptest environment:
+    # levels.sh: --ultra/--max levels require >8GB RAM for allocation
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
+RDEPENDS:${PN}-ptest +=3D "bash coreutils python3-core python3-io"
--=20
2.34.1


