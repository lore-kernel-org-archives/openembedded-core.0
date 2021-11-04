Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F648C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 01:42:04 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.5997.1635990123206665151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 18:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A41g0iS021413
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 3 Nov 2021 18:42:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Nov 2021 18:42:00 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 3 Nov 2021 18:41:59 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] ruby: workaround ptest hang problem
Date: Thu, 4 Nov 2021 09:40:27 +0800
Message-ID: <20211104014027.15729-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 01:42:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157835

From: Changqing Li <changqing.li@windriver.com>

since openssl 3 not compatible problem, ruby have disable openssl
extention. But disable openssl extention make test_smtp.rs hang at
test case "test_start".

Net::TestSMTP#test_start:
NameError: uninitialized constant Net::SMTP::OpenSSL
Did you mean? Open3
/usr/lib64/ruby/3.0.0/net/smtp.rb:195:in `default_ssl_context'
/usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start'
/usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start'
/usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in `test_start'

temporarily remove the hang case to make other testcases can be run.

meantime, move ruby-ptest out of the PTESTS_PROBLEMS list

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +--
 meta/recipes-devtools/ruby/ruby.inc             | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2e324f8da4..197469a07b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -85,12 +85,12 @@ PTESTS_SLOW = "\
     tcl-ptest \
     util-linux-ptest \
     valgrind-ptest \
+    ruby-ptest \
 "
 
 PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
 PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
 
-#    ruby-ptest \ # Timeout
 #    lz4-ptest \ # Needs a rewrite
 #    rt-tests-ptest \ # Needs to be checked whether it runs at all
 #    bash-ptest \ # Test outcomes are non-deterministic by design
@@ -103,7 +103,6 @@ PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
 #    python3-numpy-ptest \ # requires even more RAM and (possibly) disk space; multiple failures
 
 PTESTS_PROBLEMS = "\
-    ruby-ptest \
     lz4-ptest \
     rt-tests-ptest \
     bash-ptest \
diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 2b5caf35f5..776c409f6c 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -42,3 +42,7 @@ do_configure:prepend() {
 do_configure:prepend() {
     rm -rf ${S}/ext/openssl/extconf.rb
 }
+# Remove this test temporarily until it compatible with openssl 3
+do_install_ptest:append() {
+    rm -rf ${D}${PTEST_PATH}/test/net/smtp/test_smtp.rb
+}
-- 
2.17.1


