Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090D3CA5FA3
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 17:45:20 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41619.1790531113091884337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 10:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=g5RezzTk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260927174510732536f0c7000207cb-xc8koy@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260927174510732536f0c7000207cb
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 19:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/t1mdB3CLDkV7zroMXl0zkiYgDS6AAslpIReOpUTDxM=;
 b=g5RezzTkKIcG21h0HWbsQH+UYDZEG0yVlxUjbe1tyTz7oVr+tzxOxXibkRvUdefzQDuOvo
 S2PSlFk4VVfgzD6YPn5TtH/ebrFa8G8zRVgICu+CRdUR0i81hHZR/VId+l7QFSjP6aOzmDuF
 DVQDbKEuaQPobWWUT7Oi87vn2T6Uev3ahLdBu2wU32UbDiMXkfhgh3mJu4oaZlz3e/uNiNH5
 jTwA3qKVV6pexjfalF9c1aY1KqRCN/ab9hZ8hMKjuiuFf3Ye4/sFrnGdNHU7GzZWmixXV0/Z
 YM0RfTXsF4QECbzMHqSYDEimXIPuzY4bKL/C/wwJ/3nOcAtyDcsOWZ/g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/5] oe-selftest: devtool ide-sdk: cover modified + shared + NFS
Date: Sun, 27 Sep 2026 19:44:53 +0200
Message-ID: <20260927174506.652690-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260927174506.652690-1-adrian.freihofer@siemens.com>
References: <20260927174506.652690-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 17:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246703

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Run the existing VS Code NFS debug-rootfs test with both modified and
shared modes enabled. Keep its image, recipe and debugger checks while
also asserting that the shared environment script and standalone sysroot
were generated.
Reuse the existing test instead of adding a separate combined-mode test.
---
 meta/lib/oeqa/selftest/cases/devtool.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a6002ec2b6..265f2147a4 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3612,7 +3612,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         """Verify a recipe's binary was extracted into the NFS debug rootfs."""
         self.assertExists(os.path.join(nfs_rootfs, 'usr', 'bin', example_exe))
 
-    def _test_code_nfs_debug_rootfs(self):
+    def _test_code_nfs_debug_rootfs(self, shared=False):
         """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
         recipe_name = self._cmake_recipe_name
         build_file = "CMakeLists.txt"
@@ -3622,12 +3622,20 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self._write_bb_config()
         tempdir = self._devtool_ide_sdk_recipe(
             recipe_name, build_file, testimage)
-        runCmd('devtool ide-sdk %s %s -c --ide=code --nfs=rootfs-dbg' %
-               (recipe_name, testimage), output_log=self._cmd_logger)
+        mode_opts = '-m modified -m shared ' if shared else ''
+        runCmd('devtool ide-sdk %s%s %s -c --ide=code --nfs=rootfs-dbg' %
+               (mode_opts, recipe_name, testimage), output_log=self._cmd_logger)
 
         nfs_rootfs, _ = self._verify_nfs_debug_rootfs(testimage, 'rootfs-dbg')
         self._verify_nfs_binary_deployed(nfs_rootfs, recipe_name)
         self._verify_nfs_launch_json(tempdir, nfs_rootfs)
+        if shared:
+            bb_vars = get_bb_vars(
+                ['REAL_MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE'], 'meta-ide-support')
+            self.assertExists(os.path.join(
+                bb_vars['DEPLOY_DIR_IMAGE'],
+                'environment-setup-%s' % bb_vars['REAL_MULTIMACH_TARGET_SYS']))
+            self.assertExists(get_bb_var('STANDALONE_SYSROOT', 'build-sysroots'))
 
     def _test_code_and_none_qemu(self, nfs=False, slirp=False):
         """Verify devtool ide-sdk --ide=code --ide=none for cmake, meson and the target toolchain.
@@ -4300,7 +4308,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
     def test_code_nfs_debug_rootfs(self):
         """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
-        self._test_code_nfs_debug_rootfs()
+        self._test_code_nfs_debug_rootfs(shared=True)
 
     @OETestTag("runqemu")
     def test_code_and_none_qemu(self):
-- 
2.55.0


