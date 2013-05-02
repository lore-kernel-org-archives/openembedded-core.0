Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UY0RV-0004K4-TQ
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 22:49:30 +0200
Received: by mail-da0-f44.google.com with SMTP id z8so475756daj.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=nOFRdfr2Z4OMPAxPfdk1RYw4avWq4hDX7qptiYjTxyw=;
	b=zy2RpohQpEk8JKxTnTrb7c/3mJWSk0fFb0xgcJ2fw30iKpvX8sVfFnBJMTYhqCzGU8
	bDGz4SK9GrlkXCidLHETW/Wyyp6nAI0Xgkl4L++rjuiYcersXbpKrNuZngwSgBAM1wvM
	QiTSsE+BzuPC64eXbe7cPMcfDZkGGSElW8iMYM/t2inEzASecy5SBawyMKdjvmdyMYVy
	z1pypO79vZp2rh/DPTokk7AHD1CYP3rHcg0XqV9wdxxWMECzdCMBtV4zGqPwEPROa3t9
	UX1bR/PVFKubRNRc6/YSTWrCJ9CL3N/GqHaoNQU3ana1eRhMjWYpRUg090k3eOYGtgtA
	+yEw==
X-Received: by 10.68.170.66 with SMTP id ak2mr10556265pbc.123.1367526695272;
	Thu, 02 May 2013 13:31:35 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fn2sm764524pbc.15.2013.05.02.13.31.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 13:31:33 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 06:43:25 +1000
Message-Id: <1367527405-9831-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH v3] guile: Update to 2.0.9
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
X-List-Received-Date: Thu, 02 May 2013 20:49:30 -0000

fix_parallel_build_issue.patch is now part of upstream.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../guile/files/fix_parallel_build_issue.patch     |  20 ----
 meta/recipes-devtools/guile/guile_2.0.7.bb         | 103 ---------------------
 meta/recipes-devtools/guile/guile_2.0.9.bb         | 102 ++++++++++++++++++++
 3 files changed, 102 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
 delete mode 100644 meta/recipes-devtools/guile/guile_2.0.7.bb
 create mode 100644 meta/recipes-devtools/guile/guile_2.0.9.bb

diff --git a/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch b/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
deleted file mode 100644
index 761d51b..0000000
--- a/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Add explicit dependency for libpath.h on dynl.x which fixes a potential parallel build issue.
-
-Fixes Yocto bug# 3558
-
-Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
-
-Upstream-Status: Pending
-
-diff --git a/libguile/Makefile.am b/libguile/Makefile.am
-index e216435..016bd90 100644
---- a/libguile/Makefile.am
-+++ b/libguile/Makefile.am
-@@ -700,6 +700,7 @@ $(DOT_DOC_FILES) $(EXTRA_DOT_DOC_FILES): scmconfig.h snarf.h guile-snarf-docs.in
- error.x: cpp-E.c
- posix.x: cpp-SIG.c
- load.x: libpath.h
-+dynl.x: libpath.h
- 
- alldotdocfiles    = $(DOT_DOC_FILES) $(EXTRA_DOT_DOC_FILES)
- snarf2checkedtexi = GUILE_AUTO_COMPILE=0 $(top_builddir)/meta/uninstalled-env guild snarf-check-and-output-texi
diff --git a/meta/recipes-devtools/guile/guile_2.0.7.bb b/meta/recipes-devtools/guile/guile_2.0.7.bb
deleted file mode 100644
index b8ab88e..0000000
--- a/meta/recipes-devtools/guile/guile_2.0.7.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY = "Guile is the GNU Ubiquitous Intelligent Language for Extensions."
-DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for Extensions,\
- the official extension language for the GNU operating system.\
- Guile is a library designed to help programmers create flexible applications.\
- Using Guile in an application allows the application's functionality to be\
- extended by users or other programmers with plug-ins, modules, or scripts.\
- Guile provides what might be described as 'practical software freedom,'\
- making it possible for users to customize an application to meet their\
- needs without digging into the application's internals."
-
-HOMEPAGE = "http://www.gnu.org/software/guile/"
-SECTION = "devel"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
-
-SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
-           file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch \
-           file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch \
-           file://opensuse/guile-64bit.patch \
-           file://guile_2.0.6_fix_sed_error.patch \
-           file://arm_endianness.patch \
-           file://fix_parallel_build_issue.patch \
-           "
-
-#           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-#           file://opensuse/guile-turn-off-gc-test.patch 
-
-SRC_URI[md5sum] = "30ff9e94663a2e2098b52f8ce9d050b9"
-SRC_URI[sha256sum] = "6f278fa699685382ae51ba8bfad5840959e0af6414f3ad803d61131567bfa338"
-
-PR = "r1"
-
-inherit autotools gettext
-BBCLASSEXTEND = "native"
-
-DEPENDS = "libunistring bdwgc gmp libtool libffi"
-# add guile-native only to the target recipe's DEPENDS
-DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) != 'guile']}"
-
-EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix', ''][bb.data.inherits_class('native',d)]}"
-
-do_configure_prepend() {
-	mkdir -p po
-}
-
-export GUILE_FOR_BUILD="${BUILD_SYS}-guile"
-
-do_compile_append() {
-	# just for target recipe
-	if [ "${PN}" = "guile" ]
-	then
-		sed -i -e s:${STAGING_DIR_TARGET}::g \
-	               -e s:/${TARGET_SYS}::g \
-	               -e s:-L/usr/lib::g \
-        	       -e s:-isystem/usr/include::g \
-	               -e s:,/usr/lib:,\$\{libdir\}:g \
-	                  meta/guile-2.0.pc
-	fi
-}
-
-do_install_append_class-native() {
-	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
-
-	create_wrapper ${D}/${bindir}/guile \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-	create_wrapper ${D}${bindir}/${HOST_SYS}-guile \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-}
-
-SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
-
-guile_cross_config() {
-	# this is only for target recipe
-	if [ "${PN}" = "guile" ]
-	then
-	        # Create guile-config returning target values instead of native values
-	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
-			> guile-config.cross
-	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
-			-e 's:",[ \t]*": . ":' \
-			-e 's:" *}, *\\:"):' \
-			-e 's:^.*cachedir.*$::' \
-			-e '/^  (/p' \
-			< libguile/libpath.h >> guile-config.cross
-	        echo '))' >> guile-config.cross
-	        cat meta/guile-config >> guile-config.cross
-	        install guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
-	fi
-}
-
-# Guile needs the compiled files to be newer than the source, and it won't
-# auto-compile into the prefix even if it can write there, so touch them here as
-# sysroot is managed.
-SSTATEPOSTINSTFUNCS += "guile_sstate_postinst"
-guile_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-                find ${STAGING_DIR_TARGET}/${libdir}/guile/2.0/ccache -type f | xargs touch
-	fi
-}
diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
new file mode 100644
index 0000000..617f7ce
--- /dev/null
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -0,0 +1,102 @@
+SUMMARY = "Guile is the GNU Ubiquitous Intelligent Language for Extensions."
+DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for Extensions,\
+ the official extension language for the GNU operating system.\
+ Guile is a library designed to help programmers create flexible applications.\
+ Using Guile in an application allows the application's functionality to be\
+ extended by users or other programmers with plug-ins, modules, or scripts.\
+ Guile provides what might be described as 'practical software freedom,'\
+ making it possible for users to customize an application to meet their\
+ needs without digging into the application's internals."
+
+HOMEPAGE = "http://www.gnu.org/software/guile/"
+SECTION = "devel"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
+
+SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
+           file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch \
+           file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch \
+           file://opensuse/guile-64bit.patch \
+           file://guile_2.0.6_fix_sed_error.patch \
+           file://arm_endianness.patch \
+           "
+
+#           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
+#           file://opensuse/guile-turn-off-gc-test.patch 
+
+SRC_URI[md5sum] = "a69b575d4a633bdd9118f3a4a1e97766"
+SRC_URI[sha256sum] = "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37f2895b"
+
+PR = "r0"
+
+inherit autotools gettext
+BBCLASSEXTEND = "native"
+
+DEPENDS = "libunistring bdwgc gmp libtool libffi"
+# add guile-native only to the target recipe's DEPENDS
+DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) != 'guile']}"
+
+EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix', ''][bb.data.inherits_class('native',d)]}"
+
+do_configure_prepend() {
+	mkdir -p po
+}
+
+export GUILE_FOR_BUILD="${BUILD_SYS}-guile"
+
+do_compile_append() {
+	# just for target recipe
+	if [ "${PN}" = "guile" ]
+	then
+		sed -i -e s:${STAGING_DIR_TARGET}::g \
+	               -e s:/${TARGET_SYS}::g \
+	               -e s:-L/usr/lib::g \
+        	       -e s:-isystem/usr/include::g \
+	               -e s:,/usr/lib:,\$\{libdir\}:g \
+	                  meta/guile-2.0.pc
+	fi
+}
+
+do_install_append_class-native() {
+	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
+
+	create_wrapper ${D}/${bindir}/guile \
+		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
+		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
+	create_wrapper ${D}${bindir}/${HOST_SYS}-guile \
+		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
+		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
+}
+
+SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
+
+guile_cross_config() {
+	# this is only for target recipe
+	if [ "${PN}" = "guile" ]
+	then
+	        # Create guile-config returning target values instead of native values
+	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
+        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
+			> guile-config.cross
+	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
+			-e 's:",[ \t]*": . ":' \
+			-e 's:" *}, *\\:"):' \
+			-e 's:^.*cachedir.*$::' \
+			-e '/^  (/p' \
+			< libguile/libpath.h >> guile-config.cross
+	        echo '))' >> guile-config.cross
+	        cat meta/guile-config >> guile-config.cross
+	        install guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
+	fi
+}
+
+# Guile needs the compiled files to be newer than the source, and it won't
+# auto-compile into the prefix even if it can write there, so touch them here as
+# sysroot is managed.
+SSTATEPOSTINSTFUNCS += "guile_sstate_postinst"
+guile_sstate_postinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+                find ${STAGING_DIR_TARGET}/${libdir}/guile/2.0/ccache -type f | xargs touch
+	fi
+}
-- 
1.8.2.1



