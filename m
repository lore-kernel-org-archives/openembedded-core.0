Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 84681771DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NHlSQv008649; Mon, 23 Jan 2017 17:47:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uiYK1W_aPWzF; Mon, 23 Jan 2017 17:47:28 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NHlQit008645
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 17:47:27 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cViiE-0001Td-GG; Mon, 23 Jan 2017 17:47:26 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 17:47:24 +0000
Message-Id: <1485193644-5639-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] classes/oeqa: Replace subprocess.check_call() with check_output()
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
X-List-Received-Date: Mon, 23 Jan 2017 17:47:33 -0000

If you use subprocess.check_output() the traceback will contain the output
when the command fails which is very useful for debugging. There is no
good reason not to use this everywhere.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass                | 4 ++--
 meta/classes/staging.bbclass               | 6 +++---
 meta/classes/uninative.bbclass             | 2 +-
 meta/lib/oe/rootfs.py                      | 6 +++---
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py | 2 +-
 meta/lib/oeqa/utils/buildproject.py        | 2 +-
 meta/lib/oeqa/utils/targetbuild.py         | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a767a02..0fdeb9d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -573,14 +573,14 @@ python sstate_hardcode_path () {
     sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, xargs_no_empty_run_cmd, sstate_sed_cmd)
 
     bb.note("Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd))
-    subprocess.check_call(sstate_hardcode_cmd, shell=True, cwd=sstate_builddir)
+    subprocess.check_output(sstate_hardcode_cmd, shell=True, cwd=sstate_builddir)
 
         # If the fixmefn is empty, remove it..
     if os.stat(fixmefn).st_size == 0:
         os.remove(fixmefn)
     else:
         bb.note("Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd))
-        subprocess.check_call(sstate_filelist_relative_cmd, shell=True)
+        subprocess.check_output(sstate_filelist_relative_cmd, shell=True)
 }
 
 def sstate_package(ss, d):
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 1a4668e..fc387ea 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -290,7 +290,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.note(cmd)
-    subprocess.check_call(cmd, shell=True)
+    subprocess.check_output(cmd, shell=True)
 
 
 def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
@@ -333,7 +333,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
     for p in postinsts:
-        subprocess.check_call(p, shell=True)
+        subprocess.check_output(p, shell=True)
 
 #
 # Manifests here are complicated. The main sysroot area has the unpacked sstate
@@ -561,7 +561,7 @@ python extend_recipe_sysroot() {
             staging_processfixme(fixme[f], multilibs[f].getVar("RECIPE_SYSROOT"), recipesysroot, recipesysrootnative, d)
 
     for p in postinsts:
-        subprocess.check_call(p, shell=True)
+        subprocess.check_output(p, shell=True)
 
     for dep in configuredeps:
         c = setscenedeps[dep][0]
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index ba7ca63..410fb72 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -60,7 +60,7 @@ python uninative_event_fetchloader() {
                     os.symlink(localpath, tarballpath)
 
         cmd = d.expand("mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; cd ${UNINATIVE_STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
-        subprocess.check_call(cmd, shell=True)
+        subprocess.check_output(cmd, shell=True)
 
         with open(loaderchksum, "w") as f:
             f.write(chksum)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5b842ba..9c8a0eb 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -303,10 +303,10 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("> Executing %s intercept ..." % script)
 
             try:
-                subprocess.check_call(script_full)
+                subprocess.check_output(script_full)
             except subprocess.CalledProcessError as e:
-                bb.warn("The postinstall intercept hook '%s' failed (exit code: %d)! See log for details!" %
-                        (script, e.returncode))
+                bb.warn("The postinstall intercept hook '%s' failed (exit code: %d)! See log for details! (Output: %s)" %
+                        (script, e.returncode, e.output))
 
                 with open(script_full) as intercept:
                     registered_pkgs = None
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index cc34e0c..4e4e507 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -24,7 +24,7 @@ class SDKBuildProject(BuildProject):
         self._download_archive()
 
         cmd = 'tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir)
-        subprocess.check_call(cmd, shell=True)
+        subprocess.check_output(cmd, shell=True)
 
         #Change targetdir to project folder
         self.targetdir = os.path.join(self.targetdir, self.fname)
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index 386a927..b3c487b 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -29,7 +29,7 @@ class BuildProject(metaclass=ABCMeta):
             return
 
         cmd = "wget -O %s %s" % (self.localarchive, self.uri)
-        subprocess.check_call(cmd, shell=True)
+        subprocess.check_output(cmd, shell=True)
 
     # This method should provide a way to run a command in the desired environment.
     @abstractmethod
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index c001602..6f237b5 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -45,7 +45,7 @@ class BuildProject(metaclass=ABCMeta):
                 cmd = 'export ' + var + '=\"%s\"; %s' % (val, cmd)
 
         cmd = cmd + "wget -O %s %s" % (self.localarchive, self.uri)
-        subprocess.check_call(cmd, shell=True)
+        subprocess.check_output(cmd, shell=True)
 
     # This method should provide a way to run a command in the desired environment.
     @abstractmethod
@@ -114,7 +114,7 @@ class SDKBuildProject(BuildProject):
         self._download_archive()
 
         cmd = 'tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir)
-        subprocess.check_call(cmd, shell=True)
+        subprocess.check_output(cmd, shell=True)
 
         #Change targetdir to project folder
         self.targetdir = os.path.join(self.targetdir, self.fname)
-- 
2.7.4


