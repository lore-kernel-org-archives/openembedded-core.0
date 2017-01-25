Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED1D730BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeOdg022768; Wed, 25 Jan 2017 11:40:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CVBfUwD9mu9V; Wed, 25 Jan 2017 11:40:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBeL5O022747
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 11:40:22 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cWLw5-0001NQ-SW; Wed, 25 Jan 2017 11:40:21 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 11:40:18 +0000
Message-Id: <1485344418-5237-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485344418-5237-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485344418-5237-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] gcc: Clean up unnecessary variable confusion
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

SDKPKGSUFFIX could only really be "nativesdk" and TARGET_SYS never contains
that so the code manipulating TARGET_SYS is pointless. I suspect this once
worked against MULTIMACH_TARGET_SYS which would be a different question but
it no longer does. Its been cut and pasted everywhere.

This patch cleans up the variable references to make things a little more
readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc    | 19 ++++++++-----------
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 25 ++++++++++---------------
 meta/recipes-devtools/gcc/libgcc-common.inc  |  9 +++------
 meta/recipes-devtools/gcc/libgfortran.inc    | 23 +++++++++--------------
 4 files changed, 30 insertions(+), 46 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 00856ad..745cf74 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -32,15 +32,14 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
 
 do_configure () {
 	export CXX="${CXX} -nostdinc++ -nostdlib++"
-	target=${TARGET_SYS}
 
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
-		rm -rf ${B}/$target/$d/
-		mkdir -p ${B}/$target/$d/
-		cd ${B}/$target/$d/
+		rm -rf ${B}/${TARGET_SYS}/$d/
+		mkdir -p ${B}/${TARGET_SYS}/$d/
+		cd ${B}/${TARGET_SYS}/$d/
 		chmod a+x ${S}/$d/configure
-		relpath=${@os.path.relpath("${S}/$d", "${B}/$target/$d")}
+		relpath=${@os.path.relpath("${S}/$d", "${B}/${TARGET_SYS}/$d")}
 		$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 	done
 }
@@ -48,18 +47,16 @@ EXTRACONFFUNCS += "extract_stashed_builddir"
 do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	for d in libgcc ${RUNTIMETARGET}; do
-		cd ${B}/$target/$d/
-		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
+		cd ${B}/${TARGET_SYS}/$d/
+		oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
 	done
 }
 
 do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	for d in ${RUNTIMETARGET}; do
-		cd ${B}/$target/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
+		cd ${B}/${TARGET_SYS}/$d/
+		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
 	done
 	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index ae3afe0..f97885b 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -12,34 +12,29 @@ EXTRA_OECONF_PATHS = "\
 "
 
 do_configure () {
-    target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-
-    echo "Configuring libsanitizer"
-    rm -rf ${B}/$target/libsanitizer/
-    mkdir -p ${B}/$target/libsanitizer/
-    cd ${B}/$target/libsanitizer/
+    rm -rf ${B}/${TARGET_SYS}/libsanitizer/
+    mkdir -p ${B}/${TARGET_SYS}/libsanitizer/
+    cd ${B}/${TARGET_SYS}/libsanitizer/
     chmod a+x ${S}/libsanitizer/configure
-    relpath=${@os.path.relpath("${S}/libsanitizer", "${B}/$target/libsanitizer")}
+    relpath=${@os.path.relpath("${S}/libsanitizer", "${B}/${TARGET_SYS}/libsanitizer")}
     $relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
     # Easiest way to stop bad RPATHs getting into the library since we have a
     # broken libtool here
-    sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/$target/libsanitizer/libtool
+    sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/${TARGET_SYS}/libsanitizer/libtool
     # Link to the sysroot's libstdc++ instead of one gcc thinks it just built
-    sed -i -e '/LIBSTDCXX_RAW_CXX_\(CXXFLAGS\|LDFLAGS\)\s*=/d' ${B}/$target/libsanitizer/*/Makefile
+    sed -i -e '/LIBSTDCXX_RAW_CXX_\(CXXFLAGS\|LDFLAGS\)\s*=/d' ${B}/${TARGET_SYS}/libsanitizer/*/Makefile
 }
 EXTRACONFFUNCS += "extract_stashed_builddir"
 do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
-    target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-    cd ${B}/$target/libsanitizer/
-    oe_runmake MULTIBUILDTOP=${B}/$target/libsanitizer/
+    cd ${B}/${TARGET_SYS}/libsanitizer/
+    oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/libsanitizer/
 }
 
 do_install () {
-    target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-    cd ${B}/$target/libsanitizer/
-    oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/libsanitizer/ install
+    cd ${B}/${TARGET_SYS}/libsanitizer/
+    oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/libsanitizer/ install
     if [ -d ${D}${infodir} ]; then
         rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
     fi
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index c0efc29..848a476 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -5,10 +5,9 @@ require gcc-configure-common.inc
 INHIBIT_DEFAULT_DEPS = "1"
 
 do_configure () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
 	mkdir -p ${B}/${BPN}
-	mkdir -p ${B}/$target/${BPN}/
+	mkdir -p ${B}/${TARGET_SYS}/${BPN}/
 	cd ${B}/${BPN}
 	chmod a+x ${S}/${BPN}/configure
 	relpath=${@os.path.relpath("${S}/${BPN}", "${B}/${BPN}")}
@@ -18,15 +17,13 @@ EXTRACONFFUNCS += "extract_stashed_builddir"
 do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	cd ${B}/${BPN}
-	oe_runmake MULTIBUILDTOP=${B}/$target/${BPN}/
+	oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/${BPN}/
 }
 
 do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	cd ${B}/${BPN}
-	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ install
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/${BPN}/ install
 
 	# Move libgcc_s into /lib
 	mkdir -p ${D}${base_libdir}
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index d3e2b41..4846dec 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -6,32 +6,27 @@ EXTRA_OECONF_PATHS = "\
 "
 
 do_configure () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-
-	echo "Configuring libgfortran"
-	rm -rf ${B}/$target/libgfortran/
-	mkdir -p ${B}/$target/libgfortran/
-	cd ${B}/$target/libgfortran/
+	rm -rf ${B}/${TARGET_SYS}/libgfortran/
+	mkdir -p ${B}/${TARGET_SYS}/libgfortran/
+	cd ${B}/${TARGET_SYS}/libgfortran/
 	chmod a+x ${S}/libgfortran/configure
-	relpath=${@os.path.relpath("${S}/libgfortran", "${B}/$target/libgfortran")}
+	relpath=${@os.path.relpath("${S}/libgfortran", "${B}/${TARGET_SYS}/libgfortran")}
 	$relpath/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
 	# Easiest way to stop bad RPATHs getting into the library since we have a
 	# broken libtool here
-	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/$target/libgfortran/libtool
+	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${B}/${TARGET_SYS}/libgfortran/libtool
 }
 EXTRACONFFUNCS += "extract_stashed_builddir"
 do_configure[depends] += "${COMPILERDEP}"
 
 do_compile () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	cd ${B}/$target/libgfortran/
-	oe_runmake MULTIBUILDTOP=${B}/$target/libgfortran/
+	cd ${B}/${TARGET_SYS}/libgfortran/
+	oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/libgfortran/
 }
 
 do_install () {
-	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
-	cd ${B}/$target/libgfortran/
-	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/libgfortran/ install
+	cd ${B}/${TARGET_SYS}/libgfortran/
+	oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/libgfortran/ install
 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
 		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
 	fi
-- 
2.7.4


