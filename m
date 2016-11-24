Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2855E71B0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 09:41:03 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id f8so2855844wje.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 01:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iPjauSz9NowgD2iveh1x5MHPiD7XB40KXd3Wm0EveAU=;
	b=IIRlEoHq7GyY7X1ghjbDcTnLYbr3i1UQTnCZ7o2t0mlNRf7mvoY8hpl9ratE9QT9xL
	BXeZD7z68PJQWEr2GDqsil+ZtaLvpKhxps+RiDPEOT3SphnO4lQy5RF8hvt9CHfib8d0
	0bGGPNRd1DylJJDzP1Eli4c7kDAHEm8APcUPy7vVo75XlBePcZpGCLr9Q1WF9PrLT6eh
	MJFEgzU0swODoavIb3ai2yNMqlk3fQBk0+m+2xklamMIN8wNEmmHflbJXMmOVv3F8n3E
	jQfYh8OnAtzaIF/VxIltcEpgAp+nHV91us9XsOGZvqTVGTngtESDqtD5m5sWycJT50e5
	L1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iPjauSz9NowgD2iveh1x5MHPiD7XB40KXd3Wm0EveAU=;
	b=KeU4bAcr+3xSNP6QPLrJ6wBiHKoRRSDkQOtJrkvfHyM+fksAA4xEdC5E+ZWOAVyW+K
	tMHzb0s7KW/SEdGPpU80+fJp40tsG34yXmrZb3+foj+75CXlTk84obcIhwOCPJJj5uLX
	XO5jC++ZbrX0dEH8IKCfsfoIYQJuHwIybevGMkZ5Ghw3sqaCRer4V9YEfEesjIHeHVIq
	46V0XzV4eabFA46Pi/rt25QdH8z51vDixOEhhPwk/Jdb/F6zFB03v80+TQRk6iPVvkIT
	JeC0SUbig4uGn8cpnzkNMin2qGJsuemCFtqagIm1h6pRk/YJihbEwtSZR4AAZSWM84x1
	75yw==
X-Gm-Message-State: AKaTC01C0iZTzrc3adKHWWZcjoTBUzaDPXlujy/lWgD/TkDHWxFx21Gnw7NT8ejxqPnPng==
X-Received: by 10.194.37.6 with SMTP id u6mr1586638wjj.20.1479980464870;
	Thu, 24 Nov 2016 01:41:04 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	c187sm7249614wmd.13.2016.11.24.01.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 01:41:04 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	leonardo.sandoval.gonzalez@linux.intel.com, daniela.plascencia@intel.com
Date: Thu, 24 Nov 2016 10:39:38 +0100
Message-Id: <20161124093939.29483-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <CAKRNOGzb7Z4OW-VyrZyGZWKmHXCbn7w55Eyeto6Rs61LFt0-hg@mail.gmail.com>
References: <CAKRNOGzb7Z4OW-VyrZyGZWKmHXCbn7w55Eyeto6Rs61LFt0-hg@mail.gmail.com>
Subject: [PATCH v3] rootfs: Modify RPM installation
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
X-List-Received-Date: Thu, 24 Nov 2016 09:41:04 -0000

When using a custom RPM data directory instead of the default dir
'/var/lib/rpm', the final image did not contain any of the database
files in the expected location. This commit takes into account the
'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/lib/oe/package_manager.py | 26 +++++++++++++++-----------
 meta/lib/oe/rootfs.py          |  3 ++-
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7ba2e4d..6344543 100644
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
@@ -413,7 +414,7 @@ class RpmPkgsList(PkgsList):
 
     def list_pkgs(self):
         cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
-        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
+        cmd += ' -D "_dbpath %s" -qa' % self.rpm_libdir
         cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"
 
         try:
@@ -681,7 +682,8 @@ class RpmPM(PackageManager):
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
-        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
+        self.image_rpmlib = os.path.join(self.target_rootfs, self.rpm_libdir[1:])
 
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
@@ -950,8 +952,8 @@ class RpmPM(PackageManager):
 
         # Create database so that smart doesn't complain (lazy init)
         opt = "-qa"
-        cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
-              self.rpm_cmd, self.target_rootfs, opt)
+        cmd = "%s --root %s --dbpath %s %s > /dev/null" % (
+              self.rpm_cmd, self.target_rootfs, self.rpm_libdir, opt)
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -960,8 +962,8 @@ class RpmPM(PackageManager):
         # Import GPG key to RPM database of the target system
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
             pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
-            cmd = "%s --root %s --dbpath /var/lib/rpm --import %s > /dev/null" % (
-                  self.rpm_cmd, self.target_rootfs, pubkey_path)
+            cmd = "%s --root %s --dbpath %s --import %s > /dev/null" % (
+                  self.rpm_cmd, self.target_rootfs, self.rpm_libdir, pubkey_path)
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
         # Configure smart
@@ -969,7 +971,7 @@ class RpmPM(PackageManager):
         bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
                         True)
         self._invoke_smart('config --set rpm-root=%s' % self.target_rootfs)
-        self._invoke_smart('config --set rpm-dbpath=/var/lib/rpm')
+        self._invoke_smart('config --set rpm-dbpath=%s' % self.rpm_libdir)
         self._invoke_smart('config --set rpm-extra-macros._var=%s' %
                            self.d.getVar('localstatedir', True))
         cmd = "config --set rpm-extra-macros._tmppath=/%s/tmp" % (self.install_dir_name)
@@ -1231,7 +1233,7 @@ class RpmPM(PackageManager):
         if not with_dependencies:
             cmd = "%s -e --nodeps " % self.rpm_cmd
             cmd += "--root=%s " % self.target_rootfs
-            cmd += "--dbpath=/var/lib/rpm "
+            cmd += "--dbpath=%s " % self.rpm_libdir
             cmd += "--define='_cross_scriptlet_wrapper %s' " % \
                    self.scriptlet_wrapper
             cmd += "--define='_tmppath /%s/tmp' %s" % (self.install_dir_name, ' '.join(pkgs))
@@ -1385,7 +1387,8 @@ class RpmPM(PackageManager):
         saved_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/') + new_pkg
 
         cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
-        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
+        cmd += ' --dbpath=%s ' %  self.rpm_libdir
+        cmd += new_pkg
         cmd += ' | sed -n -e "/^postinstall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}"'
         cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
         cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
@@ -1417,7 +1420,8 @@ class RpmPM(PackageManager):
     '''
     def unlock_rpm_db(self):
         # Remove rpm db lock files
-        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
+        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
+            self.rpm_libdir))
         for f in rpm_db_locks:
             bb.utils.remove(f, True)
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a348b97..7cf8ce8 100644
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
2.10.2


