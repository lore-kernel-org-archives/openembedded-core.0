Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.4352.1593718151682783662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 12:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bnYGSNR0;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3351; q=dns/txt; s=axis-central1;
  t=1593718153; x=1625254153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l4ehc/dfIoNssLHKrEraXa9iNWxWREyMF7kAzjsJnhA=;
  b=bnYGSNR0pGfWBUUzyVRBtwBvbAKHniDLR5fHFr0t2Ka4x5EwfSmXachu
   GfZY5uRsFrRPiN6knhvTEvNoLUWJQ0ZhhMQWFB/mCe1xEyD8ubYhdL4xo
   syfehR37kt/RTvM2+ExqrwznDfhKCuHWftqV9QjKOuQDx925xlDgh2uLC
   04ZV4fAp+nJEru47fwJh06C1y//t1SMFUhRRdpaRXoATx59U/ESfDXbuu
   fddDOLPMBPadZs5PNOqAa/jJrEzXzBe4WmOBi8bIGX+epYb1dEcUFgxOd
   Xea/4i4Fk2FzM6J4pTvpjHyBDxW66NhxjxjeOIBPQtU2i2ob15J5OSVbP
   Q==;
IronPort-SDR: UydMR+75yqhX54xJvLSbW1REp+pLAgRTruCKWLzwGAjGkAjQaN2ZE1nnNxXxyWNpVMkp/yt0m3
 77O5jWBQaEtNao5vkxcRTdiC3nR3+LxYdnYrRKmRO7iioGCJ8krRftD2ZciwMAyhx+81JIJiW1
 Mv3qq3259I1e7wB5/oHwIRyiZvF95r5iAE5s9mXrsh3wR8QgCoNPw8HFnX7KAZy5lt+Axm5SID
 z/9S2HlOL8c0IXb8djBIWTPODb5PPci6rNC7p4tQZL4wYBIfArI12MC6ih9ppvCtAjy7jDi7Qx
 eLg=
X-IronPort-AV: E=Sophos;i="5.75,305,1589234400"; 
   d="scan'208";a="10142576"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v3 3/3] Move deb manifest to its own subdir
Date: Thu, 2 Jul 2020 21:29:06 +0200
Message-ID: <20200702192906.6301-4-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200702192906.6301-1-fredrigu@axis.com>
References: <20200702192906.6301-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is a part of a refactor that will split the package manager
code so that it's possible to use other package managers in other
layers.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/manifest.py                      | 21 +---------------
 meta/lib/oe/package_managers/deb/__init__.py |  3 +++
 meta/lib/oe/package_managers/deb/manifest.py | 26 ++++++++++++++++++++
 meta/lib/oe/rootfs.py                        |  1 +
 4 files changed, 31 insertions(+), 20 deletions(-)
 create mode 100644 meta/lib/oe/package_managers/deb/__init__.py
 create mode 100644 meta/lib/oe/package_managers/deb/manifest.py

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 2678e12413..33d8c25aa9 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -188,32 +188,13 @@ class Manifest(object, metaclass=ABCMeta):
 
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
     from oe.package_managers.rpm.manifest import RpmManifest
     from oe.package_managers.ipk.manifest import OpkgManifest
+    from oe.package_managers.deb.manifest import DpkgManifest
     manifest_map = {'rpm': RpmManifest,
                     'ipk': OpkgManifest,
                     'deb': DpkgManifest}
diff --git a/meta/lib/oe/package_managers/deb/__init__.py b/meta/lib/oe/package_managers/deb/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_managers/deb/manifest.py b/meta/lib/oe/package_managers/deb/manifest.py
new file mode 100644
index 0000000000..0b12036644
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/manifest.py
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
index 283f52d068..675deac905 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -615,6 +615,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         bb.utils.remove(self.image_rootfs, True)
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        from oe.package_managers.deb.manifest import DpkgManifest
         self.manifest = DpkgManifest(d, manifest_dir)
         self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
                          d.getVar('PACKAGE_ARCHS'),
-- 
2.20.1

