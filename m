Received: from exprod5og107.obsmtp.com ([64.18.0.184])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.donnelly@ge.com>) id 1Ucffg-00013M-1p
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:39:27 +0200
Received: from alpmlip10.e2k.ad.ge.com ([12.43.191.1]) (using TLSv1) by
	exprod5ob107.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUZPECFXaq64zjuCYI2E7S8Tc6OYt2opJ@postini.com;
	Wed, 15 May 2013 10:21:13 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by alpmlip10.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	15 May 2013 13:11:09 -0400
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 15 May 2013 13:11:08 -0400
Received: from edna.edi.geip.ge.com (edna.edi.geip.ge.com [3.26.68.71])
	by selma.edi.geip.ge.com (Postfix) with ESMTP id 78FEFE03B9;
	Wed, 15 May 2013 18:11:07 +0100 (BST)
From: Martin Donnelly <martin.donnelly@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2013 18:10:57 +0100
Message-Id: <1368637857-3155-1-git-send-email-martin.donnelly@ge.com>
X-Mailer: git-send-email 1.7.1
Subject: [RFC] gcc: add gccgo support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 17:39:42 -0000

This is an initial attempt at adding gccgo support to the
gcc recipes. There are some issues that I wasn't able to
resolve properly that need resolved before this is usable
and likely even more that I didn't notice. It isn't ready
to be merged but feedback on what I've missed would be
appreciated.

In this state it builds working cross and target
compilers for GCC 4.7

The major issues I am aware of are:

* building with libffi causes circular dependencies 
  so I just disabled it in the initial and intermediate
  builds. I'm not sure this is the correct thing to do.
* Dependencies were not being pulled in where I thought
  they should be: meta-toolchain and target-sdk builds
  all needed additional dependencies above defining go
  in LANGUAGES. Should there be dependencies being
  created here?
* doesn't support gcc 4.8

Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    6 ++++--
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   13 +++++++++++++
 meta/recipes-devtools/gcc/gcc-package-target.inc   |   12 +++++++++++-
 meta/recipes-devtools/gcc/gcc-runtime_4.7.bb       |    2 +-
 6 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index a05cac9..cad8aa6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -107,7 +107,8 @@ EXTRA_OECONF_INITIAL = "--disable-libmudflap \
 			--with-system-zlib \
 			--disable-lto \
 			--disable-plugin \
-			--enable-decimal-float=no"
+			--enable-decimal-float=no \
+			--without-libffi"
 
 EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 				--disable-libgomp \
@@ -115,7 +116,8 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 				--with-system-zlib \
 				--disable-lto \
 				--disable-plugin \
-				--disable-libssp"
+				--disable-libssp \
+				--without-libffi "
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index a9f77d9..255a2eb 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -7,7 +7,7 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=${STAGING_DIR_TARGET} \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
-RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp libgo"
 #  ?
 # libiberty
 # libmudflap
diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
index 3d81677..82183a0 100644
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
@@ -18,7 +18,7 @@ do_install () {
 	# found. These need to be relative paths so they work in different locations.
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran gccgo; do
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
 	done
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index 2e2f75a..71f84b1 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -16,6 +16,9 @@ PACKAGES = "\
   libgomp \
   libgomp-dev \
   libgomp-staticdev \
+  libgo \
+  libgo-dev \
+  libgo-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -75,6 +78,16 @@ FILES_libgomp-staticdev = "\
   ${libdir}/libgomp*.a \
   "
 
+FILES_libgo = "${libdir}/libgo.so.* ${libdir}/go"
+FILES_libgo-dev = "\
+  ${libdir}/libgo.so \
+  ${libdir}/libgo.la \
+  "
+FILES_libgo-staticdev = " \
+  ${libdir}/libgo.a \
+  ${libdir}/libgobegin.a \
+  "
+
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index 95a92c1..7608b69 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -5,6 +5,7 @@ PACKAGES = "\
   g77 g77-symlinks \
   gfortran gfortran-symlinks \
   gcov gcov-symlinks \
+  go go-symlinks \
   ${PN}-plugin-dev \
   ${PN}-doc \
   ${PN}-dev \
@@ -12,7 +13,8 @@ PACKAGES = "\
 "
 
 FILES_${PN} = "\
-  ${bindir}/${TARGET_PREFIX}gcc* \
+  ${bindir}/${TARGET_PREFIX}gcc \
+  ${bindir}/${TARGET_PREFIX}gcc-* \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
@@ -84,6 +86,11 @@ FILES_g++-symlinks = "\
   ${bindir}/g++ \
 "
 
+FILES_go = "\
+  ${bindir}/${TARGET_PREFIX}gccgo \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/go1"
+FILES_go-symlinks = "${bindir}/gccgo"
+
 
 FILES_${PN}-doc = "\
   ${infodir} \
@@ -130,6 +137,9 @@ do_install () {
 		ln -sf ${TARGET_PREFIX}gfortran gfortran || true
 		ln -sf gfortran f95 || true
 	fi
+	if [ -e ${TARGET_PREFIX}gccgo ]; then
+		ln -sf ${TARGET_PREFIX}gccgo gccgo || true
+	fi
 	ln -sf ${TARGET_PREFIX}g++ g++
 	ln -sf ${TARGET_PREFIX}gcc gcc
 	ln -sf ${TARGET_PREFIX}cpp cpp
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
index fbaf057..7c4698b 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
@@ -4,5 +4,5 @@ require gcc-package-runtime.inc
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
-EXTRA_OECONF += "--disable-libunwind-exceptions"
+EXTRA_OECONF += "--disable-libunwind-exceptions --without-libffi"
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
-- 
1.7.1



