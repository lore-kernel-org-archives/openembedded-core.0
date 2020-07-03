Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.8471.1593776656492055066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Yhel0IZX;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7925; q=dns/txt; s=axis-central1;
  t=1593776657; x=1625312657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vNJ7hg+WhH48xJRWSI8Xo1d4xLeL+mNDkPrVUdDi6+s=;
  b=Yhel0IZXJZa88TnJ5MUa2Ek/GRMeeJWzcxbc0uVwrKST2a8VKOCzTP4z
   4HAiJke8JRrmcQKzPo8eMglT/RS5CzzTeF0LWEy9SVGcLhE70Gh8/ihsd
   uCQ8DIFqmtbHM3675rPMvR3OaB0QYRqiWXwvxx8YxzkZGHdVVqgz4lrKk
   zg/3hbBvPIfHKtdsmoueU378ZXw2k6PmOiWLVdNYKoZruKPWcm/tPl9yu
   iFgOemFYapCgIYitj+g72JqJwj35rsecLB5kkdCi1usS9Mxt4Er9vcy/g
   SWamni5V5EmR1d80WKZEk2nInfsYWofKtIEhOy//OjEBqBk6IkAfUK0VQ
   A==;
IronPort-SDR: Crc5Goz9ee3kWFfE+pHzee9rPJ+Am43qh2bsa3s8P6Hm5JgCNDGx34hlu5P8oDGEwFq5iAAg5x
 oKgSWFzMn8bTRE+90cA8q+/NRzm8Xz5MSviI3g9PM+P5Z/T03VP7/3s/aPJl5UETy0phYH+371
 M/UDSQnRQRsSQBJDkewDQ8SRJWXanFOfBoUSPOYzfZmFEHUr6n4agQvUZ386mop3LXxM4K9Q6o
 k11iU+EEgzfM3V6LGpb4aNivN95LiyqIVTea0kl3Fzao+1L6QTHTMHagzLEOykLX/C90D/ZpR5
 whU=
X-IronPort-AV: E=Sophos;i="5.75,308,1589234400"; 
   d="scan'208";a="10163729"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v4 08/12] Move ipk sdk to its own dir
Date: Fri, 3 Jul 2020 13:43:58 +0200
Message-ID: <20200703114402.8850-9-fredrigu@axis.com>
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
 meta/lib/oe/package_managers/ipk/sdk.py | 98 +++++++++++++++++++++++++
 meta/lib/oe/sdk.py                      | 87 +---------------------
 2 files changed, 99 insertions(+), 86 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/ipk/sdk.py

diff --git a/meta/lib/oe/package_managers/ipk/sdk.py b/meta/lib/oe/package_managers/ipk/sdk.py
new file mode 100644
index 0000000000..1ec0eb31d0
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/sdk.py
@@ -0,0 +1,98 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.utils import execute_pre_post_process
+from oe.sdk import Sdk
+from oe.manifest import Manifest
+from oe.package_manager import OpkgPM
+import shutil
+import glob
+
+class OpkgSdk(Sdk):
+    def __init__(self, d, manifest_dir=None):
+        super(OpkgSdk, self).__init__(d, manifest_dir)
+
+        self.target_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.host_conf = self.d.getVar("IPKGCONF_SDK")
+
+        from oe.package_managers.ipk.manifest import OpkgManifest
+        self.target_manifest = OpkgManifest(d, self.manifest_dir,
+                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = OpkgManifest(d, self.manifest_dir,
+                                          Manifest.MANIFEST_TYPE_SDK_HOST)
+
+        ipk_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            ipk_repo_workdir = "oe-sdk-ext-repo"
+
+        self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
+                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), 
+                                ipk_repo_workdir=ipk_repo_workdir)
+
+        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
+                              self.d.getVar("SDK_PACKAGE_ARCHS"),
+                                ipk_repo_workdir=ipk_repo_workdir)
+
+    def _populate_sysroot(self, pm, manifest):
+        pkgs_to_install = manifest.parse_initial_manifest()
+
+        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") != "1":
+            pm.write_index()
+
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
+        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
+            self.host_pm.remove_packaging_data()
+
+        target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
+        host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
+
+        self.mkdirhier(target_sysconfdir)
+        shutil.copy(self.target_conf, target_sysconfdir)
+        os.chmod(os.path.join(target_sysconfdir,
+                              os.path.basename(self.target_conf)), 0o644)
+
+        self.mkdirhier(host_sysconfdir)
+        shutil.copy(self.host_conf, host_sysconfdir)
+        os.chmod(os.path.join(host_sysconfdir,
+                              os.path.basename(self.host_conf)), 0o644)
+
+        native_opkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
+                                             self.d.getVar('localstatedir_nativesdk').strip('/'),
+                                             "lib", "opkg")
+        self.mkdirhier(native_opkg_state_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "opkg", "*")):
+            self.movefile(f, native_opkg_state_dir)
+
+        self.remove(os.path.join(self.sdk_output, "var"), True)
+
+
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 29053e69ee..6907d3a6d8 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -110,92 +110,6 @@ class Sdk(object, metaclass=ABCMeta):
             pass
 
 
-class OpkgSdk(Sdk):
-    def __init__(self, d, manifest_dir=None):
-        super(OpkgSdk, self).__init__(d, manifest_dir)
-
-        self.target_conf = self.d.getVar("IPKGCONF_TARGET")
-        self.host_conf = self.d.getVar("IPKGCONF_SDK")
-
-        self.target_manifest = OpkgManifest(d, self.manifest_dir,
-                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = OpkgManifest(d, self.manifest_dir,
-                                          Manifest.MANIFEST_TYPE_SDK_HOST)
-
-        ipk_repo_workdir = "oe-sdk-repo"
-        if "sdk_ext" in d.getVar("BB_RUNTASK"):
-            ipk_repo_workdir = "oe-sdk-ext-repo"
-
-        self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
-                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), 
-                                ipk_repo_workdir=ipk_repo_workdir)
-
-        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
-                              self.d.getVar("SDK_PACKAGE_ARCHS"),
-                                ipk_repo_workdir=ipk_repo_workdir)
-
-    def _populate_sysroot(self, pm, manifest):
-        pkgs_to_install = manifest.parse_initial_manifest()
-
-        if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS') or "") != "1":
-            pm.write_index()
-
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
-        if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
-            self.host_pm.remove_packaging_data()
-
-        target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
-        host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
-
-        self.mkdirhier(target_sysconfdir)
-        shutil.copy(self.target_conf, target_sysconfdir)
-        os.chmod(os.path.join(target_sysconfdir,
-                              os.path.basename(self.target_conf)), 0o644)
-
-        self.mkdirhier(host_sysconfdir)
-        shutil.copy(self.host_conf, host_sysconfdir)
-        os.chmod(os.path.join(host_sysconfdir,
-                              os.path.basename(self.host_conf)), 0o644)
-
-        native_opkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
-                                             self.d.getVar('localstatedir_nativesdk').strip('/'),
-                                             "lib", "opkg")
-        self.mkdirhier(native_opkg_state_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "var", "lib", "opkg", "*")):
-            self.movefile(f, native_opkg_state_dir)
-
-        self.remove(os.path.join(self.sdk_output, "var"), True)
-
-
 class DpkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(DpkgSdk, self).__init__(d, manifest_dir)
@@ -305,6 +219,7 @@ def populate_sdk(d, manifest_dir=None):
 
     img_type = d.getVar('IMAGE_PKGTYPE')
     from oe.package_managers.rpm.sdk import RpmSdk
+    from oe.package_managers.ipk.sdk import OpkgSdk
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
     elif img_type == "ipk":
-- 
2.20.1

