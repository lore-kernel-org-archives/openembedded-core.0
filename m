Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1DBC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 06:34:39 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.77647.1675751678189687258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 22:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J3MfM3O4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675751676; i=@fujitsu.com;
	bh=MXans6c3X2tUpUj3pPoElZ8b87p7WQ4mnif3mvT42No=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=J3MfM3O4+EYJnGgV1XoNWyUkBPaMlsa8h3OFJh/vAUuLKgmJS7sb/LZGY1S/959px
	 TnhCSCJ3AVGdlZGgnEWO4Gu0zoMftbv3y15xGVKU4rR5WWd7xRtj3gZtFtMVdm+MYX
	 KZc2ILoxXT5zOVh75c/ug5PQ3T9iLNE2IXOFxz6cQInGjrQP9f7/lpUl6zMmKa1e19
	 +tAr12EoTCOemyDniEx+M1vVn1rim2q+iA+xOVnFeSiZopK6btquZ18DAAKToYYT6u
	 MxnIPzw5wf+bmcniTsxh4bF5N6fpNRAt8xLZGd9ltgDvBQn1R7qLT3xcBPhK7oDlee
	 Qru6xV45mC9SA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSff3h4f
  JBjP3KFnc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnT+zuYC9ZJVty7lNPAeEe0i5GLQ0jgMaPE
  4V97WboYOYGc60wSh74WQST2Mkos+fyVFSTBJiAnsfjxVCCbg0NEQE/i6j9REJNZwFHiwl51E
  FNYQEdi1gY3EJNFQEVi4l01kD5eAVeJJw3bmEBsCaAZO1Y/YYKIC0qcnPkEbCmzgITEwRcvmC
  FqlCTu/LrMCGFXSrR++MUCYatJXD23iXkCI/8sJO2zkLQvYGRaxWhanFpUllqka6iXVJSZnlG
  Sm5iZo5dYpZuol1qqW55aXAKUSSwv1kstLtYrrsxNzknRy0st2cQIDMCUYhbmHYyHe/7qHWKU
  5GBSEuUtOvgwWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb+xLoJxgUWp6akVaZg4wGmDSEhw8S
  iK8xfeA0rzFBYm5xZnpEKlTjMYcdxfu3cvM8fHPxb3MQix5+XmpUuK8q94DlQqAlGaU5sENgk
  XpJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGfeAE3hycwrgdv3CugUJqBTQlTBTilJREh
  JNTAZ3Jgz4VF6d1SEfmRRzql1kRYv2irt8s2Px85/VyhhlKk8WWoJI5fSW6FvtVlWy9oURJc9
  0/Nj7Fwobzyz64jghDe7lti220fMvjqdaTFvQdbldFf3TAmVhnMPiqIYep1cb5hu3ta0Kpshf
  WXGGh4dvc8sMyvWJrarWnULbD3Jn74+5Jnnbqb9c4wZVi66F+V3nUH4leb0KZdXc2quCWA/8+
  D40qerC2+JH6+ZG1Q/++GL9MuJioI57gcF9lVy1/JoM882qQo8N10v/MGNEPa9lZrn1s9e8H9
  l5JEXQnGn9zCciD5u+5jN311q5fGTVT+OXLb2nLr6lcfTCgfVnwb3Ahf+PV0SzryCg8tGUFKJ
  pTgj0VCLuag4EQBRD9OYTQMAAA==
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1675751675!79984!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1822 invoked from network); 7 Feb 2023 06:34:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 06:34:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 32D101000D2
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Feb 2023 06:34:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2708F1000C1
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Feb 2023 06:34:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 06:34:33 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V1] cpio: add ptest
Date: Wed, 2 Nov 2022 09:35:33 +0800
Message-ID: <1667352933-9298-1-git-send-email-yanxk.fnst@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 06:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176803

From: Yan <yanxk.fnst@fujitsu.com>

enable the ptest function for cpio.

cpio takes 1 second maybe less, so it is fast.

you will get ptest result like this:

PASS: symlink
SKIP: symlink-bad-length
......

Signed-off-by: Yan <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-extended/cpio/cpio-2.13/run-ptest | 10 ++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       | 19 ++++++++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d3e18ea4a4..3ca08d2b01 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -12,6 +12,7 @@ PTESTS_FAST = "\
     bc-ptest \
     bluez5-ptest \
     busybox-ptest \
+    cpio-ptest \
     diffstat-ptest \
     diffutils-ptest \
     ethtool-ptest \
diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
new file mode 100644
index 0000000000..bdac7259c1
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+# Define cpio test work dir
+WORKDIR=/usr/lib/cpio/ptest/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./atlocal ./testsuite
+
+./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expected failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/FAILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECTED PASS.*//g'
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index eb3dc138a9..1a16b066f5 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -12,12 +12,13 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-obstack-Fix-a-clang-warning.patch \
            file://CVE-2021-38185.patch \
            file://0001-Use-__alignof__-with-clang.patch \
+           file://run-ptest \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
 SRC_URI[sha256sum] = "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0de48d71a4c8f3db88"
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo ptest
 
 # Issue applies to use of cpio in SUSE/OBS, doesn't apply to us
 CVE_CHECK_IGNORE += "CVE-2010-4226"
@@ -38,6 +39,22 @@ do_install () {
     mv "${D}${mandir}/man8/rmt.8" "${D}${mandir}/man8/rmt-cpio.8"
 }
 
+do_compile_ptest() {
+    oe_runmake -C ${B}/gnu/ check
+    oe_runmake -C ${B}/lib/ check
+    oe_runmake -C ${B}/rmt/ check
+    oe_runmake -C ${B}/src/ check
+    oe_runmake -C ${B}/tests/ genfile
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+}
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.25.1


