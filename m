Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E34AC98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:02:10 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1606.1790229717798810511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 23:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=BMzmEYhH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260924060154cc5be1bf5000020782-c17v06@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260924060154cc5be1bf5000020782
        for <openembedded-core@lists.openembedded.org>;
        Thu, 24 Sep 2026 08:01:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yeb3d92oJh8P7+dfbHKSGISuNCih8qi3zXvJ+Gc4l3s=;
 b=BMzmEYhHh9BcPXzyjfXUUEbuaiPFSGpbIIbN2GmFQ/amNBheX3W1WYQt5SxAoWstUEDLrQ
 9bBOUGH//mRRlUq9hbQZlXzZilftlew2uWPZj5aqfToZR/XUN08sUGocGo41fQJrDU1Q1Tlr
 Jrd7J7QTlxG0oX0Czvs8LlHnTv7y0lrVAAdyiAVHnkQhCL1yAK3I91IMuuR8UrFZbIHyNoJJ
 KS5CBWEX4heO9XrC0lNa529b1UmCLG/Dz3WkNjeQDr0so90NKOv4WP9gc1oNpPHxIbEIMMJb
 8P2JgQJ+cKDsIL9OYpyWsvNm5TCkXa373D6C6M3qYJ1Y/llb2OVYQgiw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] devtool: ide-sdk: make nfs export script quicker
Date: Thu, 24 Sep 2026 08:01:37 +0200
Message-ID: <20260924060138.364180-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 06:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246568

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index e1a9d1774e..c527d17806 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -210,6 +210,7 @@ class RecipeImage:
         self.qb_slirp_opt = ''
         self.fakerootcmd = None
         self.fakerootenv = None
+        self.staging_dir_native_qemu_helper = None
         self.bootstrap_tasks = [self.name + ':do_build']
         # Debug settings already provided by the base configuration (e.g.
         # local.conf, MACHINE, DISTRO, the recipe itself) plus any bbappend
@@ -254,7 +255,7 @@ class RecipeImage:
                     f.write(stripped)
         return originals
 
-    def initialize(self, config, tinfoil):
+    def initialize(self, config, tinfoil, nfs=None):
         appends_dir = os.path.join(config.workspace_path, 'appends')
         self._bbappend = os.path.join(appends_dir, self.name + '.bbappend')
 
@@ -289,6 +290,13 @@ class RecipeImage:
         self.fakerootcmd = image_d.getVar('FAKEROOTCMD')
         self.fakerootenv = image_d.getVar('FAKEROOTENV')
 
+        # Only needed by nfs_hw_helper()
+        if nfs:
+            qemu_helper_native_d = parse_recipe(
+                config, tinfoil, 'qemu-helper-native', appends=True, filter_workspace=False)
+            self.staging_dir_native_qemu_helper = (
+                qemu_helper_native_d.getVar('STAGING_DIR_NATIVE') if qemu_helper_native_d else None)
+
     @property
     def debug_support(self):
         return bool(self.rootfs_dbg)
@@ -359,6 +367,11 @@ class RecipeImage:
         with open(helper, 'w') as helper_file:
             helper_file.write('#!/bin/sh\n')
             helper_file.write('set -e\n')
+            if self.staging_dir_native_qemu_helper:
+                # Skips oe-find-native-sysroot's own bitbake-getvar call, see
+                # the comment on staging_dir_native's resolution in initialize().
+                helper_file.write(
+                    'export OECORE_NATIVE_SYSROOT=%s\n' % shlex.quote(self.staging_dir_native_qemu_helper))
             helper_file.write(
                 'runqemu-export-rootfs start %s\n' % shlex.quote(rootfs_dir))
             helper_file.write(
@@ -1814,7 +1827,7 @@ def ide_setup(args, config, basepath, workspace):
             recipe_image = RecipeImage(
                 recipes_image_name,
                 orig_bbappend_contents.get(recipes_image_name))
-            recipe_image.initialize(config, tinfoil)
+            recipe_image.initialize(config, tinfoil, args.nfs)
             recipe_image.set_nfs_rootfs(nfs_export_base_dir, args.nfs)
             # With --skip-bitbake nothing is extracted, so the generated IDE
             # configuration would point at a directory that never appears.
-- 
2.55.0


