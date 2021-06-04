Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.5869.1622797840455309168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UWHje0oc;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id b11so10316873edy.4
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G9f4gbpx+RuvRrx3kA/PBchhmDv4JXMSmM5QwVOws9A=;
        b=UWHje0ocSr1lJi35W9VbTc2ON/Pn1Kp/rMLgyG7ZmbtxqYtcXCKtizsyoS0JPUyyBW
         RvvLKRlCdWHDevNSAFjBBdqcMAK4vSXGsnoiR3LR7wEGuUh0L1sqYKDl5AgkphrY2WFo
         2LBz3kMRGz1jPimEP7PVQVFABbCLopfm4bIQ8r8bzlVM2teYODdHSu1qENVUJ4dnLQlA
         5D4BXp3hg+Lm2hgz5i1cpvG9YTg3WiA8LvBU/o04QqabPlLUnMee+4IpewbsYpeUqH11
         pxPH3eEaHiPqDmgERWyP7QVaBUX0S4SDdT93MVapEoEVj4d59siNhOCF9/XByBrwypFw
         pwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G9f4gbpx+RuvRrx3kA/PBchhmDv4JXMSmM5QwVOws9A=;
        b=e9r0z+kNKNdBoS5xzr+H3oM8YoXV5JSKs/1tQxSAjEbaGQC95LOnZuYWJFShyGJ7GC
         gPAIYEHPhOL5pINlGEM7OXPTc9MgtKRFSVc0GK33CEjxD5fpmk5E13aqKZyEowYUAHkr
         zWqOQlx9yS/uh/GBfGp8iL4ncm11802NqjJBmBBwNavV60gV8uC0wdsMpysD5Zqe0Y95
         CqB096QFZG+QJY3pKCJsBGDggr0JPvlQ5mqjfIL/aJu1d1+EKxtit14mxDYIxOU5W3v/
         S4o6gXDuBpI2pNMET67TDgRfztY0fTstqaSkvGSrPGqLWaA/mLv1LyZ3aj4cFE8hX7dQ
         JpEA==
X-Gm-Message-State: AOAM533vz3jAdNs/HSw7qapB3CMrhh3HFdzjTqUB929SM/qsT0rewZE6
	Dwt8r11EGjVlCeyZpqQ9GzDdJOIPl7w8gQ==
X-Google-Smtp-Source: ABdhPJxIDLQG53fmG8sspSvQiBgZQGw9ee2UfIbQ70OB6b2BMYXPBk6JWOlHEC8tKiZukV0JoLlTtg==
X-Received: by 2002:a05:6402:1111:: with SMTP id u17mr3694688edv.87.1622797838880;
        Fri, 04 Jun 2021 02:10:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/11] perl: split perl-cross into its own recipe
Date: Fri,  4 Jun 2021 11:10:24 +0200
Message-Id: <20210604091030.1380877-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
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
 .../perl-cross/perlcross_1.3.5.bb             | 36 +++++++++++++++
 .../perl/files/determinism.patch              | 23 ----------
 meta/recipes-devtools/perl/perl_5.32.1.bb     | 17 ++-----
 9 files changed, 116 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/{perl => perl-cross}/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch (100%)
 rename meta/recipes-devtools/{perl => perl-cross}/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch (100%)
 rename meta/recipes-devtools/{perl => perl-cross}/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch (100%)
 create mode 100644 meta/recipes-devtools/perl-cross/files/README.md
 create mode 100644 meta/recipes-devtools/perl-cross/files/determinism.patch
 create mode 100644 meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ee118209db..6024d57717 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -558,6 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-perl-cross = "Alexander Kanavin <alex.kanavin@gmail.com>"
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
index 0000000000..9509313b86
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
@@ -0,0 +1,36 @@
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
+do_install() {
+    mkdir -p ${D}/${datadir}/perl-cross/
+    cp -rfp ${S}/* ${D}/${datadir}/perl-cross/
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

