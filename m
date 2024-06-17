Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5180C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 13:42:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.57053.1718631762450205288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 06:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCDA2DA7
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:43:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA61A3F64C
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:42:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/core/runner: stub addDuration in OETestResult
Date: Mon, 17 Jun 2024 13:42:40 +0000
Message-Id: <20240617134240.523266-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 13:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200840

We have a custom TestResult implementation, and Python 3.12 added a new
method addDuration() to the TestResult interface.  This would be useful
to implement correctly, but for now stub it out to silence the warning
when running under Python 3.12:

/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult ha=
s no addDuration method
  warnings.warn("TestResult has no addDuration method",

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/runner.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index a86a706bd96..e478931c4e4 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -78,6 +78,10 @@ class OETestResult(_TestResult):
                     self.shownmsg.append(test.id())
                     break
=20
+    # Python 3.12 added this, stub it out for now
+    def addDuration(self, test, elapsed):
+         pass
+
     def logSummary(self, component, context_msg=3D''):
         elapsed_time =3D self.tc._run_end_time - self.tc._run_start_time
         self.tc.logger.info("SUMMARY:")
--=20
2.34.1


