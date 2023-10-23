Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4852FC0032E
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 02:53:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.113286.1698029597406919859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 19:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="124844308"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="124844308"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 11:53:14 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BDE4D6187
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:53:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66CCFD5006
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:53:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E34D640FF3
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:53:10 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A177B1A0070;
	Mon, 23 Oct 2023 10:53:10 +0800 (CST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>
Subject: [PATCH V5] kbd:Add ptest support
Date: Mon, 23 Oct 2023 10:53:06 +0800
Message-Id: <1698029586-3002-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.004
X-TMASE-Result: 10--9.356100-10.000000
X-TMASE-MatchedRID: 2wfub8HDRfNSuJfEWZSQfC9iVDu7EPf8MVVFhl7NwvPMB0kPsl40w4/M
	VY+TBf96+HFUiys+kADzslOXY3oDJBk6r7o1Tg7l/HTKStsDGMJHNQ8CqEKO2DoUdFbHYUawjdx
	5FdhImgMi+t+0AiFaYlTUIALB54vg1s1AHJ9E8eBKzjuZtPtIBEEe5VjFzwNbxnKCr8I+aui53k
	my2H6jaI+bxbe4hNdggDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/s8y8x0c5How4VhEVA4+VEwBwDF
	BQQToE+JC4in2WWONUMMopY+adNqg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 02:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189613

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for kbd
- It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
- It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13 cases)
- Below is parts of the run log:
  START: ptest-runner
  2023-10-10T06:30
  BEGIN: /usr/lib/kbd/ptest
  ## --------------------- ##
  ## kbd 2.6.3 test suite. ##
  ## --------------------- ##

  libkeymap unit tests

  PASS: test 01
  PASS: test 02
  ...
  libkbdfile unit tests

  PASS: test 01
  PASS: test 02
  ...
  36 tests were successful.
  4 tests were skipped.
  DURATION: 1
  END: /usr/lib/kbd/ptest
  2023-10-10T06:30
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/kbd/kbd/run-ptest           | 10 ++++
 meta/recipes-core/kbd/kbd_2.6.3.bb            | 46 +++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index fc42f95de2..680b01b3b5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -27,6 +27,7 @@ PTESTS_FAST = "\
     gzip \
     json-c \
     json-glib \
+    kbd \
     libconvert-asn1-perl \
     liberror-perl \
     libgpg-error\
diff --git a/meta/recipes-core/kbd/kbd/run-ptest b/meta/recipes-core/kbd/kbd/run-ptest
new file mode 100644
index 0000000000..f02994fa78
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+# Define test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./testsuite
+./testsuite -c
+./testsuite --am-fmt -k unittest
diff --git a/meta/recipes-core/kbd/kbd_2.6.3.bb b/meta/recipes-core/kbd/kbd_2.6.3.bb
index 5287781ac1..b272d4746d 100644
--- a/meta/recipes-core/kbd/kbd_2.6.3.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.3.bb
@@ -38,6 +38,52 @@ do_install:append () {
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
+    # update DATADIR in Makefile
+    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkeymap/Makefile
+    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/helpers/Makefile
+    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkbdfile/Makefile
+
+    # recompile tests
+    oe_runmake -C ${B}/tests/ clean
+    oe_runmake -C ${B}/tests/
+}
+
+do_install_ptest() {
+    # install files from build directory
+    install -d ${D}${PTEST_PATH}/tests/
+    for cdir in `ls ${B}/tests/`; do
+        if [ -d ${B}/tests/${cdir} ]; then
+            install -d ${D}${PTEST_PATH}/tests/${cdir}/
+            find ${B}/tests/${cdir}/ -type f -not -name "*.o" -not -name "Makefile" \
+                -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/${cdir}/ \;
+        else
+            if [ ${cdir} != "Makefile" ]; then
+                install --mode=755 ${B}/tests/${cdir} ${D}${PTEST_PATH}/tests/
+            fi
+        fi
+    done
+
+    # install files from src/data directory
+    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
+    install ${S}/data/keymaps/i386/qwerty/defkeymap.map ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
+
+    # install files from src/tests/data directory
+    cp --preserve=mode,timestamps --no-preserve=ownership -r ${S}/tests/data ${D}${PTEST_PATH}/tests/
+
+    # update PTEST_PATH in run-ptest and atconfig
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+    sed -i -e 's,${B},${PTEST_PATH},g' -e 's,/\.\./${PN}-${PV},,g' ${D}${PTEST_PATH}/tests/atconfig
+
+}
+
 inherit update-alternatives
 
 ALTERNATIVE:${PN} = "chvt deallocvt fgconsole openvt showkey \
-- 
2.25.1


