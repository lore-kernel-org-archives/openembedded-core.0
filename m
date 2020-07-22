Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.18841.1595424690864242356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=P8xbbNr3;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3267; q=dns/txt; s=axis-central1;
  t=1595424692; x=1626960692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XRZeeg/2PHiMLqJ+Wb6QTkaO8R/rivlUEVra+vWPTW4=;
  b=P8xbbNr3VtaQq4s1Aeva6M78brYrKGe7opt58TsEYimJgdTOI+yuFU95
   yU+Nq0uDXgOAfvM7ILNwb+W4RiID2rlj1jqzycYGcnQvlgRUNlxKIfYDX
   FnasQrINxXBt9+VbRnwU+/rAEeO6pWWaDjSwzZKOBYE2WKdrAwuP16ytA
   kNZetcvgIDl+Fl0pWDKIagF/vRNoqykVRwP9lXLlFOlVg+/WrW4+n1TeK
   0FUvyyeijGr/ZCoxs4TN81KwMRtIMRspMe+E/C1NY/I+DM+wfHuZlYV2g
   Hy+twYDb/gfbeuEZazx8/38etmswE70ANLHB87eLZ5W5hYbnZ8Ui3bs2v
   A==;
IronPort-SDR: x+q779hDMux7JCgfSNQRZcYDBXH7voVoXL51URurlz4pTSv/G8JPTlwDuQyCQSLfgkhdBBhXFg
 DX71hv4oPQtn5cokMo6QwWhiexWnU5TFWtUaW84zmNOaPGTMIdTnZ38dW0jdIscnlcLTow/tnP
 47t+6dxyqzzNGOND8BZEgI8E2DrH5KO/AlDNvB3/R+r2GJmd0qwCA508G+RUpU5vZpPU3Fpo4w
 q4LbPXHv+NZD7gauYwIy8Z/zb+13zsSAUi9XwI/QX2hRykA9bUb3kHM36QFIPMimXueK6xtwc4
 8ww=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="11107584"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v5 04/13] deb: Move deb manifest to its own subdir
Date: Wed, 22 Jul 2020 15:31:11 +0200
Message-ID: <20200722133120.11484-5-fredrigu@axis.com>
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

