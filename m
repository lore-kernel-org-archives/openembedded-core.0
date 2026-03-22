Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313EAFC72D2
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:13:43 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32152.1774192414255712603
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Cg/OPGyU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260322151331d6b6830567000207f0-amuyz1@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260322151331d6b6830567000207f0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Mar 2026 16:13:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/K626ca1deFDCnmAmQkaFpTob7xtoG62ZwsM+fBUSRE=;
 b=Cg/OPGyU1T/LvRSnO0HM4zBEW15yy7lyBw5bdPuqDQumbaW+EL/f+2uENXaAWIZm1HOFn8
 FjdlDi7w5b8/brxDNx45fPJXc85jDgazRvzHBAxYOaMV+JBculjeKae1Ve8J/F6nbJ4maf8O
 1+8oKiMftScwuZ6x4ONq38WPazH8PZ9Mfx0jmc1jVl+bV14ILeqhG8lh1OOFur8zh3C8gSV4
 8k3wYZtIuWCgYTC3OhOD4b1jMZ+dH+iE4/WtotIIaaZZej7t5EUsLLSbsH0RZIb0Mib+JPPw
 uSPHCBZgbDIT3UzwD/2d8tOrhTdpYyWNJ5VdFeg1xSLH+eLzqfSczapw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/9] oe-selftest: devtool: use assertRegex to match test output for meson
Date: Sun, 22 Mar 2026 16:12:54 +0100
Message-ID: <20260322151320.661246-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260322151320.661246-1-adrian.freihofer@siemens.com>
References: <20260322151320.661246-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 15:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233679

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace strict string matching with assertRegex to allow for flexible
whitespace in the "Fail: 0" output from meson tests. This improves test
robustness against formatting changes.
This issue was discovered with scarthgap.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 297dda7457..dc83d406fd 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2911,7 +2911,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         result = runCmd('%s test -C %s' % (meson_exe, build_dir),
                         cwd=tempdir, output_log=self._cmd_logger)
         self.assertEqual(result.status, 0)
-        self.assertIn("Fail:              0", result.output)
+        self.assertRegex(result.output, r"Fail:\s+0")
 
         # Verify re-building and testing works again
         result = runCmd('%s compile -C %s --clean' % (meson_exe, build_dir),
@@ -2922,7 +2922,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         result = runCmd('%s test -C %s' % (meson_exe, build_dir),
                         cwd=tempdir, output_log=self._cmd_logger)
         self.assertEqual(result.status, 0)
-        self.assertIn("Fail:              0", result.output)
+        self.assertRegex(result.output, r"Fail:\s+0")
 
         return compile_cmd
 
-- 
2.53.0


