Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4352.1593718151682783662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 12:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EGCseM1I;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6202; q=dns/txt; s=axis-central1;
  t=1593718152; x=1625254152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wyUoV6KeWpjXyudVqDQNwrRyd2KcL2f1/693TvkztqQ=;
  b=EGCseM1IxuFUI5c910UWXsINwMxlwhMcZlheC4nJRPzGRy5H6TEbSXpa
   aw/kd6RfD9zbYrZuONeXad1qN8pygDmGfoVI4orsxq3ztHvCZRkY2sNxR
   6e+h6DHskjgOjWVRhEqWvNp7QPUCwzTXHQOlSjoPF3QUQJvB+AFNIOUIq
   buFbkj+49ZYoJaT0caa4d0JAyJnq8gQ0vwvuPAHw4nCgbKW92j8dlF2Gj
   9WzgHUwie2o9aebXHI1cf9p10xFYWOfu8aR+KnpgxHrh1lU2TBd7pLr1V
   4t0W29fAvj7Zr0hMXfCSJLMbBVPAGpw0EYcHNb4iI/KMxccavY/ZaogUh
   w==;
IronPort-SDR: krOhAWD5gYzYnMrMgGgkT2L180insZULDkJanBzu4Bk/jcym+dVlkNEZ40R5D/jwLTqwuwyqIE
 98J+xBfZTfQfvOit/0QHWZunJ06qgPNSKmmCvnoYOAdq69Nd1+37DWeU9pqIZM9MV7EiCpmR9h
 pbmsBAjPo4Phxm5jnAXcq4XTIal9m2d/gEKRvCTlEB0iidmUnwq2eXVNOubw3XIcVLhnBz27nm
 VtRLz4dUAgJuz+SHZCgWpeow3PQQwDXcBbB6ZPYvOxjQGZbjULtFcPBfuBSzY1LLCyyDi55hEW
 law=
X-IronPort-AV: E=Sophos;i="5.75,305,1589234400"; 
   d="scan'208";a="10142575"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v3 2/3] Move ipk manifest to its own subdir
Date: Thu, 2 Jul 2020 21:29:05 +0200
Message-ID: <20200702192906.6301-3-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200702192906.6301-1-fredrigu@axis.com>
References: <20200702192906.6301-1-fredrigu@axis.com>
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

