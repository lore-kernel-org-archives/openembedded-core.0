Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08173C7EE24
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 07:36:11 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.82834.1684136170188648269
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 00:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="104376229"
X-IronPort-AV: E=Sophos;i="5.99,276,1677510000"; 
   d="scan'208";a="104376229"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 16:36:06 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7939CC149
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 16:36:04 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F129D9492
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 16:36:04 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EFA988291;
	Mon, 15 May 2023 16:36:03 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>
Subject: [PATCH V1] kbd: Add ptest support
Date: Mon, 15 May 2023 15:35:58 +0800
Message-Id: <1684136158-5950-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27626.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27626.005
X-TMASE-Result: 10--5.527700-10.000000
X-TMASE-MatchedRID: a3KJLn6RIiJSuJfEWZSQfC9iVDu7EPf8MVVFhl7NwvOysPB8dBBorQec
	3JTmkn8uQh0b9U3KO4OQluPQZ45jSOBRuAss+FbmCtzGvPCy/m4Ui4Ehat05499RlPzeVuQQ09D
	6Rw2zIrMPNxz2EvpSIEej3sxQoy96+zli+H3Ox5LX3j/lf1V8LFkPkLA3cLQH9RTVOaR7PgRBb1
	8AokbsU4fZYVn3yFJpLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7vUSq
	LqOCeBpDCHEeQ2Df6wuYffAb+LW+w6Mbfpuh8rKaAZk0sEcY14=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 07:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181231

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for kbd
- It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
- It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13 cases)

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 meta/recipes-core/kbd/files/run-ptest | 18 +++++++
 meta/recipes-core/kbd/kbd_2.5.1.bb    | 72 ++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/kbd/files/run-ptest

diff --git a/meta/recipes-core/kbd/files/run-ptest b/meta/recipes-core/kbd/files/run-ptest
new file mode 100644
index 0000000000..cace13b8cb
--- /dev/null
+++ b/meta/recipes-core/kbd/files/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+# Define test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+
+# create atconfig
+if [[ ! -f "atconfig" ]]; then
+    echo 'abs_builddir="@PTEST_PATH@/tests/"' > atconfig
+    echo 'abs_srcdir="@PTEST_PATH@/tests/"' >> atconfig
+    echo 'abs_top_builddir="@PTEST_PATH@/"' >> atconfig
+fi
+
+./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
+    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /' \
+    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*//'
diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
index 7662b8f685..bed1ad7240 100644
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
@@ -45,3 +46,72 @@ ALTERNATIVE:${PN} = "chvt deallocvt fgconsole openvt showkey \
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
+
+
+RDEPENDS:${PN}-ptest += "bash"
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
+    # update PTEST_PATH in run-ptest
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+}
-- 
2.25.1


