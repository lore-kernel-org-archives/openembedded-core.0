Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7A4EEA848
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:35:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52322.1770921295939284226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Yxg/6mkz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260212183452eab37e553c0002078c-ctrwyw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260212183452eab37e553c0002078c
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Feb 2026 19:34:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZtIovpPIBUlsErFYMfK0cK9MCOfPwHb6N1Hj9h7stWk=;
 b=Yxg/6mkz0HekTf8GUlCHMgEj+75cCCMWZKRwE5DA2J0PuqzBre/YIRNzD3LVwQrV4NnjCs
 OsZF0SjsX1He2Vlh89CbruVm8y3/O2AFPq7NlIv99xbf94dNUC3H2HnaC+jL6oKMCIa1ofzP
 ynHIxiyRlalIldBafgyE7opHwN7saMbS8ebhO8Sjzi2AaTZGKiN1T+vxwvoV0nrRIs8K82tI
 mLM6fCRpOuvQCDKbubE21vYFatdPveSIX96EodiOiHzy0cB5E2U2xDSMu1wSzhRL3R02H7Jz
 tL5bnoxooQrkULUqS9HnIVwHFl6+hv4cUilz9yBEHB2cagcXjUB2h+zg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-selftest: devtool: add test for gdb pretty-printing
Date: Thu, 12 Feb 2026 19:34:37 +0100
Message-ID: <20260212183437.1252136-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231072

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This extends the existing devtool IDE SDK tests to verify that gdb
pretty-printing is working correctly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0ff8e56336..d7b29e61ce 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2724,6 +2724,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %s\")'" % magic_string
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
         gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:14,14'"
+
+        # check if resolving std::vector works with python scripts
+        gdb_batch_cmd += " -ex 'list cpp-example.cpp:55,55'"
+        gdb_batch_cmd += " -ex 'break cpp-example.cpp:55'"
+        gdb_batch_cmd += " -ex 'continue'"
+        gdb_batch_cmd += " -ex 'print numbers'"
         gdb_batch_cmd += " -ex 'continue'"
         return gdb_batch_cmd
 
@@ -2733,6 +2739,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("$2 = -3", gdb_output)  # test.string.compare longer
         self.assertIn(
             'inline static const std::string test_string = "cpp-example-lib %s";' % magic_string, gdb_output)
+
+        # check if resolving std::vector works with python scripts
+        self.assertRegex(gdb_output, r"55\s+std::vector<int> numbers = \{1, 2, 3\};")
+        self.assertIn("$3 = std::vector of length 3, capacity 3 = {1, 2, 3}", gdb_output)
+
         self.assertIn("exited normally", gdb_output)
 
     def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string):
-- 
2.52.0


