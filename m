Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C8BD2F352
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 18:40:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66255.1768329605879263109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 10:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1101497
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:39:58 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D02D83F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:40:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] tcl: improve test execution loop
Date: Tue, 13 Jan 2026 18:39:59 +0000
Message-ID: <20260113184000.3938096-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 18:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229288

There's no need to run tests/all.tcl if we're going to immediately tell
it to run just one test file. Instead just run the test file directly.

This reduces a lot of noise from the log output.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index c8acb4846f..46a1967def 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -24,12 +24,11 @@ SKIP=3D"$SKIP http11-\*"
 # tries to access google.com
 SKIP=3D"$SKIP httpProxy-\*"
=20
-for i in tests/*.test; do
-    i=3D$(basename $i)
-    ./tcltest tests/all.tcl -file $i -skip "$SKIP"
+for name in tests/*.test; do
+    ./tcltest $name -skip "$SKIP"
     if [ $? -eq 0 ]; then
-        echo "PASS: $i"
+        echo "PASS: $name"
     else
-        echo "FAIL: $i"
+        echo "FAIL: $name"
     fi
 done
--=20
2.43.0


