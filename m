Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B23CC433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 09:49:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6324.1634896187251873239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 960A41063
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:49:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402D23F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:49:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] strace: show test suite log on failure
Date: Fri, 22 Oct 2021 10:49:43 +0100
Message-Id: <20211022094943.1424929-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Oct 2021 09:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157295

If the tests fail, dump the log so we can see the failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes=
-devtools/strace/strace/run-ptest
index 3a51fb0be9..02bb91e07f 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,6 +1,15 @@
 #!/bin/sh
+
+set -u
+
 export TIMEOUT_DURATION=3D240
 chown nobody tests
 chown nobody tests/*
 chown nobody ../ptest
+
 su nobody -c "make -B -C tests -k test-suite.log"
+res=3D$?
+if [ $res -ne 0 ]; then
+    cat tests/test-suite.log
+fi
+exit $res
--=20
2.25.1


