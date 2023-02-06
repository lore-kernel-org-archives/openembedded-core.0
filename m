Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C20C05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 08:44:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.49236.1675673045987435159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 00:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bg3yrqRL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=140178efc2=haitao.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3166uTXR022424
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Feb 2023 08:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=PoTHr7Ggh2Lp96fYtzv6GOIqNyFEaT7hFzYOY9H5TUM=;
 b=bg3yrqRLwUdCe1t5v8X7ohXttvEPFHL8PMg8oab9UeX/QKA1Fp6eSq2NJUhL5RYfpbj0
 bkLbta6allWY8CZwBftJQcPoHXY9PrLTTReY8ThezcYo9Ftbdn3lMt2AI7DfCALIKXR9
 QIHnv9cRajmt5MGC8Id2U9aPSw4324a5NJhyt7+0b6YL37y7cJzW205WFamgpFhhgUeE
 Byi4Oy4fi3HyUzHkNSgZBuBf5oTfEp7NcXlNUoMKnY/wJwV4xqEj6hMbAPR0TfJf6G6G
 41OrMW+I8IuH40p9Qkx+BL64H4xWv2SZXQBiY4iYQvmpnF7jst5AJL6Ogv44a24urwWY MQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck31my4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 08:44:04 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 6 Feb 2023 00:44:03 -0800
Received: from ala-lpggp2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 6 Feb 2023 00:44:03 -0800
From: Liu Haitao <haitao.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] libgit: add ptest for libgit2
Date: Mon, 6 Feb 2023 00:44:01 -0800
Message-ID: <20230206084401.2055798-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: B6p1f8m7MeDrz8likRcstkRw5UBmASCW
X-Proofpoint-GUID: B6p1f8m7MeDrz8likRcstkRw5UBmASCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_03,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 08:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176788

Add ptest for libgit2.
ALl test passed on a trial run and it took around 21m56s to execute so
added curl-ptest to PTESTS_SLOW.

Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...ests-add-CLAR_FIXTURES_DIR-for-ptest.patch | 54 +++++++++++++++++++
 .../recipes-support/libgit2/libgit2/run-ptest |  7 +++
 meta/recipes-support/libgit2/libgit2_1.5.0.bb | 18 ++++++-
 4 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURES_DIR-for-ptest.patch
 create mode 100644 meta/recipes-support/libgit2/libgit2/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5422ecd378..9b88b58070 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -104,6 +104,7 @@ PTESTS_SLOW = "\
     tcl-ptest \
     util-linux-ptest \
     valgrind-ptest \
+    libgit2-ptest \
 "
 
 PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
diff --git a/meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURES_DIR-for-ptest.patch b/meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURES_DIR-for-ptest.patch
new file mode 100644
index 0000000000..f547d29e8a
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURES_DIR-for-ptest.patch
@@ -0,0 +1,54 @@
+From 7ae59e785260bb820cf1449da84140f8ae613e9f Mon Sep 17 00:00:00 2001
+From: Liu Haitao <haitao.liu@windriver.com>
+Date: Mon, 6 Feb 2023 06:40:20 +0200
+Subject: [PATCH] tests: add CLAR_FIXTURES_DIR for ptest
+
+Upstream-Status: Inappropriate [yocto specific]
+
+Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
+---
+ tests/libgit2/CMakeLists.txt | 8 +++++++-
+ tests/util/CMakeLists.txt    | 8 +++++++-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/tests/libgit2/CMakeLists.txt b/tests/libgit2/CMakeLists.txt
+index 27f421ad6..e1a95a610 100644
+--- a/tests/libgit2/CMakeLists.txt
++++ b/tests/libgit2/CMakeLists.txt
+@@ -9,7 +9,13 @@ if(NOT PYTHONINTERP_FOUND)
+ ENDIF()
+ 
+ set(CLAR_PATH "${PROJECT_SOURCE_DIR}/tests/clar")
+-set(CLAR_FIXTURES "${PROJECT_SOURCE_DIR}/tests/resources/")
++
++IF (CLAR_FIXTURES_DIR)
++	SET(CLAR_FIXTURES "${CLAR_FIXTURES_DIR}/resources/")
++ELSE()
++	set(CLAR_FIXTURES "${PROJECT_SOURCE_DIR}/tests/resources/")
++ENDIF()
++
+ set(TEST_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
+ add_definitions(-DCLAR_FIXTURE_PATH=\"${CLAR_FIXTURES}\")
+ add_definitions(-DCLAR_TMPDIR=\"libgit2_tests\")
+diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
+index 232590ffd..c736bb3bb 100644
+--- a/tests/util/CMakeLists.txt
++++ b/tests/util/CMakeLists.txt
+@@ -9,7 +9,13 @@ if(NOT PYTHONINTERP_FOUND)
+ ENDIF()
+ 
+ set(CLAR_PATH "${libgit2_SOURCE_DIR}/tests/clar")
+-set(CLAR_FIXTURES "${libgit2_SOURCE_DIR}/tests/resources/")
++
++IF (CLAR_FIXTURES_DIR)
++	SET(CLAR_FIXTURES "${CLAR_FIXTURES_DIR}/resources/")	
++ELSE()
++	set(CLAR_FIXTURES "${libgit2_SOURCE_DIR}/tests/resources/")
++ENDIF()
++
+ set(TEST_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
+ add_definitions(-DCLAR_FIXTURE_PATH=\"${CLAR_FIXTURES}\")
+ add_definitions(-DCLAR_TMPDIR=\"libgit2_tests\")
+-- 
+2.39.1
+
diff --git a/meta/recipes-support/libgit2/libgit2/run-ptest b/meta/recipes-support/libgit2/libgit2/run-ptest
new file mode 100644
index 0000000000..66e0392af6
--- /dev/null
+++ b/meta/recipes-support/libgit2/libgit2/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh 
+
+cd tests
+
+export CLAR_SUMMARY="${PWD}/results.xml"
+
+./libgit2_tests -t | sed -e 's|ok .* - # SKIP|SKIP:|' -e 's|not ok .* -|FAIL:|'  -e 's|ok .* -|PASS:|' 
diff --git a/meta/recipes-support/libgit2/libgit2_1.5.0.bb b/meta/recipes-support/libgit2/libgit2_1.5.0.bb
index ee4d79b11a..aca8b94551 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.5.0.bb
@@ -5,12 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https \
+           file://0001-tests-add-CLAR_FIXTURES_DIR-for-ptest.patch \
+           file://run-ptest \
+          "
 SRCREV = "fbea439d4b6fc91c6b619d01b85ab3b7746e4c19"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
 EXTRA_OECMAKE = "\
     -DBUILD_CLAR=OFF \
@@ -19,4 +22,15 @@ EXTRA_OECMAKE = "\
     -DREGEX_BACKEND='pcre2' \
 "
 
+EXTRA_OECMAKE_PTEST = " -DBUILD_CLAR=ON -DVALGRIND=ON -DCLAR_FIXTURES_DIR=${PTEST_PATH}/tests "
+
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${EXTRA_OECMAKE_PTEST}', '', d)} "
+
+do_install_ptest(){
+        install -d ${D}${PTEST_PATH}/tests/
+        install ${B}/libgit2_tests ${D}${PTEST_PATH}/tests/
+        cp ${S}/tests/resources/ ${D}${PTEST_PATH}/tests/ -rf
+}
+
+
 BBCLASSEXTEND = "native"
-- 
2.39.0


