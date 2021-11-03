Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11D2C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 05:50:08 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3836.1635918608119867483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 22:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A35o68q004582
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 2 Nov 2021 22:50:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 22:50:05 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 22:50:05 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ruby: workaround ptest hang problem
Date: Wed, 3 Nov 2021 13:48:34 +0800
Message-ID: <20211103054834.8003-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 05:50:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157818

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

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 4 ++++
 1 file changed, 4 insertions(+)

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


