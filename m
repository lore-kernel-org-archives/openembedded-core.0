Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7622C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 14:05:37 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.84301.1717423529668659679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 07:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IknH8/8K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso4144329e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 07:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717423527; x=1718028327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=63un3JFHD6lIlJ0RNBhv5zsg730CazqbSO3eCJ+cpb0=;
        b=IknH8/8KmGyE7t6pXeUp1oRSPx9uOk5BW9lEn4tI+mOb4NXQodhJ5QXTPRRGjEb4q/
         1ZTXhrCDszm/FXIK/7GDmgqKYOAUSShM96Tt97IWbtrt6eOWOG/q4SIo0T2VrD11x6LQ
         cp5Ula16J5yA95EzdQLnrhPwQ/vr61IqoJXn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717423528; x=1718028328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63un3JFHD6lIlJ0RNBhv5zsg730CazqbSO3eCJ+cpb0=;
        b=O9P0qfqvFJ1zhE8h9lX1u5c9dA+q0S3dlG9N/cUTG8NvkQhiUDSGBSWZs0JpiEXb0I
         zc1/p59e2jJspgFaa08vgGmG3+GhjEuFh07vVO/z3dFQFo/6rtLFMJS8+CtMpfGumJ2n
         Q4HJV6T291ZZm2+K1Zfak6wkQ81XIGNMbX9+muFB1zzJeAGAoYRq14xsl3WAqL81jv5x
         IoZ9x9XhjaOa0IAZhr9i5f34UDYSKptl6ULxdZFNSc/rDi+46GYLmEFF0StLV0UMe6QU
         GriPJXbRkytKtbUP3mr+g7bs+VoSYd7/RTiRsLJTLdZWckITmKbFCNdJFkHW1gV2bSm2
         Fmww==
X-Gm-Message-State: AOJu0YxiazkcCLAGIU15KDJXXLMN9jwGGOBY9x6Wnm15HkxpUZjl6+AC
	IN+fjJtZmXuMFuyZ8XkyY4ueiGTNQudywT1qDXKYeYrqkiu+xfQghViUvwVvW5D8tpW3dWoZ8fB
	f
X-Google-Smtp-Source: AGHT+IG5hTheXiFcNB1h3N8wfiEZqrOAQEQOseFGDgld5WixGuHlAi/tIHwFHZWMziRW43704CLWQA==
X-Received: by 2002:ac2:5f66:0:b0:524:43b2:d326 with SMTP id 2adb3069b0e04-52b8958db32mr5548713e87.37.1717423527138;
        Mon, 03 Jun 2024 07:05:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a80:acf7:af1d:55dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213860126fsm70656695e9.40.2024.06.03.07.05.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 07:05:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] autotools/libtool: Drop libtool sysroot patch as not needed
Date: Mon,  3 Jun 2024 15:05:25 +0100
Message-Id: <20240603140525.3554848-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 14:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200254

libtool auto detects the sysroot from gcc's parameters or configuration so we
don't need to pass in this configuration separately to libtool.

Whilst the option names do conflict with gcc/binutils, that is an issue for those
projects to resolve, not us. Upstream libtool did reject the patch. We can
drop this patch and simplify our code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass            |   2 +-
 meta/classes-recipe/autotools.bbclass         |   9 +-
 .../libtool/libtool-2.5.0.inc                 |   1 -
 .../libtool/libtool-native_2.5.0.bb           |   2 +-
 ...e-the-with-sysroot-option-to-avoid-c.patch | 171 ------------------
 ...ool.m4-Handle-as-a-sysroot-correctly.patch |   6 +-
 6 files changed, 6 insertions(+), 185 deletions(-)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 151cf0c4eac..822d190a304 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -58,7 +58,7 @@ enabled tests are listed here, the do_package_qa task will run under fakeroot."
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
-UNKNOWN_CONFIGURE_OPT_IGNORE ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disable-static"
+UNKNOWN_CONFIGURE_OPT_IGNORE ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --disable-static"
 
 # This is a list of directories that are expected to be empty.
 QA_EMPTY_DIRS ?= " \
diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 7ee1b0d9c74..9ebdca47680 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -57,12 +57,6 @@ export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 export LD_FOR_BUILD = "${BUILD_LD}"
 export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
 
-def append_libtool_sysroot(d):
-    # Only supply libtool sysroot option for non-native packages
-    if not bb.data.inherits_class('native', d):
-        return '--with-libtool-sysroot=${STAGING_DIR_HOST}'
-    return ""
-
 CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --host=${HOST_SYS} \
 		  --target=${TARGET_SYS} \
@@ -81,8 +75,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
 		  --disable-silent-rules \
-		  ${CONFIGUREOPT_DEPTRACK} \
-		  ${@append_libtool_sysroot(d)}"
+		  ${CONFIGUREOPT_DEPTRACK}"
 CONFIGUREOPT_DEPTRACK ?= "--disable-dependency-tracking"
 
 CACHED_CONFIGUREVARS ?= ""
diff --git a/meta/recipes-devtools/libtool/libtool-2.5.0.inc b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
index dd6215476e8..a609de6369b 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.0.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://alpha.gnu.org/gnu/libtool/libtool-${PV}.tar.gz \
            file://0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch \
-           file://0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch \
            file://0003-ltmain.in-Add-missing-sysroot-to-library-path.patch \
            file://0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
            file://0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
index 19024f7830c..90c06f0ec3f 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
@@ -4,7 +4,7 @@ DEPENDS = ""
 
 inherit native
 
-EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
+EXTRA_OECONF = " --with-sysroot=${STAGING_DIR_NATIVE}"
 
 do_configure:prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
diff --git a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
deleted file mode 100644
index 156622bb54b..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-Subject: [PATCH 02/12] libtool.m4: Rename the --with-sysroot option to avoid conflict with gcc/binutils
-
-This patch renames the --with-sysroot option to --with-libtool-sysroot
-to avoid namespace conflict with binutils, gcc and other toolchain
-components since these componets also add that option to configure
-and this becomes confusing and conflicting otherwise.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream report:
-http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00014.html]
-
-Index: libtool-2.5.0/m4/libtool.m4
-===================================================================
---- libtool-2.5.0.orig/m4/libtool.m4
-+++ libtool-2.5.0/m4/libtool.m4
-@@ -1243,16 +1243,16 @@ _LT_DECL([], [ECHO], [1], [An echo progr
- AC_DEFUN([_LT_WITH_SYSROOT],
- [m4_require([_LT_DECL_SED])dnl
- AC_MSG_CHECKING([for sysroot])
--AC_ARG_WITH([sysroot],
--[AS_HELP_STRING([--with-sysroot@<:@=DIR@:>@],
-+AC_ARG_WITH([libtool-sysroot],
-+[AS_HELP_STRING([--with-libtool-sysroot@<:@=DIR@:>@],
-   [Search for dependent libraries within DIR (or the compiler's sysroot
-    if not specified).])],
--[], [with_sysroot=no])
-+[], [with_libtool_sysroot=no])
- 
- dnl lt_sysroot will always be passed unquoted.  We quote it here
- dnl in case the user passed a directory name.
- lt_sysroot=
--case $with_sysroot in #(
-+case $with_libtool_sysroot in #(
-  yes)
-    if test yes = "$GCC"; then
-      # Trim trailing / since we'll always append absolute paths and we want
-@@ -1261,12 +1261,12 @@ case $with_sysroot in #(
-    fi
-    ;; #(
-  /*)
--   lt_sysroot=`echo "$with_sysroot" | $SED -e "$sed_quote_subst"`
-+   lt_sysroot=`echo "$with_libtool_sysroot" | $SED -e "$sed_quote_subst"`
-    ;; #(
-  no|'')
-    ;; #(
-  *)
--   AC_MSG_RESULT([$with_sysroot])
-+   AC_MSG_RESULT([$with_libtool_sysroot])
-    AC_MSG_ERROR([The sysroot must be an absolute path.])
-    ;;
- esac
-Index: libtool-2.5.0/tests/sysroot.at
-===================================================================
---- libtool-2.5.0.orig/tests/sysroot.at
-+++ libtool-2.5.0/tests/sysroot.at
-@@ -65,7 +65,7 @@ while read file; do
- done])
- 
- LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
--configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
-+configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
- 
- #???
- if test PATH = "$shlibpath_var"; then
-@@ -115,7 +115,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([lib2.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- ]])
-@@ -156,7 +156,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([prog.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- ]])
-Index: libtool-2.5.0/tests/testsuite
-===================================================================
---- libtool-2.5.0.orig/tests/testsuite
-+++ libtool-2.5.0/tests/testsuite
-@@ -49054,7 +49054,7 @@ $at_traceon; }
- 
- 
- LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
--configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
-+configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
- 
- #???
- if test PATH = "$shlibpath_var"; then
-@@ -49269,7 +49269,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([lib2.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- _ATEOF
-@@ -49463,7 +49463,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([prog.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- _ATEOF
-@@ -49821,7 +49821,7 @@ $at_traceon; }
- 
- 
- LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
--configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
-+configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
- 
- #???
- if test PATH = "$shlibpath_var"; then
-@@ -50036,7 +50036,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([lib2.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- _ATEOF
-@@ -50230,7 +50230,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([prog.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- _ATEOF
-@@ -50588,7 +50588,7 @@ $at_traceon; }
- 
- 
- LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
--configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
-+configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
- 
- #???
- if test PATH = "$shlibpath_var"; then
-@@ -50803,7 +50803,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([lib2.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- _ATEOF
-@@ -50997,7 +50997,7 @@ AM_INIT_AUTOMAKE([foreign])
- AC_PROG_CC
- AC_CONFIG_SRCDIR([prog.c])
- LT_INIT
--sysroot=$with_sysroot
-+sysroot=$with_libtool_sysroot
- AC_SUBST([sysroot])
- AC_OUTPUT(Makefile)
- _ATEOF
diff --git a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
index 435c52c7301..feb1048b554 100644
--- a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
+++ b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
@@ -17,7 +17,7 @@ Index: libtool-2.5.0/m4/libtool.m4
 @@ -1253,18 +1253,18 @@ dnl lt_sysroot will always be passed unq
  dnl in case the user passed a directory name.
  lt_sysroot=
- case $with_libtool_sysroot in #(
+ case $with_sysroot in #(
 - yes)
 + no)
     if test yes = "$GCC"; then
@@ -29,10 +29,10 @@ Index: libtool-2.5.0/m4/libtool.m4
 + yes|''|/)
 +   ;; #(
   /*)
-    lt_sysroot=`echo "$with_libtool_sysroot" | $SED -e "$sed_quote_subst"`
+    lt_sysroot=`echo "$with_sysroot" | $SED -e "$sed_quote_subst"`
     ;; #(
 - no|'')
 -   ;; #(
   *)
-    AC_MSG_RESULT([$with_libtool_sysroot])
+    AC_MSG_RESULT([$with_sysroot])
     AC_MSG_ERROR([The sysroot must be an absolute path.])

