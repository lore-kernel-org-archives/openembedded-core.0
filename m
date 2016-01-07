Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A578060249
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 04:11:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jan 2016 20:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,536,1444719600"; d="scan'208";a="886244288"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 20:11:18 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 20:07:34 +0000
Message-Id: <9e6bafc54f3f770f519378d962cfc1947ee9c368.1452191688.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1452191688.git.mariano.lopez@linux.intel.com>
References: <cover.1452191688.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1452191688.git.mariano.lopez@linux.intel.com>
References: <cover.1452191688.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/4] lib/oe/package_manager: Add list_pkgs() to PkgsList class
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
X-List-Received-Date: Fri, 08 Jan 2016 04:11:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently the class PkgList returns a formated string of the
installed packages. It would be more clean to pass a standard
data structure to the callers instead to format the output
inside PkgsList class.

This patch adds list_pkgs() method to PkgsList class to get the
all the information for installed packages and return a dictionary
with the info.

[YOCTO #7427]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 120 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 32afeaf..95e7ae7 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -296,6 +296,45 @@ class PkgsList(object):
     def list(self, format=None):
         pass
 
+    @abstractmethod
+    def list_pkgs(self):
+        pass
+
+    def opkg_query(self, cmd_output):
+        verregex = re.compile(' \([=<>]* [^ )]*\)')
+        output = dict()
+        filename = ""
+        dep = []
+        for line in cmd_output.splitlines():
+            line = line.rstrip()
+            if ':' in line:
+                if line.startswith("Package: "):
+                    pkg = line.split(": ")[1]
+                elif line.startswith("Architecture: "):
+                    arch = line.split(": ")[1]
+                elif line.startswith("Version: "):
+                    ver = line.split(": ")[1]
+                elif line.startswith("File: "):
+                    filename = line.split(": ")[1]
+                elif line.startswith("Depends: "):
+                    depends = verregex.sub('', line.split(": ")[1])
+                    for depend in depends.split(", "):
+                        dep.append(depend)
+                elif line.startswith("Recommends: "):
+                    recommends = verregex.sub('', line.split(": ")[1])
+                    for recommend in recommends.split(", "):
+                        dep.append("%s [REC]" % recommend)
+            else:
+                # IPK doesn't include the filename
+                if not filename:
+                    filename = "%s_%s_%s.ipk" % (pkg, ver, arch)
+                output[pkg] = {"arch":arch, "ver":ver,
+                            "filename":filename, "deps": dep }
+                filename = ""
+                dep = []
+
+        return output
+
 
 class RpmPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, arch_var=None, os_var=None):
@@ -412,6 +451,59 @@ class RpmPkgsList(PkgsList):
 
         return '\n'.join(output)
 
+    def list_pkgs(self):
+        cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
+        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
+        if self.rpm_version == 4:
+            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION}\n]'"
+        else:
+            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
+
+        try:
+            # bb.note(cmd)
+            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        output = dict()
+        deps = dict()
+        if self.rpm_version == 4:
+            bb.warn("Dependency listings are not supported with rpm 4 since rpmresolve does not work")
+            dependencies = ""
+        else:
+            dependencies = self._list_pkg_deps()
+
+        # Populate deps dictionary for better manipulation
+        for line in dependencies.splitlines():
+            pkg, dep = line.split("|")
+            if not pkg in deps:
+                deps[pkg] = list()
+            if not dep in deps[pkg]:
+                deps[pkg].append(dep)
+
+        for line in tmp_output.split('\n'):
+            if len(line.strip()) == 0:
+                continue
+            pkg = line.split()[0]
+            arch = line.split()[1]
+            ver = line.split()[2]
+            dep = deps.get(pkg, [])
+
+            # Skip GPG keys
+            if pkg == 'gpg-pubkey':
+                continue
+            if self.rpm_version == 4:
+                pkgorigin = "unknown"
+            else:
+                pkgorigin = line.split()[3]
+            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
+
+            output[new_pkg] = {"arch":new_arch, "ver":ver,
+                        "filename":pkgorigin, "deps":dep}
+
+        return output
+
 
 class OpkgPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, config_file):
@@ -466,6 +558,19 @@ class OpkgPkgsList(PkgsList):
 
         return '\n'.join(output)
 
+    def list_pkgs(self, format=None):
+        cmd = "%s %s status" % (self.opkg_cmd, self.opkg_args)
+
+        try:
+            # bb.note(cmd)
+            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
+
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        return self.opkg_query(cmd_output)
+
 
 class DpkgPkgsList(PkgsList):
     def list(self, format=None):
@@ -523,6 +628,21 @@ class DpkgPkgsList(PkgsList):
 
         return output
 
+    def list_pkgs(self):
+        cmd = [bb.utils.which(os.getenv('PATH'), "dpkg-query"),
+               "--admindir=%s/var/lib/dpkg" % self.rootfs_dir,
+               "-W"]
+
+        cmd.append("-f=Package: ${Package}\nArchitecture: ${PackageArch}\nVersion: ${Version}\nFile: ${Package}_${Version}_${Architecture}.deb\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n")
+
+        try:
+            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
+
+        return self.opkg_query(cmd_output)
+
 
 class PackageManager(object):
     """
-- 
1.8.4.5


