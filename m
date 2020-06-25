Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.7376.1593080528376404276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=o289S3Ej;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=10029; q=dns/txt; s=axis-central1;
  t=1593080530; x=1624616530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JH9g3NENRUByuF07Eynz5R/AfV4v43+JyxMzsLLed+4=;
  b=o289S3Ej94kIvZkvmyvyuIR/volcMyuz9ANY6KJuanczh7aIBeM36ZoY
   N9evNvYu57GKN5KDtkgpYQSP6Vim0Lbb1VYIFnuUKM6YxmBI7mwbPlCf/
   kGZFmjDSl3Tkw3xBAuS6alwnwahZavSjiRfqATDnD/Zav99GZqFMJTYkV
   PX7KmenwaL1NDHYHMqU8YmpiVHeuho0Ipm+1AWlLEvL7lh+tuZIXpNeua
   nALslxPUw1haKay/gZRFRz4mNV7ZhfQeh+Gn/R7BGQIIMZUjCcm0xmnpx
   B+jiPgWi2rv1X8I/okenrvEkWTWHsVn2rnx9G0Nc2qrv0N/EdwrK7tdSb
   Q==;
IronPort-SDR: RGVhJrbC8tmHGf6e1cORxfi8DDMSte78GWUf9CtCDv6Z4pge8YJHM2yP0yr8pK0HSQM1IXrNEX
 +FSgtExCHIZEyMIjzTaIJz6s6bUYxLFh1z0yL3hON5AVFb931tSw+JYHsWfI9SvBtpoOW93ELq
 Us0QPhNIQeKG61Cs1H8Zdnhs7fAVi6KxqbSBCF+KQqCj2n84x1mwlNEwYi0x4jlj+WDni518mb
 r9/tFdH90F68nDKrt3GTt6guH1o4IFdaNF0emrAl6I3tsSTdF0NQR5md1MXgz6cdQyVjtN6Wss
 M6A=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893886"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, "Fredrik
 Gustafsson" <fredrigu@axis.com>
Subject: [PATCH v2 11/26] rootfs.py: Move RpmRootfs
Date: Thu, 25 Jun 2020 12:21:30 +0200
Message-ID: <20200625102145.7139-12-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the rootfs only used by the rpm package manager live in the rpm
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/rpm/rootfs.py | 147 +++++++++++++++++++++
 meta/lib/oe/rootfs.py                      | 142 +-------------------
 2 files changed, 149 insertions(+), 140 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/rpm/rootfs.py

diff --git a/meta/lib/oe/package_managers/rpm/rootfs.py b/meta/lib/oe/package_managers/rpm/rootfs.py
new file mode 100644
index 0000000000..d3b615d03a
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/rootfs.py
@@ -0,0 +1,147 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.rootfs import *
+
+class RpmRootfs(Rootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
+                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
+                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+
+        import importlib
+        self.manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, manifest_dir)
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
index c3cfb58493..234be4a066 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -352,146 +352,6 @@ class Rootfs(object, metaclass=ABCMeta):
                                   self.image_rootfs, "-D", devtable])
 
 
-class RpmRootfs(Rootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(RpmRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
-                               r'|exit 1|ERROR: |Error: |Error |ERROR '\
-                               r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
-        import importlib
-        self.manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, manifest_dir)
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
@@ -960,6 +820,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
         self.pm.remove_lists()
 
 def get_class_for_type(imgtype):
+    from oe.package_managers.rpm.rootfs import RpmRootfs
     return {"rpm": RpmRootfs,
             "ipk": OpkgRootfs,
             "deb": DpkgRootfs}[imgtype]
@@ -973,6 +834,7 @@ def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None)
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE')
+    from oe.package_managers.rpm.rootfs import RpmRootfs
     if img_type == "rpm":
         RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
     elif img_type == "ipk":
-- 
2.20.1

