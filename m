Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.18842.1595424693136719558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=euAxZZQ5;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7903; q=dns/txt; s=axis-central1;
  t=1595424694; x=1626960694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RlcbL9mRCeEuDrEVzXtPbZ8MWZSZE6Ic4sD70W5TD14=;
  b=euAxZZQ5rdus4AZOxLx+sE2kkJDu99A+K19A2FjfJ11eKWLCPS84rjsH
   STLjkRvEWZ+8dXAblV0MxF5hNOj0vNnxIoGkFtqYEAJnWycPwuFBL4+oS
   VABrY60xtm9Owk4uRhx0SVZNjsIazCGbS7zvwEUBQjGszgyHq9KWUGnV/
   tGDsuOD2ZBBmDsawUCS2VkJ1lSMrFTSGNQM4EkS7is+ZAch37ULnI5oZi
   /KsagksWPXuvfz1gl2oFIEvBdFcRYSWVzXAe0SJ/LHAFHtfRrkjnfyG+Z
   2O7lRR6ayERxIIiVjzkNT9M7YeX00N0t0CuctvzJjG7wxntbU1jH4n7SM
   A==;
IronPort-SDR: Zgt6jnDQILsWhqgPGkfoAO+Gwc97t3uzoaIaaZQ3M3aeKApvO73976N4Wkoz/HXLHKwhIUT5o3
 wms0hzTs6dPEqMwbM7BZb9RiZwN9V2phTI9kwpduJZIGxUthUgD4N12szeoopILLAKwXaFZ1pI
 3BO9rswB3L5wlV4r/nXvXZDvBWj0nX3Qpn0HeWsHwwLf3VWEbKtMjcH3XLw848Qc21fp19HKFI
 0qgVuwUz119JpGdQE2eVmduEjnqyJN6oXcajqDU3yRW/mc3sSt4QDIRVos89zqQ4uEtX3f+Te1
 ewI=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="11107588"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 08/13] rpm: Move sdk to its own dir
Date: Wed, 22 Jul 2020 15:31:15 +0200
Message-ID: <20200722133120.11484-9-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722133120.11484-1-fredrigu@axis.com>
References: <20200722133120.11484-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is part of a refactor that will split the package manager
code so that it's possible to use other package managers in other
layers.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager/rpm/sdk.py | 114 +++++++++++++++++++++++++
 meta/lib/oe/sdk.py                     | 106 +----------------------
 2 files changed, 115 insertions(+), 105 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/rpm/sdk.py

diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
new file mode 100644
index 0000000000..0d44b0ee6c
--- /dev/null
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -0,0 +1,114 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.utils import execute_pre_post_process
+from oe.sdk import Sdk
+from oe.manifest import Manifest
+from oe.package_manager import RpmPM
+import glob
+
+class RpmSdk(Sdk):
+    def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
+        super(RpmSdk, self).__init__(d, manifest_dir)
+
+        from oe.package_managers.rpm.manifest import RpmManifest
+        self.target_manifest = RpmManifest(d, self.manifest_dir,
+                                           Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = RpmManifest(d, self.manifest_dir,
+                                         Manifest.MANIFEST_TYPE_SDK_HOST)
+
+        rpm_repo_workdir = "oe-sdk-repo"
+        if "sdk_ext" in d.getVar("BB_RUNTASK"):
+            rpm_repo_workdir = "oe-sdk-ext-repo"
+
+        self.target_pm = RpmPM(d,
+                               self.sdk_target_sysroot,
+                               self.d.getVar('TARGET_VENDOR'),
+                               'target',
+                               rpm_repo_workdir=rpm_repo_workdir
+                               )
+
+        self.host_pm = RpmPM(d,
+                             self.sdk_host_sysroot,
+                             self.d.getVar('SDK_VENDOR'),
+                             'host',
+                             "SDK_PACKAGE_ARCHS",
+                             "SDK_OS",
+                             rpm_repo_workdir=rpm_repo_workdir
+                             )
+
+    def _populate_sysroot(self, pm, manifest):
+        pkgs_to_install = manifest.parse_initial_manifest()
+
+        pm.create_configs()
+        pm.write_index()
+        pm.update()
+
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                pkgs_attempt += pkgs_to_install[pkg_type]
+            else:
+                pkgs += pkgs_to_install[pkg_type]
+
+        pm.install(pkgs)
+
+        pm.install(pkgs_attempt, True)
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
+        # Move host RPM library data
+        native_rpm_state_dir = os.path.join(self.sdk_output,
+                                            self.sdk_native_path,
+                                            self.d.getVar('localstatedir_nativesdk').strip('/'),
+                                            "lib",
+                                            "rpm"
+                                            )
+        self.mkdirhier(native_rpm_state_dir)
+        for f in glob.glob(os.path.join(self.sdk_output,
+                                        "var",
+                                        "lib",
+                                        "rpm",
+                                        "*")):
+            self.movefile(f, native_rpm_state_dir)
+
+        self.remove(os.path.join(self.sdk_output, "var"), True)
+
+        # Move host sysconfig data
+        native_sysconf_dir = os.path.join(self.sdk_output,
+                                          self.sdk_native_path,
+                                          self.d.getVar('sysconfdir',
+                                                        True).strip('/'),
+                                          )
+        self.mkdirhier(native_sysconf_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
+            self.movefile(f, native_sysconf_dir)
+        for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
+            self.movefile(f, native_sysconf_dir)
+        self.remove(os.path.join(self.sdk_output, "etc"), True)
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d02a274812..29053e69ee 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -110,111 +110,6 @@ class Sdk(object, metaclass=ABCMeta):
             pass
 
 
-class RpmSdk(Sdk):
-    def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
-        super(RpmSdk, self).__init__(d, manifest_dir)
-
-        self.target_manifest = RpmManifest(d, self.manifest_dir,
-                                           Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = RpmManifest(d, self.manifest_dir,
-                                         Manifest.MANIFEST_TYPE_SDK_HOST)
-
-        rpm_repo_workdir = "oe-sdk-repo"
-        if "sdk_ext" in d.getVar("BB_RUNTASK"):
-            rpm_repo_workdir = "oe-sdk-ext-repo"
-
-        self.target_pm = RpmPM(d,
-                               self.sdk_target_sysroot,
-                               self.d.getVar('TARGET_VENDOR'),
-                               'target',
-                               rpm_repo_workdir=rpm_repo_workdir
-                               )
-
-        self.host_pm = RpmPM(d,
-                             self.sdk_host_sysroot,
-                             self.d.getVar('SDK_VENDOR'),
-                             'host',
-                             "SDK_PACKAGE_ARCHS",
-                             "SDK_OS",
-                             rpm_repo_workdir=rpm_repo_workdir
-                             )
-
-    def _populate_sysroot(self, pm, manifest):
-        pkgs_to_install = manifest.parse_initial_manifest()
-
-        pm.create_configs()
-        pm.write_index()
-        pm.update()
-
-        pkgs = []
-        pkgs_attempt = []
-        for pkg_type in pkgs_to_install:
-            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
-                pkgs_attempt += pkgs_to_install[pkg_type]
-            else:
-                pkgs += pkgs_to_install[pkg_type]
-
-        pm.install(pkgs)
-
-        pm.install(pkgs_attempt, True)
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
-        # Move host RPM library data
-        native_rpm_state_dir = os.path.join(self.sdk_output,
-                                            self.sdk_native_path,
-                                            self.d.getVar('localstatedir_nativesdk').strip('/'),
-                                            "lib",
-                                            "rpm"
-                                            )
-        self.mkdirhier(native_rpm_state_dir)
-        for f in glob.glob(os.path.join(self.sdk_output,
-                                        "var",
-                                        "lib",
-                                        "rpm",
-                                        "*")):
-            self.movefile(f, native_rpm_state_dir)
-
-        self.remove(os.path.join(self.sdk_output, "var"), True)
-
-        # Move host sysconfig data
-        native_sysconf_dir = os.path.join(self.sdk_output,
-                                          self.sdk_native_path,
-                                          self.d.getVar('sysconfdir',
-                                                        True).strip('/'),
-                                          )
-        self.mkdirhier(native_sysconf_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
-            self.movefile(f, native_sysconf_dir)
-        for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
-            self.movefile(f, native_sysconf_dir)
-        self.remove(os.path.join(self.sdk_output, "etc"), True)
-
-
 class OpkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(OpkgSdk, self).__init__(d, manifest_dir)
@@ -409,6 +304,7 @@ def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE')
+    from oe.package_managers.rpm.sdk import RpmSdk
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
     elif img_type == "ipk":
-- 
2.20.1

