Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E195DE7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:12:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.129616.1734617515385744515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F14C71762
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:12:22 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 826603F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:11:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] bash: remove aclocal workarounds
Date: Thu, 19 Dec 2024 14:11:45 +0000
Message-ID: <20241219141151.2592031-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208910

Instead of patching configure.ac to not load m4 directly and working
around what aclocal and the autotools class do, just exclude the running
of aclocal entirely.

This stops the class removing the existing aclocal.m4 and autoreconf
running aclocal.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/bash/bash.inc           |  8 +--
 .../bash/bash/use_aclocal.patch               | 69 -------------------
 meta/recipes-extended/bash/bash_5.2.37.bb     |  1 -
 3 files changed, 1 insertion(+), 77 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/use_aclocal.patch

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/=
bash/bash.inc
index 66058feff38..634209c9115 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -7,7 +7,7 @@ DEPENDS =3D "ncurses bison-native virtual/libiconv"
=20
 inherit autotools gettext texinfo update-alternatives ptest
=20
-EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
+EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader,aclocal"
 EXTRA_OECONF =3D "--enable-job-control --without-bash-malloc bash_cv_wex=
itstatus_offset=3D8"
=20
 # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
@@ -46,12 +46,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D " \
=20
 CACHED_CONFIGUREVARS +=3D "headersdir=3D${includedir}/${PN}"
=20
-do_configure:prepend () {
-    if [ ! -e ${S}/acinclude.m4 ]; then
-       cat ${S}/aclocal.m4 > ${S}/acinclude.m4
-    fi
-}
-
 do_compile:prepend() {
     # Remove any leftover .build files. This ensures that bash always ha=
s the
     # same version number and keeps builds reproducible
diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/rec=
ipes-extended/bash/bash/use_aclocal.patch
deleted file mode 100644
index e966b037a27..00000000000
--- a/meta/recipes-extended/bash/bash/use_aclocal.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From b3a64702fa1978463c01bd5d9fe711e4628aba1e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 28 Dec 2020 21:04:27 +0100
-Subject: [PATCH] bash: update 5.0 -> 5.1
-
-Including m4 files directly like this confuses autotools.bbclass, remove
-the references and rely upon aclocal to collect the m4 files together
-as needed instead making it work like other autotools based projects.
-
-Upstream-Status: Inappropriate [OE configuration specific]
-RP 2021/1/20
----
- configure.ac | 43 -------------------------------------------
- 1 file changed, 43 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 50a6e20..a3b5bd7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -710,49 +710,6 @@ if test x$SIZE =3D x; then
- fi
- AC_SUBST(SIZE)
-=20
--m4_include([m4/stat-time.m4])
--m4_include([m4/timespec.m4])
--
--m4_include([m4/strtoimax.m4])
--
--dnl include files for gettext
--
--m4_include([m4/codeset.m4])
--m4_include([m4/extern-inline.m4])
--m4_include([m4/fcntl-o.m4])
--m4_include([m4/gettext.m4])
--m4_include([m4/glibc2.m4])
--m4_include([m4/glibc21.m4])
--m4_include([m4/host-cpu-c-abi.m4])
--m4_include([m4/iconv.m4])
--m4_include([m4/intdiv0.m4])
--m4_include([m4/intl.m4])
--m4_include([m4/intlmacosx.m4])
--m4_include([m4/intl-thread-locale.m4])
--m4_include([m4/intmax.m4])
--m4_include([m4/inttypes-pri.m4])
--m4_include([m4/inttypes.m4])
--m4_include([m4/inttypes_h.m4])
--m4_include([m4/lcmessage.m4])
--m4_include([m4/lib-ld.m4])
--m4_include([m4/lib-link.m4])
--m4_include([m4/lib-prefix.m4])
--m4_include([m4/lock.m4])
--m4_include([m4/nls.m4])
--m4_include([m4/po.m4])
--m4_include([m4/printf-posix.m4])
--m4_include([m4/progtest.m4])
--m4_include([m4/pthread_rwlock_rdlock.m4])
--m4_include([m4/size_max.m4])
--m4_include([m4/stdint_h.m4])
--m4_include([m4/threadlib.m4])
--m4_include([m4/uintmax_t.m4])
--m4_include([m4/ulonglong.m4])
--m4_include([m4/visibility.m4])
--m4_include([m4/wchar_t.m4])
--m4_include([m4/wint_t.m4])
--m4_include([m4/xsize.m4])
--
- dnl C compiler characteristics
- AC_C_CONST
- AC_C_INLINE
diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-ext=
ended/bash/bash_5.2.37.bb
index 3dcaefa374e..20c51ecdbc9 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -11,7 +11,6 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtar=
ball \
            file://run-ptest \
            file://run-bash-ptests \
            file://fix-run-builtins.patch \
-           file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-chi=
ld-.patch \
            file://fix-filesubst-errexit.patch \
            "
--=20
2.43.0


