Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.8471.1593776656492055066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=kXseaxtp;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6202; q=dns/txt; s=axis-central1;
  t=1593776656; x=1625312656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wyUoV6KeWpjXyudVqDQNwrRyd2KcL2f1/693TvkztqQ=;
  b=kXseaxtpEMOxdv+ianZ5KXe3aTqzPTSpYDatwX60wk3RFImHFuDElQZj
   PiwgI+X04MZFo3SMLO7ruUvF8BEj4fZXflSIXuKf9nwakIvP0eTQ7TLdO
   6AS4oIPeh8l0MyLOTZKd6nsH8vszoS7hM3v/xdWAsGu6QYLUd1Rw34We5
   45ykkN8YzR6FEej4GIx1D3dlkvpr/KVsp6A2Or1fnVcQkBmfAi7V3g/dW
   iQGIbCiPmeXFk6z3CdrmezVfoAja++vYex7xaO1j/l+pUP1qk/iqKajC7
   Fi4eKSQ8Jq+OLNBHtvlcgQ/iWBr3x4OAPiy9WRhPdaAGWXwySvPD/3GWU
   Q==;
IronPort-SDR: Kdt+m6kPhu0lfwoiPmTNJxDVtLgaOxmOgi2RbXKJ5uj/U3ANBPy1fV3wXGmeJz1F0VGupSftq2
 MdrCzCfWqxZaqJBEm0pEXkvK6WNAvA30rgDsIED7bc8HkFjJQLDmQk2pv/GrywwMoZHxlyspw2
 +rEFExPMlfZlBzzMIC7PrwJZhG5qWCOx8LzelXwKgSOWhGjQoLueKQ2qy02btAiy8GEMRo+NIh
 akjALq8Kt7siZnfrSXYtV/8OTJjh4saXfyEq1FK6xj5B5/vsL/Euyldxd7f8KVMcxbpvzEMdhi
 ao8=
X-IronPort-AV: E=Sophos;i="5.75,308,1589234400"; 
   d="scan'208";a="10163727"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v4 02/12] Move ipk manifest to its own subdir
Date: Fri, 3 Jul 2020 13:43:52 +0200
Message-ID: <20200703114402.8850-3-fredrigu@axis.com>
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
 meta/lib/oe/manifest.py                      | 71 +-----------------
 meta/lib/oe/package_managers/ipk/__init__.py |  3 +
 meta/lib/oe/package_managers/ipk/manifest.py | 75 ++++++++++++++++++++
 meta/lib/oe/rootfs.py                        |  1 +
 4 files changed, 80 insertions(+), 70 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/ipk/__init__.py
 create mode 100644 meta/lib/oe/package_managers/ipk/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index cf2cbe22eb..2678e12413 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -188,76 +188,6 @@ class Manifest(object, metaclass=ABCMeta):
 
         return installed_pkgs
 
-
-class OpkgManifest(Manifest):
-    """
-    Returns a dictionary object with mip and mlp packages.
-    """
-    def _split_multilib(self, pkg_list):
-        pkgs = dict()
-
-        for pkg in pkg_list.split():
-            pkg_type = self.PKG_TYPE_MUST_INSTALL
-
-            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
-
-            for ml_variant in ml_variants:
-                if pkg.startswith(ml_variant + '-'):
-                    pkg_type = self.PKG_TYPE_MULTILIB
-
-            if not pkg_type in pkgs:
-                pkgs[pkg_type] = pkg
-            else:
-                pkgs[pkg_type] += " " + pkg
-
-        return pkgs
-
-    def create_initial(self):
-        pkgs = dict()
-
-        with open(self.initial_manifest, "w+") as manifest:
-            manifest.write(self.initial_manifest_file_header)
-
-            for var in self.var_maps[self.manifest_type]:
-                if var in self.vars_to_split:
-                    split_pkgs = self._split_multilib(self.d.getVar(var))
-                    if split_pkgs is not None:
-                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
-                else:
-                    pkg_list = self.d.getVar(var)
-                    if pkg_list is not None:
-                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
-
-            for pkg_type in sorted(pkgs):
-                for pkg in sorted(pkgs[pkg_type].split()):
-                    manifest.write("%s,%s\n" % (pkg_type, pkg))
-
-    def create_final(self):
-        pass
-
-    def create_full(self, pm):
-        if not os.path.exists(self.initial_manifest):
-            self.create_initial()
-
-        initial_manifest = self.parse_initial_manifest()
-        pkgs_to_install = list()
-        for pkg_type in initial_manifest:
-            pkgs_to_install += initial_manifest[pkg_type]
-        if len(pkgs_to_install) == 0:
-            return
-
-        output = pm.dummy_install(pkgs_to_install)
-
-        with open(self.full_manifest, 'w+') as manifest:
-            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
-            for line in set(output.split('\n')):
-                m = pkg_re.match(line)
-                if m:
-                    manifest.write(m.group(1) + '\n')
-
-        return
-
-
 class DpkgManifest(Manifest):
     def create_initial(self):
         with open(self.initial_manifest, "w+") as manifest:
@@ -283,6 +213,7 @@ class DpkgManifest(Manifest):
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
     from oe.package_managers.rpm.manifest import RpmManifest
+    from oe.package_managers.ipk.manifest import OpkgManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
diff --git a/meta/lib/oe/package_managers/ipk/__init__.py b/meta/lib/oe/package_managers/ipk/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_managers/ipk/manifest.py b/meta/lib/oe/package_managers/ipk/manifest.py
new file mode 100644
index 0000000000..3b58842537
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/manifest.py
@@ -0,0 +1,75 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.manifest import Manifest
+
+class OpkgManifest(Manifest):
+    """
+    Returns a dictionary object with mip and mlp packages.
+    """
+    def _split_multilib(self, pkg_list):
+        pkgs = dict()
+
+        for pkg in pkg_list.split():
+            pkg_type = self.PKG_TYPE_MUST_INSTALL
+
+            ml_variants = self.d.getVar('MULTILIB_VARIANTS').split()
+
+            for ml_variant in ml_variants:
+                if pkg.startswith(ml_variant + '-'):
+                    pkg_type = self.PKG_TYPE_MULTILIB
+
+            if not pkg_type in pkgs:
+                pkgs[pkg_type] = pkg
+            else:
+                pkgs[pkg_type] += " " + pkg
+
+        return pkgs
+
+    def create_initial(self):
+        pkgs = dict()
+
+        with open(self.initial_manifest, "w+") as manifest:
+            manifest.write(self.initial_manifest_file_header)
+
+            for var in self.var_maps[self.manifest_type]:
+                if var in self.vars_to_split:
+                    split_pkgs = self._split_multilib(self.d.getVar(var))
+                    if split_pkgs is not None:
+                        pkgs = dict(list(pkgs.items()) + list(split_pkgs.items()))
+                else:
+                    pkg_list = self.d.getVar(var)
+                    if pkg_list is not None:
+                        pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
+
+            for pkg_type in sorted(pkgs):
+                for pkg in sorted(pkgs[pkg_type].split()):
+                    manifest.write("%s,%s\n" % (pkg_type, pkg))
+
+    def create_final(self):
+        pass
+
+    def create_full(self, pm):
+        if not os.path.exists(self.initial_manifest):
+            self.create_initial()
+
+        initial_manifest = self.parse_initial_manifest()
+        pkgs_to_install = list()
+        for pkg_type in initial_manifest:
+            pkgs_to_install += initial_manifest[pkg_type]
+        if len(pkgs_to_install) == 0:
+            return
+
+        output = pm.dummy_install(pkgs_to_install)
+
+        with open(self.full_manifest, 'w+') as manifest:
+            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
+            for line in set(output.split('\n')):
+                m = pkg_re.match(line)
+                if m:
+                    manifest.write(m.group(1) + '\n')
+
+        return
+
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b6d2028e9b..283f52d068 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -699,6 +699,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
         super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(exit 1|Collected errors)'
 
+        from oe.package_managers.ipk.manifest import OpkgManifest
         self.manifest = OpkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
-- 
2.20.1

