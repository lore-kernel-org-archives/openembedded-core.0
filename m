Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7567.1595601765962787650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=esj+rNLy;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3267; q=dns/txt; s=axis-central1;
  t=1595601766; x=1627137766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XRZeeg/2PHiMLqJ+Wb6QTkaO8R/rivlUEVra+vWPTW4=;
  b=esj+rNLySxpuaACK+EbvYeNNSoufr3mTxekYrAg8PvA08wDXKyaZcApn
   jWQUwTalU5JwUrtFcm44EtMdv2D8KCL5ODJ5SiRA+y5Q/O+XMsfOPmtyn
   bEaxOL5k3HUXKBR2z7hZrsQ/v6CzVj7xfLtSQOCJ+M+0xkr7QArJmMXxu
   YYf7JrFeOIj/oCPlWtoQafH12+lYTH+v7QblEGhI0wvU2IzUYRd56UmCb
   wOI6L2YZ+qFGigvZ6Ck0rBsOwiZr9ZpQntarGI7+OQFLSOjel6zw5Ty3U
   uqvJVspPqJvpcNmU3wdg93u53Q6I93vprB/xMtbWnxfXokRsbsqcyVBEh
   g==;
IronPort-SDR: eGzhMKI/6dYKIMNPw4+/wAzUmCF77Oyskp+hgxOGmRie1XMeZuVHIuCES4lieYawpWVS7mCLx5
 9piDuS3SPJuGD3H5gT8vVBo8myXZZB3jxvOYuT1aCvp79orfoN7imX7LiZXGHXRoowgK9ibPJ6
 ru9PAJE3ZlFpyr1fuZ2WyEJco8Di3x8y3hcdXRAjXpAG93gA5rDxRqEuuJvPsjrReRbdY0Fs+m
 IYOvig5tkyMeqOfVVY7AImcvrua+pFh7FPLoONzao0DLYx2gsG5un2UQ+0NAhowX7ll0IfIJOx
 iMY=
X-IronPort-AV: E=Sophos;i="5.75,391,1589234400"; 
   d="scan'208";a="11187077"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v6 04/13] deb: Move deb manifest to its own subdir
Date: Fri, 24 Jul 2020 16:42:32 +0200
Message-ID: <20200724144241.9977-5-fredrigu@axis.com>
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
 meta/lib/oe/manifest.py                     | 21 +----------------
 meta/lib/oe/package_manager/deb/__init__.py |  3 +++
 meta/lib/oe/package_manager/deb/manifest.py | 26 +++++++++++++++++++++
 meta/lib/oe/rootfs.py                       |  1 +
 4 files changed, 31 insertions(+), 20 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/deb/__init__.py
 create mode 100644 meta/lib/oe/package_manager/deb/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index f87c150d33..47bd622412 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -187,32 +187,13 @@ class Manifest(object, metaclass=ABCMeta):
 
         return installed_pkgs
 
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
 
 
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
     from oe.package_manager.rpm.manifest import RpmManifest
     from oe.package_manager.ipk.manifest import OpkgManifest
+    from oe.package_manager.deb.manifest import DpkgManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_manager/deb/manifest.py b/meta/lib/oe/package_manager/deb/manifest.py
new file mode 100644
index 0000000000..0b12036644
--- /dev/null
+++ b/meta/lib/oe/package_manager/deb/manifest.py
@@ -0,0 +1,26 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from oe.manifest import Manifest
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
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 1ba0a71253..876e13079c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -13,6 +13,7 @@ import subprocess
 import re
 from oe.package_manager.rpm.manifest import RpmManifest
 from oe.package_manager.ipk.manifest import OpkgManifest
+from oe.package_manager.deb.manifest import DpkgManifest
 
 class Rootfs(object, metaclass=ABCMeta):
     """
-- 
2.20.1

