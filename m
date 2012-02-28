Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhS-0008QZ-W0
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197475"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:22 -0800
Message-Id: <9c18631b76740bcc5a871eaea2a1348bf707f8aa.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/36] gcc: Stash the gcc-cross builddir to reuse in libgcc and gcc-runtime
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:12 -0000

From: Khem Raj <raj.khem@gmail.com>

Currently we stash the libgcc install tree and then reuse that
to populate libgcc recipe later. This mechanism does not work
for gcc 4.7/trunk since now libstdc++ needs access to build tree
of libgcc. This patch stashes the gcc-cross build tree
and then reuses this in libgcc as well as in gcc-runtime
recipe builds.

Now we build libgcc in the libgcc recipe instead of just
using the prebuilt install tree

core-image-minimal build/run tested on all qemu machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 --
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |   24 +++++++++-----
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |   14 +-------
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   34 ++++++++++++++-----
 6 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index edc2a58..46a1ab4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r22"
+PR = "r23"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 8ab799f..a012fc5 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -68,9 +68,6 @@ do_configure_prepend () {
 	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
 	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
 	cat >>${B}/gcc/defaults.h.new <<_EOF
-#ifndef STANDARD_INCLUDE_DIR
-#define STANDARD_INCLUDE_DIR "${SYSTEMHEADERS}"
-#endif
 #ifndef STANDARD_STARTFILE_PREFIX_1
 #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
 #endif
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 34bfaeb..353b083 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -3,6 +3,7 @@ require gcc-configure-common.inc
 CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
 
 EXTRA_OECONF_PATHS = " \
+    --enable-sjlj-exceptions=no \
     --with-local-prefix=${STAGING_DIR_TARGET}${prefix} \
     --with-gxx-include-dir=${includedir}/c++/ \
     --with-sysroot=${STAGING_DIR_TARGET} \
@@ -16,26 +17,32 @@ RUNTIMETARGET = "libssp libstdc++-v3"
 
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
-	for d in ${RUNTIMETARGET}; do
+	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
+	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
+	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
-		mkdir -p ${B}/$d/
-		cd ${B}/$d/
+		rm -rf ${B}/$target/$d/
+		mkdir -p ${B}/$target/$d/
+		cd ${B}/$target/$d/
 		chmod a+x ${S}/$d/configure
 		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 	done
 }
 
 do_compile () {
-	for d in ${RUNTIMETARGET}; do
-		cd ${B}/$d/
-		oe_runmake
+	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	for d in libgcc ${RUNTIMETARGET}; do
+		cd ${B}/$target/$d/
+		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
 	done
 }
 
 do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
 	for d in ${RUNTIMETARGET}; do
-		cd ${B}/$d/
-		oe_runmake 'DESTDIR=${D}' install
+		cd ${B}/$target/$d/
+		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
 	done
 	chown -R root:root ${D}
 }
@@ -45,4 +52,3 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc"
 PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
 
 BBCLASSEXTEND = "nativesdk"
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index f0e7810..66c47e0 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -25,5 +25,5 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		${@get_gcc_fpu_setting(bb, d)}"
 
 do_compile () {
-    oe_runmake
+    oe_runmake all-gcc all-target-libgcc
 }
diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
index c872e00..7718e70 100644
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
@@ -36,19 +36,7 @@ do_install () {
 	case ${PN} in
 		*gcc-cross|*gcc-crosssdk)
 			dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
-			oe_runmake "DESTDIR=$dest" libdir=${target_libdir} base_libdir=${target_base_libdir} prefix=${target_prefix} exec_prefix=${target_exec_prefix} install-target-libgcc
-
-			# Ideally here we'd override the libgcc Makefile's idea of slibdir but
-			# for now, we just move the files to the correct location
-
-			install -d $dest${target_base_libdir}
-			mv $dest${target_exec_prefix}/${TARGET_SYS}/lib*/* $dest${target_base_libdir}
-			rm -rf $dest${target_exec_prefix}/${TARGET_SYS}
-
-			# Also need to move gcc from /usr/lib/gcc/* to /usr/lib/ else the search paths won't find the crt*.o files
-
-			mv $dest${target_libdir}/gcc/* $dest${target_libdir}/
-			rmdir $dest${target_libdir}/gcc
+			cp -fpPR . $dest
 		;;
 	esac
 }
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 04e2877..9eb5cfb 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -1,6 +1,7 @@
 require gcc-${PV}.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
+
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
 PACKAGES = "\
@@ -20,15 +21,28 @@ FILES_libgcov-dev = " \
 
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
+EXTRA_OECONF += "--enable-sjlj-exceptions=no"
 
-do_install () {
+do_configure () {
 	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
-
-	# Install libgcc from our gcc-cross saved data
 	install -d ${D}${base_libdir} ${D}${libdir}
-	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${D}
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${B}
+	mkdir -p ${B}/${PN}
+	cd ${B}/${PN}
+	chmod a+x ${S}/${PN}/configure
+	${S}/${PN}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+}
+
+do_compile () {
+	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	cd ${B}/${PN}
+	oe_runmake MULTIBUILDTOP=${B}/$target/${PN}/
+}
+
+do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-nativesdk##`
+	cd ${B}/${PN}
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${PN}/ install
 
 	# Move libgcc_s into /lib
 	mkdir -p ${D}${base_libdir}
@@ -38,8 +52,11 @@ do_install () {
 		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
 	fi
 
-	chown -R root:root ${D}
-	chmod +x ${D}${base_libdir}/libgcc_s.so.*
+	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
+	# so that cross-gcc can find it in the sysroot
+
+	mv ${D}${libdir}/gcc/* ${D}${libdir}
+	rm -rf ${D}${libdir}/gcc/
 }
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
@@ -50,4 +67,3 @@ BBCLASSEXTEND = "nativesdk"
 
 INSANE_SKIP_libgcc-dev = "staticdev"
 INSANE_SKIP_libgcov-dev = "staticdev"
-
-- 
1.7.7.6



