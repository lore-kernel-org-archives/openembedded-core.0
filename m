Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1C86A6DCA7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 00:48:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB50mfcm021234; Thu, 5 Dec 2013 00:48:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mlpaxfqRtuI3; Thu,  5 Dec 2013 00:48:41 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB50mavK021231
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Dec 2013 00:48:37 GMT
Message-ID: <1386204510.4463.161.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Dec 2013 00:48:30 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Khem Raj <kraj@juniper.net>
Subject: [PATCH] gcc: Allow fortran to build successfully in 4.8
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
X-List-Received-Date: Thu, 05 Dec 2013 00:48:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

gcc 4.8 fortran presents some challenges:

* libquadmath headers need to be in the libexec include dir. It turns out
  to be easiest just to manually do this.
* libgfortran configure needs libquadmath to be compiled. This means
  a separate recipe is needed (the alternative is gross hacks)
* the libtool uses to link libgfortran doesn't have our improved rpath 
  handling and puts bogus RPATHS into the libraries. We can avoid this
  by tweaking libtool with sed.

This patch resolves those issues. Any user of fortran does need to DEPEND 
on libgfortran in order to trigger it to build but this shouldn't be a major
issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 25a3142..5c4319f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -165,6 +165,11 @@ do_install () {
 		rm -rf ${D}${STAGING_DIR_NATIVE}${prefix_native}/$d
 	done
 
+	# libquadmath headers need to  be available in the gcc libexec dir
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+
 	# We use libiberty from binutils
 	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
 	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 2599760..d3b11a7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -16,7 +16,7 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
 #  ?
 # libiberty
 # libmudflap
-# libgfortran
+# libgfortran needs separate recipe due to libquadmath dependency
 
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
new file mode 100644
index 0000000..3ae0632
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -0,0 +1,75 @@
+require gcc-configure-common.inc
+
+EXTRA_OECONF_PATHS = " \
+    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-build-sysroot=${STAGING_DIR_TARGET}"
+
+do_configure () {
+	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	#cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/* ${B}
+	(cd ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/; find . -print0 | cpio --null -pdlu ${B})
+	(cd ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget/; find . -type l -print0 | cpio -pd0mLu --no-preserve-owner ${B})
+
+	echo "Configuring libgfortran"
+	rm -rf ${B}/$target/libgfortran/
+	mkdir -p ${B}/$target/libgfortran/
+	cd ${B}/$target/libgfortran/
+	chmod a+x ${S}/libgfortran/configure
+	${S}/libgfortran/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+	# Easiest way to stop bad RPATHs getting into the library since we have a
+	# broken libtool here
+	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/$target/libgfortran/libtool
+}
+
+do_compile () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cd ${B}/$target/libgfortran/
+	oe_runmake MULTIBUILDTOP=${B}/$target/libgfortran/
+}
+
+do_install () {
+	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
+	cd ${B}/$target/libgfortran/
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/libgfortran/ install
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
+DEPENDS = "gcc-runtime"
+
+BBCLASSEXTEND = "nativesdk"
+
+PACKAGES = "\
+  ${PN}-dbg \
+  libgfortran \
+  libgfortran-dev \
+  libgfortran-staticdev \
+"
+FILES_${PN} = "${libdir}/libgfortran.so.*"
+FILES_${PN}-dev = " \
+  ${libdir}/libgfortran*.so \
+  ${libdir}/libgfortran.spec \
+  ${libdir}/libgfortran.la \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single*"
+FILES_${PN}-staticdev = " \
+  ${libdir}/libgfortran.a"
+
+INSANE_SKIP_${MLPREFIX}libgfortran-dev = "staticdev"
+
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+
+python __anonymous () {
+    f = d.getVar("FORTRAN", True)
+    if "fortran" not in f:
+        raise bb.parse.SkipPackage("libgfortran needs fortran support to be enabled in the compiler")
+}
diff --git a/meta/recipes-devtools/gcc/libgfortran_4.8.bb b/meta/recipes-devtools/gcc/libgfortran_4.8.bb
new file mode 100644
index 0000000..71dd8b4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgfortran_4.8.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgfortran.inc
+



