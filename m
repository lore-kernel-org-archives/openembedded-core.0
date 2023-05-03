Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B799C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 16:47:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25182.1683132456638444642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 09:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB1192F4;
	Wed,  3 May 2023 09:48:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 219F33F64C;
	Wed,  3 May 2023 09:47:35 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] ghostscript: upgrade to 10.01.1
Date: Wed,  3 May 2023 17:47:29 +0100
Message-Id: <20230503164729.1869687-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 16:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180833

From: Ross Burton <ross.burton@arm.com>

Fixes CVE-2023-28879.

Drop an upstreamed patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ghostscript/cross-compile.patch           | 40 -------------------
 ...cript_10.0.0.bb =3D> ghostscript_10.01.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/cross-c=
ompile.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.0.0.bb =3D> gho=
stscript_10.01.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cross-compile.=
patch b/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
deleted file mode 100644
index ba62820df1e..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4c3575346b9c7d394ebc73b4e5fabebadd8877ec Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Thu, 24 Nov 2022 16:33:47 +0000
-Subject: [PATCH] Fix a little bitrot in the cross-compiling logic
-
-Removing the option to disable FAPI meant configuring for cross compilin=
g would
-fail because the option being passed to the sub-call to configure would =
include
-an unknown command line option.
-
-Upstream-Status: Backport [https://git.ghostscript.com/?p=3Dghostpdl.git=
;a=3Dpatch;f=3Dconfigure.ac;h=3D4c3575346b9c7d394ebc73b4e5fabebadd8877ec]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d5c68c4b3..738eb10a9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -138,7 +138,7 @@ if test x"$host" !=3D x"$build" ; then
-   echo $AUXFLAGS_MAK_LINE07 >> $AUXFLAGS_MAK.in
-=20
-   AC_MSG_NOTICE([Begin recursive call to configure script (for auxiliar=
y tools)])
--  "$absolute_source_path/configure" CC=3D"$CCAUX" CFLAGS=3D"$CFLAGSAUX"=
 CPPFLAGS=3D"$CPPFLAGSAUX" LDFLAGS=3D"$LDFLAGSAUX" CCAUX=3D CFLAGSAUX=3D =
CFLAGSAUX=3D MAKEFILE=3D$AUXFLAGS_MAK --host=3D$build --build=3D$build --=
enable-auxtools_only --disable-hidden-visibility --with-local-zlib --with=
out-libtiff --disable-contrib --disable-fontconfig --disable-dbus --disab=
le-freetype --disable-fapi --disable-cups --disable-openjpeg --disable-gt=
k --with-libiconv=3Dno --without-libidn --without-libpaper --without-pdft=
oraster --without-ijs --without-jbig2dec --without-x --with-drivers=3D""
-+  "$absolute_source_path/configure" CC=3D"$CCAUX" CFLAGS=3D"$CFLAGSAUX"=
 CPPFLAGS=3D"$CPPFLAGSAUX" LDFLAGS=3D"$LDFLAGSAUX" CCAUX=3D CFLAGSAUX=3D =
CFLAGSAUX=3D MAKEFILE=3D$AUXFLAGS_MAK --host=3D$build --build=3D$build --=
enable-auxtools_only --disable-hidden-visibility --with-local-zlib --with=
out-libtiff --disable-contrib --disable-fontconfig --disable-dbus --disab=
le-freetype --disable-cups --disable-openjpeg --disable-gtk --with-libico=
nv=3Dno --without-libidn --without-libpaper --without-pdftoraster --witho=
ut-ijs --without-jbig2dec --without-x --with-drivers=3D""
-   status=3D$?
-   cp config.log "$olddir/configaux.log"
-   if test $status -eq 0 ; then
-@@ -2530,7 +2530,7 @@ PDF=3D
- PDF_MAK=3D"\$(GLSRCDIR)\$(D)stub.mak"
- PDFROMFS_MAK=3D"\$(GLSRCDIR)\$(D)stub.mak"
-=20
--if test x"$with_pdf" !=3D x"no" ; then
-+if test x"$with_pdf" !=3D x"no" -a x"$enable_auxtools_only" !=3D x"yes"=
 ; then
-=20
-   if test x"$JBIG2_DECODER" =3D x""; then
-       AC_MSG_ERROR([No JBIG2 decoder available, required for PDF suppor=
t])
---=20
-2.25.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/me=
ta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
index 56a93632e29..5d4b8cdc913 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
@@ -33,7 +33,6 @@ SRC_URI_BASE =3D "https://github.com/ArtifexSoftware/gh=
ostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
-                file://cross-compile.patch \
 "
=20
 SRC_URI =3D "${SRC_URI_BASE} \
@@ -45,7 +44,7 @@ SRC_URI:class-native =3D "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to=
-allow-fope.patch \
                         "
=20
-SRC_URI[sha256sum] =3D "a57764d70caf85e2fc0b0f59b83b92e25775631714dcdb97=
cc6e0cea414bb5a3"
+SRC_URI[sha256sum] =3D "4df18a808cd4369f25e02dbcec2f133cb6d674627b2c6b15=
02020e58d43e32ce"
=20
 # Put something like
 #
--=20
2.34.1


