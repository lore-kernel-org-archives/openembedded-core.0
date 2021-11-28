Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Subject: [RFC PATCH 3/9] openssl: Improve native reproducibility
Date: Sun, 28 Nov 2021 10:45:26 +0100
Message-Id: <20211128094532.1145820-4-jacob.kroon@gmail.com>
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

The proposed changes here should probably be fixed to have
no impact on target.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 ...sysroot-and-debug-prefix-map-from-co.patch | 78 -------------------
 .../openssl/openssl/strip-buildinfo.patch     | 13 ++++
 .../openssl/openssl_3.0.0.bb                  | 10 +--
 3 files changed, 18 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/strip-buildinfo.patch

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
index 8852a51ca8..ccfd16b79b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://armv8-32bit.patch \
+           file://strip-buildinfo.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
@@ -46,10 +46,6 @@ EXTRA_OECONF:append:libc-musl:powerpc64 = " no-asm"
 EXTRA_OECONF:class-native = "--with-rand-seed=os,devrandom"
 EXTRA_OECONF:class-nativesdk = "--with-rand-seed=os,devrandom"
 
-# Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
-CFLAGS:append:class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-CFLAGS:append:class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-
 # This allows disabling deprecated or undesirable crypto algorithms.
 # The default is to trust upstream choices.
 DEPRECATED_CRYPTO_FLAGS ?= ""
@@ -131,6 +127,10 @@ do_configure () {
 	perl ${B}/configdata.pm --dump
 }
 
+do_compile:class-native () {
+	oe_runmake OPENSSLDIR=/non/existent ENGINESDIR=/non/existent MODULESDIR=/non/existent
+}
+
 do_install () {
 	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
 
