Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862BCE9413B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 08:47:39 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60913.1767084455798393690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 00:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Aee1+/x1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2025123008473236b561346000020759-4qacbd@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025123008473236b561346000020759
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 09:47:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=A0HE8m6R38DCujzH58JuvE2k69Oj86MboGi7xB5tQt0=;
 b=Aee1+/x1uJkune073qUyWkny1eGqRv/prFMiaMTJS47DqiVOKd854xQW3PoQLC8dfVX6fD
 d2oEwBT5tnOR0K1dWe/xrCvW1ozxQBcx6YBZbya5XcvYyqicQSfgMt/6CFUFKjORD2PJMaL6
 2rjovVT8iQGomz3Y5epj1hJTivDYfXnW2vhjjFBQ5WotDIwIGnvLl994cbxjaLOIxmqmzsm1
 AC9IcRKZM0J2HofOtsmQxmcQQvrZFccQqSUd7G7iGhsklGEJVLQpQ+OZwjd0yeKuShVIfSOW
 2LZvOmf0ic8EnNrteutESoh1Zy9qLqlmTy5S5WfGhtOE6B2TGcBuyDdw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/14] devtool: ide-sdk find bitbake-setup init-build-env
Date: Tue, 30 Dec 2025 09:46:41 +0100
Message-ID: <20251230084720.2371227-2-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228629

From: Adrian Freihofer <adrian.freihofer@siemens.com>

With poky the oe-init-build-env script from the top level directory of
the layer with the higher priority is used to setup the build
environment.
This does no longer work with bitbake-setup. The directory layout
changed and the script is now called init-build-env. Skip the old
implementation if $TOPDIR/init-build-env exists and use it instead.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 87a4c13ec5..9df88454c7 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -269,6 +269,7 @@ class RecipeNotModified:
 class RecipeModified:
     """Handling of recipes in the workspace created by devtool modify"""
     OE_INIT_BUILD_ENV = 'oe-init-build-env'
+    INIT_BUILD_ENV = 'init-build-env'
 
     VALID_BASH_ENV_NAME_CHARS = re.compile(r"^[a-zA-Z0-9_]*$")
 
@@ -743,7 +744,13 @@ class RecipeModified:
 
     @property
     def oe_init_build_env(self):
-        """Find the oe-init-build-env used for this setup"""
+        """Find the init-build-env used for this setup"""
+        # bitbake-setup mode
+        bb_setup_init = os.path.join(self.topdir, RecipeModified.INIT_BUILD_ENV)
+        if os.path.exists(bb_setup_init):
+            return os.path.abspath(bb_setup_init)
+
+        # poky mode
         oe_init_dir = self.oe_init_dir
         if oe_init_dir:
             return os.path.join(oe_init_dir, RecipeModified.OE_INIT_BUILD_ENV)
-- 
2.52.0


