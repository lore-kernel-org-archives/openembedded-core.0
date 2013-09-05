Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD706157A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 21:14:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85LRiaP029818 for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 22:28:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aNp8X5HNMLIH
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 22:28:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85LS1JE029827
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 22:28:03 +0100
Message-ID: <1378415685.32427.81.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Sep 2013 22:14:45 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-runtime: Add packaging for libgfortran (and also tweak others)
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
X-List-Received-Date: Thu, 05 Sep 2013 21:14:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add packaging for libgfortran and libquadmath as well as tweak the packaging
for libmudflap since it was broken.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index b882889..2599760 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -48,6 +48,7 @@ do_install () {
 		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ install
 	done
 	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
+	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
 		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
 	fi
@@ -76,8 +77,13 @@ PACKAGES = "\
   libssp-staticdev \
   libgfortran \
   libgfortran-dev \
+  libgfortran-staticdev \
   libmudflap \
   libmudflap-dev \
+  libmudflap-staticdev \
+  libquadmath \
+  libquadmath-dev \
+  libquadmath-staticdev \
   libgomp \
   libgomp-dev \
   libgomp-staticdev \
@@ -119,15 +125,30 @@ FILES_libssp-staticdev = " \
 
 FILES_libgfortran = "${libdir}/libgfortran.so.*"
 FILES_libgfortran-dev = " \
-  ${libdir}/libgfortran.a \
-  ${libdir}/libgfortran.so \
-  ${libdir}/libgfortranbegin.a"
+  ${libdir}/libgfortran*.so \
+  ${libdir}/libgfortran.spec \
+  ${libdir}/libgfortran.la \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single*"
+FILES_libgfortran-staticdev = " \
+  ${libdir}/libgfortran.a"
+
+INSANE_SKIP_${MLPREFIX}libgfortran-dev = "staticdev"
+
+FILES_libquadmath = "${libdir}/libquadmath*.so.*"
+FILES_libquadmath-dev = "\
+  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
+  ${libdir}/libquadmath*.so \
+  ${libdir}/libquadmath.la"
+FILES_libquadmath-staticdev = "\
+  ${libdir}/libquadmath.a"
 
 FILES_libmudflap = "${libdir}/libmudflap*.so.*"
 FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.so \
-  ${libdir}/libmudflap*.a \
-  ${libdir}/libmudflap*.la"
+  ${libdir}/libmudflap.la"
+FILES_libmudflap-staticdev = "\
+  ${libdir}/libmudflap.a"
 
 FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
 FILES_libgomp-dev = "\



