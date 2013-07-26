Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id 304476041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 20:50:59 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 4E6B8A036F5; Fri, 26 Jul 2013 07:49:36 -0500 (CDT)
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 07:49:36 -0500
Message-Id: <325132904dbc428915b590a17ad28ff2d2d022a4.1374842539.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1374842539.git.peter.seebach@windriver.com>
References: <cover.1374842539.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1374842539.git.peter.seebach@windriver.com>
References: <cover.1374842539.git.peter.seebach@windriver.com>
Subject: [PATCH 1/1] Always try to build 32-bit libpseudo when NO32LIBS is set to 0
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
X-List-Received-Date: Fri, 26 Jul 2013 20:50:59 -0000

This is for Yocto bug #4920. The NO32LIBS variable is intended to allow
the user to force the creation of a 32-bit libpseudo, for use with things
like prebuilt binary toolchains. Unfortunately, the tests for likely
compilability (stubs-32.h) were still present, so you would get silent
failures. And if you did cause it to try to build, the failures were not
particularly clearly explained.

So, we:
1. Emit at least a message during configuration saying we're only
building 64-bit, if we are.
2. Warn the user for at least one common case where we know builds
are likely to fail.
3. If NO32LIBS is 0, we try the compile for sure, and if it fails,
we've emitted at least some sort of message up near the top of the
compile output that tells you what might be wrong.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 50 +++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 3baf3af..5451aa2 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -37,14 +37,44 @@ do_compile () {
 	oe_runmake ${MAKEOPTS}
 }
 
+maybe_make32() {
+	# We probably don't need to build 32-bit binaries.
+	make32=false
+	if [ "${SITEINFO_BITS}" = "64" ]; then
+		case "${NO32LIBS}" in
+		0)	make32=true
+			;;
+		1)	make32=false
+			;;
+		*)	# If unset, build 32-bit if we think we can.
+			if [ -e "/usr/include/gnu/stubs-32.h" ]; then
+				make32=true
+			fi
+			;;
+		esac
+	fi
+	if $make32; then
+		if ! [ -e "/usr/include/gnu/stubs-32.h" ]; then
+			echo >&2 "WARNING: Can't find stubs-32.h, but usually need it to build 32-bit libpseudo."
+			echo >&2 "If the build fails, install 32-bit developer packages."
+			echo >&2 "If you are using 32-bit binaries, the 32-bit libpseudo is NOT optional."
+		else
+			echo "Attempting to build 32-bit libpseudo.so for ${PN}."
+		fi
+	else
+		echo "Building/installing only 64-bit libpseudo.so for ${PN}."
+		echo "If you need to run 32-bit executables, ensure that NO32LIBS is set to 0."
+	fi
+}
+
 # Two below are the same
 # If necessary compile for the alternative machine arch.  This is only 
 # necessary in a native build.
 do_compile_prepend_class-native () {
-	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
+	maybe_make32
+	if $make32; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
-                # ... and we really, really, hope that the native host is
-                # x86, or else --bits may not work.
+		# Note that this is not well-tested outside of x86/x86_64.
 
 		# if we're being rebuilt due to a dependency change, we need to make sure
 		# everything is clean before we configure and build -- if we haven't previously
@@ -59,10 +89,10 @@ do_compile_prepend_class-native () {
 }
 
 do_compile_prepend_class-nativesdk () {
-	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
-		# We need the 32-bit libpseudo on a 64-bit machine...
-                # ... and we really, really, hope that the native host is
-                # x86, or else --bits may not work.
+	maybe_make32
+	if $make32; then
+		# We need the 32-bit libpseudo on a 64-bit machine.
+		# Note that this is not well-tested outside of x86/x86_64.
 		./configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
 		oe_runmake ${MAKEOPTS} libpseudo
 		# prevent it from removing the lib, but remove everything else
@@ -78,14 +108,16 @@ do_install () {
 # If necessary install for the alternative machine arch.  This is only 
 # necessary in a native build.
 do_install_append_class-native () {
-	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
+	maybe_make32
+	if $make32; then
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi
 }
 
 do_install_append_class-nativesdk () {
-	if [ "${SITEINFO_BITS}" = "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" = "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
+	maybe_make32
+	if $make32; then
 		mkdir -p ${D}${prefix}/lib/pseudo/lib
 		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
 	fi
-- 
1.8.3


