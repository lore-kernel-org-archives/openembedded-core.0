Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKzYr-0004TL-Ky for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:10:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JM1HTH019046
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:01:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18528-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:01:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JM16lH019039
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:01:07 +0100
Message-ID: <1334872869.3028.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2012 23:01:09 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] pseudo: Fix bashisms
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
X-List-Received-Date: Thu, 19 Apr 2012 22:10:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 6ac1301..3a37c69 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -25,7 +25,7 @@ NO32LIBS ??= "1"
 
 # Compile for the local machine arch...
 do_compile () {
-	if [ "${SITEINFO_BITS}" == "64" ]; then
+	if [ "${SITEINFO_BITS}" = "64" ]; then
 	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
 	else
 	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
@@ -37,7 +37,7 @@ do_compile () {
 # If necessary compile for the alternative machine arch.  This is only 
 # necessary in a native build.
 do_compile_prepend_virtclass-native () {
-	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
+	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
 		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
@@ -47,7 +47,7 @@ do_compile_prepend_virtclass-native () {
 }
 
 do_compile_prepend_virtclass-nativesdk () {
-	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
+	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
 		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
@@ -64,14 +64,14 @@ do_install () {
 # If necessary install for the alternative machine arch.  This is only 
 # necessary in a native build.
 do_install_append_virtclass-native () {
-	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
+	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi
 }
 
 do_install_append_virtclass-nativesdk () {
-	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
+	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi




