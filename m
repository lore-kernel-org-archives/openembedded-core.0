Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E37236E221
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 11:38:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Mar 2014 04:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,677,1389772800"; d="scan'208";a="494272077"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2014 04:38:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 13:38:46 +0200
Message-Id: <08f54d465549a31694c07da44e52e9a4f3201b46.1395142153.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/4] package_manager.py: create separate class for installed packages listing
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
X-List-Received-Date: Tue, 18 Mar 2014 11:38:56 -0000

This commit creates a new class that has the only purpose to generate
various listings of installed packages in the rootfs.

Basically, the methods involved in listing the installed packages, that
were part of each backend PM class implementation, were moved to this
new class.

This change avoids instantiating a new PM object just to get the list of
installed packages in a certain rootfs.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |  376 ++++++++++++++++++++++------------------
 1 file changed, 211 insertions(+), 165 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1279b50..0426b23 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -213,6 +213,213 @@ class DpkgIndexer(Indexer):
                 return(result)
 
 
+class PkgsList(object):
+    __metaclass__ = ABCMeta
+
+    def __init__(self, d, rootfs_dir):
+        self.d = d
+        self.rootfs_dir = rootfs_dir
+
+    @abstractmethod
+    def list(self, format=None):
+        pass
+
+
+class RpmPkgsList(PkgsList):
+    def __init__(self, d, rootfs_dir, arch_var=None, os_var=None):
+        super(RpmPkgsList, self).__init__(d, rootfs_dir)
+
+        self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
+        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
+
+        self.ml_prefix_list, self.ml_os_list = \
+            RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
+
+    '''
+    Translate the RPM/Smart format names to the OE multilib format names
+    '''
+    def _pkg_translate_smart_to_oe(self, pkg, arch):
+        new_pkg = pkg
+        fixed_arch = arch.replace('_', '-')
+        found = 0
+        for mlib in self.ml_prefix_list:
+            for cmp_arch in self.ml_prefix_list[mlib]:
+                fixed_cmp_arch = cmp_arch.replace('_', '-')
+                if fixed_arch == fixed_cmp_arch:
+                    if mlib == 'default':
+                        new_pkg = pkg
+                        new_arch = cmp_arch
+                    else:
+                        new_pkg = mlib + '-' + pkg
+                        # We need to strip off the ${mlib}_ prefix on the arch
+                        new_arch = cmp_arch.replace(mlib + '_', '')
+
+                    # Workaround for bug 3565. Simply look to see if we
+                    # know of a package with that name, if not try again!
+                    filename = os.path.join(self.d.getVar('PKGDATA_DIR', True),
+                                            'runtime-reverse',
+                                            new_pkg)
+                    if os.path.exists(filename):
+                        found = 1
+                        break
+
+            if found == 1 and fixed_arch == fixed_cmp_arch:
+                break
+        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
+        return new_pkg, new_arch
+
+    def _list_pkg_deps(self):
+        cmd = [bb.utils.which(os.getenv('PATH'), "rpmresolve"),
+               "-t", self.image_rpmlib]
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the package dependencies. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
+
+        return output
+
+    def list(self, format=None):
+        if format == "deps":
+            return self._list_pkg_deps()
+
+        cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
+        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
+        cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
+
+        try:
+            # bb.note(cmd)
+            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
+
+            rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.rootfs_dir)
+            for f in rpm_db_locks:
+                bb.utils.remove(f, True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        output = list()
+        for line in tmp_output.split('\n'):
+            if len(line.strip()) == 0:
+                continue
+            pkg = line.split()[0]
+            arch = line.split()[1]
+            ver = line.split()[2]
+            pkgorigin = line.split()[3]
+            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
+
+            if format == "arch":
+                output.append('%s %s' % (new_pkg, new_arch))
+            elif format == "file":
+                output.append('%s %s %s' % (new_pkg, pkgorigin, new_arch))
+            elif format == "ver":
+                output.append('%s %s %s' % (new_pkg, new_arch, ver))
+            else:
+                output.append('%s' % (new_pkg))
+
+            output.sort()
+
+        return '\n'.join(output)
+
+
+class OpkgPkgsList(PkgsList):
+    def __init__(self, d, rootfs_dir, config_file):
+        super(OpkgPkgsList, self).__init__(d, rootfs_dir)
+
+        self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg-cl")
+        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
+        self.opkg_args += self.d.getVar("OPKG_ARGS", True)
+
+    def list(self, format=None):
+        opkg_query_cmd = bb.utils.which(os.getenv('PATH'), "opkg-query-helper.py")
+
+        if format == "arch":
+            cmd = "%s %s status | %s -a" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        elif format == "file":
+            cmd = "%s %s status | %s -f" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        elif format == "ver":
+            cmd = "%s %s status | %s -v" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        elif format == "deps":
+            cmd = "%s %s status | %s" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        else:
+            cmd = "%s %s list_installed | cut -d' ' -f1" % \
+                (self.opkg_cmd, self.opkg_args)
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        if output and format == "file":
+            tmp_output = ""
+            for line in output.split('\n'):
+                pkg, pkg_file, pkg_arch = line.split()
+                full_path = os.path.join(self.rootfs_dir, pkg_arch, pkg_file)
+                if os.path.exists(full_path):
+                    tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
+                else:
+                    tmp_output += "%s %s %s\n" % (pkg, pkg_file, pkg_arch)
+
+            output = tmp_output
+
+        return output
+
+
+class DpkgPkgsList(PkgsList):
+    def list(self, format=None):
+        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
+               "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
+               "-W"]
+
+        if format == "arch":
+            cmd.append("-f=${Package} ${PackageArch}\n")
+        elif format == "file":
+            cmd.append("-f=${Package} ${Package}_${Version}_${Architecture}.deb ${PackageArch}\n")
+        elif format == "ver":
+            cmd.append("-f=${Package} ${PackageArch} ${Version}\n")
+        elif format == "deps":
+            cmd.append("-f=Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n")
+        else:
+            cmd.append("-f=${Package}\n")
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
+
+        if format == "file":
+            tmp_output = ""
+            for line in tuple(output.split('\n')):
+                pkg, pkg_file, pkg_arch = line.split()
+                full_path = os.path.join(self.rootfs_dir, pkg_arch, pkg_file)
+                if os.path.exists(full_path):
+                    tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
+                else:
+                    tmp_output += "%s %s %s\n" % (pkg, pkg_file, pkg_arch)
+
+            output = tmp_output
+        elif format == "deps":
+            opkg_query_cmd = bb.utils.which(os.getenv('PATH'), "opkg-query-helper.py")
+
+            try:
+                output = subprocess.check_output("echo -e '%s' | %s" %
+                                                 (output, opkg_query_cmd),
+                                                 stderr=subprocess.STDOUT,
+                                                 shell=True)
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Cannot compute packages dependencies. Command '%s' "
+                         "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
+
+        return output
+
+
 class PackageManager(object):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -360,10 +567,10 @@ class RpmPM(PackageManager):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
         self.indexer = RpmIndexer(self.d, self.deploy_dir)
+        self.pkgs_list = RpmPkgsList(self.d, self.deploy_dir, arch_var, os_var)
 
         self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
 
-
     def insert_feeds_uris(self):
         if self.feed_uris == "":
             return
@@ -442,39 +649,6 @@ class RpmPM(PackageManager):
             bb.fatal("Could not invoke smart. Command "
                      "'%s' returned %d:\n%s" % (cmd, e.returncode, e.output))
 
-    '''
-    Translate the RPM/Smart format names to the OE multilib format names
-    '''
-    def _pkg_translate_smart_to_oe(self, pkg, arch):
-        new_pkg = pkg
-        fixed_arch = arch.replace('_', '-')
-        found = 0
-        for mlib in self.ml_prefix_list:
-            for cmp_arch in self.ml_prefix_list[mlib]:
-                fixed_cmp_arch = cmp_arch.replace('_', '-')
-                if fixed_arch == fixed_cmp_arch:
-                    if mlib == 'default':
-                        new_pkg = pkg
-                        new_arch = cmp_arch
-                    else:
-                        new_pkg = mlib + '-' + pkg
-                        # We need to strip off the ${mlib}_ prefix on the arch
-                        new_arch = cmp_arch.replace(mlib + '_', '')
-
-                    # Workaround for bug 3565. Simply look to see if we
-                    # know of a package with that name, if not try again!
-                    filename = os.path.join(self.d.getVar('PKGDATA_DIR', True),
-                                            'runtime-reverse',
-                                            new_pkg)
-                    if os.path.exists(filename):
-                        found = 1
-                        break
-
-            if found == 1 and fixed_arch == fixed_cmp_arch:
-                break
-        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
-        return new_pkg, new_arch
-
     def _search_pkg_name_in_feeds(self, pkg, feed_archs):
         for arch in feed_archs:
             arch = arch.replace('-', '_')
@@ -815,56 +989,8 @@ class RpmPM(PackageManager):
                             self.image_rpmlib,
                             symlinks=True)
 
-    def _list_pkg_deps(self):
-        cmd = [bb.utils.which(os.getenv('PATH'), "rpmresolve"),
-               "-t", self.image_rpmlib]
-
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the package dependencies. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
-
-        return output
-
     def list_installed(self, format=None):
-        if format == "deps":
-            return self._list_pkg_deps()
-
-        cmd = self.rpm_cmd + ' --root ' + self.target_rootfs
-        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
-        cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
-
-        try:
-            # bb.note(cmd)
-            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
-            self._unlock_rpm_db()
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
-
-        output = list()
-        for line in tmp_output.split('\n'):
-            if len(line.strip()) == 0:
-                continue
-            pkg = line.split()[0]
-            arch = line.split()[1]
-            ver = line.split()[2]
-            pkgorigin = line.split()[3]
-            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
-
-            if format == "arch":
-                output.append('%s %s' % (new_pkg, new_arch))
-            elif format == "file":
-                output.append('%s %s %s' % (new_pkg, pkgorigin, new_arch))
-            elif format == "ver":
-                output.append('%s %s %s' % (new_pkg, new_arch, ver))
-            else:
-                output.append('%s' % (new_pkg))
-
-            output.sort()
-
-        return '\n'.join(output)
+        return self.pkgs_list.list(format)
 
     '''
     If incremental install, we need to determine what we've got,
@@ -1207,43 +1333,7 @@ class OpkgPM(PackageManager):
         bb.utils.mkdirhier(self.opkg_dir)
 
     def list_installed(self, format=None):
-        opkg_query_cmd = bb.utils.which(os.getenv('PATH'), "opkg-query-helper.py")
-
-        if format == "arch":
-            cmd = "%s %s status | %s -a" % \
-                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
-        elif format == "file":
-            cmd = "%s %s status | %s -f" % \
-                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
-        elif format == "ver":
-            cmd = "%s %s status | %s -v" % \
-                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
-        elif format == "deps":
-            cmd = "%s %s status | %s" % \
-                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
-        else:
-            cmd = "%s %s list_installed | cut -d' ' -f1" % \
-                (self.opkg_cmd, self.opkg_args)
-
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
-
-        if output and format == "file":
-            tmp_output = ""
-            for line in output.split('\n'):
-                pkg, pkg_file, pkg_arch = line.split()
-                full_path = os.path.join(self.deploy_dir, pkg_arch, pkg_file)
-                if os.path.exists(full_path):
-                    tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
-                else:
-                    tmp_output += "%s %s %s\n" % (pkg, pkg_file, pkg_arch)
-
-            output = tmp_output
-
-        return output
+        return OpkgPkgsList(self.d, self.target_rootfs, self.config_file).list(format)
 
     def handle_bad_recommendations(self):
         bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True) or ""
@@ -1594,51 +1684,7 @@ class DpkgPM(PackageManager):
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
 
     def list_installed(self, format=None):
-        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
-               "--admindir=%s/var/lib/dpkg" % self.target_rootfs,
-               "-W"]
-
-        if format == "arch":
-            cmd.append("-f=${Package} ${PackageArch}\n")
-        elif format == "file":
-            cmd.append("-f=${Package} ${Package}_${Version}_${Architecture}.deb ${PackageArch}\n")
-        elif format == "ver":
-            cmd.append("-f=${Package} ${PackageArch} ${Version}\n")
-        elif format == "deps":
-            cmd.append("-f=Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n")
-        else:
-            cmd.append("-f=${Package}\n")
-
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
-
-        if format == "file":
-            tmp_output = ""
-            for line in tuple(output.split('\n')):
-                pkg, pkg_file, pkg_arch = line.split()
-                full_path = os.path.join(self.deploy_dir, pkg_arch, pkg_file)
-                if os.path.exists(full_path):
-                    tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
-                else:
-                    tmp_output += "%s %s %s\n" % (pkg, pkg_file, pkg_arch)
-
-            output = tmp_output
-        elif format == "deps":
-            opkg_query_cmd = bb.utils.which(os.getenv('PATH'), "opkg-query-helper.py")
-
-            try:
-                output = subprocess.check_output("echo -e '%s' | %s" %
-                                                 (output, opkg_query_cmd),
-                                                 stderr=subprocess.STDOUT,
-                                                 shell=True)
-            except subprocess.CalledProcessError as e:
-                bb.fatal("Cannot compute packages dependencies. Command '%s' "
-                         "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
-
-        return output
+        return DpkgPkgsList(self.d, self.target_rootfs).list()
 
 
 def generate_index_files(d):
-- 
1.7.9.5


