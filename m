Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 32B6960796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326964"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:08 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:16 +0000
Message-Id: <cdda7a55ae9b8d02537caeb8d71e0466f354a592.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 07/10] lib/oe/package_manager.py: Add pkgpath to dict returned by package_info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 20:49:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Having the package path with all the other package info allows to
reuse more code and have this information outside the package manager,
without additional processing.

[YOCTO #8536]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2d7da96..79b3206 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1444,8 +1444,10 @@ class RpmPM(PackageManager):
                 break
 
         # To have the same data type than other package_info methods
+        filepath = os.path.join(self.deploy_dir, arch, filename)
         pkg_dict = {}
-        pkg_dict[pkg] = {"arch":arch, "ver":ver, "filename":filename}
+        pkg_dict[pkg] = {"arch":arch, "ver":ver, "filename":filename,
+                         "filepath": filepath}
 
         return pkg_dict
 
@@ -1461,9 +1463,7 @@ class RpmPM(PackageManager):
             bb.fatal("Unable to get information for package '%s' while "
                      "trying to extract the package."  % pkg)
 
-        pkg_arch = pkg_info[pkg]["arch"]
-        pkg_filename = pkg_info[pkg]["filename"]
-        pkg_path = os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+        pkg_path = pkg_info[pkg]["filepath"]
 
         cpio_cmd = bb.utils.which(os.getenv("PATH"), "cpio")
         rpm2cpio_cmd = bb.utils.which(os.getenv("PATH"), "rpm2cpio")
@@ -1522,10 +1522,11 @@ class OpkgDpkgPM(PackageManager):
 
     This method extracts the common parts for Opkg and Dpkg
     """
-    def extract(self, pkg, pkg_path):
+    def extract(self, pkg, pkg_info):
 
         ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
         tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
+        pkg_path = pkg_info[pkg]["filepath"]
 
         if not os.path.isfile(pkg_path):
             bb.fatal("Unable to extract package for '%s'."
@@ -1897,7 +1898,14 @@ class OpkgPM(OpkgDpkgPM):
     """
     def package_info(self, pkg):
         cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
-        return super(OpkgPM, self).package_info(pkg, cmd)
+        pkg_info = super(OpkgPM, self).package_info(pkg, cmd)
+
+        pkg_arch = pkg_info[pkg]["arch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_info[pkg]["filepath"] = \
+                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        return pkg_info
 
     """
     Returns the path to a tmpdir where resides the contents of a package.
@@ -1910,11 +1918,7 @@ class OpkgPM(OpkgDpkgPM):
             bb.fatal("Unable to get information for package '%s' while "
                      "trying to extract the package."  % pkg)
 
-        pkg_arch = pkg_info[pkg]["arch"]
-        pkg_filename = pkg_info[pkg]["filename"]
-        pkg_path = os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
-
-        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_path)
+        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
         bb.utils.remove(os.path.join(tmp_dir, "data.tar.gz"))
 
         return tmp_dir
@@ -2219,7 +2223,14 @@ class DpkgPM(OpkgDpkgPM):
     """
     def package_info(self, pkg):
         cmd = "%s show %s" % (self.apt_cache_cmd, pkg)
-        return super(DpkgPM, self).package_info(pkg, cmd)
+        pkg_info = super(DpkgPM, self).package_info(pkg, cmd)
+
+        pkg_arch = pkg_info[pkg]["pkgarch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_info[pkg]["filepath"] = \
+                os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        return pkg_info
 
     """
     Returns the path to a tmpdir where resides the contents of a package.
@@ -2232,11 +2243,7 @@ class DpkgPM(OpkgDpkgPM):
             bb.fatal("Unable to get information for package '%s' while "
                      "trying to extract the package."  % pkg)
 
-        pkg_arch = pkg_info[pkg]["pkgarch"]
-        pkg_filename = pkg_info[pkg]["filename"]
-        pkg_path = os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
-
-        tmp_dir = super(DpkgPM, self).extract(pkg, pkg_path)
+        tmp_dir = super(DpkgPM, self).extract(pkg, pkg_info)
         bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
 
         return tmp_dir
-- 
2.6.6


