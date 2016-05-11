Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A76D973166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 20:36:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2016 13:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="951263707"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2016 13:36:18 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 12:31:57 +0000
Message-Id: <6f35fcf9021b2b3d07e434bcd5e8ab678537e378.1462969737.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1462969737.git.mariano.lopez@linux.intel.com>
References: <cover.1462969737.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1462969737.git.mariano.lopez@linux.intel.com>
References: <cover.1462969737.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/3] package_manager.py: Add extract() method for opkg and dpkg
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
X-List-Received-Date: Wed, 11 May 2016 20:36:17 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Sometimes it is needed to have the content of a package outside
the recipe context.  This new method extract the content of an
IPK/DEB file to a tmpdir, without actually installing the package.

A new OpkgDpkgPM class was added to share the code for opkg and dpkg.

There were need some changes to opkg_query() in order to use it
with apt-cache output.

[YOCTO #9569]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 134 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 427518d..0830da9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -38,6 +38,7 @@ def opkg_query(cmd_output):
     filename = ""
     dep = []
     pkg = ""
+    pkgarch = ""
     for line in cmd_output.splitlines():
         line = line.rstrip()
         if ':' in line:
@@ -47,8 +48,10 @@ def opkg_query(cmd_output):
                 arch = line.split(": ")[1]
             elif line.startswith("Version: "):
                 ver = line.split(": ")[1]
-            elif line.startswith("File: "):
+            elif line.startswith("File: ") or line.startswith("Filename:"):
                 filename = line.split(": ")[1]
+                if "/" in filename:
+                    filename = os.path.basename(filename)
             elif line.startswith("Depends: "):
                 depends = verregex.sub('', line.split(": ")[1])
                 for depend in depends.split(", "):
@@ -57,15 +60,20 @@ def opkg_query(cmd_output):
                 recommends = verregex.sub('', line.split(": ")[1])
                 for recommend in recommends.split(", "):
                     dep.append("%s [REC]" % recommend)
-        else:
+            elif line.startswith("PackageArch: "):
+                pkgarch = line.split(": ")[1]
+
+        # When there is a blank line save the package information
+        elif not line:
             # IPK doesn't include the filename
             if not filename:
                 filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
             if pkg:
                 output[pkg] = {"arch":arch, "ver":ver,
-                        "filename":filename, "deps": dep }
+                        "filename":filename, "deps": dep, "pkgarch":pkgarch }
             pkg = ""
             filename = ""
+            pkgarch = ""
             dep = []
 
     if pkg:
@@ -1397,7 +1405,70 @@ class RpmPM(PackageManager):
             bb.utils.remove(f, True)
 
 
-class OpkgPM(PackageManager):
+class OpkgDpkgPM(PackageManager):
+    """
+    This is an abstract class. Do not instantiate this directly.
+    """
+    def __init__(self, d):
+        super(OpkgDpkgPM, self).__init__(d)
+
+    """
+    Returns a dictionary with the package info.
+
+    This method extracts the common parts for Opkg and Dpkg
+    """
+    def package_info(self, pkg, cmd):
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Unable to list available packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+        return opkg_query(output)
+
+    """
+    Returns the path to a tmpdir where resides the contents of a package.
+
+    Deleting the tmpdir is responsability of the caller.
+
+    This method extracts the common parts for Opkg and Dpkg
+    """
+    def extract(self, pkg, pkg_path):
+
+        ar_cmd = bb.utils.which(os.getenv("PATH"), "ar")
+        tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
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
+            cmd = "%s x %s" % (ar_cmd, pkg_path)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            cmd = "%s xf data.tar.*" % tar_cmd
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output))
+        except OSError as e:
+            bb.utils.remove(tmp_dir, recurse=True)
+            bb.fatal("Unable to extract %s package. Command '%s' "
+                     "returned %d:\n%s at %s" % (pkg_path, cmd, e.errno, e.strerror, e.filename))
+
+        bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
+        bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
+        bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        os.chdir(current_dir)
+
+        return tmp_dir
+
+
+class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target'):
         super(OpkgPM, self).__init__(d)
 
@@ -1732,8 +1803,34 @@ class OpkgPM(PackageManager):
                             self.opkg_dir,
                             symlinks=True)
 
+    """
+    Returns a dictionary with the package info.
+    """
+    def package_info(self, pkg):
+        cmd = "%s %s info %s" % (self.opkg_cmd, self.opkg_args, pkg)
+        return super(OpkgPM, self).package_info(pkg, cmd)
+
+    """
+    Returns the path to a tmpdir where resides the contents of a package.
+
+    Deleting the tmpdir is responsability of the caller.
+    """
+    def extract(self, pkg):
+        pkg_info = self.package_info(pkg)
+        if not pkg_info:
+            bb.fatal("Unable to get information for package '%s' while "
+                     "trying to extract the package."  % pkg)
 
-class DpkgPM(PackageManager):
+        pkg_arch = pkg_info[pkg]["arch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_path = os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_path)
+        bb.utils.remove(os.path.join(tmp_dir, "data.tar.gz"))
+
+        return tmp_dir
+
+class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
         super(DpkgPM, self).__init__(d)
         self.target_rootfs = target_rootfs
@@ -1744,6 +1841,7 @@ class DpkgPM(PackageManager):
             self.apt_conf_dir = apt_conf_dir
         self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
         self.apt_get_cmd = bb.utils.which(os.getenv('PATH'), "apt-get")
+        self.apt_cache_cmd = bb.utils.which(os.getenv('PATH'), "apt-cache")
 
         self.apt_args = d.getVar("APT_ARGS", True)
 
@@ -2027,6 +2125,32 @@ class DpkgPM(PackageManager):
     def list_installed(self):
         return DpkgPkgsList(self.d, self.target_rootfs).list_pkgs()
 
+    """
+    Returns a dictionary with the package info.
+    """
+    def package_info(self, pkg):
+        cmd = "%s show %s" % (self.apt_cache_cmd, pkg)
+        return super(DpkgPM, self).package_info(pkg, cmd)
+
+    """
+    Returns the path to a tmpdir where resides the contents of a package.
+
+    Deleting the tmpdir is responsability of the caller.
+    """
+    def extract(self, pkg):
+        pkg_info = self.package_info(pkg)
+        if not pkg_info:
+            bb.fatal("Unable to get information for package '%s' while "
+                     "trying to extract the package."  % pkg)
+
+        pkg_arch = pkg_info[pkg]["pkgarch"]
+        pkg_filename = pkg_info[pkg]["filename"]
+        pkg_path = os.path.join(self.deploy_dir, pkg_arch, pkg_filename)
+
+        tmp_dir = super(DpkgPM, self).extract(pkg, pkg_path)
+        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
+
+        return tmp_dir
 
 def generate_index_files(d):
     classes = d.getVar('PACKAGE_CLASSES', True).replace("package_", "").split()
-- 
2.6.6


