Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 880576E8E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:42:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1I9ggap023347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Feb 2014 01:42:42 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 01:42:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2014 17:42:24 +0800
Message-ID: <e35ba30b31bc2579f237c58c4d991c3f90657a1d.1392716065.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392716065.git.hongxu.jia@windriver.com>
References: <cover.1392716065.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/5] package_manager.py: support ipk incremental image generation
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
X-List-Received-Date: Tue, 18 Feb 2014 09:42:41 -0000
Content-Type: text/plain

While incremental image generation enabled, 'load_old_install_solution'
is used to determine what we've got in the previous (existed) image and
'dump_install_solution' to determine what we need to install in the
current image.

The 'backup_packaging_data' is used to back up the current opkg database.

The 'recovery_packaging_data' is used to recover the opkg database which
backed up by the previous image creation.

Tweak 'remove' function in OpkgPM class, which the options for remove
with dependencies was incorrect.

[YOCTO #1894]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager.py | 106 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 102 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6dc8fbd..4ea9677 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -934,12 +934,13 @@ class RpmPM(PackageManager):
 
 
 class OpkgPM(PackageManager):
-    def __init__(self, d, target_rootfs, config_file, archs):
+    def __init__(self, d, target_rootfs, config_file, archs, task_name='target'):
         super(OpkgPM, self).__init__(d)
 
         self.target_rootfs = target_rootfs
         self.config_file = config_file
         self.pkg_archs = archs
+        self.task_name = task_name
 
         self.deploy_dir = self.d.getVar("DEPLOY_DIR_IPK", True)
         self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
@@ -956,6 +957,13 @@ class OpkgPM(PackageManager):
 
         bb.utils.mkdirhier(self.opkg_dir)
 
+        self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
+                                               self.task_name)
+        self.saved_opkg_dir = self.d.expand('${T}/saved/%s' % self.task_name)
+        if not os.path.exists(self.d.expand('${T}/saved')):
+            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
+
+
         if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") != "1":
             self._create_config()
         else:
@@ -1075,7 +1083,9 @@ class OpkgPM(PackageManager):
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            subprocess.check_output(cmd.split())
+            bb.note(cmd)
+            output = subprocess.check_output(cmd.split())
+            bb.note(output)
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -1083,14 +1093,16 @@ class OpkgPM(PackageManager):
 
     def remove(self, pkgs, with_dependencies=True):
         if with_dependencies:
-            cmd = "%s %s remove %s" % \
+            cmd = "%s %s --force-depends --force-remove --force-removal-of-dependent-packages remove %s" % \
                 (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
         else:
             cmd = "%s %s --force-depends remove %s" % \
                 (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
 
         try:
-            subprocess.check_output(cmd.split())
+            bb.note(cmd)
+            output = subprocess.check_output(cmd.split())
+            bb.note(output)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to remove packages. Command '%s' "
                      "returned %d:\n%s" % (e.cmd, e.returncode, e.output))
@@ -1175,6 +1187,92 @@ class OpkgPM(PackageManager):
                     else:
                         status.write(line + "\n")
 
+    '''
+    If incremental install, we need to determine what we've got,
+    what we need to add, and what to remove...
+    The dump_install_solution will dump and save the new install
+    solution.
+    '''
+    def dump_install_solution(self, pkgs):
+        bb.note('creating new install solution for incremental install')
+        if len(pkgs) == 0:
+            return
+
+        install_pkgs = list()
+
+        # Create an temp dir as opkg root for simulating the installation
+        temp_rootfs = self.d.expand('${T}/opkg')
+        temp_opkg_dir = os.path.join(temp_rootfs, 'var/lib/opkg')
+        bb.utils.mkdirhier(temp_opkg_dir)
+
+        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
+        opkg_args += self.d.getVar("OPKG_ARGS", True)
+
+        cmd = "%s %s update" % (self.opkg_cmd,
+                                opkg_args)
+        try:
+            subprocess.check_output(cmd, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.note("Unable to dump install packages. Command '%s' "
+                    "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        # Simulate installation from zero
+        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
+                                                opkg_args,
+                                                ' '.join(pkgs))
+        cmd += "| awk '/^Installing/{print $2}' "
+        cmd += "| sort -u -o %s" % self.solution_manifest
+        try:
+            subprocess.check_output(cmd, shell=True)
+            with open(self.solution_manifest, 'r') as manifest:
+                for pkg in manifest.read().split('\n'):
+                    install_pkgs.append(pkg)
+        except subprocess.CalledProcessError as e:
+            bb.note("Unable to dump install packages. Command '%s' "
+                    "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        bb.utils.remove(temp_rootfs, True)
+
+        return install_pkgs
+
+    '''
+    If incremental install, we need to determine what we've got,
+    what we need to add, and what to remove...
+    The load_old_install_solution will load the previous install
+    solution
+    '''
+    def load_old_install_solution(self):
+        bb.note('load old install solution for incremental install')
+        installed_pkgs = list()
+        if not os.path.exists(self.solution_manifest):
+            bb.note('old install solution not exist')
+            return installed_pkgs
+
+        with open(self.solution_manifest, 'r') as manifest:
+            for pkg in manifest.read().split('\n'):
+                installed_pkgs.append(pkg.strip())
+
+        return installed_pkgs
+
+    def backup_packaging_data(self):
+        # Save the opkglib for increment rpm image generation
+        if os.path.exists(self.saved_opkg_dir):
+            bb.utils.remove(self.saved_opkg_dir, True)
+        shutil.copytree(self.opkg_dir,
+                        self.saved_opkg_dir,
+                        symlinks=True)
+
+    def recovery_packaging_data(self):
+        # Move the opkglib back
+        if os.path.exists(self.saved_opkg_dir):
+            if os.path.exists(self.opkg_dir):
+                bb.utils.remove(self.opkg_dir, True)
+
+            bb.note('Recovery packaging data')
+            shutil.copytree(self.saved_opkg_dir,
+                            self.opkg_dir,
+                            symlinks=True)
+
 
 class DpkgPM(PackageManager):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
-- 
1.8.1.2


