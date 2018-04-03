Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CC5F771A84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069207"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:20 +0300
Message-Id: <20180403154524.31588-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
References: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/8] package_manager.py: move intercept running logic from rootfs class to PackageManager class
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
X-List-Received-Date: Tue, 03 Apr 2018 15:51:53 -0000

This allows running the intercepts when creating SDKs, which previously
wasn't possible, as SDK code does not use the rootfs class, and calls
into PackageManager methods directly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 58 ++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/rootfs.py          | 64 +-----------------------------------------
 2 files changed, 59 insertions(+), 63 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5b52fc9e713..6c85a6d2c78 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -348,6 +348,54 @@ class PackageManager(object, metaclass=ABCMeta):
         bb.utils.remove(self.intercepts_dir, True)
         shutil.copytree(postinst_intercepts_dir, self.intercepts_dir)
 
+    @abstractmethod
+    def _handle_intercept_failure(self, failed_script):
+        pass
+
+    def _postpone_to_first_boot(self, postinst_intercept_hook):
+        with open(postinst_intercept_hook) as intercept:
+            registered_pkgs = None
+            for line in intercept.read().split("\n"):
+                m = re.match("^##PKGS:(.*)", line)
+                if m is not None:
+                    registered_pkgs = m.group(1).strip()
+                    break
+
+            if registered_pkgs is not None:
+                bb.note("If an image is being built, the postinstalls for the following packages "
+                        "will be postponed for first boot: %s" %
+                        registered_pkgs)
+
+                # call the backend dependent handler
+                self._handle_intercept_failure(registered_pkgs)
+
+
+    def run_intercepts(self):
+        intercepts_dir = self.intercepts_dir
+
+        bb.note("Running intercept scripts:")
+        os.environ['D'] = self.target_rootfs
+        os.environ['STAGING_DIR_NATIVE'] = self.d.getVar('STAGING_DIR_NATIVE')
+        for script in os.listdir(intercepts_dir):
+            script_full = os.path.join(intercepts_dir, script)
+
+            if script == "postinst_intercept" or not os.access(script_full, os.X_OK):
+                continue
+
+            if script == "delay_to_first_boot":
+                self._postpone_to_first_boot(script_full)
+                continue
+
+            bb.note("> Executing %s intercept ..." % script)
+
+            try:
+                output = subprocess.check_output(script_full, stderr=subprocess.STDOUT)
+                if output: bb.note(output.decode("utf-8"))
+            except subprocess.CalledProcessError as e:
+                bb.warn("The postinstall intercept hook '%s' failed, details in log.do_rootfs" % script)
+                bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
+                self._postpone_to_first_boot(script_full)
+
     @abstractmethod
     def update(self):
         """
@@ -897,6 +945,14 @@ class RpmPM(PackageManager):
         open(saved_script_name, 'w').write(output)
         os.chmod(saved_script_name, 0o755)
 
+    def _handle_intercept_failure(self, registered_pkgs):
+        rpm_postinsts_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
+        bb.utils.mkdirhier(rpm_postinsts_dir)
+
+        # Save the package postinstalls in /etc/rpm-postinsts
+        for pkg in registered_pkgs.split():
+            self.save_rpmpostinst(pkg)
+
     def extract(self, pkg):
         output = self._invoke_dnf(["repoquery", "--queryformat", "%{location}", pkg])
         pkg_name = output.splitlines()[-1]
@@ -1000,6 +1056,8 @@ class OpkgDpkgPM(PackageManager):
 
         return tmp_dir
 
+    def _handle_intercept_failure(self, registered_pkgs):
+        self.mark_packages("unpacked", registered_pkgs.split())
 
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target'):
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 600a685d68f..f8f717c0505 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -92,10 +92,6 @@ class Rootfs(object, metaclass=ABCMeta):
                 self.d.getVar('PACKAGE_FEED_ARCHS'))
 
 
-    @abstractmethod
-    def _handle_intercept_failure(self, failed_script):
-        pass
-
     """
     The _cleanup() method should be used to clean-up stuff that we don't really
     want to end up on target. For example, in the case of RPM, the DB locks.
@@ -197,7 +193,7 @@ class Rootfs(object, metaclass=ABCMeta):
 
         execute_pre_post_process(self.d, rootfs_post_install_cmds)
 
-        self._run_intercepts()
+        self.pm.run_intercepts()
 
         execute_pre_post_process(self.d, post_process_cmds)
 
@@ -283,50 +279,6 @@ class Rootfs(object, metaclass=ABCMeta):
             # Remove the package manager data files
             self.pm.remove_packaging_data()
 
-    def _postpone_to_first_boot(self, postinst_intercept_hook):
-        with open(postinst_intercept_hook) as intercept:
-            registered_pkgs = None
-            for line in intercept.read().split("\n"):
-                m = re.match("^##PKGS:(.*)", line)
-                if m is not None:
-                    registered_pkgs = m.group(1).strip()
-                    break
-
-            if registered_pkgs is not None:
-                bb.note("The postinstalls for the following packages "
-                        "will be postponed for first boot: %s" %
-                        registered_pkgs)
-
-                # call the backend dependent handler
-                self._handle_intercept_failure(registered_pkgs)
-
-
-    def _run_intercepts(self):
-        intercepts_dir = self.pm.intercepts_dir
-
-        bb.note("Running intercept scripts:")
-        os.environ['D'] = self.image_rootfs
-        os.environ['STAGING_DIR_NATIVE'] = self.d.getVar('STAGING_DIR_NATIVE')
-        for script in os.listdir(intercepts_dir):
-            script_full = os.path.join(intercepts_dir, script)
-
-            if script == "postinst_intercept" or not os.access(script_full, os.X_OK):
-                continue
-
-            if script == "delay_to_first_boot":
-                self._postpone_to_first_boot(script_full)
-                continue
-
-            bb.note("> Executing %s intercept ..." % script)
-
-            try:
-                output = subprocess.check_output(script_full, stderr=subprocess.STDOUT)
-                if output: bb.note(output.decode("utf-8"))
-            except subprocess.CalledProcessError as e:
-                bb.warn("The postinstall intercept hook '%s' failed, details in log.do_rootfs" % script)
-                bb.note("Exit code %d. Output:\n%s" % (e.returncode, e.output.decode("utf-8")))
-                self._postpone_to_first_boot(script_full)
-
     def _run_ldconfig(self):
         if self.d.getVar('LDCONFIGDEPEND'):
             bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c new -v")
@@ -519,14 +471,6 @@ class RpmRootfs(Rootfs):
         self._log_check_warn()
         self._log_check_error()
 
-    def _handle_intercept_failure(self, registered_pkgs):
-        rpm_postinsts_dir = self.image_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
-        bb.utils.mkdirhier(rpm_postinsts_dir)
-
-        # Save the package postinstalls in /etc/rpm-postinsts
-        for pkg in registered_pkgs.split():
-            self.pm.save_rpmpostinst(pkg)
-
     def _cleanup(self):
         self.pm._invoke_dnf(["clean", "all"])
 
@@ -707,9 +651,6 @@ class DpkgRootfs(DpkgOpkgRootfs):
         src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/info")
         return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
 
-    def _handle_intercept_failure(self, registered_pkgs):
-        self.pm.mark_packages("unpacked", registered_pkgs.split())
-
     def _log_check(self):
         self._log_check_warn()
         self._log_check_error()
@@ -978,9 +919,6 @@ class OpkgRootfs(DpkgOpkgRootfs):
         src_postinst_dir = self.d.expand("${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info")
         return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
 
-    def _handle_intercept_failure(self, registered_pkgs):
-        self.pm.mark_packages("unpacked", registered_pkgs.split())
-
     def _log_check(self):
         self._log_check_warn()
         self._log_check_error()
-- 
2.16.1


