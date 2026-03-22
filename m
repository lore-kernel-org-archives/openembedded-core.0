Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17841FC72D0
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:13:43 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32149.1774192414254090736
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=DkbEJUvl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20260322151331f102e4d26600020700-_cotg_@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260322151331f102e4d26600020700
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Mar 2026 16:13:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MEqyzXeEN/RVE6RVpBJ+VJEtqbkv6Iaw6xGtaYq4BeY=;
 b=DkbEJUvlkjnFD3JG1QibGXmgShh5ldY2wxBlqr4ZsLZrvdtHzgoMeGIcxw1m39yN34ojVp
 EuWylPI1dEV01x2jX8Qf4iC1qkEB1Yfto+5iY/zo9hqrHCLhKSdLiVEj4g0Zr7W1sacud05V
 WjWcRi4VoD9AEDEpIJyMwXZxecD6P9hvbI88zp/NG2FR5CmDgNT/uvOS1e04W5frjjCp5apE
 gq59vA52CmVc4HUGp4o2cEJg+RkFGEvZftrSPObwm2JJ5zB7QGLhfxRtAqxq8JwMJL6ihfXg
 yIyUu+HB2yg5Wn4kxjUMA4l7hFa/MIilEZWOB19NnBHxG0nFQPgCUGqg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 5/9] devtool: ide-sdk: use TOOLCHAIN not TCOVERRIDE
Date: Sun, 22 Mar 2026 16:12:56 +0100
Message-ID: <20260322151320.661246-6-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233680

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Looks like TOOLCHAIN is the correct variable to determine the toolchain
used by a recipe, not TCOVERRIDE.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 9bccd76f0c..07f5552758 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -416,7 +416,7 @@ class RecipeModified:
         self.staging_incdir = None
         self.strip_cmd = None
         self.target_arch = None
-        self.tcoverride = None
+        self.toolchain = None
         self.topdir = None
         self.workdir = None
         # Service management
@@ -502,7 +502,7 @@ class RecipeModified:
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd = recipe_d.getVar('STRIP')
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
-        self.tcoverride = recipe_d.getVar('TCOVERRIDE')
+        self.toolchain = recipe_d.getVar('TOOLCHAIN')
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
@@ -673,7 +673,7 @@ class RecipeModified:
     @property
     def gdb_pretty_print_scripts(self):
         if self._gdb_pretty_print_scripts is None:
-            if self.tcoverride == "toolchain-gcc":
+            if self.toolchain == "gcc":
                 gcc_python_helpers_pattern = os.path.join(self.recipe_sysroot, "usr", "share", "gcc-*", "python")
                 gcc_python_helpers_dirs = glob.glob(gcc_python_helpers_pattern)
                 if gcc_python_helpers_dirs:
-- 
2.53.0


