Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC3EC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:52:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28031.1786362746422345775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KzUUgJPL;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D09BA14BF
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:52:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80C333F632
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786362745; bh=3iJxo2Ds5zh23+G9zjH+0RpmqvxoupHMW9APwrhfumc=;
	h=From:To:Subject:Date:From;
	b=KzUUgJPLASwp1CJMR6AKexQuLIby/Yo/sX/QOBrtYBeXHu7KK+YzqNFUxBl35+g/P
	 4VdEtUKxWkjhKNcsNQAccsnxKf9x3UAIW1P+LyQVOJmFHsFD8ODltZEi5eisof7zZW
	 SCjaxf8HJR0XuHJieG+uQlyxWuUNmgJ9ATXAfv5M=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ghostscript: use upstreamed patch
Date: Mon, 10 Aug 2026 12:52:20 +0100
Message-ID: <20260810115220.560843-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243126

This patch has now been upstreamed in a slightly different form, refresh
the patch so that on upgrade it disappears.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ghostscript/ghostscript/out-of-tree.patch | 42 ++++++++++---------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.pa=
tch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
index c64e3c69c51..a0360fed438 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
@@ -1,35 +1,39 @@
-From 6d9852d5bac17a5fc7f605bd596e93528b0fcf81 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 2 Apr 2026 14:41:42 +0100
-Subject: [PATCH] Fix the build to do out-of-tree properly.
+From 8c71024e8b9dae1b691ad96eb5af39840fb73a99 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 4 Aug 2026 09:30:31 +0100
+Subject: Bug 709459: Fix out of tree cross compile builds
=20
-The patches are in progress but are being submitted upstream.
+Fix path/file name for the configure generated arch.h.
=20
-Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=
=3D709459]
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi=
/ghostpdl.git/commit/?id=3D8c71024e]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index b2b3678..dd00e86 100644
+index b25aaab1a..fe79c416e 100644
 --- a/configure.ac
 +++ b/configure.ac
+@@ -45,8 +45,8 @@ fi
+ THEMAKEFILE=3D"${MAKEFILE:-Makefile}"
+ AUXFLAGS_MAK=3Dauxflags.mak
+=20
+-ARCH_AUTOCONF_HEADER=3Darch-config/arch_autoconf.h
+-ARCH_AUTOCONF_HEADER_PROTO=3Darch/arch_autoconf.h.in
++ARCH_AUTOCONF_HEADER=3D./arch-config/arch_autoconf.h
++ARCH_AUTOCONF_HEADER_PROTO=3D$srcdir/arch/arch_autoconf.h.in
+=20
+ dnl --------------------------------------------------
+ dnl Local utilities
 @@ -400,7 +400,7 @@ if test x"$with_arch_h" =3D x""; then
            *)
              ARCH_CONF_HEADER=3D
              if test x"$host" !=3D x"$build"; then
 -              ARCH_CONF_HEADER=3D"\$(GLSRCDIR)/../$ARCH_AUTOCONF_HEADER=
"
-+              ARCH_CONF_HEADER=3D"./$ARCH_AUTOCONF_HEADER"
++              ARCH_CONF_HEADER=3D"$ARCH_AUTOCONF_HEADER"
              else
                ARCH_CONF_HEADER=3D
              fi
-@@ -889,7 +889,7 @@ AC_ARG_WITH([tesseract], AS_HELP_STRING([--without-t=
esseract],
-=20
- if test x$with_tesseract !=3D xno; then
-   AC_MSG_CHECKING([for local Tesseract library source])
--  if test -d $srcdir/tesseract && test -d $srcdir/leptonica; then
-+  if test -d $TESSERACTDIR && test -d $LEPTONICADIR; then
-     AC_MSG_RESULT([yes])
-=20
-     if test x$with_tesseract !=3D xno; then
+--=20
+cgit v1.2.3
--=20
2.43.0


