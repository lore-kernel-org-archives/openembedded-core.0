Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.4367.1593718150875266990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 12:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cJPQzSxv;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4914; q=dns/txt; s=axis-central1;
  t=1593718151; x=1625254151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pO6/wYBJoJY625h6EIzjwg3khx5h0yJHL1iTNFYcQic=;
  b=cJPQzSxvkzGoyRTITI/OOII7mO6xwxfwEn3fesa66sox70o3YbXpiDm5
   p76WJ2lvjkWfqSJVfWDYeqGKckHspXQF3Y7jU4SOEu9GQNYWr1xYIszfE
   9PoW3tCYpAHuhpyFBf3ka8Zz1CKqgXEAc1DUP8TF+rSf22lRvol9HQwKO
   ByuT6MyvbZWZ853kAK9FlE1yodDyReDRSb2Hes2+3PViro9NJIvM/Mz0g
   5CA20ke+fZgkJdG//TynBEw57AUuHyGISfKJB7+ruyzjQ1jymv9PTTrJS
   +B98UBXiz9xnJZJosJMk2sPzttdj93+0hjf1stTeRc+tUG08xFLFhsLpY
   A==;
IronPort-SDR: fG1D5JqLoDRbMWqamCMcPmDjZNST9R/BUHxaaA1KGAMDYgjgAu2Xtmg/OV5+70ee6yQZDFhhFx
 oQeVAgfSuTzk96vbsnrfjHw1/guFpa2Eh7YPAmd13ViXckRO8muRtLHAB/9kO76IHeVzh6AfR1
 d9PSkVIFBi1TfSzBvitCFk3/+zBv09bzawr7sv91MJBx0hoYvGzUuAN0DME7fpDVZrkqeJIInN
 OPIE2t6G2sgUJY1/E+aDpxI/fW+VFpJm/5o0c0RBqosbAbG9shedKlEp1k0QGBwBCpnoZgNWYU
 RL8=
X-IronPort-AV: E=Sophos;i="5.75,305,1589234400"; 
   d="scan'208";a="10441133"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v3 1/3] Move rpm manifest to its own subdir
Date: Thu, 2 Jul 2020 21:29:04 +0200
Message-ID: <20200702192906.6301-2-fredrigu@axis.com>
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
 meta/lib/oe/manifest.py                      | 51 +-----------------
 meta/lib/oe/package_managers/rpm/__init__.py |  3 ++
 meta/lib/oe/package_managers/rpm/manifest.py | 56 ++++++++++++++++++++
 meta/lib/oe/rootfs.py                        |  2 +
 4 files changed, 62 insertions(+), 50 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/rpm/__init__.py
 create mode 100644 meta/lib/oe/package_managers/rpm/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index f7c88f9a09..cf2cbe22eb 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -189,56 +189,6 @@ class Manifest(object, metaclass=ABCMeta):
         return installed_pkgs
 
 
-class RpmManifest(Manifest):
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
-            for pkg_type in pkgs:
-                for pkg in pkgs[pkg_type].split():
-                    manifest.write("%s,%s\n" % (pkg_type, pkg))
-
-    def create_final(self):
-        pass
-
-    def create_full(self, pm):
-        pass
-
-
 class OpkgManifest(Manifest):
     """
     Returns a dictionary object with mip and mlp packages.
@@ -332,6 +282,7 @@ class DpkgManifest(Manifest):
 
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
+    from oe.package_managers.rpm.manifest import RpmManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
diff --git a/meta/lib/oe/package_managers/rpm/__init__.py b/meta/lib/oe/package_managers/rpm/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_managers/rpm/manifest.py b/meta/lib/oe/package_managers/rpm/manifest.py
new file mode 100644
index 0000000000..9047462951
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/manifest.py
@@ -0,0 +1,56 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.manifest import Manifest
+
+class RpmManifest(Manifest):
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
+            for pkg_type in pkgs:
+                for pkg in pkgs[pkg_type].split():
+                    manifest.write("%s,%s\n" % (pkg_type, pkg))
+
+    def create_final(self):
+        pass
+
+    def create_full(self, pm):
+        pass
+
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a0ac33ada6..b6d2028e9b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -359,6 +359,8 @@ class RpmRootfs(Rootfs):
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+
+        from oe.package_managers.rpm.manifest import RpmManifest
         self.manifest = RpmManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
-- 
2.20.1

