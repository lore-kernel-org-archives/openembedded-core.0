Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.18842.1595424693136719558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cTyJSEBz;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7743; q=dns/txt; s=axis-central1;
  t=1595424693; x=1626960693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zdtQpziAfMIVsTZBQJ4i3VJ/0WCtBQnbHNQxyOQDh9U=;
  b=cTyJSEBzRQT6Jkd4/n5BFtW4vfxYunuBZNeMfq2inmz6ucoxQlD13rLk
   rB/JHYrmasswB9ww291W1n6kC5UzMIux3Q6ovWUfpczoxO9Dj1cMhtt+N
   HvTHqYa8QQ3lUu0NSc22Gy/j8Pw9akD0S7bkia/owlGtj/FE9SIQdRDi2
   IaZHTY0ICEaKBwii6XrboHRVkHqsvjKyk3qaPWdSMafrCIhpgAaRCR8wL
   exiEER5Cu+/7mKbk8/HcG1tzQBNqGhGde8zrnsdKKB2B9pY4gsdr4uyHJ
   JO2sm8j8BU/ff/FtfPfaVqYI2jg2PveQvchYtKcHS1AB3/Mk3nDAHFBjb
   A==;
IronPort-SDR: dUiJtWIrtgkY1GE7o4lS/pvhFj0Zxrl2ZDL6E3+J+oN0amAqIy0UrEFkvH10isjBgNq/KKGBub
 g8qnECBXP2YAbzjOPRYru7ySQh/BraZW15twmAHr26oLKToSRwtaGCIBYT/JPK0KiOMcu15v5n
 y2ruzjapcla1MFx+tRXKJf2Ut2rxbxYEu3/5lPHWkv4ChJEoVxtIYXRfnh41ZolYJ6OWtJolc5
 JI8G4LoHvP6ahEAAfHNyk2rRAQxNSHZV9YqclCyDz2VUn6I0bttqRwBPXJ2tLRpChZ4Xwcf05S
 wpE=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="11107586"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 10/13] deb: Move sdk to its own dir
Date: Wed, 22 Jul 2020 15:31:17 +0200
Message-ID: <20200722133120.11484-11-fredrigu@axis.com>
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
 meta/lib/oe/package_manager/deb/sdk.py | 95 ++++++++++++++++++++++++++
 meta/lib/oe/sdk.py                     | 87 +----------------------
 2 files changed, 96 insertions(+), 86 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/deb/sdk.py

diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
new file mode 100644
index 0000000000..26daed66a8
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

