Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D3ECE7A89
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 05:35:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.54950.1695620116143254492
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 22:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="121490880"
X-IronPort-AV: E=Sophos;i="6.03,174,1694703600"; 
   d="scan'208";a="121490880"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 14:35:13 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 68C33CD7E2
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 14:35:11 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 59144D9461
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 14:35:10 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E8DB2FC7ACB;
	Mon, 25 Sep 2023 14:35:09 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Yan <yanxk.fnst@fujitsu.com>,
	Qiu Tingting <qiutt@fujitsu.com>
Subject: [PATCH V5] tar: add ptest support
Date: Mon, 25 Sep 2023 13:35:01 +0800
Message-Id: <1695620101-2866-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27896.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27896.005
X-TMASE-Result: 10--18.093800-10.000000
X-TMASE-MatchedRID: DIEPoA0d9jxSuJfEWZSQfBMxKDqgAFSz3hng3KTHeTaOEENgsUAuYv4Q
	R/7oUDJyKqrQ7lLcMnzolef5VxxwA6jC6/MNUxOopSXVpBS+ilY3l2plwgrtWCD1HdXyqDnEti3
	GfHANr+CcZ81PGbcSHgS2kVlHSIV7Wjws5pdLmBZO5y1KmK5bJTZlY6a4lRLZPZN54nI8dEzePr
	dhC8Q7L7bSfXlldRMcBt+ZjFMtGVzWzUAcn0Tx4ErOO5m0+0gEYdBG+bhhiNTJyYU2J054PYyxF
	TrxUwZkRPcyFtl62OvflgIsjwKBIQ719kpOO37PlTsGW3DmpUt9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO0CpgETeT0ynA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 05:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188170

From: Yan <yanxk.fnst@fujitsu.com>

Add a ptest for tar.
- It is taking around 3m to execute with kvm, so added it to PTEST_SLOW.
- It contains 242 cases.
- Below is parts of the run log:
  START: ptest-runner
  2023-09-25T05:06
  BEGIN: /usr/lib/tar/ptest
  ## ------------------------ ##
  ## GNU tar 1.35 test suite. ##
  ## ------------------------ ##
  PASS: tar version
  PASS: decompressing from stdin
  ...
  ## ------------- ##
  ## Test results. ##
  ## ------------- ##

  198 tests were successful.
  44 tests were skipped.
  DURATION: 188
  END: /usr/lib/tar/ptest
  2023-09-25T05:09
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  3 ++
 meta/recipes-extended/tar/tar/ptest.patch     | 23 +++++++++++++
 meta/recipes-extended/tar/tar/run-ptest       | 14 ++++++++
 meta/recipes-extended/tar/tar_1.35.bb         | 32 +++++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/ptest.patch
 create mode 100644 meta/recipes-extended/tar/tar/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9160103cb0..3df7c9e405 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -109,6 +109,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3 \
     strace \
+    tar \
     tcl \
     util-linux \
     valgrind \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index b81ab7b7c8..b6f5c2fd60 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -24,6 +24,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 
+# tar-ptest in particular needs more space
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
diff --git a/meta/recipes-extended/tar/tar/ptest.patch b/meta/recipes-extended/tar/tar/ptest.patch
new file mode 100644
index 0000000000..4a5951211e
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/ptest.patch
@@ -0,0 +1,23 @@
+tar: Fix bug of compiling testsuite
+
+Del exclude17.at and exclude18.at from testsuite.at,
+because these files are not exist in tarball.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
+
+diff -rNu a/tests/testsuite.at b/tests/testsuite.at
+--- a/tests/testsuite.at	2023-09-25 10:39:52.176684379 +0800
++++ b/tests/testsuite.at	2023-09-25 10:39:25.532684766 +0800
+@@ -312,8 +312,8 @@
+ m4_include([exclude14.at])
+ m4_include([exclude15.at])
+ m4_include([exclude16.at])
+-m4_include([exclude17.at])
+-m4_include([exclude18.at])
++# m4_include([exclude17.at])
++# m4_include([exclude18.at])
+ 
+ AT_BANNER([Deletions])
+ m4_include([delete01.at])
diff --git a/meta/recipes-extended/tar/tar/run-ptest b/meta/recipes-extended/tar/tar/run-ptest
new file mode 100644
index 0000000000..185b33d61a
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+# Define tar test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./atlocal ./testsuite
+
+# clear log
+rm -rf testsuite.dir
+rm -rf testsuite.log
+
+./testsuite --am-fmt
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index 4dbd418b60..9605ec52a6 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -42,6 +42,38 @@ do_install:append:class-target() {
     fi
 }
 
+# add for ptest support
+SRC_URI += " \
+    file://run-ptest \
+    file://ptest.patch \
+"
+
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/gnu/ check
+    oe_runmake -C ${B}/lib/ check
+    oe_runmake -C ${B}/rmt/ check
+    oe_runmake -C ${B}/src/ check
+    rm -rf ${S}/tests/testsuite
+    oe_runmake -C ${B}/tests/ testsuite
+    oe_runmake -C ${B}/tests/ genfile checkseekhole ckmtime
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "/abs_/d" ${D}${PTEST_PATH}/tests/atconfig
+    echo "abs_builddir=${PTEST_PATH}/tests/" >> ${D}${PTEST_PATH}/tests/atconfig
+    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    sed -i "/PATH=/d" ${D}${PTEST_PATH}/tests/atlocal
+    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/checkseekhole ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/ckmtime ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+}
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.25.1


