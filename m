Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9831CC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 01:37:37 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.59347.1640828257194585711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BU1baug025276
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BU1bU89016107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Dec 2021 17:37:31 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 17:37:31 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 29 Dec 2021 17:37:30 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] valgrind: make run-ptest better
Date: Wed, 29 Dec 2021 17:37:30 -0800
Message-ID: <20211230013730.129852-6-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
References: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 01:37:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160052

There were warnings about non-existent files when there was
a duplicate in the remove-for-aarch list and the non-deterministic lists
so check if the files still exists before trying to deal with it.

Also restore the tests in the opposite order that they were hidden.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/valgrind/run-ptest               | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index caeae84d4f..15cf03f9d2 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -32,13 +32,16 @@ if [ "$arch" = "aarch64" ]; then
    done
 fi
 
-echo "Run flaky tests using taskset to limit them to a single core."
+echo "Run non-deterministic tests using taskset to limit them to a single core."
 for i in `cat taskset_nondeterministic_tests`; do
-   taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee -a ${LOG}
-   mv $i.vgtest $i.IGNORE
+   # The remove-for-aarch64 and taskset_nondeterministic_tests may overlap so 
+   # check if a file exist.
+   if test -f "${i}.vgtest"; then
+      taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee -a ${LOG}
+      mv $i.vgtest $i.IGNORE
+   fi
 done
 
-
 cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind=${VALGRIND_BIN} \
     --valgrind-lib=${VALGRIND_LIBEXECDIR} \
@@ -51,6 +54,13 @@ cd ${VALGRIND_LIB}/ptest && \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
     2>&1|tee -a ${LOG}
 
+echo "Restore non-deterministic tests"
+for i in `cat taskset_nondeterministic_tests`; do
+   if test -f "${i}.vgtest.IGNORE"; then
+      mv $i.IGNORE $i.vgtest;
+   fi
+done
+
 if [ "$arch" = "aarch64" ]; then
    echo "Aarch64: Restore valgrind tests that result in defunct process and then out of memory"
    for i in `cat remove-for-aarch64`; do
@@ -63,11 +73,6 @@ for i in `cat remove-for-all`; do
    mv $i.IGNORE $i.vgtest;
 done
 
-echo "Restore flaky and other non-deterministic tests"
-for i in `cat taskset_nondeterministic_tests`; do
-   mv $i.IGNORE $i.vgtest;
-done
-
 echo "Failed test details..."
 failed_tests=`grep FAIL: ${LOG} | awk '{print $2}'`
 for test in $failed_tests; do
-- 
2.31.1


