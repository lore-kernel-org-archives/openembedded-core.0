Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BFAC88E71
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:38:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15101.1769413110454170538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=F0n97LC7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026012607382736f38a2cdd000207d3-zv2na_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026012607382736f38a2cdd000207d3
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Jan 2026 08:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=A0HE8m6R38DCujzH58JuvE2k69Oj86MboGi7xB5tQt0=;
 b=F0n97LC7LA5MADrjIAzCwmdN0tSG5iFe2QMrRzdaqZIL/Jg8Gxuym75xF9N/iSbL+FA2ZB
 Po08L0xJgDI2TnpSEGYndAI6tdE6lMAWQmHeJ9v+T/vXlgMaXycOT4yolVg9wUepSoNyHb60
 Vek+tlqkJoeRjt4DF8y+l98qWrOHil68z6jQ9oykvkJS/naESK2SHs+6+FTZSQ99JDhBGMnW
 ILkImS0ZCpcETAQJKqSRMRtppWO4PqOrrHhbf2qASiZ46F6BSRSPUYfN8EFpai8Ul1qM6u/i
 nkfbIb962LgV7HMEh66TqRo6og21Xa2PAMqB4iKsTn+TPuRFsL7IP07Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 02/13] devtool: ide-sdk find bitbake-setup init-build-env
Date: Mon, 26 Jan 2026 08:37:29 +0100
Message-ID: <20260126073809.468495-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260126073809.468495-1-adrian.freihofer@siemens.com>
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229957

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


