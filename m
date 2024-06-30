Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED9EC41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:59 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.4271.1719778131122483114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jMNTtzyd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-701ef03185fso1370029a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778130; x=1720382930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRXrs4+LBnz8ul/HppPGhv9lc3LC0c7OwCjhLy6j3rI=;
        b=jMNTtzydu3OgQWRnZ/3qC2QjlWKqIqTSIc+X18poAV+yWkTkr64UiJWlfa8wTBajRd
         ObCUrWobxO3zVDCnPxNimOG0BSWblS2d783VW37py99+d79dpwWImz5RqcFZwsfSW6KA
         edkw5sul4xvixLhuLElU3IIA8l4no3m9/bq4ZLC1MQFUwvTpnYpoBe9eQW72Am/GH7Od
         wKKtN+AaHYTu9Fevs2hqyX8RMY2GdDviGtt2QgZ33o+D5C8tLQIZ1jHSuQE7ay93z1TU
         fwhkn0unYZFDvDEKkcB/yXjR6PQLdVXhC71RNy4AHbw4GC2rcYqt6snydoex9tLGl9QF
         A6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778130; x=1720382930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRXrs4+LBnz8ul/HppPGhv9lc3LC0c7OwCjhLy6j3rI=;
        b=YbHpgjWquMxYmxvdDRZBafl7Je/5hsQLS1bmWpbqJY6V0AJXFHkRTRjDnDddLUVgxa
         t2sUW7lTyPzpOWxXkdpL+xYRhG96SXRNU02pNvKYIdYosA8pWj/QQENd8WxeuUUR+FkL
         wLoubHSBOE7b3ulSQMRslTSTpHJXr1PfCe0TfOye7EYg3VQd2NjGQLvsB1GitYd6ZimO
         +QSPrX30StkU8i1pgMlpMHaPImEQOpp1a4rAw6IHKeFdt537SVoOIBdXsITpz7st0R6N
         xXgF9tToDCxU1uSnyYG98Dx3t82zhdkrms4lD6ZzqZdTIji6SO+6Q7K3bXLewGhE/nhv
         /JeA==
X-Gm-Message-State: AOJu0YzQleJt9vu/AJxY10dJjIu68cN2j7XFY4MSCab/CEeCGR5LSTy8
	YXz31fCt7PSV6T6XtZAz1JncM3K4+Vn/9x7LeRjuuI8ssw4v3JI59tPAtPrz+3EcmzrJpXODxIx
	WL70=
X-Google-Smtp-Source: AGHT+IFLJoinl9wUg20TETPS7DGpJi6iYWjbLU5odKJOjmME3ggqr50NqNvS9U471lQBbIr99uT+KQ==
X-Received: by 2002:a05:6358:6f93:b0:1a5:bbe2:5060 with SMTP id e5c5f4694b2df-1a6acd26d34mr437724255d.17.1719778130098;
        Sun, 30 Jun 2024 13:08:50 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/35] expect: fix configure with GCC 14
Date: Sun, 30 Jun 2024 13:07:43 -0700
Message-Id: <5c6630e61ad85a4bf9eecd94005e14f0e34df463.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201268

From: Ross Burton <ross.burton@arm.com>

The configure script has many fragments that fail to compile with GCC 14,
take a patch submitted upstream to fix these issues.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c21ca789c288662aa3d307b30813cd03cc8c158)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expect/expect/expect-configure-c99.patch  | 201 ++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/expect-configure-c99.patch

diff --git a/meta/recipes-devtools/expect/expect/expect-configure-c99.patch b/meta/recipes-devtools/expect/expect/expect-configure-c99.patch
new file mode 100644
index 0000000000..09bf180df7
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
+Upstream-Status: Submitted [https://sourceforge.net/p/expect/patches/24/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/configure.in b/configure.in
+index 51558fa14d2bcf7e..055c88fbd8797eaa 100755
+--- a/configure.in
++++ b/configure.in
+@@ -452,7 +452,11 @@ AC_CHECK_FUNC(siglongjmp, AC_DEFINE(HAVE_SIGLONGJMP))
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
+ 	FILE *fp = fopen("wnohang","w");
+@@ -527,16 +533,21 @@ else
+   AC_DEFINE(SELECT_MASK_TYPE, fd_set)
+ fi
+ 
+-dnl # Check for the data type of the function used in signal(). This
+-dnl # must be before the test for rearming.
+-dnl # echo checking return type of signal handlers
+-dnl AC_HEADER_EGREP([(void|sighandler_t).*signal], signal.h, retsigtype=void,AC_DEFINE(RETSIGTYPE, int) retsigtype=int)
++AC_TYPE_SIGNAL
+ 
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
+ 
+ int signal_rearms = 0;
+ 
+@@ -553,6 +564,7 @@ int n;
+ signal_rearms++;
+ }
+ 
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
+         PTY_TYPE=termios
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
+         PTY_TYPE=termios
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
+ SETUID=":"
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
+   int *x = &daylight;
+   char **y = tzname;
+ 
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
+ 	    timezone += 1;
+-	    exit (0);],
++	    return 0;],
+ 	    tcl_cv_timezone_long=yes, tcl_cv_timezone_long=no)])
+     if test $tcl_cv_timezone_long = yes ; then
+ 	AC_DEFINE(HAVE_TIMEZONE_VAR, 1, [Should we use the global timezone variable?])
+@@ -2412,7 +2412,7 @@ AC_DEFUN([TEA_TIME_HANDLER], [
+ 	    AC_TRY_COMPILE([#include <time.h>],
+ 		[extern time_t timezone;
+ 		timezone += 1;
+-		exit (0);],
++		return 0;],
+ 		tcl_cv_timezone_time=yes, tcl_cv_timezone_time=no)])
+ 	if test $tcl_cv_timezone_time = yes ; then
+ 	    AC_DEFINE(HAVE_TIMEZONE_VAR, 1, [Should we use the global timezone variable?])
+@@ -2452,17 +2452,17 @@ AC_DEFUN([TEA_BUGGY_STRTOD], [
+ 		    double value;
+ 		    value = strtod(infString, &term);
+ 		    if ((term != infString) && (term[-1] == 0)) {
+-			exit(1);
++			return 1;
+ 		    }
+ 		    value = strtod(nanString, &term);
+ 		    if ((term != nanString) && (term[-1] == 0)) {
+-			exit(1);
++			return 1;
+ 		    }
+ 		    value = strtod(spaceString, &term);
+ 		    if (term == (spaceString+1)) {
+-			exit(1);
++			return 1;
+ 		    }
+-		    exit(0);
++		    return 0;
+ 		}], tcl_cv_strtod_buggy=ok, tcl_cv_strtod_buggy=buggy,
+ 		    tcl_cv_strtod_buggy=buggy)])
+ 	if test "$tcl_cv_strtod_buggy" = buggy; then
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 18904ebc10..174b35ec73 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
            file://0001-fixline1-fix-line-1.patch \
            file://0001-Add-prototype-to-function-definitions.patch \
+           file://expect-configure-c99.patch \
            file://run-ptest \
            "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
-- 
2.34.1


