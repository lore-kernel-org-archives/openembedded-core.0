Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5218877330
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIT006852; Wed, 1 Jun 2016 13:35:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d2yZrWsaFE2T; Wed,  1 Jun 2016 13:35:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZplT006870
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000k0-6R; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:20 +0100
Message-Id: <1464784540-2786-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/22] classes/lib: Convert to use python3 octal syntax
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:58 -0000

The syntax for octal values changed in python3, adapt to it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass        | 10 +++++-----
 meta/classes/package_deb.bbclass |  4 ++--
 meta/classes/package_ipk.bbclass |  2 +-
 meta/classes/package_rpm.bbclass |  6 +++---
 meta/classes/sanity.bbclass      |  4 ++--
 meta/classes/sstate.bbclass      |  6 +++---
 meta/classes/terminal.bbclass    |  2 +-
 meta/lib/oe/package_manager.py   |  4 ++--
 meta/lib/oe/patch.py             |  4 ++--
 meta/lib/oe/sdk.py               |  4 ++--
 10 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4be0a7e..1ba1222 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -456,15 +456,15 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        d.setVarFlag('do_unpack', 'umask', '022')
-        d.setVarFlag('do_configure', 'umask', '022')
-        d.setVarFlag('do_compile', 'umask', '022')
+        d.setVarFlag('do_unpack', 'umask', '0o022')
+        d.setVarFlag('do_configure', 'umask', '0o022')
+        d.setVarFlag('do_compile', 'umask', '0o022')
         d.appendVarFlag('do_install', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_install', 'fakeroot', '1')
-        d.setVarFlag('do_install', 'umask', '022')
+        d.setVarFlag('do_install', 'umask', '0o022')
         d.appendVarFlag('do_package', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_package', 'fakeroot', '1')
-        d.setVarFlag('do_package', 'umask', '022')
+        d.setVarFlag('do_package', 'umask', '0o022')
         d.setVarFlag('do_package_setscene', 'fakeroot', '1')
         d.appendVarFlag('do_package_setscene', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_devshell', 'fakeroot', '1')
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index e1d05a7..bb5220e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -117,7 +117,7 @@ python do_package_deb () {
 
         controldir = os.path.join(root, 'DEBIAN')
         bb.utils.mkdirhier(controldir)
-        os.chmod(controldir, 0755)
+        os.chmod(controldir, 0o755)
         try:
             import codecs
             ctrlfile = codecs.open(os.path.join(controldir, 'control'), 'w', 'utf-8')
@@ -293,7 +293,7 @@ python do_package_deb () {
             scriptfile.write(scriptvar[pos:])
             scriptfile.write('\n')
             scriptfile.close()
-            os.chmod(os.path.join(controldir, script), 0755)
+            os.chmod(os.path.join(controldir, script), 0o755)
 
         conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index f1ad1d5..08f7020 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -225,7 +225,7 @@ python do_package_ipk () {
                 raise bb.build.FuncFailed("unable to open %s script file for writing." % script)
             scriptfile.write(scriptvar)
             scriptfile.close()
-            os.chmod(os.path.join(controldir, script), 0755)
+            os.chmod(os.path.join(controldir, script), 0o755)
 
         conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 7d523a1..f9398a9 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -63,7 +63,7 @@ def write_rpm_perfiledata(srcname, d):
     dump_filerdeps('RDEPENDS', dependsfile, d)
 
     dependsfile.close()
-    os.chmod(outdepends, 0755)
+    os.chmod(outdepends, 0o755)
 
     # OE-core / RPM Provides
     outprovides = workdir + "/" + srcname + ".provides"
@@ -76,7 +76,7 @@ def write_rpm_perfiledata(srcname, d):
     dump_filerdeps('RPROVIDES', providesfile, d)
 
     providesfile.close()
-    os.chmod(outprovides, 0755)
+    os.chmod(outprovides, 0o755)
 
     return (outdepends, outprovides)
 
@@ -702,7 +702,7 @@ python do_package_rpm () {
     pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
     magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
     bb.utils.mkdirhier(pkgwritedir)
-    os.chmod(pkgwritedir, 0755)
+    os.chmod(pkgwritedir, 0o755)
 
     cmd = rpmbuild
     cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3d5ace2..b0e7451 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -842,8 +842,8 @@ def check_sanity_everybuild(status, d):
 
     check_supported_distro(d)
 
-    omask = os.umask(022)
-    if omask & 0755:
+    omask = os.umask(0o022)
+    if omask & 0o755:
         status.addresult("Please use a umask which allows a+rx and u+rwx\n")
     os.umask(omask)
 
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6bf94b0..994eae6 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -655,9 +655,9 @@ python sstate_task_postfunc () {
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
         bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True),))
-    omask = os.umask(002)
-    if omask != 002:
-       bb.note("Using umask 002 (not %0o) for sstate packaging" % omask)
+    omask = os.umask(0o002)
+    if omask != 0o002:
+       bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
     sstate_package(shared_state, d)
     os.umask(omask)
 }
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 9f4c24e..a94f755 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -29,7 +29,7 @@ def emit_terminal_func(command, envdata, d):
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
         script.write("\n")
-    os.chmod(runfile, 0755)
+    os.chmod(runfile, 0o755)
 
     return runfile
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 79b3206..3bc4ebf 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1090,8 +1090,8 @@ class RpmPM(PackageManager):
                                                 native_root)
         open(self.scriptlet_wrapper, 'w+').write(scriptlet_content)
 
-        bb.note("Configuring RPM cross-install scriptlet_wrapper")
-        os.chmod(self.scriptlet_wrapper, 0755)
+        bb.note("configuring RPM cross-install scriptlet_wrapper")
+        os.chmod(self.scriptlet_wrapper, 0o755)
         cmd = 'config --set rpm-extra-macros._cross_scriptlet_wrapper=%s' % \
               self.scriptlet_wrapper
         self._invoke_smart(cmd)
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 9d36172..a25fd52 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -434,7 +434,7 @@ class GitApplyTree(PatchTree):
             # change other places which read it back
             f.write('echo >> $1\n')
             f.write('echo "%s: $PATCHFILE" >> $1\n' % GitApplyTree.patch_line_prefix)
-        os.chmod(commithook, 0755)
+        os.chmod(commithook, 0o755)
         shutil.copy2(commithook, applyhook)
         try:
             patchfilevar = 'PATCHFILE="%s"' % os.path.basename(patch['file'])
@@ -672,7 +672,7 @@ class UserResolver(Resolver):
                 f.write("echo 'Run \"quilt refresh\" when patch is corrected, press CTRL+D to exit.'\n")
                 f.write("echo ''\n")
                 f.write(" ".join(patchcmd) + "\n")
-            os.chmod(rcfile, 0775)
+            os.chmod(rcfile, 0o775)
 
             self.terminal("bash --rcfile " + rcfile, 'Patch Rejects: Please fix patch rejects manually', self.patchset.d)
 
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index f1bbef6..4786cc5 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -251,12 +251,12 @@ class OpkgSdk(Sdk):
         self.mkdirhier(target_sysconfdir)
         shutil.copy(self.target_conf, target_sysconfdir)
         os.chmod(os.path.join(target_sysconfdir,
-                              os.path.basename(self.target_conf)), 0644)
+                              os.path.basename(self.target_conf)), 0o644)
 
         self.mkdirhier(host_sysconfdir)
         shutil.copy(self.host_conf, host_sysconfdir)
         os.chmod(os.path.join(host_sysconfdir,
-                              os.path.basename(self.host_conf)), 0644)
+                              os.path.basename(self.host_conf)), 0o644)
 
         native_opkg_state_dir = os.path.join(self.sdk_output, self.sdk_native_path,
                                              self.d.getVar('localstatedir_nativesdk', True).strip('/'),
-- 
2.5.0


