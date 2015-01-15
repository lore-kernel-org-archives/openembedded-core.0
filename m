Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B36D671637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 16:31:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0FGVD4Z001730
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 08:31:13 -0800 (PST)
Received: from otp-ovpserver-d1.corp.ad.wrs.com (128.224.124.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 08:31:13 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 18:31:11 +0200
Message-ID: <1421339471-11486-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Thu, 15 Jan 2015 16:31:20 -0000
Content-Type: text/plain

Remove libgfortran packages from PACKAGES list and skip them at compiling
and installing as long as libgfortran has separate receipe since commit

5bde5d9b39ea67f19a1a6aedd0c08c6cfedcbe5f
gcc: Allow fortran to build successfully in 4.8

Otherwise, when fortran support will be enabled in the compiler, both
lingfortran and gcc-runtime receipes will create the same files and will
try to install them. This will cause errors:

ERROR: The recipe libgfortran is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are: ...
Please verify which recipe should provide the above files.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 41 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 167869e..c3b4a46 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -22,28 +22,34 @@ do_configure () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	hardlinkdir ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$mtarget ${B}
 	for d in libgcc ${RUNTIMETARGET}; do
-		echo "Configuring $d"
-		rm -rf ${B}/$target/$d/
-		mkdir -p ${B}/$target/$d/
-		cd ${B}/$target/$d/
-		chmod a+x ${S}/$d/configure
-		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+		if [ "$d" != "libgfortran" ]; then
+			echo "Configuring $d"
+			rm -rf ${B}/$target/$d/
+			mkdir -p ${B}/$target/$d/
+			cd ${B}/$target/$d/
+			chmod a+x ${S}/$d/configure
+			${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+		fi
 	done
 }
 
 do_compile () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	for d in libgcc ${RUNTIMETARGET}; do
-		cd ${B}/$target/$d/
-		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
+		if [ "$d" != "libgfortran" ]; then
+			cd ${B}/$target/$d/
+			oe_runmake MULTIBUILDTOP=${B}/$target/$d/
+		fi
 	done
 }
 
 do_install () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	for d in ${RUNTIMETARGET}; do
-		cd ${B}/$target/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
+		if [ "$d" != "libgfortran" ]; then
+			cd ${B}/$target/$d/
+			oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
+		fi
 	done
 	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
@@ -76,9 +82,6 @@ PACKAGES = "\
     libssp \
     libssp-dev \
     libssp-staticdev \
-    libgfortran \
-    libgfortran-dev \
-    libgfortran-staticdev \
     libmudflap \
     libmudflap-dev \
     libmudflap-staticdev \
@@ -131,18 +134,6 @@ FILES_libssp-dev = "\
 "
 FILES_libssp-staticdev = "${libdir}/libssp*.a"
 
-FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = "\
-    ${libdir}/libgfortran*.so \
-    ${libdir}/libgfortran.spec \
-    ${libdir}/libgfortran.la \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
-"
-FILES_libgfortran-staticdev = "${libdir}/libgfortran.a"
-
-INSANE_SKIP_${MLPREFIX}libgfortran-dev = "staticdev"
-
 FILES_libquadmath = "${libdir}/libquadmath*.so.*"
 FILES_libquadmath-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
-- 
1.8.1.4


