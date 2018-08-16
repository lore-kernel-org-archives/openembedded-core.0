Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1BF7925E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:26:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2018 23:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,246,1531810800"; d="scan'208";a="77227740"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.195])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2018 23:26:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 14:26:33 +0800
Message-Id: <20180816062633.29868-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: enable profile optimized builds
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
X-List-Received-Date: Thu, 16 Aug 2018 06:26:42 -0000

Enable profile guided optimization (pgo) for python3. Enabling pgo in
python is generally as simple as invoking the target profile-opt which:

- builds python binaries with profile instrumentation enabled,
- runs a specific profile task using that python to get the profile
data and,
- feeds the compiler with this profile data and rebuilds python.

This change invokes qemu-user for the second step of running a profile
task using target python. Depending on how long profile task takes to
run, this might add a significant time to compilation (which would be
true for native builds too). The default profile task can be changed by
the users depending on what makes sense for their use case (or can be
left empty). In case qemu-user isn't supported, profile task won't be run.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...d-target-to-split-profile-generation.patch | 40 +++++++++++++
 ...GS-for-extensions-when-cross-compili.patch | 56 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.5.bb | 55 +++++++++++-------
 3 files changed, 130 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch

diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
new file mode 100644
index 0000000000..bb01c5bcb4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
@@ -0,0 +1,40 @@
+From 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Tue, 7 Aug 2018 16:43:17 +0800
+Subject: [PATCH 2/2] Makefile: add target to split profile generation
+
+We don't want to have profile task invoked from here and want to use
+qemu-user instead. Split the profile-opt task so qemu can be invoked
+once binaries have been built with instrumentation and then we can go
+ahead and build again using the profile data generated.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Makefile.pre.in | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 84bc3ff..017a2c4 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -469,13 +469,11 @@ profile-opt:
+ 	$(MAKE) profile-removal
+ 	$(MAKE) build_all_generate_profile
+ 	$(MAKE) profile-removal
+-	@echo "Running code to generate profile data (this can take a while):"
+-	$(MAKE) run_profile_task
+-	$(MAKE) build_all_merge_profile
++
++clean_and_use_profile:
+ 	@echo "Rebuilding with profile guided optimizations:"
+ 	$(MAKE) clean
+ 	$(MAKE) build_all_use_profile
+-	$(MAKE) profile-removal
+ 
+ build_all_generate_profile:
+ 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
new file mode 100644
index 0000000000..ae74ef531d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
@@ -0,0 +1,56 @@
+From 7fd121bb7d6c25c2e0a1c31cf76fb9bd4a9794de Mon Sep 17 00:00:00 2001
+From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+Date: Tue, 14 Aug 2018 14:11:35 +0800
+Subject: [PATCH 1/2] Use correct CFLAGS for extensions when cross-compiling
+
+Take PY_CFLAGS_NODIST into account, like in native build. This is needed
+in order to to profile-optimized build. Also, pass EXTRA_CFLAGS to
+profile-optimized build.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ Makefile.pre.in | 4 ++--
+ setup.py        | 3 ++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index e2d5d3d..84bc3ff 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -478,7 +478,7 @@ profile-opt:
+ 	$(MAKE) profile-removal
+ 
+ build_all_generate_profile:
+-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
+ 
+ run_profile_task:
+ 	: # FIXME: can't run for a cross build
+@@ -488,7 +488,7 @@ build_all_merge_profile:
+ 	$(LLVM_PROF_MERGER)
+ 
+ build_all_use_profile:
+-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
+ 
+ # Compile and run with gcov
+ .PHONY=coverage coverage-lcov coverage-report
+diff --git a/setup.py b/setup.py
+index add3346..65e83b1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):
+         # compilers
+         if compiler is not None:
+             if cross_compiling:
+-                (ccshared,cflags) = (os.environ.get('CCSHARED') or '', os.environ.get('CFLAGS') or '')
++                (ccshared,cflags) = (os.environ.get('CCSHARED') or '',
++                                     (os.environ.get('CFLAGS') or '') + ' ' + sysconfig.get_config_var('PY_CFLAGS_NODIST'))
+             else:
+                 (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
+             args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 50f63e39c1..beaf3dc0ca 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -1,6 +1,6 @@
 require recipes-devtools/python/python.inc
 
-DEPENDS = "python3-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz"
+DEPENDS = "python3-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz qemu-native qemu-helper-native"
 
 PR = "${INC_PR}.0"
 PYTHON_MAJMIN = "3.5"
@@ -37,6 +37,8 @@ SRC_URI += "\
             file://configure.ac-fix-LIBPL.patch \
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
+            file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
+            file://0002-Makefile-add-target-to-split-profile-generation.patch \
            "
 SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
 SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
@@ -48,7 +50,7 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools multilib_header python3native pkgconfig update-alternatives
+inherit autotools multilib_header python3native pkgconfig update-alternatives qemu
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
@@ -69,7 +71,8 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
-EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
+EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip --enable-optimizations"
+PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 10"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 export _PYTHON_PROJECT_BASE = "${B}"
@@ -102,7 +105,6 @@ do_compile() {
         sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
         cd -
 
-
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
 
@@ -121,23 +123,34 @@ do_compile() {
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
+        oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+                STAGING_LIBDIR=${STAGING_LIBDIR} \
+                STAGING_INCDIR=${STAGING_INCDIR} \
+                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+                LIB=${baselib} \
+                ARCH=${TARGET_ARCH} \
+                OPT="${CFLAGS}" profile-opt
+
+        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+                qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
+                cat > pgo-image-qemuwrapper << EOF
+#!/bin/sh
+set -x
+$qemu_binary "\$@"
+EOF
+                chmod +x pgo-image-qemuwrapper
+                ./pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK} || true
+	fi
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		LIB=${baselib} \
-		ARCH=${TARGET_ARCH} \
-		OPT="${CFLAGS}"
+        oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+                STAGING_LIBDIR=${STAGING_LIBDIR} \
+                STAGING_INCDIR=${STAGING_INCDIR} \
+                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+                LIB=${baselib} \
+                ARCH=${TARGET_ARCH} \
+                OPT="${CFLAGS}" clean_and_use_profile
 }
 
 do_install() {
@@ -157,7 +170,7 @@ do_install() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
-		DESTDIR=${D} LIBDIR=${libdir}
+		DESTDIR=${D} LIBDIR=${libdir} build_all_use_profile
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-- 
2.17.1


