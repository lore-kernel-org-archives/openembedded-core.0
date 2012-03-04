Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S433K-00052u-3h for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 05:28:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244JcXq020361
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:19:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20117-05 for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2012 04:19:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244JP0x020355
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:19:27 GMT
Message-ID: <1330834768.3949.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 03 Mar 2012 20:19:28 -0800
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] meta: Convert getVar/getVarFlag(xxx, 1) -> (xxx, True)
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
X-List-Received-Date: Sun, 04 Mar 2012 04:28:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Using "1" with getVar is bad coding style and "True" is preferred.
This patch is a sed over the meta directory of the form:

sed \
 -e 's:\(\.getVar([^,()]*, \)1 *):\1True):g' \
 -e 's:\(\.getVarFlag([^,()]*, [^,()]*, \)1 *):\1True):g' \
 -i `grep -ril getVar *`

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass                     |    6 +-
 meta/classes/base.bbclass                          |   42 +++++++++---------
 meta/classes/copyleft_compliance.bbclass           |    4 +-
 meta/classes/cpan-base.bbclass                     |    2 +-
 meta/classes/cpan_build.bbclass                    |    4 +-
 meta/classes/debian.bbclass                        |   10 ++--
 meta/classes/distrodata.bbclass                    |    2 +-
 meta/classes/distutils-base.bbclass                |    2 +-
 meta/classes/distutils-native-base.bbclass         |    2 +-
 meta/classes/gconf.bbclass                         |   12 +++---
 meta/classes/gtk-icon-cache.bbclass                |   16 +++---
 meta/classes/image.bbclass                         |    8 ++--
 meta/classes/imagetest-qemu.bbclass                |   32 +++++++-------
 meta/classes/kernel-arch.bbclass                   |    6 +-
 meta/classes/kernel.bbclass                        |   46 ++++++++++----------
 meta/classes/libc-common.bbclass                   |    6 +-
 meta/classes/license.bbclass                       |    2 +-
 meta/classes/metadata_scm.bbclass                  |    2 +-
 meta/classes/package.bbclass                       |    2 +-
 meta/classes/package_ipk.bbclass                   |   42 +++++++++---------
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/package_tar.bbclass                   |   18 ++++----
 meta/classes/packagedata.bbclass                   |    4 +-
 meta/classes/pkg_distribute.bbclass                |    2 +-
 meta/classes/pkg_metainfo.bbclass                  |   12 +++---
 meta/classes/populate_sdk_deb.bbclass              |    4 +-
 meta/classes/qemu.bbclass                          |    2 +-
 meta/classes/qt4e.bbclass                          |    2 +-
 meta/classes/recipe_sanity.bbclass                 |   30 ++++++------
 meta/classes/siteconfig.bbclass                    |    2 +-
 meta/classes/siteinfo.bbclass                      |    2 +-
 meta/classes/sourcepkg.bbclass                     |    8 ++--
 meta/classes/src_distribute.bbclass                |   12 +++---
 meta/classes/syslinux.bbclass                      |   28 ++++++------
 meta/classes/task.bbclass                          |    2 +-
 meta/classes/update-alternatives.bbclass           |   14 +++---
 meta/classes/update-rc.d.bbclass                   |   20 ++++----
 meta/classes/utility-tasks.bbclass                 |    2 +-
 meta/classes/utils.bbclass                         |    2 +-
 meta/conf/bitbake.conf                             |   12 +++---
 meta/conf/distro/defaultsetup.conf                 |    2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |    2 +-
 meta/conf/machine/include/tune-thumb.inc           |    8 ++--
 meta/lib/oe/patch.py                               |    4 +-
 meta/lib/oe/path.py                                |    2 +-
 meta/recipes-bsp/grub/grub_0.97.bb                 |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    4 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    4 +-
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 meta/recipes-core/tasks/task-base.bb               |    4 +-
 meta/recipes-core/tasks/task-core-sdk.bb           |    2 +-
 meta/recipes-core/uclibc/uclibc-config.inc         |   12 +++---
 meta/recipes-core/uclibc/uclibc.inc                |    6 +-
 meta/recipes-devtools/apt/apt-native.inc           |    2 +-
 meta/recipes-devtools/apt/apt-package.inc          |    8 ++--
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 meta/recipes-devtools/cmake/cmake_2.8.5.bb         |    4 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |    6 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
 meta/recipes-devtools/guile/guile_2.0.3.bb         |    2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    2 +-
 meta/recipes-extended/cups/cups14.inc              |    2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |    6 +-
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |    6 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    4 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    4 +-
 meta/recipes-graphics/cairo/cairo-fpu.inc          |    2 +-
 meta/recipes-graphics/clutter/clutter-fpu.inc      |    2 +-
 .../fontconfig/fontconfig-native_2.8.0.bb          |    2 +-
 meta/recipes-graphics/mesa/mesa-dri.inc            |    2 +-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    2 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |    6 +-
 meta/recipes-multimedia/alsa/alsa-fpu.inc          |    2 +-
 .../gstreamer/gst-plugins-package.inc              |    4 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    6 +-
 meta/recipes-qt/qt4/qt4_arch.inc                   |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-support/boost/boost.inc               |    4 +-
 83 files changed, 290 insertions(+), 290 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index a8d2b5f..66eba9f 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -1,8 +1,8 @@
 def autotools_dep_prepend(d):
-	if d.getVar('INHIBIT_AUTOTOOLS_DEPS', 1):
+	if d.getVar('INHIBIT_AUTOTOOLS_DEPS', True):
 		return ''
 
-	pn = d.getVar('PN', 1)
+	pn = d.getVar('PN', True)
 	deps = ''
 
 	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
@@ -13,7 +13,7 @@ def autotools_dep_prepend(d):
 		deps += 'libtool-native '
 		if not bb.data.inherits_class('native', d) \
                         and not bb.data.inherits_class('cross', d) \
-                        and not d.getVar('INHIBIT_DEFAULT_DEPS', 1):
+                        and not d.getVar('INHIBIT_DEFAULT_DEPS', True):
                     deps += 'libtool-cross '
 
 	return deps + 'gnu-config-native '
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index cab56de..48e4a28 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -60,8 +60,8 @@ def base_dep_prepend(d):
 	# we need that built is the responsibility of the patch function / class, not
 	# the application.
 	if not d.getVar('INHIBIT_DEFAULT_DEPS'):
-		if (d.getVar('HOST_SYS', 1) !=
-	     	    d.getVar('BUILD_SYS', 1)):
+		if (d.getVar('HOST_SYS', True) !=
+	     	    d.getVar('BUILD_SYS', True)):
 			deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
 	return deps
 
@@ -203,7 +203,7 @@ def preferred_ml_updates(d):
 
 
 def get_layers_branch_rev(d):
-	layers = (d.getVar("BBLAYERS", 1) or "").split()
+	layers = (d.getVar("BBLAYERS", True) or "").split()
 	layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
 		base_get_metadata_git_branch(i, None).strip(), \
 		base_get_metadata_git_revision(i, None)) \
@@ -233,7 +233,7 @@ python base_eventhandler() {
 	if name.startswith("BuildStarted"):
 		e.data.setVar( 'BB_VERSION', bb.__version__)
 		statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TUNE_FEATURES', 'TARGET_FPU']
-		statuslines = ["%-17s = \"%s\"" % (i, e.data.getVar(i, 1) or '') for i in statusvars]
+		statuslines = ["%-17s = \"%s\"" % (i, e.data.getVar(i, True) or '') for i in statusvars]
 
 		statuslines += get_layers_branch_rev(e.data)
 		statusmsg = "\nOE Build Configuration:\n%s\n" % '\n'.join(statuslines)
@@ -242,7 +242,7 @@ python base_eventhandler() {
 		needed_vars = [ "TARGET_ARCH", "TARGET_OS" ]
 		pesteruser = []
 		for v in needed_vars:
-			val = e.data.getVar(v, 1)
+			val = e.data.getVar(v, True)
 			if not val or val == 'INVALID':
 				pesteruser.append(v)
 		if pesteruser:
@@ -344,7 +344,7 @@ python () {
         pr = pr_prefix.group(0) + str(nval) + pr[prval.end():]
         d.setVar('PR', pr)
 
-    pn = d.getVar('PN', 1)
+    pn = d.getVar('PN', True)
     license = d.getVar('LICENSE', True)
     if license == "INVALID":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
@@ -370,36 +370,36 @@ python () {
         d.setVarFlag('do_package_setscene', 'fakeroot', 1)
     source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', 0)
     if not source_mirror_fetch:
-        need_host = d.getVar('COMPATIBLE_HOST', 1)
+        need_host = d.getVar('COMPATIBLE_HOST', True)
         if need_host:
             import re
-            this_host = d.getVar('HOST_SYS', 1)
+            this_host = d.getVar('HOST_SYS', True)
             if not re.match(need_host, this_host):
                 raise bb.parse.SkipPackage("incompatible with host %s (not in COMPATIBLE_HOST)" % this_host)
 
-        need_machine = d.getVar('COMPATIBLE_MACHINE', 1)
+        need_machine = d.getVar('COMPATIBLE_MACHINE', True)
         if need_machine:
             import re
-            this_machine = d.getVar('MACHINE', 1)
+            this_machine = d.getVar('MACHINE', True)
             if this_machine and not re.match(need_machine, this_machine):
-                this_soc_family = d.getVar('SOC_FAMILY', 1)
+                this_soc_family = d.getVar('SOC_FAMILY', True)
                 if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
                     raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
 
 
-        dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', 1)
+        dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', True)
         if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial"):
-            hosttools_whitelist = (d.getVar('HOSTTOOLS_WHITELIST_%s' % dont_want_license, 1) or "").split()
-            lgplv2_whitelist = (d.getVar('LGPLv2_WHITELIST_%s' % dont_want_license, 1) or "").split()
-            dont_want_whitelist = (d.getVar('WHITELIST_%s' % dont_want_license, 1) or "").split()
+            hosttools_whitelist = (d.getVar('HOSTTOOLS_WHITELIST_%s' % dont_want_license, True) or "").split()
+            lgplv2_whitelist = (d.getVar('LGPLv2_WHITELIST_%s' % dont_want_license, True) or "").split()
+            dont_want_whitelist = (d.getVar('WHITELIST_%s' % dont_want_license, True) or "").split()
             if pn not in hosttools_whitelist and pn not in lgplv2_whitelist and pn not in dont_want_whitelist:
 
-                this_license = d.getVar('LICENSE', 1)
+                this_license = d.getVar('LICENSE', True)
                 if incompatible_license(d,dont_want_license):
                     bb.note("SKIPPING %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
-    srcuri = d.getVar('SRC_URI', 1)
+    srcuri = d.getVar('SRC_URI', True)
     # Svn packages should DEPEND on subversion-native
     if "svn://" in srcuri:
         d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
@@ -426,8 +426,8 @@ python () {
         d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
     # 'multimachine' handling
-    mach_arch = d.getVar('MACHINE_ARCH', 1)
-    pkg_arch = d.getVar('PACKAGE_ARCH', 1)
+    mach_arch = d.getVar('MACHINE_ARCH', True)
+    pkg_arch = d.getVar('PACKAGE_ARCH', True)
 
     if (pkg_arch == mach_arch):
         # Already machine specific - nothing further to do
@@ -458,9 +458,9 @@ python () {
                         d.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}")
                         return
 
-    packages = d.getVar('PACKAGES', 1).split()
+    packages = d.getVar('PACKAGES', True).split()
     for pkg in packages:
-        pkgarch = d.getVar("PACKAGE_ARCH_%s" % pkg, 1)
+        pkgarch = d.getVar("PACKAGE_ARCH_%s" % pkg, True)
 
         # We could look for != PACKAGE_ARCH here but how to choose
         # if multiple differences are present?
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 2eb9ded..4082e7e 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -69,8 +69,8 @@ python do_prepare_copyleft_sources () {
     else:
         bb.debug(1, 'copyleft: %s is included' % p)
 
-    sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', 1)
-    src_uri = d.getVar('SRC_URI', 1).split()
+    sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', True)
+    src_uri = d.getVar('SRC_URI', True).split()
     fetch = bb.fetch2.Fetch(src_uri, d)
     ud = fetch.ud
 
diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 79582ca..6cb1fef 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -28,7 +28,7 @@ def get_perl_version(d):
 
 # Determine where the library directories are
 def perl_get_libdirs(d):
-	libdir = d.getVar('libdir', 1)
+	libdir = d.getVar('libdir', True)
 	if is_target(d) == "no":
 		libdir += '/perl-native'
 	libdir += '/perl'
diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index 981332c..36ffc56 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -10,9 +10,9 @@ inherit cpan-base
 # libmodule-build-perl)
 #
 def cpan_build_dep_prepend(d):
-	if d.getVar('CPAN_BUILD_DEPS', 1):
+	if d.getVar('CPAN_BUILD_DEPS', True):
 		return ''
-	pn = d.getVar('PN', 1)
+	pn = d.getVar('PN', True)
 	if pn in ['libmodule-build-perl', 'libmodule-build-perl-native']:
 		return ''
 	return 'libmodule-build-perl-native '
diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 025abcf..3637e2e 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -22,8 +22,8 @@ python () {
 python debian_package_name_hook () {
 	import glob, copy, stat, errno, re
 
-	pkgdest = d.getVar('PKGDEST', 1)
-	packages = d.getVar('PACKAGES', 1)
+	pkgdest = d.getVar('PKGDEST', True)
+	packages = d.getVar('PACKAGES', True)
 	bin_re = re.compile(".*/s?" + os.path.basename(d.getVar("bindir", True)) + "$")
 	lib_re = re.compile(".*/" + os.path.basename(d.getVar("libdir", True)) + "$")
 	so_re = re.compile("lib.*\.so")
@@ -60,7 +60,7 @@ python debian_package_name_hook () {
 				for f in files:
 					if so_re.match(f):
 						fp = os.path.join(root, f)
-						cmd = (d.getVar('BUILD_PREFIX', 1) or "") + "objdump -p " + fp + " 2>/dev/null"
+						cmd = (d.getVar('BUILD_PREFIX', True) or "") + "objdump -p " + fp + " 2>/dev/null"
 						fd = os.popen(cmd)
 						lines = fd.readlines()
 						fd.close()
@@ -74,7 +74,7 @@ python debian_package_name_hook () {
 		if len(sonames) == 1:
 			soname = sonames[0]
 		elif len(sonames) > 1:
-			lead = d.getVar('LEAD_SONAME', 1)
+			lead = d.getVar('LEAD_SONAME', True)
 			if lead:
 				r = re.compile(lead)
 				filtered = []
@@ -117,7 +117,7 @@ python debian_package_name_hook () {
 	# and later
 	# DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libticw orig_pkg ncurses-libtic debian_pn None newpkg libticw
 	# so we need to handle ncurses-libticw->libticw5 before ncurses-libtic->libtic5
-	for pkg in sorted((d.getVar('AUTO_LIBNAME_PKGS', 1) or "").split(), reverse=True):
+	for pkg in sorted((d.getVar('AUTO_LIBNAME_PKGS', True) or "").split(), reverse=True):
 		auto_libname(packages, pkg)
 }
 
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index ff5b836..aba4bd7 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -372,7 +372,7 @@ python do_checkpkg() {
 
 		f.close()
 		if status != "ErrHostNoDir" and re.match("Err", status):
-			logpath = d.getVar('LOG_DIR', 1)
+			logpath = d.getVar('LOG_DIR', True)
 			os.system("cp %s %s/" % (f.name, logpath))
 		os.unlink(f.name)
 		return status
diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index e7d0bb8..6d18e08 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -1,4 +1,4 @@
-DEPENDS  += "${@["python-native python", ""][(d.getVar('PACKAGES', 1) == '')]}"
+DEPENDS  += "${@["python-native python", ""][(d.getVar('PACKAGES', True) == '')]}"
 RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
 
 inherit distutils-common-base
diff --git a/meta/classes/distutils-native-base.bbclass b/meta/classes/distutils-native-base.bbclass
index 47367d7..ceda512 100644
--- a/meta/classes/distutils-native-base.bbclass
+++ b/meta/classes/distutils-native-base.bbclass
@@ -1,3 +1,3 @@
-DEPENDS  += "${@["python-native", ""][(d.getVar('PACKAGES', 1) == '')]}"
+DEPENDS  += "${@["python-native", ""][(d.getVar('PACKAGES', True) == '')]}"
 
 inherit distutils-common-base
diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index 7bfa871..095d04b 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -32,8 +32,8 @@ done
 
 python populate_packages_append () {
 	import re
-	packages = d.getVar('PACKAGES', 1).split()
-	pkgdest =  d.getVar('PKGDEST', 1)
+	packages = d.getVar('PACKAGES', True).split()
+	pkgdest =  d.getVar('PKGDEST', True)
 	
 	for pkg in packages:
 		schema_dir = '%s/%s/etc/gconf/schemas' % (pkgdest, pkg)
@@ -46,15 +46,15 @@ python populate_packages_append () {
 		if schemas != []:
 			bb.note("adding gconf postinst and prerm scripts to %s" % pkg)
 			d.setVar('SCHEMA_FILES', " ".join(schemas))
-			postinst = d.getVar('pkg_postinst_%s' % pkg, 1) or d.getVar('pkg_postinst', 1)
+			postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
 			if not postinst:
 				postinst = '#!/bin/sh\n'
-			postinst += d.getVar('gconf_postinst', 1)
+			postinst += d.getVar('gconf_postinst', True)
 			d.setVar('pkg_postinst_%s' % pkg, postinst)
-			prerm = d.getVar('pkg_prerm_%s' % pkg, 1) or d.getVar('pkg_prerm', 1)
+			prerm = d.getVar('pkg_prerm_%s' % pkg, True) or d.getVar('pkg_prerm', True)
 			if not prerm:
 				prerm = '#!/bin/sh\n'
-			prerm += d.getVar('gconf_prerm', 1)
+			prerm += d.getVar('gconf_prerm', True)
 			d.setVar('pkg_prerm_%s' % pkg, prerm)
 			rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
 			rdepends += " gconf"
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 0204fd3..60e3401 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -28,31 +28,31 @@ done
 }
 
 python populate_packages_append () {
-	packages = d.getVar('PACKAGES', 1).split()
-	pkgdest =  d.getVar('PKGDEST', 1)
+	packages = d.getVar('PACKAGES', True).split()
+	pkgdest =  d.getVar('PKGDEST', True)
 	
 	for pkg in packages:
-		icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, d.getVar('datadir', 1))
+		icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, d.getVar('datadir', True))
 		if not os.path.exists(icon_dir):
 			continue
 
 		bb.note("adding hicolor-icon-theme dependency to %s" % pkg)	
-		rdepends = d.getVar('RDEPENDS_%s' % pkg, 1)
+		rdepends = d.getVar('RDEPENDS_%s' % pkg, True)
 		rdepends = rdepends + ' ' + d.getVar('MLPREFIX') + "hicolor-icon-theme"
 		d.setVar('RDEPENDS_%s' % pkg, rdepends)
 	
 		bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)
 		
-		postinst = d.getVar('pkg_postinst_%s' % pkg, 1) or d.getVar('pkg_postinst', 1)
+		postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
 		if not postinst:
 			postinst = '#!/bin/sh\n'
-		postinst += d.getVar('gtk_icon_cache_postinst', 1)
+		postinst += d.getVar('gtk_icon_cache_postinst', True)
 		d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-		postrm = d.getVar('pkg_postrm_%s' % pkg, 1) or d.getVar('pkg_postrm', 1)
+		postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
 		if not postrm:
 			postrm = '#!/bin/sh\n'
-		postrm += d.getVar('gtk_icon_cache_postrm', 1)
+		postrm += d.getVar('gtk_icon_cache_postrm', True)
 		d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index dfce381..a62eb2c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -98,15 +98,15 @@ python () {
 # is searched for in the BBPATH (same as the old version.)
 #
 def get_devtable_list(d):
-    devtable = d.getVar('IMAGE_DEVICE_TABLE', 1)
+    devtable = d.getVar('IMAGE_DEVICE_TABLE', True)
     if devtable != None:
         return devtable
     str = ""
-    devtables = d.getVar('IMAGE_DEVICE_TABLES', 1)
+    devtables = d.getVar('IMAGE_DEVICE_TABLES', True)
     if devtables == None:
         devtables = 'files/device_table-minimal.txt'
     for devtable in devtables.split():
-        str += " %s" % bb.which(d.getVar('BBPATH', 1), devtable)
+        str += " %s" % bb.which(d.getVar('BBPATH', True), devtable)
     return str
 
 IMAGE_CLASSES ?= "image_types"
@@ -119,7 +119,7 @@ ROOTFS_POSTPROCESS_COMMAND ?= ""
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
-LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS', 1).split()))}"
+LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS', True).split()))}"
 
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
 
diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index d01d1f4..d56b44b 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -35,12 +35,12 @@ def qemuimagetest_main(d):
     
     casestr = re.compile(r'(?P<scen>\w+\b):(?P<case>\S+$)')
     resultstr = re.compile(r'\s*(?P<case>\w+)\s*(?P<pass>\d+)\s*(?P<fail>\d+)\s*(?P<noresult>\d+)')
-    machine = d.getVar('MACHINE', 1)
-    pname = d.getVar('PN', 1)
+    machine = d.getVar('MACHINE', True)
+    pname = d.getVar('PN', True)
     
     """function to save test cases running status"""
     def teststatus(test, status, index, length):
-        test_status = d.getVar('TEST_STATUS', 1)
+        test_status = d.getVar('TEST_STATUS', True)
         if not os.path.exists(test_status):
             raise bb.build.FuncFailed("No test status file existing under TEST_TMP")
 
@@ -51,13 +51,13 @@ def qemuimagetest_main(d):
 
     """funtion to run each case under scenario"""
     def runtest(scen, case, fulltestpath):
-        resultpath = d.getVar('TEST_RESULT', 1)
-        tmppath = d.getVar('TEST_TMP', 1)
+        resultpath = d.getVar('TEST_RESULT', True)
+        tmppath = d.getVar('TEST_TMP', True)
 
         """initialize log file for testcase"""
-        logpath = d.getVar('TEST_LOG', 1)
+        logpath = d.getVar('TEST_LOG', True)
         bb.utils.mkdirhier("%s/%s" % (logpath, scen))
-        caselog = os.path.join(logpath, "%s/log_%s.%s" % (scen, case, d.getVar('DATETIME', 1)))
+        caselog = os.path.join(logpath, "%s/log_%s.%s" % (scen, case, d.getVar('DATETIME', True)))
         os.system("touch %s" % caselog)
         
         """export TEST_TMP, TEST_RESULT, DEPLOY_DIR and QEMUARCH"""
@@ -141,7 +141,7 @@ def qemuimagetest_main(d):
 
     """Clean tmp folder for testing"""
     def clean_tmp():
-        tmppath = d.getVar('TEST_TMP', 1)
+        tmppath = d.getVar('TEST_TMP', True)
 
         if os.path.isdir(tmppath):
             for f in os.listdir(tmppath):
@@ -155,28 +155,28 @@ def qemuimagetest_main(d):
     clean_tmp()
 
     """check testcase folder and create test log folder"""
-    testpath = d.getVar('TEST_DIR', 1)
+    testpath = d.getVar('TEST_DIR', True)
     bb.utils.mkdirhier(testpath)
     
-    logpath = d.getVar('TEST_LOG', 1)
+    logpath = d.getVar('TEST_LOG', True)
     bb.utils.mkdirhier(logpath)
 
-    tmppath = d.getVar('TEST_TMP', 1)
+    tmppath = d.getVar('TEST_TMP', True)
     bb.utils.mkdirhier(tmppath)
 
     """initialize test status file"""
-    test_status = d.getVar('TEST_STATUS', 1)
+    test_status = d.getVar('TEST_STATUS', True)
     if os.path.exists(test_status):
         os.remove(test_status)
     os.system("touch %s" % test_status)
 
     """initialize result file"""
-    resultpath = d.getVar('TEST_RESULT', 1)
+    resultpath = d.getVar('TEST_RESULT', True)
     bb.utils.mkdirhier(resultpath)
-    resultfile = os.path.join(resultpath, "testresult.%s" % d.getVar('DATETIME', 1))
+    resultfile = os.path.join(resultpath, "testresult.%s" % d.getVar('DATETIME', True))
     sresultfile = os.path.join(resultpath, "testresult.log")
 
-    machine = d.getVar('MACHINE', 1)
+    machine = d.getVar('MACHINE', True)
 
     if os.path.exists(sresultfile):
         os.remove(sresultfile)
@@ -188,7 +188,7 @@ def qemuimagetest_main(d):
     f.close()
     
     """generate pre-defined testcase list"""
-    testlist = d.getVar('TEST_SCEN', 1)
+    testlist = d.getVar('TEST_SCEN', True)
     fulllist = generate_list(testlist)
 
     """Begin testing"""
diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 8693395..d37c1fb 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -18,7 +18,7 @@ valid_archs = "alpha cris ia64 \
 def map_kernel_arch(a, d):
 	import re
 
-	valid_archs = d.getVar('valid_archs', 1).split()
+	valid_archs = d.getVar('valid_archs', True).split()
 
 	if   re.match('(i.86|athlon|x86.64)$', a):	return 'x86'
 	elif re.match('arm26$', a):		        return 'arm26'
@@ -32,7 +32,7 @@ def map_kernel_arch(a, d):
 	else:
 		bb.error("cannot map '%s' to a linux kernel architecture" % a)
 
-export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH', 1), d)}"
+export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH', True), d)}"
 
 def map_uboot_arch(a, d):
 	import re
@@ -41,5 +41,5 @@ def map_uboot_arch(a, d):
 	elif re.match('i.86$', a): return 'x86'
 	return a
 
-export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', 1), d)}"
+export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ec5d65e..8fbec90 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -11,9 +11,9 @@ INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', 1) or ''
+    kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
     if kerneltype == 'uImage':
-    	depends = d.getVar("DEPENDS", 1)
+    	depends = d.getVar("DEPENDS", True)
     	depends = "%s u-boot-mkimage-native" % depends
     	d.setVar("DEPENDS", depends)
 
@@ -75,7 +75,7 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', 1))}"
+KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
@@ -306,10 +306,10 @@ module_conf_rfcomm = "alias bt-proto-3 rfcomm"
 python populate_packages_prepend () {
 	def extract_modinfo(file):
 		import tempfile, re
-		tempfile.tempdir = d.getVar("WORKDIR", 1)
+		tempfile.tempdir = d.getVar("WORKDIR", True)
 		tf = tempfile.mkstemp()
 		tmpfile = tf[1]
-		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", 1), d.getVar("HOST_PREFIX", 1) or "", file, tmpfile)
+		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
 		os.system(cmd)
 		f = open(tmpfile)
 		l = f.read().split("\000")
@@ -328,18 +328,18 @@ python populate_packages_prepend () {
 	def parse_depmod():
 		import re
 
-		dvar = d.getVar('PKGD', 1)
+		dvar = d.getVar('PKGD', True)
 		if not dvar:
 			bb.error("PKGD not defined")
 			return
 
-		kernelver = d.getVar('KERNEL_VERSION', 1)
+		kernelver = d.getVar('KERNEL_VERSION', True)
 		kernelver_stripped = kernelver
 		m = re.match('^(.*-hh.*)[\.\+].*$', kernelver)
 		if m:
 			kernelver_stripped = m.group(1)
-		path = d.getVar("PATH", 1)
-		host_prefix = d.getVar("HOST_PREFIX", 1) or ""
+		path = d.getVar("PATH", True)
+		host_prefix = d.getVar("HOST_PREFIX", True) or ""
 
 		cmd = "PATH=\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
 		f = os.popen(cmd, 'r')
@@ -377,9 +377,9 @@ python populate_packages_prepend () {
 	
 	def get_dependencies(file, pattern, format):
                 # file no longer includes PKGD
-		file = file.replace(d.getVar('PKGD', 1) or '', '', 1)
+		file = file.replace(d.getVar('PKGD', True) or '', '', 1)
                 # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-                file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', 1) or '', '', 1)
+                file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
 
 		if module_deps.has_key(file):
 			import re
@@ -398,40 +398,40 @@ python populate_packages_prepend () {
 		import re
 		vals = extract_modinfo(file)
 
-		dvar = d.getVar('PKGD', 1)
+		dvar = d.getVar('PKGD', True)
 
 		# If autoloading is requested, output /etc/modutils/<name> and append
 		# appropriate modprobe commands to the postinst
-		autoload = d.getVar('module_autoload_%s' % basename, 1)
+		autoload = d.getVar('module_autoload_%s' % basename, True)
 		if autoload:
 			name = '%s/etc/modutils/%s' % (dvar, basename)
 			f = open(name, 'w')
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
-			postinst = d.getVar('pkg_postinst_%s' % pkg, 1)
+			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
-			postinst += d.getVar('autoload_postinst_fragment', 1) % autoload
+			postinst += d.getVar('autoload_postinst_fragment', True) % autoload
 			d.setVar('pkg_postinst_%s' % pkg, postinst)
 
 		# Write out any modconf fragment
-		modconf = d.getVar('module_conf_%s' % basename, 1)
+		modconf = d.getVar('module_conf_%s' % basename, True)
 		if modconf:
 			name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
 			f = open(name, 'w')
 			f.write("%s\n" % modconf)
 			f.close()
 
-		files = d.getVar('FILES_%s' % pkg, 1)
+		files = d.getVar('FILES_%s' % pkg, True)
 		files = "%s /etc/modutils/%s /etc/modutils/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename, basename)
 		d.setVar('FILES_%s' % pkg, files)
 
 		if vals.has_key("description"):
-			old_desc = d.getVar('DESCRIPTION_' + pkg, 1) or ""
+			old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
 			d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
 
-		rdepends_str = d.getVar('RDEPENDS_' + pkg, 1)
+		rdepends_str = d.getVar('RDEPENDS_' + pkg, True)
 		if rdepends_str:
 			rdepends = rdepends_str.split()
 		else:
@@ -443,12 +443,12 @@ python populate_packages_prepend () {
 	module_regex = '^(.*)\.k?o$'
 	module_pattern = 'kernel-module-%s'
 
-	postinst = d.getVar('pkg_postinst_modules', 1)
-	postrm = d.getVar('pkg_postrm_modules', 1)
+	postinst = d.getVar('pkg_postinst_modules', True)
+	postrm = d.getVar('pkg_postrm_modules', True)
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", 1))
+	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
 
 	import re
 	metapkg = "kernel-modules"
@@ -460,7 +460,7 @@ python populate_packages_prepend () {
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
 			blacklist.append(pkg)
 	metapkg_rdepends = []
-	packages = d.getVar('PACKAGES', 1).split()
+	packages = d.getVar('PACKAGES', True).split()
 	for pkg in packages[1:]:
 		if not pkg in blacklist and not pkg in metapkg_rdepends:
 			metapkg_rdepends.append(pkg)
diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index ec33762..962f205 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -18,13 +18,13 @@ do_install() {
 }
 
 def get_libc_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
         return "--without-fp"
     return ""
 
 python populate_packages_prepend () {
-	if d.getVar('DEBIAN_NAMES', 1):
-		bpn = d.getVar('BPN', 1)
+	if d.getVar('DEBIAN_NAMES', True):
+		bpn = d.getVar('BPN', True)
 		d.setVar('PKG_'+bpn, 'libc6')
 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
 }
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index cfc9eaf..3de704f 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -261,7 +261,7 @@ def incompatible_license(d,dont_want_license):
     from fnmatch import fnmatchcase as fnmatch
 
     dont_want_licenses = []
-    dont_want_licenses.append(d.getVar('INCOMPATIBLE_LICENSE', 1))
+    dont_want_licenses.append(d.getVar('INCOMPATIBLE_LICENSE', True))
     if d.getVarFlag('SPDXLICENSEMAP', dont_want_license):
 	dont_want_licenses.append(d.getVarFlag('SPDXLICENSEMAP', dont_want_license))
 
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 57609ef..62650be 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -27,7 +27,7 @@ def base_detect_branch(d):
 	return "<unknown>"	
 
 def base_get_scmbasepath(d):
-	return d.getVar( 'COREBASE', 1 )
+	return d.getVar( 'COREBASE', True)
 
 def base_get_metadata_monotone_branch(path, d):
 	monotone_branch = "<unknown>"
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4ed6972..5c42619 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1067,7 +1067,7 @@ python emit_pkgdata() {
 		return size
 
 	packages = d.getVar('PACKAGES', True)
-	pkgdest = d.getVar('PKGDEST', 1)
+	pkgdest = d.getVar('PKGDEST', True)
 	pkgdatadir = d.getVar('PKGDESTWORK', True)
 
 	# Take shared lock since we're only reading, not writing
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e9d1ddc..ff8b5b4 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -15,12 +15,12 @@ python package_ipk_fn () {
 }
 
 python package_ipk_install () {
-	pkg = d.getVar('PKG', 1)
-	pkgfn = d.getVar('PKGFN', 1)
-	rootfs = d.getVar('IMAGE_ROOTFS', 1)
-	ipkdir = d.getVar('DEPLOY_DIR_IPK', 1)
-	stagingdir = d.getVar('STAGING_DIR', 1)
-	tmpdir = d.getVar('TMPDIR', 1)
+	pkg = d.getVar('PKG', True)
+	pkgfn = d.getVar('PKGFN', True)
+	rootfs = d.getVar('IMAGE_ROOTFS', True)
+	ipkdir = d.getVar('DEPLOY_DIR_IPK', True)
+	stagingdir = d.getVar('STAGING_DIR', True)
+	tmpdir = d.getVar('TMPDIR', True)
 
 	if None in (pkg,pkgfn,rootfs):
 		raise bb.build.FuncFailed("missing variables (one or more of PKG, PKGFN, IMAGEROOTFS)")
@@ -289,7 +289,7 @@ python do_package_ipk () {
 
 		localdata.setVar('ROOT', '')
 		localdata.setVar('ROOT_%s' % pkg, root)
-		pkgname = localdata.getVar('PKG_%s' % pkg, 1)
+		pkgname = localdata.getVar('PKG_%s' % pkg, True)
 		if not pkgname:
 			pkgname = pkg
 		localdata.setVar('PKG', pkgname)
@@ -298,7 +298,7 @@ python do_package_ipk () {
 
 		bb.data.update_data(localdata)
 		basedir = os.path.join(os.path.dirname(root))
-		arch = localdata.getVar('PACKAGE_ARCH', 1)
+		arch = localdata.getVar('PACKAGE_ARCH', True)
 		pkgoutdir = "%s/%s" % (outdir, arch)
 		bb.mkdirhier(pkgoutdir)
 		os.chdir(root)
@@ -310,7 +310,7 @@ python do_package_ipk () {
 		except ValueError:
 			pass
 		if not g and localdata.getVar('ALLOW_EMPTY') != "1":
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', 1), localdata.getVar('PKGR', 1)))
+			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
 			bb.utils.unlockfile(lf)
 			continue
 
@@ -323,7 +323,7 @@ python do_package_ipk () {
 			raise bb.build.FuncFailed("unable to open control file for writing.")
 
 		fields = []
-		pe = d.getVar('PKGE', 1)
+		pe = d.getVar('PKGE', True)
 		if pe and int(pe) > 0:
 			fields.append(["Version: %s:%s-%s\n", ['PKGE', 'PKGV', 'PKGR']])
 		else:
@@ -340,7 +340,7 @@ python do_package_ipk () {
 		def pullData(l, d):
 			l2 = []
 			for i in l:
-				l2.append(d.getVar(i, 1))
+				l2.append(d.getVar(i, True))
 			return l2
 
 		ctrlfile.write("Package: %s\n" % pkgname)
@@ -369,12 +369,12 @@ python do_package_ipk () {
 
 		bb.build.exec_func("mapping_rename_hook", localdata)
 
-		rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", 1) or "")
-		rrecommends = bb.utils.explode_dep_versions(localdata.getVar("RRECOMMENDS", 1) or "")
-		rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", 1) or "")
-		rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", 1) or "")
-		rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", 1) or "")
-		rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", 1) or "")
+		rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
+		rrecommends = bb.utils.explode_dep_versions(localdata.getVar("RRECOMMENDS", True) or "")
+		rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or "")
+		rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or "")
+		rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or "")
+		rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or "")
 
 		if rdepends:
 			ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends))
@@ -388,14 +388,14 @@ python do_package_ipk () {
 			ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
 		if rconflicts:
 			ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
-		src_uri = localdata.getVar("SRC_URI", 1)
+		src_uri = localdata.getVar("SRC_URI", True)
 		if src_uri:
 			src_uri = re.sub("\s+", " ", src_uri)
 			ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
 		ctrlfile.close()
 
 		for script in ["preinst", "postinst", "prerm", "postrm"]:
-			scriptvar = localdata.getVar('pkg_%s' % script, 1)
+			scriptvar = localdata.getVar('pkg_%s' % script, True)
 			if not scriptvar:
 				continue
 			try:
@@ -407,7 +407,7 @@ python do_package_ipk () {
 			scriptfile.close()
 			os.chmod(os.path.join(controldir, script), 0755)
 
-		conffiles_str = localdata.getVar("CONFFILES", 1)
+		conffiles_str = localdata.getVar("CONFFILES", True)
 		if conffiles_str:
 			try:
 				conffiles = file(os.path.join(controldir, 'conffiles'), 'w')
@@ -419,7 +419,7 @@ python do_package_ipk () {
 			conffiles.close()
 
 		os.chdir(basedir)
-		ret = os.system("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH", 1), 
+		ret = os.system("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH", True), 
                                                           d.getVar("OPKGBUILDCMD",1), pkg, pkgoutdir))
 		if ret != 0:
 			bb.utils.unlockfile(lf)
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a264712..af8c63e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -619,7 +619,7 @@ python write_specfile () {
 
 		localdata.setVar('ROOT', '')
 		localdata.setVar('ROOT_%s' % pkg, root)
-		pkgname = localdata.getVar('PKG_%s' % pkg, 1)
+		pkgname = localdata.getVar('PKG_%s' % pkg, True)
 		if not pkgname:
 			pkgname = pkg
 		localdata.setVar('PKG', pkgname)
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 201bd91..7590177 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -9,9 +9,9 @@ python package_tar_fn () {
 }
 
 python package_tar_install () {
-	pkg = d.getVar('PKG', 1)
-	pkgfn = d.getVar('PKGFN', 1)
-	rootfs = d.getVar('IMAGE_ROOTFS', 1)
+	pkg = d.getVar('PKG', True)
+	pkgfn = d.getVar('PKGFN', True)
+	rootfs = d.getVar('IMAGE_ROOTFS', True)
 
 	if None in (pkg,pkgfn,rootfs):
 		bb.error("missing variables (one or more of PKG, PKGFN, IMAGEROOTFS)")
@@ -35,24 +35,24 @@ python package_tar_install () {
 }
 
 python do_package_tar () {
-	workdir = d.getVar('WORKDIR', 1)
+	workdir = d.getVar('WORKDIR', True)
 	if not workdir:
 		bb.error("WORKDIR not defined, unable to package")
 		return
 
-	outdir = d.getVar('DEPLOY_DIR_TAR', 1)
+	outdir = d.getVar('DEPLOY_DIR_TAR', True)
 	if not outdir:
 		bb.error("DEPLOY_DIR_TAR not defined, unable to package")
 		return
 	bb.mkdirhier(outdir)
 
-	dvar = d.getVar('D', 1)
+	dvar = d.getVar('D', True)
 	if not dvar:
 		bb.error("D not defined, unable to package")
 		return
 	bb.mkdirhier(dvar)
 
-	packages = d.getVar('PACKAGES', 1)
+	packages = d.getVar('PACKAGES', True)
 	if not packages:
 		bb.debug(1, "PACKAGES not defined, nothing to package")
 		return
@@ -79,11 +79,11 @@ python do_package_tar () {
 		pkgoutdir = outdir
 		bb.mkdirhier(pkgoutdir)
 		bb.build.exec_func('package_tar_fn', localdata)
-		tarfn = localdata.getVar('PKGFN', 1)
+		tarfn = localdata.getVar('PKGFN', True)
 		os.chdir(root)
 		from glob import glob
 		if not glob('*'):
-			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', 1), localdata.getVar('PKGR', 1)))
+			bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
 			continue
 		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
 		if ret != 0:
diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 9c7aede..60f1ade 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -1,12 +1,12 @@
 python read_subpackage_metadata () {
 	import oe.packagedata
 
-	data = oe.packagedata.read_pkgdata(d.getVar('PN', 1), d)
+	data = oe.packagedata.read_pkgdata(d.getVar('PN', True), d)
 
 	for key in data.keys():
 		d.setVar(key, data[key])
 
-	for pkg in d.getVar('PACKAGES', 1).split():
+	for pkg in d.getVar('PACKAGES', True).split():
 		sdata = oe.packagedata.read_subpkgdata(pkg, d)
 		for key in sdata.keys():
 			d.setVar(key, sdata[key])
diff --git a/meta/classes/pkg_distribute.bbclass b/meta/classes/pkg_distribute.bbclass
index 52643a2..9f249a0 100644
--- a/meta/classes/pkg_distribute.bbclass
+++ b/meta/classes/pkg_distribute.bbclass
@@ -1,6 +1,6 @@
 PKG_DISTRIBUTECOMMAND[func] = "1"
 python do_distribute_packages () {
-	cmd = d.getVar('PKG_DISTRIBUTECOMMAND', 1)
+	cmd = d.getVar('PKG_DISTRIBUTECOMMAND', True)
 	if not cmd:
 		raise bb.build.FuncFailed("Unable to distribute packages, PKG_DISTRIBUTECOMMAND not defined")
 	bb.build.exec_func('PKG_DISTRIBUTECOMMAND', d)
diff --git a/meta/classes/pkg_metainfo.bbclass b/meta/classes/pkg_metainfo.bbclass
index 1714a53..4b18269 100644
--- a/meta/classes/pkg_metainfo.bbclass
+++ b/meta/classes/pkg_metainfo.bbclass
@@ -1,5 +1,5 @@
 python do_pkg_write_metainfo () {
-	deploydir = d.getVar('DEPLOY_DIR', 1)
+	deploydir = d.getVar('DEPLOY_DIR', True)
 	if not deploydir:
 		bb.error("DEPLOY_DIR not defined, unable to write package info")
 		return
@@ -9,11 +9,11 @@ python do_pkg_write_metainfo () {
 	except OSError:
 		raise bb.build.FuncFailed("unable to open package-info file for writing.")
 	
-	name = d.getVar('PN', 1)
-	version = d.getVar('PV', 1)
-	desc = d.getVar('DESCRIPTION', 1)
-	page = d.getVar('HOMEPAGE', 1)
-	lic = d.getVar('LICENSE', 1)
+	name = d.getVar('PN', True)
+	version = d.getVar('PV', True)
+	desc = d.getVar('DESCRIPTION', True)
+	page = d.getVar('HOMEPAGE', True)
+	lic = d.getVar('LICENSE', True)
 	
 	infofile.write("|| "+ name +" || "+ version + " || "+ desc +" || "+ page +" || "+ lic + " ||\n" ) 
 	infofile.close()
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index fe3d849..920c89a 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -2,8 +2,8 @@ do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_popul
 do_populate_sdk[recrdeptask] += "do_package_write_deb"
 
 
-DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', 1), "i386"]\
-                [d.getVar('SDK_ARCH', 1) in \
+DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
+                [d.getVar('SDK_ARCH', True) in \
                 ["x86", "i486", "i586", "i686", "pentium"]]}"
 
 populate_sdk_post_deb () {
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 1bdd209..22ebcfd 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -6,7 +6,7 @@
 def qemu_target_binary(data):
 	import bb
 
-	target_arch = data.getVar("TARGET_ARCH", 1)
+	target_arch = data.getVar("TARGET_ARCH", True)
 	if target_arch in ("i486", "i586", "i686"):
 		target_arch = "i386"
 	elif target_arch == "powerpc":
diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index f3d5caa..05c24ef 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_prepend = "${@["qt4-embedded ", ""][(d.getVar('PN', 1)[:12] == 'qt4-embedded')]}"
+DEPENDS_prepend = "${@["qt4-embedded ", ""][(d.getVar('PN', True)[:12] == 'qt4-embedded')]}"
 
 inherit qmake2
 
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index bb60ffa..b324659 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -1,5 +1,5 @@
 def __note(msg, d):
-    bb.note("%s: recipe_sanity: %s" % (d.getVar("P", 1), msg))
+    bb.note("%s: recipe_sanity: %s" % (d.getVar("P", True), msg))
 
 __recipe_sanity_badruntimevars = "RDEPENDS RPROVIDES RRECOMMENDS RCONFLICTS"
 def bad_runtime_vars(cfgdata, d):
@@ -7,7 +7,7 @@ def bad_runtime_vars(cfgdata, d):
        bb.data.inherits_class("cross", d):
         return
 
-    for var in d.getVar("__recipe_sanity_badruntimevars", 1).split():
+    for var in d.getVar("__recipe_sanity_badruntimevars", True).split():
         val = d.getVar(var, 0)
         if val and val != cfgdata.get(var):
             __note("%s should be %s_${PN}" % (var, var), d)
@@ -15,17 +15,17 @@ def bad_runtime_vars(cfgdata, d):
 __recipe_sanity_reqvars = "DESCRIPTION"
 __recipe_sanity_reqdiffvars = "LICENSE"
 def req_vars(cfgdata, d):
-    for var in d.getVar("__recipe_sanity_reqvars", 1).split():
+    for var in d.getVar("__recipe_sanity_reqvars", True).split():
         if not d.getVar(var, 0):
             __note("%s should be set" % var, d)
 
-    for var in d.getVar("__recipe_sanity_reqdiffvars", 1).split():
+    for var in d.getVar("__recipe_sanity_reqdiffvars", True).split():
         val = d.getVar(var, 0)
         cfgval = cfgdata.get(var)
 
         # Hardcoding is bad, but I'm lazy.  We don't care about license being
         # unset if the recipe has no sources!
-        if var == "LICENSE" and d.getVar("SRC_URI", 1) == cfgdata.get("SRC_URI"):
+        if var == "LICENSE" and d.getVar("SRC_URI", True) == cfgdata.get("SRC_URI"):
             continue
 
         if not val:
@@ -43,11 +43,11 @@ def var_renames_overwrite(cfgdata, d):
 def incorrect_nonempty_PACKAGES(cfgdata, d):
     if bb.data.inherits_class("native", d) or \
        bb.data.inherits_class("cross", d):
-        if d.getVar("PACKAGES", 1):
+        if d.getVar("PACKAGES", True):
             return True
 
 def can_use_autotools_base(cfgdata, d):
-    cfg = d.getVar("do_configure", 1)
+    cfg = d.getVar("do_configure", True)
     if not bb.data.inherits_class("autotools", d):
         return False
 
@@ -65,10 +65,10 @@ def can_use_autotools_base(cfgdata, d):
 
 def can_remove_FILESPATH(cfgdata, d):
     expected = cfgdata.get("FILESPATH")
-    #expected = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}:${FILESDIR}"
+    #expected = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', True).split(':') for p in d.getVar('FILESPATHPKG', True).split(':') for o in (d.getVar('OVERRIDES', True) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}:${FILESDIR}"
     expectedpaths = bb.data.expand(expected, d)
     unexpanded = d.getVar("FILESPATH", 0)
-    filespath = d.getVar("FILESPATH", 1).split(":")
+    filespath = d.getVar("FILESPATH", True).split(":")
     filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
     for fp in filespath:
         if not fp in expectedpaths:
@@ -79,13 +79,13 @@ def can_remove_FILESPATH(cfgdata, d):
 
 def can_remove_FILESDIR(cfgdata, d):
     expected = cfgdata.get("FILESDIR")
-    #expected = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
+    #expected = "${@bb.which(d.getVar('FILESPATH', True), '.')}"
     unexpanded = d.getVar("FILESDIR", 0)
     if unexpanded is None:
         return False
 
-    expanded = os.path.normpath(d.getVar("FILESDIR", 1))
-    filespath = d.getVar("FILESPATH", 1).split(":")
+    expanded = os.path.normpath(d.getVar("FILESDIR", True))
+    filespath = d.getVar("FILESPATH", True).split(":")
     filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
 
     return unexpanded != expected and \
@@ -103,7 +103,7 @@ def can_remove_others(p, cfgdata, d):
             continue
 
         try:
-            expanded = d.getVar(k, 1)
+            expanded = d.getVar(k, True)
             cfgexpanded = bb.data.expand(cfgunexpanded, d)
         except bb.fetch.ParameterError:
             continue
@@ -115,8 +115,8 @@ def can_remove_others(p, cfgdata, d):
                        (p, cfgunexpanded, unexpanded, expanded))
 
 python do_recipe_sanity () {
-    p = d.getVar("P", 1)
-    p = "%s %s %s" % (d.getVar("PN", 1), d.getVar("PV", 1), d.getVar("PR", 1))
+    p = d.getVar("P", True)
+    p = "%s %s %s" % (d.getVar("PN", True), d.getVar("PV", True), d.getVar("PR", True))
 
     sanitychecks = [
         (can_remove_FILESDIR, "candidate for removal of FILESDIR"),
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index 880dcad..ccbe5b9 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -2,7 +2,7 @@ python siteconfig_do_siteconfig () {
 	shared_state = sstate_state_fromvars(d)
 	if shared_state['name'] != 'populate-sysroot':
 		return
-	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME', 1), 'site_config')):
+	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME', True), 'site_config')):
 		bb.debug(1, "No site_config directory, skipping do_siteconfig")
 		return
 	bb.build.exec_func('do_siteconfig_gencache', d)
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index bf6af2b..8c256ce 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -130,7 +130,7 @@ def siteinfo_get_files(d, no_cache = False):
     if no_cache: return sitefiles
 
     # Now check for siteconfig cache files
-    path_siteconfig = d.getVar('SITECONFIG_SYSROOTCACHE', 1)
+    path_siteconfig = d.getVar('SITECONFIG_SYSROOTCACHE', True)
     if os.path.isdir(path_siteconfig):
         for i in os.listdir(path_siteconfig):
             filename = os.path.join(path_siteconfig, i)
diff --git a/meta/classes/sourcepkg.bbclass b/meta/classes/sourcepkg.bbclass
index 38edfe4..2a78a90 100644
--- a/meta/classes/sourcepkg.bbclass
+++ b/meta/classes/sourcepkg.bbclass
@@ -6,7 +6,7 @@ DISTRO ?= "openembedded"
 
 def get_src_tree(d):
 
-	workdir = d.getVar('WORKDIR', 1)
+	workdir = d.getVar('WORKDIR', True)
 	if not workdir:
 		bb.error("WORKDIR not defined, unable to find source tree.")
 		return
@@ -55,8 +55,8 @@ sourcepkg_do_archive_bb() {
 
 python sourcepkg_do_dumpdata() {
 
-	workdir = d.getVar('WORKDIR', 1)
-	distro = d.getVar('DISTRO', 1)
+	workdir = d.getVar('WORKDIR', True)
+	distro = d.getVar('DISTRO', True)
 	s_tree = get_src_tree(d)
 	openembeddeddir = os.path.join(workdir, s_tree, distro)
 	dumpfile = os.path.join(openembeddeddir, bb.data.expand("${P}-${PR}.showdata.dump",d))
@@ -74,7 +74,7 @@ python sourcepkg_do_dumpdata() {
 	# emit the metadata which isnt valid shell
 	for e in d.keys():
 		if d.getVarFlag(e, 'python'):
-			f.write("\npython %s () {\n%s}\n" % (e, d.getVar(e, 1)))
+			f.write("\npython %s () {\n%s}\n" % (e, d.getVar(e, True)))
 	f.close()
 }
 
diff --git a/meta/classes/src_distribute.bbclass b/meta/classes/src_distribute.bbclass
index 651e492..efa2720 100644
--- a/meta/classes/src_distribute.bbclass
+++ b/meta/classes/src_distribute.bbclass
@@ -3,12 +3,12 @@ python do_distribute_sources () {
 	l = bb.data.createCopy(d)
 	bb.data.update_data(l)
 
-	sources_dir = d.getVar('SRC_DISTRIBUTEDIR', 1)
-	src_uri = d.getVar('SRC_URI', 1).split()
+	sources_dir = d.getVar('SRC_DISTRIBUTEDIR', True)
+	src_uri = d.getVar('SRC_URI', True).split()
 	fetcher = bb.fetch2.Fetch(src_uri, d)
 	ud = fetcher.ud
 
-	licenses = d.getVar('LICENSE', 1).replace('&', '|')
+	licenses = d.getVar('LICENSE', True).replace('&', '|')
 	licenses = licenses.replace('(', '').replace(')', '')
 	clean_licenses = ""
 	for x in licenses.split():
@@ -20,7 +20,7 @@ python do_distribute_sources () {
 
 	for license in clean_licenses.split('|'):
 		for url in ud.values():
-			cmd = d.getVar('SRC_DISTRIBUTECOMMAND', 1)
+			cmd = d.getVar('SRC_DISTRIBUTECOMMAND', True)
 			if not cmd:
 				raise bb.build.FuncFailed("Unable to distribute sources, SRC_DISTRIBUTECOMMAND not defined")
 			url.setup_localpath(d)
@@ -29,9 +29,9 @@ python do_distribute_sources () {
 				if url.basename == '*':
 					import os.path
 					dest_dir = os.path.basename(os.path.dirname(os.path.abspath(url.localpath)))
-					d.setVar('DEST', "%s_%s/" % (d.getVar('PF', 1), dest_dir))
+					d.setVar('DEST', "%s_%s/" % (d.getVar('PF', True), dest_dir))
 				else:
-					d.setVar('DEST', "%s_%s" % (d.getVar('PF', 1), url.basename))
+					d.setVar('DEST', "%s_%s" % (d.getVar('PF', True), url.basename))
 			else:
 				d.setVar('DEST', '')
 
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index ec93201..b194fa6 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -57,12 +57,12 @@ python build_syslinux_menu () {
 	import copy
 	import sys
 
-	workdir = d.getVar('WORKDIR', 1)
+	workdir = d.getVar('WORKDIR', True)
 	if not workdir:
 		bb.error("WORKDIR is not defined")
 		return
 		
-	labels = d.getVar('LABELS', 1)
+	labels = d.getVar('LABELS', True)
 	if not labels:
 		bb.debug(1, "LABELS not defined, nothing to do")
 		return
@@ -71,7 +71,7 @@ python build_syslinux_menu () {
 		bb.debug(1, "No labels, nothing to do")
 		return
 
-	cfile = d.getVar('SYSLINUXMENU', 1)
+	cfile = d.getVar('SYSLINUXMENU', True)
 	if not cfile:
 		raise bb.build.FuncFailed('Unable to read SYSLINUXMENU')
 
@@ -100,7 +100,7 @@ python build_syslinux_menu () {
 		localdata.setVar('OVERRIDES', label + ':' + overrides)
 		bb.data.update_data(localdata)
 
-		usage = localdata.getVar('USAGE', 1)
+		usage = localdata.getVar('USAGE', True)
 		cfgfile.write('  \x0F\x30\x3E%16s\x0F\x30\x37: ' % (label))
 		cfgfile.write('%s\n' % (usage))
 
@@ -114,12 +114,12 @@ python build_syslinux_cfg () {
 	import copy
 	import sys
 
-	workdir = d.getVar('WORKDIR', 1)
+	workdir = d.getVar('WORKDIR', True)
 	if not workdir:
 		bb.error("WORKDIR not defined, unable to package")
 		return
 		
-	labels = d.getVar('LABELS', 1)
+	labels = d.getVar('LABELS', True)
 	if not labels:
 		bb.debug(1, "LABELS not defined, nothing to do")
 		return
@@ -128,7 +128,7 @@ python build_syslinux_cfg () {
 		bb.debug(1, "No labels, nothing to do")
 		return
 
-	cfile = d.getVar('SYSLINUXCFG', 1)
+	cfile = d.getVar('SYSLINUXCFG', True)
 	if not cfile:
 		raise bb.build.FuncFailed('Unable to read SYSLINUXCFG')
 
@@ -139,7 +139,7 @@ python build_syslinux_cfg () {
 
 	cfgfile.write('# Automatically created by OE\n')
 
-	opts = d.getVar('SYSLINUX_OPTS', 1)
+	opts = d.getVar('SYSLINUX_OPTS', True)
 
 	if opts:
 		for opt in opts.split(';'):
@@ -148,26 +148,26 @@ python build_syslinux_cfg () {
 	cfgfile.write('ALLOWOPTIONS 1\n');
 	cfgfile.write('DEFAULT %s\n' % (labels.split()[0]))
 
-	timeout = d.getVar('SYSLINUX_TIMEOUT', 1)
+	timeout = d.getVar('SYSLINUX_TIMEOUT', True)
 
 	if timeout:
 		cfgfile.write('TIMEOUT %s\n' % timeout)
 	else:
 		cfgfile.write('TIMEOUT 50\n')
 
-	prompt = d.getVar('SYSLINUX_PROMPT', 1)
+	prompt = d.getVar('SYSLINUX_PROMPT', True)
 	if prompt:
 		cfgfile.write('PROMPT %s\n' % prompt)
 	else:
 		cfgfile.write('PROMPT 1\n')
 
-	menu = d.getVar('AUTO_SYSLINUXMENU', 1)
+	menu = d.getVar('AUTO_SYSLINUXMENU', True)
 
 	# This is ugly.  My bad.
 
 	if menu:
 		bb.build.exec_func('build_syslinux_menu', d)
-		mfile = d.getVar('SYSLINUXMENU', 1)
+		mfile = d.getVar('SYSLINUXMENU', True)
 		cfgfile.write('DISPLAY %s\n' % (mfile.split('/')[-1]) )
 	
 	for label in labels.split():
@@ -182,8 +182,8 @@ python build_syslinux_cfg () {
 	
 		cfgfile.write('LABEL %s\nKERNEL /vmlinuz\n' % (label))
 
-		append = localdata.getVar('APPEND', 1)
-		initrd = localdata.getVar('INITRD', 1)
+		append = localdata.getVar('APPEND', True)
+		initrd = localdata.getVar('INITRD', True)
 
 		if append:
 			cfgfile.write('APPEND ')
diff --git a/meta/classes/task.bbclass b/meta/classes/task.bbclass
index 7891207..22c2fd3 100644
--- a/meta/classes/task.bbclass
+++ b/meta/classes/task.bbclass
@@ -17,7 +17,7 @@ PACKAGE_ARCH = "all"
 # to the list. Their dependencies (RRECOMMENDS) are handled as usual
 # by package_depchains in a following step.
 python () {
-    packages = d.getVar('PACKAGES', 1).split()
+    packages = d.getVar('PACKAGES', True).split()
     genpackages = []
     for pkg in packages:
         for postfix in ['-dbg', '-dev']:
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 0e8e58b..ae58344 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -94,22 +94,22 @@ python __anonymous() {
 }
 
 python populate_packages_prepend () {
-	pkg = d.getVar('PN', 1)
+	pkg = d.getVar('PN', True)
 	bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
-	postinst = d.getVar('pkg_postinst_%s' % pkg, 1) or d.getVar('pkg_postinst', 1)
+	postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
 	if not postinst:
 		postinst = '#!/bin/sh\n'
 	if d.getVar('ALTERNATIVE_LINKS') != None:
-		postinst += d.getVar('update_alternatives_batch_postinst', 1)
+		postinst += d.getVar('update_alternatives_batch_postinst', True)
 	else:
-		postinst += d.getVar('update_alternatives_postinst', 1)
+		postinst += d.getVar('update_alternatives_postinst', True)
 	d.setVar('pkg_postinst_%s' % pkg, postinst)
-	postrm = d.getVar('pkg_postrm_%s' % pkg, 1) or d.getVar('pkg_postrm', 1)
+	postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
 	if not postrm:
 		postrm = '#!/bin/sh\n'
 	if d.getVar('ALTERNATIVE_LINKS') != None:
-		postrm += d.getVar('update_alternatives_batch_postrm', 1)
+		postrm += d.getVar('update_alternatives_batch_postrm', True)
 	else:
-		postrm += d.getVar('update_alternatives_postrm', 1)
+		postrm += d.getVar('update_alternatives_postrm', True)
 	d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index db88a8e..bddead4 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -47,7 +47,7 @@ python populate_packages_prepend () {
 	def update_rcd_package(pkg):
 		bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' % pkg)
 		localdata = bb.data.createCopy(d)
-		overrides = localdata.getVar("OVERRIDES", 1)
+		overrides = localdata.getVar("OVERRIDES", True)
 		localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
 		bb.data.update_data(localdata)
 
@@ -56,28 +56,28 @@ python populate_packages_prepend () {
 		execute on the target. Not doing so may cause update_rc.d postinst invoked
 		twice to cause unwanted warnings.
 		""" 
-		postinst = localdata.getVar('pkg_postinst', 1)
+		postinst = localdata.getVar('pkg_postinst', True)
 		if not postinst:
 			postinst = '#!/bin/sh\n'
-		postinst += localdata.getVar('updatercd_postinst', 1)
+		postinst += localdata.getVar('updatercd_postinst', True)
 		d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-		prerm = localdata.getVar('pkg_prerm', 1)
+		prerm = localdata.getVar('pkg_prerm', True)
 		if not prerm:
 			prerm = '#!/bin/sh\n'
-		prerm += localdata.getVar('updatercd_prerm', 1)
+		prerm += localdata.getVar('updatercd_prerm', True)
 		d.setVar('pkg_prerm_%s' % pkg, prerm)
 
-	        postrm = localdata.getVar('pkg_postrm', 1)
+	        postrm = localdata.getVar('pkg_postrm', True)
 	        if not postrm:
 	                postrm = '#!/bin/sh\n'
-                postrm += localdata.getVar('updatercd_postrm', 1)
+                postrm += localdata.getVar('updatercd_postrm', True)
 		d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-	pkgs = d.getVar('INITSCRIPT_PACKAGES', 1)
+	pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
 	if pkgs == None:
-		pkgs = d.getVar('UPDATERCPN', 1)
-		packages = (d.getVar('PACKAGES', 1) or "").split()
+		pkgs = d.getVar('UPDATERCPN', True)
+		packages = (d.getVar('PACKAGES', True) or "").split()
 		if not pkgs in packages and packages != []:
 			pkgs = packages[0]
 	for pkg in pkgs.split():
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 009ef1f..bbdf6e1 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -24,7 +24,7 @@ python do_clean() {
 	bb.note("Removing " + dir)
 	oe.path.remove(dir)
 
-	for f in (d.getVar('CLEANFUNCS', 1) or '').split():
+	for f in (d.getVar('CLEANFUNCS', True) or '').split():
 		bb.build.exec_func(f, d)
 }
 
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 103fa9a..3b59463 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -336,7 +336,7 @@ def base_set_filespath(path, d):
 	if extrapaths != "":
 		path = extrapaths.split(":") + path
 	# The ":" ensures we have an 'empty' override
-	overrides = (d.getVar("OVERRIDES", 1) or "") + ":"
+	overrides = (d.getVar("OVERRIDES", True) or "") + ":"
 	for p in path:
 		if p != "": 
 			for o in overrides.split(":"):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 18879c8..c8d9a31 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -102,7 +102,7 @@ ABIEXTENSION ??= ""
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
 TARGET_VENDOR = "-oe"
-TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS', 1), ''][d.getVar('TARGET_OS', 1) == ('' or 'custom')]}"
+TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS', True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = "${TUNE_CCARGS}"
 TARGET_LD_ARCH = "${TUNE_LDARGS}"
@@ -111,7 +111,7 @@ TARGET_AS_ARCH = "${TUNE_ASARGS}"
 SDK_ARCH = "${BUILD_ARCH}"
 SDK_OS = "${BUILD_OS}"
 SDK_VENDOR = "-oesdk"
-SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', 1), ''][d.getVar('SDK_OS', 1) == ('' or 'custom')]}"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', True), ''][d.getVar('SDK_OS', True) == ('' or 'custom')]}"
 SDK_PREFIX = "${SDK_SYS}-"
 SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}-nativesdk"
@@ -119,7 +119,7 @@ SDK_LD_ARCH = "${BUILD_LD_ARCH}"
 SDK_AS_ARCH = "${BUILD_AS_ARCH}"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
-MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH', 1), d.getVar('MACHINE', 1)][bool(d.getVar('MACHINE', 1))].replace('-', '_')}"
+MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH', True), d.getVar('MACHINE', True)][bool(d.getVar('MACHINE', True))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE_ARCH shouldn't be included here as a variable dependency
@@ -300,14 +300,14 @@ FILES_${PN}-locale = "${datadir}/locale"
 FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE'))}"
 # FILESPATH is set in base.bbclass
 #FILESPATH = "${FILE_DIRNAME}/${PF}:${FILE_DIRNAME}/${P}:${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/${BP}:${FILE_DIRNAME}/${BPN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"
-FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
+FILESDIR = "${@bb.which(d.getVar('FILESPATH', True), '.')}"
 
 ##################################################################
 # General work and output directories for the build system.
 ##################################################################
 
 TMPDIR ?= "${TOPDIR}/tmp"
-CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE', 1))][bool(d.getVar('MACHINE', 1))]}${@['', '/' + str(d.getVar('SDKMACHINE', 1))][bool(d.getVar('SDKMACHINE', 1))]}"
+CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE', True))][bool(d.getVar('MACHINE', True))]}${@['', '/' + str(d.getVar('SDKMACHINE', True))][bool(d.getVar('SDKMACHINE', True))]}"
 # The persistent cache should be shared by all builds
 PERSISTENT_DIR = "${TMPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
@@ -408,7 +408,7 @@ export PATH
 # Build utility info.
 ##################################################################
 
-CCACHE = "${@bb.which(d.getVar('PATH', 1), 'ccache') and 'ccache '}"
+CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 064c1e0..be28510 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -13,7 +13,7 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
 TCLIBCAPPEND ?= "-${TCLIBC}"
 TMPDIR .= "${TCLIBCAPPEND}"
 
-CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE', 1))][bool(d.getVar('MACHINE', 1))]}${@['', '/' + str(d.getVar('SDKMACHINE', 1))][bool(d.getVar('SDKMACHINE', 1))]}"
+CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE', True))][bool(d.getVar('MACHINE', True))]}${@['', '/' + str(d.getVar('SDKMACHINE', True))][bool(d.getVar('SDKMACHINE', True))]}"
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index b7d6061..d094529 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -5,7 +5,7 @@
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
+ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
index 214e3b6..a2392c2 100644
--- a/meta/conf/machine/include/tune-thumb.inc
+++ b/meta/conf/machine/include/tune-thumb.inc
@@ -16,15 +16,15 @@ THUMB_INTERWORK ?= "yes"
 #    arm system and vice versa.  It is strongly recommended that DISTROs not
 #    turn this off - the actual cost is very small.
 
-OVERRIDE_THUMB = "${@['', ':thumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][d.getVar('THUMB_INTERWORK', 1) == 'yes']}"
+OVERRIDE_THUMB = "${@['', ':thumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
+OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][d.getVar('THUMB_INTERWORK', True) == 'yes']}"
 OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
 
 #    Compiler and linker options for application code and kernel code.  These
 #    options ensure that the compiler has the correct settings for the selected
 #    instruction set and interworking.
-ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][d.getVar('THUMB_INTERWORK', 1) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
+ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][d.getVar('THUMB_INTERWORK', True) == 'yes']}"
+ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
 
 #
 TUNE_CCARGS +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index a5b31b8..17b7e1f 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -220,7 +220,7 @@ class GitApplyTree(PatchTree):
 
 class QuiltTree(PatchSet):
     def _runcmd(self, args, run = True):
-        quiltrc = self.d.getVar('QUILTRCFILE', 1)
+        quiltrc = self.d.getVar('QUILTRCFILE', True)
         if not run:
             return ["quilt"] + ["--quiltrc"] + [quiltrc] + args
         runcmd(["quilt"] + ["--quiltrc"] + [quiltrc] + args, self.dir)
@@ -398,7 +398,7 @@ class UserResolver(Resolver):
             # Patch application failed
             patchcmd = self.patchset.Push(True, False, False)
 
-            t = self.patchset.d.getVar('T', 1)
+            t = self.patchset.d.getVar('T', True)
             if not t:
                 bb.msg.fatal("Build", "T not set")
             bb.utils.mkdirhier(t)
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 8eaa3c5..683b097 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -42,7 +42,7 @@ def relative(src, dest):
 
 def format_display(path, metadata):
     """ Prepare a path for display to the user. """
-    rel = relative(metadata.getVar("TOPDIR", 1), path)
+    rel = relative(metadata.getVar("TOPDIR", True), path)
     if len(rel) > len(path):
         return path
     else:
diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index 6ec66e3..af489fe 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -23,7 +23,7 @@ inherit autotools
 
 python __anonymous () {
     import re
-    host = d.getVar('HOST_SYS', 1)
+    host = d.getVar('HOST_SYS', True)
     if not re.match('i.86.*-linux', host):
         raise bb.parse.SkipPackage("incompatible with host %s" % host)
 }
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index d898717..9e45fc1 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -8,10 +8,10 @@
 
 python __anonymous () {
     import bb, re
-    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS', 1)) != None)
+    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS', True)) != None)
     if uc_os:
         raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', 1))
+                                   d.getVar('TARGET_OS', True))
 }
 
 # Set this to zero if you don't want ldconfig in the output package
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 8555985..e718a1f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -52,10 +52,10 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIR
 
 python __anonymous () {
     import bb, re
-    uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', 1)) != None)
+    uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None)
     if uc_os:
         raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', 1))
+                                   d.getVar('TARGET_OS', True))
 }
 
 export libc_cv_slibdir = "${base_libdir}"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 6d66342..b4c1ea5 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -55,10 +55,10 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIR
 
 python __anonymous () {
     import bb, re
-    uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', 1)) != None)
+    uc_os = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None)
     if uc_os:
         raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', 1))
+                                   d.getVar('TARGET_OS', True))
 }
 
 export libc_cv_slibdir = "${base_libdir}"
diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 0979acd..2eecbd3 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -33,7 +33,7 @@ export LDFLAGS += "-ldl"
 
 python populate_packages_prepend () {
 	# autonamer would call this libxml2-2, but we don't want that
-	if d.getVar('DEBIAN_NAMES', 1):
+	if d.getVar('DEBIAN_NAMES', True):
 		d.setVar('PKG_libxml2', '${MLPREFIX}libxml2')
 }
 
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 2032432..ddae7ae 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -126,8 +126,8 @@ python __anonymous () {
 
     import bb
 
-    distro_features = set(d.getVar("DISTRO_FEATURES", 1).split())
-    machine_features= set(d.getVar("MACHINE_FEATURES", 1).split())
+    distro_features = set(d.getVar("DISTRO_FEATURES", True).split())
+    machine_features= set(d.getVar("MACHINE_FEATURES", True).split())
 
     if "bluetooth" in distro_features and not "bluetooth" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
 	d.setVar("ADD_BT", "task-base-bluetooth")
diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
index d940e39..ec6cdcc 100644
--- a/meta/recipes-core/tasks/task-core-sdk.bb
+++ b/meta/recipes-core/tasks/task-core-sdk.bb
@@ -50,7 +50,7 @@ RDEPENDS_task-core-sdk = "\
 
 #python generate_sdk_pkgs () {
 #    poky_pkgs = read_pkgdata('task-core', d)['PACKAGES']
-#    pkgs = d.getVar('PACKAGES', 1).split()
+#    pkgs = d.getVar('PACKAGES', True).split()
 #    for pkg in poky_pkgs.split():
 #        newpkg = pkg.replace('task-core', 'task-core-sdk')
 #
diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 8bb0948..0e0c188 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -35,7 +35,7 @@ def map_uclibc_arch(a, d):
 	"""Return the uClibc architecture for the given TARGET_ARCH."""
 	import re
 
-	valid_archs = d.getVar('valid_archs', 1).split()
+	valid_archs = d.getVar('valid_archs', True).split()
 
 	if   re.match('^(arm|sa110).*', a):	return 'arm'
 	elif re.match('^(i.86|athlon)$', a):	return 'i386'
@@ -50,14 +50,14 @@ def map_uclibc_arch(a, d):
 	else:
 		bb.error("cannot map '%s' to a uClibc architecture" % a)
 
-export UCLIBC_ARCH = "${@map_uclibc_arch(d.getVar('TARGET_ARCH', 1), d)}"
+export UCLIBC_ARCH = "${@map_uclibc_arch(d.getVar('TARGET_ARCH', True), d)}"
 
 def map_uclibc_abi(o, d):
 	"""Return the uClibc ABI for the given TARGET_OS."""
 	import re
 
-	arch = d.getVar('TARGET_ARCH', 1)
-	if   map_uclibc_arch(d.getVar('TARGET_ARCH', 1), d) == "arm":
+	arch = d.getVar('TARGET_ARCH', True)
+	if   map_uclibc_arch(d.getVar('TARGET_ARCH', True), d) == "arm":
 		if re.match('.*eabi$', o): return 'ARM_EABI'
 		else:                    return 'ARM_OABI'
 	# FIXME: This is inaccurate! Handle o32, n32, n64
@@ -65,7 +65,7 @@ def map_uclibc_abi(o, d):
 	elif re.match('^mips.*', arch):    return 'MIPS_O32_ABI'
 	return ""
 
-export UCLIBC_ABI = "${@map_uclibc_abi(d.getVar('TARGET_OS', 1), d)}"
+export UCLIBC_ABI = "${@map_uclibc_abi(d.getVar('TARGET_OS', True), d)}"
 
 def map_uclibc_endian(a, d):
 	"""Return the uClibc endianess for the given TARGET_ARCH."""
@@ -79,7 +79,7 @@ def map_uclibc_endian(a, d):
 		return 'BIG'
 	return 'LITTLE'
 
-export UCLIBC_ENDIAN = "${@map_uclibc_endian(d.getVar('TARGET_ARCH', 1), d)}"
+export UCLIBC_ENDIAN = "${@map_uclibc_endian(d.getVar('TARGET_ARCH', True), d)}"
 
 # internal helper
 def uclibc_cfg(feature, features, tokens, cnf, rem):
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 5e9e2e9..69d8921 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -124,9 +124,9 @@ configmangle = '/^KERNEL_HEADERS/d; \
                 /^SHARED_LIB_LOADER_PREFIX/d; \
                 /^UCLIBC_EXTRA_CFLAGS/d; \
                 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
-                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][d.getVar("ARM_INSTRUCTION_SET", 1) != "arm"]} \
-                ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][d.getVar("USE_NLS", 1) == "yes"]} \
-                ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][d.getVar("TARGET_ARCH", 1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
+                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][d.getVar("ARM_INSTRUCTION_SET", True) != "arm"]} \
+                ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][d.getVar("USE_NLS", True) == "yes"]} \
+                ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][d.getVar("TARGET_ARCH", True) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
                 /^CROSS/d; \
                 /^TARGET_ARCH=/d; \
                 /^TARGET_/s,^\([^=]*\).*,# \1 is not set,g; \
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 4ca0223..4bf5105 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -20,7 +20,7 @@ python do_install_config () {
 
 	data = bb.data.expand(data, d)
 
-	outdir = os.path.join(d.getVar('D', 1), d.getVar('sysconfdir', 1), 'apt')
+	outdir = os.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
 	if not os.path.exists(outdir):
 		os.makedirs(outdir)
 	outpath = os.path.join(outdir, 'apt.conf.sample')
diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index d644b09..736672c 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -59,15 +59,15 @@ FILES_${PN} = "${bindir}/apt-cdrom ${bindir}/apt-get \
 	       ${localstatedir} ${sysconfdir} \
 	       ${libdir}/dpkg"
 FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
-FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', 1))} \
+FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-manpages', True))} \
 		   ${docdir}/apt"
-FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', 1))}"
+FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}"
 FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
 do_install () {
 	set -x
-	${@get_commands_apt_doc(d, bb, d.getVar('apt-manpages', 1))}
-	${@get_commands_apt_doc(d, bb, d.getVar('apt-utils-manpages', 1))}
+	${@get_commands_apt_doc(d, bb, d.getVar('apt-manpages', True))}
+	${@get_commands_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}
 	install -d ${D}${bindir}
 	install -m 0755 bin/apt-cdrom ${D}${bindir}/
 	install -m 0755 bin/apt-get ${D}${bindir}/
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index c259673..7eef9ec 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -9,6 +9,6 @@ SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
 
 inherit autotools
 
-export AUTOMAKE = "${@bb.which('automake', d.getVar('PATH', 1))}"
+export AUTOMAKE = "${@bb.which('automake', d.getVar('PATH', True))}"
 
 FILES_${PN} += "${datadir}/automake* ${datadir}/aclocal*"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
index 3e2a218..6145345 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
@@ -13,8 +13,8 @@ SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aac
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-    prefix=d.getVar("prefix", 1)
-    docdir=d.getVar("docdir", 1)
+    prefix=d.getVar("prefix", True)
+    docdir=d.getVar("docdir", True)
 
     if not docdir.startswith(prefix):
 	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index df6021a..bf6c239 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -10,14 +10,14 @@ inherit autotools gettext
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/gcc-${PV}"
 
 def get_gcc_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
         return "--with-float=soft"
-    if d.getVar('TARGET_FPU', 1) in [ 'ppc-efd' ]:
+    if d.getVar('TARGET_FPU', True) in [ 'ppc-efd' ]:
         return "--enable-e500_double"
     return ""
 
 def get_gcc_mips_plt_setting(bb, d):
-    if d.getVar('TARGET_ARCH', 1) in [ 'mips', 'mipsel' ] and 'mplt' in d.getVar('DISTRO_FEATURES',1).split() :
+    if d.getVar('TARGET_ARCH', True) in [ 'mips', 'mipsel' ] and 'mplt' in d.getVar('DISTRO_FEATURES',1).split() :
         return "--with-mips-plt"
     return ""
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 8ab799f..7a96e91 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -27,7 +27,7 @@ EXTRA_OECONF_INTERMEDIATE ?= ""
 
 GCCMULTILIB = "--disable-multilib"
 
-EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', 1) != 'no']} \
+EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
                 --with-gnu-ld \
                 --enable-shared \
                 --enable-languages=${LANGUAGES} \
diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.3.bb
index 538ff46..c27a8c0 100644
--- a/meta/recipes-devtools/guile/guile_2.0.3.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.3.bb
@@ -31,7 +31,7 @@ BBCLASSEXTEND = "native"
 
 DEPENDS = "libunistring bdwgc gmp libtool libffi"
 # add guile-native only to the target recipe's DEPENDS
-DEPENDS += "${@['guile-native', ''][d.getVar('PN', 1) != 'guile']}"
+DEPENDS += "${@['guile-native', ''][d.getVar('PN', True) != 'guile']}"
 
 EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix', ''][bb.data.inherits_class('native',d)]}"
 
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 6703b5c..f9a6cc9 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -287,7 +287,7 @@ FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
 # packages (actually the non modules packages and not created too)
 ALLOW_EMPTY_perl-modules = "1"
 PACKAGES_append = " perl-modules "
-RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', 1).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
+RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
 
 python populate_packages_prepend () {
         libdir = bb.data.expand('${libdir}/perl/${PV}', d)
diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
index eb80b54..4e619c5 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
+++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
@@ -70,7 +70,7 @@ do_configure_prepend () {
 python __anonymous () {
     import re
 
-    pn = d.getVar("PN", 1)
+    pn = d.getVar("PN", True)
     if not pn.endswith('-native') and not pn.endswith('-nativesdk'):
         raise bb.parse.SkipPackage("unfs-server is intended for native/nativesdk builds only")
 }
diff --git a/meta/recipes-extended/cups/cups14.inc b/meta/recipes-extended/cups/cups14.inc
index 8c01caf..2bf3ecf 100644
--- a/meta/recipes-extended/cups/cups14.inc
+++ b/meta/recipes-extended/cups/cups14.inc
@@ -58,7 +58,7 @@ fakeroot do_install () {
 
 python do_package_append() {
 	# Change permissions back the way they were, they probably had a reason...
-	workdir = d.getVar('WORKDIR', 1)
+	workdir = d.getVar('WORKDIR', True)
 	os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir)
 }
 
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
index 121babd..603b38f 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
@@ -58,7 +58,7 @@ PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
 PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
-	postinst_pixbufloader = d.getVar("postinst_pixbufloader", 1)
+	postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
 	loaders_root = bb.data.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders', d)
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
index c6077ec..e45768d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
@@ -34,8 +34,8 @@ PACKAGES_DYNAMIC += "gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 python populate_packages_prepend () {
 	import os.path
 
-	prologue = d.getVar("postinst_prologue", 1)
-	postinst_pixbufloader = d.getVar("postinst_pixbufloader", 1)
+	prologue = d.getVar("postinst_prologue", True)
+	postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
 	gtk_libdir = bb.data.expand('${libdir}/gtk-2.0/${LIBV}', d)
 	loaders_root = os.path.join(gtk_libdir, 'loaders')
@@ -46,6 +46,6 @@ python populate_packages_prepend () {
 	do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules')
 	do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
-        if (d.getVar('DEBIAN_NAMES', 1)):
+        if (d.getVar('DEBIAN_NAMES', True)):
                 d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
index 5fcb576..1e7a87f 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
@@ -34,8 +34,8 @@ PACKAGES_DYNAMIC += "gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 python populate_packages_prepend () {
 	import os.path
 
-	prologue = d.getVar("postinst_prologue", 1)
-	postinst_pixbufloader = d.getVar("postinst_pixbufloader", 1)
+	prologue = d.getVar("postinst_prologue", True)
+	postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
 
 	gtk_libdir = bb.data.expand('${libdir}/gtk-2.0/${LIBV}', d)
 	loaders_root = os.path.join(gtk_libdir, 'loaders')
@@ -46,6 +46,6 @@ python populate_packages_prepend () {
 	do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules')
 	do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
-        if (d.getVar('DEBIAN_NAMES', 1)):
+        if (d.getVar('DEBIAN_NAMES', True)):
                 d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index dab66c7..c27826c 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -41,7 +41,7 @@ PACKAGES_DYNAMIC += "gtk-immodule-* gtk-printbackend-*"
 python populate_packages_prepend () {
 	import os.path
 
-	prologue = d.getVar("postinst_prologue", 1)
+	prologue = d.getVar("postinst_prologue", True)
 
 	gtk_libdir = bb.data.expand('${libdir}/gtk-2.0/${LIBV}', d)
 	immodules_root = os.path.join(gtk_libdir, 'immodules')
@@ -50,6 +50,6 @@ python populate_packages_prepend () {
 	do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules')
 	do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
 
-        if (d.getVar('DEBIAN_NAMES', 1)):
+        if (d.getVar('DEBIAN_NAMES', True)):
                 d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
 }
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 233a6ee..3ca6e81 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -31,8 +31,8 @@ inherit gnome
 python populate_packages_prepend() {
 	import os.path
 
-	engines_root = os.path.join(d.getVar('libdir', 1), "gtk-2.0/2.10.0/engines")
-	themes_root = os.path.join(d.getVar('datadir', 1), "themes")
+	engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
+	themes_root = os.path.join(d.getVar('datadir', True), "themes")
 
 	do_split_packages(d, engines_root, '^lib(.*)\.so$', 'gtk-engine-%s', 'GTK %s theme engine', extra_depends='')
 	do_split_packages(d, themes_root, '(.*)', 'gtk-theme-%s', 'GTK theme %s', allow_dirs=True, extra_depends='')
diff --git a/meta/recipes-graphics/cairo/cairo-fpu.inc b/meta/recipes-graphics/cairo/cairo-fpu.inc
index 8c0ecfd..bf5a1b0 100644
--- a/meta/recipes-graphics/cairo/cairo-fpu.inc
+++ b/meta/recipes-graphics/cairo/cairo-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_cairo_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+	if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
 		return "--disable-some-floating-point"
 	return ""
 
diff --git a/meta/recipes-graphics/clutter/clutter-fpu.inc b/meta/recipes-graphics/clutter/clutter-fpu.inc
index dfa933d..7b5dc68 100644
--- a/meta/recipes-graphics/clutter/clutter-fpu.inc
+++ b/meta/recipes-graphics/clutter/clutter-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_clutter_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+	if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
 		return "--without-fpu"
 	return ""
 
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
index 0e21390..a2fd409 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
@@ -3,7 +3,7 @@ inherit native
 DEPENDS = "freetype-native expat-native zlib-native"
 
 EXTRA_OEMAKE = ""
-EXTRA_OECONF = "${@[' --disable-docs',' --disable-docs --with-freetype-config=%s/freetype-config' % d.getVar('STAGING_BINDIR', 1)][os.path.isfile('%s/freetype-config' % d.getVar('STAGING_BINDIR', 1))]}"
+EXTRA_OECONF = "${@[' --disable-docs',' --disable-docs --with-freetype-config=%s/freetype-config' % d.getVar('STAGING_BINDIR', True)][os.path.isfile('%s/freetype-config' % d.getVar('STAGING_BINDIR', True))]}"
 
 do_install_append () {
 	install -d ${D}${bindir}/
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 3687648..480672f 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -13,7 +13,7 @@ EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gal
 python populate_packages_prepend() {
 	import os.path
 
-	dri_drivers_root = os.path.join(d.getVar('libdir', 1), "dri")
+	dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
 
 	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
 }
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 516153c..8b36d04 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -50,7 +50,7 @@ fi
 }
 
 python populate_packages_prepend () {
-	prologue = d.getVar("postinst_prologue", 1)
+	prologue = d.getVar("postinst_prologue", True)
 
 	modules_root = bb.data.expand('${libdir}/pango/${LIBV}/modules', d)
 
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index 498700a..1166e57 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -26,7 +26,7 @@ XORG_PN = "libXft"
 BBCLASSEXTEND = "native"
 
 python () {
-        if d.getVar('DEBIAN_NAMES', 1):
+        if d.getVar('DEBIAN_NAMES', True):
             d.setVar('PKG_${PN}', '${MLPREFIX}libxft2')
 }
 
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7ec7584..2f0c918 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -5,11 +5,11 @@ KERNEL_DEVICETREE_FLAGS = "-R 8 -p 0x3000"
 python __anonymous () {
     import bb
 
-    devicetree = d.getVar("KERNEL_DEVICETREE", 1) or ''
+    devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
     if devicetree:
-	depends = d.getVar("DEPENDS", 1)
+	depends = d.getVar("DEPENDS", True)
 	d.setVar("DEPENDS", "%s dtc-native" % depends)
-	packages = d.getVar("PACKAGES", 1)
+	packages = d.getVar("PACKAGES", True)
 	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
 }
 
diff --git a/meta/recipes-multimedia/alsa/alsa-fpu.inc b/meta/recipes-multimedia/alsa/alsa-fpu.inc
index 2a0c6b0..5040230 100644
--- a/meta/recipes-multimedia/alsa/alsa-fpu.inc
+++ b/meta/recipes-multimedia/alsa/alsa-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_alsa_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+	if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
 		return "--with-softfloat"
 	return ""
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index a71d896..ccabe3c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -10,13 +10,13 @@ python populate_packages_prepend () {
 	do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
 	do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', bb.data.expand('${PN}-%s-staticdev', d), 'GStreamer plugin for %s (static development files)', extra_depends=bb.data.expand('${PN}-staticdev',d))
 	
-	pn = d.getVar('PN', 1)
+	pn = d.getVar('PN', True)
 	metapkg =  pn + '-meta'
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
 	blacklist = [ pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc' ]
 	metapkg_rdepends = []
-	packages = d.getVar('PACKAGES', 1).split()
+	packages = d.getVar('PACKAGES', True).split()
 	for pkg in packages[1:]:
 		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
 			metapkg_rdepends.append(pkg)
diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
index b3aa1e5..bae0340 100644
--- a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
+++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
@@ -9,7 +9,7 @@ QT_GRAPHICS_SYSTEM ?= "raster"
 VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
 
 def _get_extra_rdepends(d):
-    gs = d.getVar('QT_GRAPHICS_SYSTEM', 1)
+    gs = d.getVar('QT_GRAPHICS_SYSTEM', True)
     if gs == "opengl":
         return "qt4-plugin-graphicssystems-glgraphicssystem"
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 2956aed..4d71913 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -45,7 +45,7 @@ python __anonymous () {
     lib_packages = []
     dev_packages = []
     dbg_packages = []
-    for name in d.getVar("QT_LIB_NAMES", 1).split():
+    for name in d.getVar("QT_LIB_NAMES", True).split():
         pkg = d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt", "").replace("_", "-") + "4"
         # NOTE: the headers for QtAssistantClient are different
         incname = name.replace("QtAssistantClient", "QtAssistant")
@@ -61,10 +61,10 @@ python __anonymous () {
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
         dbg_packages.append("%s-dbg" % pkg)
-    for name in d.getVar("OTHER_PACKAGES", 1).split():
+    for name in d.getVar("OTHER_PACKAGES", True).split():
         dbg_packages.append("%s-dbg" % name)
 
-    for name in d.getVar("QT_EXTRA_LIBS", 1).split():
+    for name in d.getVar("QT_EXTRA_LIBS", True).split():
         pkg = d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt", "").replace("_", "-") + "4"
         d.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals())
         d.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arch.inc
index 46d65a2..bde68dc 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -4,7 +4,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 def qt_arch(d):
     import bb, re
-    arch = d.getVar('TARGET_ARCH', 1)
+    arch = d.getVar('TARGET_ARCH', True)
     if re.match("^i.86$", arch):
         arch = "i386"
     elif re.match("^arm.*", arch):
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index a23c4ac..c084c40 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -61,7 +61,7 @@ FILES_${PN}-extra = "/usr/games/ /usr/share/applications /etc/gconf/schemas"
 python __anonymous () {
     import bb
     var = bb.data.expand("FILES_${PN}", d, 1)
-    data = d.getVar(var, 1)
+    data = d.getVar(var, True)
     for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
         data = data + " /usr/games/%s" % name
         data = data + " /usr/share/applications/%s.desktop" % name
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 09f61c0..c15a04c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -51,11 +51,11 @@ python __anonymous () {
 
     packages = []
     extras = []
-    for lib in d.getVar('BOOST_LIBS', 1).split( ):
+    for lib in d.getVar('BOOST_LIBS', True).split( ):
             pkg = "boost-%s" % lib.replace("_", "-")
             extras.append("--with-%s" % lib)
             packages.append(pkg)
-            if not d.getVar("FILES_%s" % pkg, 1):
+            if not d.getVar("FILES_%s" % pkg, True):
                     d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
     d.setVar("BOOST_PACKAGES", " ".join(packages))
     d.setVar("BJAM_EXTRA", " ".join(extras))




