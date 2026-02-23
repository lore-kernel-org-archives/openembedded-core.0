Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDEFEC113F
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:08:14 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5270.1771880890345406642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=OdWR3c+j;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202602232108077b1fc73b1f000207ff-o0jqfw@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202602232108077b1fc73b1f000207ff
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 22:08:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vDCF/ic7iMF0NGecHj1JFvSOYi2e0RcsvOFBIslwrV8=;
 b=OdWR3c+j36HV2PlaDrB13pWNew+PCREFpmMfmO+QWBphpa8vp0rhfcM5KlhiwzhCsEHnn3
 Wq9e3QHNAOTiLXm3mIOV2SX25T3kgbeQESIDK1JMXtltYVDV9YxFT1HUHnfjlQ6shEcZ2Tok
 fDSctyzgAirz1ympA3e5CpJY5y1I1x0TtJUW6iEMX1xQFQlaHwQ1XjgnG736eR0qPfDyRnvi
 7CgswORUXBHpyf8YuLu8qlGSXwKEOtBbQi9qEgRaeIv5NFg6xhjQ43erSJJU5NP20TpT65Ok
 lnsZgsHFGMon3m/cJnAKzxm96IoCb7JOUlouhtCN/nqRH/5ZLtQqcGRw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/7] devtool: ide-sdk gate gdbserver warnings on recipe need
Date: Mon, 23 Feb 2026 22:06:36 +0100
Message-ID: <20260223210748.1905502-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
References: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231697

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a `wants_gdbserver` attribute to modified recipes and evaluate it
across the selected set. Only emit warnings about missing `gdbserver`
and missing `image-combined-dbg` when at least one recipe actually
requires remote debugging support.

This avoids noisy, irrelevant warnings in setups that do not use
gdbserver.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index ba225f20b9..d6cda4be9d 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -427,6 +427,11 @@ class RecipeModified:
         self.__oe_init_dir = None
         # main build tool used by this recipe
         self.build_tool = BuildTool.UNDEFINED
+        # Whether this recipe benefits from gdbserver and rootfs-dbg in the image.
+        self.wants_gdbserver = True
+        # Whether to warn when DEBUG_BUILD is not set.  Kernel modules are built
+        # by the kernel's build system and DEBUG_BUILD does not influence them.
+        self.wants_debug_build = True
         # build_tool = cmake
         self.oecmake_generator = None
         self.cmake_cache_vars = None
@@ -1156,12 +1161,14 @@ def ide_setup(args, config, basepath, workspace):
             exec_build_env_command(
                 config.init_path, basepath, bb_cmd_late, watch=True)
 
+    wants_gdbserver = any(
+        r.wants_gdbserver for r in recipes_modified)
     for recipe_image in recipes_images:
-        if (recipe_image.gdbserver_missing):
+        if wants_gdbserver and recipe_image.gdbserver_missing:
             logger.warning(
                 "gdbserver not installed in image %s. Remote debugging will not be available" % recipe_image)
 
-        if recipe_image.combine_dbg_image is False:
+        if wants_gdbserver and recipe_image.combine_dbg_image is False:
             logger.warning(
                 'IMAGE_CLASSES += "image-combined-dbg" is missing for image %s. Remote debugging will not find debug symbols from rootfs-dbg.' % recipe_image)
 
@@ -1178,7 +1185,7 @@ def ide_setup(args, config, basepath, workspace):
             ide.setup_modified_recipe(
                 args, recipe_image, recipe_modified)
 
-            if recipe_modified.debug_build != '1':
+            if recipe_modified.wants_debug_build and recipe_modified.debug_build != '1':
                 logger.warn(
                     'Recipe %s is compiled with release build configuration. '
                     'You might want to add DEBUG_BUILD = "1" to %s. '
-- 
2.53.0


