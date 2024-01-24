Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CB7C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 09:04:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18532.1706087045576740347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 01:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lAfQ8IuY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1753de7b9e=chi.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O66DxV014899
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 01:04:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=a4p0C
	18Um4FXQfAVdH+/pNGq1jDQYLc1oYwwlZU3jC0=; b=lAfQ8IuY8/JlwdNZ2K5DI
	UrXEQO4vhe8fL0WDYB1241R6Jsh5zragOqCpsZeeeSlzKzfHjVj9L9pEob1hn4cf
	Bvx2tpjOIbxrAKjEQ5SibdA+JnxpmprGAvWwENpphGvcyzcExv4EAmdNaare336P
	JeHxGhGa6/OofZsslj6EN6uIiMygIQtewxi/aOb+cVvI0YfDj/bV/693uRn8U269
	LM10IBWnTxn65h2+8uQtp+HcF8VPBeOE5kAV7KqGLOkBgfA7UGGy7mPhtgnSioQJ
	M94lDnOgI4DlLxEhFfHX1sqLp2UZE8V9PTydgW15Hbcu/TmKYMkN321cuzwJaWwM
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmfhggyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 01:04:04 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 01:04:10 -0800
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 01:04:09 -0800
From: "Xu, Chi" <chi.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xz: Add ptest support
Date: Wed, 24 Jan 2024 17:04:02 +0800
Message-ID: <20240124090402.3126423-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VdOrMwUBUPH5uvgNnmlL6JSL0j2a9CBq
X-Proofpoint-GUID: VdOrMwUBUPH5uvgNnmlL6JSL0j2a9CBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_04,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 09:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194263

There are two types of cases: executables and POSIX shell scripts.
The output of them are different, so run them with different method
in run-ptest.
74 test cases in all and all test cases PASS.
Add xz-ptest to PTESTS_FAST because test duration is 19s on qemux86-64.

Test results on qemux86-64:
root@qemux86-64:~# ptest-runner xz
START: ptest-runner
2024-01-24T06:45
BEGIN: /usr/lib/xz/ptest
=== test_bcj_exact_size.c ===
PASS: test_exact_size
PASS: test_empty_block
---
=== END ===
...
...
=== test_vli.c ===
PASS: test_lzma_vli_size
PASS: test_lzma_vli_encode
PASS: test_lzma_vli_decode
---
=== END ===
PASS: test_files.sh
PASS: test_scripts.sh
PASS: test_compress.sh
DURATION: 19
END: /usr/lib/xz/ptest
2024-01-24T06:45
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Xu, Chi <chi.xu@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../xz/xz/0001-Update-test-scripts.patch      | 80 +++++++++++++++++++
 meta/recipes-extended/xz/xz/run-ptest         | 26 ++++++
 meta/recipes-extended/xz/xz_5.4.5.bb          | 21 ++++-
 4 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/xz/xz/0001-Update-test-scripts.patch
 create mode 100644 meta/recipes-extended/xz/xz/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ef6f471e7b..cddc84195f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -77,6 +77,7 @@ PTESTS_FAST = "\
     sed \
     slang \
     wayland \
+    xz \
     zlib \
     libexif \
 "
diff --git a/meta/recipes-extended/xz/xz/0001-Update-test-scripts.patch b/meta/recipes-extended/xz/xz/0001-Update-test-scripts.patch
new file mode 100644
index 0000000000..81bff29b3d
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/0001-Update-test-scripts.patch
@@ -0,0 +1,80 @@
+From c3921adf93c578412f9ce520ed48b42d60c64f77 Mon Sep 17 00:00:00 2001
+From: "Xu, Chi" <chi.xu@windriver.com>
+Date: Wed, 24 Jan 2024 14:28:13 +0800
+Subject: [PATCH] Update test scripts: replace ../src/* with /usr/bin
+
+In order to run scripts on target, replace ../src/* with /usr/bin
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Xu, Chi <chi.xu@windriver.com>
+---
+ tests/test_compress.sh | 8 ++++----
+ tests/test_files.sh    | 4 ++--
+ tests/test_scripts.sh  | 6 +++---
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/tests/test_compress.sh b/tests/test_compress.sh
+index ff13cef..6169672 100755
+--- a/tests/test_compress.sh
++++ b/tests/test_compress.sh
+@@ -10,7 +10,7 @@
+ ###############################################################################
+ 
+ # If xz wasn't built, this test is skipped.
+-if test -x ../src/xz/xz ; then
++if test -x /usr/bin/xz ; then
+ 	:
+ else
+ 	exit 77
+@@ -76,12 +76,12 @@ test_xz() {
+ 	fi
+ }
+ 
+-XZ="../src/xz/xz --memlimit-compress=48MiB --memlimit-decompress=5MiB \
++XZ="/usr/bin/xz --memlimit-compress=48MiB --memlimit-decompress=5MiB \
+ 		--no-adjust --threads=1 --check=crc32"
+ grep "define HAVE_CHECK_CRC64" ../config.h > /dev/null \
+ 		&& XZ="$XZ --check=crc64"
+-XZDEC="../src/xzdec/xzdec" # No memory usage limiter available
+-test -x ../src/xzdec/xzdec || XZDEC=
++XZDEC="/usr/bin/xzdec" # No memory usage limiter available
++test -x /usr/bin/xzdec || XZDEC=
+ 
+ # Create the required input file if needed.
+ #
+diff --git a/tests/test_files.sh b/tests/test_files.sh
+index 60402e7..37dcf4a 100755
+--- a/tests/test_files.sh
++++ b/tests/test_files.sh
+@@ -10,8 +10,8 @@
+ ###############################################################################
+ 
+ # If both xz and xzdec were not build, skip this test.
+-XZ=../src/xz/xz
+-XZDEC=../src/xzdec/xzdec
++XZ=/usr/bin/xz
++XZDEC=/usr/bin/xzdec
+ test -x "$XZ" || XZ=
+ test -x "$XZDEC" || XZDEC=
+ if test -z "$XZ$XZDEC"; then
+diff --git a/tests/test_scripts.sh b/tests/test_scripts.sh
+index ee82361..f91c5d8 100755
+--- a/tests/test_scripts.sh
++++ b/tests/test_scripts.sh
+@@ -10,9 +10,9 @@
+ ###############################################################################
+ 
+ # If scripts weren't built, this test is skipped.
+-XZ=../src/xz/xz
+-XZDIFF=../src/scripts/xzdiff
+-XZGREP=../src/scripts/xzgrep
++XZ=/usr/bin/xz
++XZDIFF=/usr/bin/xzdiff
++XZGREP=/usr/bin/xzgrep
+ 
+ for i in XZ XZDIFF XZGREP; do
+ 	eval test -x "\$$i" && continue
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/xz/xz/run-ptest b/meta/recipes-extended/xz/xz/run-ptest
new file mode 100644
index 0000000000..cc8ba92016
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/run-ptest
@@ -0,0 +1,26 @@
+#!/bin/bash
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+# executables test cases
+tests_exec=$(file $(ls test_*) | grep "ELF" | awk -F: '{print $1}')
+for i in ${tests_exec}; do
+    ./$i
+done
+
+# POSIX shell script test cases
+export srcdir=${ptestdir}/tests
+test_shell="test_files.sh test_scripts.sh test_compress.sh"
+for j in ${test_shell}; do
+    if [ $j == "test_compress.sh" ]; then
+        ./$j create_compress_files
+    else
+        ./$j
+    fi
+    if [ $? -eq 0 ]; then
+        echo "PASS: $j"
+    else
+        echo "FAIL: $j"
+    fi
+done
diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb b/meta/recipes-extended/xz/xz_5.4.5.bb
index 09eade8be0..e3a99465b2 100644
--- a/meta/recipes-extended/xz/xz_5.4.5.bb
+++ b/meta/recipes-extended/xz/xz_5.4.5.bb
@@ -24,13 +24,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest file://0001-Update-test-scripts.patch', '', d)} \
+          "
 SRC_URI[sha256sum] = "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d6"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
-inherit autotools gettext
+inherit autotools gettext ptest
 
 PACKAGES =+ "liblzma"
 
@@ -42,3 +44,18 @@ ALTERNATIVE:${PN} = "xz xzcat unxz \
                      lzma lzcat unlzma"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN}-ptest += "bash file"
+
+do_compile_ptest() {
+        oe_runmake check TESTS=
+}
+
+do_install_ptest () {
+    install -d ${D}/${PTEST_PATH}/tests
+    find ${B}/tests/.libs -type f -executable -exec cp {} ${D}${PTEST_PATH}/tests \;
+    cp ${B}/config.h ${D}${PTEST_PATH}
+    for i in files xzgrep_expected_output test_files.sh test_scripts.sh test_compress.sh; do
+        cp -r ${S}/tests/$i ${D}${PTEST_PATH}/tests
+    done
+}
-- 
2.25.1


