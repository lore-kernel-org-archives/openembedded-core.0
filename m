Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.7634.1593080526167583199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YXOqOHGE;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4450; q=dns/txt; s=axis-central1;
  t=1593080533; x=1624616533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2SpJys+GPO5Ve8EUchVphKQfwkdovsa0SNS27A+y17g=;
  b=YXOqOHGE27xda5Hittm7VCydsrWihiVtOmsQX+/OKHIiWuQ85kc28/jR
   h9368ahnuDKdjj7EuD/ntL55GQs3vPZ9Y4kyWCyKuaRSYUaLDYaDcQ07U
   kFDzagFqJVsjI8FYxohYRl1J6k2kyWyynY1FjW4VGf+v7vOKmPczfuLMv
   NeioCDk4L5H86nrqmPlLg/Ob+LzlvtfOrPwVx451WkbP04FRNqSYZvRl/
   dd+EKz0ysSD/3h3CRhk1PLB8oB+A8f6wyygy2EM4cj6dcrAzF9gesxS4B
   ShP3kdoOxyAh4M2R3G6QAGM6eWDH9lE7k28ieCCiBvH2vfnWeNYNATBPI
   w==;
IronPort-SDR: iFv4FWIhYP/+2BVQqRGn50A5DeeKTZTs4n1ZxoEyuADE5p2u5Q3IJM4s41XFPPHYZeiKI52C2d
 v/6KbcaZoVgpkpZEzk+eCzKFCvSY1k1eP3hN3Jsrzc6MTczXN5D0AHQxQrYLQmqnowNL715SZN
 svBdjZk2FhouCUSXA3VKgUdEjrUMEYOkayrMvFlIyUiOzZzY0lGDnTRfoDcNwzFIlYA4LLNUUL
 k4akcjWaeLBgmBWtXTluyfD+0RSxemXBu2an5bz//4B1xc19dSfvhiFbgstiwaA/Dqy0O1F2UL
 k7Y=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893892"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 22/26] package_manager: Rename Indexer classes
Date: Thu, 25 Jun 2020 12:21:41 +0200
Message-ID: <20200625102145.7139-23-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rename all *Indexer classeds to PkgIndexer to enable dynamic calling.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                | 22 +++++--------------
 .../package_managers/deb/package_manager.py   |  8 +++++--
 .../package_managers/ipk/package_manager.py   |  7 ++++--
 .../package_managers/rpm/package_manager.py   |  5 ++++-
 4 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 111845d903..bfddbce93c 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -149,8 +149,6 @@ class Indexer(object, metaclass=ABCMeta):
     def write_index(self):
         pass
 
-
-
 class PkgsList(object, metaclass=ABCMeta):
     def __init__(self, d, rootfs_dir):
         self.d = d
@@ -576,22 +574,12 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
                         raise
 
 def generate_index_files(d):
-    classes = d.getVar('PACKAGE_CLASSES').replace("package_", "").split()
-
-    indexer_map = {
-        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
-        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
-        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
-    }
-
+    classes = d.getVar('PACKAGE_CLASSES').split()
     result = None
 
     for pkg_class in classes:
-        if not pkg_class in indexer_map:
-            continue
-
-        if os.path.exists(indexer_map[pkg_class][1]):
-            result = indexer_map[pkg_class][0](d, indexer_map[pkg_class][1]).write_index()
+        import importlib
+        result = importlib.import_module('oe.package_managers.' + classes + '.manifest').PkgIndexer(d).write_index()
 
-            if result is not None:
-                bb.fatal(result)
+        if result is not None:
+            bb.fatal(result)
diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
index 5d3c300700..0dc4004f66 100644
--- a/meta/lib/oe/package_managers/deb/package_manager.py
+++ b/meta/lib/oe/package_managers/deb/package_manager.py
@@ -94,7 +94,7 @@ class PkgPM(OpkgDpkgPM):
 
         self._create_configs(archs, base_archs)
 
-        self.indexer = DpkgIndexer(self.d, self.deploy_dir)
+        self.indexer = PkgIndexer(self.d, self.deploy_dir)
 
     def mark_packages(self, status_tag, packages=None):
         """
@@ -400,7 +400,7 @@ class PkgPM(OpkgDpkgPM):
         return tmp_dir
 
 
-class DpkgIndexer(Indexer):
+class PkgIndexer(Indexer):
     def _create_configs(self):
         bb.utils.mkdirhier(self.apt_conf_dir)
         bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "lists", "partial"))
@@ -423,6 +423,10 @@ class DpkgIndexer(Indexer):
                     apt_conf.write(line + "\n")
 
     def write_index(self):
+        if self.deploy_dir == "":
+            self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB')
+
+
         self.apt_conf_dir = os.path.join(self.d.expand("${APTCONF_TARGET}"),
                 "apt-ftparchive")
         self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
index 8abc6c1c98..133af27182 100644
--- a/meta/lib/oe/package_managers/ipk/package_manager.py
+++ b/meta/lib/oe/package_managers/ipk/package_manager.py
@@ -106,7 +106,7 @@ class PkgPM(OpkgDpkgPM):
         else:
             self._create_config()
 
-        self.indexer = OpkgIndexer(self.d, self.deploy_dir)
+        self.indexer = PkgIndexer(self.d, self.deploy_dir)
 
     def mark_packages(self, status_tag, packages=None):
         """
@@ -423,8 +423,11 @@ class PkgPM(OpkgDpkgPM):
 
         return tmp_dir
 
-class OpkgIndexer(Indexer):
+class PkgIndexer(Indexer):
     def write_index(self):
+        if self.deploy_dir == "":
+            self.deploy_dir = self.d.getVar('DEPLOY_DIR_IPK')
+
         arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
                      "SDK_PACKAGE_ARCHS",
                      ]
diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
index 025e8cdfd2..e781676183 100644
--- a/meta/lib/oe/package_managers/rpm/package_manager.py
+++ b/meta/lib/oe/package_managers/rpm/package_manager.py
@@ -384,8 +384,11 @@ class RpmIndexer(Indexer):
                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                armor=is_ascii_sig)
 
-class RpmSubdirIndexer(RpmIndexer):
+class PkgIndexer(RpmIndexer):
     def write_index(self):
+        if self.deploy_dir == "":
+            self.deploy_dir = self.d.getVar('DEPLOY_DIR_RPM')
+
         bb.note("Generating package index for %s" %(self.deploy_dir))
         self.do_write_index(self.deploy_dir)
         for entry in os.walk(self.deploy_dir):
-- 
2.20.1

