Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD8961EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg902001260; Thu, 22 Aug 2013 12:42:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id h4R_hnMszrYE; Thu, 22 Aug 2013 12:42:16 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg8Lq001235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:09 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5b-0001j5-UF; Thu, 22 Aug 2013 12:30:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:53 +0100
Message-Id: <1377171000-6469-21-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 21/28] gcc-*-cross.inc: Fold common configuration into gcc-cross.inc
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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-configure-cross.inc | 31 ---------
 meta/recipes-devtools/gcc/gcc-cross.inc           | 84 ++++++++++++++++++++++-
 meta/recipes-devtools/gcc/gcc-package-cross.inc   | 48 -------------
 3 files changed, 81 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-configure-cross.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-package-cross.inc

diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
deleted file mode 100644
index db7980b..0000000
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-require gcc-configure-common.inc
-
-EXTRA_OECONF += " --enable-poison-system-directories \
-		"
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-EXTRA_OECONF_PATHS = " \
-		      --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} \
-		      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
-                      --with-sysroot=${STAGING_DIR_TARGET} \
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
-
-do_configure_prepend () {
-	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
-}
-do_compile_prepend () {
-	export CC="${BUILD_CC}"
-	export AR_FOR_TARGET="${TARGET_SYS}-ar"
-	export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
-	export LD_FOR_TARGET="${TARGET_SYS}-ld"
-	export NM_FOR_TARGET="${TARGET_SYS}-nm"
-	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
-	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
-	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
-	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
-	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
-}
-
-LIBGCCS_VAR = "-lgcc_s"
-LIBGCCS_VAR_avr32 = ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index c3542e2..bf22101 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -3,8 +3,38 @@ inherit cross
 DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
-require gcc-configure-cross.inc
-require gcc-package-cross.inc
+require gcc-configure-common.inc
+
+EXTRA_OECONF += " --enable-poison-system-directories \
+		"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+EXTRA_OECONF_PATHS = " \
+		      --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} \
+		      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
+                      --with-sysroot=${STAGING_DIR_TARGET} \
+                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+
+do_configure_prepend () {
+	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
+}
+
+do_compile_prepend () {
+	export CC="${BUILD_CC}"
+	export AR_FOR_TARGET="${TARGET_SYS}-ar"
+	export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
+	export LD_FOR_TARGET="${TARGET_SYS}-ld"
+	export NM_FOR_TARGET="${TARGET_SYS}-nm"
+	export CC_FOR_TARGET="${CCACHE} ${TARGET_SYS}-gcc ${TARGET_CC_ARCH}"
+	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
+	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
+}
+
+LIBGCCS_VAR = "-lgcc_s"
+LIBGCCS_VAR_avr32 = ""
 
 EXTRADEPENDS = ""
 python () {
@@ -118,5 +148,53 @@ EXTRA_OECONF_PATHS = " \
                       --with-sysroot=${STAGING_DIR_TARGET} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
-
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+# Compute how to get from libexecdir to bindir in python (easier than shell)
+BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"))}"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install-host
+
+	install -d ${D}${target_base_libdir}
+	install -d ${D}${target_libdir}
+    
+	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
+	# gfortran is fully backwards compatible. This is a safe and practical solution. 
+	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
+
+	
+	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
+	# found. These need to be relative paths so they work in different locations.
+	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
+	install -d $dest
+	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
+		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
+	done
+
+	# Remove things we don't need but keep share/java
+	for d in info man share/doc share/locale share/man share/info; do
+		rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/$d
+	done
+
+	# We use libiberty from binutils
+	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
+
+	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
+	case ${PN} in
+		*gcc-cross|*gcc-crosssdk)
+			dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
+			cp -fpPR . $dest
+		;;
+	esac
+}
+
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_deb[noexec] = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
deleted file mode 100644
index 3d81677..0000000
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ /dev/null
@@ -1,48 +0,0 @@
-INHIBIT_PACKAGE_STRIP = "1"
-
-# Compute how to get from libexecdir to bindir in python (easier than shell)
-BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"))}"
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install-host
-
-	install -d ${D}${target_base_libdir}
-	install -d ${D}${target_libdir}
-    
-	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
-	# gfortran is fully backwards compatible. This is a safe and practical solution. 
-	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
-
-	
-	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
-	# found. These need to be relative paths so they work in different locations.
-	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
-	install -d $dest
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
-		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
-		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
-	done
-
-	# Remove things we don't need but keep share/java
-	for d in info man share/doc share/locale share/man share/info; do
-		rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/$d
-	done
-
-	# We use libiberty from binutils
-	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
-	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
-
-	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
-	case ${PN} in
-		*gcc-cross|*gcc-crosssdk)
-			dest=${D}/${includedir}/gcc-build-internal-${MULTIMACH_TARGET_SYS}
-			cp -fpPR . $dest
-		;;
-	esac
-}
-
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-- 
1.8.1.2


