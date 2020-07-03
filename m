Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.8468.1593776648023218877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OICO6VJj;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7755; q=dns/txt; s=axis-central1;
  t=1593776658; x=1625312658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1mi6SZmVAgo00tQyLpecqN8V7x30BC49h21UMwyMusU=;
  b=OICO6VJjIam+t6D383YsYedrUqnQKuBNxNCXvmgk0AWZA8FCzB9yfwiQ
   5+VT96NR+3wOkdrGStn582fojWAXOa+MhVJxHvLPMH/QSaUG/5lbxvMlr
   qw8IVF96EWoOdpi8/tKBBu5CgIUgOsRRrZZvmAOMsc95ZxhH5ye0vGSHK
   Pa+rEZpPhETgm190KiNKp5b4geB/N7RVQlHPRQYdDrjVY9O7202O5ihio
   LnO9f4ZQPIZ/Fj/svMloFAWIdmF1xocOMgR0ncsQzYEGjl/L6AOeLnqJ5
   0ba19EF45qv8kKnqunILClmkOdOz9zeSo0S8Ev2hTwRqYGn5gO1GvldJm
   g==;
IronPort-SDR: 6QcxdhF/0okY+qwx26vxG6hEPmaA5s8zPvtynbUrIIISStRGRZ4Gaer1hjLZ0PLlXnjhAOfhrq
 Suu2S8oCJh+sBJiKzIc2qh2kT8+Ozo8c8CoF2ZBQhJKo2d2K8tmNKEK3/+gv375s1WhpkzTFYn
 u+NHqdRKgh5NH4kTAR4JmkF/aHxCCDtD7LR95RZMrDyGsgBK7ag0ahuq1OyTDRPVWLZOP/NKMA
 bfcbI5zg68wNxJ32rTLxlTvJGGhHSaj9hGIwbz70H3Gfi3Go5eOrwopslJcJeTzwRltAZYTPMx
 +qM=
X-IronPort-AV: E=Sophos;i="5.75,308,1589234400"; 
   d="scan'208";a="10163731"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v4 09/12] Move deb sdk to its own dir
Date: Fri, 3 Jul 2020 13:43:59 +0200
Message-ID: <20200703114402.8850-10-fredrigu@axis.com>
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
 meta/lib/oe/package_managers/deb/sdk.py | 98 +++++++++++++++++++++++++
 meta/lib/oe/sdk.py                      | 87 +---------------------
 2 files changed, 99 insertions(+), 86 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/deb/sdk.py

diff --git a/meta/lib/oe/package_managers/deb/sdk.py b/meta/lib/oe/package_managers/deb/sdk.py
new file mode 100644
index 0000000000..67e5f02d3c
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/sdk.py
@@ -0,0 +1,98 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.utils import execute_pre_post_process
+from oe.sdk import Sdk
+from oe.manifest import Manifest
+from oe.package_manager import DpkgPM
+import shutil
+
+class DpkgSdk(Sdk):
+    def __init__(self, d, manifest_dir=None):
+        super(DpkgSdk, self).__init__(d, manifest_dir)
+
+        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
+        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
+
+        from oe.package_managers.deb.manifest import DpkgManifest
+
+        self.target_manifest = DpkgManifest(d, self.manifest_dir,
+                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = DpkgManifest(d, self.manifest_dir,
+                                          Manifest.MANIFEST_TYPE_SDK_HOST)
+
+        deb_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            deb_repo_workdir = "oe-sdk-ext-repo"
+
+        self.target_pm = DpkgPM(d, self.sdk_target_sysroot,
+                                self.d.getVar("PACKAGE_ARCHS"),
+                                self.d.getVar("DPKG_ARCH"),
+                                self.target_conf_dir,
+                                deb_repo_workdir=deb_repo_workdir)
+
+        self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
+                              self.d.getVar("SDK_PACKAGE_ARCHS"),
+                              self.d.getVar("DEB_SDK_ARCH"),
+                              self.host_conf_dir,
+                              deb_repo_workdir=deb_repo_workdir)
+
+    def _copy_apt_dir_to(self, dst_dir):
+        staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE")
+
+        self.remove(dst_dir, True)
+
+        shutil.copytree(os.path.join(staging_etcdir_native, "apt"), dst_dir)
+
+    def _populate_sysroot(self, pm, manifest):
+        pkgs_to_install = manifest.parse_initial_manifest()
+
+        pm.write_index()
+        pm.update()
+
+        for pkg_type in self.install_order:
+            if pkg_type in pkgs_to_install:
+                pm.install(pkgs_to_install[pkg_type],
+                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+
+    def _populate(self):
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
+
+        bb.note("Installing TARGET packages")
+        self._populate_sysroot(self.target_pm, self.target_manifest)
+
+        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
+
+        self.target_pm.run_intercepts(populate_sdk='target')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
+
+        self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc", "apt"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.target_pm.remove_packaging_data()
+
+        bb.note("Installing NATIVESDK packages")
+        self._populate_sysroot(self.host_pm, self.host_manifest)
+        self.install_locales(self.host_pm)
+
+        self.host_pm.run_intercepts(populate_sdk='host')
+
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
+
+        self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_native_path,
+                                           "etc", "apt"))
+
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
+
+        native_dpkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
+                                             "var", "lib", "dpkg")
+        self.mkdirhier(native_dpkg_state_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "dpkg", "*")):
+            self.movefile(f, native_dpkg_state_dir)
+        self.remove(os.path.join(self.sdk_output, "var"), True)
+
+
+
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 6907d3a6d8..eb70a87832 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -110,92 +110,6 @@ class Sdk(object, metaclass=ABCMeta):
             pass
 
 
-class DpkgSdk(Sdk):
-    def __init__(self, d, manifest_dir=None):
-        super(DpkgSdk, self).__init__(d, manifest_dir)
-
-        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
-        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
-
-        self.target_manifest = DpkgManifest(d, self.manifest_dir,
-                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = DpkgManifest(d, self.manifest_dir,
-                                          Manifest.MANIFEST_TYPE_SDK_HOST)
-
-        deb_repo_workdir = "oe-sdk-repo"
-        if "sdk_ext" in d.getVar("BB_RUNTASK"):
-            deb_repo_workdir = "oe-sdk-ext-repo"
-
-        self.target_pm = DpkgPM(d, self.sdk_target_sysroot,
-                                self.d.getVar("PACKAGE_ARCHS"),
-                                self.d.getVar("DPKG_ARCH"),
-                                self.target_conf_dir,
-                                deb_repo_workdir=deb_repo_workdir)
-
-        self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
-                              self.d.getVar("SDK_PACKAGE_ARCHS"),
-                              self.d.getVar("DEB_SDK_ARCH"),
-                              self.host_conf_dir,
-                              deb_repo_workdir=deb_repo_workdir)
-
-    def _copy_apt_dir_to(self, dst_dir):
-        staging_etcdir_native = self.d.getVar("STAGING_ETCDIR_NATIVE")
-
-        self.remove(dst_dir, True)
-
-        shutil.copytree(os.path.join(staging_etcdir_native, "apt"), dst_dir)
-
-    def _populate_sysroot(self, pm, manifest):
-        pkgs_to_install = manifest.parse_initial_manifest()
-
-        pm.write_index()
-        pm.update()
-
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
-
-    def _populate(self):
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
-
-        bb.note("Installing TARGET packages")
-        self._populate_sysroot(self.target_pm, self.target_manifest)
-
-        self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
-
-        self.target_pm.run_intercepts(populate_sdk='target')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
-
-        self._copy_apt_dir_to(os.path.join(self.sdk_target_sysroot, "etc", "apt"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.target_pm.remove_packaging_data()
-
-        bb.note("Installing NATIVESDK packages")
-        self._populate_sysroot(self.host_pm, self.host_manifest)
-        self.install_locales(self.host_pm)
-
-        self.host_pm.run_intercepts(populate_sdk='host')
-
-        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_HOST_COMMAND"))
-
-        self._copy_apt_dir_to(os.path.join(self.sdk_output, self.sdk_native_path,
-                                           "etc", "apt"))
-
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.host_pm.remove_packaging_data()
-
-        native_dpkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
-                                             "var", "lib", "dpkg")
-        self.mkdirhier(native_dpkg_state_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "dpkg", "*")):
-            self.movefile(f, native_dpkg_state_dir)
-        self.remove(os.path.join(self.sdk_output, "var"), True)
-
-
-
 def sdk_list_installed_packages(d, target, rootfs_dir=None):
     if rootfs_dir is None:
         sdk_output = d.getVar('SDK_OUTPUT')
@@ -220,6 +134,7 @@ def populate_sdk(d, manifest_dir=None):
     img_type = d.getVar('IMAGE_PKGTYPE')
     from oe.package_managers.rpm.sdk import RpmSdk
     from oe.package_managers.ipk.sdk import OpkgSdk
+    from oe.package_managers.deb.sdk import DpkgSdk
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
     elif img_type == "ipk":
-- 
2.20.1

