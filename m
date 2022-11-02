Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48349C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 03:08:47 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.2575.1675393719754489917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 19:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WBVUrXuY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675393718; i=@fujitsu.com;
	bh=A0nUngdvS64wxgwWJFoWBkwlP1Jcj3WyCpIvnYjYGxk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WBVUrXuYE5BAKUEQCeflnrUi3e/RHZdW+g5qBd50p2CZIFK80Q6f/ONCTRU3H8pBC
	 CMLpouIUPlKESKpUvSFRYJzviwIlb6Omxh8UpnWT6/jBQGPM7f6jrSeL+G0mm+KGUD
	 ZhteFjBqCNnHrpokEwfMFhU0OssIjdMJ3ToIDaUHClGm0swHa5VErBSBW3VOJOlpve
	 QmrXs/8K9t2CsBnXYw8SNJMUbW91gjYGG/0a7mwr7iL997rmRl4mb4oyOS82+eK50L
	 NWSOhi774jd/mEgyXeQXc6vylLic23YP0n9FaPRr/jn4Xp/eRJxrbimSOEeXYccYPb
	 FVPuP2xfpwNVw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqLu16k6
  ywex6izs/37E7MHqc27iCMYAxijUzLym/IoE14/ji9ewFryQr/kx/xtjAuFOsi5GLQ0jgMaPE
  mnnz2SCc60wSG/b9YYVw9jJKLPl+Gcjh5GATkJNY/HgqkM3BISKgJ3H1nyiIySzgKHFhrzpIh
  bCAtkRP834WEJtFQEVi0oouRhCbV8BV4sCZ90wgtgTQlB2rnzBBxAUlTs58AlbPLCAhcfDFC2
  aIGiWJO78uM0LYlRKtH36xQNhqElfPbWKewMg/C0n7LCTtCxiZVjGaFqcWlaUW6ZrpJRVlpme
  U5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGYUoxw40djHP6/uod
  YpTkYFIS5T2bdydZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvRDFQTrAoNT21Ii0zBxgTMGkJD
  h4lEd71pUBp3uKCxNzizHSI1ClGY467C/fuZeb4+OfiXmYhlrz8vFQpcd7FlUClAiClGaV5cI
  NgsXqJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvtXKgKTyZeSVw+14BncIEdMpd65sgp5Q
  kIqSkGpg0yuV11TkC+y7szXvR+vTcr7n1F0LVV1907EhZvvlr+tMFsxIi087tStpf8tvy2kTT
  xTs+7WZlcpPbf8U5bWPvigS7LUx/D+szfBYRun3qC3PVo4Wrk0/5z2FU3L9R5s2M8NdPstpMX
  l1lZla1XjO3Ldc8ku9l++9HvyZJdx+7Pcfth7r7U7/C5bqitxsiTiwvj32+8fCDB5aqyyuOTR
  b9NPVI7/4C/YCCD09NthU/VPu8ytSpIcb3gvZjC0/x/TPvavzbK/X84K2ve2PCd5meaFmz+ma
  OdPvt9Q99TZ3mN2i8TGT8cWb7/sUdqVops2X2bXHi3rO1bE5TK+O2Pvbs3gfOwXN1XP1CDIqU
  Dh0PU2Ipzkg01GIuKk4EAPy5w3dQAwAA
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1675393716!113489!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24185 invoked from network); 3 Feb 2023 03:08:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Feb 2023 03:08:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9BB89100197
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Feb 2023 03:08:36 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8E56B100194
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Feb 2023 03:08:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 3 Feb 2023 03:08:34 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V1] tar: add ptest
Date: Wed, 2 Nov 2022 09:18:31 +0800
Message-ID: <1667351911-9129-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 03:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176705

From: Yan <yanxk.fnst@fujitsu.com>

enable ptest for oss "tar".

Signed-off-by: Yanxinkuan <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/tar/files/run-ptest     | 10 +++++++
 meta/recipes-extended/tar/tar_1.34.bb         | 27 +++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/tar/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 72162f10ee..d3e18ea4a4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -100,6 +100,7 @@ PTESTS_SLOW = "\
     python3-cryptography-ptest \
     python3-ptest \
     strace-ptest \
+    tar-ptest \
     tcl-ptest \
     util-linux-ptest \
     valgrind-ptest \
diff --git a/meta/recipes-extended/tar/files/run-ptest b/meta/recipes-extended/tar/files/run-ptest
new file mode 100644
index 0000000000..9ca27153d9
--- /dev/null
+++ b/meta/recipes-extended/tar/files/run-ptest
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
index 7307cd57a2..7a178c345f 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -6,11 +6,12 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://run-ptest"
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG:append:class-target = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
@@ -42,6 +43,28 @@ do_install:append:class-target() {
     fi
 }
 
+# Tar testsuite would generate some small tests that are
+# bash scripts, so set ptest dependency to bash
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
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
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


