Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.18841.1595424690864242356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mmy9wUzX;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=5203; q=dns/txt; s=axis-central1;
  t=1595424693; x=1626960693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n5dMMzX9FKi8aImWTGTbzK4BZ0xwafsJ2qrgYpmu7D0=;
  b=mmy9wUzXxJx/xkHV8dtOeFPoUNVpsNOOpmXembjmzn1LasV2tQ+OOaEE
   BbsV74Hdny6HKWFB7Q8bKm4b3IatYuCQ6YbLnwpb4SMTAyJ6yHIDELrvZ
   FRRI+3rBu1oWX1cGN5axlKnBQMeMPo3gpTfv9tKeEES2aw4v6LesmpMFQ
   hsXGKditOB/v99g9aitZ8vTkv1f5k5zCeZwFA5c2bQOFpsJSgew2G4rmU
   S10eqjyHEod6OzIKW8/W4s1Km9OZZrLO6bsUtXSt/qZHGNRQgCxqsN26H
   HD1sVbdG02ps4h9+QKecZHfvhoUhe/OIdEl+ozaHoJBFAFi8FDF9HZNIL
   A==;
IronPort-SDR: rZNoZjexs4efkYD3YukPBTWmPe7WMizTWaek4HgISn+5xCJYeUjfJNmn8TvGJsMueMnBcrohCT
 g/vl0woOWou8PV3jaRCLdEXeMv5ZVzOZYmeqjkAVwzWgK/zaPR5a9cKdAc6KN0rN79nSgrBHOH
 Ut2w+uGr/CZmnbxZWsJev2bLGsXb0c/LPNFrM+sFWwDWUed2+iELsUR9ukdC2DuTNVr8A+3+7M
 k0abFCCJy3QHvhzlwaV93E3TtDMjkIg6P3kpv/sW509XDN3gpIyJsM5OLAt3zXdE3fJ50AGHp1
 dto=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="11107585"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 02/13] rpm: Move manifest to its own subdir
Date: Wed, 22 Jul 2020 15:31:09 +0200
Message-ID: <20200722133120.11484-3-fredrigu@axis.com>
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
 meta/lib/oe/manifest.py                     | 53 +-------------------
 meta/lib/oe/package_manager/rpm/__init__.py |  3 ++
 meta/lib/oe/package_manager/rpm/manifest.py | 54 +++++++++++++++++++++
 meta/lib/oe/rootfs.py                       |  3 +-
 4 files changed, 61 insertions(+), 52 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/rpm/__init__.py
 create mode 100644 meta/lib/oe/package_manager/rpm/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index f7c88f9a09..17461cda64 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -7,7 +7,6 @@ import os
 import re
 import bb
 
-
 class Manifest(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -189,56 +188,6 @@ class Manifest(object, metaclass=ABCMeta):
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
@@ -332,6 +281,8 @@ class DpkgManifest(Manifest):
 
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
+
+    from oe.package_manager.rpm.manifest import RpmManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_manager/rpm/manifest.py b/meta/lib/oe/package_manager/rpm/manifest.py
new file mode 100644
index 0000000000..a75f6bdabf
--- /dev/null
+++ b/meta/lib/oe/package_manager/rpm/manifest.py
@@ -0,0 +1,54 @@
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
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0e05f1f75e..c674551764 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -11,7 +11,7 @@ import shutil
 import os
 import subprocess
 import re
-
+from oe.package_manager.rpm.manifest import RpmManifest
 
 class Rootfs(object, metaclass=ABCMeta):
     """
@@ -359,6 +359,7 @@ class RpmRootfs(Rootfs):
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+
         self.manifest = RpmManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
-- 
2.20.1

