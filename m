Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85517E95A79
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 10:56:40 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62204.1767092191520063184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 02:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=MLNZLo2+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20251230105628fbf8661b1500020780-412dxf@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251230105628fbf8661b1500020780
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 11:56:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QdS1fEVc1a7OnHr6WV7LzPvtUggBwrI0sNDDXF51L9g=;
 b=MLNZLo2+kalZTJXHasJUi++UOGdcBajzCQ2kd5RhaS0PGjPbKnCA15AsIwDD558m2kY9zS
 edLmXSgOcyksqiX1OjIX9GHHV7D/4E2qs1ywb+/XuOFZojIa6TWTMEl4cBfK2x9PnEpswubp
 Scl+QNejTCaq5CwPHRKIhMdHrnCF+AioqVyIz4xlZAtT+0rG4Jvv9cV6aA6Mkfx8WleMJrMg
 pedg0FSSYtiqsKU4WLKKXyTHchOqmzV5kO+l726DzImv0RKv4IJ6XJ5pbq0YhKM0GZyH72Cv
 GV8cK5p8Xn+qT/9PMRk87oICt+qSBupFNogjmIAoiUw67XSb/DoP+LgA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 4/4] oe-selftest: ide_sdk: use the ide-sdk fragment
Date: Tue, 30 Dec 2025 11:52:59 +0100
Message-ID: <20251230105607.2615849-5-adrian.freihofer@siemens.com>
In-Reply-To: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
References: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228656

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Test also the new ide-sdk fragment when setting up the ide-sdk test
environment.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8d7e984753..90ce543a6f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2524,12 +2524,10 @@ class DevtoolUpgradeTests(DevtoolBase):
 
 class DevtoolIdeSdkTests(DevtoolBase):
     def _write_bb_config(self, recipe_names):
-        """Helper to write the bitbake local.conf file"""
+        """Helper to write the bitbake configuration"""
+        self.configure_fragments(['core/yocto/devtool-ide-sdk'])
         conf_lines = [
-            'IMAGE_CLASSES += "image-combined-dbg"',
-            'IMAGE_GEN_DEBUGFS = "1"',
-            'IMAGE_INSTALL:append = " gdbserver %s"' % ' '.join(
-                [r + '-ptest' for r in recipe_names]),
+            'IMAGE_INSTALL:append = " %s"' % ' '.join([r + '-ptest' for r in recipe_names]),
             'DISTRO_FEATURES:append = " ptest"'
         ]
         self.write_config("\n".join(conf_lines))
-- 
2.52.0


