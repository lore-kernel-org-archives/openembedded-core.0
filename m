Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2DFEE772D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 09:52:05 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so26864311wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 01:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k+R6tOC6X7ofJp8y9ueSmkcCk2lxWfmXkqDfnwcXrUY=;
	b=DhiBR/tthsqmTbtydEssOlala7v82VD5rCNAaKmPYLTkks56c4fzdYcnbmH8v5wpsb
	1Z9IcFJFWkbUMBxtMhCMzuDZatQjAgML5No3w1FicWdbdDBsMVWTUGeNTDO4pljTXoy/
	jTOP3npo5lxRSdyEqLy+xVs9rjTNXp0M8AcOt2CzYdP66q4DZHn09PnLW0sNtXnXaRgm
	7fcMeQC/Cd4yV42S4OxYrJVoxr1lsrQHiYAAnlbrp+bSSSnsiYKo/bOx3cj7bhyVs1vY
	JbpFj1jbaAA84LRh6J7pw424uZyda0yQOQFawIxvRxMbkg9XVtQS08Tsi/IMP3QU08kQ
	1msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k+R6tOC6X7ofJp8y9ueSmkcCk2lxWfmXkqDfnwcXrUY=;
	b=nSdlYYx9G6d/Tu2dQdNWnVvQWMxdz92JqxIQRq6AyNxzee/3CFcmTaJS+LJtx/R82F
	ieOSA1nK87v7Z+pqib6BLCx6ujnDGKvoCzCJ0ow720z0INawyHoQ7sfygdN5XN4P6S+P
	EkUQRq5klpxrIjANQm7PmX1Vpig5EdKXj7qLF7viGl1xo52REuejN28BG7PBHD8ETNyX
	zoww0QG+FfvazUIXxbTwSCjLLna/R0e2HsbR0hLoDNfTekCn9KMTFgjevmMiFLxGCmQI
	6Kk8H6/Q2EJ22ECXCWN4riO4LjxaHJgTjPxuck7n9LAxO0nKMqPXLfS5BxDNjCcTgeWg
	B9WA==
X-Gm-Message-State: AKaTC005oGLomUUBi03VqyWObn4zOz4irgq7VCGAI0vc30O9Dmcaeqz6JAwVxD94u44uEw==
X-Received: by 10.194.222.132 with SMTP id qm4mr20908897wjc.150.1482227526893; 
	Tue, 20 Dec 2016 01:52:06 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	r7sm24672578wjp.43.2016.12.20.01.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 01:52:06 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	leonardo.sandoval.gonzalez@linux.intel.com, daniela.plascencia@intel.com
Date: Tue, 20 Dec 2016 10:51:22 +0100
Message-Id: <20161220095122.11831-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161212155909.8946-1-freesilicon@gmail.com>
References: <20161212155909.8946-1-freesilicon@gmail.com>
Subject: [PATCH v5] rootfs: Modify RPM installation
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
X-List-Received-Date: Tue, 20 Dec 2016 09:52:06 -0000

When using a custom RPM data directory instead of the default dir
'/var/lib/rpm', the final image did not contain any of the database
files in the expected location. This commit takes into account the
'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.

Changes since v4:
    - Remove boolean in d.getVar() calls.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/lib/oe/package_manager.py | 23 +++++++++++++----------
 meta/lib/oe/rootfs.py          |  3 ++-
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e557473999..4299220eec 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -356,7 +356,8 @@ class RpmPkgsList(PkgsList):
         super(RpmPkgsList, self).__init__(d, rootfs_dir)
 
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir')
+        self.image_rpmlib = os.path.join(self.rootfs_dir, self.rpm_libdir[1:])
 
         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
@@ -416,7 +417,7 @@ class RpmPkgsList(PkgsList):
 
     def list_pkgs(self):
         cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
-        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
+        cmd.extend(['-D', '_dbpath', self.rpm_libdir])
         cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'])
 
         try:
@@ -683,7 +684,8 @@ class RpmPM(PackageManager):
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
-        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir')
+        self.image_rpmlib = os.path.join(self.target_rootfs, self.rpm_libdir[1:])
 
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
@@ -954,7 +956,7 @@ class RpmPM(PackageManager):
             open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
 
         # Create database so that smart doesn't complain (lazy init)
-        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', '/var/lib/rpm', '-qa']
+        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath', self.rpm_libdir, '-qa']
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
@@ -963,20 +965,19 @@ class RpmPM(PackageManager):
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
@@ -1236,7 +1237,7 @@ class RpmPM(PackageManager):
 
         if not with_dependencies:
             cmd = [self.rpm_cmd] + ["-e", "--nodeps", "--root=%s" %
-                    self.target_rootfs, "--dbpath=/var/lib/rpm",
+                    self.target_rootfs, "--dbpath=%s" % self.rpm_libdir,
                     "--define='_cross_scriptlet_wrapper %s'" %
                     self.scriptlet_wrapper,
                     "--define='_tmppath /%s/tmp'" % self.install_dir_name] + pkgs
@@ -1384,7 +1385,8 @@ class RpmPM(PackageManager):
         saved_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/') + new_pkg
 
         cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
-        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
+        cmd += ' --dbpath=%s ' %  self.rpm_libdir
+        cmd += new_pkg
         cmd += ' | sed -n -e "/^postinstall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}"'
         cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
         cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
@@ -1416,7 +1418,8 @@ class RpmPM(PackageManager):
     '''
     def unlock_rpm_db(self):
         # Remove rpm db lock files
-        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
+        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
+            self.rpm_libdir))
         for f in rpm_db_locks:
             bb.utils.remove(f, True)
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d9a473006a..8730025816 100644
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
 
-- 
2.11.0


