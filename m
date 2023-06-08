Return-Path: <duep.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C79FC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:02:21 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4136.1686189736448735434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: duep.fnst@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="119854078"
X-IronPort-AV: E=Sophos;i="6.00,225,1681138800"; 
   d="scan'208";a="119854078"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 11:01:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C98FC68E4
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jun 2023 11:01:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5ED4CF7F8
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jun 2023 11:01:47 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.218.191])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 142D56C9D3;
	Thu,  8 Jun 2023 11:01:47 +0900 (JST)
From: duep.fnst@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: fnstml-fujitsuten@fujitsu.com,
	duep <duep.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V3] xz: add ptest support
Date: Thu,  8 Jun 2023 10:01:44 +0800
Message-Id: <1686189704-12596-1-git-send-email-duep.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27678.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27678.004
X-TMASE-Result: 10--6.808700-10.000000
X-TMASE-MatchedRID: kREspPIIG7RSuJfEWZSQfC9iVDu7EPf8a9qiaDSLgo2Y5nVpihxiw7pY
	cE2YBNVC24AcGIc7EvH9QmKIuMsgB0Nz48eCQimDxkszn8tNF/+Bs03RHrzjMzKIerHAhfYxN1Z
	OD/R4DaYgXZNZQIT9C1r9mm7J9B1CPubnqD2XLwjy3h9RQZ4StD/FEHo4advavI9HkPiFAB0Myj
	RdBmXLaGxeoKLN1RJDdgm3HCrXdI9/SIXlNk88751U1lojafr/frTt+hmA5bLVjuDCvMnExXkaT
	nuD0FYosX24ahsS5PuAMuqetGVetnyef22ep6XYOwBXM346/+x7eEgHpAgk4wtD7HHdt/ivnZj1
	eIBueQ+syTjblddlbUH/rP0zj2Ox
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182481

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
 meta/recipes-extended/xz/xz/run-ptest         |  5 ++++
 meta/recipes-extended/xz/xz_5.4.1.bb          | 23 +++++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)
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
index 71bf4b540a..81fb3dc4c7 100644
--- a/meta/recipes-extended/xz/xz_5.4.1.bb
+++ b/meta/recipes-extended/xz/xz_5.4.1.bb
@@ -24,13 +24,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "e4b0f81582efa155ccf27bb88275254a429d44968e488fc94b806f2a61cd3e22"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
-inherit autotools gettext
+inherit autotools gettext ptest
 
 PACKAGES =+ "liblzma"
 
@@ -42,3 +43,21 @@ ALTERNATIVE:${PN} = "xz xzcat unxz \
                      lzma lzcat unlzma"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_compile_ptest(){
+	oe_runmake -C ${B}/tests/ check TESTS=
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


