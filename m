Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E368C02199
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:00:50 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.web11.91116.1738598447652832725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YmrnT6h74zRZr;
	Mon,  3 Feb 2025 17:00:45 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YmrnT3s5jzlg3;
	Mon,  3 Feb 2025 17:00:45 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 03 Feb 2025 17:00:29 +0100
Subject: [PATCH RFC 1/6] patchtest: use logger instead of printing to
 stdout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-patchtest-v1-1-ef6ee5fcdd78@cherry.de>
References: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
In-Reply-To: <20250203-b4-patchtest-v1-0-ef6ee5fcdd78@cherry.de>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
 openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210660

From: Quentin Schulz <quentin.schulz@cherry.de>

This will allow use to specify which messages we want to see later on.
This will be useful for using this script with b4 for example which
expects output on stdout/stderr only when an error happened.

To that end, success string is set to the info level, warning string to
warning level and error to error level.

The summary is printed with the appropriate log level, error if warnings
or errors were found, info otherwise.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 scripts/patchtest | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 9218db232a77516d2a8bdcd967521b884f0de89d..bcd48dbcc39573d7abd3247bc34cb9ac8a8a5c2e 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -82,7 +82,7 @@ def getResult(patch, mergepatch, logfile=None):
             fail_str = '{}: {}: {} ({})'.format(self.fail,
             test_description, json.loads(str(err[1]))["issue"],
             test.id())
-            print(fail_str)
+            logger.error(fail_str)
             if logfile:
                 with open(logfile, "a") as f:
                     f.write(fail_str + "\n")
@@ -94,7 +94,7 @@ def getResult(patch, mergepatch, logfile=None):
             "non-AUH").replace("presence format", "presence")
             success_str = '{}: {} ({})'.format(self.success,
             test_description, test.id())
-            print(success_str)
+            logger.info(success_str)
             if logfile:
                 with open(logfile, "a") as f:
                     f.write(success_str + "\n")
@@ -107,7 +107,7 @@ def getResult(patch, mergepatch, logfile=None):
             skip_str = '{}: {}: {} ({})'.format(self.skip,
             test_description, json.loads(str(reason))["issue"],
             test.id())
-            print(skip_str)
+            logger.warning(skip_str)
             if logfile:
                 with open(logfile, "a") as f:
                     f.write(skip_str + "\n")
@@ -169,18 +169,22 @@ def run(patch, logfile=None):
     return premerge_result or postmerge_result
 
 def print_result_message(preresult, postresult):
-    print("----------------------------------------------------------------------\n")
     if preresult == 2 and postresult == 2:
+        logger.error("----------------------------------------------------------------------\n")
         logger.error(
             "patchtest: No test cases found - did you specify the correct suite directory?"
         )
+        logger.error("----------------------------------------------------------------------\n")
     if preresult == 1 or postresult == 1:
+        logger.error("----------------------------------------------------------------------\n")
         logger.error(
             "WARNING: patchtest: At least one patchtest caused a failure or an error - please check https://wiki.yoctoproject.org/wiki/Patchtest for further guidance"
         )
+        logger.error("----------------------------------------------------------------------\n")
     else:
+        logger.info("----------------------------------------------------------------------\n")
         logger.info("OK: patchtest: All patchtests passed")
-    print("----------------------------------------------------------------------\n")
+        logger.info("----------------------------------------------------------------------\n")
 
 def main():
     tmp_patch = False

-- 
2.48.1


