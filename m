Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC55C5AC7C
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 16:27:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23336.1786033657770567603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 09:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QZIgubyd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 476A01A25
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 09:27:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E29833F9A2
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786033657; bh=i5FHbChuYm0uvaXMUqONFT3dEtie9XrWM0f7GocQBK8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QZIgubydGVRGLrKiRItGgpWEi41284jbjdOpKJ5QPhDzGejWFJNLcAojQVd27wsMG
	 il3OvQWZqNFuTf58ZjsFmihcqXQuLZC71Ma6dEA75FMtGxpubED9UfQ/SQY+/eoe3E
	 wDUUuK+3ENzwMsXiJDwBWLGJF9nZxOkV6AMJFtA8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] glibc: remove redundant tzselect interpreter option patch
Date: Thu,  6 Aug 2026 17:27:30 +0100
Message-ID: <20260806162730.352060-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806162730.352060-1-ross.burton@arm.com>
References: <20260806162730.352060-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 16:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242959

Patch 18 adds an option to replace the interpreter in the tzselect
script from /bin/bash to whatever KSHELL is set to.  However, patch 19
directly changes the interpreter to /bin/sh so this functionality never
works.

This is further cleanup based on a previous commit removing the KSHELL
assignment[1].

[1] oe-core a9ffb0db9e7 ("glibc: remove obsolete KSHELL assignment")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ell-interpreter-overridable-in-tzsel.patch | 47 -------------------
 meta/recipes-core/glibc/glibc_2.44.bb         |  1 -
 2 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0018-timezone-Make-shel=
l-interpreter-overridable-in-tzsel.patch

diff --git a/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-inter=
preter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0018-ti=
mezone-Make-shell-interpreter-overridable-in-tzsel.patch
deleted file mode 100644
index 46cca501001..00000000000
--- a/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-=
overridable-in-tzsel.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From cd372730f78fd39949b1a0c119f7b2450a6706a8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 9 Dec 2021 15:14:42 -0800
-Subject: [PATCH] timezone: Make shell interpreter overridable in tzselec=
t.ksh
-
-define new macro called KSHELL which can be used to define default shell
-use Bash by default
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makeconfig        | 9 +++++++++
- timezone/Makefile | 1 +
- 2 files changed, 10 insertions(+)
-
-diff --git a/Makeconfig b/Makeconfig
-index e7dbd9fb9e..fd62fdf49b 100644
---- a/Makeconfig
-+++ b/Makeconfig
-@@ -309,6 +309,15 @@ ifndef sysincludedir
- sysincludedir =3D /usr/include
- endif
-=20
-+# The full path name of a Posix-compliant shell, preferably one that su=
pports
-+# the Korn shell's 'select' statement as an extension.
-+# These days, Bash is the most popular.
-+# It should be OK to set this to /bin/sh, on platforms where /bin/sh
-+# lacks 'select' or doesn't completely conform to Posix, but /bin/bash
-+# is typically nicer if it works.
-+ifndef KSHELL
-+KSHELL =3D /bin/bash
-+endif
-=20
- # Commands to install files.
- ifndef INSTALL_DATA
-diff --git a/timezone/Makefile b/timezone/Makefile
-index ce9abe6cb2..721fb70be4 100644
---- a/timezone/Makefile
-+++ b/timezone/Makefile
-@@ -140,6 +140,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)conf=
ig.make
- 	    -e '/TZVERSION=3D/s|see_Makefile|"$(version)"|' \
- 	    -e '/PKGVERSION=3D/s|=3D.*|=3D"$(PKGVERSION)"|' \
- 	    -e '/REPORT_BUGS_TO=3D/s|=3D.*|=3D"$(REPORT_BUGS_TO)"|' \
-+	    -e 's|#!/bin/bash|#!$(KSHELL)|g' \
- 	    < $< > $@.new
- 	chmod 555 $@.new
- 	mv -f $@.new $@
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/gl=
ibc/glibc_2.44.bb
index 42ec8701e6b..b4a5fbf8c31 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -53,7 +53,6 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0015-wordsize.h-Unify-the-header-between-arm-and-aarch=
64.patch \
            file://0016-Replace-echo-with-printf-builtin-in-nscd-init-scr=
ipt.patch \
            file://0017-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-=
onl.patch \
-           file://0018-timezone-Make-shell-interpreter-overridable-in-tz=
sel.patch \
            file://0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter=
.patch \
            file://0020-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selft=
est.patch \
--=20
2.43.0


