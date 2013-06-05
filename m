Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD61B6A53D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 02:15:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r552FiEY024700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 19:15:45 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 19:15:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 10:14:04 +0800
Message-ID: <ba03ab741a40e2a6ba11b9239d72f01de6de9b56.1370398286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1370398286.git.liezhi.yang@windriver.com>
References: <cover.1370398286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] insane/package: refactor packaging sanity tests
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
X-List-Received-Date: Wed, 05 Jun 2013 02:15:43 -0000
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
 meta/classes/insane.bbclass  | 33 ++++++++++++++++++++++-----------
 meta/classes/package.bbclass | 36 +++++++++++++++++++++++-------------
 2 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ee57721..c091005 100644
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
@@ -757,8 +765,9 @@ python do_package_qa () {
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
@@ -766,8 +775,9 @@ python do_package_qa () {
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
@@ -911,7 +921,8 @@ python () {
     overrides = d.getVar('OVERRIDES', True).split(':')
     pn = d.getVar('PN', True)
     if pn in overrides:
-        bb.warn('Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE", True), pn))
+        msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE", True), pn)
+        package_qa_handle_error("pn-overrides", msg, d)
 
     issues = []
     if (d.getVar('PACKAGES', True) or "").split():
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f72c0e2..f25f567 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -500,7 +500,8 @@ python fixup_perms () {
             elif len(lsplit) == 8:
                 self._setdir(lsplit[0], lsplit[1], lsplit[2], lsplit[3], lsplit[4], lsplit[5], lsplit[6], lsplit[7])
             else:
-                bb.error("Fixup Perms: invalid config line %s" % line)
+                msg = "Fixup Perms: invalid config line %s" % line
+                package_qa_handle_error("perm-config", msg, d)
                 self.path = None
                 self.link = None
 
@@ -635,7 +636,8 @@ python fixup_perms () {
                 if len(lsplit) == 0:
                     continue
                 if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
-                    bb.error("Fixup perms: %s invalid line: %s" % (conf, line))
+                    msg = "Fixup perms: %s invalid line: %s" % (conf, line)
+                    package_qa_handle_error("perm-line", msg, d)
                     continue
                 entry = fs_perms_entry(d.expand(line))
                 if entry and entry.path:
@@ -664,7 +666,8 @@ python fixup_perms () {
             target = os.path.join(os.path.dirname(origin), link)
             ptarget = os.path.join(os.path.dirname(dir), link)
         if os.path.exists(target):
-            bb.error("Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget))
+            msg = "Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget)
+            package_qa_handle_error("perm-link", msg, d)
             continue
 
         # Create path to move directory to, move it, and then setup the symlink
@@ -737,7 +740,8 @@ python split_and_strip_files () {
         ret, result = oe.utils.getstatusoutput("file '%s'" % path)
 
         if ret:
-            bb.error("split_and_strip_files: 'file %s' failed" % path)
+            msg = "split_and_strip_files: 'file %s' failed" % path
+            package_qa_handle_error("split-strip", msg, d)
             return type
 
         # Not stripped
@@ -802,7 +806,8 @@ python split_and_strip_files () {
                     elf_file = isELF(file)
                     if elf_file & 1:
                         if elf_file & 2:
-                            bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn))
+                            msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
+                            package_qa_handle_error("already-stripped", msg, d)
                             continue
                         # Check if it's a hard link to something else
                         if s.st_nlink > 1:
@@ -928,9 +933,11 @@ python populate_packages () {
 
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
@@ -944,7 +951,8 @@ python populate_packages () {
 
         filesvar = d.getVar('FILES_%s' % pkg, True) or ""
         if "//" in filesvar:
-            bb.warn("FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg)
+            msg = "FILES variable for package %s contains '//' which is invalid. Attempting to fix this but you should correct the metadata.\n" % pkg
+            package_qa_handle_error("files-invalid", msg, d)
             filesvar.replace("//", "/")
         files = filesvar.split()
         for file in files:
@@ -1023,12 +1031,12 @@ python populate_packages () {
 
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
 
@@ -1318,7 +1326,8 @@ python package_do_shlibs() {
 
     ver = d.getVar('PKGV', True)
     if not ver:
-        bb.error("PKGV not defined")
+        msg = "PKGV not defined"
+        package_qa_handle_error("pkgv-undefined", msg, d)
         return
 
     pkgdest = d.getVar('PKGDEST', True)
@@ -1853,7 +1862,8 @@ python do_package () {
     pn = d.getVar('PN', True)
 
     if not workdir or not outdir or not dest or not dvar or not pn:
-        bb.error("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package")
+        msg = "WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package"
+        package_qa_handle_error("var-undefined", msg, d)
         return
 
     bb.build.exec_func("package_get_auto_pr", d)
-- 
1.8.1.2


