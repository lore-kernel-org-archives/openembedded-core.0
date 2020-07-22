Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.18595.1595424687254984647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BHpv6nZH;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6018; q=dns/txt; s=axis-central1;
  t=1595424689; x=1626960689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qb7uGajtAXyr/9vqD/Ae60j+ai+ZWGQX5lEtRxjs0dQ=;
  b=BHpv6nZHyC4m8rWmw4sSxa8q+bDWXVbyLKhQhVv5BujM6pPP1ClEmZqh
   HW7RVN2SOfMZ+QFOKzH5VzM7HbrRZvxqlDwQCp23SOCJLLtPVSwjnWOYE
   mORPtytEv000uLWHlZXB2XCxolsr/BRY8J+BKgRc62kt8XKNpIKimX+OP
   szzuPWXA9+azyejk1iVpXuEWd7Ncq845UIYdHHtdvqef3pwV6UEoeCu+o
   E7QBWwGm0gd/kgK/I8hVIWnmU0H8JpCu4lV9+tUK2tBfe1kjUiRbFkTki
   ZlPH7WbZttjghbweEuQk5LZTWK9RPSy3LZJDkg/uUts7QhsauHv+wKpO3
   g==;
IronPort-SDR: NzSDkJzvgPMiWel5jQQRaQQ/XXCNS+0a+ZtgKQCwrL2JbvXj3R3MCYaqayI4Ti9+1U19fFOFRY
 AU16+TB/uCHhqPXJch0Tf+nILQqQCtYm8UVgQn1HZEkU++yV3Upz9JXTJ5riUP8lMsrPqVrE5y
 bBQ9tKGfGFp3naNcvQq7O+WU0sTaTlUY6F9i9jngykBZbA/wYc2mL8rYXlqx2g3wlF7NouxGpv
 aDtd1KzjsL2SCTB1w2OnaPW+usZR1sqkvA8Jp/Pv9L5j4rFeGmaty9DF07Ah7cjiM6b1UspCOI
 8Z8=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="10790843"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 03/13] ipk: Move ipk manifest to its own subdir
Date: Wed, 22 Jul 2020 15:31:10 +0200
Message-ID: <20200722133120.11484-4-fredrigu@axis.com>
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
 meta/lib/oe/manifest.py                     | 72 +-------------------
 meta/lib/oe/package_manager/ipk/__init__.py |  3 +
 meta/lib/oe/package_manager/ipk/manifest.py | 73 +++++++++++++++++++++
 meta/lib/oe/rootfs.py                       |  1 +
 4 files changed, 78 insertions(+), 71 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/ipk/__init__.py
 create mode 100644 meta/lib/oe/package_manager/ipk/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 17461cda64..f87c150d33 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -187,76 +187,6 @@ class Manifest(object, metaclass=ABCMeta):
 
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
@@ -281,8 +211,8 @@ class DpkgManifest(Manifest):
 
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
-
     from oe.package_manager.rpm.manifest import RpmManifest
+    from oe.package_manager.ipk.manifest import OpkgManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
new file mode 100644
index 0000000000..69676903ab
--- /dev/null
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -0,0 +1,73 @@
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
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c674551764..1ba0a71253 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -12,6 +12,7 @@ import os
 import subprocess
 import re
 from oe.package_manager.rpm.manifest import RpmManifest
+from oe.package_manager.ipk.manifest import OpkgManifest
 
 class Rootfs(object, metaclass=ABCMeta):
     """
-- 
2.20.1

