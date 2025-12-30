Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975D7E9413C
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 08:47:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60921.1767084455942101399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 00:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Ziv0U3Wq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025123008473417184df6590002070a-pegow5@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025123008473417184df6590002070a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 09:47:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QkgPYa6oIRStytE7j5F1QHlhs5dQlxOvVoR78o4a8Zk=;
 b=Ziv0U3WqxTpBZc1jXJZs+r0vXTN/ZXSOUjIK0KwjXclUQfJ/whJyagA3RGLp9S3EQZNzCP
 /a0tzFLKUhuaMWoZeATXTL4WVGmcWejVfJS1E7CBzWWIoyQczStnHCnfSlovNSzLXeKuRZjI
 /o4McfmKF3knYIkeVki2itVDvhuYO7oHvam24TFMKxliYZyPsqeyS2oB5nXkqBBDW2lKuJk+
 UR5Ja33tzqCtMYe/yoXEkaDsojZdLTqYpNvunuAL2sdIElRbjexVnV7vbBg3kCCLmv14px8d
 gVKmGTCw4YrxZYZF8f+0I08Lf6vhlbNJLcUn+6kZmntt87lsHTo1ydWg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 13/14] oe-selftest: devtool: add test for gdb pretty-printing
Date: Tue, 30 Dec 2025 09:46:53 +0100
Message-ID: <20251230084720.2371227-14-adrian.freihofer@siemens.com>
In-Reply-To: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
References: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 08:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228633

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This extends the existing devtool IDE SDK tests to verify that gdb
pretty-printing is working correctly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index df5c863a85..092ffd5e9e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2725,6 +2725,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
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
 
@@ -2734,6 +2740,11 @@ class DevtoolIdeSdkTests(DevtoolBase):
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


