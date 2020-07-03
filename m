Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.8521.1593776657701816308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=g3drlppw;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=13693; q=dns/txt; s=axis-central1;
  t=1593776659; x=1625312659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nravF7bNEA5BJNCazEz0+Dh7m471zMBi5c14ctHp94o=;
  b=g3drlppwjuSRI24iZ3MtNuiqhjM2cZhF1B1KlIhzX3Ft8V1qx/9lSyMB
   eCc1WhWgVisLdo9zclYIRrsPMQPCPR/rLt4Qk2UBBsVNSvLDiTqQm/G4V
   LUBxyseuzezYFFMO3dCLTVsX1o2bjSyvSGN7+te33xfL4YCv01UTH92ib
   YlYnuDuH6+8hCmCnUq0ZWp+ABQ4dX7s9CuIOckTTrmX6kX9SlUo3/FmBS
   OHo6TTgxISGiz7fArCTtr43mCrwdWCeSMIREIk14x0wiZCwBGHAMc9Qzc
   Pnrtlwdkzy+Uku4y2bLHVA7zMmWy3nKmEdxpqV4fnwzeZJ2i9+hHfFAK1
   w==;
IronPort-SDR: jKhsZiQvzvWEcdxvmc+dEbDwEXQZXYqozDRDHUKjlwbsOvhru0tOoWuLJdzljkEwvj3RKYDigi
 VITx5ZmibWjkU4vgTKL8YyT+fQFmItuZgW06bQS6ecwAwwanzIbI4nhmswfrPTOFsrwzlJlx9E
 tBBHCtIXz/6RPbiujFxDxL45mPZObqLXnEotZfJQMXbGVkESTQo0ZiC19pjKDFnMiSRQiloWZJ
 dDwpQpzzX5zxZS9ll3vCU06REwe3LsmVkqSMLuc4N9GQDlKfHBa0MMGN7xTIzQRiY4bJsPC7Wr
 hEs=
X-IronPort-AV: E=Sophos;i="5.75,308,1589234400"; 
   d="scan'208";a="10463149"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v4 06/12] Move deb rootfs to its own dir
Date: Fri, 3 Jul 2020 13:43:56 +0200
Message-ID: <20200703114402.8850-7-fredrigu@axis.com>
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
 meta/lib/oe/package_managers/deb/rootfs.py | 211 +++++++++++++++++++++
 meta/lib/oe/rootfs.py                      | 203 +-------------------
 2 files changed, 213 insertions(+), 201 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/deb/rootfs.py

diff --git a/meta/lib/oe/package_managers/deb/rootfs.py b/meta/lib/oe/package_managers/deb/rootfs.py
new file mode 100644
index 0000000000..544558ba7d
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/rootfs.py
@@ -0,0 +1,211 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.rootfs import Rootfs
+from oe.package_manager import DpkgPM
+from oe.manifest import Manifest
+from oe.utils import execute_pre_post_process
+import re
+
+class DpkgOpkgRootfs(Rootfs):
+    def __init__(self, d, progress_reporter=None, logcatcher=None):
+        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+
+    def _get_pkgs_postinsts(self, status_file):
+        def _get_pkg_depends_list(pkg_depends):
+            pkg_depends_list = []
+            # filter version requirements like libc (>= 1.1)
+            for dep in pkg_depends.split(', '):
+                m_dep = re.match(r"^(.*) \(.*\)$", dep)
+                if m_dep:
+                    dep = m_dep.group(1)
+                pkg_depends_list.append(dep)
+
+            return pkg_depends_list
+
+        pkgs = {}
+        pkg_name = ""
+        pkg_status_match = False
+        pkg_depends = ""
+
+        with open(status_file) as status:
+            data = status.read()
+            status.close()
+            for line in data.split('\n'):
+                m_pkg = re.match(r"^Package: (.*)", line)
+                m_status = re.match(r"^Status:.*unpacked", line)
+                m_depends = re.match(r"^Depends: (.*)", line)
+
+                #Only one of m_pkg, m_status or m_depends is not None at time
+                #If m_pkg is not None, we started a new package
+                if m_pkg is not None:
+                    #Get Package name
+                    pkg_name = m_pkg.group(1)
+                    #Make sure we reset other variables
+                    pkg_status_match = False
+                    pkg_depends = ""
+                elif m_status is not None:
+                    #New status matched
+                    pkg_status_match = True
+                elif m_depends is not None:
+                    #New depends macthed
+                    pkg_depends = m_depends.group(1)
+                else:
+                    pass
+
+                #Now check if we can process package depends and postinst
+                if "" != pkg_name and pkg_status_match:
+                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
+                else:
+                    #Not enough information
+                    pass
+
+        # remove package dependencies not in postinsts
+        pkg_names = list(pkgs.keys())
+        for pkg_name in pkg_names:
+            deps = pkgs[pkg_name][:]
+
+            for d in deps:
+                if d not in pkg_names:
+                    pkgs[pkg_name].remove(d)
+
+        return pkgs
+
+    def _get_delayed_postinsts_common(self, status_file):
+        def _dep_resolve(graph, node, resolved, seen):
+            seen.append(node)
+
+            for edge in graph[node]:
+                if edge not in resolved:
+                    if edge in seen:
+                        raise RuntimeError("Packages %s and %s have " \
+                                "a circular dependency in postinsts scripts." \
+                                % (node, edge))
+                    _dep_resolve(graph, edge, resolved, seen)
+
+            resolved.append(node)
+
+        pkg_list = []
+
+        pkgs = None
+        if not self.d.getVar('PACKAGE_INSTALL').strip():
+            bb.note("Building empty image")
+        else:
+            pkgs = self._get_pkgs_postinsts(status_file)
+        if pkgs:
+            root = "__packagegroup_postinst__"
+            pkgs[root] = list(pkgs.keys())
+            _dep_resolve(pkgs, root, pkg_list, [])
+            pkg_list.remove(root)
+
+        if len(pkg_list) == 0:
+            return None
+
+        return pkg_list
+
+    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
+        if bb.utils.contains("IMAGE_FEATURES", "package-management",
+                         True, False, self.d):
+            return
+        num = 0
+        for p in self._get_delayed_postinsts():
+            bb.utils.mkdirhier(dst_postinst_dir)
+
+            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
+                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
+                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
+
+            num += 1
+
+class DpkgRootfs(DpkgOpkgRootfs):
+    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
+        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
+        self.log_check_regex = '^E:'
+        self.log_check_expected_regexes = \
+        [
+            "^E: Unmet dependencies."
+        ]
+
+        bb.utils.remove(self.image_rootfs, True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        from oe.package_managers.deb.manifest import DpkgManifest
+        self.manifest = DpkgManifest(d, manifest_dir)
+        self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
+                         d.getVar('PACKAGE_ARCHS'),
+                         d.getVar('DPKG_ARCH'))
+
+
+    def _create(self):
+        pkgs_to_install = self.manifest.parse_initial_manifest()
+        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS')
+        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS')
+
+        alt_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternatives")
+        bb.utils.mkdirhier(alt_dir)
+
+        # update PM index files
+        self.pm.write_index()
+
+        execute_pre_post_process(self.d, deb_pre_process_cmds)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+            # Don't support incremental, so skip that
+            self.progress_reporter.next_stage()
+
+        self.pm.update()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                self.pm.install(pkgs_to_install[pkg_type],
+                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                self.pm.fix_broken_dependencies()
+
+        if self.progress_reporter:
+            # Don't support attemptonly, so skip that
+            self.progress_reporter.next_stage()
+            self.progress_reporter.next_stage()
+
+        self.pm.install_complementary()
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+        self._setup_dbg_rootfs(['/var/lib/dpkg'])
+
+        self.pm.fix_broken_dependencies()
+
+        self.pm.mark_packages("installed")
+
+        self.pm.run_pre_post_installs()
+
+        execute_pre_post_process(self.d, deb_post_process_cmds)
+
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+    @staticmethod
+    def _depends_list():
+        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
+
+    def _get_delayed_postinsts(self):
+        status_file = self.image_rootfs + "/var/lib/dpkg/status"
+        return self._get_delayed_postinsts_common(status_file)
+
+    def _save_postinsts(self):
+        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts")
+        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/info")
+        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
+
+    def _log_check(self):
+        self._log_check_warn()
+        self._log_check_error()
+
+    def _cleanup(self):
+        pass
+
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0acae3613f..6acc80a7a4 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -353,210 +353,10 @@ class Rootfs(object, metaclass=ABCMeta):
                                   self.image_rootfs, "-D", devtable])
 
 
-class DpkgOpkgRootfs(Rootfs):
-    def __init__(self, d, progress_reporter=None, logcatcher=None):
-        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
-
-    def _get_pkgs_postinsts(self, status_file):
-        def _get_pkg_depends_list(pkg_depends):
-            pkg_depends_list = []
-            # filter version requirements like libc (>= 1.1)
-            for dep in pkg_depends.split(', '):
-                m_dep = re.match(r"^(.*) \(.*\)$", dep)
-                if m_dep:
-                    dep = m_dep.group(1)
-                pkg_depends_list.append(dep)
-
-            return pkg_depends_list
-
-        pkgs = {}
-        pkg_name = ""
-        pkg_status_match = False
-        pkg_depends = ""
-
-        with open(status_file) as status:
-            data = status.read()
-            status.close()
-            for line in data.split('\n'):
-                m_pkg = re.match(r"^Package: (.*)", line)
-                m_status = re.match(r"^Status:.*unpacked", line)
-                m_depends = re.match(r"^Depends: (.*)", line)
-
-                #Only one of m_pkg, m_status or m_depends is not None at time
-                #If m_pkg is not None, we started a new package
-                if m_pkg is not None:
-                    #Get Package name
-                    pkg_name = m_pkg.group(1)
-                    #Make sure we reset other variables
-                    pkg_status_match = False
-                    pkg_depends = ""
-                elif m_status is not None:
-                    #New status matched
-                    pkg_status_match = True
-                elif m_depends is not None:
-                    #New depends macthed
-                    pkg_depends = m_depends.group(1)
-                else:
-                    pass
-
-                #Now check if we can process package depends and postinst
-                if "" != pkg_name and pkg_status_match:
-                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
-                else:
-                    #Not enough information
-                    pass
-
-        # remove package dependencies not in postinsts
-        pkg_names = list(pkgs.keys())
-        for pkg_name in pkg_names:
-            deps = pkgs[pkg_name][:]
-
-            for d in deps:
-                if d not in pkg_names:
-                    pkgs[pkg_name].remove(d)
-
-        return pkgs
-
-    def _get_delayed_postinsts_common(self, status_file):
-        def _dep_resolve(graph, node, resolved, seen):
-            seen.append(node)
-
-            for edge in graph[node]:
-                if edge not in resolved:
-                    if edge in seen:
-                        raise RuntimeError("Packages %s and %s have " \
-                                "a circular dependency in postinsts scripts." \
-                                % (node, edge))
-                    _dep_resolve(graph, edge, resolved, seen)
-
-            resolved.append(node)
-
-        pkg_list = []
-
-        pkgs = None
-        if not self.d.getVar('PACKAGE_INSTALL').strip():
-            bb.note("Building empty image")
-        else:
-            pkgs = self._get_pkgs_postinsts(status_file)
-        if pkgs:
-            root = "__packagegroup_postinst__"
-            pkgs[root] = list(pkgs.keys())
-            _dep_resolve(pkgs, root, pkg_list, [])
-            pkg_list.remove(root)
-
-        if len(pkg_list) == 0:
-            return None
-
-        return pkg_list
-
-    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
-        if bb.utils.contains("IMAGE_FEATURES", "package-management",
-                         True, False, self.d):
-            return
-        num = 0
-        for p in self._get_delayed_postinsts():
-            bb.utils.mkdirhier(dst_postinst_dir)
-
-            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
-                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
-                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
-
-            num += 1
-
-class DpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
-        super(DpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
-        self.log_check_regex = '^E:'
-        self.log_check_expected_regexes = \
-        [
-            "^E: Unmet dependencies."
-        ]
-
-        bb.utils.remove(self.image_rootfs, True)
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-        from oe.package_managers.deb.manifest import DpkgManifest
-        self.manifest = DpkgManifest(d, manifest_dir)
-        self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
-                         d.getVar('PACKAGE_ARCHS'),
-                         d.getVar('DPKG_ARCH'))
-
-
-    def _create(self):
-        pkgs_to_install = self.manifest.parse_initial_manifest()
-        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS')
-        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS')
-
-        alt_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternatives")
-        bb.utils.mkdirhier(alt_dir)
-
-        # update PM index files
-        self.pm.write_index()
-
-        execute_pre_post_process(self.d, deb_pre_process_cmds)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-            # Don't support incremental, so skip that
-            self.progress_reporter.next_stage()
-
-        self.pm.update()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                self.pm.install(pkgs_to_install[pkg_type],
-                                [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
-                self.pm.fix_broken_dependencies()
-
-        if self.progress_reporter:
-            # Don't support attemptonly, so skip that
-            self.progress_reporter.next_stage()
-            self.progress_reporter.next_stage()
-
-        self.pm.install_complementary()
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-        self._setup_dbg_rootfs(['/var/lib/dpkg'])
-
-        self.pm.fix_broken_dependencies()
-
-        self.pm.mark_packages("installed")
-
-        self.pm.run_pre_post_installs()
-
-        execute_pre_post_process(self.d, deb_post_process_cmds)
-
-        if self.progress_reporter:
-            self.progress_reporter.next_stage()
-
-    @staticmethod
-    def _depends_list():
-        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
-
-    def _get_delayed_postinsts(self):
-        status_file = self.image_rootfs + "/var/lib/dpkg/status"
-        return self._get_delayed_postinsts_common(status_file)
-
-    def _save_postinsts(self):
-        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts")
-        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/info")
-        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
-
-    def _log_check(self):
-        self._log_check_warn()
-        self._log_check_error()
-
-    def _cleanup(self):
-        pass
-
-
 def get_class_for_type(imgtype):
     from oe.package_managers.rpm.rootfs import RpmRootfs
     from oe.package_managers.ipk.rootfs import OpkgRootfs
+    from oe.package_managers.deb.rootfs import DpkgRootfs
     return {"rpm": RpmRootfs,
             "ipk": OpkgRootfs,
             "deb": DpkgRootfs}[imgtype]
@@ -572,6 +372,7 @@ def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None)
     img_type = d.getVar('IMAGE_PKGTYPE')
     from oe.package_managers.rpm.rootfs import RpmRootfs
     from oe.package_managers.ipk.rootfs import OpkgRootfs
+    from oe.package_managers.deb.rootfs import DpkgRootfs
     if img_type == "rpm":
         RpmRootfs(d, manifest_dir, progress_reporter, logcatcher).create()
     elif img_type == "ipk":
-- 
2.20.1

