Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19043C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 15:15:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.36043.1749222947513700811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 08:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D66C153B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 08:15:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B72EC3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 08:15:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] tar: clean up run-ptest
Date: Fri,  6 Jun 2025 16:15:43 +0100
Message-ID: <20250606151544.3892443-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 15:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218159

I'm not sure why the script was running ./atconfig ./atlocal ./testsuite,
as atconfig just sets some variables and ignores the arguments.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/tar/tar/run-ptest | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/tar/tar/run-ptest b/meta/recipes-exten=
ded/tar/tar/run-ptest
index 185b33d61a1..b4ccbbcb462 100644
--- a/meta/recipes-extended/tar/tar/run-ptest
+++ b/meta/recipes-extended/tar/tar/run-ptest
@@ -1,14 +1,8 @@
 #!/bin/sh
=20
-# Define tar test work dir
-WORKDIR=3D@PTEST_PATH@/tests/
+cd @PTEST_PATH@/tests/
=20
-# Run test
-cd ${WORKDIR}
-./atconfig ./atlocal ./testsuite
-
-# clear log
-rm -rf testsuite.dir
-rm -rf testsuite.log
+# Clear old data
+rm -rf testsuite.dir testsuite.log
=20
 ./testsuite --am-fmt
--=20
2.43.0


