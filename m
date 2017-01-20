Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6905B77235
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI3AoO019291; Fri, 20 Jan 2017 18:03:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YJjGWhBx-JJd; Fri, 20 Jan 2017 18:03:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI34KE019275
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:03:05 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdWi-0000V5-LW; Fri, 20 Jan 2017 18:03:04 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:02:56 +0000
Message-Id: <1484935378-1881-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] Switch to Recipe Specific Sysroots
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
X-List-Received-Date: Fri, 20 Jan 2017 18:03:15 -0000

This patch is comparatively large and invasive. It does only do one thing, switching the
system to build using recipe specific sysroots and where changes could be isolated from it,
that has been done.

With the current single sysroot approach, its possible for software to find things which
aren't in their dependencies. This leads to a determinism problem and is a growing issue in
several of the market segments where OE makes sense. The way to solve this problem for OE is
to have seperate sysroots for each recipe and these will only contain the dependencies for
that recipe.

Its worth noting that this is not task specific sysroots and that OE's dependencies do vary
enormously by task. This did result in some implementation challenges. There is nothing stopping
the implementation of task specific sysroots at some later point based on this work but
that as deemed a bridge too far right now.

Implementation details:

* Rather than installing the sysroot artefacts into a combined sysroots, they are now placed in
  TMPDIR/sysroot-components/PACKAGE_ARCH/PN.

* WORKDIR/recipe-sysroot and WORKDIR/recipe-sysroot-native are built by hardlinking in files
  from the sysroot-component trees. These new directories are known as RECIPE_SYSROOT and
  RECIPE_SYSROOT_NATIVE.

* This construction is primarily done by a new do_prepare_recipe_sysroot task which runs
  before do_configure and consists of a call to the extend_recipe_sysroot function.

* Other tasks need things in the sysroot before/after this, e.g. do_patch needs quilt-native
  and do_package_write_deb needs dpkg-native. The code therefore inspects the dependencies
  for each task and adds extend_recipe_sysroot as a prefunc if it has populate_sysroot
  dependencies.

* We have to do a search/replace 'fixme' operation on the files installed into the sysroot to
  change hardcoded paths into the correct ones. We create a fixmepath file in the component
  directory which lists the files which need this operation.

* Some files have "postinstall" commands which need to run against them, e.g. gdk-pixbuf each
  time a new loader is added. These are handled by adding files in bindir with the name
  prefixed by "postinst-" and are run in each sysroot as its created if they're present.
  This did mean most sstate postinstalls have to be rewritten but there shouldn't be many of them.

* Since a recipe can have multiple tasks and these tasks can run against each other at the same
  time we have to have a lock when we perform write operations against the sysroot. We also have
  to maintain manifests of what we install against a task checksum of the dependency. If the
  checksum changes, we remove its files and then add the new ones.

* The autotools logic for filtering the view of m4 files is no longer needed (and was the model
  for the way extend_recipe_sysroot works).

* For autotools, we used to build a combined m4 macros directory which had both the native and
  target m4 files. We can no longer do this so we use the target sysroot as the default and add
  the native sysroot as an extra backup include path. If we don't do this, we'd have to build
  target pkg-config before we could built anything using pkg-config for example (ditto gettext).
  Such dependencies would be painful so we haven't required that.

* PKDDATA_DIR was moved out the sysroot and works as before using sstate to build a hybrid copy
  for each machine. The paths therefore changed, the behaviour did not.

* The ccache class had to be reworked to function with rss.

* The TCBOOTSTRAP sysroot for compiler bootstrap is no longer needed but the -initial data
  does have to be filtered out from the main recipe sysroots. Putting "-initial" in a normal
  recipe name therefore remains a bad idea.

* The logic in insane needed tweaks to deal with the new path layout, as did the debug source
  file extraction code in package.bbclass.

* The logic in sstate.bbclass had to be rewritten since it previously only performed search and
  replace on extracted sstate and we now need this to happen even if the compiled path was
  "correct". This in theory could cause a mild performance issue but since the sysroot data
  was the main data that needed this and we'd have to do it there regardless with rss, I've opted
  just to change the way the class for everything. The built output used to build the sstate output
  is now retained and installed rather than deleted.

* The search and replace logic used in sstate objects also seemed weak/incorrect and didn't hold
  up against testing. This has been rewritten too. There are some assumptions made about paths, we
  save the 'proper' search and replace operations to fixmepath.cmd but then ignore this. What is
  here works but is a little hardcoded and an area for future improvement.

* In order to work with eSDK we need a way to build something that looks like the old style sysroot.
  "bitbake build-sysroots" will construct such a sysroot based on everything in the components
  directory that matches the current MACHINE. It will allow transition of external tools and can
  built target or native variants or both. It also supports a clean task. I'd suggest not relying on
  this for anything other than transitional purposes though. To see XXX in that sysroot, you'd have
  to have built that in a previous bitbake invocation.

* pseudo is run out of its components directory. This is fine as its statically linked.

* The hacks for wayland to see allarch dependencies in the multilib case are no longer needed
  and can be dropped.

* wic needed more extensive changes to work with rss and the fixes are in a separate commit series

* Various oe-selftest tweaks were needed since tests did assume the location to binaries and the
  combined sysroot in several cases.

* Most missing dependencies this work found have been sent out as separate patches as they were found
  but a few tweaks are still included here.

* A late addition is that extend_recipe_sysroot became multilib aware and able to populate multilib
  sysroots. I had hoped not to have to add that complexity but the meta-environment recipe forced my
  hand. That implementation can probably be neater but this is on the list of things to cleanup later
  at this point.

In summary, the impact people will likely see after this change:

* Recipes may fail with missing dependencies, particularly native tools like gettext-native,
  glib-2.0-native and libxml2.0-native. Some hosts have these installed and will mask these errors

* Any recipe/class using SSTATEPOSTINSTFUNCS will need that code rewriting into a postinst

* There was a separate patch series dealing with roots postinst native dependency issues. Any postinst
  which expects native tools at rootfs time will need to mark that dependency with PACKAGE_WRITE_DEPS.

There could well be other issues. This has been tested repeatedly against our autobuilders and oe-selftest
and issues found have been fixed. We believe at least OE-Core is in good shape but that doesn't mean
we've found all the issues.

Also, the logging is a bit chatty at the moment. It does help if something goes wrong and goes to the
task logfiles, not the console so I've intentionally left this like that for now. We can turn it down
easily enough in due course.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass                     | 128 +-------
 meta/classes/base.bbclass                          |   2 +-
 meta/classes/ccache.bbclass                        |   3 +
 meta/classes/cross-canadian.bbclass                |   5 +-
 meta/classes/cross.bbclass                         |   2 +-
 meta/classes/crosssdk.bbclass                      |   1 -
 meta/classes/gobject-introspection.bbclass         |   2 +-
 meta/classes/image.bbclass                         |   4 +-
 meta/classes/insane.bbclass                        |   3 +
 meta/classes/module.bbclass                        |   2 +-
 meta/classes/native.bbclass                        |   2 +-
 meta/classes/nativesdk.bbclass                     |   4 +-
 meta/classes/package.bbclass                       |   3 +-
 meta/classes/pixbufcache.bbclass                   |  21 +-
 meta/classes/populate_sdk_ext.bbclass              |   2 +-
 meta/classes/siteconfig.bbclass                    |   2 +-
 meta/classes/sstate.bbclass                        | 126 +++++---
 meta/classes/staging.bbclass                       | 349 ++++++++++++++++++++-
 meta/classes/toolchain-scripts.bbclass             |   1 +
 meta/classes/uninative.bbclass                     |   3 +-
 meta/classes/useradd.bbclass                       |  34 +-
 meta/conf/bitbake.conf                             |  22 +-
 meta/conf/multilib.conf                            |  12 +-
 meta/files/ext-sdk-prepare.py                      |   2 +
 meta/lib/oeqa/selftest/buildoptions.py             |   3 +-
 meta/lib/oeqa/selftest/layerappend.py              |   3 +-
 meta/lib/oeqa/selftest/liboe.py                    |   5 +-
 meta/lib/oeqa/selftest/signing.py                  |   2 +-
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |  29 +-
 meta/recipes-core/glibc/glibc-initial.inc          |  19 --
 meta/recipes-core/glibc/glibc.inc                  |   2 -
 meta/recipes-core/meta/build-sysroots.bb           |  38 +++
 meta/recipes-core/meta/meta-environment-extsdk.bb  |   4 +-
 meta/recipes-core/meta/meta-extsdk-toolchain.bb    |   2 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb       |   2 +-
 meta/recipes-core/musl/musl.inc                    |   1 -
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |  19 +-
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb  |  19 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   5 +-
 meta/recipes-devtools/gcc/libgcc-initial.inc       |   2 -
 meta/recipes-devtools/guile/guile_2.0.13.bb        |   4 +-
 meta/recipes-devtools/libtool/libtool_2.4.6.bb     |   2 +
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   2 +
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb |   9 -
 .../gobject-introspection_1.50.0.bb                |  15 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb     |   3 +-
 meta/recipes-graphics/wayland/weston_1.11.1.bb     |   4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   3 +-
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |   1 +
 meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb   |   2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb   |   4 +-
 52 files changed, 609 insertions(+), 332 deletions(-)
 create mode 100644 meta/recipes-core/meta/build-sysroots.bb

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index c43531b..3741d09 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -131,129 +131,15 @@ EXTRACONFFUNCS ??= ""
 
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
-do_configure[prefuncs] += "autotools_preconfigure autotools_copy_aclocals ${EXTRACONFFUNCS}"
+do_configure[prefuncs] += "autotools_preconfigure autotools_aclocals ${EXTRACONFFUNCS}"
 do_configure[postfuncs] += "autotools_postconfigure"
 
-ACLOCALDIR = "${WORKDIR}/aclocal-copy"
-
-python autotools_copy_aclocals () {
-    import copy
-
-    s = d.getVar("AUTOTOOLS_SCRIPT_PATH")
-    if not os.path.exists(s + "/configure.in") and not os.path.exists(s + "/configure.ac"):
-        if not d.getVar("AUTOTOOLS_COPYACLOCAL", False):
-            return
-
-    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-    #bb.warn(str(taskdepdata))
-    pn = d.getVar("PN")
-    aclocaldir = d.getVar("ACLOCALDIR")
-    oe.path.remove(aclocaldir)
-    bb.utils.mkdirhier(aclocaldir)
-    start = None
-    configuredeps = []
-    # Detect bitbake -b usage
-    # Everything but quilt-native would have dependencies
-    nodeps = (pn != "quilt-native")
-
-    for dep in taskdepdata:
-        data = taskdepdata[dep]
-        if data[1] == "do_configure" and data[0] == pn:
-            start = dep
-        if not nodeps and start:
-            break
-        if nodeps and data[0] != pn:
-            nodeps = False
-    if start is None:
-        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
-
-    # We need to figure out which m4 files we need to expose to this do_configure task.
-    # This needs to match what would get restored from sstate, which is controlled 
-    # ultimately by calls from bitbake to setscene_depvalid().
-    # That function expects a setscene dependency tree. We build a dependency tree 
-    # condensed to do_populate_sysroot -> do_populate_sysroot dependencies, similar to 
-    # that used by setscene tasks. We can then call into setscene_depvalid() and decide
-    # which dependencies we can "see" and should expose the m4 files for.
-    setscenedeps = copy.deepcopy(taskdepdata)
-
-    start = set([start])
-
-    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
-    for dep in taskdepdata:
-        data = setscenedeps[dep]        
-        if data[1] != "do_populate_sysroot":
-            for dep2 in setscenedeps:
-                data2 = setscenedeps[dep2]
-                if dep in data2[3]:
-                    data2[3].update(setscenedeps[dep][3])
-                    data2[3].remove(dep)
-            if dep in start:
-                start.update(setscenedeps[dep][3])
-                start.remove(dep)
-            del setscenedeps[dep]
-
-    # Remove circular references
-    for dep in setscenedeps:
-        if dep in setscenedeps[dep][3]:
-            setscenedeps[dep][3].remove(dep)
-
-    # Direct dependencies should be present and can be depended upon
-    for dep in start:
-        configuredeps.append(setscenedeps[dep][0])
-
-    # Call into setscene_depvalid for each sub-dependency and only copy m4 files
-    # for ones that would be restored from sstate.
-    done = list(start)
-    next = list(start)
-    while next:
-        new = []
-        for dep in next:
-            data = setscenedeps[dep]
-            for datadep in data[3]:
-                if datadep in done:
-                    continue
-                taskdeps = {}
-                taskdeps[dep] = setscenedeps[dep][:2]
-                taskdeps[datadep] = setscenedeps[datadep][:2]
-                retval = setscene_depvalid(datadep, taskdeps, [], d)
-                if retval:
-                    bb.note("Skipping setscene dependency %s for m4 macro copying" % datadep)
-                    continue
-                done.append(datadep)
-                new.append(datadep)
-                configuredeps.append(setscenedeps[datadep][0])
-        next = new
-
-    cp = []
-    if nodeps:
-        bb.warn("autotools: Unable to find task dependencies, -b being used? Pulling in all m4 files")
-        for l in [d.expand("${STAGING_DATADIR_NATIVE}/aclocal/"), d.expand("${STAGING_DATADIR}/aclocal/")]:
-            cp.extend(os.path.join(l, f) for f in os.listdir(l))
-
-    for c in configuredeps:
-        if c.endswith("-native"):
-            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
-        elif c.startswith("nativesdk-"):
-            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
-        elif "-cross-" in c or "-crosssdk" in c:
-            continue
-        else:
-            manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${MACHINE}-%s.populate_sysroot" % c)
-        try:
-            f = open(manifest, "r")
-            for l in f:
-                if "/aclocal/" in l and l.strip().endswith(".m4"):
-                    cp.append(l.strip())
-                elif "config_site.d/" in l:
-                    cp.append(l.strip())
-        except:
-            bb.warn("%s not found" % manifest)
-
-    for c in cp:
-        t = os.path.join(aclocaldir, os.path.basename(c))
-        if not os.path.exists(t):
-            os.symlink(c, t)
+ACLOCALDIR = "${STAGING_DATADIR}/aclocal"
+ACLOCALEXTRAPATH = ""
+ACLOCALEXTRAPATH_class-target = " -I ${STAGING_DATADIR_NATIVE}/aclocal/"
+ACLOCALEXTRAPATH_class-nativesdk = " -I ${STAGING_DATADIR_NATIVE}/aclocal/"
 
+python autotools_aclocals () {
     # Refresh variable with cache files
     d.setVar("CONFIG_SITE", siteinfo_get_files(d, aclocalcache=True))
 }
@@ -279,6 +165,7 @@ autotools_do_configure() {
 	if [ -e ${AUTOTOOLS_SCRIPT_PATH}/configure.in -o -e ${AUTOTOOLS_SCRIPT_PATH}/configure.ac ]; then
 		olddir=`pwd`
 		cd ${AUTOTOOLS_SCRIPT_PATH}
+		mkdir -p ${ACLOCALDIR}
 		ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/"
 		if [ x"${acpaths}" = xdefault ]; then
 			acpaths=
@@ -289,6 +176,7 @@ autotools_do_configure() {
 		else
 			acpaths="${acpaths}"
 		fi
+		acpaths="$acpaths ${ACLOCALEXTRAPATH}"
 		AUTOV=`automake --version | sed -e '1{s/.* //;s/\.[0-9]\+$//};q'`
 		automake --version
 		echo "AUTOV is $AUTOV"
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 2765ebf..965518c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -284,7 +284,7 @@ CLEANBROKEN = "0"
 
 addtask configure after do_patch
 do_configure[dirs] = "${B}"
-do_configure[deptask] = "do_populate_sysroot"
+do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
 base_do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
 		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 93fcaca..76c8828 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -2,5 +2,8 @@ CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
+DEPENDS_append_class-target = " ccache-native"
+DEPENDS[vardepvalueexclude] = " ccache-native"
+
 do_configure[dirs] =+ "${CCACHE_DIR}"
 do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 64db113..3120f46 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -100,9 +100,9 @@ MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}"
+STAGING_DIR_HOST = "${RECIPE_SYSROOT}"
 
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR}/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}"
+TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
 
 PATH_append = ":${TMPDIR}/sysroots/${HOST_ARCH}/${bindir_cross}"
 PKGHIST_DIR = "${TMPDIR}/pkghistory/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/"
@@ -169,6 +169,7 @@ USE_NLS = "${SDKUSE_NLS}"
 # and not any particular tune that is enabled.
 TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
 
+PKGDATA_DIR = "${TMPDIR}/pkgdata/${SDK_SYS}"
 # If MLPREFIX is set by multilib code, shlibs
 # points to the wrong place so force it
 SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs2"
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 01b0933..d125f10 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -19,7 +19,7 @@ HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
 export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64 /usr/lib /usr/lib64"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
+STAGING_DIR_HOST = "${RECIPE_SYSROOT_NATIVE}"
 
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index eaf2beb..c5c29ea 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -8,7 +8,6 @@ python () {
 	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
 }
 
-STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-${SDKPKGSUFFIX}${SDK_VENDOR}-${SDK_OS}"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 TARGET_ARCH = "${SDK_ARCH}"
diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 37389cb..b6160b8 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -17,7 +17,7 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspe
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-DEPENDS_append_class-target = " gobject-introspection gobject-introspection-native qemu-native"
+DEPENDS_append_class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
 
 # Even though introspection is disabled on -native, gobject-introspection package is still
 # needed for m4 macros.
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6b08649..021c432 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -13,7 +13,7 @@ inherit gzipnative
 
 LICENSE = "MIT"
 PACKAGES = ""
-DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
+DEPENDS += "${MLPREFIX}qemuwrapper-cross depmodwrapper-cross"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
@@ -274,7 +274,7 @@ fakeroot python do_rootfs () {
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
 do_rootfs[umask] = "022"
-addtask rootfs before do_build
+addtask rootfs before do_build after do_prepare_recipe_sysroot
 
 fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7332e45..3cf86c1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -827,6 +827,7 @@ def package_qa_check_staged(path,d):
     sane = True
     tmpdir = d.getVar('TMPDIR')
     workdir = os.path.join(tmpdir, "work")
+    recipesysroot = d.getVar("RECIPE_SYSROOT")
 
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         pkgconfigcheck = workdir
@@ -842,12 +843,14 @@ def package_qa_check_staged(path,d):
             if file.endswith(".la"):
                 with open(path) as f:
                     file_content = f.read()
+                    file_content = file_content.replace(recipesysroot, "")
                     if workdir in file_content:
                         error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
                         sane = package_qa_handle_error("la", error_msg, d)
             elif file.endswith(".pc"):
                 with open(path) as f:
                     file_content = f.read()
+                    file_content = file_content.replace(recipesysroot, "")
                     if pkgconfigcheck in file_content:
                         error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
                         sane = package_qa_handle_error("pkgconfig", error_msg, d)
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 5847047..a588873 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,6 +1,6 @@
 inherit module-base kernel-module-split
 
-addtask make_scripts after do_patch before do_compile
+addtask make_scripts after do_prepare_recipe_sysroot before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 5592e1d..4d4aaad 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -95,7 +95,7 @@ libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}/"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_NATIVE}/"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
 
 # Since we actually install these into situ there is no staging prefix
 STAGING_DIR_HOST = ""
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 2ac8fd8..a97f5a7 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -25,9 +25,7 @@ PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
 DEPENDS_append = " chrpath-replacement-native"
 EXTRANATIVEPATH += "chrpath-native"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"
-STAGING_DIR_TARGET = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}"
-PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"
+PKGDATA_DIR = "${TMPDIR}/pkgdata/${SDK_SYS}"
 
 HOST_ARCH = "${SDK_ARCH}"
 HOST_VENDOR = "${SDK_VENDOR}"
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0068a50..ac2d71c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -414,7 +414,8 @@ def copydebugsources(debugsrcdir, d):
         bb.utils.mkdirhier(basepath)
         cpath.updatecache(basepath)
 
-        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
+        # Ignore files from the recipe sysroots (target and native)
+        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | "
         # We need to ignore files that are not actually ours
         # we do this by only paying attention to items from this package
         processdebugsrc += "fgrep -zw '%s' | "
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 633a875..aa9815c 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -48,24 +48,17 @@ python populate_packages_append() {
 }
 
 gdkpixbuf_complete() {
-	GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache || exit 1
+GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache || exit 1
 }
 
-#
-# Add an sstate postinst hook to update the cache for native packages.
-# An error exit during populate_sysroot_setscene allows bitbake to
-# try to recover by re-building the package.
-#
 DEPENDS_append_class-native = " gdk-pixbuf-native"
-SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
+SYSROOT_PREPROCESS_FUNCS_append_class-native = " pixbufcache_sstate_postinst"
 
 # See base.bbclass for the other half of this
 pixbufcache_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" ]; then
-		${gdkpixbuf_complete}
-	elif [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
-		if [ -x ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders ]; then
-			echo "${gdkpixbuf_complete}" >> ${STAGING_DIR}/sstatecompletions
-		fi
-	fi
+	mkdir -p ${SYSROOT_DESTDIR}${bindir}
+	dest=${SYSROOT_DESTDIR}${bindir}/postinst-useradd-${PN}
+        echo '#!/bin/sh' > $dest
+	echo "${gdkpixbuf_complete}" >> $dest
+	chmod 0755 $dest
 }
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d5f6de9..9b711d1 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -404,7 +404,7 @@ python copy_buildsystem () {
 
     if sdk_include_toolchain:
         lockedsigs_base = d.getVar('WORKDIR') + '/locked-sigs-base2.inc'
-        lockedsigs_toolchain = d.getVar('STAGING_DIR_HOST') + '/locked-sigs/locked-sigs-extsdk-toolchain.inc'
+        lockedsigs_toolchain = d.expand("${STAGING_DIR}/${TUNE_PKGARCH}/meta-extsdk-toolchain/locked-sigs/locked-sigs-extsdk-toolchain.inc")
         shutil.move(lockedsigs_pruned, lockedsigs_base)
         oe.copy_buildsystem.merge_lockedsigs([],
                                              lockedsigs_base,
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index 9d51a02..bb491d2 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -5,9 +5,9 @@ python siteconfig_do_siteconfig () {
 	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME'), 'site_config')):
 		bb.debug(1, "No site_config directory, skipping do_siteconfig")
 		return
+	sstate_install(shared_state, d)
 	bb.build.exec_func('do_siteconfig_gencache', d)
 	sstate_clean(shared_state, d)
-	sstate_install(shared_state, d)
 }
 
 EXTRASITECONFIG ?= ""
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f1faf48..a767a02 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -97,7 +97,7 @@ python () {
     # These classes encode staging paths into their scripts data so can only be
     # reused if we manipulate the paths
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d) or bb.data.inherits_class('crosssdk', d):
-        scan_cmd = "grep -Irl ${STAGING_DIR} ${SSTATE_BUILDDIR}"
+        scan_cmd = "grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}"
         d.setVar('SSTATE_SCAN_CMD', scan_cmd)
 
     unique_tasks = sorted(set((d.getVar('SSTATETASKS') or "").split()))
@@ -131,6 +131,7 @@ def sstate_state_fromvars(d, task = None):
     lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
     lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
     interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
+    fixmedir = d.getVarFlag("do_" + task, 'sstate-fixmedir') or ""
     if not task or len(inputs) != len(outputs):
         bb.fatal("sstate variables not setup correctly?!")
 
@@ -146,6 +147,7 @@ def sstate_state_fromvars(d, task = None):
     ss['lockfiles-shared'] = lockfilesshared
     ss['plaindirs'] = plaindirs
     ss['interceptfuncs'] = interceptfuncs
+    ss['fixmedir'] = fixmedir
     return ss
 
 def sstate_add(ss, source, dest, d):
@@ -195,6 +197,9 @@ def sstate_install(ss, d):
                 srcdir = os.path.join(walkroot, dir)
                 dstdir = srcdir.replace(state[1], state[2])
                 #bb.debug(2, "Staging %s to %s" % (srcdir, dstdir))
+                if os.path.islink(srcdir):
+                    sharedfiles.append(dstdir)
+                    continue
                 if not dstdir.endswith("/"):
                     dstdir = dstdir + "/"
                 shareddirs.append(dstdir)
@@ -203,7 +208,7 @@ def sstate_install(ss, d):
     whitelist = (d.getVar("SSTATE_DUPWHITELIST") or "").split()
     match = []
     for f in sharedfiles:
-        if os.path.exists(f):
+        if os.path.exists(f) and not os.path.islink(f):
             f = os.path.normpath(f)
             realmatch = True
             for w in whitelist:
@@ -244,6 +249,10 @@ def sstate_install(ss, d):
           (d.getVar('PN'), "\n  ".join(match)))
         bb.fatal("If the above message is too much, the simpler version is you're advised to wipe out tmp and rebuild (reusing sstate is fine). That will likely fix things in most (but not all) cases.")
 
+    if ss['fixmedir'] and os.path.exists(ss['fixmedir'] + "/fixmepath.cmd"):
+        sharedfiles.append(ss['fixmedir'] + "/fixmepath.cmd")
+        sharedfiles.append(ss['fixmedir'] + "/fixmepath")
+
     # Write out the manifest
     f = open(manifest, "w")
     for file in sharedfiles:
@@ -288,17 +297,8 @@ sstate_install[vardepsexclude] += "SSTATE_DUPWHITELIST STATE_MANMACH SSTATE_MANF
 sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
 def sstate_installpkg(ss, d):
-    import oe.path
-    import subprocess
     from oe.gpg_sign import get_signer
 
-    def prepdir(dir):
-        # remove dir if it exists, ensure any parent directories do exist
-        if os.path.exists(dir):
-            oe.path.remove(dir)
-        bb.utils.mkdirhier(dir)
-        oe.path.remove(dir)
-
     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
     sstatefetch = d.getVar('SSTATE_PKGNAME') + '_' + ss['task'] + ".tgz"
     sstatepkg = d.getVar('SSTATE_PKG') + '_' + ss['task'] + ".tgz"
@@ -320,11 +320,36 @@ def sstate_installpkg(ss, d):
         if not signer.verify(sstatepkg + '.sig'):
             bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
 
-    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS') or '').split():
+    sstateinst = d.getVar("SSTATE_INSTDIR")
+    d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
+
+    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_unpack_package']:
         # All hooks should run in the SSTATE_INSTDIR
         bb.build.exec_func(f, d, (sstateinst,))
 
+    return sstate_installpkgdir(ss, d)
+
+def sstate_installpkgdir(ss, d):
+    import oe.path
+    import subprocess
+
+    sstateinst = d.getVar("SSTATE_INSTDIR")
+    d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
+
+    for f in (d.getVar('SSTATEPOSTUNPACKFUNCS') or '').split():
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(f, d, (sstateinst,))
+
+    def prepdir(dir):
+        # remove dir if it exists, ensure any parent directories do exist
+        if os.path.exists(dir):
+            oe.path.remove(dir)
+        bb.utils.mkdirhier(dir)
+        oe.path.remove(dir)
+
     for state in ss['dirs']:
+        if d.getVar('SSTATE_SKIP_CREATION') == '1':
+            continue
         prepdir(state[1])
         os.rename(sstateinst + state[0], state[1])
     sstate_install(ss, d)
@@ -347,18 +372,18 @@ python sstate_hardcode_path_unpack () {
     import subprocess
 
     sstateinst = d.getVar('SSTATE_INSTDIR')
-    fixmefn =  sstateinst + "fixmepath"
+    sstatefixmedir = d.getVar('SSTATE_FIXMEDIR')
+    fixmefn = sstateinst + "fixmepath"
     if os.path.isfile(fixmefn):
-        staging = d.getVar('STAGING_DIR')
-        staging_target = d.getVar('STAGING_DIR_TARGET')
-        staging_host = d.getVar('STAGING_DIR_HOST')
-
-        if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
-            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIR:%s:g'" % (staging)
-        elif bb.data.inherits_class('cross', d):
-            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIR:%s:g'" % (staging_target, staging)
-        else:
+        staging_target = d.getVar('RECIPE_SYSROOT')
+        staging_host = d.getVar('RECIPE_SYSROOT_NATIVE')
+
+        if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
             sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
+        elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
+            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (staging_target, staging_host)
+        else:
+            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g'" % (staging_target)
 
         extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
         for fixmevar in extra_staging_fixmes.split():
@@ -368,6 +393,18 @@ python sstate_hardcode_path_unpack () {
         # Add sstateinst to each filename in fixmepath, use xargs to efficiently call sed
         sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" % (sstateinst, fixmefn, sstate_sed_cmd)
 
+        # Defer do_populate_sysroot relocation command
+        if sstatefixmedir:
+            bb.utils.mkdirhier(sstatefixmedir)
+            with open(sstatefixmedir + "/fixmepath.cmd", "w") as f:
+                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(fixmefn, sstatefixmedir + "/fixmepath")
+                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(sstateinst, "FIXMEFINALSSTATEINST")
+                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(staging_host, "FIXMEFINALSSTATEHOST")
+                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(staging_target, "FIXMEFINALSSTATETARGET")
+                f.write(sstate_hardcode_cmd)
+            bb.utils.copyfile(fixmefn, sstatefixmedir + "/fixmepath")
+            return
+
         bb.note("Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd))
         subprocess.call(sstate_hardcode_cmd, shell=True)
 
@@ -499,20 +536,19 @@ python sstate_hardcode_path () {
     # Note: the logic in this function needs to match the reverse logic
     # in sstate_installpkg(ss, d)
 
-    staging = d.getVar('STAGING_DIR')
-    staging_target = d.getVar('STAGING_DIR_TARGET')
-    staging_host = d.getVar('STAGING_DIR_HOST')
+    staging_target = d.getVar('RECIPE_SYSROOT')
+    staging_host = d.getVar('RECIPE_SYSROOT_NATIVE')
     sstate_builddir = d.getVar('SSTATE_BUILDDIR')
 
-    if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
-        sstate_grep_cmd = "grep -l -e '%s'" % (staging)
-        sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIR:g'" % (staging)
-    elif bb.data.inherits_class('cross', d):
-        sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging)
-        sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g; s:%s:FIXMESTAGINGDIR:g'" % (staging_target, staging)
-    else:
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
         sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
+    elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
+        sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
+        sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g; s:%s:FIXMESTAGINGDIRHOST:g'" % (staging_target, staging_host)
+    else:
+        sstate_grep_cmd = "grep -l -e '%s'" % (staging_target)
+        sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % (staging_target)
 
     extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
     for fixmevar in extra_staging_fixmes.split():
@@ -537,14 +573,14 @@ python sstate_hardcode_path () {
     sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, xargs_no_empty_run_cmd, sstate_sed_cmd)
 
     bb.note("Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd))
-    subprocess.call(sstate_hardcode_cmd, shell=True)
+    subprocess.check_call(sstate_hardcode_cmd, shell=True, cwd=sstate_builddir)
 
         # If the fixmefn is empty, remove it..
     if os.stat(fixmefn).st_size == 0:
         os.remove(fixmefn)
     else:
         bb.note("Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd))
-        subprocess.call(sstate_filelist_relative_cmd, shell=True)
+        subprocess.check_call(sstate_filelist_relative_cmd, shell=True)
 }
 
 def sstate_package(ss, d):
@@ -560,6 +596,8 @@ def sstate_package(ss, d):
         if not link.startswith(tmpdir):
             return
 
+        #base = os.path.relpath(link, os.path.dirname(path))
+
         depth = outputpath.rpartition(tmpdir)[2].count('/')
         base = link.partition(tmpdir)[2].strip()
         while depth > 1:
@@ -594,14 +632,14 @@ def sstate_package(ss, d):
                 dstpath = srcpath.replace(state[1], state[2])
                 make_relative_symlink(srcpath, dstpath, d)
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
-        oe.path.copyhardlinktree(state[1], sstatebuild + state[0])
+        os.rename(state[1], sstatebuild + state[0])
 
     workdir = d.getVar('WORKDIR')
     for plain in ss['plaindirs']:
         pdir = plain.replace(workdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        oe.path.copyhardlinktree(plain, pdir)
+        os.rename(plain, pdir)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_PKG', sstatepkg)
@@ -614,6 +652,8 @@ def sstate_package(ss, d):
 
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 
+    d.setVar('SSTATE_INSTDIR', sstatebuild)
+
     return
 
 def pstaging_fetch(sstatefetch, sstatepkg, d):
@@ -672,14 +712,21 @@ sstate_task_prefunc[dirs] = "${WORKDIR}"
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
 
-    sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
         bb.build.exec_func(intercept, d, (d.getVar("WORKDIR"),))
+
     omask = os.umask(0o002)
     if omask != 0o002:
        bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
     sstate_package(shared_state, d)
     os.umask(omask)
+
+    sstateinst = d.getVar("SSTATE_INSTDIR")
+    d.setVar('SSTATE_FIXMEDIR', shared_state['fixmedir'])
+
+    sstate_installpkgdir(shared_state, d)
+
+    bb.utils.remove(d.getVar("SSTATE_BUILDDIR"), recurse=True)
 }
 sstate_task_postfunc[dirs] = "${WORKDIR}"
 
@@ -704,9 +751,6 @@ sstate_create_package () {
 	fi
 	chmod 0664 $TFILE
 	mv -f $TFILE ${SSTATE_PKG}
-
-	cd ${WORKDIR}
-	rm -rf ${SSTATE_BUILDDIR}
 }
 
 python sstate_sign_package () {
@@ -877,7 +921,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
     bb.debug(2, "Considering setscene task: %s" % (str(taskdependees[task])))
 
     def isNativeCross(x):
-        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x
+        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
 
     # We only need to trigger populate_lic through direct dependencies
     if taskdependees[task][1] == "do_populate_lic":
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 2512ae6..1a4668e 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -235,12 +235,357 @@ do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
 SSTATETASKS += "do_populate_sysroot"
 do_populate_sysroot[cleandirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/"
-do_populate_sysroot[stamp-extra-info] = "${MACHINE}"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
+do_populate_sysroot[sstate-fixmedir] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
 
 python do_populate_sysroot_setscene () {
     sstate_setscene(d)
 }
 addtask do_populate_sysroot_setscene
 
+def staging_copyfile(c, target, fixme, postinsts, stagingdir):
+    import errno
+
+    if c.endswith("/fixmepath"):
+        fixme.append(c)
+        return None
+    if c.endswith("/fixmepath.cmd"):
+        return None
+    #bb.warn(c)
+    dest = c.replace(stagingdir, "")
+    dest = target + "/" + "/".join(dest.split("/")[3:])
+    bb.utils.mkdirhier(os.path.dirname(dest))
+    if "/usr/bin/postinst-" in c:
+        postinsts.append(dest)
+    if os.path.islink(c):
+        linkto = os.readlink(c)
+        if os.path.lexists(dest):
+            if os.readlink(dest) == linkto:
+                return dest
+            bb.fatal("Link %s already exists to a different location?" % dest)
+        os.symlink(linkto, dest)
+        #bb.warn(c)
+    else:
+        try:
+            os.link(c, dest)
+        except OSError as err:
+            if err.errno == errno.EXDEV:
+                bb.utils.copyfile(c, dest)
+            else:
+                raise
+    return dest
+
+def staging_copydir(c, target, stagingdir):
+    dest = c.replace(stagingdir, "")
+    dest = target + "/" + "/".join(dest.split("/")[3:])
+    bb.utils.mkdirhier(dest)
+
+def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
+    import subprocess
+
+    if not fixme:
+        return
+    cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
+    for fixmevar in ['PKGDATA_DIR']:
+        fixme_path = d.getVar(fixmevar)
+        cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
+    bb.note(cmd)
+    subprocess.check_call(cmd, shell=True)
+
+
+def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
+    import glob
+    import subprocess
+
+    fixme = []
+    postinsts = []
+    stagingdir = d.getVar("STAGING_DIR")
+    if native:
+        pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
+        targetdir = nativesysroot
+    else:
+        pkgarchs = ['${MACHINE_ARCH}', '${TUNE_PKGARCH}', 'allarch']
+        targetdir = targetsysroot
+
+    bb.utils.mkdirhier(targetdir)
+    for pkgarch in pkgarchs:
+        for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
+            if manifest.endswith("-initial.populate_sysroot"):
+                # skip glibc-initial and libgcc-initial due to file overlap
+                continue
+            tmanifest = targetdir + "/" + os.path.basename(manifest)
+            if os.path.exists(tmanifest):
+                continue
+            try:
+                os.link(manifest, tmanifest)
+            except OSError as err:
+                if err.errno == errno.EXDEV:
+                    bb.utils.copyfile(manifest, tmanifest)
+                else:
+                    raise
+            with open(manifest, "r") as f:
+                for l in f:
+                    l = l.strip()
+                    if l.endswith("/"):
+                        staging_copydir(l, targetdir, stagingdir)
+                        continue
+                    staging_copyfile(l, targetdir, fixme, postinsts, stagingdir)
+
+    staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
+    for p in postinsts:
+        subprocess.check_call(p, shell=True)
+
+#
+# Manifests here are complicated. The main sysroot area has the unpacked sstate
+# which us unrelocated and tracked by the main sstate manifests. Each recipe
+# specific sysroot has manifests for each dependency that is installed there.
+# The task hash is used to tell whether the data needs to be reinstalled. We
+# use a symlink to point to the currently installed hash. There is also a
+# "complete" stamp file which is used to mark if installation completed. If
+# something fails (e.g. a postinst), this won't get written and we would
+# remove and reinstall the dependency. This also means partially installed
+# dependencies should get cleaned up correctly.
+#
+
+python extend_recipe_sysroot() {
+    import copy
+    import subprocess
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    mytaskname = d.getVar("BB_RUNTASK")
+    #bb.warn(str(taskdepdata))
+    pn = d.getVar("PN")
+
+    if mytaskname.endswith("_setscene"):
+        mytaskname = mytaskname.replace("_setscene", "")
+
+    start = None
+    configuredeps = []
+    for dep in taskdepdata:
+        data = taskdepdata[dep]
+        if data[1] == mytaskname and data[0] == pn:
+            start = dep
+            break
+    if start is None:
+        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
+
+    # We need to figure out which sysroot files we need to expose to this task.
+    # This needs to match what would get restored from sstate, which is controlled
+    # ultimately by calls from bitbake to setscene_depvalid().
+    # That function expects a setscene dependency tree. We build a dependency tree
+    # condensed to inter-sstate task dependencies, similar to that used by setscene
+    # tasks. We can then call into setscene_depvalid() and decide
+    # which dependencies we can "see" and should expose in the recipe specific sysroot.
+    setscenedeps = copy.deepcopy(taskdepdata)
+
+    start = set([start])
+
+    sstatetasks = d.getVar("SSTATETASKS").split()
+
+    def print_dep_tree(deptree):
+        data = ""
+        for dep in deptree:
+            deps = "    " + "\n    ".join(deptree[dep][3]) + "\n"
+            data = "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
+        return data
+
+    #bb.note("Full dep tree is:\n%s" % print_dep_tree(taskdepdata))
+
+    #bb.note(" start2 is %s" % str(start))
+
+    # If start is an sstate task (like do_package) we need to add in its direct dependencies
+    # else the code below won't recurse into them.
+    for dep in set(start):
+        for dep2 in setscenedeps[dep][3]:
+            start.add(dep2)
+        start.remove(dep)
+
+    #bb.note(" start3 is %s" % str(start))
+
+    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
+    for dep in taskdepdata:
+        data = setscenedeps[dep]
+        if data[1] not in sstatetasks:
+            for dep2 in setscenedeps:
+                data2 = setscenedeps[dep2]
+                if dep in data2[3]:
+                    data2[3].update(setscenedeps[dep][3])
+                    data2[3].remove(dep)
+            if dep in start:
+                start.update(setscenedeps[dep][3])
+                start.remove(dep)
+            del setscenedeps[dep]
+
+    # Remove circular references
+    for dep in setscenedeps:
+        if dep in setscenedeps[dep][3]:
+            setscenedeps[dep][3].remove(dep)
+
+    #bb.note("Computed dep tree is:\n%s" % print_dep_tree(setscenedeps))
+    #bb.note(" start is %s" % str(start))
+
+    # Direct dependencies should be present and can be depended upon
+    for dep in set(start):
+        if setscenedeps[dep][1] == "do_populate_sysroot":
+            if dep not in configuredeps:
+                configuredeps.append(dep)
+    bb.note("Direct dependencies are %s" % str(configuredeps))
+    #bb.note(" or %s" % str(start))
+
+    # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
+    # for ones that would be restored from sstate.
+    done = list(start)
+    next = list(start)
+    while next:
+        new = []
+        for dep in next:
+            data = setscenedeps[dep]
+            for datadep in data[3]:
+                if datadep in done:
+                    continue
+                taskdeps = {}
+                taskdeps[dep] = setscenedeps[dep][:2]
+                taskdeps[datadep] = setscenedeps[datadep][:2]
+                retval = setscene_depvalid(datadep, taskdeps, [], d)
+                if retval:
+                    bb.note("Skipping setscene dependency %s for installation into the sysroot" % datadep)
+                    continue
+                done.append(datadep)
+                new.append(datadep)
+                if datadep not in configuredeps and setscenedeps[datadep][1] == "do_populate_sysroot":
+                    configuredeps.append(datadep)
+                    bb.note("Adding dependency on %s" % setscenedeps[datadep][0])
+                else:
+                    bb.note("Following dependency on %s" % setscenedeps[datadep][0])
+        next = new
+
+    stagingdir = d.getVar("STAGING_DIR")
+    recipesysroot = d.getVar("RECIPE_SYSROOT")
+    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
+    current_variant = d.getVar("BBEXTENDVARIANT")
+
+    # Detect bitbake -b usage
+    nodeps = d.getVar("BB_LIMITEDDEPS") or False
+    if nodeps:
+        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
+        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
+        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
+        bb.utils.unlockfile(lock)
+
+    depdir = recipesysrootnative + "/installeddeps"
+    bb.utils.mkdirhier(depdir)
+
+    lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
+
+    fixme = {}
+    fixme[''] = []
+    fixme['native'] = []
+    postinsts = []
+    multilibs = {}
+
+    for dep in configuredeps:
+        c = setscenedeps[dep][0]
+        taskhash = setscenedeps[dep][5]
+        taskmanifest = depdir + "/" + c + "." + taskhash
+        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
+            bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
+            continue
+        if os.path.exists(depdir + "/" + c):
+            lnk = os.readlink(depdir + "/" + c)
+            if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
+                bb.note("%s exists in sysroot, skipping" % c)
+                continue
+            else:
+                bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
+                sstate_clean_manifest(depdir + "/" + lnk, d)
+                os.unlink(depdir + "/" + c)
+        elif os.path.lexists(depdir + "/" + c):
+            os.unlink(depdir + "/" + c)
+
+        os.symlink(c + "." + taskhash, depdir + "/" + c)
+
+        d2 = d
+        destsysroot = recipesysroot
+        variant = ''
+        if setscenedeps[dep][2].startswith("virtual:multilib"):
+            variant = setscenedeps[dep][2].split(":")[2]
+            if variant != current_variant:
+                if variant not in multilibs:
+                    multilibs[variant] = get_multilib_datastore(variant, d)
+                d2 = multilibs[variant]
+                destsysroot = d2.getVar("RECIPE_SYSROOT")
+
+        native = False
+        if c.endswith("-native"):
+            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)
+            native = True
+        elif c.startswith("nativesdk-"):
+            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
+        elif "-cross-" in c:
+            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}_${TARGET_ARCH}-%s.populate_sysroot" % c)
+            native = True
+        elif "-crosssdk" in c:
+            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
+            native = True
+        else:
+            manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${MACHINE_ARCH}-%s.populate_sysroot" % c)
+            if not os.path.exists(manifest):
+                manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${TUNE_PKGARCH}-%s.populate_sysroot" % c)
+            if not os.path.exists(manifest):
+                manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-allarch-%s.populate_sysroot" % c)
+        if not os.path.exists(manifest):
+            bb.warn("Manifest %s not found?" % manifest)
+        else:
+            with open(manifest, "r") as f, open(taskmanifest, 'w') as m:
+                for l in f:
+                    l = l.strip()
+                    if l.endswith("/"):
+                        if native:
+                            dest = staging_copydir(l, recipesysrootnative, stagingdir)
+                        else:
+                            dest = staging_copydir(l, destsysroot, stagingdir)
+                        continue
+                    if native:
+                        dest = staging_copyfile(l, recipesysrootnative, fixme['native'], postinsts, stagingdir)
+                    else:
+                        dest = staging_copyfile(l, destsysroot, fixme[''], postinsts, stagingdir)
+                    if dest:
+                        m.write(dest + "\n")
+
+    for f in fixme:
+        if f == '':
+            staging_processfixme(fixme[f], recipesysroot, recipesysroot, recipesysrootnative, d)
+        elif f == 'native':
+            staging_processfixme(fixme[f], recipesysrootnative, recipesysroot, recipesysrootnative, d)
+        else:
+            staging_processfixme(fixme[f], multilibs[f].getVar("RECIPE_SYSROOT"), recipesysroot, recipesysrootnative, d)
+
+    for p in postinsts:
+        subprocess.check_call(p, shell=True)
+
+    for dep in configuredeps:
+        c = setscenedeps[dep][0]
+        open(depdir + "/" + c + ".complete", "w").close()
+
+    bb.utils.unlockfile(lock)
+}
+extend_recipe_sysroot[vardepsexclude] += "MACHINE SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
+
+python do_prepare_recipe_sysroot () {
+    bb.build.exec_func("extend_recipe_sysroot", d)
+}
+addtask do_prepare_recipe_sysroot before do_configure after do_fetch
+
+# Clean out the recipe specific sysroots before do_fetch
+do_fetch[cleandirs] += "${RECIPE_SYSROOT} ${RECIPE_SYSROOT_NATIVE}"
+
+python staging_taskhandler() {
+    bbtasks = e.tasklist
+    for task in bbtasks:
+        deps = d.getVarFlag(task, "depends")
+        if deps and "populate_sysroot" in deps:
+            d.appendVarFlag(task, "prefuncs", " extend_recipe_sysroot")
+}
+staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
+addhandler staging_taskhandler
 
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 44b4e24..7b68d20 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -108,6 +108,7 @@ EOF
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
+DEPENDS += "${TOOLCHAIN_NEED_CONFIGSITE_CACHE}"
 
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 54f63af..ba7ca63 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -91,7 +91,8 @@ def enable_uninative(d):
         bb.debug(2, "Enabling uninative")
         d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
-        d.prependVar("PATH", "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
+        d.setVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", " uninative_changeinterp")
+        d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
 python uninative_changeinterp () {
     import subprocess
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 82f4d52..326c04d 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,7 +3,7 @@ inherit useradd_base
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
-DEPENDS_append_class-target = " base-files shadow-native shadow-sysroot shadow"
+DEPENDS_append_class-target = " base-files shadow-native shadow-sysroot shadow base-passwd"
 PACKAGE_WRITE_DEPS += "shadow-native"
 
 # This preinstall function can be run in four different contexts:
@@ -97,13 +97,13 @@ fi
 }
 
 useradd_sysroot () {
-	# Pseudo may (do_install) or may not (do_populate_sysroot_setscene) be running 
+	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_setscene) be running 
 	# at this point so we're explicit about the environment so pseudo can load if 
 	# not already present.
-	export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir_native}/pseudo"
+	export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 
 	# Explicitly set $D since it isn't set to anything
-	# before do_install
+	# before do_prepare_recipe_sysroot
 	D=${STAGING_DIR_TARGET}
 
 	# Add groups and users defined for all recipe packages
@@ -117,17 +117,25 @@ useradd_sysroot () {
 	useradd_preinst
 }
 
-useradd_sysroot_sstate () {
-	if [ "${BB_CURRENTTASK}" = "package_setscene" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		useradd_sysroot
-	fi
+python useradd_sysroot_sstate () {
+    task = d.getVar("BB_CURRENTTASK")
+    if task == "package_setscene":
+        bb.build.exec_func("useradd_sysroot", d)
+    elif task == "prepare_recipe_sysroot":
+        scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}")
+        bb.utils.mkdirhier(os.path.dirname(scriptfile))
+        with open(scriptfile, 'w') as script:
+            script.write("#!/bin/sh\n")
+            bb.data.emit_func("useradd_sysroot", script, d)
+            script.write("useradd_sysroot\n")
+        os.chmod(scriptfile, 0o755)
+        bb.build.exec_func("useradd_sysroot", d)
 }
 
 userdel_sysroot_sstate () {
 if test "x${STAGING_DIR_TARGET}" != "x"; then
     if [ "${BB_CURRENTTASK}" = "clean" ]; then
-        export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${STAGING_DIR_NATIVE}${bindir_native}/pseudo"
+        export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${PSEUDO_SYSROOT}${bindir_native}/pseudo"
         OPT="--root ${STAGING_DIR_TARGET}"
 
         # Remove groups and users defined for package
@@ -154,10 +162,10 @@ if test "x${STAGING_DIR_TARGET}" != "x"; then
 fi
 }
 
-SSTATECLEANFUNCS_append_class-target = " userdel_sysroot_sstate"
+#SSTATECLEANFUNCS_append_class-target = " userdel_sysroot_sstate"
 
-do_install[prefuncs] += "${SYSROOTFUNC}"
-SYSROOTFUNC_class-target = "useradd_sysroot"
+do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
+SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
 SYSROOTFUNC = ""
 
 SSTATEPREINSTFUNCS_append_class-target = " useradd_sysroot_sstate"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c8516a8..ee8bd8b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -352,8 +352,10 @@ S = "${WORKDIR}/${BP}"
 B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/sysroots"
+RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
+RECIPE_SYSROOT_NATIVE = "${WORKDIR}/recipe-sysroot-native"
 
-STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
+STAGING_DIR_NATIVE = "${RECIPE_SYSROOT_NATIVE}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR}/crossscripts"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
@@ -365,7 +367,7 @@ STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
 STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
+STAGING_DIR_HOST = "${RECIPE_SYSROOT}"
 STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
 STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
 STAGING_LIBEXECDIR = "${STAGING_DIR_HOST}${libexecdir}"
@@ -376,8 +378,7 @@ STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"
 STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
 
-STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
-STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
+STAGING_DIR_TARGET = "${RECIPE_SYSROOT}"
 
 # Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
 # packaged staging and/or multimachine.
@@ -389,7 +390,7 @@ DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
-PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"
+PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
 ##################################################################
 # SDK variables.
@@ -630,14 +631,15 @@ SRC_URI = ""
 
 # Use pseudo as the fakeroot implementation
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
-PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${STAGING_DIR_NATIVE}"
+PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
+PSEUDO_SYSROOT = "${STAGING_DIR}-components/${BUILD_ARCH}/pseudo-native"
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${STAGING_BINDIR_NATIVE} PSEUDO_LIBDIR=${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib PSEUDO_PREFIX=${STAGING_BINDIR_NATIVE}/../../ PSEUDO_DISABLED=1"
-FAKEROOTCMD = "${STAGING_BINDIR_NATIVE}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_DISABLED=1"
+FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
@@ -811,7 +813,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
-    BB_WORKERCONTEXT"
+    BB_WORKERCONTEXT BB_LIMITEDDEPS"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 4dc0543..e74dec8 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -6,9 +6,9 @@ MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS TARGET_VENDOR"
 
 MULTILIBS ??= "multilib:lib32"
 
-STAGING_DIR_HOST = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
-STAGING_DIR_TARGET = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
-PKGDATA_DIR = "${STAGING_DIR}/${MACHINE}/pkgdata"
+STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
+STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
+RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 
 INHERIT += "multilib_global"
 
@@ -23,6 +23,6 @@ OPKG_ARGS_append = " --force-maintainer --force-overwrite"
 # find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only looks
 # inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
 # architecture-independent pkgconfig location to PKG_CONFIG_PATH.
-PKG_CONFIG_PATH .= ":${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig"
-PKG_CONFIG_PATH[vardepsexclude] = "MACHINE datadir STAGING_DIR"
-PKG_CONFIG_PATH[vardepvalueexclude] = ":${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig"
+PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
+PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
+PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 78c1d16..ef09639 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -53,6 +53,8 @@ def main():
         logf.write('Preparing SDK for %s...\n' % ', '.join(sdk_targets))
 
         ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
+        if not ret:
+            ret = run_command_interruptible('bitbake build-sysroots')
         lastlog = get_last_consolelog()
         if lastlog:
             with open(lastlog, 'r') as f:
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 95fd2f0..d40eb00 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -33,7 +33,8 @@ class ImageOptionsTests(oeSelfTest):
     @testcase(286)
     def test_ccache_tool(self):
         bitbake("ccache-native")
-        self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")), msg = "No ccache found under %s" % str(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native')))
+        p = get_bb_var('SYSROOT_DESTDIR', 'ccache-native') + get_bb_var('bindir', 'ccache-native') + "/" + "ccache"
+        self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
         bitbake("m4 -c cleansstate")
         bitbake("m4 -c compile")
diff --git a/meta/lib/oeqa/selftest/layerappend.py b/meta/lib/oeqa/selftest/layerappend.py
index 4de5034..37bb32c 100644
--- a/meta/lib/oeqa/selftest/layerappend.py
+++ b/meta/lib/oeqa/selftest/layerappend.py
@@ -55,7 +55,7 @@ SRC_URI_append += "file://appendtest.txt"
     @testcase(1196)
     def test_layer_appends(self):
         corebase = get_bb_var("COREBASE")
-        stagingdir = get_bb_var("STAGING_DIR_TARGET")
+
         for l in ["0", "1", "2"]:
             layer = os.path.join(corebase, "meta-layertest" + l)
             self.assertFalse(os.path.exists(layer))
@@ -83,6 +83,7 @@ SRC_URI_append += "file://appendtest.txt"
 
         self.layerappend = "BBLAYERS += \"{0}/meta-layertest0 {0}/meta-layertest1 {0}/meta-layertest2\"".format(corebase)
         ftools.append_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
+        stagingdir = get_bb_var("SYSROOT_DESTDIR", "layerappendtest")
         bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 2 test")
diff --git a/meta/lib/oeqa/selftest/liboe.py b/meta/lib/oeqa/selftest/liboe.py
index 35131eb..cd12cd2 100644
--- a/meta/lib/oeqa/selftest/liboe.py
+++ b/meta/lib/oeqa/selftest/liboe.py
@@ -50,7 +50,10 @@ class LibOE(oeSelfTest):
 
         # ensure we have setfattr available
         bitbake("attr-native")
-        bindir = get_bb_var('STAGING_BINDIR_NATIVE')
+
+        destdir = get_bb_var('SYSROOT_DESTDIR', 'attr-native')
+        bindir = get_bb_var('bindir', 'attr-native')
+        bindir = destdir + bindir
 
         # create a file with xattr and copy it
         open(oe.path.join(src, testfilename), 'w+b').close()
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 4c12d6d..70e8369 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -66,7 +66,7 @@ class Signing(oeSelfTest):
             pf = pkgdata['PN'] + "-" + pkgdata['PKGV'] + '-' + pkgdata['PKGR']
         deploy_dir_rpm = get_bb_var('DEPLOY_DIR_RPM', test_recipe)
         package_arch = get_bb_var('PACKAGE_ARCH', test_recipe).replace('-', '_')
-        staging_bindir_native = get_bb_var('STAGING_BINDIR_NATIVE')
+        staging_bindir_native = get_bb_var('STAGING_BINDIR_NATIVE', test_recipe)
 
         pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
 
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 10457b2..e43bc0a 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -23,8 +23,6 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/"
 
 inherit autotools
 
-SSTATEPOSTINSTFUNCS += "base_passwd_sstate_postinst"
-
 do_install () {
 	install -d -m 755 ${D}${sbindir}
 	install -o root -g root -p -m 755 ${B}/update-passwd ${D}${sbindir}/
@@ -45,23 +43,16 @@ do_install () {
 	install -p -m 644 ${S}/debian/copyright ${D}${docdir}/${BPN}/
 }
 
-base_passwd_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		# Staging does not copy ${sysconfdir} files into the
-		# target sysroot, so we need to do so manually. We
-		# put these files in the target sysroot so they can
-		# be used by recipes which use custom user/group
-		# permissions.
-		# Install passwd.master and group.master to sysconfdir and mv
-		# them to make sure they are atomically install.
-		install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
-		for i in passwd group; do
-			install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/$i.master \
-				${STAGING_DIR_TARGET}${sysconfdir}/
-			mv ${STAGING_DIR_TARGET}${sysconfdir}/$i.master ${STAGING_DIR_TARGET}${sysconfdir}/$i
-		done
-	fi
+SYSROOT_DIRS += "${sysconfdir}"
+SYSROOT_PREPROCESS_FUNCS += "base_passwd_tweaksysroot"
+
+base_passwd_tweaksysroot () {
+	# Install passwd.master and group.master to sysconfdir
+	install -d -m 755 ${SYSROOT_DESTDIR}${sysconfdir}
+	for i in passwd group; do
+		install -p -m 644 ${SYSROOT_DESTDIR}${datadir}/base-passwd/$i.master \
+			${SYSROOT_DESTDIR}${sysconfdir}/$i
+	done
 }
 
 python populate_packages_prepend() {
diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 2e3bc81..7380bdb 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -6,7 +6,6 @@ PACKAGES_DYNAMIC = ""
 
 STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
 STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 do_configure () {
 	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
@@ -42,10 +41,6 @@ do_install () {
 	if [ -e ${B}/bits/stdio_lim.h ]; then
 		cp ${B}/bits/stdio_lim.h  ${D}${includedir}/bits/
 	fi
-	# add links to linux-libc-headers: final glibc build need this.
-	for t in linux asm asm-generic; do
-		ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
-	done
 }
 
 do_install_locale() {
@@ -56,20 +51,6 @@ do_siteconfig () {
 	:
 }
 
-SSTATEPOSTINSTFUNCS += "glibcinitial_sstate_postinst"
-glibcinitial_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		# Recreate the symlinks to ensure they point to the correct location
-		for t in linux asm asm-generic; do
-			rm -f ${STAGING_DIR_TCBOOTSTRAP}${includedir}/$t
-			ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${STAGING_DIR_TCBOOTSTRAP}${includedir}/
-		done
-	fi
-}
-
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
-
 # We don't install any scripts so there is nothing to evacuate
 do_evacuate_scripts () {
 	:
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 823e60e..21bbdc2 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -6,8 +6,6 @@ STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
 STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
-
 python () {
     opt_effective = "-O"
     for opt in d.getVar('SELECTED_OPTIMIZATION').split():
diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
new file mode 100644
index 0000000..7a712e2
--- /dev/null
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -0,0 +1,38 @@
+INHIBIT_DEFAULT_DEPS = "1"
+LICENSE = "MIT"
+
+STANDALONE_SYSROOT = "${STAGING_DIR}/${MACHINE}"
+STANDALONE_SYSROOT_NATIVE = "${STAGING_DIR}/${BUILD_ARCH}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit nopackages
+deltask fetch
+deltask unpack
+deltask patch
+deltask prepare_recipe_sysroot
+deltask populate_lic
+deltask configure
+deltask compile
+deltask install
+deltask populate_sysroot
+
+python do_build_native_sysroot () {
+    targetsysroot = d.getVar("STANDALONE_SYSROOT")
+    nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
+    staging_populate_sysroot_dir(targetsysroot, nativesysroot, True, d)
+}
+do_build_native_sysroot[cleandirs] = "${STANDALONE_SYSROOT_NATIVE}"
+do_build_native_sysroot[nostamp] = "1"
+addtask do_build_native_sysroot before do_build
+
+python do_build_target_sysroot () {
+    targetsysroot = d.getVar("STANDALONE_SYSROOT")
+    nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
+    staging_populate_sysroot_dir(targetsysroot, nativesysroot, False, d)
+}
+do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
+do_build_target_sysroot[nostamp] = "1"
+addtask do_build_target_sysroot before do_build
+
+do_clean[cleandirs] += "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT_NATIVE}"
diff --git a/meta/recipes-core/meta/meta-environment-extsdk.bb b/meta/recipes-core/meta/meta-environment-extsdk.bb
index 757afc1..2076b56 100644
--- a/meta/recipes-core/meta/meta-environment-extsdk.bb
+++ b/meta/recipes-core/meta/meta-environment-extsdk.bb
@@ -5,8 +5,8 @@ require meta-environment.bb
 PN = "meta-environment-extsdk-${MACHINE}"
 
 create_sdk_files_append() {
-	local sysroot=${SDKPATH}/tmp/${@os.path.relpath(d.getVar('STAGING_DIR_TARGET'), d.getVar('TMPDIR'))}
-	local sdkpathnative=${SDKPATH}/tmp/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE'), d.getVar('TMPDIR'))}
+	local sysroot=${SDKPATH}/tmp/${@os.path.relpath(d.getVar('STAGING_DIR'), d.getVar('TMPDIR'))}/${MACHINE}
+	local sdkpathnative=${SDKPATH}/tmp/${@os.path.relpath(d.getVar('STAGING_DIR'), d.getVar('TMPDIR'))}/${BUILD_ARCH}
 
 	toolchain_create_sdk_env_script '' '' $sysroot '' ${bindir_native} ${prefix_native} $sdkpathnative
 }
diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index fc6d6de..0b8fcf0 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -15,7 +15,7 @@ LOCKED_SIGS_INDIR = "${D}/locked-sigs"
 addtask do_locked_sigs after do_populate_sysroot
 SSTATETASKS += "do_locked_sigs"
 do_locked_sigs[sstate-inputdirs] = "${LOCKED_SIGS_INDIR}"
-do_locked_sigs[sstate-outputdirs] = "${STAGING_DIR_HOST}/locked-sigs"
+do_locked_sigs[sstate-outputdirs] = "${STAGING_DIR}/${PACKAGE_ARCH}/${PN}/locked-sigs"
 
 python do_locked_sigs() {
     import oe.copy_buildsystem
diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 0ce378e..617f96a 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -32,7 +32,7 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
 
-do_configure[deptask] = ""
+do_prepare_recipe_sysroot[deptask] = ""
 
 WORLD_PKGDATA_EXCLUDE ?= ""
 
diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 7ed931c..56c9d7f 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -12,7 +12,6 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7928b7ad32ceda04932478e330e52f7f"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 2f13dba..05a04d8 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -27,9 +27,6 @@ S="${WORKDIR}/docbook-xml-4.5.c31424"
 inherit allarch
 BBCLASSEXTEND = "native"
 
-SSTATEPOSTINSTFUNCS_append_class-native = " docbook_xml_dtd_sstate_postinst"
-SYSROOT_PREPROCESS_FUNCS_append_class-native = " docbook_xml_dtd_sysroot_preprocess"
-
 do_configre (){
     :
 }
@@ -49,18 +46,10 @@ do_install () {
     install -m 755  ${WORKDIR}/docbook-xml.xml ${D}${sysconfdir}/xml/docbook-xml.xml
 }
 
-docbook_xml_dtd_sstate_postinst () {
-    if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-    then
-        # Ensure that the catalog file sgml-docbook.cat is properly
-        # updated when the package is installed from sstate cache.
-        sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xml.xml
-    fi
-}
-
-docbook_xml_dtd_sysroot_preprocess () {
-    # Update the hardcode dir in docbook-xml.xml
-    sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xml.xml
+do_install_append_class-native () {
+	# Ensure that the catalog file sgml-docbook.cat is properly
+	# updated when the package is installed from sstate cache.
+	sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${D}${sysconfdir}/xml/docbook-xml.xml
 }
 
 FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index aa03a82..07d32ce 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -20,9 +20,6 @@ S = "${WORKDIR}/docbook-xsl-${PV}"
 inherit allarch
 BBCLASSEXTEND = "native"
 
-SSTATEPOSTINSTFUNCS_append_class-native = " docbook_xsl_stylesheets_sstate_postinst"
-SYSROOT_PREPROCESS_FUNCS_append_class-native = " docbook_xsl_stylesheets_sysroot_preprocess"
-
 do_configure (){
 	:
 }
@@ -55,18 +52,10 @@ do_install () {
 
 }
 
-docbook_xsl_stylesheets_sstate_postinst () {
-    if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-    then
-        # Ensure that the catalog file sgml-docbook.cat is properly
-        # updated when the package is installed from sstate cache.
-        sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xsl.xml
-    fi
-}
-
-docbook_xsl_stylesheets_sysroot_preprocess () {
-    # Update the hardcode dir in docbook-xml.xml
-    sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xsl.xml
+do_install_append_class-native () {
+	# Ensure that the catalog file sgml-docbook.cat is properly
+	# updated when the package is installed from sstate cache.
+	sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${D}${sysconfdir}/xml/docbook-xsl.xml
 }
 
 RDEPENDS_${PN} += "perl"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index dcf2271..d47f42e 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -47,6 +47,7 @@ do_configure_prepend () {
 do_compile () {
     oe_runmake all-gcc configure-target-libgcc
 }
+
 do_install () {
 	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h )
 	oe_runmake 'DESTDIR=${D}' install-gcc
@@ -94,7 +95,7 @@ sysroot_stage_all() {
 	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
 }
 
-do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}/"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/ ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}/"
+do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/"
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
 
 inherit nopackages
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index 687a8a0..aa32185 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -14,6 +14,4 @@ EXTRA_OECONF += "--disable-shared"
 
 LIBGCCBUILDTREENAME = "gcc-build-internal-initial-"
 
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
-
 inherit nopackages
diff --git a/meta/recipes-devtools/guile/guile_2.0.13.bb b/meta/recipes-devtools/guile/guile_2.0.13.bb
index dd38b47..c29e752 100644
--- a/meta/recipes-devtools/guile/guile_2.0.13.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.13.bb
@@ -108,10 +108,12 @@ guile_cross_config() {
 # auto-compile into the prefix even if it can write there, so touch them here as
 # sysroot is managed.
 SSTATEPOSTINSTFUNCS += "guile_sstate_postinst"
+GUILESSTATEDIR = "${STAGING_DIR}-components/${TUNE_PKGARCH}/${PN}/${libdir}/guile/2.0/ccache"
+GUILESSTATEDIR_class-native = "${STAGING_DIR}-components/${BUILD_ARCH}/${PN}/${libdir_native}/guile/2.0/ccache"
 guile_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
-                find ${STAGING_DIR_TARGET}/${libdir}/guile/2.0/ccache -type f | xargs touch
+                find ${GUILESSTATEDIR} -type f | xargs touch
 	fi
 }
 
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index 8858f6e..06abb05 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -11,6 +11,8 @@ SYSROOT_DIRS_BLACKLIST += " \
     ${datadir}/libtool/build-aux \
 "
 
+ACLOCALEXTRAPATH_class-target = ""
+
 do_install_append () {
         sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
             -e 's@${STAGING_DIR_HOST}@@g' \
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 881942e..b86400b 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -3,6 +3,8 @@ LICENSE = "MIT"
 
 S = "${WORKDIR}"
 
+DEPENDS += "qemu-native"
+
 inherit qemu
 
 do_install () {
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
index cb589bb..98e5090 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
@@ -93,12 +93,3 @@ do_install_append_class-native() {
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
 BBCLASSEXTEND = "native"
-
-SSTATEPREINSTFUNCS_append_class-native = " gdkpixbuf_sstate_preinst"
-SYSROOT_PREPROCESS_FUNCS_append_class-native = " gdkpixbuf_sstate_preinst"
-
-gdkpixbuf_sstate_preinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" ]; then
-		rm -rf ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/*
-	fi
-}
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
index 0c29a3b..15c8c00 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.50.0.bb
@@ -34,7 +34,7 @@ DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native"
 # (standard ldd doesn't work when cross-compiling).
 DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
 
-SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir"
+SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
 
 do_configure_prepend_class-native() {
         # Tweak the native python scripts so that they don't refer to the
@@ -166,8 +166,13 @@ python gobject_introspection_preconfigure () {
     oe.utils.write_ld_so_conf(d)
 }
 
-SSTATEPOSTINSTFUNCS += "gobject_introspection_postinst"
-python gobject_introspection_postinst () {
-    if d.getVar("BB_CURRENTTASK").startswith("populate_sysroot"):
-        oe.utils.write_ld_so_conf(d)
+SYSROOT_PREPROCESS_FUNCS_append = " gi_ldsoconf_sysroot_preprocess"
+gi_ldsoconf_sysroot_preprocess () {
+	mkdir -p ${SYSROOT_DESTDIR}${bindir}
+	dest=${SYSROOT_DESTDIR}${bindir}/postinst-ldsoconf-${PN}
+	echo "#!/bin/sh" > $dest
+	echo "echo mkdir -p ${STAGING_DIR_TARGET}${sysconfdir} > ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
+	echo "echo ${base_libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
+	echo "echo ${libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
+	chmod 755 $dest
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 6499ea6..9c104e2 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -31,7 +31,7 @@ EXTRA_OECONF += " \
                  --enable-modules \
                  --disable-cups \
                  --disable-colord \
-                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
+                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
                  ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
                  "
 EXTRA_OECONF[vardepsexclude] = "MACHINE"
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index 44842f8..0d9a129 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -34,8 +34,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-pthreads \
                 --enable-sdl-dlopen \
                 --disable-rpath \
-                WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}"
-EXTRA_OECONF[vardepsexclude] = "MACHINE"
+                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
diff --git a/meta/recipes-graphics/wayland/weston_1.11.1.bb b/meta/recipes-graphics/wayland/weston_1.11.1.bb
index 7e75cf7..2736cc1 100644
--- a/meta/recipes-graphics/wayland/weston_1.11.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.11.1.bb
@@ -28,10 +28,8 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor \
-                WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
+                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
                 "
-EXTRA_OECONF[vardepsexclude] = "MACHINE"
-
 EXTRA_OECONF_append_qemux86 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
 		"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6a13380..216ae64 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -117,9 +117,8 @@ EXTRA_OECONF += "--with-fop=no \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
-                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
+                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
 "
-EXTRA_OECONF[vardepsexclude] = "MACHINE"
 
 PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index e617bde..aa2805b 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -9,6 +9,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # We need the following for the sstate code to process the wrapper
 SSTATE_SCAN_FILES += "depmodwrapper"
+EXTRA_STAGING_FIXMES = "PKGDATA_DIR"
 
 do_install() {
 	install -d ${D}${bindir_crossscripts}/
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
index 8d4a146..a4f35ce 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
@@ -34,7 +34,7 @@ AUTOTOOLS_COPYACLOCAL = "1"
 do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case
     export AUTOMAKE_DIR="$(automake --print-libdir)"
-    export ACLOCAL_FLAGS="--system-acdir=${ACLOCALDIR}/"
+    export ACLOCAL_FLAGS="--system-acdir=${ACLOCALDIR}/ ${ACLOCALEXTRAPATH}"
 
     cp ${WORKDIR}/gitcompile_hdajacksensetest ${S}/hdajacksensetest/gitcompile
 }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
index f487b09..c469aca 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
@@ -24,5 +24,5 @@ SRC_URI[sha256sum] = "0795ca9303a99cc7e44dda0e6e18524de02b39892e4b68eaba488f7b9d
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-EXTRA_OECONF += "WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}"
-EXTRA_OECONF[vardepsexclude] = "MACHINE"
+EXTRA_OECONF += "WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
+
-- 
2.7.4



