Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0B296FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 21:35:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 29 Sep 2016 14:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,417,1473145200"; d="scan'208";a="885231395"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga003.jf.intel.com with ESMTP; 29 Sep 2016 14:35:07 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 14:34:03 -0700
Message-Id: <20160929213405.27018-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160929213405.27018-1-stephano.cetola@linux.intel.com>
References: <20160929213405.27018-1-stephano.cetola@linux.intel.com>
Subject: [PATCH 1/3] subprocess: remove strings and migrate to direct arrays
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
X-List-Received-Date: Thu, 29 Sep 2016 21:35:32 -0000

When using subprocess call and check_output, it is better to use arrays
rather than strings when possible to avoid whitespace and quoting
problems.

[ YOCTO #9342 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oe/distro_check.py    |  2 +-
 meta/lib/oe/package.py         | 13 +++++-----
 meta/lib/oe/package_manager.py | 59 +++++++++++++++++++++---------------------
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 87c52fa..cc973c2 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -359,7 +359,7 @@ def create_log_file(d, logname):
             slogfile = os.path.join(logpath, logname)
             if os.path.exists(slogfile):
                     os.remove(slogfile)
-            subprocess.call("touch %s" % logfile, shell=True)
+            subprocess.call(["touch", logfile])
             os.symlink(logfile, slogfile)
             d.setVar('LOG_FILE', logfile)
     return logfile
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 02642f2..ae60a58 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -18,23 +18,24 @@ def runstrip(arg):
         newmode = origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
 
-    extraflags = ""
+    stripcmd = [strip]
 
     # kernel module    
     if elftype & 16:
-        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
+        stripcmd.extend(["--strip-debug", "--remove-section=.comment",
+            "--remove-section=.note", "--preserve-dates"])
     # .so and shared library
     elif ".so" in file and elftype & 8:
-        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+        stripcmd.extend(["--remove-section=.comment", "--remove-section=.note", "--strip-unneeded"])
     # shared or executable:
     elif elftype & 8 or elftype & 4:
-        extraflags = "--remove-section=.comment --remove-section=.note"
+        stripcmd.extend(["--remove-section=.comment", "--remove-section=.note"])
 
-    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
+    stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     try:
-        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT, shell=True)
+        output = subprocess.check_output(stripcmd, stderr=subprocess.STDOUT)
     except subprocess.CalledProcessError as e:
         bb.error("runstrip: '%s' strip command failed with %s (%s)" % (stripcmd, e.returncode, e.output))
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 434b898..d217073 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -358,12 +358,11 @@ class RpmPkgsList(PkgsList):
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
 
         # Determine rpm version
-        cmd = "%s --version" % self.rpm_cmd
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+            output = subprocess.check_output([self.rpm_cmd, "--version"], stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Getting rpm version failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (self.rpm_cmd, e.returncode, e.output.decode("utf-8")))
 
     '''
     Translate the RPM/Smart format names to the OE multilib format names
@@ -412,16 +411,15 @@ class RpmPkgsList(PkgsList):
         return output
 
     def list_pkgs(self):
-        cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
-        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
-        cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
+        cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
+        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
+        cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'])
 
         try:
-            # bb.note(cmd)
-            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip().decode("utf-8")
+            tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         output = dict()
         deps = dict()
@@ -949,20 +947,22 @@ class RpmPM(PackageManager):
             open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
 
         # Create database so that smart doesn't complain (lazy init)
-        opt = "-qa"
-        cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
-              self.rpm_cmd, self.target_rootfs, opt)
+        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '-qa'] 
         try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Create rpm database failed. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
         # Import GPG key to RPM database of the target system
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
             pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
-            cmd = "%s --root %s --dbpath /var/lib/rpm --import %s > /dev/null" % (
-                  self.rpm_cmd, self.target_rootfs, pubkey_path)
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '--import', pubkey_path]
+            try:
+                subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Import GPG key failed. Command '%s' "
+                        "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
 
         # Configure smart
         bb.note("configuring Smart settings")
@@ -1355,17 +1355,16 @@ class RpmPM(PackageManager):
     def dump_all_available_pkgs(self):
         available_manifest = self.d.expand('${T}/saved/available_pkgs.txt')
         available_pkgs = list()
-        cmd = "%s %s query --output %s" %  \
-              (self.smart_cmd, self.smart_opt, available_manifest)
+        cmd = [self.smart_cmd, self.smart_opt, 'query', '--output', available_manifest]
         try:
-            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
             with open(available_manifest, 'r') as manifest:
                 for pkg in manifest.read().split('\n'):
                     if '@' in pkg:
                         available_pkgs.append(pkg.strip())
         except subprocess.CalledProcessError as e:
             bb.note("Unable to list all available packages. Command '%s' "
-                    "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                    "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         self.fullpkglist = available_pkgs
 
@@ -1425,12 +1424,12 @@ class RpmPM(PackageManager):
     Returns a dictionary with the package info.
     """
     def package_info(self, pkg):
-        cmd = "%s %s info --urls %s" % (self.smart_cmd, self.smart_opt, pkg)
+        cmd = [self.smart_cmd, self.smart_opt, 'info', '--urls', pkg]
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         # Set default values to avoid UnboundLocalError
         arch = ""
@@ -1550,18 +1549,18 @@ class OpkgDpkgPM(PackageManager):
         os.chdir(tmp_dir)
 
         try:
-            cmd = "%s x %s" % (ar_cmd, pkg_path)
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-            cmd = "%s xf data.tar.*" % tar_cmd
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            cmd = [ar_cmd, 'x', pkg_path]
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            cmd = [tar_cmd, 'xf', 'data.tar.*']
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s" % (pkg_path, cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (pkg_path, ' '.join(cmd), e.returncode, e.output.decode("utf-8")))
         except OSError as e:
             bb.utils.remove(tmp_dir, recurse=True)
             bb.fatal("Unable to extract %s package. Command '%s' "
-                     "returned %d:\n%s at %s" % (pkg_path, cmd, e.errno, e.strerror, e.filename))
+                     "returned %d:\n%s at %s" % (pkg_path, ' '.join(cmd), e.errno, e.strerror, e.filename))
 
         bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
         bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
-- 
2.10.0


