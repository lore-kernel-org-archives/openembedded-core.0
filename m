Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B76C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 06:47:08 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.25210.1685602025860059728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 23:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119128138"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119128138"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 15:47:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CC7EDDC65
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 15:47:01 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 357A9D95F3
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 15:47:00 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B4AD88110;
	Thu,  1 Jun 2023 15:46:59 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>
Subject: [PATCH V4] kbd: Add ptest support
Date: Thu,  1 Jun 2023 14:46:38 +0800
Message-Id: <1685601998-1446-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.005
X-TMASE-Result: 10--4.527700-10.000000
X-TMASE-MatchedRID: SzbEz7SZt2tSuJfEWZSQfC9iVDu7EPf8YdZm+NnGVQffUZT83lbkEO79
	DJRUi35pWwhqFGcExMuBUk0um/9nw4XrWsM9VUpTTuctSpiuWyU2ZWOmuJUS2VgLks93sG9t09D
	6Rw2zIrMPNxz2EvpSIEej3sxQoy96oGg41PayguTTfU1/F+PbM/7KE7XIKgt8UJ52LFhfM6t5Gk
	57g9BWKFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBS0kV7cMQhQkr2zo
	dOgfI3yrYjVQ3vgExvtnEumEjuiyRnrwY2oFfI/KjDpFejNI6gofodR8tJhqsosFsehttd5w8sM
	doTlFvnsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182045

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for kbd
- It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
- It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13 cases)

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/kbd/files/run-ptest         | 11 +++
 meta/recipes-core/kbd/kbd_2.5.1.bb            | 74 ++++++++++++++++++-
 3 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/kbd/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da9153b998..7d5883604c 100644
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
diff --git a/meta/recipes-core/kbd/files/run-ptest b/meta/recipes-core/kbd/files/run-ptest
new file mode 100644
index 0000000000..3b154c4d73
--- /dev/null
+++ b/meta/recipes-core/kbd/files/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+# Define test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+
+./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
+    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /' \
+    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*//'
diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
index 7662b8f685..283617aaaa 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig ptest
 
 DEPENDS += "flex-native"
 
@@ -14,6 +14,7 @@ RPROVIDES:${PN} = "console-tools"
 RCONFLICTS:${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
+           file://run-ptest \
            "
 
 SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
@@ -45,3 +46,74 @@ ALTERNATIVE:${PN} = "chvt deallocvt fgconsole openvt showkey \
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
+
+do_compile_ptest() {
+    # update DATADIR in Makefile
+    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkeymap/Makefile
+    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/helpers/Makefile
+    sed -i 's,-DDATADIR=.*,-DDATADIR=\\\"${PTEST_PATH}/tests\\\" \\,g' ${B}/tests/libkbdfile/Makefile
+
+    # unset -D_TIME_BITS=64 in Makefile
+    sed -i 's,-D_TIME_BITS=64,,g' ${B}/tests/libtswrap/Makefile
+
+    # recompile tests
+    oe_runmake -C ${B}/tests/ clean
+    oe_runmake -C ${B}/tests/
+}
+
+do_install_ptest() {
+    # install files from build directory
+    install -d ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/testsuite ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/libkeymap/
+    find ${B}/tests/libkeymap/ -type f -not -name "*.o" -not -name "Makefile" \
+        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/libkeymap/ \;
+    install -d ${D}${PTEST_PATH}/tests/helpers/
+    find ${B}/tests/helpers/ -type f -not -name "*.o" -not -name "Makefile" \
+        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/helpers/ \;
+    install -d ${D}${PTEST_PATH}/tests/libkbdfile/
+    find ${B}/tests/libkbdfile/ -type f -not -name "*.o" -not -name "Makefile" \
+        -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/libkbdfile/ \;
+    install -d ${D}${PTEST_PATH}/src/
+    install --mode=755 ${B}/src/loadkeys ${D}${PTEST_PATH}/src/
+
+    # install files from src/data directory
+    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
+    install ${S}/data/keymaps/i386/qwerty/defkeymap.map ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
+
+    # install files from src/tests/data directory
+    install -d ${D}${PTEST_PATH}/tests/data/
+    install -d ${D}${PTEST_PATH}/tests/data/libkeymap/
+    install ${S}/tests/data/libkeymap/* ${D}${PTEST_PATH}/tests/data/libkeymap/
+    install -d ${D}${PTEST_PATH}/tests/data/alt-is-meta/
+    install ${S}/tests/data/alt-is-meta/* ${D}${PTEST_PATH}/tests/data/alt-is-meta/
+    install -d ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
+    install ${S}/tests/data/bkeymap-2.0.4/* ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
+    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
+    install ${S}/tests/data/dumpkeys-mktable/* ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
+    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
+    install ${S}/tests/data/dumpkeys-fulltable/* ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
+    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
+    install ${S}/tests/data/findfile/test_1/consolefonts/* ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
+    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
+    install ${S}/tests/data/findfile/test_0/keymaps/test0.map ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/
+    install ${S}/tests/data/findfile/test_0/keymaps/include/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/include/
+    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
+    install ${S}/tests/data/findfile/test_0/keymaps/i386/include/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
+    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
+    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
+    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
+    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwertz/* ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
+    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
+    install ${S}/tests/data/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
+    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
+    install ${S}/tests/data/keymaps/i386/include/* ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
+    install -d ${D}${PTEST_PATH}/tests/data/keymaps/include/
+    install ${S}/tests/data/keymaps/include/* ${D}${PTEST_PATH}/tests/data/keymaps/include/
+
+
+    # update PTEST_PATH in run-ptest and atconfig
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+    sed -i -e 's,${B},${PTEST_PATH},g' -e 's,/\.\./kbd-2.5.1,,g' ${D}${PTEST_PATH}/tests/atconfig
+}
-- 
2.25.1


