Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5BFC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 07:16:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.8655.1675926967978946357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 23:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QjT5qgug;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675926966; i=@fujitsu.com;
	bh=nBJ6igL35uVX0wQ5Rw2c6AvK/R3YgmD38RioIXvkPbI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QjT5qgug14EnJfFKGXqbPPjB598l1VSTIjDPT5LL1qOUINQXpaoWTh3vYuvQifB0T
	 joiNzL55pi8bL+8yoyJ4a49UxKMjw10ODq7FXeid03djJ85TjPZeZ8p8uh7A9yPZX1
	 pcTdaHZucEWon9C2PWLljQeWh2Hhw2kijKTvwpW9Xf3pd06286yyDu9fGrUAZyAFPv
	 VDleP/F4fd/6Q0NDjPra8bhWoEfAS7HPeyW2/2HF2ozGPwjPiVWMl3jkuo2ZXn94FM
	 T946+Jgggv6o8iVXuWYdoa6xqjWAW7K6jrTZdxIhFzjn62GCHs2BQmoEyHp/+DMb7o
	 1vklAlvFHnXkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORpLt17pN
  kg3/NohZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8au/siCR1IVV8+2sDQwfhTrYuTiEBJ4wCjx
  d9ITZgjnCpPEoi0bWSGcvYwSXa/nMHYxcnKwCchJLH48FSjBwSEioCdx9Z8oSJhZwFli3rN3z
  CC2sICuxLdnK1lAbBYBFYkXjf1sIDavgJvEpZm7weISQGN2rH7CBBEXlDg58wkLxBwJiYMvXj
  BD1ChJ3Pl1mRHCrpRo/fALqldN4uq5TcwTGPlnIWmfhaR9ASPTKkbz4tSistQiXUMzvaSizPS
  MktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKU4z38F4rO+v
  3iFGSQ4mJVHeyzceJwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4DWc/CRZSLAoNT21Ii0zBxgZM
  GkJDh4lEd7pU4HSvMUFibnFmekQqVOMuhwf/1zcyyzEkpeflyolzms0B6hIAKQoozQPbgQsSi
  8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZtmQ00hSczrwRu0yugI5iAjghRfQhyREkiQkq
  qgalvRctGQ8UrWboXFk9zLFRu3VtqUlsUFCutfa63onXW2wB+O5H5z4uiJwbIZb1ebapyrmr2
  Pt2JQSlHtjy21FJ8LiHQ/FHkVdqDfCnNL+snT2rRPnw2urx/v2SSjKrio3nB2oKxb3nbOR5Nt
  jkltmvGxWs6e7S0mJdOPhfFeTZMcYXlvGxV13OrjJQ5jvS07HrVu+iCddjhuE+h6pdPzJyolK
  S1eIKa2yF33y9GxQ+OXjl8IfFOxbHlfTu+HFecs/qTQuoJe84rdqLC7A9XWy8Xff583/ufPnM
  8t9l8P7vUrfLQ+4ldM8Ps7mnxFH24FPFTNT3hn+jrJSt1pD6385YsaKt8FxrvMTNYOnpx10Yl
  luKMREMt5qLiRABcrNGfTQMAAA==
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-728.messagelabs.com!1675926964!458862!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32033 invoked from network); 9 Feb 2023 07:16:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Feb 2023 07:16:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B9AA21B1
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Feb 2023 07:16:04 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AE3411AF
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Feb 2023 07:16:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Feb 2023 07:16:02 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, yanxk <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V2] cpio: add ptest.
Date: Thu, 9 Feb 2023 08:54:56 +0800
Message-ID: <1675904096-10255-1-git-send-email-yanxk.fnst@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 07:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176917

From: yanxk <yanxk.fnst@fujitsu.com>

add ptest function for oss 'cpio'.

this test takes less than 1 second with
kvm enabled, so it is a fast test.

autotest files would contain TMPDIR, they are
removed from script files atconfig and atlocal.

Signed-off-by: yanxk <yanxk.fnst@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-extended/cpio/cpio-2.13/run-ptest | 10 +++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       | 22 ++++++++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5422ecd378..0681b4b7a2 100644
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
index eb3dc138a9..7a3c8b308b 100644
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
@@ -38,6 +39,25 @@ do_install () {
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
+    sed -i "/abs_/d" ${B}/tests/atconfig
+    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "s%${B}/tests:%%g" ${B}/tests/atlocal
+    sed -i "s%${B}/src:%%g" ${B}/tests/atlocal
+    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+}
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.25.1


