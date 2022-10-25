Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAC8C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:25:57 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.4804.1666686353959848502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 01:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bh6qm5ix;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666686352; i=@fujitsu.com;
	bh=p8/r0DDgDfmAELYy7jl/4YWyyXmR0ixVAlGsNP2Gog8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bh6qm5ixkrFya+/NoT0Z/g5ByubitGVS5K6/E08GY8yhhH74PoZSZs0zYXmLMtYJb
	 0g5ECkuyZ9yht7n/ucfR7GcbPk9ofAYPlO6JI/s4incM8PLN5jwnwS7Pn0BeHR+WGc
	 S28VfnzC1MdhbWFacsKUqymG0OUCjBaLqfERpDLl0coZ9gPvFuvS2X3t3QbnURHucy
	 FxKxnk/RSppQNFMgbV/Vr4xKoISG2toWRZqJBdZXcMp4Ia4wHrIINEUR27ZdGFOn8m
	 z+9vCnp4MHUFH3Aad/EoLYAm2L7IFnKYnnRAkzU2xAFk4rhr/3LF2F49SA7tr7nEqm
	 1ap16SitYjKlw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSbd/bni
  ywbkFkhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bL0ZfsBceUKu59m87ewHhWtouRi0NI4DGj
  xJOuNiYI5xqTxNMLP9m6GDmBnL2MEp/OgNlsAnISix9PZe1i5OAQEdCTuPpPFCTMLOAp0TVvJ
  guILSygJXFk+T2wchYBVYmnzaeZQGxeAVeJVQsPg9VIAI3ZsfoJVFxQ4uTMJywQcyQkDr54wQ
  xRoyRx59dlRgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbT4tSistQiXSO9pKLM9Iy
  S3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBATClmmb2DsWfpH71D
  jJIcTEqivBuCw5OF+JLyUyozEosz4otKc1KLDzHKcHAoSfDunAOUEyxKTU+tSMvMAUYFTFqCg
  0dJhDd7KlCat7ggMbc4Mx0idYrRmOPjn4t7mTmmzv63n1mIJS8/L1VKnDdkNlCpAEhpRmke3C
  BYtF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7fxbQFJ7MvBK4fa+ATmECOmXN3DCQU0o
  SEVJSDUyGmYbXt5efTl6nlXP6fYPMtpd3girbN73kCNfekjwlpCN03zF2U48287W7YlZPm7TH
  3uoRc+X+4zfY2l8d82HNWtuk8266b/xqtrS9dawX3zTt8pusPfOx0t7lU+ffC/wX9Lsvdencf
  JOHc0uFmS1XyFWV2/x56OD682ns7FqbsH++7bM+py5buam7LeNS6NbZcvY3Pu8/Oavdi2eioZ
  QZ+/PGmq8fhTSjjTWSykqNwt10DTt3fH1YYJef8l7zxuXk+V6tN11nX9i00LFCxzJtxdf+U23
  8N8WthWueT7vhuLTra9aB98krc59dXFM/Iziv6Vn6+dcvDy/WXNdXqfDcZju/VztD71uu2Zt6
  F61XYinOSDTUYi4qTgQADzSW7VEDAAA=
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1666686351!551010!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31281 invoked from network); 25 Oct 2022 08:25:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Oct 2022 08:25:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0B4181000D2
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 09:25:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F302C1000CD
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 09:25:50 +0100 (BST)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 25 Oct 2022 09:25:48 +0100
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V2] bc: add ptest
Date: Tue, 25 Oct 2022 16:25:11 +0800
Message-ID: <1666686311-4123-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 08:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172121

From: Yan Xinkuan <yanxk.fnst@fujitsu.com>

add ptest for bc, modified the original 'timetest' script, only
using bc in the system to run package test.

Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...0001-ptest-only-use-bc-in-the-system.patch | 34 +++++++++++++++++++
 meta/recipes-extended/bc/bc/run-ptest         |  8 +++++
 meta/recipes-extended/bc/bc_1.07.1.bb         | 23 +++++++++++--
 4 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/bc/bc/0001-ptest-only-use-bc-in-the-system.patch
 create mode 100644 meta/recipes-extended/bc/bc/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 56088e4e66..5cbed54cc5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -100,6 +100,7 @@ PTESTS_SLOW = "\
     tcl-ptest \
     util-linux-ptest \
     valgrind-ptest \
+    bc-ptest \
 "
 
 PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
diff --git a/meta/recipes-extended/bc/bc/0001-ptest-only-use-bc-in-the-system.patch b/meta/recipes-extended/bc/bc/0001-ptest-only-use-bc-in-the-system.patch
new file mode 100644
index 0000000000..191db358e3
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/0001-ptest-only-use-bc-in-the-system.patch
@@ -0,0 +1,34 @@
+From a7a19baf07cde3eaf8f0c007fea47f2c45475874 Mon Sep 17 00:00:00 2001
+From: Yan Xinkuan <yanxk.fnst@fujitsu.com>
+Date: Mon, 24 Oct 2022 16:08:37 +0800
+Subject: [PATCH] ptest: only use bc in the system
+
+use bc in the system to do ptest.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
+---
+ timetest | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Test/timetest b/Test/timetest
+index 36d8d8e..313250a 100755
+--- a/Test/timetest
++++ b/Test/timetest
+@@ -3,12 +3,9 @@
+ # Time the functions.
+ #
+ SYSBC=/usr/bin/bc
+-if [ x$BC = x ] ; then
+-  BC=../bc/bc
+-fi
+ for file in exp.b ln.b sine.b atan.b jn.b mul.b div.b raise.b sqrt.b fact.b
+ do
+ for prog in $SYSBC $BC $OTHERBC
+ do
+ echo Timing $file with $prog
+ time $prog -l $file
+--
+2.25.1
+
diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest
new file mode 100644
index 0000000000..7e37e9ef01
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/bash
+cd ./bc_test
+if ./timetest; then
+	echo "PASS: bc/timetest"
+else
+	echo "FAIL: bc/timetest"
+fi
+
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 1bec76bb2a..d931690d7d 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -15,11 +15,13 @@ DEPENDS = "flex-native"
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://no-gen-libmath.patch \
            file://libmath.h \
-           file://0001-dc-fix-exit-code-of-q-command.patch"
+           file://0001-dc-fix-exit-code-of-q-command.patch \
+           file://0001-ptest-only-use-bc-in-the-system.patch \
+           file://run-ptest"
 SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
 SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
 
-inherit autotools texinfo update-alternatives
+inherit autotools texinfo update-alternatives ptest
 
 PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
@@ -29,6 +31,23 @@ do_compile:prepend() {
     cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
 }
 
+RDEPENDS:${PN}-ptest += "bash"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/atan.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/div.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/exp.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/fact.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/jn.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/ln.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/mul.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/raise.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/sine.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/sqrt.b ${D}${PTEST_PATH}/bc_test/
+        install ${S}/Test/timetest ${D}${PTEST_PATH}/bc_test/
+}
+
 ALTERNATIVE:${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.25.1


