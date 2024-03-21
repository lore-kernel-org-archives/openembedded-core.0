Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044C7C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 20:16:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7394.1711052162257429985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 13:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 124E51007
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 13:16:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7EE9A3F762
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 13:16:01 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] tcl: improve run-ptest
Date: Thu, 21 Mar 2024 20:15:56 +0000
Message-Id: <20240321201557.2309256-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 20:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197427

From: Ross Burton <ross.burton@arm.com>

By setting ERROR_ON_FAILURES we don't need to grep the output to know
if the tests failed.  By default the log runner will print the failed
test case, so we don't need to store the log at all.

Set the skipped tests across multiple lines so that it's easier to see
what skips are related to what bugs, and to avoid very long lines.

Use basename instead of awk to get the test name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 24 ++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-dev=
tools/tcltk/tcl/run-ptest
index 87e025fce12..affce9ab815 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -3,19 +3,25 @@
 # clock.test needs a timezone to be set
 export TZ=3D"Europe/London"
 export TCL_LIBRARY=3Dlibrary
+export ERROR_ON_FAILURES=3D1
=20
 # Some tests are overly strict with timings and fail on loaded systems.
-# See bugs #14825 #14882 #15081 #15321.
-SKIPPED_TESTS=3D'async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet=
-*'
+SKIP=3D""
+# 15321
+SKIP=3D"$SKIP async-\* event-\*"
+# 14882
+SKIP=3D"$SKIP cmdMZ-6.6"
+# 15081
+SKIP=3D"$SKIP exit-1.\*"
+# 14825
+SKIP=3D"$SKIP socket-\* socket_inet-\*"
=20
-for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
-    ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
-    grep -q -F -e "Files with failing tests:" -e "Test files exiting wit=
h errors:" $i.log
+for i in tests/*.test; do
+    i=3D$(basename $i)
+    ./tcltest tests/all.tcl -file $i -skip "$SKIP"
     if [ $? -eq 0 ]; then
-        echo "FAIL: $i"
-        cat $i.log
-    else
         echo "PASS: $i"
+    else
+        echo "FAIL: $i"
     fi
-    rm -f $i.log
 done
--=20
2.34.1


