Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4226CC79FA1
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 21:03:23 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21707.1788728596369955799
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 14:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=eFCx9aet;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202609062103138d99fd24580002077d-imvcjf@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202609062103138d99fd24580002077d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 06 Sep 2026 23:03:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NuTHXMVx56kgah/008ySd9suXzyg1Tg8cD9ZNzEJ8lA=;
 b=eFCx9aet65IwpY6h700EqTGpPUgdhtbWgHWNe4YeZENlQtLp+e9MTXF+hufDSso2t2v68p
 9IZgeQaP14xHFZr+pADCDLkWdBLc/BD3LgGZJabVB0RKkLD8vU+IMvZ/S6aRFTp1dS68bn7b
 gxxOA1oVxl1m4b7hyiscukybxAtuxVTReaSmv6E0AY0qpmbf+uzDvrSFpQwiPXFKWN+AtWux
 mSpCvNzAn1K/DgqXETd2JPiE/fp0emO/hTihh9NxEr81rbGQv0hYYzUaFwy72o9azCffOCXI
 l8xuAXIvfineVFzo55nmjtm/HvnF31YglKtWdxXa2TZGgTMwdrvWAbHQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/9] devtool: ide-sdk: run do_install through BitBake
Date: Sun,  6 Sep 2026 23:02:03 +0200
Message-ID: <20260906210307.2793974-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
References: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 21:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245216

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Generate a Python install-task runner for the IDE SDK environment. It
prepares Tinfoil normally, then invokes run_prepared_task() to rerun
do_install through BitBake's worker path before deploying the result.

The IDE owns configure, compile, and unit-test steps in the modified source
tree. At deployment time, resolving task dependencies could rerun those
steps, discard the IDE's build results, and add unnecessary delay. The
prepared-task runner therefore executes only do_install after BitBake has
prepared its prerequisites.

This supports shell and Python task bodies and lets BitBake establish the
fakeroot environment when the task requires pseudo.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 42 +++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 6558137134..0b76aa448b 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1421,26 +1421,32 @@ class RecipeModified:
                           self.fakerootcmd, self.fakerootenv))
         return self.write_script(cmd_lines, 'deploy_target')
 
+    def gen_install_task_script(self):
+        """Generate a script which runs do_install through BitBake."""
+        cmd_lines = ['#!%s' % sys.executable]
+        if self.cmd_compile:
+            cmd_lines += ['import subprocess',
+                          'subprocess.run(%s, cwd=%r, shell=True, check=True)' %
+                          (repr(self.cmd_compile), self.real_srctree)]
+        cmd_lines += ['import os',
+                      'import sys',
+                      'sys.path.insert(0, %r)' % os.path.realpath(
+                          os.path.join(self.bitbakepath, '..', 'lib')),
+                      'import bb.tinfoil',
+                      'os.chdir(%r)' % self.topdir,
+                      'tinfoil = bb.tinfoil.Tinfoil()',
+                      'try:',
+                      '    tinfoil.prepare(config_only=False, quiet=2)',
+                      '    tinfoil.run_prepared_task(%r, "do_install")' % self.pn,
+                      'finally:',
+                      '    tinfoil.shutdown()']
+        return self.write_script(cmd_lines, 'bb_run_do_install')
+
     def gen_install_deploy_script(self, args):
         """Generate a script which does install and deploy"""
-        cmd_lines = ['#!/bin/sh']
-
-        # Save the original command-line args before 'set' overwrites $@
-        cmd_lines.append('_args="$@"')
-        # . oe-init-build-env $BUILDDIR $BITBAKEDIR
-        # Using 'set' to pass the build directory to oe-init-build-env in sh syntax
-        cmd_lines.append('cd "%s" || { echo "cd %s failed"; exit 1; }' % (
-            self.oe_init_dir, self.oe_init_dir))
-        cmd_lines.append('set %s %s' % (self.topdir, self.bitbakepath.rstrip('/bin')))
-        cmd_lines.append('. "%s" || { echo ". %s %s failed"; exit 1; }' % (
-            self.oe_init_build_env, self.oe_init_build_env, self.topdir))
-
-        # bitbake -c install
-        cmd_lines.append(
-            'bitbake %s -c install --force || { echo "bitbake %s -c install --force failed"; exit 1; }' % (self.bpn, self.bpn))
-
-        # Self contained devtool deploy-target - use saved args, not $@ (overwritten by 'set')
-        cmd_lines.append(self.gen_deploy_target_script(args) + ' $_args')
+        cmd_lines = ['#!/bin/sh -e']
+        cmd_lines.append(self.gen_install_task_script())
+        cmd_lines.append(self.gen_deploy_target_script(args) + ' "$@"')
 
         return self.write_script(cmd_lines, 'install_and_deploy')
 
-- 
2.55.0


