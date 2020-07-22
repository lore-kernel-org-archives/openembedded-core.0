Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.18840.1595424690324706328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=er6F2ryh;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=10128; q=dns/txt; s=axis-central1;
  t=1595424690; x=1626960690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cZpI3ExJlbKOrdNNkO4DArbevpiM5pbf5w/jbWZgjLc=;
  b=er6F2ryhsR1c1lkGEhwEMywOjXmXkAQj2pfgQ9oyi7zS5b0d0El5Vp9m
   LeNuomiIhCEwUyuOilylMSJMLMOCVCTXFH+8ZAIgS8sHpuHNPrvJosqcu
   j4ZY0N4TZlegdlRKdOIews+zZCV5W8Gj6CT5gaBgXpm2rFCUmCQeosRm/
   N7WTYBr/h0GNAUEaiaazNnjmp3p7/hsa23k2mYE5vDtD/Io8UkN1xeViV
   Nug4KfdApcFRI3Or3UAn5SXfDt7ipJ2sdRx1VByu9v6IMiRCXQFFqEQOX
   AIk0iPo6V0Be7z1s/I55LWEOZn3YETR4vxs0WcL571Upr9rG17hlxge5K
   Q==;
IronPort-SDR: /Aa2fkDtNPxsJPjgD8kGiE+G+f7OREqkorg7JwTCJHAT/dLb5clFMCbl58wW+K57Cqzj4QyXXC
 iusfX4N0kIc+DV3uquxS+8yIRYErkmu8TRcHdfARcyrIzofx5GhML3glQW9wZGIf+b7VGtBldk
 Tn7VBHWS+l/48cf3HNaCfq82LknqD7LZSGrrjxOLdik8gyLfpAClkM5XuUJYFIGewVXy8CnRY7
 +mGfJu/Sl0IKD6DA/2eBRyy2l8T6+dVzPbjFIujjLOgwj+Ct6QZqY6WiyCG8203zAWqhkLP75q
 yT8=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="10790844"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 05/13] rpm: Move rootfs to its own dir
Date: Wed, 22 Jul 2020 15:31:12 +0200
Message-ID: <20200722133120.11484-6-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722133120.11484-1-fredrigu@axis.com>
References: <20200722133120.11484-1-fredrigu@axis.com>
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

