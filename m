Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D77FA6F57A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 16:37:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2014 08:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,578,1389772800"; d="scan'208";a="465587426"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2014 08:36:43 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 18:36:39 +0200
Message-Id: <76ae0f6d71f83e226496abc288d6aceef270384f.1393864497.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393864497.git.laurentiu.palcu@intel.com>
References: <cover.1393864497.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1393864497.git.laurentiu.palcu@intel.com>
References: <cover.1393864497.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] image.py, rootfs.py, package_manager.py: redirect stderr to stdout when calling check_output()
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
X-List-Received-Date: Mon, 03 Mar 2014 16:37:04 -0000

If a command executed with subprocess.check_output() fails, the
subprocess.CalledProcessError.output contains only STDOUT and the user
needs to check the log.do_rootfs to see any other details.

This commit forwards stderr to stdout so that, in case of failure, the
entire error output will be displayed in terminal.

[YOCTO #5902]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/image.py           |    2 +-
 meta/lib/oe/package_manager.py |   48 +++++++++++++++++++++-------------------
 meta/lib/oe/rootfs.py          |    2 +-
 3 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 488683e..a03b73e 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -11,7 +11,7 @@ def generate_image(arg):
             (type, create_img_cmd))
 
     try:
-        subprocess.check_output(create_img_cmd)
+        subprocess.check_output(create_img_cmd, stderr=subprocess.STDOUT)
     except subprocess.CalledProcessError as e:
         return("Error: The image creation script '%s' returned %d:\n%s" %
                (e.cmd, e.returncode, e.output))
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ff4f1de..90884cd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -14,7 +14,7 @@ def create_index(arg):
 
     try:
         bb.note("Executing '%s' ..." % index_cmd)
-        subprocess.check_output(index_cmd, shell=True)
+        subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True)
     except subprocess.CalledProcessError as e:
         return("Index creation command '%s' failed with return code %d:\n%s" %
                (e.cmd, e.returncode, e.output))
@@ -298,7 +298,7 @@ class PackageManager(object):
                globs]
         try:
             bb.note("Installing complementary packages ...")
-            complementary_pkgs = subprocess.check_output(cmd)
+            complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not compute complementary packages list. Command "
                      "'%s' returned %d:\n%s" %
@@ -387,7 +387,9 @@ class RpmPM(PackageManager):
         cmd = "%s %s %s" % (self.smart_cmd, self.smart_opt, args)
         # bb.note(cmd)
         try:
-            complementary_pkgs = subprocess.check_output(cmd, shell=True)
+            complementary_pkgs = subprocess.check_output(cmd,
+                                                         stderr=subprocess.STDOUT,
+                                                         shell=True)
             # bb.note(complementary_pkgs)
             return complementary_pkgs
         except subprocess.CalledProcessError as e:
@@ -569,7 +571,7 @@ class RpmPM(PackageManager):
               self.rpm_cmd,
               self.target_rootfs)
         try:
-            subprocess.check_output(cmd, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Create rpm database failed. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
@@ -691,7 +693,7 @@ class RpmPM(PackageManager):
             cmd = "%s %s install --attempt -y %s" % \
                   (self.smart_cmd, self.smart_opt, ' '.join(pkgs))
         try:
-            output = subprocess.check_output(cmd.split())
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to install packages. Command '%s' "
@@ -721,7 +723,7 @@ class RpmPM(PackageManager):
 
         try:
             bb.note(cmd)
-            output = subprocess.check_output(cmd, shell=True)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.note("Unable to remove packages. Command '%s' "
@@ -772,7 +774,7 @@ class RpmPM(PackageManager):
 
         try:
             # bb.note(cmd)
-            tmp_output = subprocess.check_output(cmd, shell=True).strip()
+            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
             self._unlock_rpm_db()
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
@@ -824,7 +826,7 @@ class RpmPM(PackageManager):
             # Disable rpmsys channel for the fake install
             self._invoke_smart('channel --disable rpmsys')
 
-            subprocess.check_output(cmd, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
             with open(self.solution_manifest, 'r') as manifest:
                 for pkg in manifest.read().split('\n'):
                     if '@' in pkg:
@@ -866,7 +868,7 @@ class RpmPM(PackageManager):
         cmd = "%s %s query --output %s" %  \
               (self.smart_cmd, self.smart_opt, available_manifest)
         try:
-            subprocess.check_output(cmd, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
             with open(available_manifest, 'r') as manifest:
                 for pkg in manifest.read().split('\n'):
                     if '@' in pkg:
@@ -900,7 +902,7 @@ class RpmPM(PackageManager):
 
         try:
             bb.note(cmd)
-            output = subprocess.check_output(cmd, shell=True).strip()
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
             bb.note(output)
             os.chmod(saved_dir, 0755)
             self._unlock_rpm_db()
@@ -1056,7 +1058,7 @@ class OpkgPM(PackageManager):
         cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
 
         try:
-            subprocess.check_output(cmd.split())
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             self.deploy_dir_unlock()
             bb.fatal("Unable to update the package index files. Command '%s' "
@@ -1081,7 +1083,7 @@ class OpkgPM(PackageManager):
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
             bb.note(cmd)
-            output = subprocess.check_output(cmd.split())
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
             bb.note(output)
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
@@ -1098,7 +1100,7 @@ class OpkgPM(PackageManager):
 
         try:
             bb.note(cmd)
-            output = subprocess.check_output(cmd.split())
+            output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
             bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to remove packages. Command '%s' "
@@ -1136,7 +1138,7 @@ class OpkgPM(PackageManager):
                 (self.opkg_cmd, self.opkg_args)
 
         try:
-            output = subprocess.check_output(cmd, shell=True).strip()
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
@@ -1174,7 +1176,7 @@ class OpkgPM(PackageManager):
                 pkg_info = cmd + pkg
 
                 try:
-                    output = subprocess.check_output(pkg_info.split()).strip()
+                    output = subprocess.check_output(pkg_info.split(), stderr=subprocess.STDOUT).strip()
                 except subprocess.CalledProcessError as e:
                     bb.fatal("Cannot get package info. Command '%s' "
                              "returned %d:\n%s" % (pkg_info, e.returncode, e.output))
@@ -1207,7 +1209,7 @@ class OpkgPM(PackageManager):
 
         cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
         try:
-            subprocess.check_output(cmd, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to update. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
@@ -1217,7 +1219,7 @@ class OpkgPM(PackageManager):
                                                 opkg_args,
                                                 ' '.join(pkgs))
         try:
-            output = subprocess.check_output(cmd, shell=True)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to dummy install packages. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
@@ -1327,7 +1329,7 @@ class DpkgPM(PackageManager):
                     try:
                         bb.note("Executing %s for package: %s ..." %
                                  (suffix[1].lower(), pkg_name))
-                        subprocess.check_output(p_full)
+                        subprocess.check_output(p_full, stderr=subprocess.STDOUT)
                     except subprocess.CalledProcessError as e:
                         bb.note("%s for package %s failed with %d:\n%s" %
                                 (suffix[1], pkg_name, e.returncode, e.output))
@@ -1345,7 +1347,7 @@ class DpkgPM(PackageManager):
         cmd = "%s update" % self.apt_get_cmd
 
         try:
-            subprocess.check_output(cmd.split())
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to update the package index files. Command '%s' "
                      "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
@@ -1363,7 +1365,7 @@ class DpkgPM(PackageManager):
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            subprocess.check_output(cmd.split())
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -1395,7 +1397,7 @@ class DpkgPM(PackageManager):
                    self.target_rootfs, self.target_rootfs, ' '.join(pkgs))
 
         try:
-            subprocess.check_output(cmd.split())
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to remove packages. Command '%s' "
                      "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
@@ -1478,7 +1480,7 @@ class DpkgPM(PackageManager):
         cmd = "%s %s -f install" % (self.apt_get_cmd, self.apt_args)
 
         try:
-            subprocess.check_output(cmd.split())
+            subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot fix broken dependencies. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
@@ -1498,7 +1500,7 @@ class DpkgPM(PackageManager):
             cmd.append("-f=${Package}\n")
 
         try:
-            output = subprocess.check_output(cmd).strip()
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
                      "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index be0afa6..90c0504 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -57,7 +57,7 @@ class Rootfs(object):
             exec_cmd = cmd
 
         try:
-            subprocess.check_output(exec_cmd)
+            subprocess.check_output(exec_cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             return("Command '%s' returned %d:\n%s" % (e.cmd, e.returncode, e.output))
 
-- 
1.7.9.5


