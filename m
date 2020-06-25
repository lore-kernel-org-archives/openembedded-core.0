Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.7634.1593080526167583199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Sa0XfIBD;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=6112; q=dns/txt; s=axis-central1;
  t=1593080528; x=1624616528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ho2poMVUqe1MZdkG2zpvpsQPNu3zJJor0bSpOVyWVvs=;
  b=Sa0XfIBD77XNPXal90VmT7ZRSGcE+UQHusaXX+5/UDlCL6Q8jlul0HBr
   6bSh0mNPCRLImp6v/3xFepIKKqowSus2JY6zIr2X5eKC2lo1Mhl99fkDA
   TrsRKRKg2PkrCsbhbHvn5y93Ec3dFfvtDjllVdp/aaRDysdMr2wv3UVza
   M+tET5THFazXMwEHEyVdSnDeetzrc5jJpA+AI2O5zSiRhX5Vd59XTd7wn
   VlgqWvvXsTYk8FXpitHJD+FSN3MXFTGyZkiOuJonZLAM+1+1XGjObkiJg
   5GCzsd7PsPrBZQdI+jnO1k+nvHecZaSPdKf3UJGQ0qAEQEgfebvTkmjy7
   Q==;
IronPort-SDR: O13JiX6WMp4MXogJi9o9PCKCtfZSQhm6u+WlIba7q6nO/7Wvka/mYlDaC4eXOGFD4fdon8umlK
 s34igVDMxlRgASQjIMKF6fRuc4/NIWJsdJ+KMu7YOIIUa71ogiDvA7mbRjpevoBrdSdVJBANDF
 n2cbJ0oygsYMhOXpA8szEx/MnkQISFinFHLFCmLqGe2nUc+KmsO8TR6k/wDGwNWfk7cj+grDQI
 pgPn7CKYLIr5ZF2lmf0c8eXoZoLh6Ip+rBG3Suu0funFpaubWzlDOGtCxw4Kx2EGAUClRyA1Fs
 Wo0=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893882"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 05/26] manifest: Move OpkgManifest
Date: Thu, 25 Jun 2020 12:21:24 +0200
Message-ID: <20200625102145.7139-6-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the manifest only used by the ipk package manager live in the ipk
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/manifest.py                      | 71 +-----------------
 meta/lib/oe/package_managers/ipk/manifest.py | 76 ++++++++++++++++++++
 meta/lib/oe/rootfs.py                        |  1 +
 meta/lib/oe/sdk.py                           |  1 +
 4 files changed, 79 insertions(+), 70 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/ipk/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index db71766bb6..d93edfcac5 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -188,79 +188,10 @@ class Manifest(object, metaclass=ABCMeta):
 
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
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
     from oe.package_managers.rpm.manifest import RpmManifest
+    from oe.package_managers.ipk.manifest import OpkgManifest
     from oe.package_managers.deb.manifest import DpkgManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
diff --git a/meta/lib/oe/package_managers/ipk/manifest.py b/meta/lib/oe/package_managers/ipk/manifest.py
new file mode 100644
index 0000000000..be87f3d1b7
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/manifest.py
@@ -0,0 +1,76 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.manifest import *
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
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 7ff9b4e171..ab10edfec0 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -699,6 +699,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
         super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(exit 1|Collected errors)'
 
+        from oe.package_managers.ipk.manifest import OpkgManifest
         self.manifest = OpkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 2ee46fe9cc..70451a0b3a 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -232,6 +232,7 @@ class OpkgSdk(Sdk):
         if "sdk_ext" in d.getVar("BB_RUNTASK"):
             ipk_repo_workdir = "oe-sdk-ext-repo"
 
+        from oe.package_managers.ipk.manifest import OpkgManifest
         self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
                                 self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), 
                                 ipk_repo_workdir=ipk_repo_workdir)
-- 
2.20.1

