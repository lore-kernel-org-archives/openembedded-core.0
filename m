Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7474.1593080529844279544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=COldXMbS;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7904; q=dns/txt; s=axis-central1;
  t=1593080530; x=1624616530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G/duVX0E8lFIts7de3un0nbVctnpqoecEkPSAq23zHs=;
  b=COldXMbS8ueM3fOEUiaug06sHcWc1MXv8OcFO+fWN9M8saCcYngzY68b
   U4hbn0jCR1HFrSvXtzzXMdZ6x11RfW19ijkGpLczY7A262Tk4/arOb8KI
   jVJjgiwAAFOdsch50Ww2TrOxf0IMuk6OXcndP8uFpUt1Co3G2j93GegOM
   vT+V+AFAjRRJe1+3T72R749T+YJL3gSYVe4Jk5sv9S2bnnPj0H8tAtzj6
   IzIvqIEHiq4dGwYSvQ/gImQlYy6xTQmq11rXfkIW2lev1M4Hz1fwQRe29
   kmjNePQsmCHEnyRzYtp/dnwHmhrHLo/AlYk7QnYrWNN7mwfeRRPuyJZvk
   Q==;
IronPort-SDR: EwtCyUM0HDH27i2/Jgf3rsn6HE1vX+EOgiGErRXPKSS2omyf7wbCAS9rLV2zZJ8OvshZUE7UlZ
 fVBiOJxlV6djnaEhbMlfDyCB+Dr9//yFyIjEXXsn8GRoy0Aq6A46BduWwhteaVH6deMoppu4ec
 fRkjppSNA8fvW5jr8Xnc9HcaDc2noEa0TF+mRS+bpk3ggbEcOAY7PrWyEwlYeNRPZGXyXpKfi+
 T8CRc2lsLMjaqcQ2VuIx2mhpbjgBdbk8AD+c61s0fiXsbCvRrDPYYRIo4aYFmXEAjW8kpQ2MI2
 3zs=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185332"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 09/26] sdk.py: Move OpkgSdk
Date: Thu, 25 Jun 2020 12:21:28 +0200
Message-ID: <20200625102145.7139-10-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the sdk only used by the ipk package manager live in the ipk
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/ipk/sdk.py | 93 +++++++++++++++++++++++++
 meta/lib/oe/sdk.py                      | 84 +---------------------
 2 files changed, 94 insertions(+), 83 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/ipk/sdk.py

diff --git a/meta/lib/oe/package_managers/ipk/sdk.py b/meta/lib/oe/package_managers/ipk/sdk.py
new file mode 100644
index 0000000000..4862616c08
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/sdk.py
@@ -0,0 +1,93 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.sdk import *
+from oe.package_managers.ipk.manifest import *
+
+class OpkgSdk(Sdk):
+    def __init__(self, d, manifest_dir=None):
+        super(OpkgSdk, self).__init__(d, manifest_dir)
+
+        self.target_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.host_conf = self.d.getVar("IPKGCONF_SDK")
+
+        self.target_manifest = PkgManifest(d, self.manifest_dir,
+                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = PkgManifest(d, self.manifest_dir,
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
index a52055a505..d8a00c04d1 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -109,89 +109,6 @@ class Sdk(object, metaclass=ABCMeta):
             # No linguas so do nothing
             pass
 
-
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
-        import importlib
-        self.target_manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, self.sdk_target_sysroot, self.target_conf, self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), ipk_repo_workdir=ipk_repo_workdir)
-        self.host_manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, self.sdk_host_sysroot, self.host_conf, self.d.getVar("SDK_PACKAGE_ARCHS"), ipk_repo_workdir=ipk_repo_workdir)
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
 def sdk_list_installed_packages(d, target, rootfs_dir=None):
     if rootfs_dir is None:
         sdk_output = d.getVar('SDK_OUTPUT')
@@ -216,6 +133,7 @@ def populate_sdk(d, manifest_dir=None):
     img_type = d.getVar('IMAGE_PKGTYPE')
 
     from oe.package_managers.rpm.sdk import RpmSdk
+    from oe.package_managers.ipk.sdk import OpkgSdk
     from oe.package_managers.deb.sdk import DpkgSdk
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
-- 
2.20.1

