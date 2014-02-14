Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA9A16EFB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 11:01:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2014 03:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,844,1384329600"; d="scan'208";a="455436503"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2014 03:01:10 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 13:01:05 +0200
Message-Id: <4734fcd6e62d9e563f62bb6595915b5c5b00f7a5.1392375539.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392375539.git.laurentiu.palcu@intel.com>
References: <cover.1392375539.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392375539.git.laurentiu.palcu@intel.com>
References: <cover.1392375539.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/3] package_manager.py, rootfs.py, sdk.py: add Indexer class
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
X-List-Received-Date: Fri, 14 Feb 2014 11:01:38 -0000

Because the package-index.bb needs to create package indexes outside
do_rootfs environment, move the indexing capability out of
PackageManager class to a smaller Indexer class.

This commit:
 * simply moves the indexing functions for ipk/deb with no changes;
 * rewrites the RPM indexing function so that it can be easily moved out
   of the PackageManager class;
 * removes some RPM duplicate code, moves it into a method inside
   RpmPM class and changes the RpmPM constructor so that the new method
   is effective;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |  339 +++++++++++++++++++++++++---------------
 meta/lib/oe/rootfs.py          |   58 -------
 meta/lib/oe/sdk.py             |   48 +-----
 3 files changed, 221 insertions(+), 224 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 9884c3a..af14d5a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -22,6 +22,144 @@ def create_index(arg):
     return None
 
 
+class Indexer(object):
+    __metaclass__ = ABCMeta
+
+    def __init__(self, d, deploy_dir):
+        self.d = d
+        self.deploy_dir = deploy_dir
+
+    @abstractmethod
+    def write_index(self):
+        pass
+
+
+class RpmIndexer(Indexer):
+    def write_index(self):
+        sdk_pkg_archs = (self.d.getVar('SDK_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        mlb_prefix_list = (self.d.getVar('MULTILIB_PREFIX_LIST', True) or "").replace('-', '_').split()
+        all_mlb_pkg_archs = (self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+
+        archs = set()
+        for item in mlb_prefix_list:
+            archs = archs.union(set(item.split(':')[1:]))
+
+        if len(archs) == 0:
+            archs = archs.union(set(all_mlb_pkg_archs))
+
+        archs = archs.union(set(sdk_pkg_archs))
+
+        rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
+        index_cmds = []
+        rpm_dirs_found = False
+        for arch in archs:
+            arch_dir = os.path.join(self.deploy_dir, arch)
+            if not os.path.isdir(arch_dir):
+                continue
+
+            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
+
+            rpm_dirs_found = True
+
+        if not rpm_dirs_found:
+            return("There are no packages in %s" % self.deploy_dir)
+
+        nproc = multiprocessing.cpu_count()
+        pool = bb.utils.multiprocessingpool(nproc)
+        results = list(pool.imap(create_index, index_cmds))
+        pool.close()
+        pool.join()
+
+        for result in results:
+            if result is not None:
+                return(result)
+
+
+class OpkgIndexer(Indexer):
+    def write_index(self):
+        arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
+                     "SDK_PACKAGE_ARCHS",
+                     "MULTILIB_ARCHS"]
+
+        opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
+
+        if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
+            open(os.path.join(self.deploy_dir, "Packages"), "w").close()
+
+        index_cmds = []
+        for arch_var in arch_vars:
+            archs = self.d.getVar(arch_var, True)
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
+                index_cmds.append('%s -r %s -p %s -m %s' %
+                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+
+        if len(index_cmds) == 0:
+            return("There are no packages in %s!" % self.deploy_dir)
+
+        nproc = multiprocessing.cpu_count()
+        pool = bb.utils.multiprocessingpool(nproc)
+        results = list(pool.imap(create_index, index_cmds))
+        pool.close()
+        pool.join()
+
+        for result in results:
+            if result is not None:
+                return(result)
+
+
+class DpkgIndexer(Indexer):
+    def write_index(self):
+        pkg_archs = self.d.getVar('PACKAGE_ARCHS', True)
+        if pkg_archs is not None:
+            arch_list = pkg_archs.split()
+        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS', True)
+        if sdk_pkg_archs is not None:
+            arch_list += sdk_pkg_archs.split()
+
+        dpkg_scanpackages = bb.utils.which(os.getenv('PATH'), "dpkg-scanpackages")
+        gzip = bb.utils.which(os.getenv('PATH'), "gzip")
+
+        index_cmds = []
+        deb_dirs_found = False
+        for arch in arch_list:
+            arch_dir = os.path.join(self.deploy_dir, arch)
+            if not os.path.isdir(arch_dir):
+                continue
+
+            with open(os.path.join(arch_dir, "Release"), "w+") as release:
+                release.write("Label: %s" % arch)
+
+            index_cmds.append("cd %s; %s . | %s > Packages.gz" %
+                              (arch_dir, dpkg_scanpackages, gzip))
+
+            deb_dirs_found = True
+
+        if not deb_dirs_found:
+            return("There are no packages in %s" % self.deploy_dir)
+
+        nproc = multiprocessing.cpu_count()
+        pool = bb.utils.multiprocessingpool(nproc)
+        results = list(pool.imap(create_index, index_cmds))
+        pool.close()
+        pool.join()
+
+        for result in results:
+            if result is not None:
+                return(result)
+
+
 class PackageManager(object):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -136,14 +274,13 @@ class RpmPM(PackageManager):
     def __init__(self,
                  d,
                  target_rootfs,
-                 package_archs,
-                 target_os,
                  target_vendor,
                  task_name='target',
-                 providename=None):
+                 providename=None,
+                 arch_var=None,
+                 os_var=None):
         super(RpmPM, self).__init__(d)
         self.target_rootfs = target_rootfs
-        self.ml_os_list = target_os
         self.target_vendor = target_vendor
         self.task_name = task_name
         self.providename = providename
@@ -164,19 +301,58 @@ class RpmPM(PackageManager):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
-        # arch order is reversed.  This ensures the -best- match is
-        # listed first!
-        self.ml_prefix_list = dict()
+        self.indexer = RpmIndexer(self.d, self.deploy_dir)
+
+        self.ml_prefix_list, self.ml_os_list = self._get_prefix_and_os_list(arch_var, os_var)
+
+    def _get_prefix_and_os_list(self, arch_var, os_var):
+        package_archs = {
+            'default': [],
+        }
+
+        target_os = {
+            'default': "",
+        }
+
+        if arch_var is not None and os_var is not None:
+            package_archs['default'] = self.d.getVar(arch_var, True).split()
+            package_archs['default'].reverse()
+            target_os['default'] = self.d.getVar(os_var, True).strip()
+        else:
+            package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
+            # arch order is reversed.  This ensures the -best- match is
+            # listed first!
+            package_archs['default'].reverse()
+            target_os['default'] = self.d.getVar("TARGET_OS", True).strip()
+            multilibs = self.d.getVar('MULTILIBS', True) or ""
+            for ext in multilibs.split():
+                eext = ext.split(':')
+                if len(eext) > 1 and eext[0] == 'multilib':
+                    localdata = bb.data.createCopy(self.d)
+                    default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
+                    default_tune = localdata.getVar(default_tune_key, False)
+                    if default_tune:
+                        localdata.setVar("DEFAULTTUNE", default_tune)
+                        bb.data.update_data(localdata)
+                        package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS',
+                                                                  True).split()
+                        package_archs[eext[1]].reverse()
+                        target_os[eext[1]] = localdata.getVar("TARGET_OS",
+                                                              True).strip()
+
+        ml_prefix_list = dict()
         for mlib in package_archs:
             if mlib == 'default':
-                self.ml_prefix_list[mlib] = package_archs[mlib]
+                ml_prefix_list[mlib] = package_archs[mlib]
             else:
-                self.ml_prefix_list[mlib] = list()
+                ml_prefix_list[mlib] = list()
                 for arch in package_archs[mlib]:
                     if arch in ['all', 'noarch', 'any']:
-                        self.ml_prefix_list[mlib].append(arch)
+                        ml_prefix_list[mlib].append(arch)
                     else:
-                        self.ml_prefix_list[mlib].append(mlib + "_" + arch)
+                        ml_prefix_list[mlib].append(mlib + "_" + arch)
+
+        return (ml_prefix_list, target_os)
 
     '''
     Create configs for rpm and smart, and multilib is supported
@@ -552,39 +728,10 @@ class RpmPM(PackageManager):
         self._invoke_smart('upgrade')
 
     def write_index(self):
-        arch_list = set()
-        for mlib in self.ml_prefix_list:
-            for arch in self.ml_prefix_list[mlib]:
-                if arch not in arch_list:
-                    arch_list.add(arch.replace('-', '_'))
+        result = self.indexer.write_index()
 
-        sdk_pkg_archs = (self.d.getVar('SDK_PACKAGE_ARCHS', True) or "").replace('-', '_')
-        arch_list = arch_list.union(set(sdk_pkg_archs.split()))
-
-        rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
-        index_cmds = []
-        rpm_dirs_found = False
-        for arch in arch_list:
-            arch_dir = os.path.join(self.deploy_dir, arch)
-            if not os.path.isdir(arch_dir):
-                continue
-
-            index_cmds.append("%s --update -q %s" % (rpm_createrepo, arch_dir))
-
-            rpm_dirs_found = True
-
-        if not rpm_dirs_found:
-            bb.fatal("There are no packages in %s" % self.deploy_dir)
-
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        results = list(pool.imap(create_index, index_cmds))
-        pool.close()
-        pool.join()
-
-        for result in results:
-            if result is not None:
-                bb.fatal(result)
+        if result is not None:
+            bb.fatal(result)
 
     def remove_packaging_data(self):
         bb.utils.remove(self.image_rpmlib, True)
@@ -810,6 +957,8 @@ class OpkgPM(PackageManager):
         else:
             self._create_custom_config()
 
+        self.indexer = OpkgIndexer(self.d, self.deploy_dir)
+
     """
     This function will change a package's status in /var/lib/opkg/status file.
     If 'packages' is None then the new_status will be applied to all
@@ -943,53 +1092,14 @@ class OpkgPM(PackageManager):
                      "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
 
     def write_index(self):
-        arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
-                     "SDK_PACKAGE_ARCHS",
-                     "MULTILIB_ARCHS"]
-
-        tmpdir = self.d.getVar('TMPDIR', True)
-
         self.deploy_dir_lock()
 
-        opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
-
-        if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
-            open(os.path.join(self.deploy_dir, "Packages"), "w").close()
-
-        index_cmds = []
-        for arch_var in arch_vars:
-            archs = self.d.getVar(arch_var, True)
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
-                index_cmds.append('%s -r %s -p %s -m %s' %
-                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
-
-        if len(index_cmds) == 0:
-            self.deploy_dir_unlock()
-            bb.fatal("There are no packages in %s!" % self.deploy_dir)
-
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        results = list(pool.imap(create_index, index_cmds))
-        pool.close()
-        pool.join()
+        result = self.indexer.write_index()
 
         self.deploy_dir_unlock()
 
-        for result in results:
-            if result is not None:
-                bb.fatal(result)
+        if result is not None:
+            bb.fatal(result)
 
     def remove_packaging_data(self):
         bb.utils.remove(self.opkg_dir, True)
@@ -1078,6 +1188,8 @@ class DpkgPM(PackageManager):
 
         self._create_configs(archs, base_archs)
 
+        self.indexer = DpkgIndexer(self.d, self.deploy_dir)
+
     """
     This function will change a package's status in /var/lib/dpkg/status file.
     If 'packages' is None then the new_status will be applied to all
@@ -1215,49 +1327,14 @@ class DpkgPM(PackageManager):
                      "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
 
     def write_index(self):
-        tmpdir = self.d.getVar('TMPDIR', True)
-
-        pkg_archs = self.d.getVar('PACKAGE_ARCHS', True)
-        if pkg_archs is not None:
-            arch_list = pkg_archs.split()
-        sdk_pkg_archs = self.d.getVar('SDK_PACKAGE_ARCHS', True)
-        if sdk_pkg_archs is not None:
-            arch_list += sdk_pkg_archs.split()
-
-        dpkg_scanpackages = bb.utils.which(os.getenv('PATH'), "dpkg-scanpackages")
-        gzip = bb.utils.which(os.getenv('PATH'), "gzip")
-
         self.deploy_dir_lock()
 
-        index_cmds = []
-        deb_dirs_found = False
-        for arch in arch_list:
-            arch_dir = os.path.join(self.deploy_dir, arch)
-            if not os.path.isdir(arch_dir):
-                continue
-
-            with open(os.path.join(arch_dir, "Release"), "w+") as release:
-                release.write("Label: %s" % arch)
-
-            index_cmds.append("cd %s; %s . | %s > Packages.gz" %
-                              (arch_dir, dpkg_scanpackages, gzip))
-
-            deb_dirs_found = True
-
-        if not deb_dirs_found:
-            bb.fatal("There are no packages in %s" % self.deploy_dir)
-
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        results = list(pool.imap(create_index, index_cmds))
-        pool.close()
-        pool.join()
+        result = self.indexer.write_index()
 
         self.deploy_dir_unlock()
 
-        for result in results:
-            if result is not None:
-                bb.fatal(result)
+        if result is not None:
+            bb.fatal(result)
 
     def _create_configs(self, archs, base_archs):
         base_archs = re.sub("_", "-", base_archs)
@@ -1365,6 +1442,22 @@ class DpkgPM(PackageManager):
 
         return output
 
+
+def generate_index_files(d):
+    img_type = d.getVar('IMAGE_PKGTYPE', True)
+
+    result = None
+
+    if img_type == "rpm":
+        result = RpmIndexer(d, d.getVar('DEPLOY_DIR_RPM', True)).write_index()
+    elif img_type == "ipk":
+        result = OpkgIndexer(d, d.getVar('DEPLOY_DIR_IPK', True)).write_index()
+    elif img_type == "deb":
+        result = DpkgIndexer(d, d.getVar('DEPLOY_DIR_DEB', True)).write_index()
+
+    if result is not None:
+        bb.fatal(result)
+
 if __name__ == "__main__":
     """
     We should be able to run this as a standalone script, from outside bitbake
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 6114f56..d149ca3 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -233,37 +233,8 @@ class RpmRootfs(Rootfs):
 
         self.manifest = RpmManifest(d, manifest_dir)
 
-        package_archs = {
-            'default': [],
-        }
-        target_os = {
-            'default': "",
-        }
-        package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
-        # arch order is reversed.  This ensures the -best- match is
-        # listed first!
-        package_archs['default'].reverse()
-        target_os['default'] = self.d.getVar("TARGET_OS", True).strip()
-        multilibs = self.d.getVar('MULTILIBS', True) or ""
-        for ext in multilibs.split():
-            eext = ext.split(':')
-            if len(eext) > 1 and eext[0] == 'multilib':
-                localdata = bb.data.createCopy(self.d)
-                default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
-                default_tune = localdata.getVar(default_tune_key, False)
-                if default_tune:
-                    localdata.setVar("DEFAULTTUNE", default_tune)
-                    bb.data.update_data(localdata)
-                    package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS',
-                                                              True).split()
-                    package_archs[eext[1]].reverse()
-                    target_os[eext[1]] = localdata.getVar("TARGET_OS",
-                                                          True).strip()
-
         self.pm = RpmPM(d,
                         d.getVar('IMAGE_ROOTFS', True),
-                        package_archs,
-                        target_os,
                         self.d.getVar('TARGET_VENDOR', True)
                         )
 
@@ -634,37 +605,8 @@ def list_installed_packages(d, format=None, rootfs_dir=None):
 
     img_type = d.getVar('IMAGE_PKGTYPE', True)
     if img_type == "rpm":
-        package_archs = {
-            'default': [],
-        }
-        target_os = {
-            'default': "",
-        }
-        package_archs['default'] = d.getVar("PACKAGE_ARCHS", True).split()
-        # arch order is reversed.  This ensures the -best- match is
-        # listed first!
-        package_archs['default'].reverse()
-        target_os['default'] = d.getVar("TARGET_OS", True).strip()
-        multilibs = d.getVar('MULTILIBS', True) or ""
-        for ext in multilibs.split():
-            eext = ext.split(':')
-            if len(eext) > 1 and eext[0] == 'multilib':
-                localdata = bb.data.createCopy(d)
-                default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
-                default_tune = localdata.getVar(default_tune_key, False)
-                if default_tune:
-                    localdata.setVar("DEFAULTTUNE", default_tune)
-                    bb.data.update_data(localdata)
-                    package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS',
-                                                              True).split()
-                    package_archs[eext[1]].reverse()
-                    target_os[eext[1]] = localdata.getVar("TARGET_OS",
-                                                          True).strip()
-
         return RpmPM(d,
                      rootfs_dir,
-                     package_archs,
-                     target_os,
                      d.getVar('TARGET_VENDOR', True)
                      ).list_installed(format)
     elif img_type == "ipk":
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 518076e..01a1807 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -66,59 +66,20 @@ class RpmSdk(Sdk):
         self.host_manifest = RpmManifest(d, self.manifest_dir,
                                          Manifest.MANIFEST_TYPE_SDK_HOST)
 
-        package_archs = {
-            'default': [],
-        }
-        target_os = {
-            'default': "",
-        }
-        package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
-        # arch order is reversed.  This ensures the -best- match is
-        # listed first!
-        package_archs['default'].reverse()
-        target_os['default'] = self.d.getVar("TARGET_OS", True).strip()
-        multilibs = self.d.getVar('MULTILIBS', True) or ""
-        for ext in multilibs.split():
-            eext = ext.split(':')
-            if len(eext) > 1 and eext[0] == 'multilib':
-                localdata = bb.data.createCopy(self.d)
-                default_tune_key = "DEFAULTTUNE_virtclass-multilib-" + eext[1]
-                default_tune = localdata.getVar(default_tune_key, False)
-                if default_tune:
-                    localdata.setVar("DEFAULTTUNE", default_tune)
-                    bb.data.update_data(localdata)
-                    package_archs[eext[1]] = localdata.getVar('PACKAGE_ARCHS',
-                                                              True).split()
-                    package_archs[eext[1]].reverse()
-                    target_os[eext[1]] = localdata.getVar("TARGET_OS",
-                                                          True).strip()
         target_providename = ['/bin/sh',
                               '/bin/bash',
                               '/usr/bin/env',
                               '/usr/bin/perl',
                               'pkgconfig'
                               ]
+
         self.target_pm = RpmPM(d,
                                self.sdk_target_sysroot,
-                               package_archs,
-                               target_os,
                                self.d.getVar('TARGET_VENDOR', True),
                                'target',
                                target_providename
                                )
 
-        sdk_package_archs = {
-            'default': [],
-        }
-        sdk_os = {
-            'default': "",
-        }
-        sdk_package_archs['default'] = self.d.getVar("SDK_PACKAGE_ARCHS",
-                                                     True).split()
-        # arch order is reversed.  This ensures the -best- match is
-        # listed first!
-        sdk_package_archs['default'].reverse()
-        sdk_os['default'] = self.d.getVar("SDK_OS", True).strip()
         sdk_providename = ['/bin/sh',
                            '/bin/bash',
                            '/usr/bin/env',
@@ -127,13 +88,14 @@ class RpmSdk(Sdk):
                            'libGL.so()(64bit)',
                            'libGL.so'
                            ]
+
         self.host_pm = RpmPM(d,
                              self.sdk_host_sysroot,
-                             sdk_package_archs,
-                             sdk_os,
                              self.d.getVar('SDK_VENDOR', True),
                              'host',
-                             sdk_providename
+                             sdk_providename,
+                             "SDK_PACKAGE_ARCHS",
+                             "SDK_OS"
                              )
 
     def _populate_sysroot(self, pm, manifest):
-- 
1.7.9.5


