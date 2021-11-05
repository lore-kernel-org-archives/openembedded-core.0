Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533BFC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 02:20:29 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.374.1636078827745560835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 19:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A52KPcF020025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 4 Nov 2021 19:20:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 4 Nov 2021 19:20:25 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 4 Nov 2021 19:20:24 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V3][PATCH] ruby: workaround ptest hang problem
Date: Fri, 5 Nov 2021 10:18:48 +0800
Message-ID: <20211105021848.6807-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 02:20:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157881

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

Meantime, move ruby-ptest out of the PTESTS_PROBLEMS list.
On 48 core host, run ruby ptest in qemux86-64:
root@qemux86-64:/usr/lib64/ruby/ptest# time ./run-ptest
PASS: test/test_set.rb
PASS: test/stringio/test_stringio.rb
...
PASS: test/did_you_mean/test_tree_spell_checker.rb
PASS: test/test_mutex_m.rb

real	5m42.872s
user	3m50.923s
sys	0m44.136s

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +--
 meta/recipes-devtools/ruby/ruby.inc             | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2e324f8da4..f1c40ac813 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -81,6 +81,7 @@ PTESTS_SLOW = "\
     openssl-ptest \
     perl-ptest \
     python3-ptest \
+    ruby-ptest \
     strace-ptest \
     tcl-ptest \
     util-linux-ptest \
@@ -90,7 +91,6 @@ PTESTS_SLOW = "\
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
2.32.0


