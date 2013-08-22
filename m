Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1846B2C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fh001261; Thu, 22 Aug 2013 12:42:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vH9kEbeOfxXY; Thu, 22 Aug 2013 12:42:18 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg8Oo001237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:09 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5c-0001jC-1f; Thu, 22 Aug 2013 12:30:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:54 +0100
Message-Id: <1377171000-6469-22-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 22/28] gcc-*-runtime.inc: Fold configuration into gcc-runtime.inc
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
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |  64 ---------
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |  80 ------------
 meta/recipes-devtools/gcc/gcc-runtime.inc          | 145 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-runtime_4.7.bb       |   3 +-
 meta/recipes-devtools/gcc/gcc-runtime_4.8.bb       |   3 +-
 5 files changed, 147 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-configure-runtime.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-package-runtime.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime.inc

diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
deleted file mode 100644
index 2ff8561..0000000
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ /dev/null
@@ -1,64 +0,0 @@
-require gcc-configure-common.inc
-
-CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
-
-EXTRA_OECONF_PATHS = " \
-    --with-gxx-include-dir=${includedir}/c++/ \
-    --with-sysroot=${STAGING_DIR_TARGET} \
-    --with-build-sysroot=${STAGING_DIR_TARGET}"
-
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
-
-EXTRA_OECONF += "--disable-libunwind-exceptions"
-EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
-
-RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
-#  ?
-# libiberty
-# libmudflap
-# libgfortran
-
-do_configure () {
-	export CXX="${CXX} -nostdinc++ -nostdlib++"
-	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
-	for d in libgcc ${RUNTIMETARGET}; do
-		echo "Configuring $d"
-		rm -rf ${B}/$target/$d/
-		mkdir -p ${B}/$target/$d/
-		cd ${B}/$target/$d/
-		chmod a+x ${S}/$d/configure
-		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
-	done
-}
-
-do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	for d in libgcc ${RUNTIMETARGET}; do
-		cd ${B}/$target/$d/
-		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
-	done
-}
-
-do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	for d in ${RUNTIMETARGET}; do
-		cd ${B}/$target/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
-	done
-	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
-	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
-		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
-	fi
-	if [ -d ${D}${infodir} ]; then
-		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
-	fi
-	chown -R root:root ${D}
-}
-
-INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc"
-PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
deleted file mode 100644
index 2e2f75a..0000000
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ /dev/null
@@ -1,80 +0,0 @@
-PACKAGES = "\
-  ${PN}-dbg \
-  libstdc++ \
-  libstdc++-precompile-dev \
-  libstdc++-dev \
-  libstdc++-staticdev \
-  libg2c \
-  libg2c-dev \
-  libssp \
-  libssp-dev \
-  libssp-staticdev \
-  libgfortran \
-  libgfortran-dev \
-  libmudflap \
-  libmudflap-dev \
-  libgomp \
-  libgomp-dev \
-  libgomp-staticdev \
-"
-# The base package doesn't exist, so we clear the recommends.
-RRECOMMENDS_${PN}-dbg = ""
-
-# include python debugging scripts
-FILES_${PN}-dbg += "\
-  ${libdir}/libstdc++.so.*-gdb.py \
-  ${datadir}/gcc-${BINV}/python/libstdcxx"
-
-FILES_libg2c = "${target_libdir}/libg2c.so.*"
-FILES_libg2c-dev = "\
-  ${libdir}/libg2c.so \
-  ${libdir}/libg2c.a \
-  ${libdir}/libfrtbegin.a"
-
-FILES_libstdc++ = "${libdir}/libstdc++.so.*"
-FILES_libstdc++-dev = "\
-  ${includedir}/c++/ \
-  ${libdir}/libstdc++.so \
-  ${libdir}/libstdc++.la \
-  ${libdir}/libsupc++.la"
-FILES_libstdc++-staticdev = "\
-  ${libdir}/libstdc++.a \
-  ${libdir}/libsupc++.a"
-
-FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
-
-FILES_libssp = "${libdir}/libssp.so.*"
-FILES_libssp-dev = " \
-  ${libdir}/libssp*.so \
-  ${libdir}/libssp*_nonshared.a \
-  ${libdir}/libssp*.la \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
-FILES_libssp-staticdev = " \
-  ${libdir}/libssp*.a"
-
-FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = " \
-  ${libdir}/libgfortran.a \
-  ${libdir}/libgfortran.so \
-  ${libdir}/libgfortranbegin.a"
-
-FILES_libmudflap = "${libdir}/libmudflap*.so.*"
-FILES_libmudflap-dev = "\
-  ${libdir}/libmudflap*.so \
-  ${libdir}/libmudflap*.a \
-  ${libdir}/libmudflap*.la"
-
-FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
-FILES_libgomp-dev = "\
-  ${libdir}/libgomp*${SOLIBSDEV} \
-  ${libdir}/libgomp*.la \
-  ${libdir}/libgomp.spec \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
-  "
-FILES_libgomp-staticdev = "\
-  ${libdir}/libgomp*.a \
-  "
-
-do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
new file mode 100644
index 0000000..b882889
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -0,0 +1,145 @@
+require gcc-configure-common.inc
+
+CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
+
+EXTRA_OECONF_PATHS = " \
+    --with-gxx-include-dir=${includedir}/c++/ \
+    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-build-sysroot=${STAGING_DIR_TARGET}"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+
+EXTRA_OECONF += "--disable-libunwind-exceptions"
+EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
+
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
+#  ?
+# libiberty
+# libmudflap
+# libgfortran
+
+do_configure () {
+	export CXX="${CXX} -nostdinc++ -nostdlib++"
+	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
+	for d in libgcc ${RUNTIMETARGET}; do
+		echo "Configuring $d"
+		rm -rf ${B}/$target/$d/
+		mkdir -p ${B}/$target/$d/
+		cd ${B}/$target/$d/
+		chmod a+x ${S}/$d/configure
+		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	done
+}
+
+do_compile () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	for d in libgcc ${RUNTIMETARGET}; do
+		cd ${B}/$target/$d/
+		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
+	done
+}
+
+do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	for d in ${RUNTIMETARGET}; do
+		cd ${B}/$target/$d/
+		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
+	done
+	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
+	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
+		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
+	fi
+	if [ -d ${D}${infodir} ]; then
+		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
+	fi
+	chown -R root:root ${D}
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ libgcc"
+PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
+
+BBCLASSEXTEND = "nativesdk"
+
+PACKAGES = "\
+  ${PN}-dbg \
+  libstdc++ \
+  libstdc++-precompile-dev \
+  libstdc++-dev \
+  libstdc++-staticdev \
+  libg2c \
+  libg2c-dev \
+  libssp \
+  libssp-dev \
+  libssp-staticdev \
+  libgfortran \
+  libgfortran-dev \
+  libmudflap \
+  libmudflap-dev \
+  libgomp \
+  libgomp-dev \
+  libgomp-staticdev \
+"
+# The base package doesn't exist, so we clear the recommends.
+RRECOMMENDS_${PN}-dbg = ""
+
+# include python debugging scripts
+FILES_${PN}-dbg += "\
+  ${libdir}/libstdc++.so.*-gdb.py \
+  ${datadir}/gcc-${BINV}/python/libstdcxx"
+
+FILES_libg2c = "${target_libdir}/libg2c.so.*"
+FILES_libg2c-dev = "\
+  ${libdir}/libg2c.so \
+  ${libdir}/libg2c.a \
+  ${libdir}/libfrtbegin.a"
+
+FILES_libstdc++ = "${libdir}/libstdc++.so.*"
+FILES_libstdc++-dev = "\
+  ${includedir}/c++/ \
+  ${libdir}/libstdc++.so \
+  ${libdir}/libstdc++.la \
+  ${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = "\
+  ${libdir}/libstdc++.a \
+  ${libdir}/libsupc++.a"
+
+FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
+
+FILES_libssp = "${libdir}/libssp.so.*"
+FILES_libssp-dev = " \
+  ${libdir}/libssp*.so \
+  ${libdir}/libssp*_nonshared.a \
+  ${libdir}/libssp*.la \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
+FILES_libssp-staticdev = " \
+  ${libdir}/libssp*.a"
+
+FILES_libgfortran = "${libdir}/libgfortran.so.*"
+FILES_libgfortran-dev = " \
+  ${libdir}/libgfortran.a \
+  ${libdir}/libgfortran.so \
+  ${libdir}/libgfortranbegin.a"
+
+FILES_libmudflap = "${libdir}/libmudflap*.so.*"
+FILES_libmudflap-dev = "\
+  ${libdir}/libmudflap*.so \
+  ${libdir}/libmudflap*.a \
+  ${libdir}/libmudflap*.la"
+
+FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
+FILES_libgomp-dev = "\
+  ${libdir}/libgomp*${SOLIBSDEV} \
+  ${libdir}/libgomp*.la \
+  ${libdir}/libgomp.spec \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
+  "
+FILES_libgomp-staticdev = "\
+  ${libdir}/libgomp*.a \
+  "
+
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
index c16d27e..497d691 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
@@ -1,4 +1,3 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-configure-runtime.inc
-require gcc-package-runtime.inc
+require gcc-runtime.inc
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb
index c16d27e..497d691 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb
@@ -1,4 +1,3 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-configure-runtime.inc
-require gcc-package-runtime.inc
+require gcc-runtime.inc
 
-- 
1.8.1.2


