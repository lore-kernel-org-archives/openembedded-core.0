Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3F5C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:15:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.36044.1749222948132571006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 08:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6718153B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 08:15:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 685DB3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 08:15:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] cpio: improve ptests
Date: Fri,  6 Jun 2025 16:15:44 +0100
Message-ID: <20250606151544.3892443-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606151544.3892443-1-ross.burton@arm.com>
References: <20250606151544.3892443-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 15:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218160

We don't need to run 'make check' across the source tree.

Forcibly regenerate tests/testsuite so it supports the --am-fmt option
that we patch into autoconf.

Add coreutils to ptest RDEPENDS as the symlink-bad-length test needs
base64.

Clean up run-ptest: there's no need to run atconfig manually, and use
--am-fmt instead of manually sedding the output.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb  | 10 +++++-----
 meta/recipes-extended/cpio/files/test.sh |  9 ++-------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-exten=
ded/cpio/cpio_2.15.bb
index 77fb019af95..fa011251e27 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -37,10 +37,10 @@ do_install () {
 }
=20
 do_compile_ptest() {
-    oe_runmake -C ${B}/gnu/ check
-    oe_runmake -C ${B}/lib/ check
-    oe_runmake -C ${B}/rmt/ check
-    oe_runmake -C ${B}/src/ check
+    # Forcibly regenerate this script so we get our --am-fmt option
+    rm -f ${S}/tests/testsuite
+    oe_runmake -C ${B}/tests/ testsuite
+
     oe_runmake -C ${B}/tests/ genfile
 }
=20
@@ -69,7 +69,7 @@ do_install_ptest_base:append() {
 DEPENDS:append:class-target =3D " ${@bb.utils.contains('PTEST_ENABLED', =
'1', 'ptest-runner', '', d)}"
 PACKAGE_WRITE_DEPS:append:class-target =3D " ${@bb.utils.contains('PTEST=
_ENABLED', '1', 'ptest-runner', '', d)}"
=20
-RDEPENDS:${PN}-ptest +=3D "ptest-runner"
+RDEPENDS:${PN}-ptest +=3D "ptest-runner coreutils"
=20
 PACKAGES =3D+ "${PN}-rmt"
=20
diff --git a/meta/recipes-extended/cpio/files/test.sh b/meta/recipes-exte=
nded/cpio/files/test.sh
index f027574e864..e966ed91f89 100644
--- a/meta/recipes-extended/cpio/files/test.sh
+++ b/meta/recipes-extended/cpio/files/test.sh
@@ -1,10 +1,5 @@
 #!/bin/sh
=20
-# Define cpio test work dir
-WORKDIR=3D@PTEST_PATH@/tests/
+cd @PTEST_PATH@/tests/
=20
-# Run test
-cd ${WORKDIR}
-./atconfig ./atlocal ./testsuite
-
-./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok=
]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expect=
ed failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's=
/FAILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEX=
PECTED PASS.*//g'
+./testsuite --am-fmt
--=20
2.43.0


