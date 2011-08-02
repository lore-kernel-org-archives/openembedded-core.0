Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+9dCWVLkJR2mk3+zWQ3Al2S5Smj3FB8ww=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoMO0-00081o-SQ
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 23:20:25 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72LG3qR005648
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 16:16:04 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 16:16:03 -0500
Message-Id: <1312319763-4379-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] gcc: Fix setting of GLIBC_DYNAMIC_LINKER
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
X-List-Received-Date: Tue, 02 Aug 2011 21:20:25 -0000

The sed regex in do_configure_prepend was producing the following result:

 #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "/lib64//ld-linux-x86-64.so.2"

instead of

 #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"

Additionally, with the regex fixed the manipulation of SYSTEMLIBS_DIR
needs to be removed.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   12 ++++++++----
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    2 +-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index b054266..3a6f273 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r3"
+PR = "r4"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index aac6d69..83a3972 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -66,11 +66,15 @@ SYSTEMLIBS1 = "${target_libdir}/"
 do_configure_prepend () {
 	# Change the default dynamic linker path, only useful for SDK, other's value
 	# are not changed according to the SYSTEMLIBS_DIR
+	#
+	# We want something like the following:
+	# 	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
+	# becomes
+	#	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
+	#
 	sed -i ${S}/gcc/config/*/linux*.h -e \
-		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
+		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR"/\3#'
 
-	SYSTEMLIBS_DIR=`dirname ${SYSTEMLIBS}`
-	[ "$SYSTEMLIBS_DIR" = "/" ] && SYSTEMLIBS_DIR=""
 	# teach gcc to find correct target includedir when checking libc ssp support
 	mkdir -p ${B}/gcc
 	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
@@ -85,7 +89,7 @@ do_configure_prepend () {
 #ifndef STANDARD_STARTFILE_PREFIX_2
 #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
 #endif
-#define SYSTEMLIBS_DIR "$SYSTEMLIBS_DIR"
+#define SYSTEMLIBS_DIR "$SYSTEMLIBS"
 #endif /* ! GCC_DEFAULTS_H */
 _EOF
 	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
index f036cb1..75901ba 100644
--- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r8"
+PR = "r9"
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
index 9fd2b0a..1bbab50 100644
--- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
-- 
1.7.3.4



