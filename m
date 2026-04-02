Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1140DD39423
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:41:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15925.1775137312108884406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WnyXIdW/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A1BA2C43
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 06:41:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0845D3F641
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775137311; bh=p3f4z/EiZuzmoGQ20bq51ER23lIzmVnxhfX00x0U5ww=;
	h=From:To:Subject:Date:From;
	b=WnyXIdW/B05FlPVPx9l9WBqEc5piHx3N71+Y1POdUP7TQFjPKSNLZ9IXUXIy8ICyj
	 0OaPCiM8EXc3EUIPVFDKSHe071aN47eclAdfkau7Rb6Fq13Nziv1361tBfuks+gLFM
	 0SR663Ro2YsRje15GuXq5AWFvfSZbR72lctr1vfI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ghostscript: do out-of-tree builds
Date: Thu,  2 Apr 2026 14:41:42 +0100
Message-ID: <20260402134143.1045721-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 13:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234524

Upstream said that out-of-tree builds were meant to work, so I found the
few instances where path assumptions were incorrect and enabled it.

This gives us more reliable builds as we can always throw away the build
tree when reconfiguring.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ghostscript/ghostscript/out-of-tree.patch | 39 +++++++++++++++++++
 .../ghostscript/ghostscript_10.06.0.bb        |  4 +-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/out-of-=
tree.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.pa=
tch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
new file mode 100644
index 00000000000..202c9d6c7c9
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
@@ -0,0 +1,39 @@
+Fix the build to do out-of-tree properly.
+
+The patches are in progress but are being submitted upstream.
+
+Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=
=3D709289]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff -rU3 a/configure.ac b/configure.ac
+--- a/configure.ac	2025-09-09 10:36:39.000000000 +0100
++++ b/configure.ac	2026-03-31 15:35:08.988262612 +0100
+@@ -400,7 +400,7 @@
+           *)
+             ARCH_CONF_HEADER=3D
+             if test x"$host" !=3D x"$build"; then
+-              ARCH_CONF_HEADER=3D"\$(GLSRCDIR)/../$ARCH_AUTOCONF_HEADER=
"
++              ARCH_CONF_HEADER=3D"./$ARCH_AUTOCONF_HEADER"
+             else
+               ARCH_CONF_HEADER=3D
+             fi
+@@ -869,8 +869,8 @@
+ AC_SUBST(RECURSIVE_MUTEXATTR)
+=20
+ dnl Tesseract/Leptonica detection
+-TESSERACTDIR=3Dtesseract
+-LEPTONICADIR=3Dleptonica
++TESSERACTDIR=3D$srcdir/tesseract
++LEPTONICADIR=3D$srcdir/leptonica
+ OCR_VERSION=3D0
+ OCR_SHARED=3D0
+ LEPTONICAINCLUDE=3D
+@@ -886,7 +886,7 @@
+=20
+ if test x$with_tesseract !=3D xno; then
+   AC_MSG_CHECKING([for local Tesseract library source])
+-  if test -d $srcdir/tesseract && test -d $srcdir/leptonica; then
++  if test -d $TESSERACTDIR && test -d $LEPTONICADIR; then
+     AC_MSG_RESULT([yes])
+=20
+     if test x$with_tesseract !=3D xno; then
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index b0951d79f5f..951cbc19565 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "https://github.com/ArtifexSoftware/ghostpd=
l-downloads/releases/downlo
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
            file://0001-Fix-32-bit-build.patch \
+           file://out-of-tree.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5bd6da34794928cc7e616f288e32bd0be7f9a5ca2d3c206a=
0af2c19a4e3a318f"
@@ -48,8 +49,7 @@ EXTRA_OECONF:append:armv7ve =3D "${@bb.utils.contains('=
TUNE_FEATURES','neon','','
=20
 TARGET_CFLAGS +=3D "-std=3Dgnu17 -Wno-error=3Ddeclaration-after-statemen=
t -fPIC"
=20
-# Uses autoconf but not automake, can't do out-of-tree
-inherit autotools-brokensep pkgconfig
+inherit autotools pkgconfig
=20
 # Prune the source tree of libraries that we're using our packaging of, =
so that
 # ghostscript can't link to them. Can't prune zlib as that's needed for =
the
--=20
2.47.1


