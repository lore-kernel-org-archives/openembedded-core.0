Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB1076EFFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:42:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1I9gkKc023350
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Feb 2014 01:42:46 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 01:42:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2014 17:42:26 +0800
Message-ID: <8e7aa03f832068e41f0142b15d18fa8f49b9055a.1392716065.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392716065.git.hongxu.jia@windriver.com>
References: <cover.1392716065.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/5] rootfs.py: support ipk incremental image generation
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
X-List-Received-Date: Tue, 18 Feb 2014 09:42:46 -0000
Content-Type: text/plain

While incremental image generation enabled, if previous image existed,
it restores the opkg database. Based on the previous image, it gets what
need to remove for the current and remove them.

The newly added and upgraded packages will be done since opkg install
invoked.

[YOCTO #1894]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/rootfs.py | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d149ca3..5561bb9 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -438,13 +438,25 @@ class OpkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir):
         super(OpkgRootfs, self).__init__(d)
 
-        bb.utils.remove(self.image_rootfs, True)
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
         self.manifest = OpkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET", True)
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
 
-        self.pm = OpkgPM(d, self.image_rootfs, self.opkg_conf, self.pkg_archs)
+        self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN', True)
+        if self.inc_opkg_image_gen != "1":
+            bb.utils.remove(self.image_rootfs, True)
+            self.pm = OpkgPM(d,
+                             self.image_rootfs,
+                             self.opkg_conf,
+                             self.pkg_archs)
+        else:
+            self.pm = OpkgPM(d,
+                             self.image_rootfs,
+                             self.opkg_conf,
+                             self.pkg_archs)
+            self.pm.recovery_packaging_data()
+
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
 
     """
     This function was reused from the old implementation.
@@ -508,6 +520,32 @@ class OpkgRootfs(Rootfs):
 
         self._multilib_sanity_test(dirs)
 
+    '''
+    While ipk incremental image generation is enabled, it will remove the
+    unneeded pkgs by comparing the new install solution manifest and the
+    old installed manifest.
+    '''
+    def _create_incremental(self, pkgs_initial_install):
+        if self.inc_opkg_image_gen == "1":
+
+            pkgs_to_install = list()
+            for pkg_type in pkgs_initial_install:
+                pkgs_to_install += pkgs_initial_install[pkg_type]
+
+            installed_manifest = self.pm.load_old_install_solution()
+            solution_manifest = self.pm.dump_install_solution(pkgs_to_install)
+
+            pkg_to_remove = list()
+            for pkg in installed_manifest:
+                if pkg not in solution_manifest:
+                    pkg_to_remove.append(pkg)
+
+            self.pm.update()
+
+            if pkg_to_remove != []:
+                bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
+                self.pm.remove(pkg_to_remove)
+
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
         opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS', True)
@@ -518,6 +556,9 @@ class OpkgRootfs(Rootfs):
         if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") != "1":
             self.pm.write_index()
 
+        if self.inc_opkg_image_gen == "1":
+            self._create_incremental(pkgs_to_install)
+
         execute_pre_post_process(self.d, opkg_pre_process_cmds)
 
         self.pm.update()
@@ -540,6 +581,9 @@ class OpkgRootfs(Rootfs):
         execute_pre_post_process(self.d, opkg_post_process_cmds)
         execute_pre_post_process(self.d, rootfs_post_install_cmds)
 
+        if self.inc_opkg_image_gen == "1":
+            self.pm.backup_packaging_data()
+
     def _get_delayed_postinsts(self):
         pkg_list = []
         status_file = os.path.join(self.image_rootfs,
-- 
1.8.1.2


