Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7121278299
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:07:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 03:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236012573"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 03:07:57 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 13:07:46 +0300
Message-Id: <4218a09a5b9dd205004812611b2dc1a6c256b3a4.1509094533.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v5 03/10] python3: add python3-profile-opt recipe
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
X-List-Received-Date: Fri, 27 Oct 2017 10:07:56 -0000

This patch adds a new recipe that builds a special version of python3 that
produces profile data used for optimization.  The new recipe directly includes
the base python recipe so that they are build in as similar way as possible and
this hopefully decreases the recipe maintenance burden, too. Also, its files
clash with the "normal" python3 so they cannot be installed in an image at the
same time.

Normally, profile-guided-optimization in Python is done simply by doing "make
profile-opt" which first builds python with profile instrumentation enabled,
then runs a profile task to get the profile data, and last, re-builds python
with profile data guiding the optimization. However, in our cross-build
environment this gets a lot trickier. We need to split out the steps as
building is done on the build host but we need to run the second step (i.e. run
the profile task) on the target hardware. This patch enables the first step,
i.e.  building python with profile instrumentation enabled

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python3-profile-opt   |  1 +
 .../python/python3-profile-opt_3.5.3.bb            |  9 +++++++
 ...efile-add-install_generate_profile-target.patch | 25 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      | 30 ++++++++++++----------
 4 files changed, 51 insertions(+), 14 deletions(-)
 create mode 120000 meta/recipes-devtools/python/python3-profile-opt
 create mode 100644 meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch

diff --git a/meta/recipes-devtools/python/python3-profile-opt b/meta/recipes-devtools/python/python3-profile-opt
new file mode 120000
index 0000000000..b8a0adbbb9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-profile-opt
@@ -0,0 +1 @@
+python3
\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb b/meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
new file mode 100644
index 0000000000..6940480546
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
@@ -0,0 +1,9 @@
+require python3_${PV}.bb
+
+SRC_URI += "file://Makefile-add-install_generate_profile-target.patch \
+           "
+
+PYTHON3_MAKE_TARGET = "build_all_generate_profile"
+
+RCONFLICTS_${PN}-core = "python3-core"
+RCONFLICTS_lib${BPN} = "libpython3"
diff --git a/meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch b/meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
new file mode 100644
index 0000000000..7aee7fb799
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
@@ -0,0 +1,25 @@
+Makefile: add install_generate_profile target
+
+Making it possible to install the binaries with profile generation
+enabled. We need this as linking is also performed at the install stage.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 2b87614..826155b 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1046,6 +1046,8 @@ QUICKTESTOPTS=	$(TESTOPTS) -x test_subprocess test_io test_lib2to3 \
+ quicktest:	all platform
+ 		$(TESTRUNNER) $(QUICKTESTOPTS)
+ 
++install_generate_profile:
++	$(MAKE) install LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
+ 
+ install: @FRAMEWORKINSTALLFIRST@ commoninstall bininstall maninstall @FRAMEWORKINSTALLLAST@
+ 	if test "x$(ENSUREPIP)" != "xno"  ; then \
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 13df12fe56..3522b74991 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -115,14 +115,10 @@ do_compile() {
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		LIB=${baselib} \
-		ARCH=${TARGET_ARCH} \
-		OPT="${CFLAGS}" libpython3.so
+    if [ "${PYTHON3_MAKE_TARGET}" = "build_all_generate_profile" ]; then
+        # This is only used in PGO profiling by python3-profile-opt package
+        export EXTRA_CFLAGS="-fprofile-dir=./python3-pgo-profiles/"
+    fi
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
@@ -131,7 +127,7 @@ do_compile() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
-		OPT="${CFLAGS}"
+		OPT="${CFLAGS}" ${PYTHON3_MAKE_TARGET}
 }
 
 do_install() {
@@ -151,8 +147,14 @@ do_install() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
-		DESTDIR=${D} LIBDIR=${libdir}
+		DESTDIR=${D} LIBDIR=${libdir} ${PYTHON3_MAKE_TARGET}
 	
+    if [ "${PYTHON3_MAKE_TARGET}" = "build_all_generate_profile" ]; then
+        # Need special make install if pgo generation is enabled
+        _PYTHON3_MAKE_INSTALL_TARGET="install_generate_profile"
+    else
+        _PYTHON3_MAKE_INSTALL_TARGET="install"
+    fi
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -160,7 +162,7 @@ do_install() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
-		DESTDIR=${D} LIBDIR=${libdir} install
+		DESTDIR=${D} LIBDIR=${libdir} ${_PYTHON3_MAKE_INSTALL_TARGET}
 
 	# avoid conflict with 2to3 from Python 2
 	rm -f ${D}/${bindir}/2to3
@@ -209,9 +211,9 @@ PACKAGES =+ "${PN}-pyvenv"
 FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
 
 # package libpython3
-PACKAGES =+ "libpython3 libpython3-staticdev"
-FILES_libpython3 = "${libdir}/libpython*.so.*"
-FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
+PACKAGES =+ "lib${BPN} lib${BPN}-staticdev"
+FILES_lib${BPN} = "${libdir}/libpython*.so.*"
+FILES_lib${BPN}-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython*.a"
 INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
-- 
2.13.6


