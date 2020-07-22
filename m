Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.18598.1595424694057962182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fJdFtq7v;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7916; q=dns/txt; s=axis-central1;
  t=1595424694; x=1626960694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zn0gsRGkg0xcs1YKT4mWFLNwq6eo1D8ykjwBfE+wGp0=;
  b=fJdFtq7vhAdSIVZUE5iRDaY0ZfPV2Y9KHRZVkqVUPFi2fDj0hVfYHjfF
   7ota5qqPkLtpF6De7eHZhvVCJtYTb3k6WaEb+MDfzJGxvsz7BzdSlziIR
   WMsiVkioGu7q85keVjK4hJfcyt3mjTv/Vz81V7boVh3ztspKBMNgdOiHw
   gY6/IKo4g3pY/dAqOdxS7XnY9QS2cys5bGzLAlaRsbzBABJcqHFQ86gJD
   GoZI+C5HbnEoe14oQCQCx7L3vWodf5geD/FBNi+7cv6VSCkf4J/3PoJ3Z
   Lzy8lizQBGmPEb1/3ZX94byZ61EZzq0rvZC3IIK3fhPsOvoh1/qb1Clw/
   w==;
IronPort-SDR: 8d5QKJI2A/Pb7ekHGlIDb4qvb3RpCwJPwgQr8LAomFqyOB0tEUFP0NFs4vUD3rXpA3tipil918
 UgVUAvlbqhyJ5/MMWGll9z6NxwF+FUgHF/eIVwfFb5cwdXyjRUh4pVGwyH/htA755yC1c3/BrX
 0uETIqWDvHhCijGpeRqEyLziqTtLwbS/ZEyJGWWwdduMosJp/uyzPCJ6WoqY3PhKIJ+PiKfqUj
 YlC4752hA/RBFpbecYg6xbCTZ+E6MaGjhBDVpdH/2FezjWXzYFY3iSyQMCnvcMOJpR7EqwPmnk
 L60=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="11107589"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 09/13] ipk: Move sdk to its own dir
Date: Wed, 22 Jul 2020 15:31:16 +0200
Message-ID: <20200722133120.11484-10-fredrigu@axis.com>
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
 meta/lib/oe/package_manager/ipk/sdk.py | 96 ++++++++++++++++++++++++++
 meta/lib/oe/sdk.py                     | 87 +----------------------
 2 files changed, 97 insertions(+), 86 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/ipk/sdk.py

diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
new file mode 100644
index 0000000000..a687ef4a06
--- /dev/null
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -0,0 +1,96 @@
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

