Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9417C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 05:48:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9517.1706248102835533878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 21:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bsCarYNW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17558f97ac=chi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40Q4Z1q4003819
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 21:48:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=rnwlb
	PIZvhGAe5Gq7h2ZoRqJ3Qu8VY9ZhKRxDoBsB3A=; b=bsCarYNWjixWZneKOEjBy
	V+0fXT19wQRnJDqP2pBC6A9BlkheO+6swqeual97Nxcd9lnJccBj/6/peQnN79A9
	zEaBJGySOO4ckkg8O1FryGitnOkDN4IVv2AvmhrEko8yNmJp3nm5AxV6h3JGZ1/u
	441/DFiixewL3nUAODFnKkXPMsWgjJEFYIa/DDhD3aa5qYTFvd5j80H9LiQWUuG7
	4snH1qmluUwAzOOhrjz4NAUtWUlx/0f3F225VsgoxShNKLbWbz0ei9T9NC6Gfuss
	s6CLjzYzvYf8dHf8K+h486NTNf2LqhewG0I8FvAxECindgYsBnGN1xYa2qcwNl8j
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv4scq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 21:48:22 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 21:48:28 -0800
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 21:48:27 -0800
From: "Xu, Chi" <chi.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] xz: Add ptest support
Date: Fri, 26 Jan 2024 13:48:20 +0800
Message-ID: <20240126054820.1656852-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Awqnsevg9pqg8mJrBvsmmSJ1Lj1gVtz4
X-Proofpoint-ORIG-GUID: Awqnsevg9pqg8mJrBvsmmSJ1Lj1gVtz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194345

There are two types of cases: executables and POSIX shell scripts.
All test cases PASS.
Add xz-ptest to PTESTS_FAST because test duration less than 30s
on qemux86-64.

root@qemux86-64:~# ptest-runner xz
START: ptest-runner
2024-01-26T03:32
BEGIN: /usr/lib/xz/ptest
=== test_bcj_exact_size.c ===
PASS: test_exact_size
PASS: test_empty_block
---
=== END ===
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
DURATION: 18
END: /usr/lib/xz/ptest
2024-01-26T03:33
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Xu, Chi <chi.xu@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/xz/xz/run-ptest         | 26 +++++++++++++++++
 meta/recipes-extended/xz/xz_5.4.5.bb          | 28 +++++++++++++++++--
 3 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/xz/xz/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index a1643c5548..68a3f63a6a 100644
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
index 09eade8be0..0f0849c3e5 100644
--- a/meta/recipes-extended/xz/xz_5.4.5.bb
+++ b/meta/recipes-extended/xz/xz_5.4.5.bb
@@ -24,13 +24,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
+          "
 SRC_URI[sha256sum] = "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d6"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
-inherit autotools gettext
+inherit autotools gettext ptest
 
 PACKAGES =+ "liblzma"
 
@@ -42,3 +44,25 @@ ALTERNATIVE:${PN} = "xz xzcat unxz \
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
+    install -d ${D}${PTEST_PATH}/tests
+    find ${B}/tests/.libs -type f -executable -exec cp {} ${D}${PTEST_PATH}/tests \;
+    cp ${B}/config.h ${D}${PTEST_PATH}
+    for i in files xzgrep_expected_output test_files.sh test_scripts.sh test_compress.sh; do
+        cp -r ${S}/tests/$i ${D}${PTEST_PATH}/tests
+    done
+    mkdir -p ${D}${PTEST_PATH}/src/xz
+    ln -s ${bindir}/xz ${D}${PTEST_PATH}/src/xz/xz
+    mkdir -p ${D}${PTEST_PATH}/src/xzdec
+    ln -s ${bindir}/xzdec ${D}${PTEST_PATH}/src/xzdec/xzdec
+    mkdir -p ${D}${PTEST_PATH}/src/scripts
+    ln -s ${bindir}/xzdiff ${D}${PTEST_PATH}/src/scripts/xzdiff
+    ln -s ${bindir}/xzgrep ${D}${PTEST_PATH}/src/scripts/xzgrep
+}
-- 
2.25.1


