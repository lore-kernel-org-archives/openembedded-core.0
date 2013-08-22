Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3726B51D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fe001261; Thu, 22 Aug 2013 12:42:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QHGvIDorOnXv; Thu, 22 Aug 2013 12:42:16 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg8dS001233
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:09 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5b-0001j0-Qh; Thu, 22 Aug 2013 12:30:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:52 +0100
Message-Id: <1377171000-6469-20-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 20/28] gcc-target: Combine gcc-target-configure.inc, gcc-target-package.inc and other common code
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:59 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   8 --
 meta/recipes-devtools/gcc/gcc-package-target.inc   | 142 -------------------
 meta/recipes-devtools/gcc/gcc-target.inc           | 153 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc_4.7.bb               |   5 +-
 meta/recipes-devtools/gcc/gcc_4.8.bb               |   5 +-
 5 files changed, 155 insertions(+), 158 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-configure-target.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-package-target.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-target.inc

diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
deleted file mode 100644
index 5f608d6..0000000
--- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-GCCMULTILIB = "--enable-multilib"
-require gcc-configure-common.inc
-
-EXTRA_OECONF_PATHS = " \
-    --with-sysroot=/ \
-    --with-build-sysroot=${STAGING_DIR_TARGET} \
-    --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
-    --with-gxx-include-dir=${includedir}/c++/ --enable-dependency-tracking"
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
deleted file mode 100644
index 95a92c1..0000000
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ /dev/null
@@ -1,142 +0,0 @@
-PACKAGES = "\
-  ${PN} ${PN}-plugins ${PN}-symlinks \
-  g++ g++-symlinks \
-  cpp cpp-symlinks \
-  g77 g77-symlinks \
-  gfortran gfortran-symlinks \
-  gcov gcov-symlinks \
-  ${PN}-plugin-dev \
-  ${PN}-doc \
-  ${PN}-dev \
-  ${PN}-dbg \
-"
-
-FILES_${PN} = "\
-  ${bindir}/${TARGET_PREFIX}gcc* \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
-"
-INSANE_SKIP_${PN} += "dev-so"
-
-FILES_${PN}-dbg += "\
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug/ \
-"
-FILES_${PN}-dev = "\
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
-"
-FILES_${PN}-plugin-dev = "\
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
-"
-FILES_${PN}-symlinks = "\
-  ${bindir}/cc \
-  ${bindir}/gcc \
-  ${bindir}/gccbug \
-"
-
-FILES_${PN}-plugins = "\
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
-"
-ALLOW_EMPTY_${PN}-plugins = "1"
-
-FILES_g77 = "\
-  ${bindir}/${TARGET_PREFIX}g77 \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
-"
-FILES_g77-symlinks = "\
-  ${bindir}/g77 \
-  ${bindir}/f77 \
-"
-FILES_gfortran = "\
-  ${bindir}/${TARGET_PREFIX}gfortran \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
-"
-FILES_gfortran-symlinks = "\
-  ${bindir}/gfortran \
-  ${bindir}/f95"
-
-FILES_cpp = "\
-  ${bindir}/${TARGET_PREFIX}cpp \
-  ${base_libdir}/cpp \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
-FILES_cpp-symlinks = "${bindir}/cpp"
-
-FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
-FILES_gcov-symlinks = "${bindir}/gcov"
-
-FILES_g++ = "\
-  ${bindir}/${TARGET_PREFIX}g++ \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
-"
-FILES_g++-symlinks = "\
-  ${bindir}/c++ \
-  ${bindir}/g++ \
-"
-
-
-FILES_${PN}-doc = "\
-  ${infodir} \
-  ${mandir} \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
-"
-
-do_install () {
-	oe_runmake 'DESTDIR=${D}' install-host
-
-	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
-	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-	rm -rf ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
-	rmdir ${D}${includedir}
-
-	# Hack around specs file assumptions
-	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
-
-	# Cleanup manpages..
-	rm -rf ${D}${mandir}/man7
-
-	cd ${D}${bindir}
-
-	# We care about g++ not c++
-	rm -f *c++
-
-	# We don't care about the gcc-<version> ones for this
-	rm -f *gcc-?.?*
-
-	# We use libiberty from binutils
-	find ${D}${libdir} -name libiberty.a | xargs rm -f
-	find ${D}${libdir} -name libiberty.h | xargs rm -f
-
-	# Not sure why we end up with these but we don't want them...
-	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
-
-	# Symlinks so we can use these trivially on the target
-	if [ -e ${TARGET_PREFIX}g77 ]; then
-		ln -sf ${TARGET_PREFIX}g77 g77 || true
-		ln -sf g77 f77 || true
-	fi
-	if [ -e ${TARGET_PREFIX}gfortran ]; then
-		ln -sf ${TARGET_PREFIX}gfortran gfortran || true
-		ln -sf gfortran f95 || true
-	fi
-	ln -sf ${TARGET_PREFIX}g++ g++
-	ln -sf ${TARGET_PREFIX}gcc gcc
-	ln -sf ${TARGET_PREFIX}cpp cpp
-	install -d ${D}${base_libdir}
-	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
-	ln -sf g++ c++
-	ln -sf gcc cc
-
-	chown -R root:root ${D}
-}
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
new file mode 100644
index 0000000..150fbba
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -0,0 +1,153 @@
+GCCMULTILIB = "--enable-multilib"
+require gcc-configure-common.inc
+
+EXTRA_OECONF_PATHS = " \
+    --with-sysroot=/ \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+    --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
+    --with-gxx-include-dir=${includedir}/c++/ --enable-dependency-tracking"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
+
+PACKAGES = "\
+  ${PN} ${PN}-plugins ${PN}-symlinks \
+  g++ g++-symlinks \
+  cpp cpp-symlinks \
+  g77 g77-symlinks \
+  gfortran gfortran-symlinks \
+  gcov gcov-symlinks \
+  ${PN}-plugin-dev \
+  ${PN}-doc \
+  ${PN}-dev \
+  ${PN}-dbg \
+"
+
+FILES_${PN} = "\
+  ${bindir}/${TARGET_PREFIX}gcc* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
+"
+INSANE_SKIP_${PN} += "dev-so"
+
+FILES_${PN}-dbg += "\
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug/ \
+"
+FILES_${PN}-dev = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+"
+FILES_${PN}-plugin-dev = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
+"
+FILES_${PN}-symlinks = "\
+  ${bindir}/cc \
+  ${bindir}/gcc \
+  ${bindir}/gccbug \
+"
+
+FILES_${PN}-plugins = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
+"
+ALLOW_EMPTY_${PN}-plugins = "1"
+
+FILES_g77 = "\
+  ${bindir}/${TARGET_PREFIX}g77 \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
+"
+FILES_g77-symlinks = "\
+  ${bindir}/g77 \
+  ${bindir}/f77 \
+"
+FILES_gfortran = "\
+  ${bindir}/${TARGET_PREFIX}gfortran \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
+"
+FILES_gfortran-symlinks = "\
+  ${bindir}/gfortran \
+  ${bindir}/f95"
+
+FILES_cpp = "\
+  ${bindir}/${TARGET_PREFIX}cpp \
+  ${base_libdir}/cpp \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
+FILES_cpp-symlinks = "${bindir}/cpp"
+
+FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
+FILES_gcov-symlinks = "${bindir}/gcov"
+
+FILES_g++ = "\
+  ${bindir}/${TARGET_PREFIX}g++ \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
+"
+FILES_g++-symlinks = "\
+  ${bindir}/c++ \
+  ${bindir}/g++ \
+"
+
+
+FILES_${PN}-doc = "\
+  ${infodir} \
+  ${mandir} \
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
+"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install-host
+
+	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
+	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
+	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
+	rm -rf ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
+	rmdir ${D}${includedir}
+
+	# Hack around specs file assumptions
+	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
+
+	# Cleanup manpages..
+	rm -rf ${D}${mandir}/man7
+
+	cd ${D}${bindir}
+
+	# We care about g++ not c++
+	rm -f *c++
+
+	# We don't care about the gcc-<version> ones for this
+	rm -f *gcc-?.?*
+
+	# We use libiberty from binutils
+	find ${D}${libdir} -name libiberty.a | xargs rm -f
+	find ${D}${libdir} -name libiberty.h | xargs rm -f
+
+	# Not sure why we end up with these but we don't want them...
+	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
+
+	# Symlinks so we can use these trivially on the target
+	if [ -e ${TARGET_PREFIX}g77 ]; then
+		ln -sf ${TARGET_PREFIX}g77 g77 || true
+		ln -sf g77 f77 || true
+	fi
+	if [ -e ${TARGET_PREFIX}gfortran ]; then
+		ln -sf ${TARGET_PREFIX}gfortran gfortran || true
+		ln -sf gfortran f95 || true
+	fi
+	ln -sf ${TARGET_PREFIX}g++ g++
+	ln -sf ${TARGET_PREFIX}gcc gcc
+	ln -sf ${TARGET_PREFIX}cpp cpp
+	install -d ${D}${base_libdir}
+	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
+	ln -sf g++ c++
+	ln -sf gcc cc
+
+	chown -R root:root ${D}
+}
diff --git a/meta/recipes-devtools/gcc/gcc_4.7.bb b/meta/recipes-devtools/gcc/gcc_4.7.bb
index f68c67a..0ae22e8 100644
--- a/meta/recipes-devtools/gcc/gcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.7.bb
@@ -1,5 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-configure-target.inc
-require gcc-package-target.inc
-
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
+require gcc-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb b/meta/recipes-devtools/gcc/gcc_4.8.bb
index f68c67a..0ae22e8 100644
--- a/meta/recipes-devtools/gcc/gcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
@@ -1,5 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-configure-target.inc
-require gcc-package-target.inc
-
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
+require gcc-target.inc
-- 
1.8.1.2


