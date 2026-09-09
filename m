Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25284C88E41
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92.1788990824532674637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=fcRlPjOQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202609092153426a312e77f00002071a-mkblch@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202609092153426a312e77f00002071a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EfAjU2tYwjcdPsWXyL5nwVjUBHOb/ADccvqPCTZZXTk=;
 b=fcRlPjOQ9R9u2YHxZ2epOMuypv9aDiFK0ZS71yvhEsUb5WXXaIHSdv2xlyifePO1/B1+ta
 sE/0t/4mRCEqVR6E+g4h1pnNTru/ou0zCQsaStqG9yHO5Wkslo0m9dv0mgzsSKVNRIbbO29Y
 txUPpX4q58GmZGngz818ugi3VAxzgPO9AZEOf4HQXX+wGWqCZyp49Xw8NX43GkVmqutSRfz6
 3nrx8cednFRVu7YryODisSJn4c/rZxIe4u7j/pJpUd1eaaHVkhMzfMK6ZNxdxZacS/OPwuf4
 8WdkLtPjrU+YYD3h0DexH2uAt3YfTRMwe3KX6ucalomPc70hZ5jOtJwg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 07/15] devtool: ide-sdk: reuse pseudo_rootfs_utils for SDK rootfs extraction
Date: Wed,  9 Sep 2026 23:53:07 +0200
Message-ID: <20260909215337.89106-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245512

From: Adrian Freihofer <adrian.freihofer@siemens.com>

RecipeImage duplicated the tar/pseudo extraction logic now available in
scripts/lib/pseudo_rootfs_utils.py (shared with runqemu-extract-sdk).
Drop the local copy in favor of the shared extract_sdk_rootfs()/
pseudo_state_dir().

extract_sdk_rootfs() now takes the pseudo invocation and environment as
parameters instead of resolving them itself via qemu-helper-native:
devtool ide-sdk keeps using the image recipe's own FAKEROOTCMD/FAKEROOTENV,
which is already guaranteed to be built as part of the image, rather than
gaining a new, otherwise unused build dependency on qemu-helper-native.
runqemu-extract-sdk resolves pseudo via pseudo_native_environment() itself
and passes it in, as it has no recipe of its own to take FAKEROOTCMD from.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 78 +++++++---------------------------
 1 file changed, 16 insertions(+), 62 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 2e37f20894..ba9d4adff1 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -27,6 +27,7 @@ from devtool.standard import get_real_srctree
 from devtool.deploy import parse_packages_arg
 from devtool.ide_plugins import BuildTool, DebuggerCrossConfig
 from oe.kernel_module import kernel_module_os_env
+from pseudo_rootfs_utils import PseudoRootfsError, extract_sdk_rootfs, pseudo_state_dir
 
 
 logger = logging.getLogger('devtool')
@@ -441,66 +442,6 @@ class RecipeImage:
         slirp_changed = self.update_qb_slirp_opt()
         return image_changed or slirp_changed
 
-    @staticmethod
-    def _tar_options(rootfs_tarball):
-        tar_extract_options = {
-            '.tar.xz': '-xJf',
-            '.tar.bz2': '-xjf',
-            '.tar.gz': '-xzf',
-            '.tar.zst': '--zstd -xf',
-            '.tar': '-xf',
-        }
-        for extension, option in tar_extract_options.items():
-            if rootfs_tarball.endswith(extension):
-                return ['--numeric-owner', *option.split()]
-        raise DevtoolError(
-            'Unable to determine sdk tarball format\n'
-            'Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz / .tar.zst')
-
-    @staticmethod
-    def pseudo_state_dir(rootfs_dir):
-        """Return the pseudo database location associated with an extracted rootfs."""
-        return os.path.realpath(rootfs_dir) + '.pseudo_state'
-
-    def extract_sdk_rootfs(self, rootfs_tarball, rootfs_dir):
-        """Extract a rootfs tarball under pseudo and return its absolute directory."""
-        if not os.path.exists(rootfs_tarball):
-            raise DevtoolError("sdk tarball '%s' does not exist" % rootfs_tarball)
-        if not os.path.exists(self.fakerootcmd):
-            raise DevtoolError('%s does not exist' % self.fakerootcmd)
-
-        rootfs_tarball = os.path.realpath(rootfs_tarball)
-        rootfs_dir = os.path.realpath(rootfs_dir)
-        tar_options = self._tar_options(rootfs_tarball)
-        state_dir = self.pseudo_state_dir(rootfs_dir)
-
-        os.makedirs(rootfs_dir, exist_ok=True)
-        os.makedirs(state_dir, exist_ok=True)
-        Path(state_dir, 'pseudo.pid').touch()
-
-        environment = dict(os.environ)
-        for varvalue in (self.fakerootenv or '').split():
-            if '=' in varvalue:
-                key, value = varvalue.split('=', 1)
-                environment[key] = value
-        command = [self.fakerootcmd, 'tar', '-C', rootfs_dir]
-
-        environment['PSEUDO_LOCALSTATEDIR'] = state_dir
-        environment['PSEUDO_INCLUDE_PATHS'] = rootfs_dir
-        command.extend(tar_options)
-        command.append(rootfs_tarball)
-        logger.info('Extracting rootfs tarball using pseudo: %s', ' '.join(command))
-        try:
-            subprocess.run(command, env=environment, check=True)
-        except subprocess.CalledProcessError as exc:
-            raise DevtoolError('Failed to extract %s' % rootfs_tarball) from exc
-
-        if len(os.listdir(rootfs_dir)) < 4:
-            logger.warning(
-                "Only few files in %s, please double-check the extraction "
-                "worked as intended", rootfs_dir)
-        return rootfs_dir
-
     def extract_nfs_rootfs(self, nfs_export_base_dir, nfs, target):
         """Refresh the selected rootfs below nfs_export_base_dir."""
         if not self.image_link_name:
@@ -511,7 +452,7 @@ class RecipeImage:
         rootfs_tarball = os.path.join(
             self.deploy_dir_image, self.image_link_name + suffix + '.tar')
         rootfs_dir = self.nfs_rootfs_dir(nfs_export_base_dir, nfs)
-        state_dir = self.pseudo_state_dir(rootfs_dir)
+        state_dir = pseudo_state_dir(rootfs_dir)
 
         if os.path.exists(rootfs_dir):
             logger.warning(
@@ -521,7 +462,20 @@ class RecipeImage:
             if os.path.exists(stale_dir):
                 shutil.rmtree(stale_dir)
 
-        self.extract_sdk_rootfs(rootfs_tarball, rootfs_dir)
+        if not os.path.exists(self.fakerootcmd):
+            raise DevtoolError('%s does not exist' % self.fakerootcmd)
+        # Reuse the image's own pseudo instead of qemu-helper-native's, so
+        # extraction does not depend on a recipe devtool ide-sdk never builds.
+        pseudo_cmd = [self.fakerootcmd]
+        environment = dict(os.environ)
+        for varvalue in (self.fakerootenv or '').split():
+            if '=' in varvalue:
+                key, value = varvalue.split('=', 1)
+                environment[key] = value
+        try:
+            extract_sdk_rootfs(rootfs_tarball, rootfs_dir, pseudo_cmd, environment)
+        except PseudoRootfsError as exc:
+            raise DevtoolError('Unable to prepare NFS rootfs: %s' % exc) from exc
 
         logger.info('NFS rootfs extracted to %s', rootfs_dir)
         helper = self.nfs_runqemu_helper(nfs_export_base_dir, nfs)
-- 
2.55.0


