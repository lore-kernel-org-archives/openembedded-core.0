Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.7471.1593080525989600401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XozqsqSi;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7655; q=dns/txt; s=axis-central1;
  t=1593080527; x=1624616527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3lB5kYAcmdHwgv6RwyUT9h/SYszm5ouVR2l4DuoJ37w=;
  b=XozqsqSiL6Fu5vfmyyJd2A3TsVtdBf1rg6KxCVzDTRRV7DVc+RwMqZ/Y
   W5KuOmvuTE/YATCJbKs3EnWf+Fb2qxUnU1I5cPSwEX4/uk711I93Qq2m6
   n04UwPB4J8fc3TCeyqup6bMUNbaLvC+vDyUh1rZaaOqo9OfrpKnQoDUGu
   l8ZXb8DG44k99qT/d77zc+8o0ZzF05CB5hCYTjBay5GHVWSiITn97Op5J
   Fsi0FSDOWN274Apmezov7+uq/nUKDrovPSUQMfqKcw6BCM5AAuLfG1zt5
   d62/BCCn5E8fdQVkGWq3tzRVyqaeqZ/UTzWI1T/hZ6vo7ebu5Tdp35zG1
   Q==;
IronPort-SDR: f7//Kbs8l0xj206Rm4yB5G6dy+gcP1bfL0FmIULDcpMGSW4uBKxcvxHMMipfBwbxnSs4/uTRQT
 UpLFwNA/YcH/oCklR1y3Tv/3Sm/Xpnmg859zAoyeJdfwij4XItjO3XrzpxlGROLsaaTRhoCGJF
 Q1LV6IikpbIaI0XOpR60NS2IauJBNMsr0uCSUmYyg+3+g9F4vL5ZONMSjCxNFsGcrYR9eYrhKn
 IcHZLYyIj0YgOrImObxHAc7iZiDQoQgdCM6QaVyc2tkDpjKfSP9nEsBEWInw59j1dmN9z73s2C
 ZFM=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185331"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 08/26] sdk.py: Move DpkgSdk
Date: Thu, 25 Jun 2020 12:21:27 +0200
Message-ID: <20200625102145.7139-9-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the sdk only used by the dpkg package manager live in the dpkg
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/deb/sdk.py | 94 +++++++++++++++++++++++++
 meta/lib/oe/sdk.py                      | 86 +---------------------
 2 files changed, 95 insertions(+), 85 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/deb/sdk.py

diff --git a/meta/lib/oe/package_managers/deb/sdk.py b/meta/lib/oe/package_managers/deb/sdk.py
new file mode 100644
index 0000000000..154ec5ab17
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/sdk.py
@@ -0,0 +1,94 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.sdk import *
+from oe.package_managers.deb.manifest import *
+
+class DpkgSdk(Sdk):
+    def __init__(self, d, manifest_dir=None):
+        super(DpkgSdk, self).__init__(d, manifest_dir)
+
+        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
+        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
+
+        self.target_manifest = PkgManifest(d, self.manifest_dir,
+                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = PkgManifest(d, self.manifest_dir,
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
+
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 3df0d2f091..a52055a505 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -192,91 +192,6 @@ class OpkgSdk(Sdk):
         self.remove(os.path.join(self.sdk_output, "var"), True)
 
 
-class DpkgSdk(Sdk):
-    def __init__(self, d, manifest_dir=None):
-        super(DpkgSdk, self).__init__(d, manifest_dir)
-
-        self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
-        self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
-
-        import importlib
-        self.target_manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_HOST)
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
@@ -301,6 +216,7 @@ def populate_sdk(d, manifest_dir=None):
     img_type = d.getVar('IMAGE_PKGTYPE')
 
     from oe.package_managers.rpm.sdk import RpmSdk
+    from oe.package_managers.deb.sdk import DpkgSdk
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
     elif img_type == "ipk":
-- 
2.20.1

