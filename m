Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.5865.1622798107214088482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o+h/z2nj;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w21so10221744edv.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YizjPfaeTr8QOorEQMz9fWQWTcUzz24VI5N7t2iBfGI=;
        b=o+h/z2nj86q/Ow3nvpAHE4oVg/vgKaqFO+4e+HUL6fQ6tOz+N7AbKp5cVcBJwYaoHN
         Z96q1bbE0np1K1TXpj33rvJQ1m7KZw5Pf6x+ifIGHCZVcMLPqKyUiFawxhrxysCNVgGq
         7WVmeMPPz9lmSbw69nBj5Lv9Rq5UrpnV0Q3xKMcXBULg4n6YpNR18tEQXil/SoJCOiNb
         EL53EKPK7CiUwcc3xrWhRfNTfrS/iDRwzXUKftt43tOLkXHGerlJpbtaVHoyAsnN2+47
         DmLCBegBi0W4+YIKiNk6tr7bR7H2T4ebkgonL7FK1f4+YpSYr/4kSaLYbDuwWwsMviuk
         Uryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YizjPfaeTr8QOorEQMz9fWQWTcUzz24VI5N7t2iBfGI=;
        b=ALv1diBYlUKBUSfZfR+D/8NqhVMHsQwosqSKAZjCjcTM7shAJBDxM8bpw2zqDmpz58
         Mrw9YpuxnuamtX/yl4aUqaEyMp/MpRVvnVAjf/micuSROUBHzk0GMLNIob9tqhd+XLOs
         bcuCjZRdxRTctkLLb+mts7PUk3xvUmVh8ExkB1dHgPKPE4/DirSycihwSSPBoLlOdVGJ
         eaKyOXRDx81G30q4OosEnwfuFoXenSqYOMpe0ZOyM4dtCU7s3sFMHIqYDEjzaeDplij5
         Sg+cB4ikIJGiBCBiSIt1R1Wln2Uqs/51gSFX0w2BjA0k0TUnCXliYPUY2Xk6SLlHFN/n
         Od+w==
X-Gm-Message-State: AOAM533QftwpTL16Sn9DI1cV52lKbxSLjbDQeZqLiEpJhbmxXB4HYfA2
	HdNevcOT7s4tbDQLUqtncuOlhL1akvbYyQ==
X-Google-Smtp-Source: ABdhPJzVIR4WhVbqEdqkYY+yoMFpFBZHC8e9hQTKs6x3cXBHhj0yeVVjlFSIuvWk7BPHEprlA+ITgw==
X-Received: by 2002:aa7:c349:: with SMTP id j9mr3699087edr.48.1622798105734;
        Fri, 04 Jun 2021 02:15:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/10] perl: split perl-cross into its own recipe
Date: Fri,  4 Jun 2021 11:14:53 +0200
Message-Id: <20210604091458.1381144-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As perl and perl-cross need to be updated (and patches rebased)
in lockstep, devtool upgrade (and therefore AUH) can't cope with it.
Manually updating is still possible, but painful.

Split determinism.patch into perl and perl-cross parts, move the
rest of the perl-cross patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...h-do-not-hardcode-prefix-lib-as-libr.patch |  0
 ...h-do-not-quote-the-argument-to-comma.patch |  0
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  0
 .../perl-cross/files/README.md                | 29 ++++++++++++
 .../perl-cross/files/determinism.patch        | 46 +++++++++++++++++++
 .../perl-cross/perlcross_1.3.5.bb             | 38 +++++++++++++++
 .../perl/files/determinism.patch              | 23 ----------
 meta/recipes-devtools/perl/perl_5.32.1.bb     | 17 ++-----
 9 files changed, 118 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/{perl => perl-cross}/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch (100%)
 rename meta/recipes-devtools/{perl => perl-cross}/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch (100%)
 rename meta/recipes-devtools/{perl => perl-cross}/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch (100%)
 create mode 100644 meta/recipes-devtools/perl-cross/files/README.md
 create mode 100644 meta/recipes-devtools/perl-cross/files/determinism.patch
 create mode 100644 meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ee118209db..89dec1f86a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -558,6 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-perlcross = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
diff --git a/meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
similarity index 100%
rename from meta/recipes-devtools/perl/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
rename to meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
diff --git a/meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
similarity index 100%
rename from meta/recipes-devtools/perl/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
rename to meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
diff --git a/meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
similarity index 100%
rename from meta/recipes-devtools/perl/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
rename to meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
diff --git a/meta/recipes-devtools/perl-cross/files/README.md b/meta/recipes-devtools/perl-cross/files/README.md
new file mode 100644
index 0000000000..93217245c8
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/README.md
@@ -0,0 +1,29 @@
+**perl-cross** provides configure script, top-level Makefile
+and some auxiliary files for [perl](http://www.perl.org),  
+with the primary emphasis on cross-compiling the source.  
+
+    # Get perl and perl-cross sources
+    curl -L -O http://www.cpan.org/src/5.0/perl-5.24.1.tar.gz
+    curl -L -O https://github.com/arsv/perl-cross/releases/download/1.1.3/perl-cross-1.1.3.tar.gz
+
+    # Unpack perl-cross over perl, overwriting Makefile
+    tar -zxf perl-5.24.1.tar.gz
+    cd perl-5.24.1
+    tar --strip-components=1 -zxf ../perl-cross-1.1.3.tar.gz
+
+    # Proceed as usual with most autoconfed packages
+    ./configure --target=arm-linux-gnueabi --prefix=/usr -Duseshrplib
+    make -j4
+    make DESTDIR=/path/to/staging/dir install
+
+Unlike mainline Perl, this configure never runs any target executables,  
+relying solely on compile/link tests and pre-defined hints.  
+On the flip side, it is only meant to run on resonably sane modern unix systems.  
+
+Check [project pages](http://arsv.github.io/perl-cross/) for more info.  
+In particular, [configure usage](http://arsv.github.io/perl-cross/usage.html)
+lists available configure options.
+
+Perl-cross is a free software licensed under the same terms
+as the original perl source.  
+See LICENSE, Copying and Artistic files.
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/determinism.patch
new file mode 100644
index 0000000000..e9bf752bcb
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -0,0 +1,46 @@
+Fixes to make the perl build reproducible:
+
+a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
+   whether the shell is bash or dash which can cause the test result to be incorrect.
+   Reported upstream: https://github.com/arsv/perl-cross/issues/87
+
+b) Sort the order of the module lists from configure_mods.sh since otherwise
+   the result isn't the same leading to makefile differences.
+   Reported upstream: https://github.com/arsv/perl-cross/issues/88
+
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst 
+   there for good measure)
+   This needs to go to upstream perl (not done)
+
+d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
+   and "" with dash
+   Reported upstream: https://github.com/arsv/perl-cross/issues/87
+
+RP 2020/2/7
+
+Upstream-Status: Pending [75% submitted]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+
+Index: perl-5.30.1/cnf/configure_mods.sh
+===================================================================
+--- perl-5.30.1.orig/cnf/configure_mods.sh
++++ perl-5.30.1/cnf/configure_mods.sh
+@@ -82,7 +82,7 @@ extonlyif() {
+ }
+ 
+ definetrimspaces() {
+-	v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'`
++	v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//' | xargs -n1 | LANG=C sort | xargs`
+ 	define $1 "$v"
+ }
+ 
+Index: perl-5.30.1/cnf/configure
+===================================================================
+--- perl-5.30.1.orig/cnf/configure
++++ perl-5.30.1/cnf/configure
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ base=${0%/*}; test -z "$base" && base=.
+ 
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
new file mode 100644
index 0000000000..0d81d4d0f1
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Perl-cross build system"
+HOMEPAGE = "https://github.com/arsv/perl-cross"
+DESCRIPTION = "perl-cross provides configure script, top-level Makefile and some auxiliary files for perl, \
+with the primary emphasis on cross-compiling the source."
+SECTION = "devel"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+# README.md is taken from https://github.com/arsv/perl-cross/blob/master/README.md
+# but is not provided inside the release tarballs
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
+
+inherit allarch
+
+SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross \
+           file://README.md \
+           file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
+           file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
+           file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
+           file://determinism.patch \
+"
+UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
+
+SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
+
+S = "${WORKDIR}/perl-cross-${PV}"
+
+do_configure () {
+}
+
+do_compile () {
+}
+
+do_install_class-native() {
+    mkdir -p ${D}/${datadir}/perl-cross/
+    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
+}
+
+BBCLASSEXTEND = "native"
+
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index ccdd52a0d0..aa85ccef10 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -21,19 +21,6 @@ RP 2020/2/7
 Upstream-Status: Pending [75% submitted]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
-Index: perl-5.30.1/cnf/configure_mods.sh
-===================================================================
---- perl-5.30.1.orig/cnf/configure_mods.sh
-+++ perl-5.30.1/cnf/configure_mods.sh
-@@ -82,7 +82,7 @@ extonlyif() {
- }
- 
- definetrimspaces() {
--	v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//'`
-+	v=`echo "$2" | sed -r -e 's/\s+/ /g' -e 's/^\s+//' -e 's/\s+$//' | xargs -n1 | LANG=C sort | xargs`
- 	define $1 "$v"
- }
- 
 Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
 ===================================================================
 --- perl-5.30.1.orig/cpan/Encode/Byte/Makefile.PL
@@ -56,13 +43,3 @@ Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
      {
          print FILELIST $self->catfile($dir,$file) . "\n";
      }
-Index: perl-5.30.1/cnf/configure
-===================================================================
---- perl-5.30.1.orig/cnf/configure
-+++ perl-5.30.1/cnf/configure
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- 
- base=${0%/*}; test -z "$base" && base=.
- 
diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
index b28040c7fb..01db924a73 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -9,18 +9,14 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
-           file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
            file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
            file://errno_ver.diff \
            file://native-perlinc.patch \
-           file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://perl-dynloader.patch \
-           file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://0002-Constant-Fix-up-shebang.patch \
-           file://determinism.patch  \
+           file://determinism.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
@@ -30,13 +26,12 @@ SRC_URI_append_class-target = " \
 "
 
 SRC_URI[perl.sha256sum] = "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
-SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
 
 S = "${WORKDIR}/perl-${PV}"
 
 inherit upstream-version-is-even update-alternatives
 
-DEPENDS += "zlib virtual/crypt"
+DEPENDS += "perlcross-native zlib virtual/crypt"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
@@ -47,12 +42,8 @@ PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
 # Don't generate comments in enc2xs output files. They are not reproducible
 export ENC2XS_NO_COMMENTS = "1"
 
-do_unpack_append() {
-    bb.build.exec_func('do_copy_perlcross', d)
-}
-
-do_copy_perlcross() {
-    cp -rfp ${WORKDIR}/perl-cross*/* ${S}
+do_configure_prepend() {
+    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
 }
 
 do_configure_class-target() {
-- 
2.31.1

