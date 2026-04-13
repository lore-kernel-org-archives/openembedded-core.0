Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F2DEBFD38
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 10:28:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.269387.1776076122208680921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 03:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=bWuF0Kkv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E67E916F8
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 03:28:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39CA63F641
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776076121; bh=g1OF269Oa3uKD0IVOEdDMhrudW3ztZ7mtUXcXNWtqq4=;
	h=From:To:Subject:Date:From;
	b=bWuF0KkvGs7xib/3r0tKRFAcPspye/nrCEUH7tYGMygKA3djD1JtwT1uDV2UrFZuT
	 CVbaxCk2g9S5DtYKFy4a3FppRVnYb8euwYzdpvFoOigP0mS+HmmvuKCp3Vt7OWdJ9N
	 bCBsf7zrvvFCueX1a+jD4sYn1yQmRMk2gN33zIhI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] systemtap: add option for readline
Date: Mon, 13 Apr 2026 11:28:39 +0100
Message-ID: <20260413102839.4126045-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 10:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235097

systemtap will try and use libreadline if it's available which isn't
good for determinism. Add an option, and disable it by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../systemtap/systemtap/readline.patch        | 93 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_5.4.bb |  1 +
 .../systemtap/systemtap_git.inc               |  1 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/readline.patc=
h

diff --git a/meta/recipes-kernel/systemtap/systemtap/readline.patch b/met=
a/recipes-kernel/systemtap/systemtap/readline.patch
new file mode 100644
index 00000000000..d7afc800cd7
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/readline.patch
@@ -0,0 +1,93 @@
+configure: add option to enable/disable readline
+
+Add an option to control explicitly whether systemtap will look for and
+use readline, for reproducible builds.
+
+If not specified the behaviour is as before: look for readline and if it
+is found, use it.  However if --with-readline is passed then readline
+must be present, and if --without-readline is passed then readline will
+not be used.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/systemtap/2=
026q2/028333.html]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/configure.ac w/configure.ac
+index 6fb99da40..01457bafb 100644
+--- i/configure.ac
++++ w/configure.ac
+@@ -525,38 +525,47 @@ AC_CHECK_HEADERS([rpm/rpmcrypto.h], [
+                       have_rpmcrypto_h=3Dyes
+ 		      AC_MSG_NOTICE([separate rpm/rpmcrypto.h])])
+=20
+-dnl Look for readline.
+-dnl
+-dnl First save the orignal value of LIBS.
+-LIBS_no_readline=3D$LIBS
+=20
+-dnl Check how for readline presence and how to link with it. On some
+-dnl systems you need to add a termcap compatible library.
+-have_libreadline=3D"no"
+-AC_MSG_CHECKING([how to link readline libs])
+-for libtermcap in "" tinfo ncursesw ncurses curses termcap; do
+-  if test -z "$libtermcap"; then
+-    READLINE_LIBS=3D"-lreadline"
++AC_ARG_WITH([readline],
++  AS_HELP_STRING([--without-readline],[disable use of readline]), [], [=
with_readline=3D"check"])
++
++if test "$with_readline" !=3D no; then
++  dnl Look for readline.
++  dnl
++  dnl First save the orignal value of LIBS.
++  LIBS_no_readline=3D$LIBS
++
++  have_libreadline=3D"no"
++  dnl Check how for readline presence and how to link with it. On some
++  dnl systems you need to add a termcap compatible library.
++  AC_MSG_CHECKING([how to link readline libs])
++  for libtermcap in "" tinfo ncursesw ncurses curses termcap; do
++    if test -z "$libtermcap"; then
++      READLINE_LIBS=3D"-lreadline"
++    else
++      READLINE_LIBS=3D"-lreadline -l$libtermcap"
++    fi
++    LIBS=3D"$READLINE_LIBS $LIBS_no_readline"
++    AC_LINK_IFELSE(
++      [AC_LANG_CALL([],[readline])],
++      [have_libreadline=3D"yes"])
++    if test "$have_libreadline" =3D "yes"; then
++      break
++    fi
++  done
++
++  if test "$have_libreadline" =3D "no" -a "$with_readline" =3D "yes"; t=
hen
++    AC_MSG_ERROR([cannot find libreadline])
++  elif test "$have_libreadline" =3D "no" -a "$with_readline" =3D "check=
"; then
++    AC_MSG_RESULT([libreadline not found])
++    READLINE_LIBS=3D""
+   else
+-    READLINE_LIBS=3D"-lreadline -l$libtermcap"
++    AC_MSG_RESULT([$READLINE_LIBS])
++    AC_DEFINE(HAVE_LIBREADLINE, [1],
++        [Define if you have the readline library (-lreadline).])
+   fi
+-  LIBS=3D"$READLINE_LIBS $LIBS_no_readline"
+-  AC_LINK_IFELSE(
+-    [AC_LANG_CALL([],[readline])],
+-    [have_libreadline=3D"yes"])
+-  if test "$have_libreadline" =3D "yes"; then
+-    break
+-  fi
+-done
+-if test "$have_libreadline" =3D "no"; then
+-  AC_MSG_RESULT([none])
+-  READLINE_LIBS=3D""
+-else
+-  AC_MSG_RESULT([$READLINE_LIBS])
+-  AC_DEFINE(HAVE_LIBREADLINE, [1],
+-	    [Define if you have the readline library (-lreadline).])
++  AC_SUBST([READLINE_LIBS])
+ fi
+-AC_SUBST([READLINE_LIBS])
+ AM_CONDITIONAL([HAVE_LIBREADLINE], [test "$have_libreadline" =3D "yes"]=
)
+=20
+ dnl End of readline checks: restore LIBS
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.4.bb b/meta/recipe=
s-kernel/systemtap/systemtap_5.4.bb
index 254bac4d6f9..22dd76bbffd 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.4.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
@@ -32,6 +32,7 @@ PACKAGECONFIG[sqlite] =3D "--enable-sqlite,--disable-sq=
lite,sqlite3"
 PACKAGECONFIG[monitor] =3D "--enable-monitor,--disable-monitor,ncurses j=
son-c"
 PACKAGECONFIG[python3-probes] =3D "--with-python3-probes,--without-pytho=
n3-probes,python3-setuptools-native"
 PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod"
+PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline=
"
=20
 inherit autotools gettext pkgconfig systemd
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 's=
etuptools3-base', '', d)}
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
index 24b6f0ae029..a18381a56de 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -6,6 +6,7 @@ SRC_URI =3D "git://sourceware.org/git/systemtap.git;proto=
col=3Dhttps;branch=3Dmaster;t
            file://0001-Install-python-modules-to-correct-library-dir.pat=
ch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-ro=
ot.patch \
            file://0001-elaborate.cxx-fix-32-bit-build.patch \
+           file://readline.patch \
            "
=20
 SRCREV =3D "911a1354aac264651fda932061e7f20d2ecc2471"
--=20
2.43.0


