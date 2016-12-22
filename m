Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87B14774DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 10:24:17 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id ez4so1061345wjd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4/ABuTfpid+q5Cj2QY4Cmm1jHdf55ZFSChpmIvMgsJw=;
	b=SKt6aPtuEL4UNwXlMLG6DExFZPZqTEunH2w/ZxUtdoYdqI1UP0g/57MFGe571tJFIp
	nCcTfWdMHBXx4S7jzT7etofsjI5YWO+z4XATyGGreC9DXb6gJTFnpT4U9Q00KZfxlnZ3
	8u1YiDp8agEvHHy7QHoEfCC8rMURV0fOm51ztp0RrldnKA2ZSNgaLtzGDOKUgXrEwShR
	EA0lUbdu/0ZiI7SdE6OxpR4z/aT44pq0Dci3KOEubfeS74OxOTTjHIIdgHQgLsyLKpXs
	akUm4cojoKZzxN/PuELabPXC9ke3JMAkgon94+4uHSE3g1MfGY/jA+Vn1O2anmZpKfJK
	ALVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4/ABuTfpid+q5Cj2QY4Cmm1jHdf55ZFSChpmIvMgsJw=;
	b=XtnacET0enVfaDxl+zcJIx1FtjOzD5Pp16rEIAXUUIKz6M4Q1Uy2DvYuEYVK/EjK+g
	tqWzuQZwhOxekVx/UDEAK1e1mt/la6pU+l7p1RfsfzzYofNndGw7mj5L+0FHqaIrfmo8
	b4ZFx/vXXd0db3TVeiuNl3RkGTk0W6XKSm4F6Q2DJr3HVD4fu85s8YOjvgbi4F3UBb8p
	c4DzknSyokN8c6CkM1MWhHc5hhb3aNXSFdZKqJqtcRIAMUPd6FLLxPAuwva79bw6D2+l
	cTOoiljtSC2Opg+Xx4FCu6lEOO86XE48Z+8BSHVxs/yUMRY3hvSigqpgShDvQ7BWt0FZ
	+x+g==
X-Gm-Message-State: AIkVDXLL9wQA5EjPnS2n0zllgEjp5z6DaeDtUHG7fjtHuo3Z/ovp+Ne6EjAN8vVd0/o51Q==
X-Received: by 10.194.161.65 with SMTP id xq1mr8516713wjb.104.1482402258052;
	Thu, 22 Dec 2016 02:24:18 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	l74sm31413228wmg.2.2016.12.22.02.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Dec 2016 02:24:17 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	leonardo.sandoval.gonzalez@linux.intel.com, daniela.plascencia@intel.com
Date: Thu, 22 Dec 2016 11:23:20 +0100
Message-Id: <20161222102320.15247-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161220095122.11831-1-freesilicon@gmail.com>
References: <20161220095122.11831-1-freesilicon@gmail.com>
Subject: [PATCH v6] rootfs: Modify RPM installation
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
X-List-Received-Date: Thu, 22 Dec 2016 10:24:18 -0000

When using a custom RPM data directory instead of the default dir
'/var/lib/rpm', the final image did not contain any of the database
files in the expected location. This commit takes into account the
'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.

Changes since v4:
    - Remove boolean in d.getVar() calls.

Changes since v5:
    - Also modify rpm recipe to build the database in the correct
      location and avoid errors during rootfs creation.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/lib/oe/package_manager.py          | 23 +++++++++++++----------
 meta/lib/oe/rootfs.py                   |  3 ++-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb |  2 ++
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e557473999..3f2878c394 100644
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
index 3df4d1ff1d..12181d89b1 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -342,6 +342,7 @@ EXTRA_OECONF += "--verbose \
 		--enable-build-warnings \
 		--enable-build-debug \
 		--enable-maintainer-mode \
+		--with-path-database=${rpmlibdir} \
 		--with-path-macros=${rpm_macros} \
 		--with-path-lib=${libdir}/rpm \
 		--with-bugreport=http://bugzilla.yoctoproject.org \
@@ -384,6 +385,7 @@ FILES_${PN} =  "${bindir}/rpm \
 		${localstatedir}/lib/wdj \
 		${bindir}/rpm.real \
 		${bindir}/rpmconstant.real \
+		${rpmlibdir} \
 		"
 
 FILES_${PN}-common = "${bindir}/rpm2cpio \
-- 
2.11.0


