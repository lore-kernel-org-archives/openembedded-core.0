Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C8DC433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 12:12:35 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web09.33357.1639311154345086855
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e5myzcEX;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id z8so19962213ljz.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u+sO54PxTX6Y50otY5qc9L5wp2i6z9Aik+TMs8N5EQg=;
        b=e5myzcEXO7HsUYRkecdClCN2n2BmZrFYngu7eOAcXQyVCIIUU4eSYMXWk42iiyVW5k
         wQle989u91wgBf3QwymQC+CtSSwDdUMvpLx1LPFHNAZTokbt4CZ53Cof051atktgV73t
         O4k5QrO8o0reHxK0bqkd+EG+JwFw9ll8pSNJtP1sQaLUgIHHKSxv3/NQyWAOQT/224Go
         C8JUc52sOLNt1GoWIyTpEd11C6orMK6rXdeN3KuwlhLUvcqxcOAZz8EVkl1k4hDdf/4g
         N75rVV3mfH47etQcZqlv/eickjHINHzL5pnDuJvQ7KnXN8ivP2PXJ5WBN8QYn5Bb0Et6
         znUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+sO54PxTX6Y50otY5qc9L5wp2i6z9Aik+TMs8N5EQg=;
        b=mbsp179xbWGIxFkqSOW8+GT8Jaehr4OMlVsT+WhjdWu0RN33xTsSSSWDn5+RbSUdqa
         +gIop/Gq80kXxj1DBkdsOyHnV6FeN9XqxTQBbVJ0b9O9kHDSU2FG268wPwMl71UK9rNX
         +uUvugID52TesCrTBUAF99wAwubNk/FM82Ag43iFox9PQCVYkI7Mf7y39q8yRYgGsfVs
         jW1aZllSYL+2+wjwf0VflHOgEbGbGzBviA7YgiuHQaOL0ZLrhpINr3TI7vEAg/ycEiFm
         P17/vSgIk7IWDERPi4rl51g6DiZMw0N42zL5RwPD5wl5tgFmzwoW1lCMP3RLzZZgW8HZ
         ddbQ==
X-Gm-Message-State: AOAM530sQS0Q4VE9e2Jf9D3Vg8/lZ7Fc2vubNvy49M26n9th2tU927Ie
	T5yH47yEcK0OWLqHDt1HcmUZYPyNAfnGww==
X-Google-Smtp-Source: 
 ABdhPJy4pOpIZ5ym8V2MT0+uukAgmSDIGcmGWo962AYaBu+gjrrvolSGf7oXmKLCu9O4LlgqFDhrmw==
X-Received: by 2002:a2e:97c7:: with SMTP id m7mr23738094ljj.134.1639311152361;
        Sun, 12 Dec 2021 04:12:32 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 q3sm1011596lfr.295.2021.12.12.04.12.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 04:12:32 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v4 2/2] Improve native reproducibility in recipes
Date: Sun, 12 Dec 2021 13:11:56 +0100
Message-Id: <20211212121156.3271203-3-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212121156.3271203-1-jacob.kroon@gmail.com>
References: <20211212121156.3271203-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 12:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159579

Avoid encoding build-specific paths in the resulting binaries.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 ...sysroot-and-debug-prefix-map-from-co.patch | 24 ++++++++++++-------
 .../openssl/openssl_3.0.0.bb                  | 12 ++++++----
 meta/recipes-core/ncurses/ncurses.inc         |  9 +++++--
 .../util-linux/util-linux_2.37.2.bb           |  2 +-
 .../libtool/libtool-native_2.4.6.bb           |  1 +
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  3 +++
 .../pkgconfig/pkgconfig_git.bb                |  1 +
 .../python/python3/determinism.patch          | 17 +++++++++++++
 .../recipes-devtools/python/python3_3.10.1.bb |  8 +++++++
 9 files changed, 61 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/determinism.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 60890c666d..b725f11ff5 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -29,22 +29,27 @@ Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Removed buildpath from being passed in '-isystem' flag
+
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+
 ---
  Configurations/unix-Makefile.tmpl | 12 +++++++++++-
  crypto/build.info                 |  2 +-
  2 files changed, 12 insertions(+), 2 deletions(-)
 
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index f88a70f..528cdef 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -471,13 +471,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+Index: openssl-3.0.0/Configurations/unix-Makefile.tmpl
+===================================================================
+--- openssl-3.0.0.orig/Configurations/unix-Makefile.tmpl
++++ openssl-3.0.0/Configurations/unix-Makefile.tmpl
+@@ -471,13 +471,25 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
 -# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
 +# *_Q variables are used for one thing only: to build up buildinf.h
  CPPFLAGS_Q={- $cppflags1 =~ s|([\\"])|\\$1|g;
++              $cppflags1 =~ s|-isystem[^ ]+||g;
                $cppflags2 =~ s|([\\"])|\\$1|g;
                $lib_cppflags =~ s|([\\"])|\\$1|g;
                join(' ', $lib_cppflags || (), $cppflags2 || (),
@@ -54,6 +59,7 @@ index f88a70f..528cdef 100644
 +              s|-fdebug-prefix-map=[^ ]+|-fdebug-prefix-map=|g;
 +              s|-fmacro-prefix-map=[^ ]+|-fmacro-prefix-map=|g;
 +              s|-ffile-prefix-map=[^ ]+|-ffile-prefix-map=|g;
++              s|-isystem[^ ]+||g;
 +            }
 +            join(' ', @{$config{CFLAGS}}) -}
 +
@@ -63,10 +69,10 @@ index f88a70f..528cdef 100644
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-diff --git a/crypto/build.info b/crypto/build.info
-index efca6cc..eda433e 100644
---- a/crypto/build.info
-+++ b/crypto/build.info
+Index: openssl-3.0.0/crypto/build.info
+===================================================================
+--- openssl-3.0.0.orig/crypto/build.info
++++ openssl-3.0.0/crypto/build.info
 @@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
index da73ed6bc3..caf12a9802 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
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
@@ -135,6 +131,14 @@ do_configure () {
 	perl ${B}/configdata.pm --dump
 }
 
+do_compile:class-native () {
+	oe_runmake OPENSSLDIR=/non/existent ENGINESDIR=/non/existent MODULESDIR=/non/existent
+}
+
+do_compile:class-nativesdk () {
+	oe_runmake OPENSSLDIR=/non/existent ENGINESDIR=/non/existent MODULESDIR=/non/existent
+}
+
 do_install () {
 	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
 
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index a0ecd8a80b..aefbc3917c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -38,15 +38,20 @@ base_libdir:class-native = "${libdir}"
 # Display corruption occurs on 64 bit hosts without these settings
 # This was derrived from the upstream debian ncurses which uses
 # these settings for 32 and 64 bit hosts.
+# Avoid embedding build paths in the native/nativesdk binaries.
 EXCONFIG_ARGS = ""
 EXCONFIG_ARGS:class-native = " \
 		--disable-lp64 \
 		--with-chtype='long' \
-		--with-mmask-t='long'"
+		--with-mmask-t='long' \
+		--datadir=/non/existent \
+		--with-terminfo-dirs=/non/existent"
 EXCONFIG_ARGS:class-nativesdk = " \
 		--disable-lp64 \
 		--with-chtype='long' \
-		--with-mmask-t='long'"
+		--with-mmask-t='long' \
+		--datadir=/non/existent \
+		--with-terminfo-dirs=/non/existent"
 
 PACKAGES_DYNAMIC = "^${PN}-lib.*"
 
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
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index a6ae80f07e..a69816c922 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -99,6 +99,9 @@ do_configure:class-native() {
     -Ui_xlocale \
     -Alddlflags=' ${LDFLAGS}' \
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
index 0000000000..23c47cff77
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/determinism.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
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
diff --git a/meta/recipes-devtools/python/python3_3.10.1.bb b/meta/recipes-devtools/python/python3_3.10.1.bb
index 6115ffe5b3..ae015748ca 100644
--- a/meta/recipes-devtools/python/python3_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3_3.10.1.bb
@@ -40,6 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
+           file://determinism.patch \
            "
 SRC_URI[sha256sum] = "a7f1265b6e1a5de1ec5c3ec7019ab53413469934758311e9d240c46e5ae6e177"
 
@@ -79,6 +80,8 @@ DEPENDS:append:class-nativesdk = " python3-native"
 # force to use the mutex+cond implementation (https://bugs.python.org/issue41710)
 CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
 
+CFLAGS:append:class-native = " -ffile-prefix-map=${WORKDIR}=/usr/src"
+
 EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
 EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 
@@ -94,6 +97,7 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptc=no \
                 ac_cv_working_tzset=yes \
 "
+CACHED_CONFIGUREVARS:append:class-native = " ac_cv_prog_cc_g=no"
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
@@ -180,6 +184,8 @@ do_install:append() {
         # More info: http://benno.id.au/blog/2013/01/15/python-determinism
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
+
+        find ${D}${libdir}/python${PYTHON_MAJMIN} -name __pycache__ | xargs -n1 rm -r
 }
 
 do_install:append:class-nativesdk () {
@@ -398,3 +404,5 @@ SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
+
+EXTRA_STAGING_FIXMES:append:class-native = " WORKDIR"

