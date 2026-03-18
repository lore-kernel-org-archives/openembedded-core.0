Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C151088E54
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:38:34 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27345.1773873511005398453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 15:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=HYppx01b;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260318223827eb65a9a1370002075a-l17cs_@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260318223827eb65a9a1370002075a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 18 Mar 2026 23:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/K626ca1deFDCnmAmQkaFpTob7xtoG62ZwsM+fBUSRE=;
 b=HYppx01bAkRIDOvtjNLXkQIeQSjaJE57yiuawuJq2UZ7gsS1vfFxW3Y6mt5OtYiYOBdRHM
 1WHQHtuSWmV5cRYfqCETsjkY3WRIOF6xv56V5SemTEpIURTQp13s5tjkGSRBF2BjNOf1Dmx4
 DFITH7dknlfbWnT+QS60EXvvpmqVD+e2dSrFGbnSiQQamCvfJSph7hvYW+jlrrhitys2Q5uC
 URgMHaWiPP5BdtXfa4erWDqEniagB08pP0Vx0A39nvObP1MtuTq90Ay4TBKSvra+o6U8TDR9
 lfm7FncVrzdccSicIBLn/02K2xmF8236yVuUD4KFFNRvcjFQjvtVo8Ew==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/9] oe-selftest: devtool: use assertRegex to match test output for meson
Date: Wed, 18 Mar 2026 23:36:11 +0100
Message-ID: <20260318223736.3414885-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 22:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233438

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


