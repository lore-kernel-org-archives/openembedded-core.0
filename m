Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7521.1595601769281243979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NDl65Xta;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7739; q=dns/txt; s=axis-central1;
  t=1595601769; x=1627137769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U28xtLozXWqDB9vkakWAy0FrrD1X9Yn6Yxh+3M38nOs=;
  b=NDl65Xta4EfLhYj64bhOs9m+9rqNBJMW5YaGjMYHWMx6/AQlE722PL8g
   Z4cKuYcpN2x062jy8odcFrZ35fx4JqaOrsT5ARPekVKJ8qQ4ugq3yMYgU
   WL119Gi4wWqjTN/U33TyWN6eY8I75ZqwRmPQx6N5Yj23Wr+t8+ypa+JfT
   uzhVaBCfui4ds83YaThwNjsKJtnPI/j/ewJpX4gi6np2/ixj/4DnHbLOr
   dlkS/83LWYwYn6MqMmCNHh4On2GjS7n0bVKGVM4ZdcGnlDH9bBC8ouYpq
   kLLc5zQLbI5CGvyIZ3VqqGaFolf7xN9GhMwUcou9xlX528qR1HZr3+6jI
   w==;
IronPort-SDR: kCT7TN+qqbwjOIteyYOwHhlMQm00oJlTh9Z1Ji0CUJHvSHs5KUx5n5zQBWeSIYFGHeXv6LwsOI
 bLLDAhX/4EcTKSiTAIRsJyKi9MNjgM9wMpNcixyx1h5J4s+BbLt3bn3acWmmYUcpTX2xwIPH2B
 fR47PV7SEy3yicRVtbdNg68126Zqa2vZofx/sm/Fkv/ZSoYGbzoGo0DkPQHxwrodgYaYb9QeZY
 08A3/flJhsT3Ybgu5RSMapdbKRDKzOoLvoAp/zxtHZCigKX8Aw10ppDljJpB1Iyx1n8kXRNpN2
 brA=
X-IronPort-AV: E=Sophos;i="5.75,391,1589234400"; 
   d="scan'208";a="10868079"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v6 10/13] deb: Move sdk to its own dir
Date: Fri, 24 Jul 2020 16:42:38 +0200
Message-ID: <20200724144241.9977-11-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724144241.9977-1-fredrigu@axis.com>
References: <20200724144241.9977-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is a part of a refactor that will split the package manager
code so that it's possible to use other package managers in other
layers.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager/deb/sdk.py | 95 ++++++++++++++++++++++++++
 meta/lib/oe/sdk.py                     | 87 +----------------------
 2 files changed, 96 insertions(+), 86 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/deb/sdk.py

diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
new file mode 100644
index 0000000000..aafcd259e5
--- /dev/null
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -0,0 +1,95 @@
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
+        from oe.package_manager.deb.manifest import DpkgManifest
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
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 8b97f05a29..2f8cbd03d7 100644
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
     from oe.package_manager.rpm.sdk import RpmSdk
     from oe.package_manager.ipk.sdk import OpkgSdk
+    from oe.package_manager.deb.sdk import DpkgSdk
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
     elif img_type == "ipk":
-- 
2.20.1

