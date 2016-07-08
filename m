Return-Path: <freesilicon@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4536F60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 07:52:26 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id l202so6248966ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=r5fVQPySJAqV4UI4L8p1X5+NM7uCIBIlL1DUJ8ZWZd0=;
	b=diCedthpLILCNmk3h/iCtxwqaIt0CzUtEbDMfvfxSoW8WjV1Yc5+7v3ZU7JSIsXlqQ
	jIfOzELdAXloAKlBZej16hmSDpoZ0x6w1in2PY7P+culS2QsOu/3QurADHk56UbSb63M
	yb5zN4PREUQDZpS4SzzCve0klnobwa3EqDiGw6wHflAOEgR2zmdWspLJidVJch2n3Plb
	UE8R7ZDuadLn5bzCYsPUHrgrRE/FDpImHtIW7aXhX4NxA7f09yhabvxFtkQOuZ6RIwm4
	eBrtmsnNCAvdgZ9femY3Ffd4cuVVSw6B6Mzqod1IPj5JR2ae/BGH6qKCpbUXNYiW1U3J
	Yrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=r5fVQPySJAqV4UI4L8p1X5+NM7uCIBIlL1DUJ8ZWZd0=;
	b=S/Zd6jVTfachaPICbus6tpq6qrHdnFsATGF2jUbOvwBSp0qcEuNZmSHyVKrB+5OA+T
	fmr17xnAdmWOtwyZQPe7DhhYQMlfwYFIa0HOwH45Yk4gjd9Z9Ng0aHWKJ8T/kJOgWURA
	rTjZkJraq8OYFyhUP6Qj9C45gfEwZe4YuyajFHz6E0f1gEqQSUhmq3LJ8C/0yQQEYDuu
	QwyKNa4iaQeNpevRmHZb7xqEKCfhapNh37YlaM7HLMAE4BkM8e5RMW/bayZeRJhmikHZ
	r39vudCb9smsXMey+kXpxZ3cYJrUUqi7ECkjOtMiAkelOJF9hLEZzuY026Ae0TVxDbUd
	CECQ==
X-Gm-Message-State: ALyK8tJ8Yo5jAeJ8D/jqXkFdrAywecLdSoIS7i1mtAg5I3F25CiSPXfjC1l4Mgvwb5F8CwVaLTID1BESJOajhg==
X-Received: by 10.107.15.92 with SMTP id x89mr7232073ioi.190.1467964346939;
	Fri, 08 Jul 2016 00:52:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.38.17 with HTTP; Fri, 8 Jul 2016 00:52:26 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
Date: Fri, 8 Jul 2016 09:52:26 +0200
Message-ID: <CAKRNOGzb7Z4OW-VyrZyGZWKmHXCbn7w55Eyeto6Rs61LFt0-hg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rootfs: Modify RPM installation
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
X-List-Received-Date: Fri, 08 Jul 2016 07:52:28 -0000
Content-Type: text/plain; charset=UTF-8

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
index 2004a42..8dd7567 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -351,7 +351,8 @@ class RpmPkgsList(PkgsList):
         super(RpmPkgsList, self).__init__(d, rootfs_dir)

         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
+        self.image_rpmlib = os.path.join(self.rootfs_dir, self.rpm_libdir[1:])

         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d,
rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
@@ -412,7 +413,7 @@ class RpmPkgsList(PkgsList):

     def list_pkgs(self):
         cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
-        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
+        cmd += ' -D "_dbpath %s" -qa' % self.rpm_libdir
         cmd += " --qf '[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]'"

         try:
@@ -680,7 +681,8 @@ class RpmPM(PackageManager):
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
-        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
+        self.image_rpmlib = os.path.join(self.target_rootfs,
self.rpm_libdir[1:])

         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
@@ -944,8 +946,8 @@ class RpmPM(PackageManager):

         # Create database so that smart doesn't complain (lazy init)
         opt = "-qa"
-        cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
-              self.rpm_cmd, self.target_rootfs, opt)
+        cmd = "%s --root %s --dbpath %s %s > /dev/null" % (
+              self.rpm_cmd, self.target_rootfs, self.rpm_libdir, opt)
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -954,8 +956,8 @@ class RpmPM(PackageManager):
         # Import GPG key to RPM database of the target system
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
             pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
-            cmd = "%s --root %s --dbpath /var/lib/rpm --import %s >
/dev/null" % (
-                  self.rpm_cmd, self.target_rootfs, pubkey_path)
+            cmd = "%s --root %s --dbpath %s --import %s > /dev/null" % (
+                  self.rpm_cmd, self.target_rootfs, self.rpm_libdir,
pubkey_path)
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)

         # Configure smart
@@ -963,7 +965,7 @@ class RpmPM(PackageManager):
         bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
                         True)
         self._invoke_smart('config --set rpm-root=%s' % self.target_rootfs)
-        self._invoke_smart('config --set rpm-dbpath=/var/lib/rpm')
+        self._invoke_smart('config --set rpm-dbpath=%s' % self.rpm_libdir)
         self._invoke_smart('config --set rpm-extra-macros._var=%s' %
                            self.d.getVar('localstatedir', True))
         cmd = "config --set rpm-extra-macros._tmppath=/%s/tmp" %
(self.install_dir_name)
@@ -1212,7 +1214,7 @@ class RpmPM(PackageManager):
         if not with_dependencies:
             cmd = "%s -e --nodeps " % self.rpm_cmd
             cmd += "--root=%s " % self.target_rootfs
-            cmd += "--dbpath=/var/lib/rpm "
+            cmd += "--dbpath=%s " % self.rpm_libdir
             cmd += "--define='_cross_scriptlet_wrapper %s' " % \
                    self.scriptlet_wrapper
             cmd += "--define='_tmppath /%s/tmp' %s" %
(self.install_dir_name, ' '.join(pkgs))
@@ -1366,7 +1368,8 @@ class RpmPM(PackageManager):
         saved_dir = self.target_rootfs +
self.d.expand('${sysconfdir}/rpm-postinsts/') + new_pkg

         cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
-        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
+        cmd += ' --dbpath=%s ' %  self.rpm_libdir
+        cmd += new_pkg
         cmd += ' | sed -n -e "/^postinstall scriptlet (using
.*):$/,/^.* scriptlet (using .*):$/ {/.*/p}"'
         cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
         cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
@@ -1398,7 +1401,8 @@ class RpmPM(PackageManager):
     '''
     def unlock_rpm_db(self):
         # Remove rpm db lock files
-        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
+        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
+            self.rpm_libdir))
         for f in rpm_db_locks:
             bb.utils.remove(f, True)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 1fc35bd..b20402b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -410,6 +410,7 @@ class RpmRootfs(Rootfs):

     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
+        rpm_libdir = self.d.getVar('rpmlibdir', True)
         rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS', True)
         rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS', True)

@@ -439,7 +440,7 @@ class RpmRootfs(Rootfs):

         self.pm.install_complementary()

-        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
+        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir, '/var/lib/smart'])

         execute_pre_post_process(self.d, rpm_post_process_cmds)

-- 
2.9.0

