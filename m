Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE96E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.28157.1735901130853080466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ONj1PW6h;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso11693002f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901129; x=1736505929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvrmXaG5X7I862q7psx6l0jxOxxsRl2hK2JU6/p8LK0=;
        b=ONj1PW6h4h9f8RvKboMEagcUYnXmGei7zrvZ9fWVq/aOH3TJ3Vn/InCubQRy6T6tpb
         o92vtdY7hIFJ1lStO9hA/yUwvhfDFKWv+lX18zR3cbsD208dUKgoVlSIR9ew/ae9bton
         1HIBzmdI1A+JVvqxB3t6HcRfYcMia+EVrwbRFRCIs6BzgXENU2U3b06s6OpfSdOEUJtt
         zMFSKnOA8KVq3Yf2HpSgvKc8hYrp+ZS+oacIy7nmkpkgOj6WyQ4/o6tJugib+lMoSX72
         7KH5aAr5VDj4aOnhLVEtzJ4XFNi16fXjq5PTzJZ0l+/24kJUVdBMU2ThPqMuasrbuoZl
         iEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901129; x=1736505929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvrmXaG5X7I862q7psx6l0jxOxxsRl2hK2JU6/p8LK0=;
        b=aqDYS3txKU7u2TU0L91vEt1YCqzXbHLmV5IigvH1iqiiktBQUppx9vPZkI7b0GP6sV
         Be9ya+5V7dga4jEu+ehW27qYFjwLTHD9/KQAew/QpNqJ8Y8oC2LagJCvQ1GIKrxxkKVR
         cW300i6FtRVm+xjzyM/LEvvjYVUE1ZApbsg672Bgp/0kdz22haUPDx3iDK+51f67QV26
         geJNwr9nZ8Y0kEQMKTLFUSAS8OhcJNx0QHZW6IszfafStafFw2NfWw5Q2BI8Ou7aySbU
         sZVEK2JERmsEJXcKjb8HYMZ60abQh7VRFFwaxni8Sr/8MUiHNWWWTisqm+n15wgU4LKO
         Rg2g==
X-Gm-Message-State: AOJu0Yy9Kseel8aOwI0t0nqruiqCR/K7rK2AHcjXvZeHcdNoOvD6/LPw
	a7yowJqayfEQ0sv0F6/wenAhJ2e2mbaHF3LotnYjRW3xNtecPaU+tZR1Ig==
X-Gm-Gg: ASbGncv6teiVzK2l+AQvgvFhAtT9szjgf7mhP71OwQzDTpzsAkUjXlR43z1Wk2gOh+l
	0QBKb3AhYiYcdjPuJflOQbqeXIA8iBz38d1aeu7lgMYsabh8Hdn5/bPRdgF7EESlcc8nVAn9h7i
	52LHaMMSl85GgEZjFvEmQBJnCykRkUQZ92AO5UoJA3gHx8bf1tyTNTl86FgnpuMvYQK/y/0/1/1
	etpz1cduDXd/qQG9F43OtrKOr/6529ZU/xOaXlSvtidc+2/tV1x7jteSHmkHKGYImJH2FxiyhDd
	Lz/Pbvl/jLDrnkJtdg==
X-Google-Smtp-Source: AGHT+IGcnRXCF1IfM3msJZ02W9FA4xi69kMcX3cIyeq/GdWH43sy4PQpU0ubJPiGXPa96kv2rzUqsw==
X-Received: by 2002:a05:6000:4715:b0:385:f560:7916 with SMTP id ffacd0b85a97d-38a221fae73mr45473195f8f.35.1735901128779;
        Fri, 03 Jan 2025 02:45:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/11] gettext: update 0.22.5 -> 0.23.1
Date: Fri,  3 Jan 2025 11:45:14 +0100
Message-Id: <20250103104524.4053846-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209332

From: Alexander Kanavin <alex@linutronix.de>

Drop patches:
parallel.patch
(obsolete as no .a files are installed)

0001-intl-Fix-build-failure-with-make-j.patch
(backport)

Gettext no longer installs anything into $libdir/gettext by default
but still creates the directory and so it should be packaged.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/autotools.bbclass         |  4 +--
 ....5.bb => gettext-minimal-native_0.23.1.bb} |  2 +-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 ...t-env.in-do-not-add-C-CXX-parameters.patch |  8 ++---
 ...1-intl-Fix-build-failure-with-make-j.patch | 35 -------------------
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  8 ++---
 .../gettext/gettext/parallel.patch            | 31 ----------------
 .../gettext/gettext/serial-tests-config.patch |  8 ++---
 .../gettext/gettext/use-pkgconfig.patch       | 16 ++++-----
 .../{gettext_0.22.5.bb => gettext_0.23.1.bb}  |  9 +++--
 10 files changed, 28 insertions(+), 95 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.5.bb => gettext-minimal-native_0.23.1.bb} (96%)
 delete mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
 delete mode 100644 meta/recipes-core/gettext/gettext/parallel.patch
 rename meta/recipes-core/gettext/{gettext_0.22.5.bb => gettext_0.23.1.bb} (97%)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 9ebdca47680..a1d8e4b3603 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -212,8 +212,8 @@ autotools_do_configure() {
 			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
 			if [ -d ${S}/po/ ]; then
 				cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
-				if [ ! -e ${S}/po/remove-potcdate.sin ]; then
-					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/po/
+				if [ ! -e ${S}/po/remove-potcdate.sed ]; then
+					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${S}/po/
 				fi
 			fi
 			PRUNE_M4="$PRUNE_M4 gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4"
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
similarity index 96%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
index 96acf9bb9fc..e443b6b34fa 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
@@ -42,5 +42,5 @@ do_install () {
 	install -d ${D}${datadir}/gettext/po/
 	cp ${S}/build-aux/config.rpath ${D}${datadir}/gettext/
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
-	cp ${S}/gettext-runtime/po/remove-potcdate.sin ${D}${datadir}/gettext/po/
+	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index fd05837528c..5d90d81b58d 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94cb6c8fa48996a0"
+SRC_URI[sha256sum] = "52a578960fe308742367d75cd1dff8552c5797bd0beba7639e12bdcda28c0e49"
diff --git a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
index 33d45a038cf..e59c73fb7d8 100644
--- a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
+++ b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
@@ -1,4 +1,4 @@
-From c58c503c532d20883a93ef778327c86dd6de24f6 Mon Sep 17 00:00:00 2001
+From 9d36ff90d3a488caa8cd7b3351e5a3bdc4229b1b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 6 Mar 2020 21:04:05 +0000
 Subject: [PATCH] init-env.in: do not add C/CXX parameters
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/gettext-tools/tests/init-env.in b/gettext-tools/tests/init-env.in
-index cc84ffd..b69c990 100644
+index 0968388..3d9a8a5 100644
 --- a/gettext-tools/tests/init-env.in
 +++ b/gettext-tools/tests/init-env.in
 @@ -3,10 +3,6 @@ top_builddir=../..
@@ -24,6 +24,6 @@ index cc84ffd..b69c990 100644
 -CFLAGS="@CFLAGS@"
 -CXX="@CXX@"
 -CXXFLAGS="@CXXFLAGS@"
+ OBJC="@OBJC@"
+ OBJCFLAGS="@OBJCFLAGS@"
  CPPFLAGS="@CPPFLAGS@"
- LDFLAGS="@LDFLAGS@"
- LTLIBINTL="@LTLIBINTL@"
diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
deleted file mode 100644
index 144259dd3f2..00000000000
--- a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Tue, 12 Sep 2023 11:33:41 +0200
-Subject: [PATCH] intl: Fix build failure with "make -j".
-
-Reported by Christian Weisgerber <naddy@mips.inka.de> at
-<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
-
-* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gettextP.h
-and its subordinate includes.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=97a6a63ad61949663283f5fad68c9d5fb9be1f15]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- gettext-runtime/intl/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Makefile.am
-index da7abb758..9e56978bc 100644
---- a/gettext-runtime/intl/Makefile.am
-+++ b/gettext-runtime/intl/Makefile.am
-@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo
- ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
- plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
--langprefs.lo:        ../config.h
--log.lo:              ../config.h
-+langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
-+log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- printf.lo:           ../config.h
- setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
- version.lo:          ../config.h libgnuintl.h
--- 
-2.25.1
-
diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
index 94afb255c38..a8f6684bd70 100644
--- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
+++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
@@ -1,4 +1,4 @@
-From 7006142d199af13628edc687847a9a5bac48b45d Mon Sep 17 00:00:00 2001
+From 4e9ea45803fe8dfc41ec5c51a65048addd985765 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Jan 2020 16:44:38 +0100
 Subject: [PATCH] tests/autopoint-3: unset MAKEFLAGS
@@ -13,13 +13,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gettext-tools/tests/autopoint-3 b/gettext-tools/tests/autopoint-3
-index bd3fbf3..380eaac 100755
+index af2e17f..46cf3f7 100755
 --- a/gettext-tools/tests/autopoint-3
 +++ b/gettext-tools/tests/autopoint-3
-@@ -131,6 +131,7 @@ test $? = 0 || { cat autopoint.err; Exit 1; }
- ${CONFIG_SHELL} ./configure >/dev/null 2>autpoint.err
+@@ -137,6 +137,7 @@ ${CONFIG_SHELL} ./configure >/dev/null 2>autopoint.err
  test $? = 0 || { cat autopoint.err; Exit 1; }
  
+ : ${MAKE=make}
 +unset MAKEFLAGS
  ${MAKE} >/dev/null 2>autopoint.err
  test $? = 0 || { cat autopoint.err; Exit 1; }
diff --git a/meta/recipes-core/gettext/gettext/parallel.patch b/meta/recipes-core/gettext/gettext/parallel.patch
deleted file mode 100644
index 8ecba46fd0a..00000000000
--- a/meta/recipes-core/gettext/gettext/parallel.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 83333bc873c2655ff1de161f6b7db930f22f1cea Mon Sep 17 00:00:00 2001
-From: Joe Slater <jslater@windriver.com>
-Date: Thu, 7 Jun 2012 16:37:01 -0700
-Subject: [PATCH] instal libgettextlib.a before removing it
-
-In a multiple job build, Makefile can simultaneously
-be installing and removing libgettextlib.a.  We serialize
-the operations.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
----
- gettext-tools/gnulib-lib/Makefile.am | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnulib-lib/Makefile.am
-index ab729cd..a0d713e 100644
---- a/gettext-tools/gnulib-lib/Makefile.am
-+++ b/gettext-tools/gnulib-lib/Makefile.am
-@@ -58,6 +58,10 @@ AM_CFLAGS = @WARN_CFLAGS@
- # Rules generated and collected by gnulib-tool.
- include Makefile.gnulib
- 
-+# defined in Makefile.gnulib but missing this dependency
-+#
-+install-exec-clean: install-libLTLIBRARIES
-+
- # OS/2 does not support a DLL name longer than 8 characters.
- if OS2
- libgettextlib_la_LDFLAGS += -os2dllname gtlib
diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
index 7d39d6086ab..3baf5497952 100644
--- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
+++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
@@ -1,4 +1,4 @@
-From aa8dfe0aafd0b53a6c5bac61b356ca92e1430a36 Mon Sep 17 00:00:00 2001
+From 33fd16b0b2c69ec1118bb605384e7e3b1a94eee0 Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
 Date: Thu, 28 Jul 2016 12:36:15 +0800
 Subject: [PATCH] fix for ptest
@@ -15,7 +15,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f4e54ea..a47ff14 100644
+index 5106676..3114998 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext],
@@ -28,7 +28,7 @@ index f4e54ea..a47ff14 100644
  dnl Override automake's tar command used for creating distributions.
  am__tar='${AMTAR} chf - --format=ustar --owner=root --group=root "$$tardir"'
 diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
-index 126d069..aa23232 100644
+index e128f5b..9f7447c 100644
 --- a/gettext-runtime/configure.ac
 +++ b/gettext-runtime/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
@@ -41,7 +41,7 @@ index 126d069..aa23232 100644
  
  dnl Installation directories.
 diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
-index 3610ee3..6f56a23 100644
+index 3b1f461..14510a9 100644
 --- a/gettext-tools/configure.ac
 +++ b/gettext-tools/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index ceb1856118a..9774c4cce00 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 6aa1338b916fe72c200b6f160b934be15b6ff590 Mon Sep 17 00:00:00 2001
+From 7302a77e08e62fc3b00f75d8aa143c5565c3f680 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
@@ -19,10 +19,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  3 files changed, 31 insertions(+), 286 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
-index 0340490..0355388 100644
+index c7160d7..8e46cc7 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -13,6 +13,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
  dnl   forces the use of the included or an external libxml.
  AC_DEFUN([gl_LIBXML],
  [
@@ -30,7 +30,7 @@ index 0340490..0355388 100644
    AC_REQUIRE([AM_ICONV_LINK])
  
    ifelse([$1], , [
-@@ -30,106 +31,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" != yes; then
@@ -142,10 +142,10 @@ index 0340490..0355388 100644
    ])
    AC_SUBST([LIBXML])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
-index dbc9eb8..136e512 100644
+index baa2cf4..b287c5b 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
-@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
+@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
@@ -266,10 +266,10 @@ index dbc9eb8..136e512 100644
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
-index dbc9eb8..136e512 100644
+index baa2cf4..b287c5b 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
-@@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
+@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this notice is preserved.
  
  dnl From Bruno Haible.
  
diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.23.1.bb
similarity index 97%
rename from meta/recipes-core/gettext/gettext_0.22.5.bb
rename to meta/recipes-core/gettext/gettext_0.23.1.bb
index 0bf2a56e5fc..da4e6c68500 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.23.1.bb
@@ -22,13 +22,11 @@ RCONFLICTS:${PN} = "proxy-libintl"
 
 require gettext-sources.inc
 SRC_URI += " \
-           file://parallel.patch \
            file://use-pkgconfig.patch \
            file://run-ptest \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
-           file://0001-intl-Fix-build-failure-with-make-j.patch \
            "
 
 inherit autotools texinfo pkgconfig ptest
@@ -90,7 +88,7 @@ FILES:libgettextsrc = "${libdir}/libgettextsrc-*.so*"
 
 PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
-FILES:${PN} += "${libdir}/${BPN}/*"
+FILES:${PN} += "${libdir}/${BPN}/"
 
 # The its/Makefile.am has defined:
 # itsdir = $(pkgdatadir)$(PACKAGE_SUFFIX)/its
@@ -130,7 +128,7 @@ do_install:append:class-native () {
 	rm ${D}${datadir}/aclocal/*
 	rm ${D}${datadir}/gettext/config.rpath
 	rm ${D}${datadir}/gettext/po/Makefile.in.in
-	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
+	rm ${D}${datadir}/gettext/po/remove-potcdate.sed
 
         create_wrapper ${D}${bindir}/msgfmt \
                 GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-${PV}/"
@@ -175,7 +173,8 @@ do_install_ptest() {
         install ${B}/gettext-tools/misc/*       ${D}${PTEST_PATH}/misc
         find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
-                   ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2 ${D}${PTEST_PATH}/tests/xgettext-vala-6
+                   ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2 ${D}${PTEST_PATH}/tests/xgettext-vala-6 \
+                   ${D}${PTEST_PATH}/tests/plural-3 ${D}${PTEST_PATH}/tests/plural-4 ${D}${PTEST_PATH}/tests/xgettext-java-8 ${D}${PTEST_PATH}/tests/xgettext-java-9
         sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
 }
 
-- 
2.39.5


