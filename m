Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ubp2f-0006oX-I0
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:27:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4D99SFR015415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:09:28 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 13 May 2013 02:09:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2013 05:09:21 -0400
Message-ID: <3806e62c94a13f94220ab2ac94be078172748b84.1368425946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368425946.git.liezhi.yang@windriver.com>
References: <cover.1368425946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] insane/package: refactor packaging sanity tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 09:27:41 -0000
Content-Type: text/plain

Refactor packaging sanity tests from package.bbclass to insane.bbclass
so that the message can respect WARN_QA (print the warning message and
go on the task) and ERROR_QA (print the error message and fail the
task).

- For the bb.warn(), give it a message name and add it to WARN_QA, then
  use package_qa_handle_error() to handle it.

- For the bb.error(), give it a message name and add it to ERROR_QA,
  then use package_qa_handle_error() to handle it.

- All the bb.warn() and bb.error() have been replaced in
  package.bbclass.

- A few bb.warn() and bb.error() in insane.bbclass have been kept since
  they can not be replaced or doesn't have to, for example the
  bb.error() in package_qa_check_license(), it will print the error
  message and then invoke bb.fatal() to fail the task, I think that we
  don't have to replace it with package_qa_handle_error().

- Put all the WARN_QA and ERROR_QA in one line, so that they can be
  redefined by the user easily.

[YOCTO #3190]
[YOCTO #4396]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass  |   33 ++++++++++++++++++++++-----------
 meta/classes/package.bbclass |   36 +++++++++++++++++++++++-------------
 2 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c3e4b1e..a6c0142 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,6 +27,20 @@ QADEPENDS_class-native = ""
 QADEPENDS_class-nativesdk = ""
 QA_SANE = "True"
 
+# Elect whether a given type of error is a warning or error, they may
+# have been set by other files.
+WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
+            textrel already-stripped incompatible-license files-invalid \
+            installed-vs-shipped compile-host-path install-host-path \
+            pn-overrides \
+            "
+ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la \
+            perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
+            split-strip packages-list pkgv-undefined var-undefined \
+            "
+
+ALL_QA = "${WARN_QA} ${ERROR_QA}"
+
 #
 # dictionary for elf headers
 #
@@ -111,12 +125,6 @@ def package_qa_get_machine_dict():
         }
 
 
-# Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi textrel"
-ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp pkgvarcheck"
-
-ALL_QA = "${WARN_QA} ${ERROR_QA}"
-
 def package_qa_clean_path(path,d):
     """ Remove the common prefix from the path. In this case it is the TMPDIR"""
     return path.replace(d.getVar('TMPDIR',True),"")
@@ -758,8 +766,9 @@ python do_package_qa () {
     if os.path.exists(compilelog):
         statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % compilelog
         if subprocess.call(statement, shell=True) == 0:
-            bb.warn("%s: The compile log indicates that host include and/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pkg, compilelog))
+            msg = "%s: The compile log indicates that host include and/or library paths were used.\n \
+        Please check the log '%s' for more information." % (pkg, compilelog)
+            package_qa_handle_error("compile-host-path", msg, d)
 
     # Check the install log for host contamination
     installlog = os.path.join(logdir,"log.do_install")
@@ -767,8 +776,9 @@ python do_package_qa () {
     if os.path.exists(installlog):
         statement = "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s > /dev/null" % installlog
         if subprocess.call(statement, shell=True) == 0:
-            bb.warn("%s: The install log indicates that host include and/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pkg, installlog))
+            msg = "%s: The install log indicates that host include and/or library paths were used.\n \
+        Please check the log '%s' for more information." % (pkg, installlog)
+            package_qa_handle_error("install-host-path", msg, d)
 
     # Scan the packages...
     pkgdest = d.getVar('PKGDEST', True)
@@ -912,7 +922,8 @@ python () {
     overrides = d.getVar('OVERRIDES', True).split(':')
     pn = d.getVar('PN', True)
     if pn in overrides:
-        bb.warn('Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE", True), pn))
+        msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE", True), pn)
+        package_qa_handle_error("pn-overrides", msg, d)
 
     issues = []
     if (d.getVar('PACKAGES', True) or "").split():
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e9a324e..2515565 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -504,7 +504,8 @@ python fixup_perms () {
             elif len(lsplit) == 8:
                 self._setdir(lsplit[0], lsplit[1], lsplit[2], lsplit[3], lsplit[4], lsplit[5], lsplit[6], lsplit[7])
             else:
-                bb.error("Fixup Perms: invalid config line %s" % line)
+                msg = "Fixup Perms: invalid config line %s" % line
+                package_qa_handle_error("perm-config", msg, d)
                 self.path = None
                 self.link = None
 
@@ -639,7 +640,8 @@ python fixup_perms () {
                 if len(lsplit) == 0:
                     continue
                 if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
-                    bb.error("Fixup perms: %s invalid line: %s" % (conf, line))
+                    msg = "Fixup perms: %s invalid line: %s" % (conf, line)
+                    package_qa_handle_error("perm-line", msg, d)
                     continue
                 entry = fs_perms_entry(d.expand(line))
                 if entry and entry.path:
@@ -668,7 +670,8 @@ python fixup_perms () {
             target = os.path.join(os.path.dirname(origin), link)
             ptarget = os.path.join(os.path.dirname(dir), link)
         if os.path.exists(target):
-            bb.error("Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget))
+            msg = "Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget)
+            package_qa_handle_error("perm-link", msg, d)
             continue
 
         # Create path to move directory to, move it, and then setup the symlink
@@ -738,7 +741,8 @@ python split_and_strip_files () {
         ret, result = oe.utils.getstatusoutput("file '%s'" % path)
 
         if ret:
-            bb.error("split_and_strip_files: 'file %s' failed" % path)
+            msg = "split_and_strip_files: 'file %s' failed" % path
+            package_qa_handle_error("split-strip", msg, d)
             return type
 
         # Not stripped
@@ -803,7 +807,8 @@ python split_and_strip_files () {
                     elf_file = isELF(file)
                     if elf_file & 1:
                         if elf_file & 2:
-                            bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn))
+                            msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
+                            package_qa_handle_error("already-stripped", msg, d)
                             continue
                         # Check if it's a hard link to something else
                         if s.st_nlink > 1:
@@ -929,9 +934,11 @@ python populate_packages () {
 
     for pkg in packages.split():
         if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
-            bb.warn("%s has an incompatible license. Excluding from packaging." % pkg)
+            msg = "%s has an incompatible license. Excluding from packaging." % pkg
+            package_qa_handle_error("incompatible-license", msg, d)
         if pkg in package_list:
-            bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
+            msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
+            package_qa_handle_error("packages-list", msg, d)
         else:
             package_list.append(pkg)
     d.setVar('PACKAGES', ' '.join(package_list))
@@ -945,7 +952,8 @@ python populate_packages () {
 
         filesvar = d.getVar('FILES_%s' % pkg, True) or ""
         if "//" in filesvar:
-            bb.warn("FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg)
+            msg = "FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg
+            package_qa_handle_error("files-invalid", msg, d)
             filesvar.replace("//", "/")
         files = filesvar.split()
         for file in files:
@@ -1024,12 +1032,12 @@ python populate_packages () {
 
     if unshipped != []:
         msg = pn + ": Files/directories were installed but not shipped"
-        if "installed_vs_shipped" in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
-            bb.note("Package %s skipping QA tests: installed_vs_shipped" % pn)
+        if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+            bb.note("Package %s skipping QA tests: installed-vs-shipped" % pn)
         else:
             for f in unshipped:
                 msg = msg + "\n  " + f
-            package_qa_handle_error("installed_vs_shipped", msg, d)
+            package_qa_handle_error("installed-vs-shipped", msg, d)
 }
 populate_packages[dirs] = "${D}"
 
@@ -1319,7 +1327,8 @@ python package_do_shlibs() {
 
     ver = d.getVar('PKGV', True)
     if not ver:
-        bb.error("PKGV not defined")
+        msg = "PKGV not defined"
+        package_qa_handle_error("pkgv-undefined", msg, d)
         return
 
     pkgdest = d.getVar('PKGDEST', True)
@@ -1854,7 +1863,8 @@ python do_package () {
     pn = d.getVar('PN', True)
 
     if not workdir or not outdir or not dest or not dvar or not pn:
-        bb.error("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package")
+        msg = "WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package"
+        package_qa_handle_error("var-undefined", msg, d)
         return
 
     bb.build.exec_func("package_get_auto_pr", d)
-- 
1.7.10.4



