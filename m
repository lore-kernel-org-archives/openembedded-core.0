Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B897CD4F4D
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 07:45:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18744.1763019940155802068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 23:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RPXTHJJJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251113074535616c3b4c3500020744-_1l0lq@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251113074535616c3b4c3500020744
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 08:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ewCQyDrabcYzaQPI9kJQx/ys6Y+dFU/kwPjA6KM4hhA=;
 b=RPXTHJJJMC3Gjm1Lugz3UBmcHkOJQSEuIz/EfApgFuC/2iQV/sIyeYaUqsy+ehUbbF/sbn
 noUd6Q23RfncOUUZ18aR5mc0l1zMISFr/FLUpF4WaEUgP2xEhEvyzlUhE9iiklT5C3dBlFfG
 wSU40QvWTnmlwDLuEhAoOWwv6Mfl7IHaiPS4M232THK4tkgE5w44jsnclNCtyCwb1+Z8M89x
 5UDL42jE5ZV6Wyf5nE+qFdyRe4+eS52Sda8sHmw0/gsMqw/qZaB9js+3UkJERK8UUpcLGbw3
 D1pk52NHB+KhpEpKGRaWntu1u9VqFy/x39mkw5qtj1Xd9erdNRqQZKfQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] oeqa: fix package detection in go sdk tests
Date: Thu, 13 Nov 2025 08:45:25 +0100
Message-Id: <20251113074525.8771-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 07:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226226

From: Peter Marko <peter.marko@siemens.com>

The test are skipped if architecture contains dash because TARGET_ARCH
contains underscore while package name contains dash. Here the
translation needs to be done.

Note that poky distro default arch has dash:
MACHINE="qemux86-64"
TARGET_ARCH="x86_64"
ERROR: Nothing PROVIDES 'go-cross-canadian-x86_64'. Close matches:
  gcc-cross-canadian-x86-64
  gdb-cross-canadian-x86-64
  go-cross-canadian-x86-64
TRANSLATED_TARGET_ARCH="x86-64"

Quoting meta/classes-recipe/cross-canadian.bbclass:
TRANSLATED_TARGET_ARCH is added into PN

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/sdk/cases/go.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/cases/go.py
index a050df7a9f..693be89e1d 100644
--- a/meta/lib/oeqa/sdk/cases/go.py
+++ b/meta/lib/oeqa/sdk/cases/go.py
@@ -25,9 +25,9 @@ class GoCompileTest(OESDKTestCase):
                         os.path.join(self.tc.sdk_dir, 'test.go'))
 
     def setUp(self):
-        target_arch = self.td.get("TARGET_ARCH")
+        translated_target_arch = self.td.get("TRANSLATED_TARGET_ARCH")
         # Check for go-cross-canadian package (uses target architecture)
-        if not self.tc.hasHostPackage("go-cross-canadian-%s" % target_arch):
+        if not self.tc.hasHostPackage("go-cross-canadian-%s" % translated_target_arch):
             raise unittest.SkipTest("GoCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
 
         # Additional runtime check for go command availability
@@ -63,9 +63,9 @@ class GoHostCompileTest(OESDKTestCase):
                         os.path.join(self.tc.sdk_dir, 'test.go'))
 
     def setUp(self):
-        target_arch = self.td.get("TARGET_ARCH")
+        translated_target_arch = self.td.get("TRANSLATED_TARGET_ARCH")
         # Check for go-cross-canadian package (uses target architecture)
-        if not self.tc.hasHostPackage("go-cross-canadian-%s" % target_arch):
+        if not self.tc.hasHostPackage("go-cross-canadian-%s" % translated_target_arch):
             raise unittest.SkipTest("GoHostCompileTest class: SDK doesn't contain a Go cross-canadian toolchain")
 
         # Additional runtime check for go command availability

