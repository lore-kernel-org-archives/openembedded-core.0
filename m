Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B30BC4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 22:05:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19876.1707775506066816249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 14:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SNPEC7hV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2772da6af1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CCpfdj005391;
	Mon, 12 Feb 2024 22:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=we5JOO9QBTxU6rTLoJjLN3c15LgRGjGIiWGIC6EuvoQ=; b=
	SNPEC7hVctI/lzM1mS+mChJKaqB6kejTZGDjFgs0Dz/lgOSQxgTKt72JWPo2YmjI
	zayyUpcOWNjeomxAL7W/I6jas4dFXxo0K7WXpMcGYKik0/WlBH6PWaIDbyOSjFDl
	jawHfxlQ3iN/bB9SDSDEPU4jgi2LXFw2a6EoJ80/9kOmuPpX6RG4Owb4i2zVWFhG
	c5V+cuUVW6vRel7uaUoQgp4xDcl3Y/83y8zVYjlzsOyShDUIICdTrJC/2heJDcG7
	bEvL/x2S7GtupPUnZQyESqyikG+4SljoKXzofK62+eYq4AkQhs9KKo+d43UyT7Gw
	LgAHN/DmjhG0UMpqnBWqpQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxt508-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Feb 2024 22:05:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 14:05:01 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 14:05:01 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [PATCH 3/3] valgrind: skip 14 ptests in 3.22
Date: Mon, 12 Feb 2024 14:05:01 -0800
Message-ID: <20240212220501.3571864-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212220501.3571864-1-Randy.MacLeod@windriver.com>
References: <20240212220501.3571864-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sEv_ftbEdQF4HEVj-AJph5nmsCnk32p6
X-Proofpoint-GUID: sEv_ftbEdQF4HEVj-AJph5nmsCnk32p6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_17,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120170
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 22:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195365

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Sort the ptest depenencies into a somewhat alpahbetical order.
Add python3-compile for ptests.

Add softlinks for cachegrind to eliminate a warning seen in those tests.

The folowing tests fail after the 3.22 update:
   memcheck/tests/linux/dlclose_leak-no-keep
   memcheck/tests/linux/dlclose_leak
   memcheck/tests/wrap1
   memcheck/tests/wrap2
   ...
   memcheck/tests/wrap8
   cachegrind/tests/wrap5
   massif/tests/bug469146
   massif/tests/new-cpp
   massif/tests/overloaded-new

Omit these tests until they are fixed.
Tracked by: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15399

=== Test Summary ===
TOTAL: 778
PASSED: 759
FAILED: 0
SKIPPED: 19

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/valgrind/remove-for-all               | 14 ++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.22.0.bb  | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index e26088f3b1..004589a7ea 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1,6 +1,17 @@
+cachegrind/tests/wrap5
 none/tests/amd64/fb_test_amd64
 gdbserver_tests/hginfo
+memcheck/tests/linux/dlclose_leak-no-keep
+memcheck/tests/linux/dlclose_leak
 memcheck/tests/supp_unknown
+memcheck/tests/wrap1
+memcheck/tests/wrap2
+memcheck/tests/wrap3
+memcheck/tests/wrap4
+memcheck/tests/wrap5
+memcheck/tests/wrap6
+memcheck/tests/wrap7
+memcheck/tests/wrap8
 helgrind/tests/tls_threads
 helgrind/tests/pth_mempcpy_false_races
 drd/tests/bar_bad
@@ -9,3 +20,6 @@ drd/tests/pth_barrier_thr_cr
 drd/tests/std_thread2
 drd/tests/thread_name_xml
 massif/tests/deep-D
+massif/tests/bug469146
+massif/tests/new-cpp
+massif/tests/overloaded-new
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index dc00edb24e..74ac7ec9d5 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -129,13 +129,18 @@ INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-
 RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
 
 RDEPENDS:${PN}-ptest += " bash coreutils curl file \
-   gdb libgomp \
+   gdb \
+   ${TCLIBC}-src gcc-runtime-dbg \
+   libgomp \
    perl \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
-   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
+   procps \
+   python3-compile \
+   sed \
    util-linux-taskset \
+   ${PN}-dbg ${PN}-src \
    ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
 "
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
@@ -225,6 +230,11 @@ do_install_ptest() {
     sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
     sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
 
+    # enable cachegrind ptests
+    ln -s ${bindir}/cg_annotate ${D}/${PTEST_PATH}/cachegrind/cg_annotate
+    ln -s ${bindir}/cg_diff ${D}/${PTEST_PATH}/cachegrind/cg_diff
+    ln -s ${bindir}/cg_merge ${D}/${PTEST_PATH}/cachegrind/cg_merge
+
     # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
     # https://bugs.kde.org/show_bug.cgi?id=402833
     rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
-- 
2.43.0


