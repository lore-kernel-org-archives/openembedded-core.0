Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C10BC2BA1A
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 11:14:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.83497.1718709255629676335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 04:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A94DA7
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 04:14:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B26C83F6A8
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 04:14:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] expect: fix configure with GCC 14
Date: Tue, 18 Jun 2024 11:14:12 +0000
Message-Id: <20240618111413.2398512-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 11:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200868

The configure script has many fragments that fail to compile with GCC 14,
take a patch submitted upstream to fix these issues.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../expect/expect/expect-configure-c99.patch  | 201 ++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/expect-configure-=
c99.patch

diff --git a/meta/recipes-devtools/expect/expect/expect-configure-c99.pat=
ch b/meta/recipes-devtools/expect/expect/expect-configure-c99.patch
new file mode 100644
index 00000000000..09bf180df77
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/expect-configure-c99.patch
@@ -0,0 +1,201 @@
+Avoid calling exit without declaring the function.
+
+Add missing <string.h> include for memcpy.
+
+Use AC_TYPE_SIGNAL to fix REARM_SIG check.  Add missing includes.
+
+Fix various implicit int return types of main.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/expect/patches/24/=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/configure.in b/configure.in
+index 51558fa14d2bcf7e..055c88fbd8797eaa 100755
+--- a/configure.in
++++ b/configure.in
+@@ -452,7 +452,11 @@ AC_CHECK_FUNC(siglongjmp, AC_DEFINE(HAVE_SIGLONGJMP=
))
+ # because Unixware 2.0 handles it specially and refuses to compile
+ # autoconf's automatic test that is a call with no arguments
+ AC_MSG_CHECKING([for memcpy])
+-AC_TRY_LINK(,[
++AC_TRY_LINK([
++#ifdef HAVE_STRING_H
++#include <string.h>
++#endif
++],[
+ char *s1, *s2;
+ memcpy(s1,s2,0);
+ ],
+@@ -469,6 +473,7 @@ memcpy(s1,s2,0);
+ AC_MSG_CHECKING([if WNOHANG requires _POSIX_SOURCE])
+ AC_TRY_RUN([
+ #include <sys/wait.h>
++int
+ main() {
+ #ifndef WNOHANG
+ 	return 0;
+@@ -489,6 +494,7 @@ rm -rf wnohang
+ AC_TRY_RUN([
+ #include <stdio.h>
+ #include <sys/wait.h>
++int
+ main() {
+ #ifdef WNOHANG
+ 	FILE *fp =3D fopen("wnohang","w");
+@@ -527,16 +533,21 @@ else
+   AC_DEFINE(SELECT_MASK_TYPE, fd_set)
+ fi
+=20
+-dnl # Check for the data type of the function used in signal(). This
+-dnl # must be before the test for rearming.
+-dnl # echo checking return type of signal handlers
+-dnl AC_HEADER_EGREP([(void|sighandler_t).*signal], signal.h, retsigtype=
=3Dvoid,AC_DEFINE(RETSIGTYPE, int) retsigtype=3Dint)
++AC_TYPE_SIGNAL
+=20
+ # FIXME: check if alarm exists
+ AC_MSG_CHECKING([if signals need to be re-armed])
+ AC_TRY_RUN([
+ #include <signal.h>
+-#define RETSIGTYPE $retsigtype
++#ifdef HAVE_STDLIB_H
++# include <stdlib.h>
++#endif
++#ifdef HAVE_UNISTD_H
++# include <unistd.h>
++#endif
++#ifndef NO_SYS_WAIT_H
++# include <sys/wait.h>
++#endif
+=20
+ int signal_rearms =3D 0;
+=20
+@@ -553,6 +564,7 @@ int n;
+ signal_rearms++;
+ }
+=20
++int
+ main()
+ {
+ 	signal(SIGINT,parent_sigint_handler);
+@@ -714,10 +726,11 @@ fi
+ AC_MSG_CHECKING([for struct sgttyb])
+ AC_TRY_RUN([
+ #include <sgtty.h>
++int
+ main()
+ {
+   struct sgttyb tmp;
+-  exit(0);
++  return 0;
+ }],
+         AC_MSG_RESULT(yes)
+         AC_DEFINE(HAVE_SGTTYB)
+@@ -738,10 +751,11 @@ if test $mach -eq 0 ; then
+   # pty_termios.c is set up to handle pty_termio.
+   AC_MSG_CHECKING([for struct termio])
+   AC_TRY_RUN([#include <termio.h>
++  int
+   main()
+   {
+     struct termio tmp;
+-    exit(0);
++    return 0;
+   }],
+         AC_DEFINE(HAVE_TERMIO)
+         PTY_TYPE=3Dtermios
+@@ -760,10 +774,11 @@ if test $mach -eq 0 ; then
+ #  include <inttypes.h>
+ #  endif
+ #  include <termios.h>
++  int
+   main()
+   {
+     struct termios tmp;
+-    exit(0);
++    return 0;
+   }],
+         AC_DEFINE(HAVE_TERMIOS)
+         PTY_TYPE=3Dtermios
+@@ -782,6 +797,7 @@ AC_TRY_RUN([
+ #include <inttypes.h>
+ #endif
+ #include <termios.h>
++int
+ main() {
+ #if defined(TCGETS) || defined(TCGETA)
+ 	return 0;
+@@ -804,6 +820,7 @@ AC_TRY_RUN([
+ #include <inttypes.h>
+ #endif
+ #include <termios.h>
++int
+ main() {
+ #ifdef TIOCGWINSZ
+ 	return 0;
+@@ -823,6 +840,7 @@ main() {
+ AC_MSG_CHECKING([for Cray-style ptys])
+ SETUID=3D":"
+ AC_TRY_RUN([
++int
+ main(){
+ #ifdef CRAY
+ 	return 0;
+@@ -878,12 +896,13 @@ AC_MSG_CHECKING([for SV-style timezone])
+ AC_TRY_RUN([
+ extern char *tzname[2];
+ extern int daylight;
++int
+ main()
+ {
+   int *x =3D &daylight;
+   char **y =3D tzname;
+=20
+-  exit(0);
++  return 0;
+ }],
+ 	AC_DEFINE(HAVE_SV_TIMEZONE)
+ 	AC_MSG_RESULT(yes),
+diff --git a/tclconfig/tcl.m4 b/tclconfig/tcl.m4
+index 0689cab3da994068..ebe839e5553ba520 100644
+--- a/tclconfig/tcl.m4
++++ b/tclconfig/tcl.m4
+@@ -2400,7 +2400,7 @@ AC_DEFUN([TEA_TIME_HANDLER], [
+ 	AC_TRY_COMPILE([#include <time.h>],
+ 	    [extern long timezone;
+ 	    timezone +=3D 1;
+-	    exit (0);],
++	    return 0;],
+ 	    tcl_cv_timezone_long=3Dyes, tcl_cv_timezone_long=3Dno)])
+     if test $tcl_cv_timezone_long =3D yes ; then
+ 	AC_DEFINE(HAVE_TIMEZONE_VAR, 1, [Should we use the global timezone var=
iable?])
+@@ -2412,7 +2412,7 @@ AC_DEFUN([TEA_TIME_HANDLER], [
+ 	    AC_TRY_COMPILE([#include <time.h>],
+ 		[extern time_t timezone;
+ 		timezone +=3D 1;
+-		exit (0);],
++		return 0;],
+ 		tcl_cv_timezone_time=3Dyes, tcl_cv_timezone_time=3Dno)])
+ 	if test $tcl_cv_timezone_time =3D yes ; then
+ 	    AC_DEFINE(HAVE_TIMEZONE_VAR, 1, [Should we use the global timezone=
 variable?])
+@@ -2452,17 +2452,17 @@ AC_DEFUN([TEA_BUGGY_STRTOD], [
+ 		    double value;
+ 		    value =3D strtod(infString, &term);
+ 		    if ((term !=3D infString) && (term[-1] =3D=3D 0)) {
+-			exit(1);
++			return 1;
+ 		    }
+ 		    value =3D strtod(nanString, &term);
+ 		    if ((term !=3D nanString) && (term[-1] =3D=3D 0)) {
+-			exit(1);
++			return 1;
+ 		    }
+ 		    value =3D strtod(spaceString, &term);
+ 		    if (term =3D=3D (spaceString+1)) {
+-			exit(1);
++			return 1;
+ 		    }
+-		    exit(0);
++		    return 0;
+ 		}], tcl_cv_strtod_buggy=3Dok, tcl_cv_strtod_buggy=3Dbuggy,
+ 		    tcl_cv_strtod_buggy=3Dbuggy)])
+ 	if test "$tcl_cv_strtod_buggy" =3D buggy; then
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes=
-devtools/expect/expect_5.45.4.bb
index 18904ebc10a..174b35ec739 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/=
${BPN}${PV}.tar.gz \
            file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
            file://0001-fixline1-fix-line-1.patch \
            file://0001-Add-prototype-to-function-definitions.patch \
+           file://expect-configure-c99.patch \
            file://run-ptest \
            "
 SRC_URI[md5sum] =3D "00fce8de158422f5ccd2666512329bd2"
--=20
2.34.1


