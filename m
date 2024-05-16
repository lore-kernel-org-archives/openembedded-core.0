Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0420C25B7A
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 07:32:45 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web10.7552.1715844758175707766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 00:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=HU1lYJxt;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=859c909c3=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1715844760; x=1747380760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LrRrI+ekLfh1NTXJD6nFBtw5vdsVnXhT2PxTuBf/pPg=;
  b=HU1lYJxtclD3ln3ZjSIUCqguGEseNH33A6M+QMmUi9FJrmo/vl4IYwEz
   pX2cd+E8ziWoPkeLvD15+nFRHJcDjqJ9t6Ev3tVFNpiz4vFWE9dOIWkjv
   HBX5no9RZSBCdccOmUD/uFfqgcXz5odRM0RFvbNgXsA50yB0DVDg3QbDd
   k=;
X-CSE-ConnectionGUID: RLorJRt9SqmNCs6ZanQjDg==
X-CSE-MsgGUID: 9yAACkOGR+CZ2U3wcgIPfg==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 16 May 2024 09:32:40 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
 16 May 2024 09:26:31 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb6.muc with ESMTP/TLS; 16 May 2024 09:26:31 +0200
Received: from localhost.localdomain (10.30.85.215) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 16 May 2024 09:26:31 +0200
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 3/3] package_manager: Share more common DEB / IPK code
Date: Thu, 16 May 2024 09:24:39 +0200
Message-ID: <20240516072439.2998567-4-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516072439.2998567-1-philip.lorenz@bmw.de>
References: <20240516072439.2998567-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12F.europe.bmw.corp (2a03:1e80:a15:58f::1:2b0) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 07:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199443

Avoid code duplication by making `extract` a shared method (and
retrieving the package manager specific input via an abstract method).
Additionally, follow Python conventions and prefix class internal
methods with "_" to indicate that they shouldn't be called externally.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/lib/oe/package_manager/common_deb_ipk.py | 16 ++++++++++++----
 meta/lib/oe/package_manager/deb/__init__.py   | 19 ++-----------------
 meta/lib/oe/package_manager/ipk/__init__.py   | 15 +--------------
 3 files changed, 15 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oe/package_manager/common_deb_ipk.py b/meta/lib/oe/package_manager/common_deb_ipk.py
index c91a4b45650..6a1e28ee6f9 100644
--- a/meta/lib/oe/package_manager/common_deb_ipk.py
+++ b/meta/lib/oe/package_manager/common_deb_ipk.py
@@ -20,9 +20,15 @@ class OpkgDpkgPM(PackageManager):
         """
         super(OpkgDpkgPM, self).__init__(d, target_rootfs)
 
-    def package_info(self, pkg, cmd):
+    def package_info(self, pkg):
         """
         Returns a dictionary with the package info.
+        """
+        raise NotImplementedError
+
+    def _common_package_info(self, cmd):
+        """
+       "Returns a dictionary with the package info.
 
         This method extracts the common parts for Opkg and Dpkg
         """
@@ -36,14 +42,16 @@ class OpkgDpkgPM(PackageManager):
 
         return opkg_query(proc.stdout)
 
-    def extract(self, pkg, pkg_info):
+    def extract(self, pkg):
         """
         Returns the path to a tmpdir where resides the contents of a package.
 
         Deleting the tmpdir is responsability of the caller.
-
-        This method extracts the common parts for Opkg and Dpkg
         """
+        pkg_info = self.package_info(pkg)
+        if not pkg_info:
+            bb.fatal("Unable to get information for package '%s' while "
+                     "trying to extract the package."  % pkg)
 
         ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
         tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index a96e56b2ada..e09e81e4901 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -7,7 +7,7 @@
 import re
 import subprocess
 from oe.package_manager import *
-from oe.package_manager import OpkgDpkgPM
+from oe.package_manager.common_deb_ipk import OpkgDpkgPM
 
 class DpkgIndexer(Indexer):
     def _create_configs(self):
@@ -431,7 +431,7 @@ class DpkgPM(OpkgDpkgPM):
         Returns a dictionary with the package info.
         """
         cmd = "%s show %s" % (self.apt_cache_cmd, pkg)
-        pkg_info = super(DpkgPM, self).package_info(pkg, cmd)
+        pkg_info = self._common_package_info(cmd)
 
         pkg_arch = pkg_info[pkg]["pkgarch"]
         pkg_filename = pkg_info[pkg]["filename"]
@@ -439,18 +439,3 @@ class DpkgPM(OpkgDpkgPM):
                 os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
 
         return pkg_info
-
-    def extract(self, pkg):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-        """
-        pkg_info = self.package_info(pkg)
-        if not pkg_info:
-            bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
-
-        tmp_dir = super(DpkgPM, self).extract(pkg, pkg_info)
-
-        return tmp_dir
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 23536294b0b..3d998e52ff1 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -416,7 +416,7 @@ class OpkgPM(OpkgDpkgPM):
         Returns a dictionary with the package info.
         """
         cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
-        pkg_info = super(OpkgPM, self).package_info(pkg, cmd)
+        pkg_info = self._common_package_info(cmd)
 
         pkg_arch = pkg_info[pkg]["arch"]
         pkg_filename = pkg_info[pkg]["filename"]
@@ -424,16 +424,3 @@ class OpkgPM(OpkgDpkgPM):
                 os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
 
         return pkg_info
-
-    def extract(self, pkg):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-        """
-        pkg_info = self.package_info(pkg)
-        if not pkg_info:
-            bb.fatal("Unable to get information for package '%s' while "
-                     "trying to extract the package."  % pkg)
-
-        return super(OpkgPM, self).extract(pkg, pkg_info)
-- 
2.44.0


