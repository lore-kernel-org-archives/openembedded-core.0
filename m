Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 159E165E58
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 09:28:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5B9SOgR001840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 02:28:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 11 Jun 2014 02:28:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jun 2014 17:29:27 +0800
Message-ID: <dc5211442c257f289d6fe290b91785f2c7098fae.1402478876.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402478876.git.Qi.Chen@windriver.com>
References: <cover.1402478876.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rootfs.py: change the logic in _uninstall_unneeded
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jun 2014 09:28:27 -0000
Content-Type: text/plain

Previously, if we have 'package-management' and 'read-only-rootfs'
both in IMAGE_FEATRUES, we would meet the following error at system
start-up.

	rm: can't remove '/etc/rcS.d/S99run-postinsts': Read-only file system

However, what's really expected is that when there's no postinstall
script at system start-up, the /etc/rcS.d/S99run-postinsts should not
even be there.

Whether or not to remove the init script symlinks to run-postinsts should
not depend on whether we have 'package-management' in IMAGE_FEATURES; rather,
it should only depend on whether we have any postinstall script left to run
at system start-up.

This patch changes the _uninstall_unneeded function based on the logic
stated above.

[YOCTO #6257]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/rootfs.py |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3d1111a..bc2524f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -129,11 +129,19 @@ class Rootfs(object):
         self._cleanup()
 
     def _uninstall_uneeded(self):
+        # Remove unneeded init script symlinks
+        delayed_postinsts = self._get_delayed_postinsts()
+        if delayed_postinsts is None:
+            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")):
+                self._exec_shell_cmd(["update-rc.d", "-f", "-r",
+                                      self.d.getVar('IMAGE_ROOTFS', True),
+                                      "run-postinsts", "remove"])
+
+        # Remove unneeded package-management related components
         if bb.utils.contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d):
             return
 
-        delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
             installed_pkgs_dir = self.d.expand('${WORKDIR}/installed_pkgs.txt')
             pkgs_to_remove = list()
@@ -153,10 +161,6 @@ class Rootfs(object):
                 # Update installed_pkgs.txt
                 open(installed_pkgs_dir, "w+").write('\n'.join(pkgs_installed))
 
-            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")):
-                self._exec_shell_cmd(["update-rc.d", "-f", "-r",
-                                      self.d.getVar('IMAGE_ROOTFS', True),
-                                      "run-postinsts", "remove"])
         else:
             self._save_postinsts()
 
-- 
1.7.9.5


