Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 48DFA6B51D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9ff001261; Thu, 22 Aug 2013 12:42:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VHOo985dKTYq; Thu, 22 Aug 2013 12:42:17 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg832001238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:09 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5c-0001jH-57; Thu, 22 Aug 2013 12:30:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:55 +0100
Message-Id: <1377171000-6469-23-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 23/28] gcc-cross-canadian: Fold configure-sdk and package-sdk into the main .inc
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:28 -0000

This also has the advantage of removing the confusing sdk naming which
has been purged everywhere else in favour of cross-canadian.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc  |  47 ---------
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 127 ++++++++++++++++++++++-
 meta/recipes-devtools/gcc/gcc-package-sdk.inc    |  78 --------------
 3 files changed, 125 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-configure-sdk.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-package-sdk.inc

diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
deleted file mode 100644
index 6c55bc7..0000000
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ /dev/null
@@ -1,47 +0,0 @@
-require gcc-configure-common.inc
-
-EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++ \
-                      --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
-                      --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
-
-#
-# gcc-cross looks and finds these in ${exec_prefix} but we're not so lucky
-# for the sdk. Hardcoding the paths ensures the build doesn't go canadian or worse.
-#
-export AR_FOR_TARGET = "${TARGET_PREFIX}ar"
-export AS_FOR_TARGET = "${TARGET_PREFIX}as"
-export DLLTOOL_FOR_TARGET = "${TARGET_PREFIX}dlltool"
-export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
-export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
-export LD_FOR_TARGET = "${TARGET_PREFIX}ld"
-export LIPO_FOR_TARGET = "${TARGET_PREFIX}lipo"
-export NM_FOR_TARGET = "${TARGET_PREFIX}nm"
-export OBJDUMP_FOR_TARGET = "${TARGET_PREFIX}objdump"
-export RANLIB_FOR_TARGET = "${TARGET_PREFIX}ranlib"
-export STRIP_FOR_TARGET = "${TARGET_PREFIX}strip"
-export WINDRES_FOR_TARGET = "${TARGET_PREFIX}windres"
-
-#
-# We need to override this and make sure the compiler can find staging
-#
-export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET}"
-
-do_configure () {
-	export CC_FOR_BUILD="${BUILD_CC}"
-	export CXX_FOR_BUILD="${BUILD_CXX}"
-	export CFLAGS_FOR_BUILD="${BUILD_CFLAGS}"
-	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
-	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
-	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
-	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
-	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
-	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
-	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
-	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
-	oe_runconf
-}
-
-do_compile () {
-	oe_runmake all-host
-}
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 85c3166..5908e72 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -8,8 +8,131 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}binutils-crosssdk v
 
 GCCMULTILIB = "--enable-multilib"
 
-require gcc-configure-sdk.inc
-require gcc-package-sdk.inc
+require gcc-configure-common.inc
+
+EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++ \
+                      --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
+                      --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
+                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+
+#
+# gcc-cross looks and finds these in ${exec_prefix} but we're not so lucky
+# for the sdk. Hardcoding the paths ensures the build doesn't go canadian or worse.
+#
+export AR_FOR_TARGET = "${TARGET_PREFIX}ar"
+export AS_FOR_TARGET = "${TARGET_PREFIX}as"
+export DLLTOOL_FOR_TARGET = "${TARGET_PREFIX}dlltool"
+export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
+export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
+export LD_FOR_TARGET = "${TARGET_PREFIX}ld"
+export LIPO_FOR_TARGET = "${TARGET_PREFIX}lipo"
+export NM_FOR_TARGET = "${TARGET_PREFIX}nm"
+export OBJDUMP_FOR_TARGET = "${TARGET_PREFIX}objdump"
+export RANLIB_FOR_TARGET = "${TARGET_PREFIX}ranlib"
+export STRIP_FOR_TARGET = "${TARGET_PREFIX}strip"
+export WINDRES_FOR_TARGET = "${TARGET_PREFIX}windres"
+
+#
+# We need to override this and make sure the compiler can find staging
+#
+export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET}"
+
+do_configure () {
+	export CC_FOR_BUILD="${BUILD_CC}"
+	export CXX_FOR_BUILD="${BUILD_CXX}"
+	export CFLAGS_FOR_BUILD="${BUILD_CFLAGS}"
+	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
+	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
+	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
+	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
+	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
+	oe_runconf
+}
+
+do_compile () {
+	oe_runmake all-host
+}
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+# Having anything auto depending on gcc-cross-sdk is a really bad idea...
+EXCLUDE_FROM_SHLIBS = "1"
+
+PACKAGES = "${PN} ${PN}-doc"
+
+FILES_${PN} = "\
+    ${bindir}/* \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.* \
+    ${includedir}/c++/${BINV} \
+    ${prefix}/${TARGET_SYS}/bin/* \
+    ${prefix}/${TARGET_SYS}/lib/* \
+    ${prefix}/${TARGET_SYS}/usr/include/* \
+    "
+INSANE_SKIP_${PN} += "dev-so"
+
+FILES_${PN}-doc = "\
+    ${infodir} \
+    ${mandir} \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
+    "
+
+EXEEXT = ""
+
+# Compute how to get from libexecdir to bindir in python (easier than shell)
+BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${bindir}"))}"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install-host
+
+	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
+	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
+	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
+
+	# We care about g++ not c++
+	rm -f ${D}${bindir}/*c++
+
+	# We don't care about the gcc-<version> copies
+	rm -f ${D}${bindir}/*gcc-?.?*
+
+	# We use libiberty from binutils
+	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
+	# Not sure where the strange paths come from
+	rm -f ${D}${libdir}/../lib/libiberty.a
+	rm -f ${D}${libdir}/libiberty.a
+
+	# Cleanup empty directories which are not shipped
+	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
+	# ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
+	local empty_dirs="${D}${libdir}/../lib ${D}${prefix}/${TARGET_SYS}/lib ${D}${prefix}/${TARGET_SYS} ${D}${includedir}"
+	for i in $empty_dirs; do
+		[ -d $i ] && rmdir --ignore-fail-on-non-empty $i
+	done
+
+	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+	# found.
+	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
+	install -d $dest
+	suffix=${EXEEXT}
+	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+		if [ "$t" = "g77" -o "$t" = "gfortran" ] && [ ! -e ${D}${bindir}/${TARGET_PREFIX}$t$suffix ]; then
+			continue
+		fi
+
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
+	done
+
+	chown -R root:root ${D}
+}
 
 ELFUTILS = "nativesdk-elfutils"
 DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
deleted file mode 100644
index 21beccc..0000000
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ /dev/null
@@ -1,78 +0,0 @@
-INHIBIT_PACKAGE_STRIP = "1"
-
-# Having anything auto depending on gcc-cross-sdk is a really bad idea...
-EXCLUDE_FROM_SHLIBS = "1"
-
-PACKAGES = "${PN} ${PN}-doc"
-
-FILES_${PN} = "\
-    ${bindir}/* \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.* \
-    ${includedir}/c++/${BINV} \
-    ${prefix}/${TARGET_SYS}/bin/* \
-    ${prefix}/${TARGET_SYS}/lib/* \
-    ${prefix}/${TARGET_SYS}/usr/include/* \
-    "
-INSANE_SKIP_${PN} += "dev-so"
-
-FILES_${PN}-doc = "\
-    ${infodir} \
-    ${mandir} \
-    ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
-    "
-
-EXEEXT = ""
-
-# Compute how to get from libexecdir to bindir in python (easier than shell)
-BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${bindir}"))}"
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install-host
-
-	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
-	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-
-	# We care about g++ not c++
-	rm -f ${D}${bindir}/*c++
-
-	# We don't care about the gcc-<version> copies
-	rm -f ${D}${bindir}/*gcc-?.?*
-
-	# We use libiberty from binutils
-	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
-	# Not sure where the strange paths come from
-	rm -f ${D}${libdir}/../lib/libiberty.a
-	rm -f ${D}${libdir}/libiberty.a
-
-	# Cleanup empty directories which are not shipped
-	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
-	# ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
-	local empty_dirs="${D}${libdir}/../lib ${D}${prefix}/${TARGET_SYS}/lib ${D}${prefix}/${TARGET_SYS} ${D}${includedir}"
-	for i in $empty_dirs; do
-		[ -d $i ] && rmdir --ignore-fail-on-non-empty $i
-	done
-
-	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
-	# found.
-	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
-	install -d $dest
-	suffix=${EXEEXT}
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
-		if [ "$t" = "g77" -o "$t" = "gfortran" ] && [ ! -e ${D}${bindir}/${TARGET_PREFIX}$t$suffix ]; then
-			continue
-		fi
-
-		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
-	done
-
-	chown -R root:root ${D}
-}
-
-- 
1.8.1.2


