Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43AEC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 06:52:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.128970.1692082347671680720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 23:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="128167636"
X-IronPort-AV: E=Sophos;i="6.01,174,1684767600"; 
   d="scan'208";a="128167636"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 15:52:25 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 90AF5DB3CC
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 15:52:22 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C6518D3F12
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 15:52:21 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BF4982FC8401;
	Tue, 15 Aug 2023 15:52:20 +0900 (JST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: QiuTingting <qiutt@fujitsu.com>
Subject: [meta-oe][PATCH V1] fontconfig: Add ptest support
Date: Tue, 15 Aug 2023 14:52:17 +0800
Message-Id: <1692082337-2941-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27814.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27814.001
X-TMASE-Result: 10--10.766300-10.000000
X-TMASE-MatchedRID: u+bDrN2E+3tSuJfEWZSQfC9iVDu7EPf8a9qiaDSLgo2cRjJ4ebIBcYpb
	wG9fIuIT46H27DRP93Fr5U7TCgYEcFo8LOaXS5gW/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqh
	SzMv5WaY5raJItbvwpy//MlDRqI8mhp3OtYR8kkxDRebSlZYuSnFd5+Cf9M1DxCAmeyxHFm7QDj
	kgBdHEzVrSied2MBhifRiTzUFDFQZpORapdxWmu5GzIhDiMWXr3hng3KTHeTYrgdpXqEhkgt2/l
	1oJ7WSn/UQG0+1FSBZA5xeQrN3TgOVHGbcDbAq6FEUknJ/kEl4BpRCTkRk5SfoLR4+zsDTtviI7
	BBDiM2LGMLltGRdH4MMKEBDeQ35Qi8T64ZeLoecSqncHLG17tQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 06:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185944

From: QiuTingting <qiutt@fujitsu.com>

Add ptest support for fontconfig.
It is taking around 13s to execute with kvm, so added it to PTESTS_FAST.
It contains 12 cases.
  test-bz106618, test-bz106632, test-bz131804, test-bz1744377,
  test-bz89617, test-bz96676, test-crbug1004254, test-family-matching,
  test-issue107, test-issue180, test-name-parse, test-pthread

Signed-off-by: QiuTingting <qiutt@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../fontconfig/fontconfig/ptest.patch         | 28 +++++++++++++++++++
 .../fontconfig/fontconfig/run-ptest           | 14 ++++++++++
 .../fontconfig/fontconfig_2.14.2.bb           | 16 ++++++++++-
 4 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/ptest.patch
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 6250cf081e..5eb07b99c0 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -20,6 +20,7 @@ PTESTS_FAST = "\
     expect \
     findutils \
     flex \
+    fontconfig \
     gawk \
     gdbm \
     gdk-pixbuf \
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/ptest.patch b/meta/recipes-graphics/fontconfig/fontconfig/ptest.patch
new file mode 100644
index 0000000000..9033e2c5a1
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/ptest.patch
@@ -0,0 +1,28 @@
+Fix compile problem for ptest
+
+Change SRCDIR and FONTFILE in test/Makefile.am for ptest.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
+
+diff -rNu a/test/Makefile.am b/test/Makefile.am
+--- a/test/Makefile.am	2023-08-03 15:10:50.830916551 +0800
++++ b/test/Makefile.am	2023-08-03 16:16:10.178859661 +0800
+@@ -76,7 +76,7 @@
+ endif
+ check_PROGRAMS += test-bz89617
+ test_bz89617_CFLAGS = \
+-	-DSRCDIR="\"$(abs_srcdir)\""
++	-DSRCDIR="\"/usr/lib/fontconfig/ptest/test/\""
+ 
+ test_bz89617_LDADD = $(top_builddir)/src/libfontconfig.la
+ TESTS += test-bz89617
+@@ -117,7 +117,7 @@
+ 	-I$(top_builddir)/src				\
+ 	-I$(top_srcdir)					\
+ 	-I$(top_srcdir)/src				\
+-	-DFONTFILE='"$(abs_top_srcdir)/test/4x6.pcf"'	\
++	-DFONTFILE='"/usr/lib/fontconfig/ptest/test/4x6.pcf"'	\
+ 	-DHAVE_CONFIG_H					\
+ 	$(NULL)
+ test_bz106632_LDADD = $(top_builddir)/src/libfontconfig.la
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/run-ptest b/meta/recipes-graphics/fontconfig/fontconfig/run-ptest
new file mode 100644
index 0000000000..67d6c6823d
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+WORKDIR=@PTEST_PATH@/test/
+PROG=@PTEST_PATH@/test-driver
+LOGDIR=@PTEST_PATH@/logs/
+
+rm -rf ${LOGDIR}
+mkdir -p ${LOGDIR}
+cd ${WORKDIR}
+for file in `ls ${WORKDIR} | grep test | grep -v json`
+do
+    ${PROG} --test-name ${file} --log-file ${LOGDIR}${file}.log --trs-file ${LOGDIR}${file}.trs ${WORKDIR}${file}
+done
+
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
index a3d29ddbae..df74de3df4 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
@@ -22,6 +22,8 @@ DEPENDS = "expat freetype zlib gperf-native util-linux"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
+           file://run-ptest \
+           file://ptest.patch \
            "
 
 SRC_URI[sha256sum] = "3ba2dd92158718acec5caaf1a716043b5aa055c27b081d914af3ccb40dce8a55"
@@ -56,7 +58,19 @@ RREPLACES:fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS:fontconfig-utils = "libfontconfig-utils"
 DEBIAN_NOAUTONAME:fontconfig-utils = "1"
 
-inherit autotools pkgconfig relative_symlinks gettext
+inherit autotools pkgconfig relative_symlinks gettext ptest
+
+do_install_ptest() {
+    install ${S}/test-driver ${D}${PTEST_PATH}/
+
+    install -d ${D}${PTEST_PATH}/test/
+    find ${B}/test/.libs/ -type f -not -name "test-migration" \
+        -exec install {} ${D}${PTEST_PATH}/test/ \;
+    install ${S}/test/*.pcf ${D}${PTEST_PATH}/test
+
+    # update PTEST_PATH in run-ptest
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+}
 
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 
-- 
2.25.1


