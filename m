Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SZNww-0006P6-3E
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 17:03:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4TEqlBk005370
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 07:52:47 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 May 2012 07:52:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2012 22:53:06 +0800
Message-ID: <cdc6c41e5755d8aed926d507059845786d872ea0.1338302685.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338302685.git.liezhi.yang@windriver.com>
References: <cover.1338302685.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/4] meta: replace os.system with subprocess.call
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 15:03:06 -0000
Content-Type: text/plain

Replace os.system with subprocess.call since the older function would
fail (more or less) silently if the executed program cannot be found

More info:
http://docs.python.org/library/subprocess.html#subprocess-replacements

[YOCTO #2454]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass         |    3 ++-
 meta/classes/distrodata.bbclass       |    5 +++--
 meta/classes/imagetest-qemu.bbclass   |    9 +++++----
 meta/classes/insane.bbclass           |   15 ++++++++++-----
 meta/classes/kernel.bbclass           |    4 ++--
 meta/classes/package.bbclass          |   33 +++++++++++++++++----------------
 meta/classes/package_deb.bbclass      |    3 ++-
 meta/classes/package_ipk.bbclass      |   13 ++++++++-----
 meta/classes/package_tar.bbclass      |    6 ++++--
 meta/classes/sanity.bbclass           |   13 +++++++------
 meta/classes/sstate.bbclass           |    9 ++++++---
 meta/lib/oe/distro_check.py           |    3 ++-
 meta/recipes-core/uclibc/uclibc.inc   |    7 ++++---
 meta/recipes-extended/cups/cups14.inc |    3 ++-
 14 files changed, 74 insertions(+), 52 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ac8aa95..67eac84 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -362,6 +362,7 @@ def dumpdata(d):
 def create_diff_gz(d):
 	'''creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for mapping all content in 's' including patches to  xxx.diff.gz'''
 	import shutil
+	import subprocess
 
 	work_dir = d.getVar('WORKDIR', True)
 	exclude_from = d.getVar('ARCHIVE_EXCLUDE_FROM', True).split()
@@ -387,7 +388,7 @@ def create_diff_gz(d):
 			try:
 				shutil.copy(i, dest)
 			except IOError:
-				os.system('fakeroot cp -rf ' + i + " " + dest )
+				subprocess.call('fakeroot cp -rf ' + i + " " + dest, shell=True)
 	
 	bb.note("Creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.gz")
 	cmd = "LC_ALL=C TZ=UTC0 diff --exclude-from=" + work_dir + "/temp/exclude-from-file -Naur " + s + '.org' + ' ' +  s + " | gzip -c > " + diff_file
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 4b2dee5..df6d300 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -231,6 +231,7 @@ python do_checkpkg() {
 	import sys
 	import re
 	import tempfile
+	import subprocess
 
 	"""
 	sanity check to ensure same name and type. Match as many patterns as possible
@@ -373,7 +374,7 @@ python do_checkpkg() {
 		f.close()
 		if status != "ErrHostNoDir" and re.match("Err", status):
 			logpath = d.getVar('LOG_DIR', True)
-			os.system("cp %s %s/" % (f.name, logpath))
+			subprocess.call("cp %s %s/" % (f.name, logpath), shell=True)
 		os.unlink(f.name)
 		return status
 
@@ -432,7 +433,7 @@ python do_checkpkg() {
 		"""if host hasn't directory information, no need to save tmp file"""
 		if status != "ErrHostNoDir" and re.match("Err", status):
 			logpath = d.getVar('LOG_DIR', True)
-			os.system("cp %s %s/" % (f.name, logpath))
+			subprocess.call("cp %s %s/" % (f.name, logpath), shell=True)
 		os.unlink(f.name)
 		return status
 
diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index d56b44b..f51eeba 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -28,6 +28,7 @@ def qemuimagetest_main(d):
     import re
     import os
     import shutil
+    import subprocess
     
     """
     Test Controller for automated testing.
@@ -58,7 +59,7 @@ def qemuimagetest_main(d):
         logpath = d.getVar('TEST_LOG', True)
         bb.utils.mkdirhier("%s/%s" % (logpath, scen))
         caselog = os.path.join(logpath, "%s/log_%s.%s" % (scen, case, d.getVar('DATETIME', True)))
-        os.system("touch %s" % caselog)
+        subprocess.call("touch %s" % caselog, shell=True)
         
         """export TEST_TMP, TEST_RESULT, DEPLOY_DIR and QEMUARCH"""
         os.environ["PATH"] = d.getVar("PATH", True)
@@ -78,7 +79,7 @@ def qemuimagetest_main(d):
 
         """run Test Case"""
         bb.note("Run %s test in scenario %s" % (case, scen))
-        os.system("%s" % fulltestpath)
+        subprocess.call("%s" % fulltestpath, shell=True)
     
     """function to check testcase list and remove inappropriate cases"""
     def check_list(list):
@@ -168,7 +169,7 @@ def qemuimagetest_main(d):
     test_status = d.getVar('TEST_STATUS', True)
     if os.path.exists(test_status):
         os.remove(test_status)
-    os.system("touch %s" % test_status)
+    subprocess.call("touch %s" % test_status, shell=True)
 
     """initialize result file"""
     resultpath = d.getVar('TEST_RESULT', True)
@@ -180,7 +181,7 @@ def qemuimagetest_main(d):
 
     if os.path.exists(sresultfile):
         os.remove(sresultfile)
-    os.system("touch %s" % resultfile)
+    subprocess.call("touch %s" % resultfile, shell=True)
     os.symlink(resultfile, sresultfile)
     f = open(sresultfile, "a")
     f.write("\tTest Result for %s %s\n" % (machine, pname))
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 49e904a..4d139e8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -267,6 +267,7 @@ def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
 
 	if not elf:
 		import stat
+		import subprocess
 		pn = d.getVar('PN', True)
 
 		# Ensure we're checking an executable script
@@ -275,7 +276,7 @@ def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
 			# grep shell scripts for possible references to /exec_prefix/
 			exec_prefix = d.getVar('exec_prefix', True)
 			statement = "grep -e '%s/' %s > /dev/null" % (exec_prefix, path)
-			if os.system(statement) == 0:
+			if subprocess.call(statement, shell=True) == 0:
 				error_msg = pn + ": Found a reference to %s/ in %s" % (exec_prefix, path)
 				package_qa_handle_error("unsafe-references-in-scripts", error_msg, d)
 				error_msg = "Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix"
@@ -609,6 +610,8 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
 
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
+    import subprocess
+
     bb.note("DO PACKAGE QA")
 
     logdir = d.getVar('T', True)
@@ -619,7 +622,7 @@ python do_package_qa () {
 
     if os.path.exists(compilelog):
         statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % compilelog
-        if os.system(statement) == 0:
+        if subprocess.call(statement, shell=True) == 0:
             bb.warn("%s: The compile log indicates that host include and/or library paths were used.\n \
         Please check the log '%s' for more information." % (pkg, compilelog))
 
@@ -628,7 +631,7 @@ python do_package_qa () {
 
     if os.path.exists(installlog):
         statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % installlog
-        if os.system(statement) == 0:
+        if subprocess.call(statement, shell=True) == 0:
             bb.warn("%s: The install log indicates that host include and/or library paths were used.\n \
         Please check the log '%s' for more information." % (pkg, installlog))
 
@@ -684,6 +687,8 @@ python do_qa_staging() {
 }
 
 python do_qa_configure() {
+    import subprocess
+
     configs = []
     workdir = d.getVar('WORKDIR', True)
     bb.note("Checking autotools environment for common misconfiguration")
@@ -691,7 +696,7 @@ python do_qa_configure() {
         statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % \
                     os.path.join(root,"config.log")
         if "config.log" in files:
-            if os.system(statement) == 0:
+            if subprocess.call(statement, shell=True) == 0:
                 bb.fatal("""This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
 Rerun configure task after fixing this. The path was '%s'""" % root)
 
@@ -713,7 +718,7 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
        if gt not in deps:
           for config in configs:
               gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
-              if os.system(gnu) == 0:
+              if subprocess.call(gnu, shell=True) == 0:
                  bb.fatal("""%s required but not in DEPENDS for file %s.
 Missing inherit gettext?""" % (gt, config))
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 90af597..116e10b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -313,12 +313,12 @@ module_conf_rfcomm = "alias bt-proto-3 rfcomm"
 
 python populate_packages_prepend () {
 	def extract_modinfo(file):
-		import tempfile, re
+		import tempfile, re, subprocess
 		tempfile.tempdir = d.getVar("WORKDIR", True)
 		tf = tempfile.mkstemp()
 		tmpfile = tf[1]
 		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
-		os.system(cmd)
+		subprocess.call(cmd, shell=True)
 		f = open(tmpfile)
 		l = f.read().split("\000")
 		f.close()
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8b0ac55..b2b59ec 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -183,7 +183,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
     # The debug information is then processed for src references.  These
     # references are copied to debugsrcdir, if defined.
 
-    import commands, stat
+    import commands, stat, subprocess
 
     dvar = d.getVar('PKGD', True)
     pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
@@ -205,14 +205,14 @@ def splitfile(file, debugfile, debugsrcdir, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-	os.system("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, workparentdir, debugsrcdir, sourcefile, file))
+	subprocess.call("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, workparentdir, debugsrcdir, sourcefile, file), shell=True)
 
     bb.mkdirhier(os.path.dirname(debugfile))
 
-    os.system("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile))
+    subprocess.call("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile), shell=True)
 
     # Set the debuglink to have the view of the file path on the target
-    os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
+    subprocess.call("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file), shell=True)
 
     if newmode:
         os.chmod(file, origmode)
@@ -225,7 +225,7 @@ def splitfile2(debugsrcdir, d):
     # The debug src information processed in the splitfile2 is further procecessed
     # and copied to the destination here.
 
-    import commands, stat
+    import commands, stat, subprocess
 
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
@@ -252,14 +252,14 @@ def splitfile2(debugsrcdir, d):
        processdebugsrc += "fgrep -z '%s' | "
        processdebugsrc += "(cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)"
 
-       os.system(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir))
+       subprocess.call(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir), shell=True)
 
        # The copy by cpio may have resulted in some empty directories!  Remove these
        for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
           for d in dirs:
               dir = os.path.join(root, d)
               #bb.note("rmdir -p %s" % dir)
-              os.system("rmdir -p %s 2>/dev/null" % dir)
+              subprocess.call("rmdir -p %s 2>/dev/null" % dir, shell=True)
 
        # Also remove debugsrcdir if its empty
        for p in nosuchdir[::-1]:
@@ -275,14 +275,14 @@ def runstrip(file, elftype, d):
     # 4 - executable
     # 8 - shared library
 
-    import commands, stat
+    import commands, stat, subprocess
 
     pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
     strip = d.getVar("STRIP", True)
 
     # Handle kernel modules specifically - .debug directories here are pointless
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
-        return os.system("%s'%s' --strip-debug --remove-section=.comment --remove-section=.note --preserve-dates '%s'" % (pathprefix, strip, file))
+        return subprocess.call("%s'%s' --strip-debug --remove-section=.comment --remove-section=.note --preserve-dates '%s'" % (pathprefix, strip, file), shell=True)
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -301,7 +301,7 @@ def runstrip(file, elftype, d):
     stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
-    ret = os.system("%s%s" % (pathprefix, stripcmd))
+    ret = subprocess.call("%s%s" % (pathprefix, stripcmd), shell=True)
 
     if newmode:
         os.chmod(file, origmode)
@@ -427,6 +427,7 @@ python package_do_split_locales() {
 }
 
 python perform_packagecopy () {
+	import subprocess
 	dest = d.getVar('D', True)
 	dvar = d.getVar('PKGD', True)
 
@@ -434,9 +435,9 @@ python perform_packagecopy () {
 
 	# Start by package population by taking a copy of the installed 
 	# files to operate on
-	os.system('rm -rf %s/*' % (dvar))
+	subprocess.call('rm -rf %s/*' % (dvar), shell=True)
 	# Preserve sparse files and hard links
-	os.system('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar))
+	subprocess.call('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar), shell=True)
 }
 
 # We generate a master list of directories to process, we start by
@@ -668,7 +669,7 @@ python fixup_perms () {
 }
 
 python split_and_strip_files () {
-	import commands, stat, errno
+	import commands, stat, errno, subprocess
 
 	dvar = d.getVar('PKGD', True)
 	pn = d.getVar('PN', True)
@@ -838,7 +839,7 @@ python split_and_strip_files () {
 					os.unlink(fpath)
 					# This could leave an empty debug directory laying around
 					# take care of the obvious case...
-					os.system("rmdir %s 2>/dev/null" % os.path.dirname(fpath))
+					subprocess.call("rmdir %s 2>/dev/null" % os.path.dirname(fpath), shell=True)
 
 		# Process the debugsrcdir if requested...
 		# This copies and places the referenced sources for later debugging...
@@ -870,7 +871,7 @@ python split_and_strip_files () {
 }
 
 python populate_packages () {
-	import glob, stat, errno, re
+	import glob, stat, errno, re, subprocess
 
 	workdir = d.getVar('WORKDIR', True)
 	outdir = d.getVar('DEPLOY_DIR', True)
@@ -896,7 +897,7 @@ python populate_packages () {
 				package_list.append(pkg)
 	d.setVar('PACKAGES', ' '.join(package_list))
 	pkgdest = d.getVar('PKGDEST', True)
-	os.system('rm -rf %s' % pkgdest)
+	subprocess.call('rm -rf %s' % pkgdest, shell=True)
 
 	seen = []
 
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4096fa2..0a3e976 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -205,6 +205,7 @@ deb_log_check() {
 python do_package_deb () {
     import re, copy
     import textwrap
+    import subprocess
 
     workdir = d.getVar('WORKDIR', True)
     if not workdir:
@@ -384,7 +385,7 @@ python do_package_deb () {
             conffiles.close()
 
         os.chdir(basedir)
-        ret = os.system("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH", True), root, pkgoutdir))
+        ret = subprocess.call("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH", True), root, pkgoutdir), shell=True)
         if ret != 0:
             bb.utils.prunedir(controldir)
             bb.utils.unlockfile(lf)
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 73ec0ee..c86ea03 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -15,6 +15,8 @@ python package_ipk_fn () {
 }
 
 python package_ipk_install () {
+	import subprocess
+
 	pkg = d.getVar('PKG', True)
 	pkgfn = d.getVar('PKGFN', True)
 	rootfs = d.getVar('IMAGE_ROOTFS', True)
@@ -52,14 +54,14 @@ python package_ipk_install () {
 
 
 	if not os.access(os.path.join(ipkdir,"Packages"), os.R_OK) or not os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),os.R_OK):
-		ret = os.system('opkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Packages"), ipkdir))
+		ret = subprocess.call('opkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Packages"), ipkdir), shell=True)
 		if (ret != 0 ):
 			raise bb.build.FuncFailed
 		f = open(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),"w")
 		f.close()
 
-	ret = os.system('opkg-cl  -o %s -f %s update' % (rootfs, conffile))
-	ret = os.system('opkg-cl  -o %s -f %s install %s' % (rootfs, conffile, pkgfn))
+	ret = subprocess.call('opkg-cl  -o %s -f %s update' % (rootfs, conffile), shell=True)
+	ret = subprocess.call('opkg-cl  -o %s -f %s install %s' % (rootfs, conffile, pkgfn), shell=True)
 	if (ret != 0 ):
 		raise bb.build.FuncFailed
 }
@@ -262,6 +264,7 @@ package_generate_archlist () {
 python do_package_ipk () {
 	import re, copy
 	import textwrap
+	import subprocess
 
 	workdir = d.getVar('WORKDIR', True)
 	outdir = d.getVar('PKGWRITEDIRIPK', True)
@@ -419,8 +422,8 @@ python do_package_ipk () {
 			conffiles.close()
 
 		os.chdir(basedir)
-		ret = os.system("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH", True), 
-                                                          d.getVar("OPKGBUILDCMD",1), pkg, pkgoutdir))
+		ret = subprocess.call("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH", True),
+                                                          d.getVar("OPKGBUILDCMD",1), pkg, pkgoutdir), shell=True)
 		if ret != 0:
 			bb.utils.unlockfile(lf)
 			raise bb.build.FuncFailed("opkg-build execution failed")
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 68b1bf0..332fa3f 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -9,6 +9,7 @@ python package_tar_fn () {
 }
 
 python package_tar_install () {
+	import subprocess
 	pkg = d.getVar('PKG', True)
 	pkgfn = d.getVar('PKGFN', True)
 	rootfs = d.getVar('IMAGE_ROOTFS', True)
@@ -29,12 +30,13 @@ python package_tar_install () {
 		bb.debug(1, "%s does not exist, skipping" % pkgfn)
 		raise bb.build.FuncFailed
 
-	ret = os.system('zcat %s | tar -xf -' % pkgfn)
+	ret = subprocess.call('zcat %s | tar -xf -' % pkgfn, shell=True)
 	if ret != 0:
 		raise bb.build.FuncFailed
 }
 
 python do_package_tar () {
+	import subprocess
 	workdir = d.getVar('WORKDIR', True)
 	if not workdir:
 		bb.error("WORKDIR not defined, unable to package")
@@ -85,7 +87,7 @@ python do_package_tar () {
 		if not glob('*'):
 			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
 			continue
-		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
+		ret = subprocess.call("tar -czf %s %s" % (tarfn, '.'), shell=True)
 		if ret != 0:
 			bb.error("Creation of tar %s failed." % tarfn)
 }
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a2b45bc..df4cd0b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -282,6 +282,7 @@ def check_sanity_validmachine(sanity_data):
 
 def check_sanity(sanity_data):
     from bb import note, error, data, __version__
+    import subprocess
 
     try:
         from distutils.version import LooseVersion
@@ -495,16 +496,16 @@ def check_sanity(sanity_data):
             f.write(current_abi)
         elif abi == "2" and current_abi == "3":
             bb.note("Converting staging from layout version 2 to layout version 3")
-            os.system(sanity_data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"))
-            os.system(sanity_data.expand("ln -s sysroots ${TMPDIR}/staging"))
-            os.system(sanity_data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"))
+            subprocess.call(sanity_data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"), shell=True)
+            subprocess.call(sanity_data.expand("ln -s sysroots ${TMPDIR}/staging"), shell=True)
+            subprocess.call(sanity_data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"), shell=True)
             f = file(abifile, "w")
             f.write(current_abi)
         elif abi == "3" and current_abi == "4":
             bb.note("Converting staging layout from version 3 to layout version 4")
             if os.path.exists(sanity_data.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
-                os.system(sanity_data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"))
-                os.system(sanity_data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"))
+                subprocess.call(sanity_data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"), shell=True)
+                subprocess.call(sanity_data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"), shell=True)
 
             f = file(abifile, "w")
             f.write(current_abi)
@@ -512,7 +513,7 @@ def check_sanity(sanity_data):
             messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
         elif abi == "5" and current_abi == "6":
             bb.note("Converting staging layout from version 5 to layout version 6")
-            os.system(sanity_data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"))
+            subprocess.call(sanity_data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"), shell=True)
             f = file(abifile, "w")
             f.write(current_abi)
         elif abi == "7" and current_abi == "8":
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ae01937..4242f88 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -145,6 +145,7 @@ def sstate_install(ss, d):
 
 def sstate_installpkg(ss, d):
     import oe.path
+    import subprocess
 
     def prepdir(dir):
         # remove dir if it exists, ensure any parent directories do exist
@@ -195,7 +196,7 @@ def sstate_installpkg(ss, d):
 	sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" % (sstateinst, fixmefn, sstate_sed_cmd)
 
 	print "Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd)
-	os.system(sstate_hardcode_cmd)
+	subprocess.call(sstate_hardcode_cmd, shell=True)
 
         # Need to remove this or we'd copy it into the target directory and may 
         # conflict with another writer
@@ -309,6 +310,8 @@ python sstate_cleanall() {
 }
 
 def sstate_hardcode_path(d):
+	import subprocess
+
 	# Need to remove hardcoded paths and fix these when we install the
 	# staging packages.
 	#
@@ -343,14 +346,14 @@ def sstate_hardcode_path(d):
 	sstate_hardcode_cmd = "%s | xargs %s | %s | xargs --no-run-if-empty %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, sstate_sed_cmd)
 
 	print "Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd)
-	os.system(sstate_hardcode_cmd)
+	subprocess.call(sstate_hardcode_cmd, shell=True)
 
         # If the fixmefn is empty, remove it..
 	if os.stat(fixmefn).st_size == 0:
 		os.remove(fixmefn)
 	else:
 		print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd)
-		os.system(sstate_filelist_relative_cmd)
+		subprocess.call(sstate_filelist_relative_cmd, shell=True)
 
 def sstate_package(ss, d):
     import oe.path
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index cc836de..455135e 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -343,6 +343,7 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     return matching_distros
 
 def create_log_file(d, logname):
+    import subprocess
     logpath = d.getVar('LOG_DIR', True)
     bb.utils.mkdirhier(logpath)
     logfn, logsuffix = os.path.splitext(logname)
@@ -351,7 +352,7 @@ def create_log_file(d, logname):
             slogfile = os.path.join(logpath, logname)
             if os.path.exists(slogfile):
                     os.remove(slogfile)
-            os.system("touch %s" % logfile)
+            subprocess.call("touch %s" % logfile, shell=True)
             os.symlink(logfile, slogfile)
             d.setVar('LOG_FILE', logfile)
     return logfile
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 55ab0c9..6769279 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -167,9 +167,10 @@ python () {
                    "/^### ABI$/a\\\nCONFIG_%s=y\n\n" % ("${UCLIBC_ABI}"))
 }
 
-do_patch_append() {
-        os.system("ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux")
-        os.system("ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm")
+python do_patch_append() {
+        import subprocess
+        subprocess.call("ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux", shell=True)
+        subprocess.call("ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm", shell=True)
 }
 
 do_configure() {
diff --git a/meta/recipes-extended/cups/cups14.inc b/meta/recipes-extended/cups/cups14.inc
index 7c19682..85d8ca2 100644
--- a/meta/recipes-extended/cups/cups14.inc
+++ b/meta/recipes-extended/cups/cups14.inc
@@ -57,9 +57,10 @@ fakeroot do_install () {
 }
 
 python do_package_append() {
+	import subprocess
 	# Change permissions back the way they were, they probably had a reason...
 	workdir = d.getVar('WORKDIR', True)
-	os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir)
+	subprocess.call('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir, shell=True)
 }
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
-- 
1.7.1



