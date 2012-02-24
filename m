Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0m4L-00030w-Ta
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 04:43:42 +0100
Received: by mail-pw0-f47.google.com with SMTP id rp12so199116pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 19:35:21 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.224.9 as permitted sender) client-ip=10.68.224.9; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.224.9 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.224.9])
	by 10.68.224.9 with SMTP id qy9mr2062419pbc.102.1330054521776 (num_hops
	= 1); Thu, 23 Feb 2012 19:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LT+cJIbbxjuWuslugue/fr1VOQLwXbe7ua49VrUIf/0=;
	b=I94kL0LUQkEsFZ8BNG2N1RenyHy9nvHEf2+VcgGUC/uNRn/yW+JfNvlSfG1o7RTxHo
	TF5lFQZPOIMJPVIVRjC6A4OhdAJN6cPaYnuQqS4kQszNasiajyq/yJ1tq6eapCNxZ6as
	OzMY8jn7jfJFoGJT/EegCL9kF6Z8qwgTiTrhA=
Received: by 10.68.224.9 with SMTP id qy9mr1723556pbc.102.1330054521732;
	Thu, 23 Feb 2012 19:35:21 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id x3sm3155131pbn.5.2012.02.23.19.35.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 19:35:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 19:33:53 -0800
Message-Id: <5d914dfb50ca71a629852ec30f1af229864fd615.1330053959.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8c8ecaccdb0df61b8c734b3db79bed2cc4f05445.1330053959.git.raj.khem@gmail.com>
References: <8c8ecaccdb0df61b8c734b3db79bed2cc4f05445.1330053959.git.raj.khem@gmail.com>
In-Reply-To: <cover.1330053959.git.raj.khem@gmail.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] gcc: Stash the gcc-cross builddir to reuse in libgcc and gcc-runtime
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
X-List-Received-Date: Fri, 24 Feb 2012 03:43:42 -0000

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
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |   24 ++++++++++------
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |   14 +--------
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   30 ++++++++++++++++----
 6 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index ece378d..be38139 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r22"
+PR = "r23"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index c4b6ac1..c060c56 100644
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
index c872e00..1522ab2 100644
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
+			cp -a . $dest
 		;;
 	esac
 }
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 01a3b57..8a5f156 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -20,15 +20,27 @@ FILES_libgcov-dev = " \
 
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
@@ -38,6 +50,12 @@ do_install () {
 		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
 	fi
 
+	# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
+	# so that cross-gcc can find it in the sysroot
+
+	mv ${D}${libdir}/gcc/* ${D}${libdir}
+	rm -rf ${D}${libdir}/gcc/
+
 	chown -R root:root ${D}
 	chmod +x ${D}${base_libdir}/libgcc_s.so.*
 }
-- 
1.7.5.4



