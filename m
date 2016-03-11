Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9AB734B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 14:07:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Mar 2016 06:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="921777288"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.4.28])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2016 06:07:44 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 14:07:31 +0000
Message-Id: <521346160846f3f727ad37005efbc89cd83643ef.1457705106.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457705106.git.joshua.g.lock@intel.com>
References: <cover.1457705106.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1457705106.git.joshua.g.lock@intel.com>
References: <cover.1457705106.git.joshua.g.lock@intel.com>
Subject: [RFC PATCH 3/3] lib/package_manager: remove RPM4 support code
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
X-List-Received-Date: Fri, 11 Mar 2016 14:07:47 -0000

Simplify the RPM code by removing support for RPM 4 now that we've
dropped the RPM 4 recipe.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/package_manager.py | 94 +++++++++++++++++-------------------------
 1 file changed, 38 insertions(+), 56 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b701b8c..239ae4e 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -345,7 +345,6 @@ class RpmPkgsList(PkgsList):
         except subprocess.CalledProcessError as e:
             bb.fatal("Getting rpm version failed. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
-        self.rpm_version = int(output.split()[-1].split('.')[0])
 
     '''
     Translate the RPM/Smart format names to the OE multilib format names
@@ -396,10 +395,7 @@ class RpmPkgsList(PkgsList):
     def list_pkgs(self):
         cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
         cmd += ' -D "_dbpath /var/lib/rpm" -qa'
-        if self.rpm_version == 4:
-            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION}\n]'"
-        else:
-            cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
+        cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
 
         try:
             # bb.note(cmd)
@@ -410,11 +406,7 @@ class RpmPkgsList(PkgsList):
 
         output = dict()
         deps = dict()
-        if self.rpm_version == 4:
-            bb.warn("Dependency listings are not supported with rpm 4 since rpmresolve does not work")
-            dependencies = ""
-        else:
-            dependencies = self._list_pkg_deps()
+        dependencies = self._list_pkg_deps()
 
         # Populate deps dictionary for better manipulation
         for line in dependencies.splitlines():
@@ -439,10 +431,8 @@ class RpmPkgsList(PkgsList):
             # Skip GPG keys
             if pkg == 'gpg-pubkey':
                 continue
-            if self.rpm_version == 4:
-                pkgorigin = "unknown"
-            else:
-                pkgorigin = line.split()[3]
+
+            pkgorigin = line.split()[3]
             new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
 
             output[new_pkg] = {"arch":new_arch, "ver":ver,
@@ -675,7 +665,6 @@ class RpmPM(PackageManager):
 
         self.indexer = RpmIndexer(self.d, self.deploy_dir)
         self.pkgs_list = RpmPkgsList(self.d, self.target_rootfs, arch_var, os_var)
-        self.rpm_version = self.pkgs_list.rpm_version
 
         self.ml_prefix_list, self.ml_os_list = self.indexer.get_ml_prefix_and_os_list(arch_var, os_var)
 
@@ -897,44 +886,41 @@ class RpmPM(PackageManager):
         # After change the __db.* cache size, log file will not be
         # generated automatically, that will raise some warnings,
         # so touch a bare log for rpm write into it.
-        if self.rpm_version == 5:
-            rpmlib_log = os.path.join(self.image_rpmlib, 'log', 'log.0000000001')
-            if not os.path.exists(rpmlib_log):
-                bb.utils.mkdirhier(os.path.join(self.image_rpmlib, 'log'))
-                open(rpmlib_log, 'w+').close()
-
-            DB_CONFIG_CONTENT = "# ================ Environment\n" \
-                "set_data_dir .\n" \
-                "set_create_dir .\n" \
-                "set_lg_dir ./log\n" \
-                "set_tmp_dir ./tmp\n" \
-                "set_flags db_log_autoremove on\n" \
-                "\n" \
-                "# -- thread_count must be >= 8\n" \
-                "set_thread_count 64\n" \
-                "\n" \
-                "# ================ Logging\n" \
-                "\n" \
-                "# ================ Memory Pool\n" \
-                "set_cachesize 0 1048576 0\n" \
-                "set_mp_mmapsize 268435456\n" \
-                "\n" \
-                "# ================ Locking\n" \
-                "set_lk_max_locks 16384\n" \
-                "set_lk_max_lockers 16384\n" \
-                "set_lk_max_objects 16384\n" \
-                "mutex_set_max 163840\n" \
-                "\n" \
-                "# ================ Replication\n"
-
-            db_config_dir = os.path.join(self.image_rpmlib, 'DB_CONFIG')
-            if not os.path.exists(db_config_dir):
-                open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
+        rpmlib_log = os.path.join(self.image_rpmlib, 'log', 'log.0000000001')
+        if not os.path.exists(rpmlib_log):
+            bb.utils.mkdirhier(os.path.join(self.image_rpmlib, 'log'))
+            open(rpmlib_log, 'w+').close()
+
+        DB_CONFIG_CONTENT = "# ================ Environment\n" \
+            "set_data_dir .\n" \
+            "set_create_dir .\n" \
+            "set_lg_dir ./log\n" \
+            "set_tmp_dir ./tmp\n" \
+            "set_flags db_log_autoremove on\n" \
+            "\n" \
+            "# -- thread_count must be >= 8\n" \
+            "set_thread_count 64\n" \
+            "\n" \
+            "# ================ Logging\n" \
+            "\n" \
+            "# ================ Memory Pool\n" \
+            "set_cachesize 0 1048576 0\n" \
+            "set_mp_mmapsize 268435456\n" \
+            "\n" \
+            "# ================ Locking\n" \
+            "set_lk_max_locks 16384\n" \
+            "set_lk_max_lockers 16384\n" \
+            "set_lk_max_objects 16384\n" \
+            "mutex_set_max 163840\n" \
+            "\n" \
+            "# ================ Replication\n"
+
+        db_config_dir = os.path.join(self.image_rpmlib, 'DB_CONFIG')
+        if not os.path.exists(db_config_dir):
+            open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
 
         # Create database so that smart doesn't complain (lazy init)
         opt = "-qa"
-        if self.rpm_version == 4:
-            opt = "--initdb"
         cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
               self.rpm_cmd, self.target_rootfs, opt)
         try:
@@ -1021,12 +1007,8 @@ class RpmPM(PackageManager):
         # If we ever run into needing more the 899 scripts, we'll have to.
         # change num to start with 1000.
         #
-        if self.rpm_version == 4:
-            scriptletcmd = "$2 $3 $4\n"
-            scriptpath = "$3"
-        else:
-            scriptletcmd = "$2 $1/$3 $4\n"
-            scriptpath = "$1/$3"
+        scriptletcmd = "$2 $1/$3 $4\n"
+        scriptpath = "$1/$3"
 
         # When self.debug_level >= 3, also dump the content of the
         # executed scriptlets and how they get invoked.  We have to
-- 
2.5.0


