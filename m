Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA81FB5171
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 22:12:02 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66611.1775513516592113909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 15:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DzwJLZCi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260406221153fcd484037500020783-xvt2ph@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260406221153fcd484037500020783
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Apr 2026 00:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/K626ca1deFDCnmAmQkaFpTob7xtoG62ZwsM+fBUSRE=;
 b=DzwJLZCi5fBpSxUPAsboxhrFLZvIIMM7SlpWxkCf3qbOc9AJQQFYFT9210VhLax7wZi/9o
 LUkI2ywhTfe/Kf9EcEc5+d8byaFauYmIJrKvgK82iovF+ug+ctdd+cL77E5TC+1OuqvuJrS0
 BXt/4EXi6goL/RtRP9M0wihM9tpkDSY2blVoD7E26VAFwl+xj5YJmBnjy/HbYTeASI+zXrLw
 v1CDEssHXS69BWe3tSXtu/cUyEDJ3YCHK9xbnfS89BliCfLcYIhoziYL/lWLmZQl7S6G/7Ub
 pp6IihQdWZ1ifTDen4PXMkbmQeYFlhz0SmDbkYyeCD402KQPAWMttUuw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/6] oe-selftest: devtool: use assertRegex to match test output for meson
Date: Tue,  7 Apr 2026 00:10:31 +0200
Message-ID: <20260406221133.2769152-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
References: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 22:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234688

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


