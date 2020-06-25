Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.7376.1593080528376404276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cT/Q6teA;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4980; q=dns/txt; s=axis-central1;
  t=1593080528; x=1624616528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xEKdtwnEL7mGEkQAIL52LT4obH5xeNW71wY2kb7sORM=;
  b=cT/Q6teA8HHzC0I2Z4qOgJYUp3QDeXgSIbEm59IAgbR5WeR2sDNLkZqC
   0w4l5Iwdys4KpQ4+qqrOW+F37tF+yY63PzlwSklRzJDbZwTktp1Gqcj5x
   MFjMCGGG+KAkKstk6VpK1gPZhApJH7IcN7ycWDgPErvPEdAOeXS3WFwDH
   kK5R3PbpUzgcpPwqOVEhvHXBmgWFnsPyvVsgWGwGy0GU6k8upqBIjZnxl
   ZYum/cEukRYbksrI0nOVkPBTe6lR1Y/7+/cQd32LqZnsoRqIxkwFyM73n
   mT4SmH6xWXto1xP3ao9qSjlcSVICiupdFVVI25NBCYG/YB7OcrdKaOImw
   Q==;
IronPort-SDR: yLYdUjD3fAx6/ztosR9Yjm9jvYkDySDVfjjudDjBFy4ED0FzF6kNSCfjMfkhV4hB4/1dk2+dm2
 aF5CZOJeA/Z8ofYlSxqBSCNotteVqqboSY+2qzwDQKssiiJ7w7pCkir3Rvffe4hoQGlVKVxKQR
 cDNr684b373uRinALxAsNOHhc37o+RhiubPBKSJ25FdwZ0S0AqySO17hSczwbOrIJcigF8Hssn
 ZwqIzFMWGugHgLTVM8kMGUqVmE4YuxSAZ3NNCT72pzU7DJP6BtpprV+V7zJKtJsBvLWAdX2pLK
 zIM=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893881"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 03/26] manifest: Move RpmManifest
Date: Thu, 25 Jun 2020 12:21:22 +0200
Message-ID: <20200625102145.7139-4-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the manifest only used by the rpm package manager live in the rpm
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/manifest.py                      | 51 +-----------------
 meta/lib/oe/package_managers/rpm/manifest.py | 57 ++++++++++++++++++++
 meta/lib/oe/rootfs.py                        |  1 +
 meta/lib/oe/sdk.py                           |  1 +
 4 files changed, 60 insertions(+), 50 deletions(-)
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
diff --git a/meta/lib/oe/package_managers/rpm/manifest.py b/meta/lib/oe/package_managers/rpm/manifest.py
new file mode 100644
index 0000000000..a225ee7a23
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/manifest.py
@@ -0,0 +1,57 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.manifest import *
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
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a0ac33ada6..e920f944c4 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -359,6 +359,7 @@ class RpmRootfs(Rootfs):
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
+        from oe.package_managers.rpm.manifest import RpmManifest
         self.manifest = RpmManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d02a274812..d543a2a92d 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -114,6 +114,7 @@ class RpmSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
         super(RpmSdk, self).__init__(d, manifest_dir)
 
+        from oe.package_managers.rpm.manifest import RpmManifest
         self.target_manifest = RpmManifest(d, self.manifest_dir,
                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
         self.host_manifest = RpmManifest(d, self.manifest_dir,
-- 
2.20.1

