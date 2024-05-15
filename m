Return-Path: <seungkyun.kim@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F90C25B79
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 13:59:53 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.16263.1715781582337684198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 06:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: seungkyun.kim@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 15 May 2024 22:59:40 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: seungkyun.kim@lge.com
Received: from unknown (HELO SK-linux.seoul) (10.178.97.151)
	by 156.147.1.121 with ESMTP; 15 May 2024 22:59:40 +0900
X-Original-SENDERIP: 10.178.97.151
X-Original-MAILFROM: seungkyun.kim@lge.com
From: seungkyun.kim@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "seungkyun.kim" <seungkyun.kim@lge.com>
Subject: [PATCH v3] ipk/rootfs: run sanity test of multilib in parallel
Date: Wed, 15 May 2024 13:59:38 +0000
Message-Id: <20240515135938.1547467-1-seungkyun.kim@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 13:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199290

From: "seungkyun.kim" <seungkyun.kim@lge.com>

For multilib type packages, there is an additional temporary
installation before the actual installation. It makes almost doubles
the do_rootfs time if having many multilib type packages.
To avoid this overhead, run sanity test in parallel.
Installing package groups through opkg takes much more time than
copying directory.

- Changes in V2:
    Fix FileNotFoundError exception when copying rootfs
- Changes in V3:
    Removed unnecessary test call

Signed-off-by: seungkyun.kim <seungkyun.kim@lge.com>
---
 meta/lib/oe/package_manager/ipk/rootfs.py | 36 +++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index ba93eb62ea..fa34dc56a2 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -6,7 +6,9 @@
 
 import re
 import filecmp
+import multiprocessing
 import shutil
+import stat
 from oe.rootfs import Rootfs
 from oe.manifest import Manifest
 from oe.utils import execute_pre_post_process
@@ -197,11 +199,34 @@ class PkgRootfs(DpkgOpkgRootfs):
                         files[key] = item
 
     def _multilib_test_install(self, pkgs):
+        def _copy_rootfs(src, dst):
+            if os.path.islink(src):
+                linkto = os.readlink(src)
+                if os.path.isabs(linkto):
+                    linkto = os.path.normpath(os.path.join(os.path.dirname(dst),
+                                                           os.path.relpath(linkto, src)))
+                os.symlink(linkto, dst)
+            elif os.path.isfile(src):
+                shutil.copy2(src, dst)
+            elif stat.S_ISFIFO(os.stat(src).st_mode):
+                os.mkfifo(dst)
+            else:
+                bb.warn("Skip unsupported file type: %s" % src)
+
         ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS")
+        rootfs_temp = os.path.join(ml_temp, "rootfs")
         bb.utils.mkdirhier(ml_temp)
+        bb.utils.remove(rootfs_temp, True)
 
-        dirs = [self.image_rootfs]
+        if os.path.exists(self.image_rootfs):
+            shutil.copytree(self.image_rootfs, rootfs_temp, copy_function=_copy_rootfs)
+        else:
+            bb.utils.mkdirhier(rootfs_temp)
+        dirs = [rootfs_temp]
+        return multiprocessing.Process(target=self._multilib_test_pkg_install,
+                                       args=(pkgs, ml_temp, dirs, False))
 
+    def _multilib_test_pkg_install(self, pkgs, ml_temp, dirs):
         for variant in self.d.getVar("MULTILIB_VARIANTS").split():
             ml_target_rootfs = os.path.join(ml_temp, variant)
 
@@ -218,6 +243,8 @@ class PkgRootfs(DpkgOpkgRootfs):
             dirs.append(ml_target_rootfs)
 
         self._multilib_sanity_test(dirs)
+        rootfs_temp = os.path.join(ml_temp, "rootfs")
+        bb.utils.remove(rootfs_temp)
 
     '''
     While ipk incremental image generation is enabled, it will remove the
@@ -300,15 +327,20 @@ class PkgRootfs(DpkgOpkgRootfs):
 
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
2.34.1


