Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.8472.1593776657958131639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WSyVPozj;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=10180; q=dns/txt; s=axis-central1;
  t=1593776658; x=1625312658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QRt59VsMsTdnnS+215wyiTPCyJTATRGgjAsbE58eOCo=;
  b=WSyVPozjVIZ/h95HDSruAF2KC+uSaeWRJ5KOri3WgL4RhPVhcBQX7SkV
   PkYu1ogfMSV8xJQKYb/cjQtJ2XDMg+S5abKdIJTvUHF0odJWXmX1Rtpxq
   La4PoUqu2Rd15WZJ0MJAhihgYjq26g4BrQK7ticwr62kLdBnH/VSlk16i
   heZyzKxCHmr3Ac/Tn702EujvW/Hg458vQ7GEiX8sYIRAQz0ftCgTJl5Io
   +JJmOH1TjiP4X7vxASLtAtYonfn+vxbHLdVeNYxF2sxLOnfcsM4d29bZ3
   r/4torlwhWNWHs5cUWYjYCLJgqe6rISmZaRPlB/wNo8tXROqlAoV/UzgA
   w==;
IronPort-SDR: PZpfjqtYqEQ5gGUDGqFzi3Aqeb5rHLis0XsEt/3P9P/eeMFo/qrFTf8PclmJoN62sfylHZtkvB
 RY/Wm8craeSJtR9d46yOVlUdT2lZcGGHv0ezVlP2cW+y6DCyoPu44XFh6MiodnQn2/o2wKkrRz
 iY6UauHVmlvZb+tZ31tjQwWGZg+ByCRuXDIDqoDBkgt3ldXIC2J/wU5k+/VC/r614n9ofhZnZA
 1L/0ntgKqJe8WNZfTQgY7UR7zZMV6kdSLTmXz/MsSJsIHd6YZHpvMSrXWr7RNRgp+yfbMNIQEn
 k8c=
X-IronPort-AV: E=Sophos;i="5.75,308,1589234400"; 
   d="scan'208";a="10163730"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v4 04/12] Move rpm rootfs to its own dir
Date: Fri, 3 Jul 2020 13:43:54 +0200
Message-ID: <20200703114402.8850-5-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200703114402.8850-1-fredrigu@axis.com>
References: <20200703114402.8850-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is a part of a refactor that will split the package manager
code so that it's possible to use other package managers in other
layers.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/rpm/rootfs.py | 150 +++++++++++++++++++++
 meta/lib/oe/rootfs.py                      | 143 +-------------------
 2 files changed, 152 insertions(+), 141 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/rpm/rootfs.py

diff --git a/meta/lib/oe/package_managers/rpm/rootfs.py b/meta/lib/oe/package_managers/rpm/rootfs.py
new file mode 100644
index 0000000000..49b9075fbc
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/rootfs.py
@@ -0,0 +1,150 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.rootfs import Rootfs
+from oe.package_manager import RpmPM
+from oe.manifest import Manifest
+from oe.utils import execute_pre_post_process
+
+class RpmRootfs(Rootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
+                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
+                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+
+        from oe.package_managers.rpm.manifest import RpmManifest
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
+
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 675deac905..33982aaccb 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -353,147 +353,6 @@ class Rootfs(object, metaclass=ABCMeta):
                                   self.image_rootfs, "-D", devtable])
 
 
-class RpmRootfs(Rootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
-                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
-                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
-
-        from oe.package_managers.rpm.manifest import RpmManifest
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
@@ -962,6 +821,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
         self.pm.remove_lists()
 
 def get_class_for_type(imgtype):
+    from oe.package_managers.rpm.rootfs import RpmRootfs
     return {"rpm": RpmRootfs,
             "ipk": OpkgRootfs,
             "deb": DpkgRootfs}[imgtype]
@@ -975,6 +835,7 @@ def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None)
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE')
+    from oe.package_managers.rpm.rootfs import RpmRootfs
     if img_type == "rpm":
         RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
     elif img_type == "ipk":
-- 
2.20.1

