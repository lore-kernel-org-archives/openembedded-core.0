Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F34C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 14:43:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10048.1685976230428824848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1315FD75;
	Mon,  5 Jun 2023 07:44:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1402E3F663;
	Mon,  5 Jun 2023 07:43:48 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] ghostscript: upgrade to 10.01.1
Date: Mon,  5 Jun 2023 15:43:44 +0100
Message-Id: <20230605144344.2569937-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 14:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182387

From: Ross Burton <ross.burton@arm.com>

Drop the merged fix for CVE-2023-28879.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ghostscript/cross-compile.patch           | 40 -------------
 .../ghostscript/cve-2023-28879.patch          | 60 -------------------
 ...cript_10.0.0.bb =3D> ghostscript_10.01.1.bb} |  4 +-
 3 files changed, 1 insertion(+), 103 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/cross-c=
ompile.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-202=
3-28879.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.0.0.bb =3D> gho=
stscript_10.01.1.bb} (96%)

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
diff --git a/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879=
.patch b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.pat=
ch
deleted file mode 100644
index 604b927521c..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 37ed5022cecd584de868933b5b60da2e995b3179 Mon Sep 17 00:00:00 2001
-From: Ken Sharp <ken.sharp@artifex.com>
-Date: Fri, 24 Mar 2023 13:19:57 +0000
-Subject: [PATCH] Graphics library - prevent buffer overrun in (T)BCP enc=
oding
-
-Bug #706494 "Buffer Overflow in s_xBCPE_process"
-
-As described in detail in the bug report, if the write buffer is filled
-to one byte less than full, and we then try to write an escaped
-character, we overrun the buffer because we don't check before
-writing two bytes to it.
-
-This just checks if we have two bytes before starting to write an
-escaped character and exits if we don't (replacing the consumed byte
-of the input).
-
-Up for further discussion; why do we even permit a BCP encoding filter
-anyway ? I think we should remove this, at least when SAFER is true.
----
-CVE: CVE-2023-28879
-
-Upstream-Status: Backport [see text]
-
-git://git.ghostscript.com/ghostpdl
-cherry-pick
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com.
-
----
- base/sbcp.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/base/sbcp.c b/base/sbcp.c
-index 979ae0992..47fc233ec 100644
---- a/base/sbcp.c
-+++ b/base/sbcp.c
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2021 Artifex Software, Inc.
-+/* Copyright (C) 2001-2023 Artifex Software, Inc.
-    All Rights Reserved.
-=20
-    This software is provided AS-IS with no warranty, either express or
-@@ -50,6 +50,14 @@ s_xBCPE_process(stream_state * st, stream_cursor_read=
 * pr,
-         byte ch =3D *++p;
-=20
-         if (ch <=3D 31 && escaped[ch]) {
-+            /* Make sure we have space to store two characters in the w=
rite buffer,
-+             * if we don't then exit without consuming the input charac=
ter, we'll process
-+             * that on the next time round.
-+             */
-+            if (pw->limit - q < 2) {
-+                p--;
-+                break;
-+            }
-             if (p =3D=3D rlimit) {
-                 p--;
-                 break;
---=20
-2.25.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/me=
ta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
similarity index 96%
rename from meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
index 86ecdbe24af..5d4b8cdc913 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
@@ -33,8 +33,6 @@ SRC_URI_BASE =3D "https://github.com/ArtifexSoftware/gh=
ostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
-                file://cross-compile.patch \
-                file://cve-2023-28879.patch \
 "
=20
 SRC_URI =3D "${SRC_URI_BASE} \
@@ -46,7 +44,7 @@ SRC_URI:class-native =3D "${SRC_URI_BASE} \
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


