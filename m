Return-Path: <seungkyun.kim@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1180CC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 13:38:10 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.60538.1715607484908049866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 06:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: seungkyun.kim@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 13 May 2024 22:38:02 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: seungkyun.kim@lge.com
Received: from unknown (HELO SK-linux.seoul) (10.178.97.151)
	by 156.147.1.127 with ESMTP; 13 May 2024 22:38:02 +0900
X-Original-SENDERIP: 10.178.97.151
X-Original-MAILFROM: seungkyun.kim@lge.com
From: seungkyun.kim@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "seungkyun.kim" <seungkyun.kim@lge.com>
Subject: [PATCH] ipk/rootfs: run sanity test of multilib in parallel
Date: Mon, 13 May 2024 13:37:52 +0000
Message-Id: <20240513133752.3818796-1-seungkyun.kim@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 13:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199239

From: "seungkyun.kim" <seungkyun.kim@lge.com>

For multilib type packages, there is an additional temporary
installation before the actual installation. It makes almost doubles
the do_rootfs time if having many multilib type packages.
To avoid this overhead, run sanity test in parallel.
Installing package groups through opkg takes much more time than
copying directory.

Signed-off-by: seungkyun.kim <seungkyun.kim@lge.com>
---
 meta/lib/oe/package_manager/ipk/rootfs.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index ba93eb62ea..db1cc1650e 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -6,6 +6,7 @@
 
 import re
 import filecmp
+import multiprocessing
 import shutil
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
@@ -198,10 +199,16 @@ class PkgRootfs(DpkgOpkgRootfs):
 
     def _multilib_test_install(self, pkgs):
         ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS")
+        rootfs_temp = os.path.join(ml_temp, "rootfs")
         bb.utils.mkdirhier(ml_temp)
 
-        dirs = [self.image_rootfs]
+        bb.utils.remove(rootfs_temp, True)
+        shutil.copytree(self.image_rootfs, rootfs_temp)
+        dirs = [rootfs_temp]
+        return multiprocessing.Process(target=self._multilib_test_pkg_install, \
+                                       args=(pkgs, ml_temp, dirs, False))
 
+    def _multilib_test_pkg_install(self, pkgs, ml_temp, dirs):
         for variant in self.d.getVar("MULTILIB_VARIANTS").split():
             ml_target_rootfs = os.path.join(ml_temp, variant)
 
@@ -218,6 +225,8 @@ class PkgRootfs(DpkgOpkgRootfs):
             dirs.append(ml_target_rootfs)
 
         self._multilib_sanity_test(dirs)
+        rootfs_temp = os.path.join(ml_temp, "rootfs")
+        bb.utils.remove(rootfs_temp)
 
     '''
     While ipk incremental image generation is enabled, it will remove the
@@ -300,15 +309,20 @@ class PkgRootfs(DpkgOpkgRootfs):
 
         for pkg_type in self.install_order:
             if pkg_type in pkgs_to_install:
+                sanity_test = None
                 # For multilib, we perform a sanity test before final install
                 # If sanity test fails, it will automatically do a bb.fatal()
                 # and the installation will stop
                 if pkg_type == Manifest.PKG_TYPE_MULTILIB:
-                    self._multilib_test_install(pkgs_to_install[pkg_type])
+                    sanity_test= self._multilib_test_install(pkgs_to_install[pkg_type])
+                    sanity_test.start()
 
                 self.pm.install(pkgs_to_install[pkg_type],
                                 [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
+                if sanity_test is not None:
+                    sanity_test.join()
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-- 
2.43.0


