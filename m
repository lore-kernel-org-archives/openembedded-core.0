Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BA5C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 17:45:18 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41618.1790531113091750625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 10:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=RjE60RH0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026092717450942668c271e00020792-ybmpo7@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026092717450942668c271e00020792
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 19:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YrcYOuqqMcYXO1gi+V7cGq5ZDzZaKpNdhBq9tmHOZdk=;
 b=RjE60RH0dLKg68+ChhEUBmcU80Klh0OJVbNwhImJiK1hnknvSCJQkY5jbkD7l6UoVpZijD
 4x0K+gCatp4s7FWYnbbZS1eSwf8cftanQSNTxDTIbdPnIDhzFUoottU37/Q3ZvmOwWFenrBz
 u4eECWLgYyS3yISvan7SKuJhHOXVJVhiU7a4wpHI5IqFlzMPRoqOSMUIm8OVPlX7lIK4xGEM
 1E92slNBHFhqey1Mx+EMZG0scmV1B47yVFfGekPSu5iPMPv5DwLf37WkD47JW0Hy/WrohMeE
 gfuXAJf79kTlvwC59QZH51ztT/U1AcM4xXZ78JhlC8TLjiJLRRPxdC6w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/5] devtool: ide-sdk: support NFS exports in shared mode
Date: Sun, 27 Sep 2026 19:44:51 +0200
Message-ID: <20260927174506.652690-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260927174506.652690-1-adrian.freihofer@siemens.com>
References: <20260927174506.652690-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 17:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246706

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Shared mode rejected --nfs even when an image was supplied, so an
image-backed debug session could not use an exported target rootfs.

Write the required image tar and debugfs settings before building,
then extract the selected rootfs before image-specific IDE setup.
Reject --nfs when no image recipe was supplied.

For example, build and export a debug rootfs with:

    devtool ide-sdk -m shared core-image-minimal --nfs=rootfs-dbg
---
 scripts/lib/devtool/ide_sdk.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 68005170c4..ac07dae656 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -391,7 +391,7 @@ class RecipeImage:
         return helper
 
     def update_image_bbappend(self, recipes_modified, nfs=None):
-        """Write debug settings for modified-mode recipes into the image bbappend.
+        """Write debug and NFS settings for the selected image into its bbappend.
 
         Writes IMAGE_GEN_DEBUGFS, IMAGE_FSTYPES_DEBUGFS, IMAGE_CLASSES for
         image-combined-dbg, the appropriate debug server (gdbserver or
@@ -1785,8 +1785,8 @@ def ide_setup(args, config, basepath, workspace):
                 logger.error("In shared sysroots mode modified recipes %s cannot be handled." % str(
                     recipes_modified_names))
                 invalid_params = True
-            if args.nfs:
-                logger.error("--nfs is only supported in modified mode.")
+            if args.nfs and not recipes_image_names:
+                logger.error("--nfs requires an image recipe.")
                 invalid_params = True
         if args.nfs_extract_dir and not args.nfs:
             logger.error("--nfs-extract-dir requires --nfs.")
@@ -1922,8 +1922,8 @@ def ide_setup(args, config, basepath, workspace):
     shared_bbappend_changed = False
     if args.mode == DevtoolIdeMode.shared:
         for image in recipes_images:
-            if image.extra_image_install_debugfs:
-                if image.update_image_bbappend([], None):
+            if image.extra_image_install_debugfs or args.nfs:
+                if image.update_image_bbappend([], args.nfs):
                     shared_bbappend_changed = True
 
     if not args.skip_bitbake:
@@ -1955,6 +1955,9 @@ def ide_setup(args, config, basepath, workspace):
                 bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
 
     if args.mode == DevtoolIdeMode.shared:
+        if args.nfs and not args.skip_bitbake:
+            for image in recipes_images:
+                image.extract_nfs_rootfs(nfs_export_base_dir, args.nfs, args.target)
         for ide in ides:
             ide.setup_shared_sysroots(shared_env)
             for image in recipes_images:
@@ -2074,6 +2077,8 @@ def register_commands(subparsers, context):
         '  Usage example:\n'
         '    devtool ide-sdk -m ' + DevtoolIdeMode.shared.name + ' recipe(s)\n'
         '  This command generates a cross-toolchain as well as the corresponding shared sysroot directories.\n'
+        '  An image recipe may also be supplied to build a target image and generate image-based IDE configurations.\n'
+        '  With an image recipe, --nfs exports its rootfs for NFS booting.\n'
         '  To use this tool-chain the environment-* file found in the deploy..image folder needs to be sourced into a shell.\n'
         '  In case of VSCode and cmake the tool-chain is also exposed as a cmake-kit')
     default_ide = list(ide_plugins.keys())[0]
-- 
2.55.0


