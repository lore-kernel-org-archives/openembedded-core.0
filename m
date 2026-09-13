Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D0CC88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:06:43 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5904.1789329997622733022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=N+TcVXxq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2026091320063486f422f69500020762-9lx9kh@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026091320063486f422f69500020762
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9SMGC3KW5ouuXkWiKfFyjd5KBoYNMpjiQdD3qvOqtD4=;
 b=N+TcVXxqOU6nqcKFs38J81DlmcDWZFzhaCXzBX2WVplcP6hRUSiUQybtXNuGr+NUL4gw22
 WuGKWzB+Lua2Yj2bfPguvQxDxpPTPdEoacmMF2etgfw0tB2gySTIfbLOKKXmyURYy9ff6uKR
 CcEma42O4QMy8t6rWmgbWPX2TujOD9FIwbmZqBs3iOkuXEW/TkEEWgN7+lPSI552m+Vwvbmh
 9o48i5atpp2tJ4Zn8TffsE6/7jq1d6hBP6uZO5zW/SOEre06V1cvj4mBgLB2OITKyFf49JDa
 AxEzC2k2LngcMuxP48J+LgjVziSP/Y2DrPQx9LW9AwdxdWgu1yo8mBeg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/6] devtool: ide-sdk: support opt-out from auto IMAGE_INSTALL
Date: Sun, 13 Sep 2026 22:05:51 +0200
Message-ID: <20260913200624.331753-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260913200624.331753-1-adrian.freihofer@siemens.com>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245726

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Modified-mode recipes are automatically added to the image's
IMAGE_INSTALL, but recipes providing virtual/kernel or
virtual/bootloader (e.g. the kernel or u-boot) are deployed via
do_deploy into DEPLOY_DIR_IMAGE, not installed into the rootfs, so
adding them to IMAGE_INSTALL or attaching a userspace gdbserver to
them does not make sense.

Auto-detect these recipes via PROVIDES and skip both IMAGE_INSTALL
and gdbserver/lldb-server for them. IDE_SDK_AUTO_IMAGE_INSTALL allows
overriding this per recipe, in either direction.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 21442ce83b..14271ae871 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -406,6 +406,8 @@ class RecipeImage:
         if wants_lldb_server and 'lldb-server' not in self.base_image_install:
             lines.append('IMAGE_INSTALL:append = " lldb-server"')
         for r in recipes_modified:
+            if not r.wants_image_install:
+                continue
             if r.name not in self.base_image_install:
                 lines.append('IMAGE_INSTALL:append = " %s"' % r.name)
             if r.has_ptest and (r.name + '-ptest') not in self.base_image_install:
@@ -754,6 +756,11 @@ class RecipeModified:
 
     MARKER = '# devtool ide-sdk: clangd toolchain support'
 
+    # PROVIDES of recipes that are deployed via do_deploy (e.g. to
+    # DEPLOY_DIR_IMAGE) rather than installed into the rootfs, so adding them
+    # to IMAGE_INSTALL or attaching a userspace gdbserver does not make sense.
+    NON_IMAGE_INSTALL_PROVIDES = {'virtual/kernel', 'virtual/bootloader'}
+
     def __init__(self, name, orig_bbappend_content=None):
         self.name = name
         self.bootstrap_tasks = [name + ':do_install']
@@ -783,6 +790,7 @@ class RecipeModified:
         self.package_debug_split_style = None
         self.path = None
         self.pn = None
+        self.provides = []
         self.recipe_id = None
         self.recipe_sysroot = None
         self.recipe_sysroot_native = None
@@ -808,6 +816,8 @@ class RecipeModified:
         self.build_tool = BuildTool.UNDEFINED
         # Whether this recipe benefits from gdbserver and rootfs-dbg in the image.
         self.wants_gdbserver = True
+        # Whether this recipe should be added to IMAGE_INSTALL automatically
+        self.wants_image_install = True
         # Whether to warn when DEBUG_BUILD is not set.  Kernel modules are built
         # by the kernel's build system and DEBUG_BUILD does not influence them.
         self.wants_debug_build = True
@@ -942,6 +952,14 @@ class RecipeModified:
             self.packages_files[package] = recipe_d.getVar('FILES:' + package) or ''
         self.path = recipe_d.getVar('PATH')
         self.pn = recipe_d.getVar('PN')
+        self.provides = (recipe_d.getVar('PROVIDES') or '').split()
+        if self.NON_IMAGE_INSTALL_PROVIDES.intersection(self.provides):
+            self.wants_image_install = False
+            self.wants_gdbserver = False
+        ide_sdk_auto_image_install = recipe_d.getVar('IDE_SDK_AUTO_IMAGE_INSTALL')
+        if ide_sdk_auto_image_install is not None:
+            self.wants_image_install = bb.utils.to_boolean(
+                ide_sdk_auto_image_install)
         self.recipe_sysroot = os.path.realpath(
             recipe_d.getVar('RECIPE_SYSROOT'))
         self.recipe_sysroot_native = os.path.realpath(
-- 
2.55.0


