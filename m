Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaTdd-00031A-Oi for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:24:14 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49G8aCH021347 for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 17:08:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7JAF6EpaFsk7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2013 17:08:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49G8XHn021342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 17:08:35 +0100
Message-ID: <1368115558.27116.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 May 2013 17:05:58 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] class/lib: Fix up various file access methods
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
X-List-Received-Date: Thu, 09 May 2013 16:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are various bits of cruft that have built up around our file accesses. This patch
cleans some of them up, specifically:

 * Remove pointless "from __builtin__ import file"
 * Use open(), not file()
 * Wrap file usage in a with container to ensure files are closed
 * Add missing .close() calls in some cases

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index 63ba087..c30d1cb 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -146,6 +146,7 @@ def qemuimagetest_main(d):
                        if not os.path.isfile(fulltestcase):
                             raise bb.build.FuncFailed("Testcase %s not found" % fulltestcase)
                        list.append((item, casefile, fulltestcase))
+                    f.close()
         final_list = check_list(list)
         return final_list
 
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 809aa45..4d2392e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -518,9 +518,10 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
         return
 
     tmpdir = d.getVar('TMPDIR', True)
-    file_content = open(path).read()
-    if tmpdir in file_content:
-        messages.append("File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
+    with open(path) as f:
+        file_content = f.read()
+        if tmpdir in file_content:
+            messages.append("File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
@@ -634,15 +635,17 @@ def package_qa_check_staged(path,d):
         for file in files:
             path = os.path.join(root,file)
             if file.endswith(".la"):
-                file_content = open(path).read()
-                if workdir in file_content:
-                    error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
-                    sane = package_qa_handle_error("la", error_msg, d)
+                with open(path) as f:
+                    file_content = f.read()
+                    if workdir in file_content:
+                        error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
+                        sane = package_qa_handle_error("la", error_msg, d)
             elif file.endswith(".pc"):
-                file_content = open(path).read()
-                if pkgconfigcheck in file_content:
-                    error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
-                    sane = package_qa_handle_error("pkgconfig", error_msg, d)
+                with open(path) as f:
+                    file_content = f.read()
+                    if pkgconfigcheck in file_content:
+                        error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
+                        sane = package_qa_handle_error("pkgconfig", error_msg, d)
 
     return sane
 
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 3a13154..74e2078 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -146,7 +146,7 @@ python package_do_split_gconvs () {
 
     def calc_gconv_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
-        f = open(fn, "r")
+        f = open(fn, "rb")
         c_re = re.compile('^copy "(.*)"')
         i_re = re.compile('^include "(\w+)".*')
         for l in f.readlines():
@@ -167,7 +167,7 @@ python package_do_split_gconvs () {
 
     def calc_charmap_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
-        f = open(fn, "r")
+        f = open(fn, "rb")
         c_re = re.compile('^copy "(.*)"')
         i_re = re.compile('^include "(\w+)".*')
         for l in f.readlines():
@@ -187,7 +187,7 @@ python package_do_split_gconvs () {
 
     def calc_locale_deps(fn, pkg, file_regex, output_pattern, group):
         deps = []
-        f = open(fn, "r")
+        f = open(fn, "rb")
         c_re = re.compile('^copy "(.*)"')
         i_re = re.compile('^include "(\w+)".*')
         for l in f.readlines():
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index e9b207c..8d3988a 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -32,10 +32,11 @@ def base_get_scmbasepath(d):
 def base_get_metadata_monotone_branch(path, d):
     monotone_branch = "<unknown>"
     try:
-        monotone_branch = file( "%s/_MTN/options" % path ).read().strip()
-        if monotone_branch.startswith( "database" ):
-            monotone_branch_words = monotone_branch.split()
-            monotone_branch = monotone_branch_words[ monotone_branch_words.index( "branch" )+1][1:-1]
+        with open("%s/_MTN/options" % path) as f:
+            monotone_branch = f.read().strip()
+            if monotone_branch.startswith( "database" ):
+                monotone_branch_words = monotone_branch.split()
+                monotone_branch = monotone_branch_words[ monotone_branch_words.index( "branch" )+1][1:-1]
     except:
         pass
     return monotone_branch
@@ -43,10 +44,11 @@ def base_get_metadata_monotone_branch(path, d):
 def base_get_metadata_monotone_revision(path, d):
     monotone_revision = "<unknown>"
     try:
-        monotone_revision = file( "%s/_MTN/revision" % path ).read().strip()
-        if monotone_revision.startswith( "format_version" ):
-            monotone_revision_words = monotone_revision.split()
-            monotone_revision = monotone_revision_words[ monotone_revision_words.index( "old_revision" )+1][1:-1]
+        with open("%s/_MTN/revision" % path) as f:
+            monotone_revision = f.read().strip()
+            if monotone_revision.startswith( "format_version" ):
+                monotone_revision_words = monotone_revision.split()
+                monotone_revision = monotone_revision_words[ monotone_revision_words.index( "old_revision" )+1][1:-1]
     except IOError:
         pass
     return monotone_revision
@@ -54,7 +56,8 @@ def base_get_metadata_monotone_revision(path, d):
 def base_get_metadata_svn_revision(path, d):
     revision = "<unknown>"
     try:
-        revision = file( "%s/.svn/entries" % path ).readlines()[3].strip()
+        with open("%s/.svn/entries" % path) as f:
+            revision = f.readlines()[3].strip()
     except IOError:
         pass
     return revision
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7d0684c..36b3ae5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1096,7 +1096,8 @@ python emit_pkgdata() {
 
     def get_directory_size(dir):
         if os.listdir(dir):
-            size = int(os.popen('du -sk %s' % dir).readlines()[0].split('\t')[0])
+            with os.popen('du -sk %s' % dir) as f:
+                size = int(f.readlines()[0].split('\t')[0])
         else:
             size = 0
         return size
@@ -1203,7 +1204,7 @@ python emit_pkgdata() {
         g = glob('*')
         if g or allow_empty == "1":
             packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
-            file(packagedfile, 'w').close()
+            open(packagedfile, 'w').close()
 
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_runtime_pkgs(variants, packages, pkgdatadir)
@@ -1633,7 +1634,7 @@ def read_libdep_files(d):
         for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
             depsfile = d.expand("${PKGDEST}/" + pkg + extension)
             if os.access(depsfile, os.R_OK):
-                fd = file(depsfile)
+                fd = open(depsfile)
                 lines = fd.readlines()
                 fd.close()
                 for l in lines:
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 853b5ea..313758f 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -227,7 +227,7 @@ python do_package_deb () {
         bb.mkdirhier(controldir)
         os.chmod(controldir, 0755)
         try:
-            ctrlfile = file(os.path.join(controldir, 'control'), 'wb')
+            ctrlfile = open(os.path.join(controldir, 'control'), 'w')
             # import codecs
             # ctrlfile = codecs.open("someFile", "w", "utf-8")
         except OSError:
@@ -355,7 +355,7 @@ python do_package_deb () {
             if not scriptvar:
                 continue
             try:
-                scriptfile = file(os.path.join(controldir, script), 'w')
+                scriptfile = open(os.path.join(controldir, script), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open %s script file for writing." % script)
@@ -367,7 +367,7 @@ python do_package_deb () {
         conffiles_str = localdata.getVar("CONFFILES", True)
         if conffiles_str:
             try:
-                conffiles = file(os.path.join(controldir, 'conffiles'), 'w')
+                conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open conffiles for writing.")
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 5873f71..f6797ad 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -268,7 +268,7 @@ python do_package_ipk () {
         controldir = os.path.join(root, 'CONTROL')
         bb.mkdirhier(controldir)
         try:
-            ctrlfile = file(os.path.join(controldir, 'control'), 'w')
+            ctrlfile = open(os.path.join(controldir, 'control'), 'w')
         except OSError:
             bb.utils.unlockfile(lf)
             raise bb.build.FuncFailed("unable to open control file for writing.")
@@ -369,7 +369,7 @@ python do_package_ipk () {
             if not scriptvar:
                 continue
             try:
-                scriptfile = file(os.path.join(controldir, script), 'w')
+                scriptfile = open(os.path.join(controldir, script), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open %s script file for writing." % script)
@@ -380,7 +380,7 @@ python do_package_ipk () {
         conffiles_str = localdata.getVar("CONFFILES", True)
         if conffiles_str:
             try:
-                conffiles = file(os.path.join(controldir, 'conffiles'), 'w')
+                conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
             except OSError:
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open conffiles for writing.")
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 58739da..d9892b3 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -504,8 +504,7 @@ def write_rpm_perfiledata(srcname, d):
     outdepends = workdir + "/" + srcname + ".requires"
 
     try:
-        from __builtin__ import file
-        dependsfile = file(outdepends, 'w')
+        dependsfile = open(outdepends, 'w')
     except OSError:
         raise bb.build.FuncFailed("unable to open spec file for writing.")
 
@@ -518,8 +517,7 @@ def write_rpm_perfiledata(srcname, d):
     outprovides = workdir + "/" + srcname + ".provides"
 
     try:
-        from __builtin__ import file
-        providesfile = file(outprovides, 'w')
+        providesfile = open(outprovides, 'w')
     except OSError:
         raise bb.build.FuncFailed("unable to open spec file for writing.")
 
@@ -1005,8 +1003,7 @@ python write_specfile () {
 
     # Write the SPEC file
     try:
-        from __builtin__ import file
-        specfile = file(outspecfile, 'w')
+        specfile = open(outspecfile, 'w')
     except OSError:
         raise bb.build.FuncFailed("unable to open spec file for writing.")
 
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e8a0c5f..0fd9ce6 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -561,14 +561,14 @@ def check_sanity(sanity_data):
     last_sstate_dir = ""
     sanityverfile = 'conf/sanity_info'
     if os.path.exists(sanityverfile):
-        f = open(sanityverfile, 'r')
-        for line in f:
-            if line.startswith('SANITY_VERSION'):
-                last_sanity_version = int(line.split()[1])
-            if line.startswith('TMPDIR'):
-                last_tmpdir = line.split()[1]
-            if line.startswith('SSTATE_DIR'):
-                last_sstate_dir = line.split()[1]
+        with open(sanityverfile, 'r') as f:
+            for line in f:
+                if line.startswith('SANITY_VERSION'):
+                    last_sanity_version = int(line.split()[1])
+                if line.startswith('TMPDIR'):
+                    last_tmpdir = line.split()[1]
+                if line.startswith('SSTATE_DIR'):
+                    last_sstate_dir = line.split()[1]
     
     sanity_version = int(sanity_data.getVar('SANITY_VERSION', True) or 1)
     network_error = False
@@ -584,25 +584,24 @@ def check_sanity(sanity_data):
         if last_sstate_dir != sstate_dir:
             messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
     if os.path.exists("conf") and not messages:
-        f = open(sanityverfile, 'w')
-        f.write("SANITY_VERSION %s\n" % sanity_version) 
-        f.write("TMPDIR %s\n" % tmpdir) 
-        f.write("SSTATE_DIR %s\n" % sstate_dir) 
+        with open(sanityverfile, 'w') as f:
+            f.write("SANITY_VERSION %s\n" % sanity_version) 
+            f.write("TMPDIR %s\n" % tmpdir) 
+            f.write("SSTATE_DIR %s\n" % sstate_dir) 
 
     #
     # Check that TMPDIR hasn't changed location since the last time we were run
     #
     checkfile = os.path.join(tmpdir, "saved_tmpdir")
     if os.path.exists(checkfile):
-        f = open(checkfile, "r")
-        saved_tmpdir = f.read().strip()
-        if (saved_tmpdir != tmpdir):
-            messages = messages + "Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir
+        with open(checkfile, "r") as f:
+            saved_tmpdir = f.read().strip()
+            if (saved_tmpdir != tmpdir):
+                messages = messages + "Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir
     else:
         bb.utils.mkdirhier(tmpdir)
-        f = open(checkfile, "w")
-        f.write(tmpdir)
-    f.close()
+        with open(checkfile, "w") as f:
+            f.write(tmpdir)
 
     #
     # Check the 'ABI' of TMPDIR
@@ -610,33 +609,32 @@ def check_sanity(sanity_data):
     current_abi = sanity_data.getVar('OELAYOUT_ABI', True)
     abifile = sanity_data.getVar('SANITY_ABIFILE', True)
     if os.path.exists(abifile):
-        f = open(abifile, "r")
-        abi = f.read().strip()
+        with open(abifile, "r") as f:
+            abi = f.read().strip()
         if not abi.isdigit():
-            f = open(abifile, "w")
-            f.write(current_abi)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
         elif abi == "2" and current_abi == "3":
             bb.note("Converting staging from layout version 2 to layout version 3")
             subprocess.call(sanity_data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"), shell=True)
             subprocess.call(sanity_data.expand("ln -s sysroots ${TMPDIR}/staging"), shell=True)
             subprocess.call(sanity_data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"), shell=True)
-            f = open(abifile, "w")
-            f.write(current_abi)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
         elif abi == "3" and current_abi == "4":
             bb.note("Converting staging layout from version 3 to layout version 4")
             if os.path.exists(sanity_data.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
                 subprocess.call(sanity_data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"), shell=True)
                 subprocess.call(sanity_data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"), shell=True)
-
-            f = open(abifile, "w")
-            f.write(current_abi)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
         elif abi == "4":
             messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
         elif abi == "5" and current_abi == "6":
             bb.note("Converting staging layout from version 5 to layout version 6")
             subprocess.call(sanity_data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"), shell=True)
-            f = open(abifile, "w")
-            f.write(current_abi)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
         elif abi == "7" and current_abi == "8":
             messages = messages + "Your configuration is using stamp files including the sstate hash but your build directory was built with stamp files that do not include this.\nTo continue, either rebuild or switch back to the OEBasic signature handler with BB_SIGNATURE_HANDLER = 'OEBasic'.\n"
         elif (abi != current_abi and current_abi == "9"):
@@ -645,9 +643,8 @@ def check_sanity(sanity_data):
             # Code to convert from one ABI to another could go here if possible.
             messages = messages + "Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi)
     else:
-        f = open(abifile, "w")
-        f.write(current_abi)
-    f.close()
+        with open(abifile, "w") as f:
+            f.write(current_abi)
 
     oeroot = sanity_data.getVar('COREBASE')
     if oeroot.find ('+') != -1:
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 62fd718..14c38bd 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -12,7 +12,7 @@ def read_pkgdatafile(fn):
 
     if os.access(fn, os.R_OK):
         import re
-        f = file(fn, 'r')
+        f = open(fn, 'r')
         lines = f.readlines()
         f.close()
         r = re.compile("([^:]+):\s*(.*)")
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index ec8260d..0a2092b 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -7,11 +7,13 @@ except ImportError:
 
 def read_file(filename):
     try:
-        f = file( filename, "r" )
+        f = open( filename, "r" )
     except IOError as reason:
         return "" # WARNING: can't raise an error now because of the new RDEPENDS handling. This is a bit ugly. :M:
     else:
-        return f.read().strip()
+        data = f.read().strip()
+        f.close()
+        return data
     return None
 
 def ifelse(condition, iftrue = True, iffalse = False):
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 59e0141..00c88ab 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -262,6 +262,7 @@ python do_package_prepend () {
 
         d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
         d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
+    f.close()
 }
 
 pkg_postinst_${PN} () {




