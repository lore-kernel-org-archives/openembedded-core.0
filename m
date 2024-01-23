Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B629C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7349.1705998073875924671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DHl9pzYt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175214bd93=chi.xu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MCfXeY020788
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ckptm
	Z70QOeTTHoDOWt9E6CJj5N36XfBNbc3xrrmtVI=; b=DHl9pzYt9zADRI1Oe4eoO
	aKHDcDqYOwKWDTcRLpMZHCrCOmm9Tv4bgawGXJkqenRFyb4QxMsTaMgtsGVineIe
	P1clyrzR52wFuqWDmzOSSMi0j2+iRGJRUe6BWvU16H6NZ3FcngQByZG0hYCGFArB
	F6OxiwBT81rvZUtIkBdNIXymzEvse4GK+uX598He+4zBOlCHbBbf5CL0TR9ctOz5
	SeCSg8VXAtCtI5ohn7ns8tyWFythqm7rbzYzlwcYVkigEiDk8Ony+RkHFE/dB5WJ
	ZtSxEWppK7O5DRI3yVL/TWHZnbehfIxLgik7SvvtL04oK5VPG3XhpC+nrl9TTsPh
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyk665-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:21:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 00:21:17 -0800
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 00:21:16 -0800
From: "Xu, Chi" <chi.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xz: Add ptest support
Date: Tue, 23 Jan 2024 16:09:18 +0800
Message-ID: <20240123080918.3391325-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: g0PHWcgghyEU0yZ-l8-SSGns992Z8OhF
X-Proofpoint-ORIG-GUID: g0PHWcgghyEU0yZ-l8-SSGns992Z8OhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1011 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194213

72 test cases in all and all test cases PASS.
Test results on qemux86-64:
root@qemux86-64:~# ptest-runner xz
START: ptest-runner
2024-01-23T07:37
BEGIN: /usr/lib/xz/ptest
=== test_block_header.c ===
PASS: test_lzma_block_header_size
PASS: test_lzma_block_header_encode
PASS: test_lzma_block_header_decode
---
=== END ===
PASS: create_compress_files
=== test_hardware.c ===
PASS: test_lzma_physmem
PASS: test_lzma_cputhreads
---
=== END ===
...
...
=== test_bcj_exact_size.c ===
PASS: test_exact_size
PASS: test_empty_block
---
=== END ===
DURATION: 1
END: /usr/lib/xz/ptest
2024-01-23T07:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Xu, Chi <chi.xu@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/xz/xz/run-ptest         | 20 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.4.5.bb          | 18 +++++++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/xz/xz/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ef6f471e7b..21b84d311a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -78,6 +78,7 @@ PTESTS_FAST = "\
     slang \
     wayland \
     zlib \
+    xz \
     libexif \
 "
 PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
diff --git a/meta/recipes-extended/xz/xz/run-ptest b/meta/recipes-extended/xz/xz/run-ptest
new file mode 100644
index 0000000000..64aaf38638
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests=`find . -type f -executable | sed 's/\.\///g'`
+
+for i in ${tests}; do
+    if [ $i == "create_compress_files" ]; then
+        ./$i
+        if [ $? -eq 0 ]; then
+            echo "PASS: $i"
+        else
+            echo "FAIL: $i"
+        fi
+    else
+        ./$i
+    fi
+done
+
diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb b/meta/recipes-extended/xz/xz_5.4.5.bb
index 09eade8be0..e7a873af96 100644
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
 
@@ -42,3 +44,15 @@ ALTERNATIVE:${PN} = "xz xzcat unxz \
                      lzma lzcat unlzma"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN}-ptest += "bash"
+
+do_compile_ptest() {
+        oe_runmake check TESTS=
+}
+
+do_install_ptest () {
+        install -d ${D}/${PTEST_PATH}/tests
+        find ${B}/tests/.libs -type f -executable -exec cp {} ${D}${PTEST_PATH}/tests \;
+        cp -r ${S}/tests/files ${D}${PTEST_PATH}/tests
+}
-- 
2.25.1


