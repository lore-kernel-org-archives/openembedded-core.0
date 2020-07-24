Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.7567.1595601765962787650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PiVQCoHV;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=10128; q=dns/txt; s=axis-central1;
  t=1595601770; x=1627137770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cZpI3ExJlbKOrdNNkO4DArbevpiM5pbf5w/jbWZgjLc=;
  b=PiVQCoHVlnvijjAOoAM6MDreDFZlh+yzjuxV9NpQU+HKmQcAgPZv7UXV
   YCcCGd8yZwbrY4RaWMEc3xgEvYTSqrtdQvFIjwBjjxEhZb6iiZYuX+dZ5
   5W9dVHDZb1jwh2Nu5YUkAUk6WNL9VEBD57ItjSBOgP1Jsi5iJgDiKyei6
   Hy69x2CrruavGuzwPmVdZDY7V7Ix3cc2Nnpw94LdF8afQ/u/Xuueb5eZg
   Vi5l3xNq5Dl+AjXOR+DJguZa07F9CLMDmOkdzGSOJ8Do5uxg1DScKOd5r
   uoBNK8rAY6bNF9Qkn3shBpz6phB8aet16N8xubO/gSZbft1NRBBs5qZy6
   g==;
IronPort-SDR: 7bHYeVAO55AX2FV1+z141VGNv2CqmEzMBKu+pacPdoBv9ih9YOsH7nMZbihR9V0IDHbxoVbQex
 qMt/7PnwSj9Yn8RDHFsMDg6El88MOwN6skO/xTiq04+vDVk5DXRW86Aln//cJ9fgijgyqYbPW/
 2KijYG/1+fEIHdCG9TSBCBELAjIPbuRErCibFsSCGa0nLOack1slYxJOzzA/5iIGXbBMrPLSB0
 m3SKGevhWsHXn8MCvEpiM8t/Gna0lz5P0Xjto6x14HAerWlrorJzJYh+Y0Ft6h+Qx0zuW2QDTb
 Auw=
X-IronPort-AV: E=Sophos;i="5.75,391,1589234400"; 
   d="scan'208";a="11187080"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v6 05/13] rpm: Move rootfs to its own dir
Date: Fri, 24 Jul 2020 16:42:33 +0200
Message-ID: <20200724144241.9977-6-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724144241.9977-1-fredrigu@axis.com>
References: <20200724144241.9977-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is a part of a refactor that will split the package manager
code so that it's possible to use other package managers in other
layers.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager/rpm/rootfs.py | 148 ++++++++++++++++++++++
 meta/lib/oe/rootfs.py                     | 142 +--------------------
 2 files changed, 150 insertions(+), 140 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/rpm/rootfs.py

diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
new file mode 100644
index 0000000000..3d9eb95528
--- /dev/null
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -0,0 +1,148 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.rootfs import Rootfs
+from oe.package_manager import RpmPM
+from oe.manifest import Manifest
+from oe.utils import execute_pre_post_process
+from oe.package_manager.rpm.manifest import RpmManifest
+
+class RpmRootfs(Rootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
+                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
+                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+
+        self.manifest = RpmManifest(d, manifest_dir)
+
+        self.pm = RpmPM(d,
+                        d.getVar('IMAGE_ROOTFS'),
+                        self.d.getVar('TARGET_VENDOR')
+                        )
+
+        self.inc_rpm_image_gen = self.d.getVar('INC_RPM_IMAGE_GEN')
+        if self.inc_rpm_image_gen != "1":
+            bb.utils.remove(self.image_rootfs, True)
+        else:
+            self.pm.recovery_packaging_data()
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+
+        self.pm.create_configs()
+
+    '''
+    While rpm incremental image generation is enabled, it will remove the
+    unneeded pkgs by comparing the new install solution manifest and the
+    old installed manifest.
+    '''
+    def _create_incremental(self, pkgs_initial_install):
+        if self.inc_rpm_image_gen == "1":
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
+            bb.note('incremental update -- upgrade packages in place ')
+            self.pm.upgrade()
+            if pkg_to_remove != []:
+                bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
+                self.pm.remove(pkg_to_remove)
+
+            self.pm.autoremove()
+
+    def _create(self):
+        pkgs_to_install = self.manifest.parse_initial_manifest()
+        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
+        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
+
+        # update PM index files
+        self.pm.write_index()
+
+        execute_pre_post_process(self.d, rpm_pre_process_cmds)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        if self.inc_rpm_image_gen == "1":
+            self._create_incremental(pkgs_to_install)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.update()
+
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                pkgs_attempt += pkgs_to_install[pkg_type]
+            else:
+                pkgs += pkgs_to_install[pkg_type]
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.install(pkgs)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.install(pkgs_attempt, True)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self.pm.install_complementary()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
+
+        execute_pre_post_process(self.d, rpm_post_process_cmds)
+
+        if self.inc_rpm_image_gen == "1":
+            self.pm.backup_packaging_data()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+
+    @staticmethod
+    def _depends_list():
+        return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
+                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_ELF_ARCH']
+
+    def _get_delayed_postinsts(self):
+        postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
+        if os.path.isdir(postinst_dir):
+            files = os.listdir(postinst_dir)
+            for f in files:
+                bb.note('Delayed package scriptlet: %s' % f)
+            return files
+
+        return None
+
+    def _save_postinsts(self):
+        # this is just a stub. For RPM, the failed postinstalls are
+        # already saved in /etc/rpm-postinsts
+        pass
+
+    def _log_check(self):
+        self._log_check_warn()
+        self._log_check_error()
+
+    def _cleanup(self):
+        if bb.utils.contains("IMAGE_FEATURES", "package-management", True, False, self.d):
+            self.pm._invoke_dnf(["clean", "all"])
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 876e13079c..4895f1ebb9 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -355,146 +355,6 @@ class Rootfs(object, metaclass=ABCMeta):
                                   self.image_rootfs, "-D", devtable])
 
 
-class RpmRootfs(Rootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
-                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
-                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
-
-        self.manifest = RpmManifest(d, manifest_dir)
-
-        self.pm = RpmPM(d,
-                        d.getVar('IMAGE_ROOTFS'),
-                        self.d.getVar('TARGET_VENDOR')
-                        )
-
-        self.inc_rpm_image_gen = self.d.getVar('INC_RPM_IMAGE_GEN')
-        if self.inc_rpm_image_gen != "1":
-            bb.utils.remove(self.image_rootfs, True)
-        else:
-            self.pm.recovery_packaging_data()
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-
-        self.pm.create_configs()
-
-    '''
-    While rpm incremental image generation is enabled, it will remove the
-    unneeded pkgs by comparing the new install solution manifest and the
-    old installed manifest.
-    '''
-    def _create_incremental(self, pkgs_initial_install):
-        if self.inc_rpm_image_gen == "1":
-
-            pkgs_to_install = list()
-            for pkg_type in pkgs_initial_install:
-                pkgs_to_install += pkgs_initial_install[pkg_type]
-
-            installed_manifest = self.pm.load_old_install_solution()
-            solution_manifest = self.pm.dump_install_solution(pkgs_to_install)
-
-            pkg_to_remove = list()
-            for pkg in installed_manifest:
-                if pkg not in solution_manifest:
-                    pkg_to_remove.append(pkg)
-
-            self.pm.update()
-
-            bb.note('incremental update -- upgrade packages in place ')
-            self.pm.upgrade()
-            if pkg_to_remove != []:
-                bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
-                self.pm.remove(pkg_to_remove)
-
-            self.pm.autoremove()
-
-    def _create(self):
-        pkgs_to_install = self.manifest.parse_initial_manifest()
-        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
-        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
-
-        # update PM index files
-        self.pm.write_index()
-
-        execute_pre_post_process(self.d, rpm_pre_process_cmds)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        if self.inc_rpm_image_gen == "1":
-            self._create_incremental(pkgs_to_install)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.update()
-
-        pkgs = []
-        pkgs_attempt = []
-        for pkg_type in pkgs_to_install:
-            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
-                pkgs_attempt += pkgs_to_install[pkg_type]
-            else:
-                pkgs += pkgs_to_install[pkg_type]
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.install(pkgs)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.install(pkgs_attempt, True)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self.pm.install_complementary()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
-
-        execute_pre_post_process(self.d, rpm_post_process_cmds)
-
-        if self.inc_rpm_image_gen == "1":
-            self.pm.backup_packaging_data()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-
-    @staticmethod
-    def _depends_list():
-        return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
-                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_ELF_ARCH']
-
-    def _get_delayed_postinsts(self):
-        postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
-        if os.path.isdir(postinst_dir):
-            files = os.listdir(postinst_dir)
-            for f in files:
-                bb.note('Delayed package scriptlet: %s' % f)
-            return files
-
-        return None
-
-    def _save_postinsts(self):
-        # this is just a stub. For RPM, the failed postinstalls are
-        # already saved in /etc/rpm-postinsts
-        pass
-
-    def _log_check(self):
-        self._log_check_warn()
-        self._log_check_error()
-
-    def _cleanup(self):
-        if bb.utils.contains("IMAGE_FEATURES", "package-management", True, False, self.d):
-            self.pm._invoke_dnf(["clean", "all"])
-
-
 class DpkgOpkgRootfs(Rootfs):
     def __init__(self, d, progress_reporter=None, logcatcher=None):
         super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
@@ -961,6 +821,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
         self.pm.remove_lists()
 
 def get_class_for_type(imgtype):
+    from oe.package_manager.rpm.rootfs import RpmRootfs
     return {"rpm": RpmRootfs,
             "ipk": OpkgRootfs,
             "deb": DpkgRootfs}[imgtype]
@@ -973,6 +834,7 @@ def variable_depends(d, manifest_dir=None):
 def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None):
     env_bkp = os.environ.copy()
 
+    from oe.package_manager.rpm.rootfs import RpmRootfs
     img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
-- 
2.20.1

