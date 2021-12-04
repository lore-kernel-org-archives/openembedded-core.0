Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Subject: [RFC PATCH v3 4/4] Improve native reproducibility in recipes
Date: Sat,  4 Dec 2021 22:29:40 +0100
Message-Id: <20211204212940.3787349-5-jacob.kroon@gmail.com>
In-Reply-To: <20211204212940.3787349-1-jacob.kroon@gmail.com>
References: <20211204212940.3787349-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Avoid encoding build-specific paths in the resulting binaries.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 ...sysroot-and-debug-prefix-map-from-co.patch | 78 -------------------
 .../openssl/openssl/strip-buildinfo.patch     | 13 ++++
 .../openssl/openssl_3.0.0.bb                  | 10 +--
 meta/recipes-core/ncurses/ncurses.inc         |  4 +
 .../util-linux/util-linux_2.37.2.bb           |  2 +-
 .../libtool/libtool-native_2.4.6.bb           |  1 +
 ...ism.patch => perl-cross-determinism.patch} |  0
 .../perl-cross/perlcross_1.3.6.bb             |  4 +-
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  3 +
 .../pkgconfig/pkgconfig_git.bb                |  1 +
 .../python/python3/determinism.patch          | 15 ++++
 .../recipes-devtools/python/python3_3.10.0.bb |  8 ++
 12 files changed, 53 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch
 rename meta/recipes-devtools/perl-cross/files/{determinism.patch => perl-cross-determinism.patch} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/determinism.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
deleted file mode 100644
index 60890c666d..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
-Date: Tue, 6 Nov 2018 14:50:47 +0100
-Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
- info
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The openssl build system generates buildinf.h containing the full
-compiler command line used to compile objects. This breaks
-reproducibility, as the compile command is baked into libcrypto, where
-it is used when running `openssl version -f`.
-
-Add stripped build variables for the compiler and cflags lines, and use
-those when generating buildinfo.h.
-
-This is based on a similar patch for older openssl versions:
-https://patchwork.openembedded.org/patch/147229/
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Martin Hundebøll <martin@geanix.com>
-
-Update to fix buildpaths qa issue for '-fmacro-prefix-map'.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Update to fix buildpaths qa issue for '-ffile-prefix-map'.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Configurations/unix-Makefile.tmpl | 12 +++++++++++-
- crypto/build.info                 |  2 +-
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index f88a70f..528cdef 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -471,13 +471,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
-                          '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
- BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
- 
--# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
-+# *_Q variables are used for one thing only: to build up buildinf.h
- CPPFLAGS_Q={- $cppflags1 =~ s|([\\"])|\\$1|g;
-               $cppflags2 =~ s|([\\"])|\\$1|g;
-               $lib_cppflags =~ s|([\\"])|\\$1|g;
-               join(' ', $lib_cppflags || (), $cppflags2 || (),
-                         $cppflags1 || ()) -}
- 
-+CFLAGS_Q={- for (@{$config{CFLAGS}}) {
-+              s|-fdebug-prefix-map=[^ ]+|-fdebug-prefix-map=|g;
-+              s|-fmacro-prefix-map=[^ ]+|-fmacro-prefix-map=|g;
-+              s|-ffile-prefix-map=[^ ]+|-ffile-prefix-map=|g;
-+            }
-+            join(' ', @{$config{CFLAGS}}) -}
-+
-+CC_Q={- $config{CC} =~ s|--sysroot=[^ ]+|--sysroot=recipe-sysroot|g;
-+        join(' ', $config{CC}) -}
-+
- PERLASM_SCHEME= {- $target{perlasm_scheme} -}
- 
- # For x86 assembler: Set PROCESSOR to 386 if you want to support
-diff --git a/crypto/build.info b/crypto/build.info
-index efca6cc..eda433e 100644
---- a/crypto/build.info
-+++ b/crypto/build.info
-@@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
- 
- DEPEND[info.o]=buildinf.h
- DEPEND[cversion.o]=buildinf.h
--GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
-+GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC_Q) $(CFLAGS_Q) $(CPPFLAGS_Q)" "$(PLATFORM)"
- 
- GENERATE[uplink-x86.s]=../ms/uplink-x86.pl
- GENERATE[uplink-x86_64.s]=../ms/uplink-x86_64.pl
diff --git a/meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch b/meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch
new file mode 100644
index 0000000000..0a4a60273d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch
@@ -0,0 +1,13 @@
+Index: openssl-3.0.0/crypto/build.info
+===================================================================
+--- openssl-3.0.0.orig/crypto/build.info
++++ openssl-3.0.0/crypto/build.info
+@@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
+ 
+ DEPEND[info.o]=buildinf.h
+ DEPEND[cversion.o]=buildinf.h
+-GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
++GENERATE[buildinf.h]=../util/mkbuildinf.pl "empty"
+ 
+ GENERATE[uplink-x86.s]=../ms/uplink-x86.pl
+ GENERATE[uplink-x86_64.s]=../ms/uplink-x86_64.pl
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
index 4b1ae71a85..5237e12c7a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://armv8-32bit.patch \
            file://0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch \
+           file://strip-buildinfo.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
@@ -47,10 +47,6 @@ EXTRA_OECONF:append:libc-musl:powerpc64 = " no-asm"
 EXTRA_OECONF:class-native = "--with-rand-seed=os,devrandom"
 EXTRA_OECONF:class-nativesdk = "--with-rand-seed=os,devrandom"
 
-# Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
-CFLAGS:append:class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-CFLAGS:append:class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-
 # This allows disabling deprecated or undesirable crypto algorithms.
 # The default is to trust upstream choices.
 DEPRECATED_CRYPTO_FLAGS ?= ""
@@ -132,6 +128,10 @@ do_configure () {
 	perl ${B}/configdata.pm --dump
 }
 
+do_compile:class-native () {
+	oe_runmake OPENSSLDIR=/non/existent ENGINESDIR=/non/existent MODULESDIR=/non/existent
+}
+
 do_install () {
 	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
 
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index a0ecd8a80b..3c15498dd4 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -91,10 +91,14 @@ ncurses_configure() {
 	        --with-manpage-format=normal \
 	        --without-manpage-renames \
 	        --disable-stripping \
+	        ${EXTRA_CLASS_FLAGS} \
 	        "$@" || return 1
 	cd ..
 }
 
+EXTRA_CLASS_FLAGS = ""
+EXTRA_CLASS_FLAGS:class-native = "--datadir=/non/existent --with-terminfo-dirs=/non/existent"
+
 # Override the function from the autotools class; ncurses requires a
 # patched autoconf213 to generate the configure script. This autoconf
 # is not available so that the shipped script will be used.
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
index d609c30067..09f83eb4dd 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
@@ -83,7 +83,7 @@ EXTRA_OECONF = "\
 "
 
 EXTRA_OECONF:append:class-target = " --enable-setpriv"
-EXTRA_OECONF:append:class-native = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF:append:class-native = " --without-cap-ng --disable-setpriv --runstatedir=/non/existent SYSCONFSTATICDIR=/non/existent"
 EXTRA_OECONF:append:class-nativesdk = " --without-cap-ng --disable-setpriv"
 EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
index 3b20ce3e69..ea19b86d4a 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://prefix.patch"
 inherit native
 
 EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
+CACHED_CONFIGUREVARS += "lt_cv_sys_dlsearch_path=/non/existent"
 
 do_configure:prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
similarity index 100%
rename from meta/recipes-devtools/perl-cross/files/determinism.patch
rename to meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index 2759ef8a53..dab7f4558f 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
-           file://determinism.patch \
+           file://perl-cross-determinism.patch \
            file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
            "
@@ -33,7 +33,7 @@ do_compile () {
 
 do_install:class-native() {
     mkdir -p ${D}/${datadir}/perl-cross/
-    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
+    cp -rfL ${S}/* ${D}/${datadir}/perl-cross/
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 16d45ccff3..7eeb2393a2 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -97,6 +97,9 @@ do_configure:class-native() {
     -Dvendorprefix=${prefix} \
     -Ui_xlocale \
     ${PACKAGECONFIG_CONFARGS}
+
+    # See the comment above
+    sed -i -e "s,${STAGING_DIR_NATIVE},/non/existent,g" config.h
 }
 
 do_configure:append() {
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index c220bafd90..a7b2cae624 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -28,6 +28,7 @@ inherit autotools
 # so just continue that behaviour.
 #
 EXTRA_OECONF += "--disable-indirect-deps"
+EXTRA_OECONF:append:class-native = " --libdir=/non/existent --with-pc-path=/non/existent"
 
 PACKAGECONFIG ??= "glib"
 PACKAGECONFIG:class-native = ""
diff --git a/meta/recipes-devtools/python/python3/determinism.patch b/meta/recipes-devtools/python/python3/determinism.patch
new file mode 100644
index 0000000000..eca7755d4e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/determinism.patch
@@ -0,0 +1,15 @@
+Index: Python-3.10.0/Makefile.pre.in
+===================================================================
+--- Python-3.10.0.orig/Makefile.pre.in
++++ Python-3.10.0/Makefile.pre.in
+@@ -791,8 +791,8 @@ Modules/getbuildinfo.o: $(PARSER_OBJS) \
+ 
+ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
+ 	$(CC) -c $(PY_CORE_CFLAGS) -DPYTHONPATH='"$(PYTHONPATH)"' \
+-		-DPREFIX='"$(prefix)"' \
+-		-DEXEC_PREFIX='"$(exec_prefix)"' \
++		-DPREFIX='"/non/existent"' \
++		-DEXEC_PREFIX='"/non/existent"' \
+ 		-DVERSION='"$(VERSION)"' \
+ 		-DVPATH='"$(VPATH)"' \
+ 		-o $@ $(srcdir)/Modules/getpath.c
diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
index c9f21b5e16..ba74bcaa68 100644
--- a/meta/recipes-devtools/python/python3_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -41,6 +41,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            file://no-import-test.patch \
+           file://determinism.patch \
            "
 SRC_URI[sha256sum] = "5a99f8e7a6a11a7b98b4e75e0d1303d3832cada5534068f69c7b6222a7b1b002"
 
@@ -80,6 +81,8 @@ DEPENDS:append:class-nativesdk = " python3-native"
 # force to use the mutex+cond implementation (https://bugs.python.org/issue41710)
 CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
 
+CFLAGS:append:class-native = " -ffile-prefix-map=${WORKDIR}=/usr/src"
+
 EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
 EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 
@@ -95,6 +98,7 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptc=no \
                 ac_cv_working_tzset=yes \
 "
+CACHED_CONFIGUREVARS:append:class-native = " ac_cv_prog_cc_g=no"
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
@@ -181,6 +185,8 @@ do_install:append() {
         # More info: http://benno.id.au/blog/2013/01/15/python-determinism
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
+
+        find ${D}${libdir}/python${PYTHON_MAJMIN} -name __pycache__ | xargs -n1 rm -r
 }
 
 do_install:append:class-nativesdk () {
@@ -399,3 +405,5 @@ SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
+
+EXTRA_STAGING_FIXMES:append:class-native = " WORKDIR"
