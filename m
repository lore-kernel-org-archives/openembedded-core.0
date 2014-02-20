Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27AD06F1D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:07:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1K779UZ006466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 23:07:09 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 19 Feb 2014 23:07:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2014 15:06:52 +0800
Message-ID: <24bf195849ad2eb34cb1b91ef54e51ac9b3da31f.1392877826.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392877826.git.hongxu.jia@windriver.com>
References: <cover.1392877826.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/5] package_manager.py: support ipk incremental image generation
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
X-List-Received-Date: Thu, 20 Feb 2014 07:07:12 -0000
Content-Type: text/plain

Add the following three functions to OpkgPM class:
- The 'dummy_install' is used to dummy install pkgs, and returns the log
  of output;
- The 'backup_packaging_data' is used to back up the current opkg
  database;
- The 'recover_packaging_data' is used to recover the opkg database
  which backed up by the previous image creation;

Tweak 'remove' function in OpkgPM class, which the options for remove
with dependencies was incorrect.

Tweak 'handle_bad_recommendations' function in OpkgPM class:
- Fix none value check;
- Add the existance check of opkg status file;
- Fix the log format typo;

[YOCTO #1894]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager.py | 66 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6dc8fbd..eb96727 100644
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
@@ -956,6 +957,10 @@ class OpkgPM(PackageManager):
 
         bb.utils.mkdirhier(self.opkg_dir)
 
+        self.saved_opkg_dir = self.d.expand('${T}/saved/%s' % self.task_name)
+        if not os.path.exists(self.d.expand('${T}/saved')):
+            bb.utils.mkdirhier(self.d.expand('${T}/saved'))
+
         if (self.d.getVar('BUILD_IMAGES_FROM_FEEDS', True) or "") != "1":
             self._create_config()
         else:
@@ -1075,7 +1080,9 @@ class OpkgPM(PackageManager):
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
-            subprocess.check_output(cmd.split())
+            bb.note(cmd)
+            output = subprocess.check_output(cmd.split())
+            bb.note(output)
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.note)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -1083,14 +1090,16 @@ class OpkgPM(PackageManager):
 
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
@@ -1146,12 +1155,17 @@ class OpkgPM(PackageManager):
         return output
 
     def handle_bad_recommendations(self):
-        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True)
-        if bad_recommendations is None:
+        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True) or ""
+        if bad_recommendations.strip() == "":
             return
 
         status_file = os.path.join(self.opkg_dir, "status")
 
+        # If status file existed, it means the bad recommendations has already
+        # been handled
+        if os.path.exists(status_file):
+            return
+
         cmd = "%s %s info " % (self.opkg_cmd, self.opkg_args)
 
         with open(status_file, "w+") as status:
@@ -1165,7 +1179,7 @@ class OpkgPM(PackageManager):
                              "returned %d:\n%s" % (pkg_info, e.returncode, e.output))
 
                 if output == "":
-                    bb.note("Requested ignored recommendation $i is "
+                    bb.note("Requested ignored recommendation %s is "
                             "not a package" % pkg)
                     continue
 
@@ -1175,6 +1189,44 @@ class OpkgPM(PackageManager):
                     else:
                         status.write(line + "\n")
 
+    '''
+    The following function dummy installs pkgs and returns the log of output.
+    '''
+    def dummy_install(self, pkgs):
+        if len(pkgs) == 0:
+            return
+
+        # Simulate installation
+        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
+                                                self.opkg_args,
+                                                ' '.join(pkgs))
+        try:
+            output = subprocess.check_output(cmd, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.note("Unable to dummy install packages. Command '%s' "
+                    "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        return output
+
+    def backup_packaging_data(self):
+        # Save the opkglib for increment ipk image generation
+        if os.path.exists(self.saved_opkg_dir):
+            bb.utils.remove(self.saved_opkg_dir, True)
+        shutil.copytree(self.opkg_dir,
+                        self.saved_opkg_dir,
+                        symlinks=True)
+
+    def recover_packaging_data(self):
+        # Move the opkglib back
+        if os.path.exists(self.saved_opkg_dir):
+            if os.path.exists(self.opkg_dir):
+                bb.utils.remove(self.opkg_dir, True)
+
+            bb.note('Recover packaging data')
+            shutil.copytree(self.saved_opkg_dir,
+                            self.opkg_dir,
+                            symlinks=True)
+
 
 class DpkgPM(PackageManager):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
-- 
1.8.1.2


