Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9743FC72DA
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:13:43 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32199.1774192414256383382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=DAoxWaR9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260322151331e68cda049500020729-po7gur@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260322151331e68cda049500020729
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Mar 2026 16:13:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PA/gKoxstrdCkK4pkvM2pRAulHSwohCk8obtB87bgZ4=;
 b=DAoxWaR9MszG6A7wpPbmtmOqaV0RRX6qZbb/+QXl3R0zEU/dRgI4/1swtphbi4+Dxp/dYw
 9Y/EytNBIFf6aU6MqNcYTTYalBjWF1L7LacZqBeVuSc2N1Ura3fr4EEIder/kjRXls4GmDeh
 fjx3JnlnJAYf9XkiF3tPiFKRNpyj9Y1K1AKKi04KskACKNKFzBQmtJcr6csnIXw9DsZhPgAP
 AV9bt+4Txl7wCjBgSiHapvKoP5njAXfYoQ+T872Lfk/tHPF87YayD2WbBpK0R7HvzfFJRpnF
 XYlfmHzGOfzfkKvvhbTrNP9EOQix/vJbS5KyNt2IlXuEF/y1RibbtcvA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/9] oe-selftest: devtool: use stat for reading user/group names in ide-sdk tests
Date: Sun, 22 Mar 2026 16:12:52 +0100
Message-ID: <20260322151320.661246-2-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233675

From: Adrian Freihofer <adrian.freihofer@siemens.com>

On some systems, ls truncates long user and group names, which causes the
ownership check to fail. For example:

AssertionError: Regex didn't match:
  '^-.+ cmake-example cmake-example .+ /etc/cmake\\-example\\.conf$' not found in
  '-rw-r--r--    1 cmake-ex cmake-ex        83 Mar  9  2018 /etc/cmake-example.conf'

Use "stat -c '%U %G'" instead, which always returns the full user and group
names regardless of terminal width or system configuration.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

  # Please enter the commit message for your changes. Lines starting
  # with '#' will be ignored, and an empty message aborts the commit.
  #
  # Date:      Mon Mar 2 23:32:13 2026 +0100
  #
  # interactive rebase in progress; onto c1fb515f2a
  # Last commands done (3 commands done):
  #    pick 08cf9a6fc0 # Revert "devtool: ide-sdk deploy-target without bitbake"
  #    reword 2ab466cf23 # oe-selftest: devtool: use stat for reading user names in ide-sdk tests
  # Next commands to do (3 remaining commands):
  #    reword 81562bd21a # oe-selftest/cpp-example: fix conf file ownership with static UIDs/GIDs
  #    reword 1f6fd56a04 # oe-selftest: devtool: GDB breakpoint after std::vector is constructed
  # You are currently editing a commit while rebasing branch 'adrianf/ide-sdk-improvements' on 'c1fb515f2a'.
  #
  # Changes to be committed:
  #	modified:   meta/lib/oeqa/selftest/cases/devtool.py
  #
  # ------------------------ >8 ------------------------
  # Do not modify or remove the line above.
  # Everything below it will be ignored.
  diff --git c/meta/lib/oeqa/selftest/cases/devtool.py i/meta/lib/oeqa/selftest/cases/devtool.py
  index 5f25c4803b..9d8ffcc786 100644
  --- c/meta/lib/oeqa/selftest/cases/devtool.py
  +++ i/meta/lib/oeqa/selftest/cases/devtool.py
  @@ -2934,11 +2934,14 @@ class DevtoolIdeSdkTests(DevtoolBase):

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

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5f25c4803b..9d8ffcc786 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2934,11 +2934,14 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
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
2.53.0


