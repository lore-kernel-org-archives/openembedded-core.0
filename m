Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C7E3571E50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeOYQ022751; Wed, 25 Jan 2017 11:40:24 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jxhqr2zaRsHe; Wed, 25 Jan 2017 11:40:24 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeLTC022745
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 11:40:22 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cWLw5-0001NG-RP; Wed, 25 Jan 2017 11:40:21 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 11:40:16 +0000
Message-Id: <1485344418-5237-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485344418-5237-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485344418-5237-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] gcc: Split builddir saving into its own sstate task
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
X-List-Received-Date: Wed, 25 Jan 2017 11:40:26 -0000

When we stashed the gcc build directory for use in generating the various runtimes
we were being lazy and just used the staging directory. With recipe specific
sysroots this means we're copying a large chunk of data around with the cross
compiler which we don't really need in most cases.

Separate out the data into its own task and inject this into the configure
step. We have to do that here since autotools will wipe out ${B} if it thinks
we're rebuilding and we therefore have to time its recreation after that.

This also takes the opportunity to remove some pointless (as far as I can tell)
conditionals from the do_install code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-common.inc        | 10 +++++++++
 meta/recipes-devtools/gcc/gcc-cross-initial.inc | 10 ++-------
 meta/recipes-devtools/gcc/gcc-cross.inc         | 29 +++++++++++++++----------
 meta/recipes-devtools/gcc/gcc-runtime.inc       |  7 +++---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc    |  6 ++---
 meta/recipes-devtools/gcc/libgcc-common.inc     |  3 ++-
 meta/recipes-devtools/gcc/libgcc-initial.inc    |  2 +-
 meta/recipes-devtools/gcc/libgcc.inc            |  2 --
 meta/recipes-devtools/gcc/libgfortran.inc       |  4 ++--
 9 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index d17ba29..44e7c28 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -8,6 +8,16 @@ NATIVEDEPS = ""
 inherit autotools gettext texinfo
 
 BPN = "gcc"
+COMPILERINITIAL = ""
+COMPILERDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}gcc${COMPILERINITIAL}:do_gcc_stash_builddir"
+COMPILERDEP_class-nativesdk = "virtual/${TARGET_PREFIX}gcc${COMPILERINITIAL}-crosssdk:do_gcc_stash_builddir"
+
+python extract_stashed_builddir () {
+    src = d.expand("${STAGING_DIR}-components/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}")
+    dest = d.getVar("B")
+    oe.path.copyhardlinktree(src, dest)
+    staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
+}
 
 def get_gcc_float_setting(bb, d):
     if d.getVar('ARMPKGSFX_EABI') == "hf" and d.getVar('TRANSLATED_TARGET_ARCH') == "arm":
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index d47f42e..dd35681 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -75,14 +75,6 @@ do_install () {
 	# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
 	# to get rid references to real limits.h
 	cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include/limits.h
-
-	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
-	case ${PN} in
-		*gcc-cross-initial-${TARGET_ARCH}|*gcc-crosssdk-initial-${SDK_SYS})
-			dest=${D}/${includedir}/gcc-build-internal-initial-${TARGET_SYS}
-			hardlinkdir . $dest
-		;;
-	esac
 }
 #
 # Override the default sysroot staging copy since this won't look like a target system
@@ -99,3 +91,5 @@ do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
 
 inherit nopackages
+
+COMPILERINITIAL = "-initial"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index c4f7084..9afa554 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -185,21 +185,28 @@ do_install () {
 	# We use libiberty from binutils
 	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
 	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
-
-	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
-	case ${PN} in
-		*gcc-cross-${TARGET_ARCH}|*gcc-crosssdk-${SDK_SYS})
-			dest=${D}/${includedir}/gcc-build-internal-${TARGET_SYS}
-			hardlinkdir . $dest
-		;;
-	esac
 }
-# This is reflected in the recipe name and target gcc shouldn't depend 
-# on SDK settings either
-do_install[vardepsexclude] += "SDK_SYS"
 
 do_package[noexec] = "1"
 do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
+
+BUILDDIRSTASH = "${WORKDIR}/stashed-builddir"
+do_gcc_stash_builddir[dirs] = "${B}"
+do_gcc_stash_builddir[cleandirs] = "${BUILDDIRSTASH}"
+do_gcc_stash_builddir () {
+	dest=${BUILDDIRSTASH}
+	hardlinkdir . $dest
+}
+addtask do_gcc_stash_builddir after do_compile
+SSTATETASKS += "do_gcc_stash_builddir"
+do_gcc_stash_builddir[sstate-inputdirs] = "${BUILDDIRSTASH}"
+do_gcc_stash_builddir[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
+do_gcc_stash_builddir[sstate-fixmedir] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
+
+python do_gcc_stash_builddir_setscene () {
+    sstate_setscene(d)
+}
+addtask do_gcc_stash_builddir_setscene
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d56f82a..00856ad 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -32,9 +32,8 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
 
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
-	mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
+	target=${TARGET_SYS}
+
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/$target/$d/
@@ -45,6 +44,8 @@ do_configure () {
 		$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 	done
 }
+EXTRACONFFUNCS += "extract_stashed_builddir"
+do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index df4e297..ae3afe0 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -12,11 +12,7 @@ EXTRA_OECONF_PATHS = "\
 "
 
 do_configure () {
-    mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
     target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-    if [ -d ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ]; then
-        hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
-    fi
 
     echo "Configuring libsanitizer"
     rm -rf ${B}/$target/libsanitizer/
@@ -31,6 +27,8 @@ do_configure () {
     # Link to the sysroot's libstdc++ instead of one gcc thinks it just built
     sed -i -e '/LIBSTDCXX_RAW_CXX_\(CXXFLAGS\|LDFLAGS\)\s*=/d' ${B}/$target/libsanitizer/*/Makefile
 }
+EXTRACONFFUNCS += "extract_stashed_builddir"
+do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
     target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 7a3b410..c0efc29 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -7,7 +7,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 do_configure () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
-	hardlinkdir ${STAGING_INCDIR_NATIVE}/${LIBGCCBUILDTREENAME}$target/ ${B}
 	mkdir -p ${B}/${BPN}
 	mkdir -p ${B}/$target/${BPN}/
 	cd ${B}/${BPN}
@@ -15,6 +14,8 @@ do_configure () {
 	relpath=${@os.path.relpath("${S}/${BPN}", "${B}/${BPN}")}
 	$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 }
+EXTRACONFFUNCS += "extract_stashed_builddir"
+do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index aa32185..5b4bc3b 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -12,6 +12,6 @@ PACKAGES = ""
 
 EXTRA_OECONF += "--disable-shared"
 
-LIBGCCBUILDTREENAME = "gcc-build-internal-initial-"
+COMPILERINITIAL = "-initial"
 
 inherit nopackages
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 4770394..38d1643 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -33,8 +33,6 @@ FILES_${PN}-dev = "\
     ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
 "
 
-LIBGCCBUILDTREENAME = "gcc-build-internal-"
-
 do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 1943635..d3e2b41 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -6,9 +6,7 @@ EXTRA_OECONF_PATHS = "\
 "
 
 do_configure () {
-	mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
 
 	echo "Configuring libgfortran"
 	rm -rf ${B}/$target/libgfortran/
@@ -21,6 +19,8 @@ do_configure () {
 	# broken libtool here
 	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/$target/libgfortran/libtool
 }
+EXTRACONFFUNCS += "extract_stashed_builddir"
+do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-- 
2.7.4


