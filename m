Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED357C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 03:56:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.81016.1684122984926542018
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 20:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: yanxk.fnst@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="96138070"
X-IronPort-AV: E=Sophos;i="5.99,275,1677510000"; 
   d="scan'208";a="96138070"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 12:56:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 55DD2D66A0
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 12:56:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DB75D5E86
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 12:56:18 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.218.229])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1670730C410;
	Mon, 15 May 2023 12:56:18 +0900 (JST)
From: yanxk.fnst@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: fnstml-fujitsuten@fujitsu.com,
	yanxk <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V2] tar: add ptest support
Date: Fri, 10 Feb 2023 17:07:54 +0800
Message-Id: <1676020074-17432-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27626.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27626.004
X-TMASE-Result: 10--8.580800-10.000000
X-TMASE-MatchedRID: O+K0RiZ4x2o5rof3b4z0VLnHu4BcYSmt52ND8b0uTpBUjspoiX02F+/m
	0bmpDCNAi2DH/tax9/6RoepQgi+s8od1E9CxClKsuLt50vtxBA6u+ZyFqtd5FVkkR0r2Tab04Bu
	rlNbLTrfDaE2o6SPVcPPUPCWx/A9QuRfjKxVTpI2z8d6zvo5NkEyQ5fRSh265srDwfHQQaK2y+M
	87Cmyxibr3CQa7YThz/4Qw6v18mZkv+0FNnM7lDSqwx8x+s5lFKQNhMboqZlq4GyTmeN+AbIvMU
	+2JmavL/DLhW1QQSE4Af7Xf+HcG1+DLvvVL3eB4tw+xHnsmQjPzndiJkHFMhKlOQjQcrzOl8/58
	yPC86XyESVL06fzYOxK9hsDqu1yXrWL/xQJnm46eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+ICq
	uNi0WJIrebDZhL3njTpo3f/fn30t8cjsW8oFEO3i8Y5/Wd9AQftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 03:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181225

From: yanxk <yanxk.fnst@fujitsu.com>

original test suites takes 5 minutes with KVM enabled.

autotest files would contain reference to TMPDIR, now
they are removed.

tar test would provide ptest output like:

PASS: compressor program failure
SKIP: remove-files with compression
PASS: remove-files with compression: grand-child

be aware tar tests contain some large compression and
decompression tests that require large device storage.

those cases would not work fine in default qemu image,
for the default storage is too small. Some errors:

listing sparse files bigger than 2^33 B        ./testsuite: line 1928: echo: write error: No space left on device

they are hard coded in the original test scripts, no
modifications have been made to that yet.

Signed-off-by: yanxk <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/tar/tar-1.34/run-ptest  | 10 ++++++
 meta/recipes-extended/tar/tar_1.34.bb         | 31 +++++++++++++++++--
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/tar/tar-1.34/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0681b4b7a2..139fbc4a03 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -102,6 +102,7 @@ PTESTS_SLOW = "\
     python3-cryptography-ptest \
     python3-ptest \
     strace-ptest \
+    tar-ptest \
     tcl-ptest \
     util-linux-ptest \
     valgrind-ptest \
diff --git a/meta/recipes-extended/tar/tar-1.34/run-ptest b/meta/recipes-extended/tar/tar-1.34/run-ptest
new file mode 100644
index 0000000000..9ca27153d9
--- /dev/null
+++ b/meta/recipes-extended/tar/tar-1.34/run-ptest
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
+./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expected failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/FAILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECTED PASS.*//g'
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 7307cd57a2..ce319f6e7a 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -6,11 +6,13 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://run-ptest \
+"
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG:append:class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
@@ -42,6 +44,31 @@ do_install:append:class-target() {
     fi
 }
 
+# Tar testsuite would generate some small tests that are bash
+# scripts, so set ptest dependency to bash
+
+RDEPENDS:${PN}-ptest += "bash"
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


