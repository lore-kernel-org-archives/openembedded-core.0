Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D503360FDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:35:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8DCnaKH024300 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:49:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y-vq6MTaiucB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:49:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8DCnT0D024296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:49:31 +0100
Message-ID: <1379075731.3484.264.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 13:35:31 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf/package: Collapse PKGDATA_DIR into a single machine specific directory
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
X-List-Received-Date: Fri, 13 Sep 2013 12:35:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently we have a hierarchy of pkgdata directories and the code has to put together
a search path and look through each in turn until it finds the data it needs.

This has lead to a number of hardcoded paths and file globing which
is unpredictable and undesirable. Worse, certain tricks that should be
easy like a GL specific package architecture become problematic with the
curretn search paths.

With the modern sstate code, we can do better and construct a single pkgdata
directory for each machine in just the same way as we do for the sysroot. This
is already tried and well tested. With such a single directory, all the code that
iterated through multiple pkgdata directories and simply be removed and give
a significant simplification of the code. Even existing build directories adapt
to the change well since the package contents doesn't change, just the location
they're installed to and the stamp for them.

The only complication is the we need a different shlibs directory for each
multilib. These are only used by package.bbclass and the simple fix is to
add MLPREFIX to the shlib directory name. This means the multilib packages will
repackage and the sstate checksum will change but an existing build directory
will adapt to the changes safely.

It is close to release however I believe the benefits this patch give us
are worth consideration for inclusion and give us more options for dealing
with problems like the GL one. It also sets the ground work well for
shlibs improvements in 1.6.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 8669470..5e13a5b 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -2,6 +2,10 @@
 # This class is used for architecture independent recipes/data files (usally scripts)
 #
 
+# Expand STAGING_DIR_HOST since for cross-canadian/native/nativesdk, this will
+# point elsewhere after these changes.
+STAGING_DIR_HOST := "${STAGING_DIR_HOST}"
+
 PACKAGE_ARCH = "all"
 
 python () {
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 080f2c7..3da03c8 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -340,7 +340,7 @@ buildhistory_get_installed() {
 	cat $pkgcache | while read pkg pkgfile pkgarch
 	do
 		for vendor in ${TARGET_VENDOR} ${MULTILIB_VENDORS} ; do
-			size=`oe-pkgdata-util read-value ${TMPDIR}/pkgdata $vendor-${TARGET_OS} "PKGSIZE" ${pkg}_${pkgarch}`
+			size=`oe-pkgdata-util read-value ${PKGDATA_DIR} "PKGSIZE" ${pkg}_${pkgarch}`
 			if [ "$size" != "" ] ; then
 				echo "$size $pkg" >> $1/installed-package-sizes.tmp
 			fi
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 87dd994..c22be1a 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -31,7 +31,6 @@ STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR}/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}"
 
 PATH_append = ":${TMPDIR}/sysroots/${HOST_ARCH}/${bindir_cross}"
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}"
 PKGHIST_DIR = "${TMPDIR}/pkghistory/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/"
 
 HOST_ARCH = "${SDK_ARCH}"
@@ -89,10 +88,6 @@ FILES_${PN}-dbg += "${prefix}/.debug \
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${layout_libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
-# Cross-canadian packages need to pull in nativesdk dynamic libs
-SHLIBSDIRS = "${TMPDIR}/pkgdata/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/shlibs/ ${TMPDIR}/pkgdata/all-${HOST_VENDOR}-${HOST_OS}/shlibs/"
-SHLIBSDIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/shlibs/"
-
 do_populate_sysroot[stamp-extra-info] = ""
 
 USE_NLS = "${SDKUSE_NLS}"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f1e62f14..889547a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -484,7 +484,7 @@ rootfs_install_complementary() {
         # Use the magic script to do all the work for us :)
         : > ${WORKDIR}/complementary_pkgs.txt
         for vendor in '${TARGET_VENDOR}' ${MULTILIB_VENDORS} ; do
-            oe-pkgdata-util glob ${TMPDIR}/pkgdata $vendor-${TARGET_OS} ${WORKDIR}/installed_pkgs.txt "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
+            oe-pkgdata-util glob ${PKGDATA_DIR} ${WORKDIR}/installed_pkgs.txt "$GLOBS" >> ${WORKDIR}/complementary_pkgs.txt
         done
 
         # Install the packages, if any
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 621c1b2..0160313 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -28,8 +28,7 @@ license_create_manifest() {
 	fi
 	touch ${LICENSE_MANIFEST}
 	for pkg in ${INSTALLED_PKGS}; do
-		# not the best way to do this but licenses are not arch dependant iirc
-		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
+		filename=`ls ${PKGDATA_DIR}/runtime-reverse/${pkg}| head -1`
 		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
 
 		# check to see if the package name exists in the manifest. if so, bail.
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index dac160e..9503096 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -47,7 +47,6 @@ python multilib_virtclass_handler () {
 
     e.data.setVar("MLPREFIX", variant + "-")
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
-    e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 
     # Expand the WHITELISTs with multilib prefix
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 599df24..fbb6839 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1304,17 +1304,8 @@ python package_do_filedeps() {
         d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files[pkg]))
 }
 
-def getshlibsdirs(d):
-    dirs = []
-    triplets = (d.getVar("PKGTRIPLETS") or "").split()
-    for t in triplets:
-        dirs.append("${TMPDIR}/pkgdata/" + t + "/shlibs/")
-    return " ".join(dirs)
-getshlibsdirs[vardepsexclude] = "PKGTRIPLETS"
-
-SHLIBSDIRS = "${@getshlibsdirs(d)}"
-SHLIBSDIR = "${TMPDIR}/pkgdata/${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/shlibs"
-SHLIBSWORKDIR = "${PKGDESTWORK}/shlibs"
+SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs"
+SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs"
 
 python package_do_shlibs() {
     import re, pipes
@@ -1953,6 +1944,7 @@ do_packagedata[sstate-name] = "packagedata"
 do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
 do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
 do_packagedata[sstate-lockfile-shared] = "${PACKAGELOCK}"
+do_packagedata[stamp-extra-info] = "${MACHINE}"
 
 python do_packagedata_setscene () {
     sstate_setscene(d)
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2a7e164..fd861e9 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -109,7 +109,7 @@ translate_smart_to_oe() {
 					fi
 					# Workaround for bug 3565
 					# Simply look to see if we know of a package with that name, if not try again!
-					filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/$new_pkg 2>/dev/null | head -n 1`
+					filename=`ls ${PKGDATA_DIR}/runtime-reverse/$new_pkg 2>/dev/null | head -n 1`
 					if [ -n "$filename" ] ; then
 						found=1
 						break
diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
index 42fcd04..7d60ace 100644
--- a/meta/classes/packageinfo.bbclass
+++ b/meta/classes/packageinfo.bbclass
@@ -1,27 +1,20 @@
 python packageinfo_handler () {
     import oe.packagedata
     pkginfolist = []
-    tmpdir = e.data.getVar('TMPDIR', True)
-    target_vendor = e.data.getVar('TARGET_VENDOR', True)
-    target_os = e.data.getVar('TARGET_OS', True)
-    package_archs = e.data.getVar('PACKAGE_ARCHS', True)
-    packaging = e.data.getVar('PACKAGE_CLASSES', True).split()[0].split('_')[1]
-    deploy_dir = e.data.getVar('DEPLOY_DIR', True) + '/' + packaging
-                                       
-    for arch in package_archs.split():
-        pkgdata_dir = tmpdir + '/pkgdata/' + arch + target_vendor + '-' + target_os + '/runtime/'
-        if os.path.exists(pkgdata_dir):
-            for root, dirs, files in os.walk(pkgdata_dir):
-                for pkgname in files:
-                    if pkgname.endswith('.packaged'):
-                        pkgname = pkgname[:-9]
-                        pkgdatafile = root + pkgname
-                        try:
-                            sdata = oe.packagedata.read_pkgdatafile(pkgdatafile)
-                            sdata['PKG'] = pkgname
-                            pkginfolist.append(sdata)
-                        except Exception as e:
-                            bb.warn("Failed to read pkgdata file %s: %s: %s" % (pkgdatafile, e.__class__, str(e)))
+
+    pkgdata_dir = e.data.getVar("PKGDATA_DIR", True) + '/runtime/'
+    if os.path.exists(pkgdata_dir):
+        for root, dirs, files in os.walk(pkgdata_dir):
+            for pkgname in files:
+                if pkgname.endswith('.packaged'):
+                    pkgname = pkgname[:-9]
+                    pkgdatafile = root + pkgname
+                    try:
+                        sdata = oe.packagedata.read_pkgdatafile(pkgdatafile)
+                        sdata['PKG'] = pkgname
+                        pkginfolist.append(sdata)
+                    except Exception as e:
+                        bb.warn("Failed to read pkgdata file %s: %s: %s" % (pkgdatafile, e.__class__, str(e)))
     bb.event.fire(bb.event.PackageInfo(pkginfolist), e.data)
 }
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9eed72a..58d0c20 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -382,7 +382,7 @@ DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
+PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"
 
 ##################################################################
 # SDK variables.
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 9ff06cc..733236d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -8,6 +8,7 @@ MULTILIBS ??= "multilib:lib32"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
+PKGDATA_DIR = "${STAGING_DIR}/${MACHINE}/pkgdata"
 
 INHERIT += "multilib_global"
 
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 14c38bd..cd5f044 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -23,21 +23,7 @@ def read_pkgdatafile(fn):
 
     return pkgdata
 
-def all_pkgdatadirs(d):
-    dirs = []
-    triplets = (d.getVar("PKGMLTRIPLETS") or "").split()
-    for t in triplets:
-        dirs.append(t + "/runtime/")
-    return dirs 
- 
 def get_subpkgedata_fn(pkg, d):
-    dirs = all_pkgdatadirs(d)
-
-    pkgdata = d.expand('${TMPDIR}/pkgdata/')
-    for dir in dirs:
-        fn = pkgdata + dir + pkg
-        if os.path.exists(fn):
-            return fn
     return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)
 
 def has_subpkgdata(pkg, d):
@@ -70,29 +56,24 @@ def read_subpkgdata_dict(pkg, d):
 def _pkgmap(d):
     """Return a dictionary mapping package to recipe name."""
 
-    target_os = d.getVar("TARGET_OS", True)
-    target_vendor = d.getVar("TARGET_VENDOR", True)
-    basedir = os.path.dirname(d.getVar("PKGDATA_DIR", True))
-
-    dirs = ("%s%s-%s" % (arch, target_vendor, target_os)
-            for arch in d.getVar("PACKAGE_ARCHS", True).split())
+    pkgdatadir = d.getVar("PKGDATA_DIR", True)
 
     pkgmap = {}
-    for pkgdatadir in (os.path.join(basedir, sys) for sys in dirs):
+    try:
+        files = os.listdir(pkgdatadir)
+    except OSError:
+        bb.warn("No files in %s?" % pkgdatadir)
+        files = []
+
+    for pn in filter(lambda f: not os.path.isdir(os.path.join(pkgdatadir, f)), files):
         try:
-            files = os.listdir(pkgdatadir)
+            pkgdata = read_pkgdatafile(os.path.join(pkgdatadir, pn))
         except OSError:
             continue
 
-        for pn in filter(lambda f: not os.path.isdir(os.path.join(pkgdatadir, f)), files):
-            try:
-                pkgdata = read_pkgdatafile(os.path.join(pkgdatadir, pn))
-            except OSError:
-                continue
-
-            packages = pkgdata.get("PACKAGES") or ""
-            for pkg in packages.split():
-                pkgmap[pkg] = pn
+        packages = pkgdata.get("PACKAGES") or ""
+        for pkg in packages.split():
+            pkgmap[pkg] = pn
 
     return pkgmap
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index d20be9f..062ccc7 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -60,10 +60,6 @@ def get_tune_parameters(tune, d):
 
 get_tune_parameters[vardepsexclude] = "AVAILTUNES"
 
-# We really need HOST_SYS here for some packages and TARGET_SYS for others.
-# For now, libgcc is most important so we fix for that - RP.
-SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
-
 DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"
 
 MIRRORS =+ "\
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index c63f87d..dcdfe25 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -41,17 +41,13 @@ def usage():
 
 
 def glob(args):
-    if len(args) < 4:
+    if len(args) < 3:
         usage()
         sys.exit(1)
 
     pkgdata_dir = args[0]
-    target_suffix = args[1]
-    pkglist_file = args[2]
-    globs = args[3].split()
-
-    if target_suffix.startswith("-"):
-        target_suffix = target_suffix[1:]
+    pkglist_file = args[1]
+    globs = args[2].split()
 
     skipregex = re.compile("-locale-|^locale-base-|-dev$|-doc$|-dbg$|-staticdev$|^kernel-module-")
 
@@ -63,7 +59,6 @@ def glob(args):
                 continue
             pkg = fields[0]
             arch = fields[1]
-            multimach_target_sys = "%s-%s" % (arch, target_suffix)
 
             # Skip packages for which there is no point applying globs
             if skipregex.search(pkg):
@@ -86,9 +81,9 @@ def glob(args):
 
             # Define some functions
             def revpkgdata(pkgn):
-                return os.path.join(pkgdata_dir, multimach_target_sys, "runtime-reverse", pkgn)
+                return os.path.join(pkgdata_dir, "runtime-reverse", pkgn)
             def fwdpkgdata(pkgn):
-                return os.path.join(pkgdata_dir, multimach_target_sys, "runtime", pkgn)
+                return os.path.join(pkgdata_dir, "runtime", pkgn)
             def readpn(pkgdata_file):
                 pn = ""
                 with open(pkgdata_file, 'r') as f:
@@ -156,17 +151,13 @@ def glob(args):
     print("\n".join(mappedpkgs))
 
 def read_value(args):
-    if len(args) < 4:
+    if len(args) < 3:
         usage()
         sys.exit(1)
 
     pkgdata_dir = args[0]
-    target_suffix = args[1]
-    var = args[2]
-    packages = args[3].split()
-
-    if target_suffix.startswith("-"):
-        target_suffix = target_suffix[1:]
+    var = args[1]
+    packages = args[2].split()
 
     def readvar(pkgdata_file, var):
         val = ""
@@ -177,23 +168,16 @@ def read_value(args):
         return val
 
     if debug:
-        print "read-value('%s', '%s', '%s' '%s'" % (pkgdata_dir, target_suffix, var, packages)
+        print "read-value('%s', '%s' '%s'" % (pkgdata_dir, var, packages)
     for package in packages:
         pkg_split = package.split('_')
         pkg_name = pkg_split[0]
         pkg_arch = '_'.join(pkg_split[1:])
         if debug:
             print "package: name: '%s', arch: '%s'" % (pkg_name, pkg_arch)
-        multimach_target_sys = "%s-%s" % (pkg_arch, target_suffix)
-        revlink = os.path.join(pkgdata_dir, multimach_target_sys, "runtime-reverse", pkg_name)
+        revlink = os.path.join(pkgdata_dir, "runtime-reverse", pkg_name)
         if debug:
             print(revlink)
-        if not os.path.exists(revlink):
-            # [YOCTO #4227] try to drop -gnueabi from TARGET_OS
-            multimach_target_sys = '-'.join(multimach_target_sys.split('-')[:-1])
-            revlink = os.path.join(pkgdata_dir, multimach_target_sys, "runtime-reverse", pkg_name)
-            if debug:
-                print(revlink)
         if os.path.exists(revlink):
             mappedpkg = os.path.basename(os.readlink(revlink))
             qvar = var



