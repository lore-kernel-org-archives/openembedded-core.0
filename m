Return-Path: <freesilicon@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89E5560119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 07:57:22 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id f6so141745ith.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 00:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=XhJDZ0DvzDMlN5ldYO5LEC5qSjKn1sSQ3YoZ/0lM5GE=;
	b=bJaUpHcwIqzMa6WVeB9MpVme0YrpJTszYw3DA0gtzyRj+X1/EOlrcQyBAmSqapNHly
	axr3A2VVT5R2dWFJbER+RC57VbmEs+VULZeIvRk58BEC3yqjdYQNfuM8kQyJesfh0+5Q
	7t/G+JY0o2HuGOKnNqnOthhKjokMA8QK92w9pHByRxfPHIqeLA/nR5qsw8oaob1mZFwG
	PgsvCJMyJRhe0M668YcZWJVdypl9Wr+l4ZezTteoPwBNR/dS3652rZ9GBfhy9EVZXk/A
	DH1Wa12BK+hfcsyPh3lpBzE7LJUzhPjd1RhS1W9mUnTao2jmWSz+xgl32J+TXZY3qfkr
	4cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XhJDZ0DvzDMlN5ldYO5LEC5qSjKn1sSQ3YoZ/0lM5GE=;
	b=EnL0+2VgZz++RGe+Rl3YYeJpxgvgeNZI3j5RF8tYXXMwLWGpnOA3nJfpsDJID6tqaE
	ZxjCWvukaQq37d07CwGsyah/Rksa9hSwCH/Gy98AdKK5RmeVdGqbb0daAuUFDB3Yu+rw
	0Mmho+d4DGUdKRc5WAn14DiF0+NwTa0GdExM/8b7Qq6ksbIe7Sysppn8wJtjLHGlIU9F
	Dhj4kSt+CtCkmzlORL0lQ18v8oMTc1F/JNN5NEh/fhSyQXgi8QSfx2IKWNNaOoshigjc
	P2uRTfMprTHzFaBiQQtQ3ED0czcY6n/AJnZAxXgGqqxRuzJAc1FFb88qPfO9MkkD7QCn
	N7EA==
X-Gm-Message-State: ALyK8tKAN3HdhZ3poX5M6JYZ5R3s7ooFVciP7QWY+F0NZYXHuFqjqfgj6GKcvmUhP+PaczsgI6kDyIUSRXo1SA==
X-Received: by 10.36.146.132 with SMTP id l126mr1840791itd.67.1467964643141;
	Fri, 08 Jul 2016 00:57:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.38.17 with HTTP; Fri, 8 Jul 2016 00:57:22 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
Date: Fri, 8 Jul 2016 09:57:22 +0200
Message-ID: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][jethro] rootfs: Modify RPM installation
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
X-List-Received-Date: Fri, 08 Jul 2016 07:57:28 -0000
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
index b9fa6d8..83c9858 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -302,7 +302,8 @@ class RpmPkgsList(PkgsList):
         super(RpmPkgsList, self).__init__(d, rootfs_dir)

         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
+        self.image_rpmlib = os.path.join(self.rootfs_dir, self.rpm_libdir[1:])

         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d,
rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
@@ -369,7 +370,7 @@ class RpmPkgsList(PkgsList):
             return self._list_pkg_deps()

         cmd = self.rpm_cmd + ' --root ' + self.rootfs_dir
-        cmd += ' -D "_dbpath /var/lib/rpm" -qa'
+        cmd += ' -D "_dbpath %s" -qa' % self.rpm_libdir
         if self.rpm_version == 4:
             cmd += " --qf '[%{NAME} %{ARCH} %{VERSION}\n]'"
         else:
@@ -670,7 +671,8 @@ class RpmPM(PackageManager):
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         self.saved_rpmlib = self.d.expand('${T}/saved/%s' % self.task_name)
-        self.image_rpmlib = os.path.join(self.target_rootfs, 'var/lib/rpm')
+        self.rpm_libdir = self.d.getVar('rpmlibdir', True)
+        self.image_rpmlib = os.path.join(self.target_rootfs,
self.rpm_libdir[1:])

         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
@@ -924,8 +926,8 @@ class RpmPM(PackageManager):
         opt = "-qa"
         if self.rpm_version == 4:
             opt = "--initdb"
-        cmd = "%s --root %s --dbpath /var/lib/rpm %s > /dev/null" % (
-              self.rpm_cmd, self.target_rootfs, opt)
+        cmd = "%s --root %s --dbpath %s %s > /dev/null" % (
+              self.rpm_cmd, self.target_rootfs, self.rpm_libdir, opt)
         try:
             subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
         except subprocess.CalledProcessError as e:
@@ -934,8 +936,8 @@ class RpmPM(PackageManager):
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
@@ -943,7 +945,7 @@ class RpmPM(PackageManager):
         bb.utils.remove(os.path.join(self.target_rootfs, 'var/lib/smart'),
                         True)
         self._invoke_smart('config --set rpm-root=%s' % self.target_rootfs)
-        self._invoke_smart('config --set rpm-dbpath=/var/lib/rpm')
+        self._invoke_smart('config --set rpm-dbpath=%s' % self.rpm_libdir)
         self._invoke_smart('config --set rpm-extra-macros._var=%s' %
                            self.d.getVar('localstatedir', True))
         cmd = "config --set rpm-extra-macros._tmppath=/%s/tmp" %
(self.install_dir_name)
@@ -1179,7 +1181,7 @@ class RpmPM(PackageManager):
         if not with_dependencies:
             cmd = "%s -e --nodeps " % self.rpm_cmd
             cmd += "--root=%s " % self.target_rootfs
-            cmd += "--dbpath=/var/lib/rpm "
+            cmd += "--dbpath=%s " % self.rpm_libdir
             cmd += "--define='_cross_scriptlet_wrapper %s' " % \
                    self.scriptlet_wrapper
             cmd += "--define='_tmppath /%s/tmp' %s" %
(self.install_dir_name, ' '.join(pkgs))
@@ -1333,7 +1335,8 @@ class RpmPM(PackageManager):
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
@@ -1365,7 +1368,8 @@ class RpmPM(PackageManager):
     '''
     def unlock_rpm_db(self):
         # Remove rpm db lock files
-        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
+        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
+            self.rpm_libdir))
         for f in rpm_db_locks:
             bb.utils.remove(f, True)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 18df22d..a4ee433 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -420,6 +420,7 @@ class RpmRootfs(Rootfs):

     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
+        rpm_libdir = self.d.getVar('rpmlibdir', True)
         rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS', True)
         rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS', True)

@@ -449,7 +450,7 @@ class RpmRootfs(Rootfs):

         self.pm.install_complementary()

-        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
+        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir, '/var/lib/smart'])

         execute_pre_post_process(self.d, rpm_post_process_cmds)

-- 
2.9.0

