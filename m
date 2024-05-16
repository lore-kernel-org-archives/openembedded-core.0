Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F72C25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 07:32:06 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web10.7544.1715844721574476364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 00:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=UhMawe5N;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=859c909c3=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1715844721; x=1747380721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IJw6NIxuXo0kDhuviOmTo+YXoj8AzZJZu6i4YSoCxRw=;
  b=UhMawe5NVyPk1rny0VRoEJH8STKzmyKGKYsNopIV4bBtN6IMf5kJsSQ+
   o9tayuQzttOdikxMna8NAz2FbunvkZvO88i+XxRs0pAFs8p8c3uDSGwTi
   VG8KB3dgabnxspetjMSESf+jTc9o6bvBVu+JTQdcXUN82pyvWp6vzld8P
   U=;
X-CSE-ConnectionGUID: OJHbIrguToGyoWcrN6cUkw==
X-CSE-MsgGUID: BuV9qE1lTgihCgVfCCFFtg==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 16 May 2024 09:31:58 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
 16 May 2024 09:26:30 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb2.muc with ESMTP/TLS; 16 May 2024 09:26:30 +0200
Received: from localhost.localdomain (10.30.85.215) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 16 May 2024 09:26:30 +0200
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH 2/3] package_manager: Move OpkgDpkgPM into common module
Date: Thu, 16 May 2024 09:24:38 +0200
Message-ID: <20240516072439.2998567-3-philip.lorenz@bmw.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 07:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199441

The OpkgDpkgPM class was introduced to share common functionality
between the Opkg and Debian package manager implementations. However,
for unknown reasons , the refactoring done in
5bc67f55028407de78ac09f97f9a47b165ae8760 duplicated the common class
into the deb and ipk modules. Undo this part of the change by moving the
common base class into a newly created module.

The two variants did not diverge a lot (next to the payload name
generalization, the Debian variant missed
17e2eaed036e1da8e7cb42cb3de51b9523ba54ec) and as such no regressions
should be expected.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/lib/oe/package_manager/common_deb_ipk.py | 89 +++++++++++++++++++
 meta/lib/oe/package_manager/deb/__init__.py   | 68 +-------------
 meta/lib/oe/package_manager/ipk/__init__.py   | 78 +---------------
 3 files changed, 91 insertions(+), 144 deletions(-)
 create mode 100644 meta/lib/oe/package_manager/common_deb_ipk.py

diff --git a/meta/lib/oe/package_manager/common_deb_ipk.py b/meta/lib/oe/package_manager/common_deb_ipk.py
new file mode 100644
index 00000000000..c91a4b45650
--- /dev/null
+++ b/meta/lib/oe/package_manager/common_deb_ipk.py
@@ -0,0 +1,89 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import glob
+import os
+import subprocess
+import tempfile
+
+import bb
+
+from oe.package_manager import opkg_query, PackageManager
+
+class OpkgDpkgPM(PackageManager):
+    def __init__(self, d, target_rootfs):
+        """
+        This is an abstract class. Do not instantiate this directly.
+        """
+        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
+
+    def package_info(self, pkg, cmd):
+        """
+        Returns a dictionary with the package info.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
+        if proc.returncode:
+            bb.fatal("Unable to list available packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
+        elif proc.stderr:
+            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
+
+        return opkg_query(proc.stdout)
+
+    def extract(self, pkg, pkg_info):
+        """
+        Returns the path to a tmpdir where resides the contents of a package.
+
+        Deleting the tmpdir is responsability of the caller.
+
+        This method extracts the common parts for Opkg and Dpkg
+        """
+
+        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
+        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
+        pkg_path = pkg_info[pkg]["filepath"]
+
+        if not os.path.isfile(pkg_path):
+            bb.fatal("Unable to extract package for '%s'."
+                     "File %s doesn't exists" % (pkg, pkg_path))
+
+        tmp_dir = tempfile.mkdtemp()
+        current_dir = os.getcwd()
+        os.chdir(tmp_dir)
+
+        try:
+            cmd = [ar_cmd, 'x', pkg_path]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            data_tar = glob.glob("data.tar.*")
+            if len(data_tar) != 1:
+                bb.fatal("Unable to extract %s package. Failed to identify "
+                         "data tarball (found tarballs '%s').",
+                         pkg_path, data_tar)
+            data_tar = data_tar[0]
+            cmd = [tar_cmd, 'xf', data_tar]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+        except OSError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
+
+        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
+        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
+        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        bb.utils.remove(os.path.join(tmp_dir, data_tar))
+        os.chdir(current_dir)
+
+        return tmp_dir
+
+    def _handle_intercept_failure(self, registered_pkgs):
+        self.mark_packages("unpacked", registered_pkgs.split())
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 0c23c884c12..a96e56b2ada 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -7,6 +7,7 @@
 import re
 import subprocess
 from oe.package_manager import *
+from oe.package_manager import OpkgDpkgPM
 
 class DpkgIndexer(Indexer):
     def _create_configs(self):
@@ -111,72 +112,6 @@ class PMPkgsList(PkgsList):
 
         return opkg_query(cmd_output)
 
-class OpkgDpkgPM(PackageManager):
-    def __init__(self, d, target_rootfs):
-        """
-        This is an abstract class. Do not instantiate this directly.
-        """
-        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
-
-    def package_info(self, pkg, cmd):
-        """
-        Returns a dictionary with the package info.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-        return opkg_query(output)
-
-    def extract(self, pkg, pkg_info):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
-        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
-        pkg_path = pkg_info[pkg]["filepath"]
-
-        if not os.path.isfile(pkg_path):
-            bb.fatal("Unable to extract package for '%s'."
-                     "File %s doesn't exists" % (pkg, pkg_path))
-
-        tmp_dir = tempfile.mkdtemp()
-        current_dir = os.getcwd()
-        os.chdir(tmp_dir)
-        data_tar = 'data.tar.xz'
-
-        try:
-            cmd = [ar_cmd, 'x', pkg_path]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            cmd = [tar_cmd, 'xf', data_tar]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-        except OSError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
-
-        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
-        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
-        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
-        os.chdir(current_dir)
-
-        return tmp_dir
-
-    def _handle_intercept_failure(self, registered_pkgs):
-        self.mark_packages("unpacked", registered_pkgs.split())
 
 class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
@@ -517,6 +452,5 @@ class DpkgPM(OpkgDpkgPM):
                      "trying to extract the package."  % pkg)
 
         tmp_dir = super(DpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
 
         return tmp_dir
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 47e72cc7a65..23536294b0b 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -4,11 +4,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import glob
 import re
 import shutil
 import subprocess
 from oe.package_manager import *
+from oe.package_manager.common_deb_ipk import OpkgDpkgPM
 
 class OpkgIndexer(Indexer):
     def write_index(self):
@@ -91,82 +91,6 @@ class PMPkgsList(PkgsList):
         return opkg_query(cmd_output)
 
 
-
-class OpkgDpkgPM(PackageManager):
-    def __init__(self, d, target_rootfs):
-        """
-        This is an abstract class. Do not instantiate this directly.
-        """
-        super(OpkgDpkgPM, self).__init__(d, target_rootfs)
-
-    def package_info(self, pkg, cmd):
-        """
-        Returns a dictionary with the package info.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
-        if proc.returncode:
-            bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
-        elif proc.stderr:
-            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
-
-        return opkg_query(proc.stdout)
-
-    def extract(self, pkg, pkg_info):
-        """
-        Returns the path to a tmpdir where resides the contents of a package.
-
-        Deleting the tmpdir is responsability of the caller.
-
-        This method extracts the common parts for Opkg and Dpkg
-        """
-
-        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
-        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
-        pkg_path = pkg_info[pkg]["filepath"]
-
-        if not os.path.isfile(pkg_path):
-            bb.fatal("Unable to extract package for '%s'."
-                     "File %s doesn't exists" % (pkg, pkg_path))
-
-        tmp_dir = tempfile.mkdtemp()
-        current_dir = os.getcwd()
-        os.chdir(tmp_dir)
-
-        try:
-            cmd = [ar_cmd, 'x', pkg_path]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            data_tar = glob.glob("data.tar.*")
-            if len(data_tar) != 1:
-                bb.fatal("Unable to extract %s package. Failed to identify "
-                         "data tarball (found tarballs '%s').",
-                         pkg_path, data_tar)
-            data_tar = data_tar[0]
-            cmd = [tar_cmd, 'xf', data_tar]
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
-        except OSError as e:
-            bb.utils.remove(tmp_dir, recurse=True)
-            bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
-
-        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
-        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
-        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
-        bb.utils.remove(os.path.join(tmp_dir, data_tar))
-        os.chdir(current_dir)
-
-        return tmp_dir
-
-    def _handle_intercept_failure(self, registered_pkgs):
-        self.mark_packages("unpacked", registered_pkgs.split())
-
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
         super(OpkgPM, self).__init__(d, target_rootfs)
-- 
2.44.0


