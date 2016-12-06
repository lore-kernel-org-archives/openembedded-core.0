Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id D49236059F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:08 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id D5833B8B280; Tue,  6 Dec 2016 12:49:53 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:38 +0100
Message-Id: <1481024991-5882-21-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 20/33] package_manager/deb: let apt-get handle postinst scripts
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:09 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/lib/oe/package_manager.py | 86 ++++--------------------------------------
 meta/lib/oe/rootfs.py          |  6 +--
 2 files changed, 9 insertions(+), 83 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 4ef4f6d..12dff20 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1959,84 +1959,6 @@ class DpkgPM(OpkgDpkgPM):
 
         self.indexer = DpkgIndexer(self.d, self.deploy_dir)
 
-    """
-    This function will change a package's status in /var/lib/dpkg/status file.
-    If 'packages' is None then the new_status will be applied to all
-    packages
-    """
-    def mark_packages(self, status_tag, packages=None):
-        status_file = self.target_rootfs + "/var/lib/dpkg/status"
-
-        with open(status_file, "r") as sf:
-            with open(status_file + ".tmp", "w+") as tmp_sf:
-                if packages is None:
-                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
-                                        r"Package: \1\n\2Status: \3%s" % status_tag,
-                                        sf.read()))
-                else:
-                    if type(packages).__name__ != "list":
-                        raise TypeError("'packages' should be a list object")
-
-                    status = sf.read()
-                    for pkg in packages:
-                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
-                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
-                                        status)
-
-                    tmp_sf.write(status)
-
-        os.rename(status_file + ".tmp", status_file)
-
-    """
-    Run the pre/post installs for package "package_name". If package_name is
-    None, then run all pre/post install scriptlets.
-    """
-    def run_pre_post_installs(self, package_name=None):
-        info_dir = self.target_rootfs + "/var/lib/dpkg/info"
-        ControlScript = collections.namedtuple("ControlScript", ["suffix", "name", "argument"])
-        control_scripts = [
-                ControlScript(".preinst", "Preinstall", "install"),
-                ControlScript(".postinst", "Postinstall", "configure")]
-        status_file = self.target_rootfs + "/var/lib/dpkg/status"
-        installed_pkgs = []
-
-        with open(status_file, "r") as status:
-            for line in status.read().split('\n'):
-                m = re.match("^Package: (.*)", line)
-                if m is not None:
-                    installed_pkgs.append(m.group(1))
-
-        if package_name is not None and not package_name in installed_pkgs:
-            return
-
-        os.environ['D'] = self.target_rootfs
-        os.environ['OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
-        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR', True),
-                                                   "intercept_scripts")
-        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE', True)
-
-        failed_pkgs = []
-        for pkg_name in installed_pkgs:
-            for control_script in control_scripts:
-                p_full = os.path.join(info_dir, pkg_name + control_script.suffix)
-                if os.path.exists(p_full):
-                    try:
-                        bb.note("Executing %s for package: %s ..." %
-                                 (control_script.name.lower(), pkg_name))
-                        subprocess.check_output([p_full, control_script.argument],
-                                stderr=subprocess.STDOUT)
-                    except subprocess.CalledProcessError as e:
-                        bb.note("%s for package %s failed with %d:\n%s" %
-                                (control_script.name, pkg_name, e.returncode,
-                                    e.output.decode("utf-8")))
-                        failed_pkgs.append(pkg_name)
-                        break
-
-        if len(failed_pkgs):
-            self.mark_packages("unpacked", failed_pkgs)
-
     def update(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
@@ -2058,6 +1980,14 @@ class DpkgPM(OpkgDpkgPM):
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR', True),
+                                                   "intercept_scripts")
+        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE', True)
+
         cmd = "%s %s install --force-yes --allow-unauthenticated %s" % \
               (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a348b97..4c82456 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -685,10 +685,6 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         self.pm.fix_broken_dependencies()
 
-        self.pm.mark_packages("installed")
-
-        self.pm.run_pre_post_installs()
-
         execute_pre_post_process(self.d, deb_post_process_cmds)
 
         if self.progress_reporter:
@@ -708,7 +704,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
         return self._save_postinsts_common(dst_postinst_dir, src_postinst_dir)
 
     def _handle_intercept_failure(self, registered_pkgs):
-        self.pm.mark_packages("unpacked", registered_pkgs.split())
+        pass
 
     def _log_check(self):
         self._log_check_warn()
-- 
2.7.4


