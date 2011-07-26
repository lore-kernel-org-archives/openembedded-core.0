Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlpdC-0007sZ-PQ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:39 +0200
Received: by rex (Postfix, from userid 1000)
	id 2710620284; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:08 +0100
Message-Id: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/8] multilib: Add support for compiling recipes against multiple ABIs
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
X-List-Received-Date: Tue, 26 Jul 2011 21:57:39 -0000

This patch adds the core multilib class which can be used along with a
parameter specifying the mutlilib to use in BBCLASSEXTEND.

The MLPREFIX variable is added and can be used in cases where its too
difficult to dynmaically work out where a mutltilib prefix is needed
to be added to a variable.

This includes:
  * SHLIBSDIR and PACKAGE_ARCH fixes from Lianhao Lu.
  * PACKAGE_DYNAMIC mapping from Yu Ke
  * PACKAGE_INSTALL mapping from Yu Ke
  * RPROVIDES mapping from Yu Ke
  * TARGET_VENDOR fix from Mark Hatle
  * Ignorning *-native-runtime dependnecies as well as *-native from Yu Ke

Signed-off-by: Yu Ke <ke.yu@intel.com>
Signed-off-by: Xu Dongxiao <dongxiao.xu@intel.com>
Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass          |    2 +-
 meta/classes/insane.bbclass             |    3 +-
 meta/classes/multilib.bbclass           |   87 +++++++++++++++++++++++++++++++
 meta/classes/package.bbclass            |   11 ++++
 meta/conf/bitbake.conf                  |    1 +
 meta/conf/local.conf.sample             |    5 ++
 meta/conf/multilib.conf                 |   24 +++++++++
 meta/recipes-core/dbus/dbus.inc         |    8 +--
 meta/recipes-devtools/gcc/libgcc_4.6.bb |    6 +-
 9 files changed, 137 insertions(+), 10 deletions(-)
 create mode 100644 meta/classes/multilib.bbclass
 create mode 100644 meta/conf/multilib.conf

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index ed5637e..e5c13ae 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -9,7 +9,7 @@ def autotools_dep_prepend(d):
 		return deps
 	deps += 'autoconf-native automake-native help2man-native '
 
-	if not pn in ['libtool', 'libtool-native', 'libtool-cross']:
+	if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
 		deps += 'libtool-native '
 		if not bb.data.inherits_class('native', d) \
                         and not bb.data.inherits_class('cross', d) \
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d56c9ed..5fb0d98 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -571,12 +571,13 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
 
     cnf = bb.data.getVar('EXTRA_OECONF', d, True) or ""
     if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True) and "--disable-nls" not in cnf:
+       ml = d.getVar("MLPREFIX", True) or ""
        if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
           gt = "gettext-native"
        elif bb.data.inherits_class('cross-canadian', d):
           gt = "gettext-nativesdk"
        else:
-          gt = "virtual/gettext"
+          gt = "virtual/" + ml + "gettext"
        deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
        if gt not in deps:
           for config in configs:
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
new file mode 100644
index 0000000..ceed990
--- /dev/null
+++ b/meta/classes/multilib.bbclass
@@ -0,0 +1,87 @@
+python multilib_virtclass_handler () {
+    if not isinstance(e, bb.event.RecipePreFinalise):
+        return
+
+    cls = e.data.getVar("BBEXTENDCURR", True)
+    variant = e.data.getVar("BBEXTENDVARIANT", True)
+    if cls != "multilib" or not variant:
+        return
+ 
+    override = ":virtclass-multilib-" + variant
+
+    e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
+    e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
+    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
+    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
+}
+
+addhandler multilib_virtclass_handler
+
+STAGINGCC_prepend = "${BBEXTENDVARIANT}-"
+
+python __anonymous () {
+    variant = d.getVar("BBEXTENDVARIANT", True)
+    d.setVar("MLPREFIX", variant + "-")
+
+    def extend_name(name):
+        if name.startswith("virtual/"):
+            subs = name.split("/", 1)[1]
+            if not subs.startswith(variant):
+                return "virtual/" + variant + "-" + subs
+            return name
+        if not name.startswith(variant):
+            return variant + "-" + name
+        return name
+
+    def map_dependencies(varname, d, suffix = ""):
+        if suffix:
+            varname = varname + "_" + suffix
+        deps = d.getVar(varname, True)
+        if not deps:
+            return
+        deps = bb.utils.explode_deps(deps)
+        newdeps = []
+        for dep in deps:
+            if dep.endswith(("-native", "-native-runtime")):
+                newdeps.append(dep)
+            else:
+                newdeps.append(extend_name(dep))
+        d.setVar(varname, " ".join(newdeps))
+
+    def map_variable(varname, d):
+        var = d.getVar(varname, True)
+        if not var:
+            return
+        var = var.split()
+        newvar = []
+        for v in var:
+            newvar.append(extend_name(v))
+        d.setVar(varname, " ".join(newvar))
+
+    pkgs = []
+    pkgrename = {}
+    for pkg in (d.getVar("PACKAGES", True) or "").split():
+        if pkg.startswith(variant):
+            pkgs.append(pkg)
+            continue
+        pkgrename[pkg] = extend_name(pkg)
+        pkgs.append(pkgrename[pkg])
+
+    if pkgrename:
+        d.setVar("PACKAGES", " ".join(pkgs))
+        for pkg in pkgrename:
+            for subs in ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS"]:
+                d.renameVar("%s_%s" % (subs, pkg), "%s_%s" % (subs, pkgrename[pkg]))
+
+    map_dependencies("DEPENDS", d)
+    for pkg in (d.getVar("PACKAGES", True).split() + [""]):
+        map_dependencies("RDEPENDS", d, pkg)
+        map_dependencies("RRECOMMENDS", d, pkg)
+        map_dependencies("RSUGGESTS", d, pkg)
+        map_dependencies("RPROVIDES", d, pkg)
+        map_dependencies("RREPLACES", d, pkg)
+
+    map_variable("PROVIDES", d)
+    map_variable("PACKAGES_DYNAMIC", d)
+    map_variable("PACKAGE_INSTALL", d)
+}
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f2950e2..ea8ad05 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -168,6 +168,17 @@ python () {
         bb.data.setVarFlag('do_package', 'deptask', " ".join(deps), d)
     else:
         d.setVar("PACKAGERDEPTASK", "")
+
+    multilib_archs = []
+    multilibs= d.getVar('MULTILIBS', True) or ""
+    if multilibs:
+        for ext in multilibs.split():
+            eext = ext.split(':')
+            if len(eext) > 1:
+                if eext[0] == 'multilib':
+                    multilib_archs.append('ml' + eext[1])
+
+    d.setVar("MULTILIB_ARCHS", ' '.join(multilib_archs))
 }
 
 def splitfile(file, debugfile, debugsrcdir, d):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 46a9a82..6e109ec 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -735,3 +735,4 @@ BB_SIGNATURE_HANDLER ?= "basic"
 BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH USERNAME STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE"
 
+MLPREFIX ??= ""
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 812b896..4be7b1d 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -189,3 +189,8 @@ NO32LIBS = "1"
 
 # Uncomment this if your host distribution provides the help2man tool.
 #ASSUME_PROVIDED += "help2man-native"
+
+# Uncomment the following lines to enable multilib builds
+#require conf/multilib.conf
+#MULTILIBS = "multilib:lib32"
+#TUNENAME_virtclass-multilib-lib32 = "x86"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
new file mode 100644
index 0000000..894b7a5
--- /dev/null
+++ b/meta/conf/multilib.conf
@@ -0,0 +1,24 @@
+
+baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
+
+MULTILIBS ??= "multilib:lib32"
+BBCLASSEXTEND_append_pn-linux-libc-headers = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-eglibc-initial = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-eglibc = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libgcc = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-gcc-runtime = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libtool-cross = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-zlib = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-binutils-cross = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-gcc-cross-initial = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-gcc-cross-intermediate = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-gcc-cross = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-busybox = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-update-rc.d = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-util-linux = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-gettext = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-bash = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-ncurses = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-expat = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-eglibc-locale = " ${MULTILIBS}"
+
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5f9a8a3..6b76cba 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -5,11 +5,9 @@ SECTION = "base"
 LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
-x11deps = "virtual/libx11 libsm"
-basedeps = "expat virtual/libintl"
-DEPENDS = "${basedeps} ${x11deps}"
-DEPENDS_virtclass-native = "${basedeps}"
-DEPENDS_virtclass-nativesdk = "${basedeps} virtual/libx11"
+DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
+DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
+DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 6a77ce4..a6e1146 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -41,9 +41,9 @@ do_install () {
 	chmod +x ${D}${base_libdir}/libgcc_s.so.*
 }
 
-do_package_write_ipk[depends] += "virtual/libc:do_package"
-do_package_write_deb[depends] += "virtual/libc:do_package"
-do_package_write_rpm[depends] += "virtual/libc:do_package"
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_package"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
1.7.4.1



