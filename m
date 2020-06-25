Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.7634.1593080526167583199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=RhyMPOaK;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7841; q=dns/txt; s=axis-central1;
  t=1593080529; x=1624616529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yM7HmKmkdZlzajcD7lQ6mV29utQQJGRQBbyHP80bba0=;
  b=RhyMPOaK0nngp5LV+i+QLevxtxqfkQtRd4D0AykEppAskZ1eHKPnUo+7
   eFGffD/MHfQwk8resit4nGK8SP9kRT6tLzCj8oKJp/qX5Rs5nSagMm/C/
   06a3FZBBtpnaLss+SvofnJjwdhVuYowJY0KLQl8pROFuYO5iN3UkpfZzs
   tUAgLrAagPvIjRUxwAFnsImLyb2MK4hjnZcINpdMLR0hzkyARwALK2ZA+
   oNrUuvmEmDHmcrOn+wuFdYPv4AAP5nEpeKGK8jcFNW/+rAjsP7snrViA3
   lG5yTXMKgJsox5ATfTik2BCN9/bLWoqLXwNvPhRqKzayPDMJ5//9zec5O
   A==;
IronPort-SDR: bfLxIdUE/oY2hTLG4O6h5fFhgEowfI6rjgboAh84eS4a3TY7W1w3Xzohqaa4p1g/mnWDiy1PgD
 zcdbjiA/VZreEWuW8zat45SQNUB66ZgaMCJUbQqRYzRroycNNa2/gwkGcqdE2seUgwmUjtpl9d
 uDCGhXu6ZfwXamT9wcCuYa6DoTIjAUjjZrTdpZjD+h1ctlcc8gZHooRS33RTe0SCOmKMlChz/Y
 S5gwCEnsWqomRDLnuIu0il1znB3WydG2m9xVfQLwUwb9JUOI5MZ+lXrjJ/j9V50wQbt7ryEOSt
 mZo=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893884"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 07/26] sdk.py: Move RpmSdk
Date: Thu, 25 Jun 2020 12:21:26 +0200
Message-ID: <20200625102145.7139-8-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the sdk only used by the rpm package manager live in the rpm
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/rpm/sdk.py | 113 ++++++++++++++++++++++++
 meta/lib/oe/sdk.py                      | 106 +---------------------
 2 files changed, 115 insertions(+), 104 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/rpm/sdk.py

diff --git a/meta/lib/oe/package_managers/rpm/sdk.py b/meta/lib/oe/package_managers/rpm/sdk.py
new file mode 100644
index 0000000000..fc120b6171
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/sdk.py
@@ -0,0 +1,113 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.sdk import *
+from oe.package_managers.rpm.manifest import *
+
+class RpmSdk(Sdk):
+    def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
+        super(RpmSdk, self).__init__(d, manifest_dir)
+
+        self.target_manifest = PkgManifest(d, self.manifest_dir,
+                                           Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = PkgManifest(d, self.manifest_dir,
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
+
+
+
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 18f6c16bd2..3df0d2f091 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -110,110 +110,6 @@ class Sdk(object, metaclass=ABCMeta):
             pass
 
 
-class RpmSdk(Sdk):
-    def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
-        super(RpmSdk, self).__init__(d, manifest_dir)
-
-        import importlib
-        self.target_manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_HOST)
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
@@ -403,6 +299,8 @@ def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE')
+
+    from oe.package_managers.rpm.sdk import RpmSdk
     if img_type == "rpm":
         RpmSdk(d, manifest_dir).populate()
     elif img_type == "ipk":
-- 
2.20.1

