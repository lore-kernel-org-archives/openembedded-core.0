Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7471.1593080525989600401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=M5FWirLv;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3379; q=dns/txt; s=axis-central1;
  t=1593080526; x=1624616526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3qVa+jvWRPz6RIvLGOLyi+Lemg+lq47PdGjK1bA5XwQ=;
  b=M5FWirLvq7NFvaAoGezb4TQBwIVQI0rOxHOT2kb+GWX4AaU4EEte6VRH
   gEL9bvJHTvUvJgcInAbPHduV0/M4flhUcnsUhQMhydOkTlafDQ/ihulf2
   MIw/eksYNeEKEv8/I16M3p7xddXcP8K95aerzmr06uu46Ca7Rt+fcHXFS
   mpBNSg4vZ/UZp9KtrMyO6Whb9icj5vBIxKuj1oh4eFY4zrBsKJJJ3xzft
   B8/9LNlxl2VmtdV071aTc0WkkvQ1RhDKspqgLdC5CSRj771z2h19XjzRj
   O9ZMS+boTlXL2UNX+iuwXeEptN2CQ9Yhh4PcT2oRNs8b+LpTIeJf0VgsD
   A==;
IronPort-SDR: Wk0Mf771oJy/TvasVNIuOw0lqymX2QlLIfMCpnN3/v65wRktk0+xwf+Rbl0dXlEHIJ9Q7guLDB
 yqOp6z8hK+EjpWRS6LeUrEJrpt2andG6/SfoXVY1fJrtSHv0c5WEFiWDHy61Bmb/0Y2ZGNFJh6
 QypjpZp1MyDweqJemVecB+DYAYeiaMQW6cgDvgCWL27rZTqJ7KJDdaFIHklE9NOI3U7AOyGDrd
 Gcf8/sgXxCE1fTFGjPH/dDFG84YaMPUeh81weBJQhOxts2UW1KCjcG9iKi4p1AzCIW0h3jPssC
 kFk=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185330"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 04/26] manifest: Move DpkgManifest
Date: Thu, 25 Jun 2020 12:21:23 +0200
Message-ID: <20200625102145.7139-5-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the manifest only used by the dpkg package manager live in the dpkg
directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/manifest.py                      | 23 +----------------
 meta/lib/oe/package_managers/deb/manifest.py | 27 ++++++++++++++++++++
 meta/lib/oe/rootfs.py                        |  1 +
 meta/lib/oe/sdk.py                           |  1 +
 4 files changed, 30 insertions(+), 22 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/deb/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index cf2cbe22eb..db71766bb6 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -258,31 +258,10 @@ class OpkgManifest(Manifest):
         return
 
 
-class DpkgManifest(Manifest):
-    def create_initial(self):
-        with open(self.initial_manifest, "w+") as manifest:
-            manifest.write(self.initial_manifest_file_header)
-
-            for var in self.var_maps[self.manifest_type]:
-                pkg_list = self.d.getVar(var)
-
-                if pkg_list is None:
-                    continue
-
-                for pkg in pkg_list.split():
-                    manifest.write("%s,%s\n" %
-                                   (self.var_maps[self.manifest_type][var], pkg))
-
-    def create_final(self):
-        pass
-
-    def create_full(self, pm):
-        pass
-
-
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
     from oe.package_managers.rpm.manifest import RpmManifest
+    from oe.package_managers.deb.manifest import DpkgManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
diff --git a/meta/lib/oe/package_managers/deb/manifest.py b/meta/lib/oe/package_managers/deb/manifest.py
new file mode 100644
index 0000000000..9b186555dc
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/manifest.py
@@ -0,0 +1,27 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.manifest import *
+
+class DpkgManifest(Manifest):
+    def create_initial(self):
+        with open(self.initial_manifest, "w+") as manifest:
+            manifest.write(self.initial_manifest_file_header)
+
+            for var in self.var_maps[self.manifest_type]:
+                pkg_list = self.d.getVar(var)
+
+                if pkg_list is None:
+                    continue
+
+                for pkg in pkg_list.split():
+                    manifest.write("%s,%s\n" %
+                                   (self.var_maps[self.manifest_type][var], pkg))
+
+    def create_final(self):
+        pass
+
+    def create_full(self, pm):
+        pass
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index e920f944c4..7ff9b4e171 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -614,6 +614,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        from oe.package_managers.deb.manifest import DpkgManifest
         self.manifest = DpkgManifest(d, manifest_dir)
         self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
                          d.getVar('PACKAGE_ARCHS'),
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d543a2a92d..2ee46fe9cc 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -309,6 +309,7 @@ class DpkgSdk(Sdk):
         self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
         self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
 
+        from oe.package_managers.deb.manifest import DpkgManifest
         self.target_manifest = DpkgManifest(d, self.manifest_dir,
                                             Manifest.MANIFEST_TYPE_SDK_TARGET)
         self.host_manifest = DpkgManifest(d, self.manifest_dir,
-- 
2.20.1

