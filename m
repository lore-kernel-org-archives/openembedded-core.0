Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8Hcl-0005x4-B9 for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 22:17:59 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QKIs5O012502 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:18:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nEG1FWJWjqmk
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:18:54 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QKIm2O012498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 21:18:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2011 21:12:25 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317067951.26109.93.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] pseudo: Fix QA warnings
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
X-List-Received-Date: Mon, 26 Sep 2011 20:17:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes two QA warnings:

a) Debug files being contained in the main package (by adding
   an appropriate FILES expression)
b) Stop hardcoding the RPATH in the nativesdk case since our
   path is on the loaders default search path

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 0416a53..0c7185b 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -10,8 +10,14 @@ LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3"
 
 FILES_${PN} = "${libdir}/libpseudo.so ${bindir}/* ${localstatedir}/pseudo"
+FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
 PROVIDES += "virtual/fakeroot"
 
+# In the nativesdk case, we'll already search the searchpaths
+# pseudo tries to build in so override RPATH
+MAKEOPTS = ""
+MAKEOPTS_virtclass-nativesdk = "'RPATH='"
+
 inherit siteinfo
 
 do_configure () {
@@ -27,7 +33,7 @@ do_compile () {
 	else
 	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS}
 	fi
-	oe_runmake
+	oe_runmake ${MAKEOPTS}
 }
 
 # Two below are the same
@@ -37,9 +43,9 @@ do_compile_prepend_virtclass-native () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
 		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
-		oe_runmake libpseudo
+		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
-		make 'LIB=foo' distclean 
+		make 'LIB=foo' ${MAKEOPTS} distclean 
 	fi
 }
 
@@ -47,14 +53,14 @@ do_compile_prepend_virtclass-nativesdk () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
 		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
-		oe_runmake libpseudo
+		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
-		make 'LIB=foo' distclean 
+		make 'LIB=foo' ${MAKEOPTS} distclean 
 	fi
 }
 
 do_install () {
-	oe_runmake 'DESTDIR=${D}' 'LIB=lib/pseudo/lib$(MARK64)' install
+	oe_runmake 'DESTDIR=${D}' ${MAKEOPTS} 'LIB=lib/pseudo/lib$(MARK64)' install
 }
 
 # Two below are the same




