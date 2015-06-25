Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C73007596C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 18:21:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2015 11:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,678,1427785200"; d="scan'208";a="514251215"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 11:19:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 13:21:15 -0500
Message-Id: <7d6abaedbcf580c9e71d5f54cb03d1d0638a7806.1435255972.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435255972.git.anibal.limon@linux.intel.com>
References: <cover.1435255972.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1435255972.git.anibal.limon@linux.intel.com>
References: <cover.1435255972.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oe/rootfs.py: DpkgRootfs/OpkgRootfs add support for dependency handling in postinsts scripts.
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
X-List-Received-Date: Thu, 25 Jun 2015 18:21:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The old code don't take into account package dependencies causing
undefined execution order in postinsts scripts, in order to fix:

Add DpkgOpkgRootfs class for store common operations in DpkgRootfs
and OpkgRootfs.

Add _get_delayed_postinsts_common method that process Depends from
status file in dpkg/opkg and resolve dependency order causing an
execption if found circular dependencies.

[YOCTO #5318]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 156 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 101 insertions(+), 55 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 48e5754..327c8ea 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -495,8 +495,98 @@ class RpmRootfs(Rootfs):
         if os.path.isdir(self.pm.install_dir_path) and not os.listdir(self.pm.install_dir_path):
            bb.utils.remove(self.pm.install_dir_path, True)
 
+class DpkgOpkgRootfs(Rootfs):
+    def __init__(self, d):
+        super(DpkgOpkgRootfs, self).__init__(d)
+
+    def _get_pkgs_postinsts(self, status_file):
+        def _get_pkg_depends_list(pkg_depends):
+            pkg_depends_list = []
+            # filter version requirements like libc (>= 1.1)
+            for dep in pkg_depends.split(', '):
+                m_dep = re.match("^(.*) \(.*\)$", dep)
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
+                m_pkg = re.match("^Package: (.*)", line)
+                m_status = re.match("^Status:.*unpacked", line)
+                m_depends = re.match("^Depends: (.*)", line)
+
+                if m_pkg is not None:
+                    if pkg_name and pkg_status_match:
+                        pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
+
+                    pkg_name = m_pkg.group(1)
+                    pkg_status_match = False
+                    pkg_depends = ""
+                elif m_status is not None:
+                    pkg_status_match = True
+                elif m_depends is not None:
+                    pkg_depends = m_depends.group(1)
+
+        # remove package dependencies not in postinsts
+        pkg_names = pkgs.keys()
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
 
-class DpkgRootfs(Rootfs):
+        pkgs = self._get_pkgs_postinsts(status_file)
+        if pkgs:
+            root = "__packagegroup_postinst__"
+            pkgs[root] = pkgs.keys()
+            _dep_resolve(pkgs, root, pkg_list, [])
+            pkg_list.remove(root)
+
+        if len(pkg_list) == 0:
+            return None
+
+        return pkg_list
+
+    def _save_postinsts_common(self, dst_postinst_dir, src_postinst_dir):
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
     def __init__(self, d, manifest_dir):
         super(DpkgRootfs, self).__init__(d)
         self.log_check_regex = '^E:'
@@ -540,34 +630,13 @@ class DpkgRootfs(Rootfs):
         return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMAND']
 
     def _get_delayed_postinsts(self):
-        pkg_list = []
-        with open(self.image_rootfs + "/var/lib/dpkg/status") as status:
-            for line in status:
-                m_pkg = re.match("^Package: (.*)", line)
-                m_status = re.match("^Status:.*unpacked", line)
-                if m_pkg is not None:
-                    pkg_name = m_pkg.group(1)
-                elif m_status is not None:
-                    pkg_list.append(pkg_name)
-
-        if len(pkg_list) == 0:
-            return None
-
-        return pkg_list
+        status_file = self.image_rootfs + "/var/lib/dpkg/status"
+        return self._get_delayed_postinsts_common(status_file)
 
     def _save_postinsts(self):
-        num = 0
-        for p in self._get_delayed_postinsts():
-            dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts")
-            src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/info")
-
-            bb.utils.mkdirhier(dst_postinst_dir)
-
-            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
-                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
-                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
-
-            num += 1
+        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts")
+        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/info")
+        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
 
     def _handle_intercept_failure(self, registered_pkgs):
         self.pm.mark_packages("unpacked", registered_pkgs.split())
@@ -580,7 +649,7 @@ class DpkgRootfs(Rootfs):
         pass
 
 
-class OpkgRootfs(Rootfs):
+class OpkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir):
         super(OpkgRootfs, self).__init__(d)
         self.log_check_regex = '(exit 1|Collected errors)'
@@ -810,38 +879,15 @@ class OpkgRootfs(Rootfs):
         return ['IPKGCONF_SDK', 'IPK_FEED_URIS', 'DEPLOY_DIR_IPK', 'IPKGCONF_TARGET', 'INC_IPK_IMAGE_GEN', 'OPKG_ARGS', 'OPKGLIBDIR', 'OPKG_PREPROCESS_COMMANDS', 'OPKG_POSTPROCESS_COMMANDS', 'OPKGLIBDIR']
 
     def _get_delayed_postinsts(self):
-        pkg_list = []
         status_file = os.path.join(self.image_rootfs,
                                    self.d.getVar('OPKGLIBDIR', True).strip('/'),
                                    "opkg", "status")
-
-        with open(status_file) as status:
-            for line in status:
-                m_pkg = re.match("^Package: (.*)", line)
-                m_status = re.match("^Status:.*unpacked", line)
-                if m_pkg is not None:
-                    pkg_name = m_pkg.group(1)
-                elif m_status is not None:
-                    pkg_list.append(pkg_name)
-
-        if len(pkg_list) == 0:
-            return None
-
-        return pkg_list
+        return self._get_delayed_postinsts_common(status_file)
 
     def _save_postinsts(self):
-        num = 0
-        for p in self._get_delayed_postinsts():
-            dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts")
-            src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info")
-
-            bb.utils.mkdirhier(dst_postinst_dir)
-
-            if os.path.exists(os.path.join(src_postinst_dir, p + ".postinst")):
-                shutil.copy(os.path.join(src_postinst_dir, p + ".postinst"),
-                            os.path.join(dst_postinst_dir, "%03d-%s" % (num, p)))
-
-            num += 1
+        dst_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts")
+        src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info")
+        return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
 
     def _handle_intercept_failure(self, registered_pkgs):
         self.pm.mark_packages("unpacked", registered_pkgs.split())
-- 
1.9.1


