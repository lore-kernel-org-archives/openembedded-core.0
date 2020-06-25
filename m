Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.7474.1593080529844279544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MhHTCVmP;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4179; q=dns/txt; s=axis-central1;
  t=1593080533; x=1624616533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AsVQebgd+oq7m0QmH4AQwKUyCGla4WhahyZjRrNhQI0=;
  b=MhHTCVmPJVjeJikspeHwIDpOp5XcvPfA7OHQ2VfN4VSyTiE0GR9rf4Ti
   aGXLnuKa6R4Qo07VNA/pSRHINV3WTZVX2sTUL+/7npx5vECcXt8MIFOjz
   jgmPGQJxiQK8PqOX+gdRCxmpIf1UIcFOREpMRzSW80yzsZzlWxREX4LwC
   Htw7vVDi7wPyu8p2rOwQqdHByC5d++RQ0PlEw1QT0dZ/Svk3utMCltrr4
   /ATvSfLYagoSHw/HSTno3v85KZHz6D7gORLwIKf0FV+aNDXNXOvDvbo4X
   FLO8+ENBom7RdoAvcHxfa4uJwsVEs+DoT4+sxxYwoLZgSmyoA3qa/kANV
   w==;
IronPort-SDR: yX8/hCHw7IWHAAAfj5oCWsVNWhpvPKQPkoGUbl3N5HhU3Be4bgHriW1ZgqREsdrB1Ph6rryNzX
 izF28HBGCiEJ2HdhsQqTUEzAAo2kuMmqG0RCkiZ3Capbw9Rhq5r2tXViVsPUkZ+mcKKZEkwBHD
 vwEgVUQ0k4mrCIDqy9W0WXhgTb/Fvc2oLJdxxipHRyazAXxW9lIv9bWXOQLDZepeOozopxP0hN
 nBHizZl64/Dy7MRAATszGmVnOvRRVF8cxBb9zCqTkMlL696nJReCXMPmOozRwmnovSQ/OCk3Qv
 DO8=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185340"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 20/26] package_manager.py: Move OpkgIndexer
Date: Thu, 25 Jun 2020 12:21:39 +0200
Message-ID: <20200625102145.7139-21-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the code that is only used by opkg package manager live in that
package manager owned directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                | 53 -------------------
 .../package_managers/ipk/package_manager.py   | 52 ++++++++++++++++++
 2 files changed, 52 insertions(+), 53 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b4d1a20bd6..83b881fb8c 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -150,59 +150,6 @@ class Indexer(object, metaclass=ABCMeta):
         pass
 
 
-class OpkgIndexer(Indexer):
-    def write_index(self):
-        arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
-                     "SDK_PACKAGE_ARCHS",
-                     ]
-
-        opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
-        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
-        else:
-            signer = None
-
-        if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
-            open(os.path.join(self.deploy_dir, "Packages"), "w").close()
-
-        index_cmds = set()
-        index_sign_files = set()
-        for arch_var in arch_vars:
-            archs = self.d.getVar(arch_var)
-            if archs is None:
-                continue
-
-            for arch in archs.split():
-                pkgs_dir = os.path.join(self.deploy_dir, arch)
-                pkgs_file = os.path.join(pkgs_dir, "Packages")
-
-                if not os.path.isdir(pkgs_dir):
-                    continue
-
-                if not os.path.exists(pkgs_file):
-                    open(pkgs_file, "w").close()
-
-                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
-
-                index_sign_files.add(pkgs_file)
-
-        if len(index_cmds) == 0:
-            bb.note("There are no packages in %s!" % self.deploy_dir)
-            return
-
-        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
-
-        if signer:
-            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
-            is_ascii_sig = (feed_sig_type.upper() != "BIN")
-            for f in index_sign_files:
-                signer.detach_sign(f,
-                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
-                                   armor=is_ascii_sig)
-
-
 class DpkgIndexer(Indexer):
     def _create_configs(self):
         bb.utils.mkdirhier(self.apt_conf_dir)
diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
index ad20196016..8abc6c1c98 100644
--- a/meta/lib/oe/package_managers/ipk/package_manager.py
+++ b/meta/lib/oe/package_managers/ipk/package_manager.py
@@ -423,4 +423,56 @@ class PkgPM(OpkgDpkgPM):
 
         return tmp_dir
 
+class OpkgIndexer(Indexer):
+    def write_index(self):
+        arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
+                     "SDK_PACKAGE_ARCHS",
+                     ]
+
+        opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
+        else:
+            signer = None
+
+        if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
+            open(os.path.join(self.deploy_dir, "Packages"), "w").close()
+
+        index_cmds = set()
+        index_sign_files = set()
+        for arch_var in arch_vars:
+            archs = self.d.getVar(arch_var)
+            if archs is None:
+                continue
+
+            for arch in archs.split():
+                pkgs_dir = os.path.join(self.deploy_dir, arch)
+                pkgs_file = os.path.join(pkgs_dir, "Packages")
+
+                if not os.path.isdir(pkgs_dir):
+                    continue
+
+                if not os.path.exists(pkgs_file):
+                    open(pkgs_file, "w").close()
+
+                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
+                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+
+                index_sign_files.add(pkgs_file)
+
+        if len(index_cmds) == 0:
+            bb.note("There are no packages in %s!" % self.deploy_dir)
+            return
+
+        oe.utils.multiprocess_launch(create_index, index_cmds, self.d)
+
+        if signer:
+            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
+            is_ascii_sig = (feed_sig_type.upper() != "BIN")
+            for f in index_sign_files:
+                signer.detach_sign(f,
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
+                                   armor=is_ascii_sig)
+
 
-- 
2.20.1

