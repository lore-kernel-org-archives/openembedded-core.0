Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD948EDE989
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 02:26:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.12158.1694744813139471766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 19:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="133603566"
X-IronPort-AV: E=Sophos;i="6.02,147,1688396400"; 
   d="scan'208";a="133603566"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 11:26:50 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FBF5CD6DF
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 11:26:48 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 58F91D2147
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 11:26:47 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DF8B881C0;
	Fri, 15 Sep 2023 11:26:46 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>,
	Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [PATCH V3] tar: add ptest support
Date: Fri, 15 Sep 2023 10:26:43 +0800
Message-Id: <1694744803-2934-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27876.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27876.003
X-TMASE-Result: 10--13.393700-10.000000
X-TMASE-MatchedRID: cSoPLjBYd51SuJfEWZSQfIvefyp1glN0BXngI6jFvpdM+b8yxBqvAymF
	OYJJbPqpZ4LpE3hFYlEScHHX0rLXBPDpgNqI2WgtPKN38CLPK0GSiza26cvwNIIEht5QlwfX7v0
	MlFSLfmkJ4C/z1Ugb0VkDNfWLwTmxLxEFvMLiU9/NgrlT5Ajc7sE5XPQnBzGXR/IzlV+CMbYlld
	Kl4MzoSutoOLAmZCMUl8acA/69mB5MGF0Ua9spp/7FEhWgo0y8mzsJ8CsZYU7VtKZKT0dQ2i8sM
	R89db4U4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vG/m6dRgqxdaD0LBSRDs8zcY1BECQN9YVDP2q
	LShn+VJJIASKr5oERg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 02:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187651

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for tar.
- It is taking around 3m to execute with kvm, so added it to PTEST_SLOW.
- It contains 244 cases.
- It needs more fs space for test than normal.
- Below is parts of the run log:
    START: ptest-runner
    2023-09-14T08:02
    BEGIN: /usr/lib/tar/ptest
    ## ------------------------ ##
    ## GNU tar 1.35 test suite. ##
    ## ------------------------ ##
      1: tar version                                     ok
      2: decompressing from stdin                        ok
    ...
    ## ------------- ##
    ## Test results. ##
    ## ------------- ##

    200 tests were successful.
    44 tests were skipped.
    DURATION: 188
    END: /usr/lib/tar/ptest
    2023-09-14T08:05
    STOP: ptest-runner
    TOTAL: 1 FAIL: 0

Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  3 +++
 meta/recipes-extended/tar/tar/run-ptest       | 10 +++++++
 meta/recipes-extended/tar/tar_1.35.bb         | 27 +++++++++++++++++++
 4 files changed, 41 insertions(+)
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
diff --git a/meta/recipes-extended/tar/tar/run-ptest b/meta/recipes-extended/tar/tar/run-ptest
new file mode 100644
index 0000000000..ad4dd334f7
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+# Define tar test work dir
+WORKDIR=/usr/lib/tar/ptest/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./atlocal ./testsuite
+
+./testsuite
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index 4dbd418b60..b3d22c3db9 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -42,6 +42,33 @@ do_install:append:class-target() {
     fi
 }
 
+# add for ptest support
+SRC_URI += " \
+    file://run-ptest \
+"
+
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/gnu/ check
+    oe_runmake -C ${B}/lib/ check
+    oe_runmake -C ${B}/rmt/ check
+    oe_runmake -C ${B}/src/ check
+    oe_runmake -C ${B}/tests/ genfile checkseekhole ckmtime
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    sed -i "/abs_/d" ${B}/tests/atconfig
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "s%${B}/../tar-1.34.build-aux:%%g" ${B}/tests/atlocal
+    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/checkseekhole ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/ckmtime ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+}
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.25.1


