Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EDF537319F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:41:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 04:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="35260404"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2017 04:41:05 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 14:40:53 +0200
Message-Id: <20170125124101.29425-3-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
References: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH RFC 02/10] python: add python-profile-opt recipe
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
X-List-Received-Date: Wed, 25 Jan 2017 12:41:09 -0000

This patch adds a new recipe that builds a special version of python
that produces profile data for profile guided optimization. It will
install under /opt in order to prevent clash with the "normal" python.
The new recipe directly includes the base python recipe so that they are
build in as similar way as possible and this hopefully decreases the
recipe maintenance burden, too.

Normally, python profile-guided-optimization is done simply by doing
"make profile-opt" which first builds python with profile
instrumentation enabled, then runs a profile task to get the profile
data, and last, re-builds python with profile data guiding the
optimization. However, in our cross-build environment this gets a lot
trickier. We need to split out the steps as building is done on the
build host but we need to run the second step (i.e. run the profile
task) on the target hardware. This patch enables the first step, i.e.
building python with profile instrumentation enabled

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 .../python/python-profile-opt_2.7.12.bb            | 17 ++++++++++++++
 meta/recipes-devtools/python/python_2.7.12.bb      | 26 +++++++++++++++-------
 2 files changed, 35 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-profile-opt_2.7.12.bb

diff --git a/meta/recipes-devtools/python/python-profile-opt_2.7.12.bb b/meta/recipes-devtools/python/python-profile-opt_2.7.12.bb
new file mode 100644
index 0000000..058cc63
--- /dev/null
+++ b/meta/recipes-devtools/python/python-profile-opt_2.7.12.bb
@@ -0,0 +1,17 @@
+require python_${PV}.bb
+
+PROVIDES += "libpython2"
+RPROVIDES_${PN}-core += "libpython2"
+
+# Use special prefix in order to prevent clash with normal python
+STAGING_INCDIR_DEFAULT = "${STAGING_DIR_HOST}/usr/include"
+STAGING_LIBDIR_DEFAULT = "${STAGING_DIR_HOST}/usr/${baselib}"
+TARGET_CFLAGS += "-I${STAGING_INCDIR_DEFAULT}"
+TARGET_CPPFLAGS += "-I${STAGING_INCDIR_DEFAULT}"
+prefix = "/opt"
+exec_prefix = "/opt"
+
+PYTHON_MAKE_TARGET = "build_all_generate_profile"
+
+# Force pkgdata not to clash with python recipe
+PKG_libpython-profile-opt2 = "libpython-profile-opt2.7-1.0"
diff --git a/meta/recipes-devtools/python/python_2.7.12.bb b/meta/recipes-devtools/python/python_2.7.12.bb
index 9fe35db..b4d6efb 100644
--- a/meta/recipes-devtools/python/python_2.7.12.bb
+++ b/meta/recipes-devtools/python/python_2.7.12.bb
@@ -37,6 +37,11 @@ CONFIGUREOPTS += " --with-system-ffi "
 
 EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
 
+# These are needed in order to build with modified prefix (python-prorile-opt
+# recipe)
+STAGING_INCDIR_DEFAULT ?= "${STAGING_INCDIR}"
+STAGING_LIBDIR_DEFAULT ?= "${STAGING_LIBDIR}"
+
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
         autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
@@ -45,12 +50,12 @@ do_configure_append() {
 do_compile() {
         # regenerate platform specific files, because they depend on system headers
         cd ${S}/Lib/plat-linux2
-        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python-native/python \
+        include=${STAGING_INCDIR_DEFAULT} ${STAGING_BINDIR_NATIVE}/python-native/python \
                 ${S}/Tools/scripts/h2py.py -i '(u_long)' \
-                ${STAGING_INCDIR}/dlfcn.h \
-                ${STAGING_INCDIR}/linux/cdrom.h \
-                ${STAGING_INCDIR}/netinet/in.h \
-                ${STAGING_INCDIR}/sys/types.h
+                ${STAGING_INCDIR_DEFAULT}/dlfcn.h \
+                ${STAGING_INCDIR_DEFAULT}/linux/cdrom.h \
+                ${STAGING_INCDIR_DEFAULT}/netinet/in.h \
+                ${STAGING_INCDIR_DEFAULT}/sys/types.h
         sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
         cd -
 
@@ -60,7 +65,7 @@ do_compile() {
 	if [ ! -f Makefile.orig ]; then
 		install -m 0644 Makefile Makefile.orig
 	fi
-	sed -i -e 's#^LDFLAGS=.*#LDFLAGS=${LDFLAGS} -L. -L${STAGING_LIBDIR}#g' \
+	sed -i -e 's#^LDFLAGS=.*#LDFLAGS=${LDFLAGS} -L. -L${STAGING_LIBDIR_DEFAULT}#g' \
 		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
 		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
 		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
@@ -74,13 +79,17 @@ do_compile() {
 
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	export PYTHONBUILDDIR="${B}"
+    # This is only used in PGO profiling by python-profile-opt package
+    if [ "${PYTHON_MAKE_TARGET}" = "build_all_generate_profile" ]; then
+        export EXTRA_CFLAGS="-fprofile-dir=./python-pgo-profiles/"
+    fi
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		OPT="${CFLAGS}"
+		OPT="${CFLAGS}" ${PYTHON_MAKE_TARGET}
 }
 
 do_install() {
@@ -99,7 +108,8 @@ do_install() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		DESTDIR=${D} LIBDIR=${libdir}
+		DESTDIR=${D} LIBDIR=${libdir} ${PYTHON_MAKE_TARGET}
+
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
-- 
2.10.2


