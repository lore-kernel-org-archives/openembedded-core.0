Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 096666FFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 22:37:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jan 2016 14:37:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,314,1449561600"; d="scan'208";a="863308262"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga001.jf.intel.com with ESMTP; 18 Jan 2016 14:37:07 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:33:07 +0000
Message-Id: <6eeb1d449e566e659c3da25ec5a6ef6b92c6c832.1453127396.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453127396.git.mariano.lopez@linux.intel.com>
References: <cover.1453127396.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1453127396.git.mariano.lopez@linux.intel.com>
References: <cover.1453127396.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 4/4] lib/oe/package_manager.py: Remove list() from PkgsList class
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
X-List-Received-Date: Mon, 18 Jan 2016 22:37:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Now that the method list() is not used anymore, remove it.

[YOCTO #7427]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 153 -----------------------------------------
 1 file changed, 153 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6d02630..6a6e3e9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -293,10 +293,6 @@ class PkgsList(object):
         self.rootfs_dir = rootfs_dir
 
     @abstractmethod
-    def list(self, format=None):
-        pass
-
-    @abstractmethod
     def list_pkgs(self):
         pass
 
@@ -416,56 +412,6 @@ class RpmPkgsList(PkgsList):
 
         return output
 
-    def list(self, format=None):
-        if format == "deps":
-            if self.rpm_version == 4:
-                bb.fatal("'deps' format dependency listings are not supported with rpm 4 since rpmresolve does not work")
-            return self._list_pkg_deps()
-
-        cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
-        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
-        if self.rpm_version == 4:
-            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION}\n]'"
-        else:
-            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
-
-        try:
-            # bb.note(cmd)
-            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
-
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
-            # Skip GPG keys
-            if pkg == 'gpg-pubkey':
-                continue
-            if self.rpm_version == 4:
-                pkgorigin = "unknown"
-            else:
-                pkgorigin = line.split()[3]
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
-
     def list_pkgs(self):
         cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
         cmd += ' -D "_dbpath /var/lib/rpm" -qa'
@@ -528,51 +474,6 @@ class OpkgPkgsList(PkgsList):
         self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
         self.opkg_args += self.d.getVar("OPKG_ARGS", True)
 
-    def list(self, format=None):
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
-            # bb.note(cmd)
-            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
-
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
-
-        output = list()
-        for line in tmp_output.split('\n'):
-            if len(line.strip()) == 0:
-                continue
-            if format == "file":
-                pkg, pkg_file, pkg_arch = line.split()
-                full_path = os.path.join(self.rootfs_dir, pkg_arch, pkg_file)
-                if os.path.exists(full_path):
-                    output.append('%s %s %s' % (pkg, full_path, pkg_arch))
-                else:
-                    output.append('%s %s %s' % (pkg, pkg_file, pkg_arch))
-            else:
-                output.append(line)
-
-        output.sort()
-
-        return '\n'.join(output)
-
     def list_pkgs(self, format=None):
         cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
 
@@ -588,60 +489,6 @@ class OpkgPkgsList(PkgsList):
 
 
 class DpkgPkgsList(PkgsList):
-    def list(self, format=None):
-        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
-               "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
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
-                if not line.strip():
-                    continue
-                pkg, pkg_file, pkg_arch = line.split()
-                full_path = os.path.join(self.rootfs_dir, pkg_arch, pkg_file)
-                if os.path.exists(full_path):
-                    tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
-                else:
-                    tmp_output += "%s %s %s\n" % (pkg, pkg_file, pkg_arch)
-
-            output = tmp_output
-        elif format == "deps":
-            opkg_query_cmd = bb.utils.which(os.getenv('PATH'), "opkg-query-helper.py")
-            file_out = tempfile.NamedTemporaryFile()
-            file_out.write(output)
-            file_out.flush()
-
-            try:
-                output = subprocess.check_output("cat %s | %s" %
-                                                 (file_out.name, opkg_query_cmd),
-                                                 stderr=subprocess.STDOUT,
-                                                 shell=True)
-            except subprocess.CalledProcessError as e:
-                file_out.close()
-                bb.fatal("Cannot compute packages dependencies. Command '%s' "
-                         "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
-
-            file_out.close()
-
-        return output
 
     def list_pkgs(self):
         cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
-- 
1.8.4.5


