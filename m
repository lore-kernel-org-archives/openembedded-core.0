Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T6O1H-0001JH-Mw for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:48:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7SEpRE9008443
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 15:51:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08262-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 15:51:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7SEpHFQ008437
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 15:51:19 +0100
Message-ID: <1346168136.23096.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2012 08:35:36 -0700
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] nativesdk: Switch to using nativesdk as a prefix, not a suffix
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
X-List-Received-Date: Tue, 28 Aug 2012 15:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As discussed on the mailing lists, using a suffix to package names is 
hard and has lead to many recipes having to do PKGSUFFIX games. Its
looking extremely hard to scale nativesdk much further without hacking
many recipes.

By comparison, using a prefix like multilib does works much better and
doesn't involve "hacking" as many recipes. This change converts nativesdk
to use a prefix using the existing multilib infrastructure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 59febd1..801896a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -191,7 +191,7 @@ def preferred_ml_updates(d):
     for v in versions:
         val = d.getVar(v, False)
         pkg = v.replace("PREFERRED_VERSION_", "")
-        if pkg.endswith("-native") or pkg.endswith("-nativesdk"):
+        if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
             continue
         for p in prefixes:
             newname = "PREFERRED_VERSION_" + p + "-" + pkg
@@ -201,7 +201,7 @@ def preferred_ml_updates(d):
     for prov in providers:
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
-        if pkg.endswith("-native") or pkg.endswith("-nativesdk"):
+        if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
             continue
         virt = ""
         if pkg.startswith("virtual/"):
@@ -218,7 +218,7 @@ def preferred_ml_updates(d):
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
     for p in mp:
-        if p.endswith("-native") or p.endswith("-nativesdk"):
+        if p.endswith("-native") or p.startswith("nativesdk-"):
             continue
         virt = ""
         if p.startswith("virtual/"):
@@ -359,15 +359,18 @@ python () {
                     subs = a.split("/", 1)[1]
                     newappends.append("virtual/" + prefix + subs + extension)
                 else:
-                    newappends.append(prefix + a + extension)
+                    if a.startswith(prefix):
+                        newappends.append(a + extension)
+                    else:
+                        newappends.append(prefix + a + extension)
             return newappends
 
         def appendVar(varname, appends):
             if not appends:
                 return
             if varname.find("DEPENDS") != -1:
-                if pn.endswith("-nativesdk"):
-                    appends = expandFilter(appends, "-nativesdk", "")
+                if pn.startswith("nativesdk-"):
+                    appends = expandFilter(appends, "", "nativesdk-")
                 if pn.endswith("-native"):
                     appends = expandFilter(appends, "-native", "")
                 if mlprefix:
@@ -456,7 +459,7 @@ python () {
 
         dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', True)
 
-        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and not pn.endswith("-cross-canadian-%s" % d.getVar('TRANSLATED_TARGET_ARCH', True)) and not pn.endswith("-nativesdk"):
+        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and not pn.endswith("-cross-canadian-%s" % d.getVar('TRANSLATED_TARGET_ARCH', True)) and not pn.startswith("nativesdk-"):
         # Internally, we'll use the license mapping. This way INCOMPATIBLE_LICENSE = "GPLv2" and
         # INCOMPATIBLE_LICENSE = "GPLv2.0" will pick up all variations of GPL-2.0
             spdx_license = return_spdx(d, dont_want_license)
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ed53118..aec7301 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -52,7 +52,7 @@ LDFLAGS = "${BUILDSDK_LDFLAGS} \
            -Wl,-rpath-link,${STAGING_LIBDIR}/.. \
            -Wl,-rpath,${libdir}/.. "
 
-DEPENDS_GETTEXT = "gettext-native gettext-nativesdk"
+DEPENDS_GETTEXT = "gettext-native nativesdk-gettext"
 
 # Path mangling needed by the cross packaging
 # Note that we use := here to ensure that libdir and includedir are
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index f196df5..0da10a1 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -33,10 +33,10 @@ python do_distrodata_np() {
 	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
-	if pn.find("-nativesdk") != -1:
-	    pnstripped = pn.split("-nativesdk")
+	if pn.find("nativesdk-") != -1:
+	    pnstripped = pn.replace("nativesdk-", "")
 	    bb.note("Native Split: %s" % pnstripped)
-	    localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d.getVar('OVERRIDES', True))
+	    localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.getVar('OVERRIDES', True))
 	    bb.data.update_data(localdata)
 
 	if pn.find("-cross") != -1:
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8b6f054..6de14e0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -195,7 +195,7 @@ def package_qa_check_dev(path, name, d, elf, messages):
     Check for ".so" library symlinks in non-dev packages
     """
 
-    if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-nativesdk") and path.endswith(".so") and os.path.islink(path):
+    if not name.endswith("-dev") and not name.endswith("-dbg") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
         messages.append("non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
@@ -726,7 +726,7 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
         if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
             gt = "gettext-native"
         elif bb.data.inherits_class('cross-canadian', d):
-            gt = "gettext-nativesdk"
+            gt = "nativesdk-gettext"
         else:
             gt = "virtual/" + ml + "gettext"
         deps = bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 8c0cd5b..3334817 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -52,8 +52,6 @@ baselib = "lib"
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
-PKGSUFFIX = "-nativesdk"
-
 python nativesdk_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
         return
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9abad5e..fc7f3d2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1119,7 +1119,7 @@ python do_package_rpm () {
     targetsys = d.getVar('TARGET_SYS', True)
     targetvendor = d.getVar('TARGET_VENDOR', True)
     package_arch = d.getVar('PACKAGE_ARCH', True) or ""
-    if package_arch not in "all any noarch".split():
+    if package_arch not in "all any noarch".split() and not package_arch.endswith("-nativesdk"):
         ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
         d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
     else:
diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
index ddcf878..5908b7f 100644
--- a/meta/classes/pkgconfig.bbclass
+++ b/meta/classes/pkgconfig.bbclass
@@ -2,6 +2,6 @@ DEPENDS_prepend = "pkgconfig-native "
 
 PKGCONFIGRDEP = "pkgconfig"
 PKGCONFIGRDEP_virtclass-native = ""
-PKGCONFIGRDEP_virtclass-nativesdk = "pkgconfig-nativesdk"
+PKGCONFIGRDEP_virtclass-nativesdk = "nativesdk-pkgconfig"
 
 RDEPENDS_${PN}-dev += "${PKGCONFIGRDEP}"
diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index e5bb540..f64a911 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -4,3 +4,4 @@
 inherit populate_sdk_base
 
 addtask populate_sdk after do_install before do_build
+
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a1cb12a..c9fb00d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -7,7 +7,7 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK ?= "nativesdk-task-sdk-host task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7dfeda3..1d56813 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -194,7 +194,7 @@ EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
 # otherwise it is the same as PN and P
-SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -nativesdk -crosssdk -cross-canadian"
+SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -crosssdk -cross-canadian"
 BPN = "${@base_prune_suffix(d.getVar('PN', True), d.getVar('SPECIAL_PKGSUFFIX', True).split(), d)}"
 BP = "${BPN}-${PV}"
 
@@ -250,7 +250,7 @@ PROVIDES = ""
 PROVIDES_prepend = "${P} ${PF} ${PN} "
 RPROVIDES = ""
 
-MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/libintl-nativesdk virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"
+MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/nativesdk-libintl virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"
 
 SOLIBS = ".so.*"
 SOLIBS_darwin = ".*.dylib"
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 28d2f8e..2d8a17d 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -27,12 +27,12 @@ PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
 PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
 PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
 PREFERRED_PROVIDER_libgcc ?= "libgcc"
-PREFERRED_PROVIDER_libgcc-nativesdk ?= "libgcc-nativesdk"
+PREFERRED_PROVIDER_nativesdk-libgcc ?= "nativesdk-libgcc"
 PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
-PREFERRED_PROVIDER_linux-libc-headers-nativesdk ?= "linux-libc-headers-nativesdk"
+PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?= "nativesdk-linux-libc-headers"
 PREFERRED_PROVIDER_matchbox-panel ?= "matchbox-panel-2"
 PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
-PREFERRED_PROVIDER_opkg-nativesdk ?= "opkg-nativesdk"
+PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 4f5607f..1c9e7e9 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -9,10 +9,10 @@ LIBCOVERRIDE = ":libc-glibc"
 OVERRIDES .= "${LIBCOVERRIDE}"
 
 PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
-PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "eglibc-nativesdk"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
-PREFERRED_PROVIDER_virtual/libc-nativesdk ?= "eglibc-nativesdk"
+PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/libc-locale ?= "eglibc-locale"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2bfa225..9193691 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,9 +12,9 @@ PREFERRED_PROVIDER_gdb = "gdb"
 
 # Default libc config
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${TCLIBC}"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?= "${TCLIBC}-nativesdk"
+PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?= "nativesdk-${TCLIBC}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk = "${TCLIBC}-initial-nativesdk"
+PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial = "nativesdk-${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.7%"
@@ -33,20 +33,20 @@ PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
-PREFERRED_VERSION_gcc-runtime-nativesdk ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
-PREFERRED_VERSION_libgcc-nativesdk ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
-PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-locale            ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-eglibc         ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-initial           ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-initial-nativesdk ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_uclibc                   ?= "${UCLIBCVERSION}"
 PREFERRED_VERSION_uclibc-initial           ?= "${UCLIBCVERSION}"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 20d94b2..50b4027 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -7,7 +7,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isCross(x):
         return x.endswith("-cross") or x.endswith("-cross-initial") or x.endswith("-cross-intermediate")
     def isNativeSDK(x):
-        return x.endswith("-nativesdk")
+        return x.startswith("nativesdk-")
     def isKernel(fn):
         inherits = " ".join(dataCache.inherits[fn])
         return inherits.find("module-base.bbclass") != -1 or inherits.find("linux-kernel-base.bbclass") != -1
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 1984c74..8f35f56 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
 X11DEPENDS = "virtual/libx11 libsm"
 DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
-DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
+DEPENDS_virtclass-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
 
 INC_PR = "r3"
 
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index d6bdcb5..296afde 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -17,7 +17,7 @@ do_compile[noexec] = "1"
 
 # default to disabled 
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
-ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-locale-nativesdk = "0"
+ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-eglibc-locale = "0"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
@@ -29,16 +29,13 @@ LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
 PR = "r22"
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+PROVIDES = "virtual/libc-locale"
 
-PROVIDES = "virtual/libc-locale${PKGSUFFIX}"
-
-PACKAGES = "localedef${PKGSUFFIX} ${PN}-dbg"
+PACKAGES = "localedef ${PN}-dbg"
 
 PACKAGES_DYNAMIC = "locale-base-* \
                     eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
-                    glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
+                    glibc-gconv-*  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
 
 # Create a eglibc-binaries package
 ALLOW_EMPTY_${BPN}-binaries = "1"
@@ -67,7 +64,7 @@ DESCRIPTION_localedef = "eglibc: compile locale definition files"
 # Explicitly add ${MLPREFIX} for FILES_eglibc-gconv.
 FILES_${MLPREFIX}eglibc-gconv = "${libdir}/gconv/*"
 FILES_${PN}-dbg += "${libdir}/gconv/.debug/*"
-FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
+FILES_localedef = "${bindir}/localedef"
 
 LOCALETREESRC = "${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}"
 
@@ -93,6 +90,6 @@ do_install () {
 
 inherit libc-package
 
-do_install[depends] += "virtual/${MLPREFIX}libc${PKGSUFFIX}:do_populate_sysroot"
+do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index af78456..bd46cb8 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -17,47 +17,44 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-
-PACKAGES = "${PN}-dbg catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-mtrace ${PN}-utils eglibc-thread-db${PKGSUFFIX} ${PN}-pic libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN} eglibc-extra-nss${PKGSUFFIX}" 
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN} eglibc-extra-nss" 
 
 # The ld.so in this eglibc supports the GNU_HASH
-RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
-RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
-RPROVIDES_${PN}-mtrace = "glibc${PKGSUFFIX}-mtrace libc-mtrace"
-RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
-RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
-RPROVIDES_${PN}-staticdev = "glibc${PKGSUFFIX}-staticdev"
-RPROVIDES_${PN}-doc = "glibc${PKGSUFFIX}-doc"
-RPROVIDES_eglibc-extra-nss${PKGSUFFIX} = "glibc-extra-nss${PKGSUFFIX}"
-RPROVIDES_eglibc-thread-db${PKGSUFFIX} = "glibc-thread-db${PKGSUFFIX}"
-RPROVIDES_${PN}-pcprofile = "glibc${PKGSUFFIX}-pcprofile"
-RPROVIDES_${PN}-dbg = "glibc-dbg${PKGSUFFIX}"
+RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
+RPROVIDES_${PN}-utils = "glibc-utils"
+RPROVIDES_${PN}-mtrace = "glibc-mtrace libc-mtrace"
+RPROVIDES_${PN}-pic = "glibc-pic"
+RPROVIDES_${PN}-dev = "glibc-dev"
+RPROVIDES_${PN}-staticdev = "glibc-staticdev"
+RPROVIDES_${PN}-doc = "glibc-doc"
+RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
+RPROVIDES_eglibc-thread-db = "glibc-thread-db"
+RPROVIDES_${PN}-pcprofile = "glibc-pcprofile"
+RPROVIDES_${PN}-dbg = "glibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
-FILES_ldd${PKGSUFFIX} = "${bindir}/ldd"
-FILES_libsegfault${PKGSUFFIX} = "${base_libdir}/libSegFault*"
-FILES_libcidn${PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
-FILES_libmemusage${PKGSUFFIX} = "${base_libdir}/libmemusage.so"
-FILES_eglibc-extra-nss${PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
-FILES_sln${PKGSUFFIX} = "/sbin/sln"
+FILES_ldd = "${bindir}/ldd"
+FILES_libsegfault = "${base_libdir}/libSegFault*"
+FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
+FILES_libmemusage = "${base_libdir}/libmemusage.so"
+FILES_eglibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
+FILES_sln = "/sbin/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
-FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
+FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-dev += "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
-FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
+FILES_nscd = "${sbindir}/nscd*"
 FILES_${PN}-mtrace = "${bindir}/mtrace"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
-FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
-RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
+FILES_catchsegv = "${bindir}/catchsegv"
+RDEPENDS_catchsegv = "libsegfault"
 RDEPENDS_${PN}-utils += "bash"
 RDEPENDS_${PN}-mtrace += "perl"
 FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
-FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
+FILES_eglibc-thread-db = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
 RPROVIDES_${PN}-dev += "libc-dev"
 RPROVIDES_${PN}-staticdev += "libc-staticdev"
 
@@ -65,8 +62,8 @@ SUMMARY_sln = "The static ln."
 DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
 SUMMARY_nscd = "Name service cache daemon"
 DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups for the passwd, group and hosts information.  It can damatically improvide performance with remote, such as NIS or NIS+, name services."
-SUMMARY_eglibc-extra-nss${PKGSUFFIX} = "hesiod, NIS and NIS+ nss libraries"
-DESCRIPTION_eglibc-extra-nss${PKGSUFFIX} = "eglibc: nis, nisplus and hesiod search services."
+SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
+DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
 SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 8f7cd69..1dd3a92 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -5,7 +5,7 @@ PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
-DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk ${BPN}-native"
+DEPENDS_virtclass-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 3540cd5..f2eb246 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -15,7 +15,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0-native zip virtual/libiconv"
 DEPENDS_virtclass-native = "pkgconfig-native gettext-native"
-DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
+DEPENDS_virtclass-nativesdk = "nativesdk-libtool"
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
diff --git a/meta/recipes-core/meta/external-python-tarball.bb b/meta/recipes-core/meta/external-python-tarball.bb
index e317ba3..2085acc 100644
--- a/meta/recipes-core/meta/external-python-tarball.bb
+++ b/meta/recipes-core/meta/external-python-tarball.bb
@@ -16,25 +16,25 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
 
 TOOLCHAIN_HOST_TASK ?= "\
-    python-nativesdk-core \
-    python-nativesdk-textutils \
-    python-nativesdk-sqlite3 \
-    python-nativesdk-pickle \
-    python-nativesdk-logging \
-    python-nativesdk-elementtree \
-    python-nativesdk-curses \
-    python-nativesdk-compile \
-    python-nativesdk-compiler \
-    python-nativesdk-fcntl \
-    python-nativesdk-shell \
-    python-nativesdk-misc \
-    python-nativesdk-multiprocessing \
-    python-nativesdk-subprocess \
-    python-nativesdk-xmlrpc \
-    python-nativesdk-netclient \
-    python-nativesdk-netserver \
-    python-nativesdk-distutils \
-    chrpath-nativesdk \
+    nativesdk-python-core \
+    nativesdk-python-textutils \
+    nativesdk-python-sqlite3 \
+    nativesdk-python-pickle \
+    nativesdk-python-logging \
+    nativesdk-python-elementtree \
+    nativesdk-python-curses \
+    nativesdk-python-compile \
+    nativesdk-python-compiler \
+    nativesdk-python-fcntl \
+    nativesdk-python-shell \
+    nativesdk-python-misc \
+    nativesdk-python-multiprocessing \
+    nativesdk-python-subprocess \
+    nativesdk-python-xmlrpc \
+    nativesdk-python-netclient \
+    nativesdk-python-netserver \
+    nativesdk-python-distutils \
+    nativesdk-chrpath \
     "
 
 TOOLCHAIN_OUTPUTNAME ?= "python-nativesdk-standalone-${SDKMACHINE}"
diff --git a/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb b/meta/recipes-core/tasks/nativesdk-task-sdk-host.bb
index 920f359..ea054bc 100644
--- a/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb
+++ b/meta/recipes-core/tasks/nativesdk-task-sdk-host.bb
@@ -15,21 +15,21 @@ inherit nativesdk
 PACKAGES = "${PN}"
 
 RDEPENDS_${PN} = "\
-    pkgconfig-nativesdk \
-    qemu-nativesdk \
-    qemu-helper-nativesdk \
-    pseudo-nativesdk \
-    unfs-server-nativesdk \
-    opkg-nativesdk \
-    libtool-nativesdk \
-    autoconf-nativesdk \
-    automake-nativesdk \
+    nativesdk-pkgconfig \
+    nativesdk-qemu \
+    nativesdk-qemu-helper \
+    nativesdk-pseudo \
+    nativesdk-unfs-server \
+    nativesdk-opkg \
+    nativesdk-libtool \
+    nativesdk-autoconf \
+    nativesdk-automake \
     "
 
 RDEPENDS_${PN}_darwin8 = "\
     odcctools-cross-canadian \
     llvm-cross-canadian \
-    pkgconfig-nativesdk \
-    opkg-nativesdk \
-    libtool-nativesdk \
+    nativesdk-pkgconfig \
+    nativesdk-opkg \
+    nativesdk-libtool \
     "
diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 4f5a5b2..e80a834 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -7,10 +7,10 @@ HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
 DEPENDS += "m4-native"
 DEPENDS_virtclass-native = "m4-native gnu-config-native"
-DEPENDS_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+DEPENDS_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
 RDEPENDS_${PN} = "m4 gnu-config"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
diff --git a/meta/recipes-devtools/automake/automake_1.12.1.bb b/meta/recipes-devtools/automake/automake_1.12.1.bb
index 2a97bcc..700592c 100644
--- a/meta/recipes-devtools/automake/automake_1.12.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.1.bb
@@ -28,7 +28,7 @@ RDEPENDS_${PN} += "\
     perl-module-vars "
 
 RDEPENDS_${PN}_virtclass-native = "autoconf-native perl-native-runtime"
-RDEPENDS_${PN}_virtclass-nativesdk = "autoconf-nativesdk"
+RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-autoconf"
 
 PATHFIXPATCH = "file://path_prog_fixes.patch"
 PATHFIXPATCH_virtclass-native = ""
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index a23531c..4658bad 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -4,7 +4,7 @@ DESCRIPTION = "A GNU collection of cross-canadian binary utilities for ${TARGET_
 PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
-DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/libc-nativesdk zlib-nativesdk gettext-nativesdk"
+DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext"
 EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 "
 do_install () {
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index cc0a3ba..ef861ae 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -4,5 +4,5 @@ DESCRIPTION = "The cross-canadian GNU cc and gcc C compilers for ${TARGET_ARCH}
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gcc"
 
-DEPENDS = "virtual/${HOST_PREFIX}binutils-crosssdk virtual/${TARGET_PREFIX}libc-for-gcc gettext-nativesdk"
+DEPENDS = "virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc gettext"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
index 308e6f5..53c4632 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
@@ -5,8 +5,8 @@ require gcc-cross-canadian.inc
 require gcc-configure-sdk.inc
 require gcc-package-sdk.inc
 
-DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
-RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
+DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
+RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
 
 SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "${target_base_libdir}/"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 0fd82a6..467a3f5 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -6,5 +6,5 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
 
 GCCMULTILIB = "--disable-multilib"
 
-DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/${TARGET_PREFIX}libc-for-gcc-nativesdk gettext-native"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/nativesdk-${TARGET_PREFIX}libc-for-gcc gettext-native"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index c796253..5eaa515 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -4,14 +4,11 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-
 PACKAGES = "\
   ${PN} \
   ${PN}-dev \
   ${PN}-dbg \
-  libgcov${PKGSUFFIX}-dev \
+  libgcov-dev \
   "
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
@@ -19,7 +16,7 @@ FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
-FILES_libgcov${PKGSUFFIX}-dev = " \
+FILES_libgcov-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   "
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
@@ -72,4 +69,4 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 BBCLASSEXTEND = "nativesdk"
 
 INSANE_SKIP_${PN}-dev = "staticdev"
-INSANE_SKIP_${MLPREFIX}libgcov${PKGSUFFIX}-dev = "staticdev"
+INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 2b60698..c947526 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -5,9 +5,9 @@ DESCRIPTION = "cross-canadian gdb for ${TARGET_ARCH} target - GNU debugger"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "ncurses-nativesdk expat-nativesdk gettext-nativesdk readline-nativesdk python-nativesdk"
-RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
-             python-nativesdk-codecs python-nativesdk-netclient"
+DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-readline nativesdk-python"
+RDEPENDS += "nativesdk-python-core nativesdk-python-lang nativesdk-python-re \
+             nativesdk-python-codecs nativesdk-python-netclient"
 
 EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
 
@@ -30,3 +30,4 @@ EOF
 do_install_append() {
 	rm -rf ${D}${exec_prefix}/lib
 }
+
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb b/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
index d4588da..f731360 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
@@ -28,7 +28,7 @@ do_install () {
 		sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
 		    -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > ${D}${bindir}/gnu-configize
 	# In the native case we want the system perl as perl-native can't have built yet
-	if [ "${PN}" != "gnu-config-native" -a "${PN}" != "gnu-config-nativesdk" ]; then
+	if [ "${PN}" != "gnu-config-native" -a "${PN}" != "nativesdk-gnu-config" ]; then
 		sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
 	fi
 	chmod 755 ${D}${bindir}/gnu-configize
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 4de4799..73efbb0 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -29,7 +29,7 @@ do_install () {
 		sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
 		    -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > ${D}${bindir}/gnu-configize
 	# In the native case we want the system perl as perl-native can't have built yet
-	if [ "${PN}" != "gnu-config-native" -a "${PN}" != "gnu-config-nativesdk" ]; then
+	if [ "${PN}" != "gnu-config-native" -a "${PN}" != "nativesdk-gnu-config" ]; then
 		sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
 	fi
 	chmod 755 ${D}${bindir}/gnu-configize
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index a540c0d..78ea6d0 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -117,7 +117,7 @@ OPKG_INSTALL_NATIVE_CMD="$OPKG_INSTALL_CMD  -f $OPKG_CONFIG_FILE -o $NATIVE_INST
 BASE_HOSTSDK_PKGNAMES="pseudo opkg pkgconfig libtool autoconf automake"
 for pkg in $BASE_HOSTSDK_PKGNAMES; do
   echo_info "Installing ${pkg} nativesdk ...\n"
-  $OPKG_INSTALL_NATIVE_CMD ${pkg}-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
+  $OPKG_INSTALL_NATIVE_CMD nativesdk-${pkg} &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
 done
 
@@ -142,15 +142,15 @@ done
 
 if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" = "y" ]; then
   echo_info "\nInstalling qemu native ..."
-  $OPKG_INSTALL_NATIVE_CMD qemu-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
+  $OPKG_INSTALL_NATIVE_CMD nativesdk-qemu &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
-  $OPKG_INSTALL_NATIVE_CMD qemu-helper-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
+  $OPKG_INSTALL_NATIVE_CMD nativesdk-qemu-helper &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
 fi
 
 if [ "$YOCTOADT_NFS_UTIL" == "Y" ] || [ "$YOCTOADT_NFS_UTIL" == "y" ]; then
   echo_info "\nInstalling unfs ..."
-  $OPKG_INSTALL_NATIVE_CMD unfs-server-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
+  $OPKG_INSTALL_NATIVE_CMD nativesdk-unfs-server &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
 fi
 
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 5c7cad3..10cd9d8 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
 DEPENDS_virtclass-native = "curl-native"
-DEPENDS_virtclass-nativesdk = "curl-nativesdk"
+DEPENDS_virtclass-nativesdk = "nativesdk-curl"
 
 PE = "1"
 INC_PR = "r10"
@@ -41,12 +41,12 @@ RDEPENDS_${PN}_virtclass-nativesdk = ""
 PACKAGE_ARCH_update-alternatives-cworth = "all"
 RREPLACES_${PN} = "opkg-nogpg"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg update-alternatives-cworth"
 
-FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so"
-FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
-FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
+FILES_update-alternatives-cworth = "${bindir}/update-alternatives"
+FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg-staticdev = "${libdir}/*.a"
+FILES_libopkg = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
 
 # We need to create the lock directory
 do_install_append() {
@@ -75,9 +75,6 @@ ALTERNATIVE_TARGET[opkg] = "${bindir}/opkg-cl"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-
 # Define a variable to allow distros to run configure earlier.
 # (for example, to enable loading of ethernet kernel modules before networking starts)
 POSTINSTALL_INITPOSITION ?= "98"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 561b30e..9db3805 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -302,6 +302,7 @@ python populate_packages_prepend () {
 }
 
 PACKAGES_DYNAMIC = "perl-module-*"
+PACKAGES_DYNAMIC_virtclass-nativesdk = "nativesdk-perl-module-*"
 
 RPROVIDES_perl-lib = "perl-lib"
 
@@ -311,3 +312,4 @@ require perl-rprovides_${PV}.inc
 
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
 
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 9c648fe..3eb36fc 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -148,11 +148,11 @@ require python-${PYTHON_MAJMIN}-manifest.inc
 RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
-RRECOMMENDS_${PN}-crypt_virtclass-nativesdk = "openssl-nativesdk"
+RRECOMMENDS_${PN}-crypt_virtclass-nativesdk = "nativesdk-openssl"
 
 # package libpython2
-PACKAGES =+ "lib${BPN}2${PKGSUFFIX}"
-FILES_lib${BPN}2${PKGSUFFIX} = "${libdir}/libpython*.so.*"
+PACKAGES =+ "lib${BPN}2"
+FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
 
 # catch debug extensions (isn't that already in python-core-dbg?)
 FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
@@ -166,6 +166,3 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
-
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index df0cae0..fbf9e77 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Qemu helper scripts"
 DESCRIPTION = "Qemu helper scripts"
 LICENSE = "GPLv2"
-RDEPENDS_${PN} = "qemu-nativesdk"
+RDEPENDS_${PN} = "nativesdk-qemu"
 PR = "r9"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-helper"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9cb4aee..bdb566d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -22,7 +22,7 @@ inherit autotools
 do_configure() {
     # Handle distros such as CentOS 5 32-bit that do not have kvm support
     KVMOPTS="--disable-kvm"
-    if [ "${PN}" != "qemu-native" -a "${PN}" != "qemu-nativesdk" ] \
+    if [ "${PN}" != "qemu-native" -a "${PN}" != "nativesdk-qemu" ] \
        || [ -f /usr/include/linux/kvm.h ] ; then
        KVMOPTS="--enable-kvm"
     fi
@@ -41,8 +41,8 @@ do_install () {
 PACKAGECONFIG ??= ""
 
 DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native"
-DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk glib-2.0-nativesdk"
-RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
+DEPENDS_virtclass-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0"
+RDEPENDS_virtclass-nativesdk = "nativesdk-libsdl"
 EXTRA_OECONF_virtclass-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
 				--disable-curl \
 				"
diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
index d03c153..7480638 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
+++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 RDEPENDS_${PN} = "pseudo"
 RDEPENDS_${PN}_virtclass-native = "pseudo-native"
-RDEPENDS_${PN}_virtclass-nativesdk = "pseudo-nativesdk"
+RDEPENDS_${PN}_virtclass-nativesdk = "nativesdk-pseudo"
 BASEPV = "2.2beta47"
 PR = "r1"
 
@@ -73,6 +73,6 @@ python __anonymous () {
     import re
 
     pn = d.getVar("PN", True)
-    if not pn.endswith('-native') and not pn.endswith('-nativesdk'):
+    if not pn.endswith('-native') and not pn.startswith('nativesdk-'):
         raise bb.parse.SkipPackage("unfs-server is intended for native/nativesdk builds only")
 }
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 50f2ff6..384eb62 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -39,3 +39,4 @@ SRC_URI[patch009.sha256sum] = "e7ed5440b4c19765786e90e4f1ded43195d38b3e4d1c4b39f
 SRC_URI[patch010.md5sum] = "0a51602b535ef661ee707be6c8bdb373"
 SRC_URI[patch010.sha256sum] = "acfc5482c25e6923116fcf4b4f7f6345b80f75ad7299749db4b736ad67aa43dc"
 
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index e0c710b..5f92deb 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -43,4 +43,5 @@ SECTION_libbz2-staticdev = "devel"
 RDEPENDS_libbz2-staticdev = "libbz2-dev (= ${EXTENDPKGV})"
 
 PROVIDES_append_virtclass-native = " bzip2-replacement-native"
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 8b39442..b05840a 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -16,7 +16,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
-DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
+DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 PR = "r0"
 
diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
index 32980d3..9cf0436 100644
--- a/meta/recipes-graphics/mesa/qemugl_git.bb
+++ b/meta/recipes-graphics/mesa/qemugl_git.bb
@@ -25,7 +25,7 @@ DEFAULT_PREFERENCE = "-1"
 
 do_install () {
 	install -d ${D}${libdir}/
-    if [ "${PN}" != "qemugl-nativesdk" ]; then
+    if [ "${PN}" != "nativesdk-qemugl" ]; then
         install -m 0755 ${S}/libGL.so.1.2 ${D}${libdir}/libGL-qemu.so.1.2
     else
 	    install -m 0755 ${S}/libGL.so.1.2 ${D}${libdir}/libGL.so.1.2
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 059aca7..3f94e98 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -4,7 +4,7 @@ require systemtap_git.inc
 
 DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
-DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
+DEPENDS_virtclass-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext"
 
 PR = "r0"
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
index 08da5cd..7914bb9 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
@@ -31,22 +31,19 @@ EXTRA_OECONF = "--with-cards=pdaudiocf --with-oss=yes --disable-python"
 
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-
-PACKAGES =+ "alsa-server${PKGSUFFIX} libasound${PKGSUFFIX} alsa-conf-base${PKGSUFFIX} alsa-conf${PKGSUFFIX} alsa-doc${PKGSUFFIX} alsa-dev${PKGSUFFIX}"
+PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc alsa-dev"
 FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
 FILES_${PN}-dbg += "${libdir}/${BPN}/smixer/.debug"
 FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
-FILES_libasound${PKGSUFFIX} = "${libdir}/libasound.so.*"
-FILES_alsa-server${PKGSUFFIX} = "${bindir}/*"
-FILES_alsa-conf${PKGSUFFIX} = "${datadir}/alsa/"
-FILES_alsa-dev${PKGSUFFIX} += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
-FILES_alsa-conf-base${PKGSUFFIX} = "\
+FILES_libasound = "${libdir}/libasound.so.*"
+FILES_alsa-server = "${bindir}/*"
+FILES_alsa-conf = "${datadir}/alsa/"
+FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
+FILES_alsa-conf-base = "\
 ${datadir}/alsa/alsa.conf \
 ${datadir}/alsa/cards/aliases.conf \
 ${datadir}/alsa/pcm/default.conf \
 ${datadir}/alsa/pcm/dmix.conf \
 ${datadir}/alsa/pcm/dsnoop.conf"
 
-RDEPENDS_libasound${PKGSUFFIX} = "alsa-conf-base${PKGSUFFIX}"
+RDEPENDS_libasound = "alsa-conf-base"
diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt/meta/meta-toolchain-qte.bb
index 735ccd1..116db91 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -1,6 +1,6 @@
 # Qt Embedded toolchain
 PR = "r5"
-TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK = "nativesdk-task-qte-toolchain-host task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_TARGET_TASK = "task-qte-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-qte-${DISTRO_VERSION}"
 
diff --git a/meta/recipes-qt/qt4/files/qt-dbus-const.patch b/meta/recipes-qt/qt4/files/qt-dbus-const.patch
index f3de77e..6ee402f 100644
--- a/meta/recipes-qt/qt4/files/qt-dbus-const.patch
+++ b/meta/recipes-qt/qt4/files/qt-dbus-const.patch
@@ -1,4 +1,4 @@
-Remove "const" usage that causes compile failure building qt4-tools-nativesdk
+Remove "const" usage that causes compile failure building nativesdk-qt4-tools
 
 Upstream-Status: Denied [possible retry]
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
index e17a8ad..e17a8ad 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
diff --git a/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb b/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb
new file mode 100644
index 0000000..5098d11
--- a/dev/null
+++ b/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb
@@ -0,0 +1,7 @@
+require recipes-core/tasks/nativesdk-task-sdk-host.bb
+
+DESCRIPTION = "Host packages for Qt Embedded SDK"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+
+RDEPENDS_${PN} += "nativesdk-qt4-tools"
diff --git a/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb b/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb
deleted file mode 100644
index cfa45ef..0000000
--- a/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb
+++ b/dev/null
@@ -1,7 +0,0 @@
-require recipes-core/tasks/task-sdk-host-nativesdk.bb
-
-DESCRIPTION = "Host packages for Qt Embedded SDK"
-LICENSE = "MIT"
-ALLOW_EMPTY = "1"
-
-RDEPENDS_${PN} += "qt4-tools-nativesdk"
diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
index 418e29c..dad5572 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.26.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native openssl-native"
-DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
+DEPENDS_virtclass-nativesdk = "nativesdk-zlib"
 PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 79542fe..0cc5d65 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -17,17 +17,14 @@ export config_TARGET_LINK = "${CCLD}"
 export config_TARGET_CFLAGS = "${CFLAGS}"
 export config_TARGET_LFLAGS = "${LDFLAGS}"
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-
-PACKAGES = "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}${PKGSUFFIX}-doc ${PN}-dbg lib${BPN}${PKGSUFFIX}-staticdev ${PN}"
+PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 
 FILES_${PN} = "${bindir}/*"
-FILES_lib${BPN}${PKGSUFFIX} = "${libdir}/*.so.*"
-FILES_lib${BPN}${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so \
+FILES_lib${BPN} = "${libdir}/*.so.*"
+FILES_lib${BPN}-dev = "${libdir}/*.la ${libdir}/*.so \
 	                	   ${libdir}/pkgconfig ${includedir}"
-FILES_lib${BPN}${PKGSUFFIX}-doc = "${docdir} ${mandir} ${infodir}"
-FILES_lib${BPN}${PKGSUFFIX}-staticdev = "${libdir}/lib*.a"
-AUTO_LIBNAME_PKGS = "lib${BPN}${PKGSUFFIX}"
+FILES_lib${BPN}-doc = "${docdir} ${mandir} ${infodir}"
+FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
+AUTO_LIBNAME_PKGS = "lib${BPN}"
 
 BBCLASSEXTEND = "native nativesdk"




