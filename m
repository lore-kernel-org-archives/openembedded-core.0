Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.7376.1593080528376404276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=ZWufZqHO;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7552; q=dns/txt; s=axis-central1;
  t=1593080529; x=1624616529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UDJQ1sn6wL2m/1Pa+M+ncoeIV5DiKs8R+YYYG6Sm6/o=;
  b=ZWufZqHO3QZi7Adr7ua06gbsomkjpZw+VgJPczYKS3hcvfyrntyppj8k
   VZaBkvVWS+5VFr2shPt6X8TUIJcZg9paKG3HFVnZrz0WMC6DlmFCKbOvD
   PHRGXZCbjW2m5VMY5yzK8JhBfXRzbSTXgG1YlnhZPUyOA7feP8HyS/XH2
   RDQQq0SvrwxppVIsvZSkJmJWoMD/75mz1cPucoxkkUuV+vlxq46NGKIqQ
   CVLCwTLcxHUJUxXN4t6TJskmc8y7inpj9QKNiZuLBCSQXt1jI1lg8cO41
   qpKAbKGVNrdxsUwu/wMnO7QqVDPo4EY66DGmklIG7JJoMTHjahuOcfl3a
   Q==;
IronPort-SDR: iB4BNz8fQpx9eZGEVyoplhm42rje7x9VDgNQc9HVs+IeyD/qAvYqj7CwcywkgYxDKk8eXzscsJ
 1+UWVBdZm5VQB46J/AvtOyhrFN7ZfRSIwVOaWtNfoIkQxmBwCLBwh/LF77qzUpU+UF4zV3Sb0n
 8JmMs7dJTzMvKiyHr6W1zZjhpbs9E5R1ccoVHjrmgBQ5bt+DRy/7X8nVP89IOlY4ik364HVSnl
 GnjHYcw32gCUQBQWh837CgfJirmd/HdVreWqBaL/eTAoFVxqKUilRnmKE6oL6CyncCcLJejCbO
 LMg=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893883"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 06/26] manifest.py: Dynamic load of manifest
Date: Thu, 25 Jun 2020 12:21:25 +0200
Message-ID: <20200625102145.7139-7-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Decide which manifest we should load in run time without any hard coded
values but look at which package type that is used.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/manifest.py                      | 10 ++------
 meta/lib/oe/package_managers/deb/manifest.py |  2 +-
 meta/lib/oe/package_managers/ipk/manifest.py |  2 +-
 meta/lib/oe/package_managers/rpm/manifest.py |  2 +-
 meta/lib/oe/rootfs.py                        | 13 +++++-----
 meta/lib/oe/sdk.py                           | 27 +++++++-------------
 6 files changed, 20 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index d93edfcac5..a8d14244c0 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -190,14 +190,8 @@ class Manifest(object, metaclass=ABCMeta):
 
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
-    from oe.package_managers.rpm.manifest import RpmManifest
-    from oe.package_managers.ipk.manifest import OpkgManifest
-    from oe.package_managers.deb.manifest import DpkgManifest
-    manifest_map = {'rpm': RpmManifest,
-                    'ipk': OpkgManifest,
-                    'deb': DpkgManifest}
-
-    manifest = manifest_map[d.getVar('IMAGE_PKGTYPE')](d, manifest_dir, manifest_type)
+    import importlib
+    manifest = importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.manifest').PkgManifest(d, manifest_dir, manifest_type)
 
     if final_manifest:
         manifest.create_final()
diff --git a/meta/lib/oe/package_managers/deb/manifest.py b/meta/lib/oe/package_managers/deb/manifest.py
index 9b186555dc..5daf709e6c 100644
--- a/meta/lib/oe/package_managers/deb/manifest.py
+++ b/meta/lib/oe/package_managers/deb/manifest.py
@@ -4,7 +4,7 @@
 
 from oe.manifest import *
 
-class DpkgManifest(Manifest):
+class PkgManifest(Manifest):
     def create_initial(self):
         with open(self.initial_manifest, "w+") as manifest:
             manifest.write(self.initial_manifest_file_header)
diff --git a/meta/lib/oe/package_managers/ipk/manifest.py b/meta/lib/oe/package_managers/ipk/manifest.py
index be87f3d1b7..cf3097224f 100644
--- a/meta/lib/oe/package_managers/ipk/manifest.py
+++ b/meta/lib/oe/package_managers/ipk/manifest.py
@@ -4,7 +4,7 @@
 
 from oe.manifest import *
 
-class OpkgManifest(Manifest):
+class PkgManifest(Manifest):
     """
     Returns a dictionary object with mip and mlp packages.
     """
diff --git a/meta/lib/oe/package_managers/rpm/manifest.py b/meta/lib/oe/package_managers/rpm/manifest.py
index a225ee7a23..801e50e8b6 100644
--- a/meta/lib/oe/package_managers/rpm/manifest.py
+++ b/meta/lib/oe/package_managers/rpm/manifest.py
@@ -4,7 +4,7 @@
 
 from oe.manifest import *
 
-class RpmManifest(Manifest):
+class PkgManifest(Manifest):
     """
     Returns a dictionary object with mip and mlp packages.
     """
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ab10edfec0..c3cfb58493 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -12,7 +12,6 @@ import os
 import subprocess
 import re
 
-
 class Rootfs(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -359,8 +358,8 @@ class RpmRootfs(Rootfs):
         self.log_check_regex = r'(unpacking of archive failed|Cannot find package'\
                                r'|exit 1|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
-        from oe.package_managers.rpm.manifest import RpmManifest
-        self.manifest = RpmManifest(d, manifest_dir)
+        import importlib
+        self.manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
                         d.getVar('IMAGE_ROOTFS'),
@@ -614,8 +613,8 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-        from oe.package_managers.deb.manifest import DpkgManifest
-        self.manifest = DpkgManifest(d, manifest_dir)
+        import importlib
+        self.manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, manifest_dir)
         self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
                          d.getVar('PACKAGE_ARCHS'),
                          d.getVar('DPKG_ARCH'))
@@ -699,8 +698,8 @@ class OpkgRootfs(DpkgOpkgRootfs):
         super(OpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
         self.log_check_regex = '(exit 1|Collected errors)'
 
-        from oe.package_managers.ipk.manifest import OpkgManifest
-        self.manifest = OpkgManifest(d, manifest_dir)
+        import importlib
+        self.manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
 
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 70451a0b3a..18f6c16bd2 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -114,11 +114,9 @@ class RpmSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
         super(RpmSdk, self).__init__(d, manifest_dir)
 
-        from oe.package_managers.rpm.manifest import RpmManifest
-        self.target_manifest = RpmManifest(d, self.manifest_dir,
-                                           Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = RpmManifest(d, self.manifest_dir,
-                                         Manifest.MANIFEST_TYPE_SDK_HOST)
+        import importlib
+        self.target_manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_HOST)
 
         rpm_repo_workdir = "oe-sdk-repo"
         if "sdk_ext" in d.getVar("BB_RUNTASK"):
@@ -232,14 +230,9 @@ class OpkgSdk(Sdk):
         if "sdk_ext" in d.getVar("BB_RUNTASK"):
             ipk_repo_workdir = "oe-sdk-ext-repo"
 
-        from oe.package_managers.ipk.manifest import OpkgManifest
-        self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
-                                self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), 
-                                ipk_repo_workdir=ipk_repo_workdir)
-
-        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
-                              self.d.getVar("SDK_PACKAGE_ARCHS"),
-                                ipk_repo_workdir=ipk_repo_workdir)
+        import importlib
+        self.target_manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, self.sdk_target_sysroot, self.target_conf, self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"), ipk_repo_workdir=ipk_repo_workdir)
+        self.host_manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, self.sdk_host_sysroot, self.host_conf, self.d.getVar("SDK_PACKAGE_ARCHS"), ipk_repo_workdir=ipk_repo_workdir)
 
     def _populate_sysroot(self, pm, manifest):
         pkgs_to_install = manifest.parse_initial_manifest()
@@ -310,11 +303,9 @@ class DpkgSdk(Sdk):
         self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
         self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
 
-        from oe.package_managers.deb.manifest import DpkgManifest
-        self.target_manifest = DpkgManifest(d, self.manifest_dir,
-                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
-        self.host_manifest = DpkgManifest(d, self.manifest_dir,
-                                          Manifest.MANIFEST_TYPE_SDK_HOST)
+        import importlib
+        self.target_manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_TARGET)
+        self.host_manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, self.manifest_dir, Manifest.MANIFEST_TYPE_SDK_HOST)
 
         deb_repo_workdir = "oe-sdk-repo"
         if "sdk_ext" in d.getVar("BB_RUNTASK"):
-- 
2.20.1

