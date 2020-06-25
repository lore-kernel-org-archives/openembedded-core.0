Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.7473.1593080529610313350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=h84KQ+qv;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=5226; q=dns/txt; s=axis-central1;
  t=1593080532; x=1624616532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YSBiJ7Fv02Cl7OAtpycnhyp9Z4jwcmFTkVTMzW2m1rE=;
  b=h84KQ+qvDuUkJJVLLzQ//vrSq0nimiA1Yvxmmg8UxVdhZO726dWdkO6O
   ixMT4/83Gu2VwUPdRPKlOHFZpVrhTx+5QNLIjgR8Ad90BgVGCOFtA60wN
   FuFfVYTex9y+U6AHCKs68uLDnDD6YZ5WKvfKI5IvQXC1tw6cSJAkuxHyI
   3UEcFCo6texDfi95WpC6QHPpsjs3taKlL2pNbGxq3BjPWoGcJYzv9TNjo
   NPnMqx11C3nwgHozUobyjeMXG4Lkj1Bp7oSWSehT2lWdYuVGHZhy3/DR9
   r2nvNW/UFVvFCfUVO9O6ywqn7hcV60lX9KtSwHWwxao8RT635rOruEW1u
   w==;
IronPort-SDR: VnVJD/RWPGcrtwvRC69p6SolipuPhS3XMkjUzSqM2e5t52y6O9jiRY45qfSbLyxqptauZx3/pO
 u010XtKHcqSjRNMS1X87gpFtIM67OWtALNrXUg60EZblm98Xvn1d7DgCEERN/1pZEi6qrkmIma
 i7QAWZcgkekKZ0ZmgeFiy3kM5ALYg1EJsSSkoPUeaUUAZwIyLVLti4vrsDawT8Pa3PaQKaq+Ab
 mXlAD3KUMi8n+mfBt+vTpqPkcqwcEfMVDhqmF+MSguDLikScheHPDY41l6gVvxWQBA08vFQrOD
 fdY=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893891"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 26/26] package_manager: Rename PkgsList classes
Date: Thu, 25 Jun 2020 12:21:45 +0200
Message-ID: <20200625102145.7139-27-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rename all *PkgsList classeds to PkgsList to enable dynamic calling.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 .../oe/package_managers/deb/package_manager.py    |  4 ++--
 .../oe/package_managers/ipk/package_manager.py    | 12 +++++++-----
 .../oe/package_managers/rpm/package_manager.py    |  2 +-
 meta/lib/oe/rootfs.py                             | 12 ++----------
 meta/lib/oe/sdk.py                                | 15 ++-------------
 5 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
index 0ef8e91eea..f33390d1cb 100644
--- a/meta/lib/oe/package_managers/deb/package_manager.py
+++ b/meta/lib/oe/package_managers/deb/package_manager.py
@@ -367,7 +367,7 @@ class PkgPM(OpkgDpkgPM):
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
 
     def list_installed(self):
-        return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
+        return PkgsList(self.d, self.target_rootfs).list_pkgs()
 
     def package_info(self, pkg):
         """
@@ -538,7 +538,7 @@ def opkg_query(cmd_output):
 
     return output
 
-class DpkgPkgsList(PkgsList):
+class PkgsList(PkgsList):
 
     def list_pkgs(self):
         cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
index 8e47003c93..e46b14ab31 100644
--- a/meta/lib/oe/package_managers/ipk/package_manager.py
+++ b/meta/lib/oe/package_managers/ipk/package_manager.py
@@ -333,7 +333,7 @@ class PkgPM(OpkgDpkgPM):
             bb.utils.remove(os.path.join(self.opkg_dir, "lists"), True)
 
     def list_installed(self):
-        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
+        return PkgsList(self.d, self.target_rootfs, self.config_file).list_pkgs()
 
     def dummy_install(self, pkgs):
         """
@@ -539,10 +539,12 @@ def opkg_query(cmd_output):
 
     return output
 
-class OpkgPkgsList(PkgsList):
-    def __init__(self, d, rootfs_dir, config_file):
-        super(OpkgPkgsList, self).__init__(d, rootfs_dir)
-
+class PkgsList(PkgsList):
+    def __init__(self, d, rootfs_dir, config_file = ""):
+        super(PkgsList, self).__init__(d, rootfs_dir)
+        
+        if config_file == "":
+            config_file = self.d.getVar('IPKGCONF_TARGET')
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
         self.opkg_args += self.d.getVar("OPKG_ARGS")
diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
index 57a5c9ec38..06b1921676 100644
--- a/meta/lib/oe/package_managers/rpm/package_manager.py
+++ b/meta/lib/oe/package_managers/rpm/package_manager.py
@@ -400,7 +400,7 @@ class PkgIndexer(RpmIndexer):
                         self.do_write_index(dir_path)
 
 
-class RpmPkgsList(PkgsList):
+class PkgsList(PkgsList):
     def list_pkgs(self):
         return PkgPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b71c93cf54..1f56225a18 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -370,16 +370,8 @@ def image_list_installed_packages(d, rootfs_dir=None):
     if not rootfs_dir:
         rootfs_dir = d.getVar('IMAGE_ROOTFS')
 
-    img_type = d.getVar('IMAGE_PKGTYPE')
-    from oe.package_managers.rpm.package_manager import RpmPkgsList
-    from oe.package_managers.ipk.package_manager import OpkgPkgsList
-    from oe.package_managers.deb.package_manager import DpkgPkgsList
-    if img_type == "rpm":
-        return RpmPkgsList(d, rootfs_dir).list_pkgs()
-    elif img_type == "ipk":
-        return OpkgPkgsList(d, rootfs_dir, d.getVar("IPKGCONF_TARGET")).list_pkgs()
-    elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
+    import importlib
+    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.package_manager').PkgsList(d, rootfs_dir).list_pkgs()
 
 if __name__ == "__main__":
     """
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 1fac0bed5b..7b17afde78 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -116,19 +116,8 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
-    from oe.package_managers.rpm.package_manager import RpmPkgsList
-    from oe.package_managers.ipk.package_manager import OpkgPkgsList
-    from oe.package_managers.deb.package_manager import DpkgPkgsList
-    img_type = d.getVar('IMAGE_PKGTYPE')
-    if img_type == "rpm":
-        arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
-        os_var = ["SDK_OS", None][target is True]
-        return RpmPkgsList(d, rootfs_dir).list_pkgs()
-    elif img_type == "ipk":
-        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
-        return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
-    elif img_type == "deb":
-        return DpkgPkgsList(d, rootfs_dir).list_pkgs()
+    import importlib
+    return importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.package_manager').PkgsList(d, rootfs_dir).list_pkgs()
 
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
-- 
2.20.1

