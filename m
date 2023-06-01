Return-Path: <duep.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93920C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 08:52:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.26481.1685609553666400375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 01:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: duep.fnst@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98457774"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98457774"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 17:52:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B506D424E
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 17:52:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3396DD9A7B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 17:52:28 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.218.191])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BE952FC81B5;
	Thu,  1 Jun 2023 17:52:27 +0900 (JST)
From: duep.fnst@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: fnstml-fujitsuten@fujitsu.com,
	duep <duep.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V1] xz: add ptest support
Date: Thu,  1 Jun 2023 16:52:16 +0800
Message-Id: <1685609536-23934-1-git-send-email-duep.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--7.014700-10.000000
X-TMASE-MatchedRID: u+bDrN2E+3tSuJfEWZSQfC9iVDu7EPf8a9qiaDSLgo2Y5nVpihxiw7pY
	cE2YBNVC24AcGIc7EvH9QmKIuMsgB0Nz48eCQimDxkszn8tNF/+Bs03RHrzjMzKIerHAhfYxN1Z
	OD/R4DaYgXZNZQIT9C1r9mm7J9B1CBjDphNl/HQQ6N/cDgNNi4TeXamXCCu1YIPUd1fKoOcSN3H
	kV2EiaA1hh+cFQJYahl8acA/69mB5MGF0Ua9spp5VRzPxemJL06Xvza9iv+Qd2aJwQ9Trzg1pNb
	XTsWM8cjOiyumRjlQrJfgBr1rEqLy9b7bd19qdFngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiSkCDwNtKdTRjW5SI8T5NWbQLCSk66z2A78Wydt43C/dn7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 08:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182055

From: duep <duep.fnst@fujitsu.com>

Add a ptest for xz
 - It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
 - It contains 11 test files:
    test_bcj_exact_size test_block_header test_check test_filter_flags
    test_hardware test_index test_index_hash test_lzip_decoder
    test_memlimit test_stream_flags test_vli
 - Below is part of the run log:
    START: ptest-runner
    2023-06-01T01:57
    BEGIN:
    /usr/lib/xz/ptest
    === test_bcj_exact_size.c ===
    PASS: test_exact_size
    PASS: test_empty_block
    ---
    # TOTAL: 2
    # PASS:  2
    # SKIP:  0
    # FAIL:  0
    # ERROR: 0
    === END ===
    ...
    === test_vli.c ===
    PASS: test_lzma_vli_size
    PASS: test_lzma_vli_encode
    PASS: test_lzma_vli_decode
    ---
    # TOTAL: 3
    # PASS:  3
    # SKIP:  0
    # FAIL:  0
    # ERROR: 0
    === END ===
    DURATION: 0
    END: /usr/lib/xz/ptest
    2023-06-01T01:57
    STOP: ptest-runner
    TOTAL: 1 FAIL: 0
 - The tests under xz requires /bin/bash

Signed-off-by: duep <duep.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../xz/xz/0001-build-PROGRAMS.patch           | 20 ++++++++++++++++
 meta/recipes-extended/xz/xz/run-ptest         |  5 ++++
 meta/recipes-extended/xz/xz_5.4.1.bb          | 24 +++++++++++++++++--
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch
 create mode 100644 meta/recipes-extended/xz/xz/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d60ebb38fc..9aa68c75ea 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -70,6 +70,7 @@ PTESTS_FAST = "\
     sed \
     slang \
     wayland \
+    xz \
     zlib \
 "
 PTESTS_FAST:append:libc-glibc = " glibc-tests"
diff --git a/meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch b/meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch
new file mode 100644
index 0000000000..f97a75030a
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch
@@ -0,0 +1,20 @@
+From: Du Erpei <duep.fnst@fujitsu.com>
+Subject: [PATCH] tests/Makefile.am: add target of 'build-PROGRAMS'
+
+Add target 'build-PROGRAMS' to only compile the test set under
+'/tests' and not run locally.
+
+Upstream-Status: Pending
+
+--- a/tests/Makefile.am	2023-01-12 00:51:42.000000000 +0800
++++ b/tests/Makefile.am	2023-05-30 14:49:34.507313644 +0800
+@@ -74,6 +74,9 @@ if COND_SCRIPTS
+ TESTS += test_scripts.sh
+ endif
+ 
++build-PROGRAMS: all-am
++	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
++
+ clean-local:
+ 	-rm -f compress_generated_* \
+ 		xzgrep_test_output xzgrep_test_1.xz xzgrep_test_2.xz
diff --git a/meta/recipes-extended/xz/xz/run-ptest b/meta/recipes-extended/xz/xz/run-ptest
new file mode 100644
index 0000000000..ebde965d5c
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+cd ./tests
+for i in `ls test*`; do
+	./$i
+done
diff --git a/meta/recipes-extended/xz/xz_5.4.1.bb b/meta/recipes-extended/xz/xz_5.4.1.bb
index 71bf4b540a..14808b1714 100644
--- a/meta/recipes-extended/xz/xz_5.4.1.bb
+++ b/meta/recipes-extended/xz/xz_5.4.1.bb
@@ -24,13 +24,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
+           file://0001-build-PROGRAMS.patch \
+           file://run-ptest"
 SRC_URI[sha256sum] = "e4b0f81582efa155ccf27bb88275254a429d44968e488fc94b806f2a61cd3e22"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
-inherit autotools gettext
+inherit autotools gettext ptest
 
 PACKAGES =+ "liblzma"
 
@@ -42,3 +44,21 @@ ALTERNATIVE:${PN} = "xz xzcat unxz \
                      lzma lzcat unlzma"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_compile_ptest(){
+	oe_runmake -C ${B}/tests/ build-PROGRAMS
+}
+
+do_install_ptest(){
+	install -d ${D}${PTEST_PATH}/tests/
+	find ${B}/tests/ -type f -not -name "*.o" -not -name "Makefile" \
+	  -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/ \;
+
+	install -d ${D}${PTEST_PATH}/tests/.libs/
+	install --mode=755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/.libs/
+
+	install -d ${D}${PTEST_PATH}/tests/files/
+	install --mode=755 ${S}/tests/files/* ${D}${PTEST_PATH}/tests/files/
+}
+
+RDEPENDS:${PN}-ptest += "bash"
-- 
2.25.1


