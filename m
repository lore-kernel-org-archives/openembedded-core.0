Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C02970EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THcIHw013110; Fri, 29 Aug 2014 18:38:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V90U6GJwU_NM; Fri, 29 Aug 2014 18:38:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THcEDV013107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 18:38:15 +0100
Message-ID: <1409333895.29296.194.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 18:38:15 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: ronan <ronan.lemartret@open.eurogiciel.org>,
	Ed Bartosh <eduard.bartosh@intel.com>
Subject: [PATCH] package_manager: Add rpm v4 support
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
X-List-Received-Date: Fri, 29 Aug 2014 17:38:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the package manager code only supports rpm v5. To be useful outside
of OE or with OE layers using v4, it makes sense to add in rpm v4 support. This
takes a patch from "Bartosh, Eduard" <eduard.bartosh@intel.com> and enhances
it to also include versions of the workarounds from poky-eurogiciel to
allow rpm v4 usage with the class for image construction.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 612c835..86cef02 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -210,7 +210,7 @@ class PkgsList(object):
 
 
 class RpmPkgsList(PkgsList):
-    def __init__(self, d, rootfs_dir, arch_var=None, os_var=None):
+    def __init__(self, d, rootfs_dir, arch_var=None, os_var=None, rpm_version=5):
         super(RpmPkgsList, self).__init__(d, rootfs_dir)
 
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
@@ -219,6 +219,8 @@ class RpmPkgsList(PkgsList):
         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
 
+        self.rpm_version = rpm_version
+
     '''
     Translate the RPM/Smart format names to the OE multilib format names
     '''
@@ -267,11 +269,16 @@ class RpmPkgsList(PkgsList):
 
     def list(self, format=None):
         if format == "deps":
+            if self.rpm_version == 4:
+                bb.fatal("'deps' format dependency listings are not supported with rpm 4 since rpmresolve does not work")
             return self._list_pkg_deps()
 
         cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
         cmd += ' -D "_dbpath /var/lib/rpm" -qa'
-        cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
+        if self.rpm_version == 4:
+            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION}\n]'"
+        else:
+            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
 
         try:
             # bb.note(cmd)
@@ -288,7 +295,10 @@ class RpmPkgsList(PkgsList):
             pkg = line.split()[0]
             arch = line.split()[1]
             ver = line.split()[2]
-            pkgorigin = line.split()[3]
+            if self.rpm_version == 4:
+                pkgorigin = "unknown"
+            else:
+                pkgorigin = line.split()[3]
             new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
 
             if format == "arch":
@@ -554,8 +564,17 @@ class RpmPM(PackageManager):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
+        # Determine rpm version
+        cmd = "%s --version" % self.rpm_cmd
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Getting rpm version failed. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+        self.rpm_version = int(output.split()[-1].split('.')[0])
+
         self.indexer = RpmIndexer(self.d, self.deploy_dir)
-        self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var)
+        self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var, self.rpm_version)
 
         self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
 
@@ -745,43 +764,46 @@ class RpmPM(PackageManager):
         # After change the __db.* cache size, log file will not be
         # generated automatically, that will raise some warnings,
         # so touch a bare log for rpm write into it.
-        rpmlib_log = os.path.join(self.image_rpmlib, 'log', 'log.0000000001')
-        if not os.path.exists(rpmlib_log):
-            bb.utils.mkdirhier(os.path.join(self.image_rpmlib, 'log'))
-            open(rpmlib_log, 'w+').close()
-
-        DB_CONFIG_CONTENT = "# ================ Environment\n" \
-            "set_data_dir .\n" \
-            "set_create_dir .\n" \
-            "set_lg_dir ./log\n" \
-            "set_tmp_dir ./tmp\n" \
-            "set_flags db_log_autoremove on\n" \
-            "\n" \
-            "# -- thread_count must be >= 8\n" \
-            "set_thread_count 64\n" \
-            "\n" \
-            "# ================ Logging\n" \
-            "\n" \
-            "# ================ Memory Pool\n" \
-            "set_cachesize 0 1048576 0\n" \
-            "set_mp_mmapsize 268435456\n" \
-            "\n" \
-            "# ================ Locking\n" \
-            "set_lk_max_locks 16384\n" \
-            "set_lk_max_lockers 16384\n" \
-            "set_lk_max_objects 16384\n" \
-            "mutex_set_max 163840\n" \
-            "\n" \
-            "# ================ Replication\n"
-
-        db_config_dir = os.path.join(self.image_rpmlib, 'DB_CONFIG')
-        if not os.path.exists(db_config_dir):
-            open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
+        if self.rpm_version == 5:
+            rpmlib_log = os.path.join(self.image_rpmlib, 'log', 'log.0000000001')
+            if not os.path.exists(rpmlib_log):
+                bb.utils.mkdirhier(os.path.join(self.image_rpmlib, 'log'))
+                open(rpmlib_log, 'w+').close()
+
+            DB_CONFIG_CONTENT = "# ================ Environment\n" \
+                "set_data_dir .\n" \
+                "set_create_dir .\n" \
+                "set_lg_dir ./log\n" \
+                "set_tmp_dir ./tmp\n" \
+                "set_flags db_log_autoremove on\n" \
+                "\n" \
+                "# -- thread_count must be >= 8\n" \
+                "set_thread_count 64\n" \
+                "\n" \
+                "# ================ Logging\n" \
+                "\n" \
+                "# ================ Memory Pool\n" \
+                "set_cachesize 0 1048576 0\n" \
+                "set_mp_mmapsize 268435456\n" \
+                "\n" \
+                "# ================ Locking\n" \
+                "set_lk_max_locks 16384\n" \
+                "set_lk_max_lockers 16384\n" \
+                "set_lk_max_objects 16384\n" \
+                "mutex_set_max 163840\n" \
+                "\n" \
+                "# ================ Replication\n"
+
+            db_config_dir = os.path.join(self.image_rpmlib, 'DB_CONFIG')
+            if not os.path.exists(db_config_dir):
+                open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
 
         # Create database so that smart doesn't complain (lazy init)
-        cmd = "%s --root %s --dbpath /var/lib/rpm -qa > /dev/null" % (
-              self.rpm_cmd,
-              self.target_rootfs)
+        opt = "-qa"
+        if self.rpm_version == 4:
+            opt = "--initdb"
+        cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
+              self.rpm_cmd, self.target_rootfs, opt)
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -818,6 +840,9 @@ class RpmPM(PackageManager):
         # Write common configuration for host and target usage
         self._invoke_smart('config --set rpm-nolinktos=1')
         self._invoke_smart('config --set rpm-noparentdirs=1')
+        check_signature = self.d.getVar('RPM_CHECK_SIGNATURES', True)
+        if check_signature and check_signature.strip() == "0":
+            self._invoke_smart('config --set rpm-check-signatures=false')
         for i in self.d.getVar('BAD_RECOMMENDATIONS', True).split():
             self._invoke_smart('flag --set ignore-recommends %s' % i)
 
@@ -856,6 +881,11 @@ class RpmPM(PackageManager):
         # If we ever run into needing more the 899 scripts, we'll have to.
         # change num to start with 1000.
         #
+        if self.rpm_version == 4:
+            scriptletcmd = "$2 $3 $4\n"
+        else:
+            scriptletcmd = "$2 $1/$3 $4\n"
+
         SCRIPTLET_FORMAT = "#!/bin/bash\n" \
             "\n" \
             "export PATH=%s\n" \
@@ -866,7 +896,7 @@ class RpmPM(PackageManager):
             "export INTERCEPT_DIR=%s\n" \
             "export NATIVE_ROOT=%s\n" \
             "\n" \
-            "$2 $1/$3 $4\n" \
+            + scriptletcmd + \
             "if [ $? -ne 0 ]; then\n" \
             "  if [ $4 -eq 1 ]; then\n" \
             "    mkdir -p $1/etc/rpm-postinsts\n" \



