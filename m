Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8F673306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 14:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5IEEVRv027655 for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:14:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UQ5AaklYbqvo
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:14:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5IEEGg6027645
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:14:28 +0100
Message-ID: <1434636856.14710.94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 15:14:16 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] meta:Add explict getVar param for (non) expansion
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
X-List-Received-Date: Thu, 18 Jun 2015 14:14:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Rather than just use d.getVar(X), use the more explict d.getVar(X, False)
since at some point in the future, having the default of expansion would
be nice. This is the first step towards that.

This patch was mostly made using the command:

sed -e 's:\(getVar([^,()]*\)\s*):\1, False):g' -i `grep -ril getVar *`

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index b8018d2..29b89c3 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -13,7 +13,7 @@ NONGLOBALBBCLASS += "allarch"
 python () {
     # Allow this class to be included but overridden - only set
     # the values if we're still "all" package arch.
-    if d.getVar("PACKAGE_ARCH") == "all":
+    if d.getVar("PACKAGE_ARCH", True) == "all":
         # No need for virtual/libc or a cross compiler
         d.setVar("INHIBIT_DEFAULT_DEPS","1")
 
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 8bd6d92..4f2279e 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -138,7 +138,7 @@ ACLOCALDIR = "${B}/aclocal-copy"
 python autotools_copy_aclocals () {
     s = d.getVar("S", True)
     if not os.path.exists(s + "/configure.in") and not os.path.exists(s + "/configure.ac"):
-        if not d.getVar("AUTOTOOLS_COPYACLOCAL"):
+        if not d.getVar("AUTOTOOLS_COPYACLOCAL", False):
             return
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7093a19..2021580 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -71,7 +71,7 @@ def base_dep_prepend(d):
     # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
     # we need that built is the responsibility of the patch function / class, not
     # the application.
-    if not d.getVar('INHIBIT_DEFAULT_DEPS'):
+    if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
         if (d.getVar('HOST_SYS', True) != d.getVar('BUILD_SYS', True)):
             deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
     return deps
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 003816b..99c7901 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -31,7 +31,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
-                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO'),'zisofs-tools-native:do_populate_sysroot','')}"
+                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')}"
 
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 7a5d960..e9160af 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -64,7 +64,7 @@ def process_dir (rootdir, directory, d):
 
     rootdir = os.path.normpath(rootdir)
     cmd = d.expand('${CHRPATH_BIN}')
-    tmpdir = os.path.normpath(d.getVar('TMPDIR'))
+    tmpdir = os.path.normpath(d.getVar('TMPDIR', False))
     baseprefix = os.path.normpath(d.expand('${base_prefix}'))
     hostos = d.getVar("HOST_OS", True)
 
diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 063114a..7a04318 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -54,7 +54,7 @@ python debian_package_name_hook () {
         return (s[stat.ST_MODE] & stat.S_IEXEC)
 
     def add_rprovides(pkg, d):
-        newpkg = d.getVar('PKG_' + pkg)
+        newpkg = d.getVar('PKG_' + pkg, False)
         if newpkg and newpkg != pkg:
             provs = (d.getVar('RPROVIDES_' + pkg, True) or "").split()
             if pkg not in provs:
@@ -106,10 +106,10 @@ python debian_package_name_hook () {
             if soname_result:
                 (pkgname, devname) = soname_result
                 for pkg in packages.split():
-                    if (d.getVar('PKG_' + pkg) or d.getVar('DEBIAN_NOAUTONAME_' + pkg)):
+                    if (d.getVar('PKG_' + pkg, False) or d.getVar('DEBIAN_NOAUTONAME_' + pkg, False)):
                         add_rprovides(pkg, d)
                         continue
-                    debian_pn = d.getVar('DEBIANNAME_' + pkg)
+                    debian_pn = d.getVar('DEBIANNAME_' + pkg, False)
                     if debian_pn:
                         newpkg = debian_pn
                     elif pkg == orig_pkg:
diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index e9076b2..d7afa72 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -66,5 +66,5 @@ python populate_packages_append () {
                 prerm = '#!/bin/sh\n'
             prerm += d.getVar('gconf_prerm', True)
             d.setVar('pkg_prerm_%s' % pkg, prerm)
-            d.appendVar("RDEPENDS_%s" % pkg, ' ' + d.getVar('MLPREFIX') + 'gconf')
+            d.appendVar("RDEPENDS_%s" % pkg, ' ' + d.getVar('MLPREFIX', False) + 'gconf')
 }
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 789fa38..16e31b9 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -42,7 +42,7 @@ python populate_packages_append () {
             continue
 
         bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
-        rdepends = ' ' + d.getVar('MLPREFIX') + "hicolor-icon-theme"
+        rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
         d.appendVar('RDEPENDS_%s' % pkg, rdepends)
     
         bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 5b45149..0a6316d 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -75,9 +75,9 @@ python populate_packages_append () {
 
 python __anonymous() {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES')
+        gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES', False)
         if not gtkimmodules_check:
-            bb_filename = d.getVar('FILE')
+            bb_filename = d.getVar('FILE', False)
             raise bb.build.FuncFailed("ERROR: %s inherits gtk-immodules-cache but doesn't set GTKIMMODULES_PACKAGES" % bb_filename)
 }
 
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 529b097..61b8bb1 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -36,14 +36,14 @@ def icecc_dep_prepend(d):
     # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
     # we need that built is the responsibility of the patch function / class, not
     # the application.
-    if not d.getVar('INHIBIT_DEFAULT_DEPS'):
+    if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
         return "icecc-create-env-native"
     return ""
 
 DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
 def get_cross_kernel_cc(bb,d):
-    kernel_cc = d.getVar('KERNEL_CC')
+    kernel_cc = d.getVar('KERNEL_CC', False)
 
     # evaluate the expression by the shell if necessary
     if '`' in kernel_cc or '$(' in kernel_cc:
@@ -56,7 +56,7 @@ def get_cross_kernel_cc(bb,d):
     return kernel_cc
 
 def get_icecc(d):
-    return d.getVar('ICECC_PATH') or bb.utils.which(os.getenv("PATH"), "icecc")
+    return d.getVar('ICECC_PATH', False) or bb.utils.which(os.getenv("PATH"), "icecc")
 
 def create_path(compilers, bb, d):
     """
@@ -91,7 +91,7 @@ def create_path(compilers, bb, d):
     return staging
 
 def use_icc(bb,d):
-    if d.getVar('ICECC_DISABLED') == "1":
+    if d.getVar('ICECC_DISABLED', False) == "1":
         # don't even try it, when explicitly disabled
         return "no"
 
@@ -102,7 +102,7 @@ def use_icc(bb,d):
     pn = d.getVar('PN', True)
 
     system_class_blacklist = []
-    user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL') or "none").split()
+    user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL', False) or "none").split()
     package_class_blacklist = system_class_blacklist + user_class_blacklist
 
     for black in package_class_blacklist:
@@ -119,8 +119,8 @@ def use_icc(bb,d):
     # e.g. when there is new version
     # building libgcc-initial with icecc fails with CPP sanity check error if host sysroot contains cross gcc built for another target tune/variant
     system_package_blacklist = ["libgcc-initial"]
-    user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL') or "").split()
-    user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL') or "").split()
+    user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL', False) or "").split()
+    user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL', False) or "").split()
     package_blacklist = system_package_blacklist + user_package_blacklist
 
     if pn in package_blacklist:
@@ -131,14 +131,14 @@ def use_icc(bb,d):
         bb.debug(1, "%s: found in whitelist, enable icecc" % pn)
         return "yes"
 
-    if d.getVar('PARALLEL_MAKE') == "":
+    if d.getVar('PARALLEL_MAKE', False) == "":
         bb.debug(1, "%s: has empty PARALLEL_MAKE, disable icecc" % pn)
         return "no"
 
     return "yes"
 
 def icc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH") == "all"
+    return d.getVar("PACKAGE_ARCH", False) == "all"
 
 def icc_is_kernel(bb, d):
     return \
@@ -155,8 +155,8 @@ def icc_version(bb, d):
     if use_icc(bb, d) == "no":
         return ""
 
-    parallel = d.getVar('ICECC_PARALLEL_MAKE') or ""
-    if not d.getVar('PARALLEL_MAKE') == "" and parallel:
+    parallel = d.getVar('ICECC_PARALLEL_MAKE', False) or ""
+    if not d.getVar('PARALLEL_MAKE', False) == "" and parallel:
         d.setVar("PARALLEL_MAKE", parallel)
 
     if icc_is_native(bb, d):
@@ -167,7 +167,7 @@ def icc_version(bb, d):
         prefix = d.expand('${HOST_PREFIX}' )
         distro = d.expand('${DISTRO}')
         target_sys = d.expand('${TARGET_SYS}')
-        float = d.getVar('TARGET_FPU') or "hard"
+        float = d.getVar('TARGET_FPU', False) or "hard"
         archive_name = prefix + distro + "-"        + target_sys + "-" + float
         if icc_is_kernel(bb, d):
             archive_name += "-kernel"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 64ae2cb..57aaf35 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -100,7 +100,7 @@ def command_variables(d):
 python () {
     variables = command_variables(d)
     for var in variables:
-        if d.getVar(var):
+        if d.getVar(var, False):
             d.setVarFlag(var, 'func', '1')
 }
 
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a007e87..1c90ac6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -978,7 +978,7 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
     for pak in packages:
     # Go through all variables and check if expanded D is found, warn the user accordingly
         for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
-            bbvar = d.getVar(var + "_" + pak)
+            bbvar = d.getVar(var + "_" + pak, False)
             if bbvar:
                 # Bitbake expands ${D} within bbvar during the previous step, so we check for its expanded value
                 if expanded_d in bbvar:
@@ -1229,7 +1229,7 @@ python () {
         for dep in (d.getVar('QADEPENDS', True) or "").split():
             d.appendVarFlag('do_package_qa', 'depends', " %s:do_populate_sysroot" % dep)
         for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
-            if d.getVar(var):
+            if d.getVar(var, False):
                 issues.append(var)
     else:
         d.setVarFlag('do_package_qa', 'rdeptask', '')
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 793936e..2076aa1 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -204,7 +204,7 @@ python package_do_split_gconvs () {
 
     do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern=bpn+'-localedata-%s', \
         description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
-    d.setVar('PACKAGES', d.getVar('PACKAGES') + ' ' + d.getVar('MLPREFIX') + bpn + '-gconv')
+    d.setVar('PACKAGES', d.getVar('PACKAGES', False) + ' ' + d.getVar('MLPREFIX', False) + bpn + '-gconv')
 
     use_bin = d.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", True)
 
@@ -310,7 +310,7 @@ python package_do_split_gconvs () {
         bb.note("generating locale %s (%s)" % (locale, encoding))
 
     def output_locale(name, locale, encoding):
-        pkgname = d.getVar('MLPREFIX') + 'locale-base-' + legitimize_package_name(name)
+        pkgname = d.getVar('MLPREFIX', False) + 'locale-base-' + legitimize_package_name(name)
         d.setVar('ALLOW_EMPTY_%s' % pkgname, '1')
         d.setVar('PACKAGES', '%s %s' % (pkgname, d.getVar('PACKAGES', True)))
         rprovides = ' %svirtual-locale-%s' % (mlprefix, legitimize_package_name(name))
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 756e7f0..224d541 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -160,7 +160,7 @@ def add_package_and_files(d):
     packages = d.getVar('PACKAGES', True)
     files = d.getVar('LICENSE_FILES_DIRECTORY', True)
     pn = d.getVar('PN', True)
-    pn_lic = "%s%s" % (pn, d.getVar('LICENSE_PACKAGE_SUFFIX'))
+    pn_lic = "%s%s" % (pn, d.getVar('LICENSE_PACKAGE_SUFFIX', False))
     if pn_lic in packages:
         bb.warn("%s package already existed in %s." % (pn_lic, pn))
     else:
@@ -348,7 +348,7 @@ def expand_wildcard_licenses(d, wildcard_licenses):
         spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
         licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
 
-    spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES') or '').split()
+    spdx_lics = (d.getVar('SRC_DISTRIBUTE_LICENSES', False) or '').split()
     for wld_lic in wildcard_licenses:
         licenses += fnmatch.filter(spdx_lics, wld_lic)
 
diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index 3e01503..1b051ca 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -6,7 +6,7 @@ python do_lint() {
     ##############################
     # Test that DESCRIPTION exists
     #
-    description = d.getVar("DESCRIPTION")
+    description = d.getVar("DESCRIPTION", False)
     if description[1:10] == '{SUMMARY}':
         bb.warn("%s: DESCRIPTION is not set" % pkgname)
 
@@ -14,7 +14,7 @@ python do_lint() {
     ##############################
     # Test that HOMEPAGE exists
     #
-    homepage = d.getVar("HOMEPAGE")
+    homepage = d.getVar("HOMEPAGE", False)
     if homepage == '':
         bb.warn("%s: HOMEPAGE is not set" % pkgname)
     elif not homepage.startswith("http://") and not homepage.startswith("https://"):
@@ -24,7 +24,7 @@ python do_lint() {
     ##############################
     # Test for valid SECTION
     #
-    section = d.getVar("SECTION")
+    section = d.getVar("SECTION", False)
     if section == '':
         bb.warn("%s: SECTION is not set" % pkgname)
     elif not section.islower():
@@ -34,7 +34,7 @@ python do_lint() {
     ##############################
     # Check that all patches have Signed-off-by and Upstream-Status
     #
-    srcuri = d.getVar("SRC_URI").split()
+    srcuri = d.getVar("SRC_URI", False).split()
     fpaths = (d.getVar('FILESPATH', True) or '').split(':')
 
     def findPatch(patchname):
@@ -80,5 +80,5 @@ python do_lint() {
         if not s.startswith("file://"):
             checkPN(pkgname, 'SRC_URI', s)
 
-    checkPN(pkgname, 'S', d.getVar('S'))
+    checkPN(pkgname, 'S', d.getVar('S', False))
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d58f197..cd92beb 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -425,7 +425,7 @@ def get_package_mapping (pkg, basepkg, d):
 def get_package_additional_metadata (pkg_type, d):
     base_key = "PACKAGE_ADD_METADATA"
     for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
-        if d.getVar(key) is None:
+        if d.getVar(key, False) is None:
             continue
         d.setVarFlag(key, "type", "list")
         if d.getVarFlag(key, "separator") is None:
@@ -1154,7 +1154,7 @@ populate_packages[dirs] = "${D}"
 python package_fixsymlinks () {
     import errno
     pkgdest = d.getVar('PKGDEST', True)
-    packages = d.getVar("PACKAGES").split()
+    packages = d.getVar("PACKAGES", False).split()
 
     dangling_links = {}
     pkg_files = {}
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index d797663..a165a9a 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -87,7 +87,7 @@ python do_package_deb () {
         cleanupcontrol(root)
         from glob import glob
         g = glob('*')
-        if not g and localdata.getVar('ALLOW_EMPTY') != "1":
+        if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
             bb.utils.unlockfile(lf)
             continue
@@ -144,7 +144,7 @@ python do_package_deb () {
         try:
             for (c, fs) in fields:
                 for f in fs:
-                     if localdata.getVar(f) is None:
+                     if localdata.getVar(f, False) is None:
                          raise KeyError(f)
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index edb4b92..dcca284 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -72,7 +72,7 @@ python do_package_ipk () {
 
 
 
-        if localdata.getVar('IPK_HIERARCHICAL_FEED') == "1":
+        if localdata.getVar('IPK_HIERARCHICAL_FEED', False) == "1":
             # Spread packages across subdirectories so each isn't too crowded
             if pkgname.startswith('lib'):
                 pkg_prefix = 'lib' + pkgname[3]
@@ -102,7 +102,7 @@ python do_package_ipk () {
         cleanupcontrol(root)
         from glob import glob
         g = glob('*')
-        if not g and localdata.getVar('ALLOW_EMPTY') != "1":
+        if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
             bb.utils.unlockfile(lf)
             continue
@@ -142,7 +142,7 @@ python do_package_ipk () {
         try:
             for (c, fs) in fields:
                 for f in fs:
-                    if localdata.getVar(f) is None:
+                    if localdata.getVar(f, False) is None:
                         raise KeyError(f)
                 # Special behavior for description...
                 if 'DESCRIPTION' in fs:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 3988b73..271b9ae 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -395,7 +395,7 @@ python write_specfile () {
 
             file_list = []
             walk_files(root, file_list, conffiles, dirfiles)
-            if not file_list and localdata.getVar('ALLOW_EMPTY') != "1":
+            if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
                 bb.note("Not creating empty RPM package for %s" % splitname)
             else:
                 bb.note("Creating RPM package for %s" % splitname)
@@ -504,7 +504,7 @@ python write_specfile () {
         # Now process files
         file_list = []
         walk_files(root, file_list, conffiles, dirfiles)
-        if not file_list and localdata.getVar('ALLOW_EMPTY') != "1":
+        if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty RPM package for %s" % splitname)
         else:
             spec_files_bottom.append('%%files -n %s' % splitname)
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index fed2c28..f9e2292 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -33,7 +33,7 @@ python do_package_tar () {
         localdata = bb.data.createCopy(d)
         root = "%s/%s" % (pkgdest, pkg)
 
-        overrides = localdata.getVar('OVERRIDES')
+        overrides = localdata.getVar('OVERRIDES', False)
         localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
         bb.data.update_data(localdata)
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index dc2c58e..8a80a56 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -98,7 +98,7 @@ python copy_buildsystem () {
         f.write('# this configuration provides, it is strongly suggested that you set\n')
         f.write('# up a proper instance of the full build system and use that instead.\n\n')
 
-        f.write('LCONF_VERSION = "%s"\n\n' % d.getVar('LCONF_VERSION'))
+        f.write('LCONF_VERSION = "%s"\n\n' % d.getVar('LCONF_VERSION', False))
         f.write('BBPATH = "$' + '{TOPDIR}"\n')
         f.write('SDKBASEMETAPATH = "$' + '{TOPDIR}"\n')
         f.write('BBLAYERS := " \\\n')
@@ -115,7 +115,7 @@ python copy_buildsystem () {
         f.write('# up a proper instance of the full build system and use that instead.\n\n')
 
         f.write('INHERIT += "%s"\n\n' % 'uninative')
-        f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION'))
+        f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
         # This is a bit of a hack, but we really don't want these dependencies
         # (we're including them in the SDK as nativesdk- versions instead)
diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 9edf2ce..c5aaaa8 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -29,11 +29,11 @@ python errorreport_handler () {
 
         if isinstance(e, bb.event.BuildStarted):
             data = {}
-            machine = e.data.getVar("MACHINE")
+            machine = e.data.getVar("MACHINE", False)
             data['machine'] = machine
             data['build_sys'] = e.data.getVar("BUILD_SYS", True)
-            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING")
-            data['distro'] = e.data.getVar("DISTRO")
+            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING", False)
+            data['distro'] = e.data.getVar("DISTRO", False)
             data['target_sys'] = e.data.getVar("TARGET_SYS", True)
             data['failures'] = []
             data['component'] = e.getPkgs()[0]
@@ -64,7 +64,7 @@ python errorreport_handler () {
             jsondata = json.loads(errorreport_getdata(e))
             failures = jsondata['failures']
             if(len(failures) > 0):
-                filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
+                filename = "error_report_" + e.data.getVar("BUILDNAME", False)+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
                 bb.note("The errors for this build are stored in %s\nYou can send the errors to a reports server by running:\n  send-error-report %s [-s server]" % (datafile, datafile))
                 bb.note("The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.")
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c66fd4a..d9eff90 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -209,7 +209,7 @@ def check_toolchain(data):
 def check_conf_exists(fn, data):
     bbpath = []
     fn = data.expand(fn)
-    vbbpath = data.getVar("BBPATH")
+    vbbpath = data.getVar("BBPATH", False)
     if vbbpath:
         bbpath += vbbpath.split(":")
     for p in bbpath:
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 97253d8..efa4a0f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -66,7 +66,7 @@ sstate_hardcode_path[dirs] = "${SSTATE_BUILDDIR}"
 
 python () {
     if bb.data.inherits_class('native', d):
-        d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
+        d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
@@ -901,7 +901,7 @@ python sstate_eventhandler2() {
     import glob
     d = e.data
     stamps = e.stamps.values()
-    removeworkdir = (d.getVar("SSTATE_PRUNE_OBSOLETEWORKDIR") == "1")
+    removeworkdir = (d.getVar("SSTATE_PRUNE_OBSOLETEWORKDIR", False) == "1")
     seen = []
     for a in d.getVar("SSTATE_ARCHS", True).split():
         toremove = []
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index e6d7870..a3c1657 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -227,7 +227,7 @@ python populate_packages_updatealternatives () {
             provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives', True)
             if provider:
                 #bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
-                d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX') + provider)
+                d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX', False) + provider)
 
             bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 4d62c2f..5d67a48 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -56,11 +56,11 @@ fi
 
 
 def update_rc_after_parse(d):
-    if d.getVar('INITSCRIPT_PACKAGES') == None:
-        if d.getVar('INITSCRIPT_NAME') == None:
-            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE'))
-        if d.getVar('INITSCRIPT_PARAMS') == None:
-            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE'))
+    if d.getVar('INITSCRIPT_PACKAGES', False) == None:
+        if d.getVar('INITSCRIPT_NAME', False) == None:
+            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_NAME" % d.getVar('FILE', False))
+        if d.getVar('INITSCRIPT_PARAMS', False) == None:
+            raise bb.build.FuncFailed("%s inherits update-rc.d but doesn't set INITSCRIPT_PARAMS" % d.getVar('FILE', False))
 
 python __anonymous() {
     update_rc_after_parse(d)
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index eb82b00..aae038f 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -150,11 +150,11 @@ def update_useradd_after_parse(d):
     useradd_packages = d.getVar('USERADD_PACKAGES', True)
 
     if not useradd_packages:
-        raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE'))
+        raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
         if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg, True):
-            bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE'), pkg))
+            bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', False), pkg))
 
 python __anonymous() {
     if not bb.data.inherits_class('nativesdk', d) \
@@ -202,10 +202,10 @@ fakeroot python populate_packages_prepend () {
 
         # RDEPENDS setup
         rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
-        rdepends += ' ' + d.getVar('MLPREFIX') + 'base-passwd'
-        rdepends += ' ' + d.getVar('MLPREFIX') + 'shadow'
+        rdepends += ' ' + d.getVar('MLPREFIX', False) + 'base-passwd'
+        rdepends += ' ' + d.getVar('MLPREFIX', False) + 'shadow'
         # base-files is where the default /etc/skel is packaged
-        rdepends += ' ' + d.getVar('MLPREFIX') + 'base-files'
+        rdepends += ' ' + d.getVar('MLPREFIX', False) + 'base-files'
         d.setVar("RDEPENDS_%s" % pkg, rdepends)
 
     # Add the user/group preinstall scripts and RDEPENDS requirements
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 1792f18..e817b89 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -28,7 +28,7 @@ python do_clean() {
     bb.note("Removing " + dir)
     oe.path.remove(dir)
 
-    dir = "%s.*" % bb.data.expand(d.getVar('STAMP'), d)
+    dir = "%s.*" % bb.data.expand(d.getVar('STAMP', False), d)
     bb.note("Removing " + dir)
     oe.path.remove(dir)
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9fd02a2..d426ee3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -181,20 +181,20 @@ ASSUME_PROVIDED = "\
 # Package default variables.
 ##################################################################
 
-PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
-PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
-PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
+PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
+PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
+PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
-EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
+EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE', True) or 0) > 0]}"
 P = "${PN}-${PV}"
 
-EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][d.getVar('PRAUTO',1) is None]}"
+EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][d.getVar('PRAUTO', True) is None]}"
 PRAUTOINX = "${PF}"
 
 PKGV ?= "${PV}"
 PKGR ?= "${PR}${EXTENDPRAUTO}"
-PKGE ?= "${@['','${PE\x7d'][int(d.getVar('PE',1) or 0) > 0]}"
-EXTENDPKGEVER = "${@['','${PKGE\x7d:'][d.getVar('PKGE',1).strip() != '']}"
+PKGE ?= "${@['','${PE\x7d'][int(d.getVar('PE', True) or 0) > 0]}"
+EXTENDPKGEVER = "${@['','${PKGE\x7d:'][d.getVar('PKGE', True).strip() != '']}"
 EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
 
 # Base package name
@@ -311,7 +311,7 @@ FILES_${PN}-locale = "${datadir}/locale"
 
 # File manifest
 
-FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE'))}"
+FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE', False))}"
 # FILESPATH is set in base.bbclass
 #FILESPATH = "${FILE_DIRNAME}/${PF}:${FILE_DIRNAME}/${P}:${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/${BP}:${FILE_DIRNAME}/${BPN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"
 # This default was only used for checking
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index fffe11d..98abcdb 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1167,7 +1167,7 @@ class RpmPM(PackageManager):
         return
 
     def save_rpmpostinst(self, pkg):
-        mlibs = (self.d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
+        mlibs = (self.d.getVar('MULTILIB_GLOBAL_VARIANTS', False) or "").split()
 
         new_pkg = pkg
         # Remove any multilib prefix from the package name
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 311f0cf..522f9eb 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -52,7 +52,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
         # test rootfs + kernel
         self.image_fstype = self.get_image_fstype(d)
         self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
-        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE") + '-' + d.getVar('MACHINE') + '.bin')
+        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         if not os.path.isfile(self.rootfs):
             # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
             # the same as the config with which the image was build, ie
@@ -73,10 +73,10 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
         # e.g: TEST_POWERCONTROL_CMD = "/home/user/myscripts/powercontrol.py ${MACHINE} what-ever-other-args-the-script-wants"
         # the command should take as the last argument "off" and "on" and "cycle" (off, on)
         self.powercontrol_cmd = d.getVar("TEST_POWERCONTROL_CMD", True) or None
-        self.powercontrol_args = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS") or ""
+        self.powercontrol_args = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS", False) or ""
 
         self.serialcontrol_cmd = d.getVar("TEST_SERIALCONTROL_CMD", True) or None
-        self.serialcontrol_args = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
+        self.serialcontrol_args = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS", False) or ""
 
         self.origenv = os.environ
         if self.powercontrol_cmd or self.serialcontrol_cmd:
diff --git a/meta/lib/oeqa/runtime/skeletoninit.py b/meta/lib/oeqa/runtime/skeletoninit.py
index 7c7f402..cb0cb9b 100644
--- a/meta/lib/oeqa/runtime/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/skeletoninit.py
@@ -13,7 +13,7 @@ def setUpModule():
 class SkeletonBasicTest(oeRuntimeTest):
 
     @skipUnlessPassed('test_ssh')
-    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
+    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False), "Not appropiate for systemd image")
     def test_skeleton_availability(self):
         (status, output) = self.target.run('ls /etc/init.d/skeleton')
         self.assertEqual(status, 0, msg = "skeleton init script not found. Output:\n%s " % output)
@@ -22,7 +22,7 @@ class SkeletonBasicTest(oeRuntimeTest):
 
     @testcase(284)
     @skipUnlessPassed('test_skeleton_availability')
-    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
+    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False), "Not appropiate for systemd image")
     def test_skeleton_script(self):
         output1 = self.target.run("/etc/init.d/skeleton start")[1]
         (status, output2) = self.target.run(oeRuntimeTest.pscmd + ' | grep [s]keleton-test')
diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index 7fa018e..5d0f548 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -29,7 +29,7 @@ class SyslogTestConfig(oeRuntimeTest):
 
     @skipUnlessPassed("test_syslog_running")
     def test_syslog_restart(self):
-        if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"):
+        if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False):
             (status,output) = self.target.run('/etc/init.d/syslog restart')
         else:
             (status,output) = self.target.run('systemctl restart syslog.service')
@@ -37,7 +37,7 @@ class SyslogTestConfig(oeRuntimeTest):
     @testcase(202)
     @skipUnlessPassed("test_syslog_restart")
     @skipUnlessPassed("test_syslog_logger")
-    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
+    @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", False), "Not appropiate for systemd image")
     def test_syslog_startup_config(self):
         self.target.run('echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf')
         (status,output) = self.target.run('/etc/init.d/syslog restart')
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 9a681a3..60b09b2 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -121,7 +121,7 @@ class QemuTarget(BaseTarget):
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
         self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
-        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE") + '-' + d.getVar('MACHINE') + '.bin')
+        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
 
         if d.getVar("DISTRO", True) == "poky-tiny":
             self.runner = QemuTinyRunner(machine=d.getVar("MACHINE", True),
diff --git a/meta/recipes-core/meta/imagebuilder-collab/bitbake.conf b/meta/recipes-core/meta/imagebuilder-collab/bitbake.conf
index bb22d79..06ef395 100644
--- a/meta/recipes-core/meta/imagebuilder-collab/bitbake.conf
+++ b/meta/recipes-core/meta/imagebuilder-collab/bitbake.conf
@@ -129,7 +129,7 @@ DATETIME = "${DATE}${TIME}"
 # Package default variables.
 ##################################################################
 
-PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
+PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
 
 # Ensure that -dev packages recommend the corresponding -dev packages of their
 # deps, and the same for -dbg.
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a41eada..57b5e53 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -72,9 +72,9 @@ RRECOMMENDS_packagegroup-core-sdk = "\
 #                    if packaged('%s-dev' % name, d):
 #                        rreclist.append('%s-dev' % name)
 #
-#            oldrrec = d.getVar('RRECOMMENDS_%s' % newpkg) or ''
+#            oldrrec = d.getVar('RRECOMMENDS_%s' % newpkg, False) or ''
 #            d.setVar('RRECOMMENDS_%s' % newpkg, oldrrec + ' ' + ' '.join(rreclist))
-#            # bb.note('RRECOMMENDS_%s = "%s"' % (newpkg, d.getVar('RRECOMMENDS_%s' % newpkg)))
+#            # bb.note('RRECOMMENDS_%s = "%s"' % (newpkg, d.getVar('RRECOMMENDS_%s' % newpkg, False)))
 #
 #    # bb.note('pkgs is %s' % pkgs)
 #    d.setVar('PACKAGES', ' '.join(pkgs))
diff --git a/meta/recipes-extended/lsof/lsof_4.88.bb b/meta/recipes-extended/lsof/lsof_4.88.bb
index bc8774f..c0f34b6 100644
--- a/meta/recipes-extended/lsof/lsof_4.88.bb
+++ b/meta/recipes-extended/lsof/lsof_4.88.bb
@@ -17,12 +17,12 @@ LIC_FILES_CHKSUM = "file://${S}/00README;beginline=645;endline=679;md5=964df275d
 python do_unpack () {
     # temporarily change S for unpack
     # of lsof_${PV}
-    s = d.getVar('S')
+    s = d.getVar('S', False)
     d.setVar('S', '${WORKDIR}/lsof_${PV}')
     bb.build.exec_func('base_do_unpack', d)
     # temporarily change SRC_URI for unpack
     # of lsof_${PV}_src
-    src_uri = d.getVar('SRC_URI')
+    src_uri = d.getVar('SRC_URI', False)
     d.setVar('SRC_URI', '${LOCALSRC}')
     d.setVar('S', s)
     bb.build.exec_func('base_do_unpack', d)
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 31b71e2..3cb2305 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -204,8 +204,8 @@ RDEPENDS_packagegroup-core-lsb-python = "\
 "
 
 def get_libqt3(d):
-    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":
-        if 'qt3' in d.getVar('BBFILE_COLLECTIONS') or "":
+    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) or "":
+        if 'qt3' in d.getVar('BBFILE_COLLECTIONS', False) or "":
             return 'libqt-mt3'
 
         bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x' \
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 2175fc0..f1c792b 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -303,7 +303,7 @@ python populate_packages_prepend() {
         do_split_packages(d, plugin_dir, glob, plugin_name, '${PN} %s for %%s' % name, extra_depends='', hook=dev_hook)
         # Create a -dbg package as well
         plugin_dir_dbg = d.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/.debug' % path)
-        packages = d.getVar('PACKAGES')
+        packages = d.getVar('PACKAGES', False)
         for (file,package) in dev_packages:
             packages = "%s %s-dbg" % (packages, package)
             file_name = os.path.join(plugin_dir_dbg, os.path.basename(file))
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index e709b52..9d388d6 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -31,6 +31,6 @@ do_configure_prepend() {
 
 python() {
     if incompatible_license_contains("GPLv3", "x", "", d) == "x" or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
-        d.setVar("EXTRA_OECMAKE", d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
-        d.setVar("DEPENDS", " ".join(i for i in d.getVar("DEPENDS").split() if i != "gconf"))
+        d.setVar("EXTRA_OECMAKE", d.getVar("EXTRA_OECMAKE", False).replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
+        d.setVar("DEPENDS", " ".join(i for i in d.getVar("DEPENDS", False).split() if i != "gconf"))
 }




