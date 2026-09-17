Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA9FC982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:47 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.641.1789670320498030187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=kC+Ciklf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202609171838388c8ec9cf850002073b-wmbivh@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202609171838388c8ec9cf850002073b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DRuH3dLDFEe1I1uA4yUjsBBSeZaif4vhGMIfVNpqFiU=;
 b=kC+Ciklf3cIA4orQh20qOQwW/dY5HtRdLpVajceNTMMa5e18okjqxxxqZtah7BoE2Z+srE
 TjTDH/bffOld2MQDRlNfYlmgSEyb01LijIMjgpvxAq3WsVtQgx3/lDcfCoV4U+q3lK0h/Vhz
 iJQ8xmg8/vMGzAOpg5aegakpEGSW8FGzQ2g/y+M/IzOFRhZjir2qO8EoHfmYCCAPLwwer3zR
 EmEgMV/d7CJ97jhQo7yTrXfqQc6VXqV3Ca0BPd1O2q9f7TGcb5qCfTBbUV6opOd44al2bn6U
 e8huQutlhVKehX9dHzXw3Gy9o/tnHZf0ZC6mRMM2g5uIP1rDJA6sYcOA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/7] devtool: ide-sdk: add real hardware NFS export helper
Date: Thu, 17 Sep 2026 20:37:54 +0200
Message-ID: <20260917183832.998361-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260917183832.998361-1-adrian.freihofer@siemens.com>
References: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246085

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Generate a helper for NFS-enabled IDE SDK images that exports the rootfs
with runqemu-export-rootfs and serves the deploy directory over HTTP. This
allows real hardware targets to boot the generated rootfs and retrieve the
kernel from the deploy directory over HTTP.

For some use cases like u-boot with wget command built-in this helper
is expected to cover the typical scenario. For other use cases the
generated script at least provides a starting point and can be adapted
as needed for other scenarios.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 20b03b2d40..a2b15ce440 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -360,6 +360,33 @@ class RecipeImage:
         os.chmod(helper, os.stat(helper).st_mode | stat.S_IEXEC)
         return helper
 
+    def nfs_hw_helper(self, nfs_export_base_dir, nfs):
+        """Create a helper that exports the selected rootfs and the kernel to a target.
+
+        The rootfs is exported over NFS with runqemu-export-rootfs
+        The deploy directory (fitImage/kernel) is served over plain
+        HTTP, e.g. for a U-Boot 'wget' in recovery/netboot mode.
+        """
+        export_dir = os.path.join(nfs_export_base_dir, self.pn)
+        rootfs_dir = self.nfs_rootfs_dir(nfs_export_base_dir, nfs)
+
+        helper = os.path.join(export_dir, 'export-hw-' + nfs)
+        with open(helper, 'w') as helper_file:
+            helper_file.write('#!/bin/sh\n')
+            helper_file.write('set -e\n')
+            helper_file.write(
+                'runqemu-export-rootfs start %s\n' % shlex.quote(rootfs_dir))
+            helper_file.write(
+                'trap \'runqemu-export-rootfs stop %s\' EXIT INT TERM\n' %
+                shlex.quote(rootfs_dir))
+            helper_file.write('cd %s\n' % shlex.quote(self.deploy_dir_image))
+            helper_file.write(
+                'echo "Serving %s over HTTP on port ${PORT:-8080}"\n' %
+                self.deploy_dir_image)
+            helper_file.write('python3 -m http.server "${PORT:-8080}"\n')
+        os.chmod(helper, os.stat(helper).st_mode | stat.S_IEXEC)
+        return helper
+
     def update_image_bbappend(self, recipes_modified, nfs=None):
         """Write debug settings for modified-mode recipes into the image bbappend.
 
@@ -489,6 +516,14 @@ class RecipeImage:
                 'Pass any additional runqemu options to this helper.',
                 helper, opts)
 
+        hw_helper = self.nfs_hw_helper(nfs_export_base_dir, nfs)
+        logger.info(
+            'With the build environment sourced, export the rootfs (NFS) and '
+            'the kernel (HTTP) for a real hardware target instead of QEMU:\n'
+            '  %s\n'
+            'Set PORT to override the HTTP port (default: 8080).',
+            hw_helper)
+
     def update_qb_slirp_opt(self):
         """Update QB_SLIRP_OPT in the image bbappend
 
-- 
2.55.0


