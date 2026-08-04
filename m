Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80851C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14576.1785844847571695867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hLycic3v;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202608041200377f1e14473e000207b1-v9w6tu@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608041200377f1e14473e000207b1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qzTxp9f6vQ4x6cKLkZp7XUvdGJbpQJ6w1Fchk8y8fr0=;
 b=hLycic3v4J0OIeEiAX4YVUCDzCosF8l/LVVpeV4y/UdsZoUahVmPUcHcDVjSZKrL3ZXJH2
 wjesSKT1q5i71m6R3Wi4vk+ZWoA/Q2r8tiHgkbAseJ2Ehdvqe04gQhL6IAwejZe9Q+NJSPzI
 HQ3cMhXcEqwYHYe59hYITzsEhWBbhuJ48iktHEquTfPVEOBQTJ0FaUylPDAQn0hY8iDGt7LI
 o7Jl5ahfLBarxiG6Q60bAoZ4BYvLtLoXWcKmBDDNKl0tMggrRxwbemP+sSXLd0pbB/a5ZZid
 kR7scdLCRT4xM0F9XNRYRI12FjTrNfRWInGo/8PwYYO2P5OKsnaZrgzw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 01/14] oe-selftest: devtool: use stat for reading user/group names in ide-sdk tests
Date: Tue,  4 Aug 2026 13:59:25 +0200
Message-ID: <20260804120034.378787-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242726

From: Adrian Freihofer <adrian.freihofer@siemens.com>

On some systems, ls truncates long user and group names, which causes the
ownership check to fail. For example:

AssertionError: Regex didn't match:
  '^-.+ cmake-example cmake-example .+ /etc/cmake\\-example\\.conf$' not found in
  '-rw-r--r--    1 cmake-ex cmake-ex        83 Mar  9  2018 /etc/cmake-example.conf'

Use "stat -c '%U %G'" instead, which always returns the full user and group
names regardless of terminal width or system configuration.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b138a5ef6f..2e91c2be97 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3118,11 +3118,14 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
     def _verify_conf_file(self, qemu, conf_file, owner, group):
         """Helper to verify a configuration file is owned by the proper user and group"""
-        ls_cmd = "ls -l %s" % conf_file
-        status, output = qemu.run(ls_cmd)
-        self.assertEqual(status, 0, msg="Failed to ls %s: %s" % (conf_file, output))
-        self.assertRegex(output, rf"^-.+ {owner} {group} .+ {re.escape(conf_file)}$",
-                         msg="%s not owned by %s:%s: %s" % (conf_file, owner, group, output))
+        stat_cmd = "stat -c '%%U %%G' %s" % conf_file
+        status, output = qemu.run(stat_cmd)
+        self.assertEqual(status, 0, msg="Failed to stat %s: %s" % (conf_file, output))
+        actual_owner, actual_group = output.strip().split()
+        self.assertEqual(actual_owner, owner,
+                         msg="%s not owned by user %s: got %s" % (conf_file, owner, actual_owner))
+        self.assertEqual(actual_group, group,
+                         msg="%s not owned by group %s: got %s" % (conf_file, group, actual_group))
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_none_qemu(self):
-- 
2.55.0


