Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8544371A6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 16:00:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so12172540wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 08:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2J7qsIptvAE6LAKh25KO8Es3iYzsdS9MxDTywAG9dJU=;
	b=SvkTmFhYbmR3muxvj7SYvKa8w0cc/jxIxkYCZ1OwF9OTqBjxgXPa445EvT5MDNnFH4
	yFyirEzBW+hGSuTA3o3Ibf/zO10JLoIrV23qhwFS0cDam+/UJ0CHo08LGtpsvUWRA6lk
	EXOXADVWRYicPdKisEyXKqIv8vL88BsgqqIuJU6NiOGXsYpJmOlLvsBSx4Gquqvyj9aA
	vZzJbDU/Q5x7p78Y3eE9uNPmihioJvlIU+lUpd2NrAIKsuJNZsqJJeG0kDsOTMk7Jlmt
	U9juTjvWJoDqcLaxf6OipM1XmgKVSFtzrNSBd9rFCKtT2Bez/Pb4duCY+RzJ7oBYyfe9
	qh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2J7qsIptvAE6LAKh25KO8Es3iYzsdS9MxDTywAG9dJU=;
	b=E3sJqycQiiLzbRqzAL6YdR8W6id9pqdqjpXFgCHWooMteQXyosBjuCU0GwviLYHR2k
	VyYxIXI391nzmNtRNt3ASlixeWaBnW1Jf82QBr9+Myzt9NM1a0TxZtzahese4VrZju4o
	nKy4FFD5QlJRM0t2wTwkljU/iLTCCNdqeYF6UYrGWvma+pNzZMOVBI24xTYE2rgnMrAh
	ypaz1KQvbHBEaza38etTd6nSyxT2HphkG6g4WJmZgze3kWmjDtEmW/zGSxVdVcz74zfM
	5N1RNN0aoVGxjrkUAmKi87ZnJL9tROk/dp1ufnYoXcPanbMKoqQ8vQ2isRVQivUxtU7g
	1KZg==
X-Gm-Message-State: AKaTC03M02AMbKnniBNGnEkmI3OYc+w+8mIoUMfWiR0wmVqZAv1I8MJSSii3kWjzqQY1Gw==
X-Received: by 10.28.7.130 with SMTP id 124mr17451575wmh.18.1481558444123;
	Mon, 12 Dec 2016 08:00:44 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	q65sm36121218wmd.6.2016.12.12.08.00.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Dec 2016 08:00:43 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	leonardo.sandoval.gonzalez@linux.intel.com, daniela.plascencia@intel.com
Date: Mon, 12 Dec 2016 16:59:09 +0100
Message-Id: <20161212155909.8946-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161124104959.32350-1-freesilicon@gmail.com>
References: <20161124104959.32350-1-freesilicon@gmail.com>
Subject: [PATCH v4] rootfs: Modify RPM installation
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
X-List-Received-Date: Mon, 12 Dec 2016 16:00:43 -0000

When using a custom RPM data directory instead of the default dir
'/var/lib/rpm', the final image did not contain any of the database
files in the expected location. This commit takes into account the
'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/lib/oe/package_manager.py | 23 +++++++++++++----------
 meta/lib/oe/rootfs.py          |  3 ++-
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e5e3c3b679..e063eeeeee 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -352,7 +352,8 @@ class RpmPkgsList(PkgsList):
         super(RpmPkgsList, self).__init__(d, rootfs_dir)
 
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
+        self.image_rpmlib = os.path.join(self.rootfs_dir, self.rpm_libdir[1:])
 
         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
@@ -412,7 +413,7 @@ class RpmPkgsList(PkgsList):
 
     def list_pkgs(self):
         cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
-        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
+        cmd.extend(['-D', '_dbpath', self.rpm_libdir])
         cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'])
 
         try:
@@ -679,7 +680,8 @@ class RpmPM(PackageManager):
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
-        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
+        self.image_rpmlib = os.path.join(self.target_rootfs, self.rpm_libdir[1:])
 
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
@@ -950,7 +952,7 @@ class RpmPM(PackageManager):
             open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
 
         # Create database so that smart doesn't complain (lazy init)
-        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '-qa']
+        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', self.rpm_libdir, '-qa']
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
@@ -959,20 +961,19 @@ class RpmPM(PackageManager):
         # Import GPG key to RPM database of the target system
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
             pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
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
                            self.d.getVar('localstatedir', True)])
         cmd = ["config", "--set", "rpm-extra-macros._tmppath=/%s/tmp" % self.install_dir_name]
@@ -1232,7 +1233,7 @@ class RpmPM(PackageManager):
 
         if not with_dependencies:
             cmd = [self.rpm_cmd] + ["-e", "--nodeps", "--root=%s" %
-                    self.target_rootfs, "--dbpath=/var/lib/rpm",
+                    self.target_rootfs, "--dbpath=%s" % self.rpm_libdir,
                     "--define='_cross_scriptlet_wrapper %s'" %
                     self.scriptlet_wrapper,
                     "--define='_tmppath /%s/tmp'" % self.install_dir_name] + pkgs
@@ -1380,7 +1381,8 @@ class RpmPM(PackageManager):
         saved_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/') + new_pkg
 
         cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
-        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
+        cmd += ' --dbpath=%s ' %  self.rpm_libdir
+        cmd += new_pkg
         cmd += ' | sed -n -e "/^postinstall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}"'
         cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
         cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
@@ -1412,7 +1414,8 @@ class RpmPM(PackageManager):
     '''
     def unlock_rpm_db(self):
         # Remove rpm db lock files
-        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
+        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
+            self.rpm_libdir))
         for f in rpm_db_locks:
             bb.utils.remove(f, True)
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a348b975c2..7cf8ce84ca 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -426,6 +426,7 @@ class RpmRootfs(Rootfs):
 
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
+        rpm_libdir = self.d.getVar('rpmlibdir', True)
         rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS', True)
         rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS', True)
 
@@ -473,7 +474,7 @@ class RpmRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
+        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir, '/var/lib/smart'])
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
-- 
2.11.0


