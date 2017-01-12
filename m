Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1C21C719B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 09:10:24 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id ey1so1152097wjd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 01:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iXvUEEUy39UXE9Bp0yDEqwiokiIy91wZSWK1vjS1Hcc=;
	b=CO9FotHPA5LdbFwkztUYkv0nV4TNPzR6gf2XmTvkJYSI5SBTcqtIqhBlYT1RDiaGHH
	dH5U04Sd6+39KqFjXaGPbSmtT5zEPUw4CZQ7xM/ACEtsj6U5mbi0NQTfaIWPg6TCPQPL
	6el1LHu/IKiuhgDtSoyUnDkri9OKRtZSozoqYHVe7xRIGMENj/1T7tdblSOUrLdSYyAo
	qFkXJjWhEk7UCe5cYxrl+DpckkNZftCUkvYXAO+SGUzVKzMTz7yDHqFZgvBu6SQRdJWR
	gGuS614lXkgJBeYD3kJzMYt9Pi6wvuUa3Fjc2FaqOcPjWotpLUgwvxjxOqXDOItAsDtY
	79JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iXvUEEUy39UXE9Bp0yDEqwiokiIy91wZSWK1vjS1Hcc=;
	b=bVUNo9Aur7pqRD2yhH+OAHNCa4hDS3mjDYHGN5r65EOBFX1wgpOVn+Bl/ZBIHkv+iJ
	/GMX+BWT6ONUevBZWa8La62eGaholergTkJvpP158DLCv9gL8lo3K/NqgTVhOTQ9UhpX
	piRuyDzsr0DskCd0ok6TX3iCABUDWDFp5L7h17czrqmwxMWeHQVWw3VWIYTQZteBbrJ9
	19E/cF6hAOpNnx3Tqvc7uqCQKZGheKBV3FHjef5cs5GgNOFZMqbGF+nszjaEUL+GOQHa
	ho2vBOHAlNx4+e1ZPbjI5zf0sEonKR9hCBvyDq6Aj6T1GJ8PmvHgZbRkRpcgDyl7+tZd
	MWBg==
X-Gm-Message-State: AIkVDXLYoKr0eprYn9Y/68Mdf/FTP4ujk1BE3P1gmZEckGERaV3R0JetMaD+CM9zdaYcGg==
X-Received: by 10.223.128.226 with SMTP id 89mr7325988wrl.130.1484212224594;
	Thu, 12 Jan 2017 01:10:24 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id w18sm2101849wme.9.2017.01.12.01.10.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Jan 2017 01:10:23 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	leonardo.sandoval.gonzalez@linux.intel.com, daniela.plascencia@intel.com
Date: Thu, 12 Jan 2017 10:08:47 +0100
Message-Id: <20170112090847.26850-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161222102320.15247-1-freesilicon@gmail.com>
References: <20161222102320.15247-1-freesilicon@gmail.com>
Subject: [PATCH v7] rootfs: Modify RPM installation
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
X-List-Received-Date: Thu, 12 Jan 2017 09:10:25 -0000

When using a custom RPM data directory instead of the default dir
'/var/lib/rpm', the final image did not contain any of the database
files in the expected location. This commit takes into account the
'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.

Changes since v4:
    - Remove boolean in d.getVar() calls.

Changes since v5:
    - Also modify rpm recipe to build the database in the correct
      location and avoid errors during rootfs creation.

Changes since v6:
    - Activate database path only for target builds to avoid host build
      errors (Thanks to Ross Burton)

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/lib/oe/package_manager.py          | 23 +++++++++++++----------
 meta/lib/oe/rootfs.py                   |  3 ++-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb |  2 ++
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a8644cc1c0..cfca178095 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -354,7 +354,8 @@ class RpmPkgsList(PkgsList):
         super(RpmPkgsList, self).__init__(d, rootfs_dir)
 
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir')
+        self.image_rpmlib = os.path.join(self.rootfs_dir, self.rpm_libdir[1:])
 
         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
@@ -414,7 +415,7 @@ class RpmPkgsList(PkgsList):
 
     def list_pkgs(self):
         cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
-        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
+        cmd.extend(['-D', '_dbpath', self.rpm_libdir])
         cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'])
 
         try:
@@ -681,7 +682,8 @@ class RpmPM(PackageManager):
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
-        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir')
+        self.image_rpmlib = os.path.join(self.target_rootfs, self.rpm_libdir[1:])
 
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
@@ -952,7 +954,7 @@ class RpmPM(PackageManager):
             open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
 
         # Create database so that smart doesn't complain (lazy init)
-        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '-qa']
+        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', self.rpm_libdir, '-qa']
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
@@ -961,20 +963,19 @@ class RpmPM(PackageManager):
         # Import GPG key to RPM database of the target system
         if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
             pubkey_path = self.d.getVar('RPM_GPG_PUBKEY')
-            cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '--import', pubkey_path]
+            cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', self.rpm_libdir, '--import', pubkey_path]
             try:
                 subprocess.check_output(cmd, stderr=subprocess.STDOUT)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Import GPG key failed. Command '%s' "
                         "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
-
         # Configure smart
         bb.note("configuring Smart settings")
         bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
                         True)
         self._invoke_smart(['config', '--set', 'rpm-root=%s' % self.target_rootfs])
-        self._invoke_smart(['config', '--set', 'rpm-dbpath=/var/lib/rpm'])
+        self._invoke_smart(['config', '--set', 'rpm-dbpath=%s' % self.rpm_libdir])
         self._invoke_smart(['config', '--set', 'rpm-extra-macros._var=%s' %
                            self.d.getVar('localstatedir')])
         cmd = ["config", "--set", "rpm-extra-macros._tmppath=/%s/tmp" % self.install_dir_name]
@@ -1234,7 +1235,7 @@ class RpmPM(PackageManager):
 
         if not with_dependencies:
             cmd = [self.rpm_cmd] + ["-e", "--nodeps", "--root=%s" %
-                    self.target_rootfs, "--dbpath=/var/lib/rpm",
+                    self.target_rootfs, "--dbpath=%s" % self.rpm_libdir,
                     "--define='_cross_scriptlet_wrapper %s'" %
                     self.scriptlet_wrapper,
                     "--define='_tmppath /%s/tmp'" % self.install_dir_name] + pkgs
@@ -1382,7 +1383,8 @@ class RpmPM(PackageManager):
         saved_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/') + new_pkg
 
         cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
-        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
+        cmd += ' --dbpath=%s ' %  self.rpm_libdir
+        cmd += new_pkg
         cmd += ' | sed -n -e "/^postinstall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}"'
         cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
         cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
@@ -1414,7 +1416,8 @@ class RpmPM(PackageManager):
     '''
     def unlock_rpm_db(self):
         # Remove rpm db lock files
-        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
+        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
+            self.rpm_libdir))
         for f in rpm_db_locks:
             bb.utils.remove(f, True)
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d9a473006a..6eb05feb6c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -429,6 +429,7 @@ class RpmRootfs(Rootfs):
 
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
+        rpm_libdir = self.d.getVar('rpmlibdir')
         rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
         rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
 
@@ -476,7 +477,7 @@ class RpmRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
+        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir, '/var/lib/smart'])
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 3df4d1ff1d..23e598dec9 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -306,6 +306,7 @@ PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
 
 PACKAGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
 
+EXTRA_OECONF_append_class-target = "--with-path-database=${rpmlibdir}"
 EXTRA_OECONF += "--verbose \
 		--sysconfdir=${sysconfdir} \
 		--with-file \
@@ -385,6 +386,7 @@ FILES_${PN} =  "${bindir}/rpm \
 		${bindir}/rpm.real \
 		${bindir}/rpmconstant.real \
 		"
+FILES_${PN}_append_class-target = "${rpmlibdir}"
 
 FILES_${PN}-common = "${bindir}/rpm2cpio \
 		${bindir}/rpm2cpio.real \
-- 
2.11.0


