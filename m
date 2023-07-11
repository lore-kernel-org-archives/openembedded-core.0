Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0902EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:41:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.1616.1689118882192113053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rDzp6NTd;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-66f5faba829so3746493b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689118881; x=1691710881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEH89BN562/FsrliN56HrYJXirF9gckSxymtQsHC31o=;
        b=rDzp6NTd3J7S1UYN1c9DlICK2ErlvExysCEFhsFkhkek9wK2SmT7Wxz7vFvUtx6IWm
         LjaXQ8GeNCHvncIuBqgHMb/0n+IHE8oJA2tdAG47Hq/2KGWyw7p/oKSf4GzYeY6TbL4D
         wovcmh4ZbS1Pf8eWZm1K0eGfrSsT2TO5Wd1uFkP2sXmyUu7WzL+y+36Sn8fGlAEKgOFg
         NU/8tyajVz8UgJopzxvto6kGq6F2C6EYIYuUJfxBglQ1GZwiuDE7NspramCWnF/SXlVG
         +ljDVAE7iDlp68EdYrqSWqm9efdtAYMpymiLoImWgGkyoKrJZ/nVEkdKa1YtaNFDaMwy
         Ru0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689118881; x=1691710881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEH89BN562/FsrliN56HrYJXirF9gckSxymtQsHC31o=;
        b=YRY8Un/+m4Aisy7gUL+jZkvX8JY8qrbs02tW/0DuhRzSdkgcEXTqugO1gwBU3f650E
         uhqELvApBxFgxFHgTUgM1+RGMDJxWRgtO58X7oKmMjQsyRSXqYKb+sws/UAy+E+4zQeJ
         gKfkkRVuUkKoKuppXz6aRK+NcOFyDFpzOAvpvJEVzbGDj81/mm8Nd9z/JOL3nsTCLEso
         XXo/mrrItEt8tRcbcrrAt2tCk/F2e1Jykz2j1gHpZyz80DHZ45eS5dThQcnf25AV8O1c
         xp4bNs/M8koAq/PPnONiE/d3ZzgzvisUQ7wgkIS86selxhfoYpjRFqW4dzdd/R1A6NIj
         WlbA==
X-Gm-Message-State: ABy/qLaReWMFfIiQU8HYWeZjxz8Nq58jEDQlCRE22VEScPkZsY/FYnN0
	Pya+pGI0bfAxBYfaPvjLgUBqg1OFLH8=
X-Google-Smtp-Source: APBJJlEfXs6OoMAUaeo+glHbhldA5aBXDi7ia1ln1Y+VTzUnUUPJ9741QywnQS8f94OTbOUm400NnQ==
X-Received: by 2002:a05:6a20:12d4:b0:126:b8d4:622d with SMTP id v20-20020a056a2012d400b00126b8d4622dmr17236826pzg.49.1689118880419;
        Tue, 11 Jul 2023 16:41:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::b82d])
        by smtp.gmail.com with ESMTPSA id i19-20020aa787d3000000b0063b7f3250e9sm2263133pfo.7.2023.07.11.16.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 16:41:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] autoconf_2.72c.bb: Backport fixes
Date: Tue, 11 Jul 2023 16:41:14 -0700
Message-ID: <20230711234117.2924622-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711234117.2924622-1-raj.khem@gmail.com>
References: <20230711234117.2924622-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184165

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._DIR-Rewrite-using-AC_CANONICAL_HOST.patch |  82 +++++
 ...PE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch |  76 ++++
 ..._TRADITIONAL-a-compatibility-alias-f.patch | 179 ++++++++++
 ...to-programs-misusing-AC_EGREP_HEADER.patch |  80 +++++
 ...TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch | 327 ++++++++++++++++++
 ...-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch |  83 +++++
 ...st-few-internal-uses-of-AC_EGREP_CPP.patch | 115 ++++++
 ...0007-Support-circa-early-2022-Gnulib.patch |  31 ++
 ...7-Support-underquoted-callers-better.patch |  55 +++
 .../autoconf/autoconf_2.72c.bb                |   9 +
 10 files changed, 1037 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0002-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0003-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0004-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0005-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0006-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0007-Support-circa-early-2022-Gnulib.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0007-Support-underquoted-callers-better.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch b/meta/recipes-devtools/autoconf/autoconf/0001-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
new file mode 100644
index 00000000000..f1b8bebc2f1
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0001-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
@@ -0,0 +1,82 @@
+From dcf9bb7e3b12f3bd74edff60e80b53e668159579 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 10:27:08 -0400
+Subject: [PATCH 1/7] AC_XENIX_DIR: Rewrite using AC_CANONICAL_HOST.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+AC_XENIX_DIR is an obsolete macro, defined as AC_HEADER_DIRENT plus
+code to make absolutely sure configure scripts that depended on a
+shell variable internal to the original (2.13 era) definition of
+AC_XENIX_DIR are not broken by autoupdate.  (That variable had the
+temptingly public-sounding name “XENIX.”)  This compatibility code
+uses AC_EGREP_CPP, which is itself discouraged for use in new
+configure scripts.
+
+(N.B. codesearch.debian.net does not find any uses whatsoever of
+this macro, nor any code in an .ac or .m4 file that depends on the
+XENIX variable.)
+
+Change the compatibility code to use AC_CANONICAL_HOST instead,
+and clarify which pieces of the code inserted by autoupdate are
+probably still necessary.
+
+* lib/autoconf/specific.m4 (AC_XENIX_DIR): Set XENIX variable
+  based on value of host_os. Clarify what manual cleanup is
+  recommended after autoupdate replaces this obsolete macro.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 26 +++++++++++---------------
+ 1 file changed, 11 insertions(+), 15 deletions(-)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index 1b3ee661b..a2dc5d488 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -754,9 +754,9 @@ dnl it should only be defined when necessary.
+ ## Checks for UNIX variants.  ##
+ ## -------------------------- ##
+ 
+-
+-# These are kludges which should be replaced by a single POSIX check.
+-# They aren't cached, to discourage their use.
++# These macros are all obsolete, from the early days of Autoconf,
++# before the invention of AC_CANONICAL_SYSTEM.  Autoupdate will
++# replace each with inline code for a more modern feature check.
+ 
+ # AC_AIX
+ # ------
+@@ -776,19 +776,15 @@ AU_DEFUN([AC_ISC_POSIX], [AC_SEARCH_LIBS([strerror], [cposix])])
+ # AC_XENIX_DIR
+ # ------------
+ AU_DEFUN([AC_XENIX_DIR],
+-[AC_MSG_CHECKING([for Xenix])
+-AC_EGREP_CPP([yes],
+-[#if defined M_XENIX && ! defined M_UNIX
+-  yes
+-@%:@endif],
+-	     [AC_MSG_RESULT([yes]); XENIX=yes],
+-	     [AC_MSG_RESULT([no]); XENIX=])
+-
+-AC_HEADER_DIRENT[]dnl
++[AC_HEADER_DIRENT
++# Autoupdate added the next two lines to ensure that your configure
++# script's behavior did not change.  They are safe to remove unless
++# you have code that depends on the XENIX shell variable.
++AC_CANONICAL_HOST
++AS_CASE([$host_os], [xenix*], [XENIX=yes], [XENIX=no])
++# End of code added by autoupdate
+ ],
+-[You shouldn't need to depend upon XENIX.  Remove the
+-'AC_MSG_CHECKING', 'AC_EGREP_CPP', and this warning if this part
+-of the test is useless.])
++[Check for code depending on the XENIX shell variable.])
+ 
+ 
+ # AC_DYNIX_SEQ
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0002-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch b/meta/recipes-devtools/autoconf/autoconf/0002-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
new file mode 100644
index 00000000000..11099d3cfc5
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0002-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
@@ -0,0 +1,76 @@
+From 51d98495d1aac00970d791f064e83ca762bf81c7 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 10:43:51 -0400
+Subject: [PATCH 2/7] AC_TYPE_UID_T: Rewrite using AC_CHECK_TYPE.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+AC_TYPE_UID_T uses AC_EGREP_HEADER to search sys/types.h for
+occurrences of the string ‘uid_t’ and, if found, assumes both
+uid_t and gid_t are available.  This would be better done using
+a pair of AC_CHECK_TYPE operations.
+
+I also converted two uses of old-style AC_CHECK_TYPE, immediately
+below, to new-style.  (There are probably other old-style uses in
+this file, I only did the ones I happened to see.)
+
+* lib/autoconf/types.m4 (AC_TYPE_UID_T): Check for uid_t and gid_t,
+  separately, using AC_CHECK_TYPE, instead of grepping sys/types.h.
+  (AC_TYPE_SIZE_T, AC_TYPE_SSIZE_T): Use new-style AC_CHECK_TYPE.
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/types.m4 | 30 +++++++++++++++++-------------
+ 1 file changed, 17 insertions(+), 13 deletions(-)
+
+diff --git a/lib/autoconf/types.m4 b/lib/autoconf/types.m4
+index ebac0cf6d..ef2456135 100644
+--- a/lib/autoconf/types.m4
++++ b/lib/autoconf/types.m4
+@@ -589,25 +589,29 @@ AC_DEFUN([AC_TYPE_MBSTATE_T],
+ 
+ # AC_TYPE_UID_T
+ # -------------
+-# FIXME: Rewrite using AC_CHECK_TYPE.
+ AN_IDENTIFIER([gid_t], [AC_TYPE_UID_T])
+ AN_IDENTIFIER([uid_t], [AC_TYPE_UID_T])
+ AC_DEFUN([AC_TYPE_UID_T],
+-[AC_CACHE_CHECK(for uid_t in sys/types.h, ac_cv_type_uid_t,
+-[AC_EGREP_HEADER(uid_t, sys/types.h,
+-  ac_cv_type_uid_t=yes, ac_cv_type_uid_t=no)])
+-if test $ac_cv_type_uid_t = no; then
+-  AC_DEFINE(uid_t, int, [Define to 'int' if <sys/types.h> doesn't define.])
+-  AC_DEFINE(gid_t, int, [Define to 'int' if <sys/types.h> doesn't define.])
+-fi
+-])
+-
+-
++[AC_CHECK_TYPE([uid_t], [],
++  [AC_DEFINE([uid_t], [int],
++    [Define as 'int' if <sys/types.h> doesn't define.])])
++AC_CHECK_TYPE([gid_t], [],
++  [AC_DEFINE([gid_t], [int],
++    [Define as 'int' if <sys/types.h> doesn't define.])])])
++
++# This should be obsoleted, size_t is in C90.
+ AN_IDENTIFIER([size_t], [AC_TYPE_SIZE_T])
+-AC_DEFUN([AC_TYPE_SIZE_T], [AC_CHECK_TYPE(size_t, unsigned int)])
++AC_DEFUN([AC_TYPE_SIZE_T],
++[AC_CHECK_TYPE([size_t], [],
++  [AC_DEFINE([size_t], [unsigned int],
++    [Define as 'unsigned int' if <stddef.h> doesn't define.])])])
+ 
+ AN_IDENTIFIER([ssize_t], [AC_TYPE_SSIZE_T])
+-AC_DEFUN([AC_TYPE_SSIZE_T], [AC_CHECK_TYPE(ssize_t, int)])
++AC_DEFUN([AC_TYPE_SSIZE_T],
++[AC_CHECK_TYPE([ssize_t], [],
++  [AC_DEFINE([ssize_t], [int],
++    [Define as 'int' if <sys/types.h> doesn't define.])])])
++
+ 
+ AN_IDENTIFIER([pid_t], [AC_TYPE_PID_T])
+ AC_DEFUN([AC_TYPE_PID_T],
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0003-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch b/meta/recipes-devtools/autoconf/autoconf/0003-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
new file mode 100644
index 00000000000..6acec8615e8
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0003-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
@@ -0,0 +1,179 @@
+From daaca7f74f94d6a7a51d571156d5fbaba5ef9a87 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 21:03:30 -0400
+Subject: [PATCH 3/7] Make AC_PROG_GCC_TRADITIONAL a compatibility alias for
+ AC_PROG_CC.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This macro is one of the last remaining internal uses of AC_EGREP_CPP.
+It has only ever done anything useful with GCC, and GCC dropped
+support for ‘traditional’ compilation in version 3.3 (released 2003)
+so I do not think it is worth trying to preserve.
+
+* lib/autoconf/c.m4 (AC_PROG_GCC_TRADITIONAL): Make into a
+  compatibility alias for AC_PROG_CC, similar to AC_PROG_CC_STDC.
+* lib/autoconf/general.m4 (AC_EGREP_CPP): Remove stale comment.
+* doc/autoconf.texi, NEWS: Document this change.
+* tests/mktests.pl: Exclude AC_PROG_GCC_TRADITIONAL from
+  autoupdate tests.
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                    |  7 +++++++
+ doc/autoconf.texi       | 29 ++++++++++++++---------------
+ lib/autoconf/c.m4       | 30 ++++++------------------------
+ lib/autoconf/general.m4 |  2 --
+ tests/mktests.pl        |  2 +-
+ 5 files changed, 28 insertions(+), 42 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 6a106f155..53c57ff59 100644
+--- a/NEWS
++++ b/NEWS
+@@ -81,6 +81,13 @@ GNU Autoconf NEWS - User visible changes.
+   with plain apostrophes instead of the older GNU style `like this'
+   with grave accent and apostrophe.
+ 
++*** AC_PROG_GCC_TRADITIONAL no longer does anything.
++
++  This macro has had no useful effect since GCC dropped support for
++  traditional-mode compilation in version 3.3 (released in 2003), and
++  the systems that needed it are also long obsolete.  It is now a
++  compatibility synonym for AC_PROG_CC.
++
+ ** Notable bug fixes
+ 
+ *** Autoconf caches now use finer-grained timestamps.
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 8db64d8bb..037c8055f 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -7764,20 +7764,6 @@ This macro is obsolescent, as current C compilers support prototypes.
+ New programs need not use this macro.
+ @end defmac
+ 
+-@anchor{AC_PROG_GCC_TRADITIONAL}
+-@defmac AC_PROG_GCC_TRADITIONAL
+-@acindex{PROG_GCC_TRADITIONAL}
+-@ovindex CC
+-Add @option{-traditional} to output variable @code{CC} if using a
+-GNU C compiler and @code{ioctl} does not work properly without
+-@option{-traditional}.  That usually happens when the fixed header files
+-have not been installed on an old system.
+-
+-This macro is obsolescent, since current versions of the GNU C
+-compiler fix the header files automatically when installed.
+-@end defmac
+-
+-
+ @node C++ Compiler
+ @subsection C++ Compiler Characteristics
+ 
+@@ -23986,7 +23972,8 @@ These days portable programs should use @code{waitpid}, not
+ 
+ @defmac AC_GCC_TRADITIONAL
+ @acindex{GCC_TRADITIONAL}
+-Replaced by @code{AC_PROG_GCC_TRADITIONAL} (@pxref{AC_PROG_GCC_TRADITIONAL}).
++Replaced by @code{AC_PROG_GCC_TRADITIONAL} (@pxref{AC_PROG_GCC_TRADITIONAL}),
++which is itself obsolete.
+ @end defmac
+ 
+ @defmac AC_GETGROUPS_T
+@@ -24369,6 +24356,18 @@ Now done by @code{AC_PROG_CC} (@pxref{AC_PROG_CC}).
+ Now done by @code{AC_PROG_CC} (@pxref{AC_PROG_CC}).
+ @end defmac
+ 
++@anchor{AC_PROG_GCC_TRADITIONAL}
++@defmac AC_PROG_GCC_TRADITIONAL
++@acindex{PROG_GCC_TRADITIONAL}
++Used to put GCC into ``traditional'' (pre-ISO C) compilation mode,
++on systems with headers that did not work correctly with a
++standard-compliant compiler.  GCC has not supported traditional
++compilation in many years, and all of the systems that required this are
++long obsolete themselves.  This macro is now a compatibility synonym for
++@code{AC_PROG_CC} (@pxref{AC_PROG_CC}).
++
++@end defmac
++
+ @defmac AC_PROGRAMS_CHECK
+ @acindex{PROGRAMS_CHECK}
+ Replaced by @code{AC_CHECK_PROGS} (@pxref{AC_CHECK_PROGS}).
+diff --git a/lib/autoconf/c.m4 b/lib/autoconf/c.m4
+index fef6c516d..33648b5b9 100644
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -551,30 +551,6 @@ fi[]dnl
+ ])# _AC_PROG_CC_G
+ 
+ 
+-# AC_PROG_GCC_TRADITIONAL
+-# -----------------------
+-AC_DEFUN([AC_PROG_GCC_TRADITIONAL],
+-[AC_REQUIRE([AC_PROG_CC])dnl
+-if test $ac_cv_c_compiler_gnu = yes; then
+-    AC_CACHE_CHECK(whether $CC needs -traditional,
+-      ac_cv_prog_gcc_traditional,
+-[  ac_pattern="Autoconf.*'x'"
+-  AC_EGREP_CPP($ac_pattern, [#include <sgtty.h>
+-Autoconf TIOCGETP],
+-  ac_cv_prog_gcc_traditional=yes, ac_cv_prog_gcc_traditional=no)
+-
+-  if test $ac_cv_prog_gcc_traditional = no; then
+-    AC_EGREP_CPP($ac_pattern, [#include <termio.h>
+-Autoconf TCGETA],
+-    ac_cv_prog_gcc_traditional=yes)
+-  fi])
+-  if test $ac_cv_prog_gcc_traditional = yes; then
+-    CC="$CC -traditional"
+-  fi
+-fi
+-])# AC_PROG_GCC_TRADITIONAL
+-
+-
+ # AC_PROG_CC_C_O
+ # --------------
+ AC_DEFUN([AC_PROG_CC_C_O],
+@@ -1675,6 +1651,12 @@ AU_DEFUN([AC_PROG_CC_STDC],
+   [$0 is obsolete; use AC_PROG_CC]
+ )
+ 
++# AC_PROG_GCC_TRADITIONAL
++# -----------------------
++AU_DEFUN([AC_PROG_GCC_TRADITIONAL],
++  [AC_REQUIRE([AC_PROG_CC])],
++  [$0 is obsolete; use AC_PROG_CC]
++)
+ 
+ # AC_C_BACKSLASH_A
+ # ----------------
+diff --git a/lib/autoconf/general.m4 b/lib/autoconf/general.m4
+index ecda0a51c..47d896d54 100644
+--- a/lib/autoconf/general.m4
++++ b/lib/autoconf/general.m4
+@@ -2766,8 +2766,6 @@ AU_DEFUN([AC_TRY_CPP],
+ # AC_EGREP_CPP(PATTERN, PROGRAM,
+ #              [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND])
+ # ------------------------------------------------------
+-# Because this macro is used by AC_PROG_GCC_TRADITIONAL, which must
+-# come early, it is not included in AC_BEFORE checks.
+ AC_DEFUN([AC_EGREP_CPP],
+ [AC_LANG_PREPROC_REQUIRE()dnl
+ AC_REQUIRE([_AC_PROG_EGREP_TRADITIONAL])dnl
+diff --git a/tests/mktests.pl b/tests/mktests.pl
+index effed0bca..81f63586c 100644
+--- a/tests/mktests.pl
++++ b/tests/mktests.pl
+@@ -112,7 +112,7 @@ my @ac_exclude_list = (
+ # Check all AU_DEFUN'ed macros with AT_CHECK_AU_MACRO, except these.
+ my @au_exclude_list = (
+   # Empty.
+-  qr/^AC_(C_CROSS|PROG_CC_(C[89]9|STDC))$/,
++  qr/^AC_(C_CROSS|PROG_(CC_(C[89]9|STDC)|GCC_TRADITIONAL))$/,
+ 
+   # Use AC_REQUIRE.
+   qr/^AC_(CYGWIN|MINGW32|EMXOS2)$/,
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch b/meta/recipes-devtools/autoconf/autoconf/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
new file mode 100644
index 00000000000..8bc50295b57
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
@@ -0,0 +1,80 @@
+From 232cab527897bcdf4d55492d41af73d31905bda5 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Fri, 31 Mar 2023 10:46:20 -0700
+Subject: [PATCH 4/7] Cater to programs misusing AC_EGREP_HEADER
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [oe specific]
+Problem reported by Frederic Berat in:
+https://lists.gnu.org/archive/html/autoconf/2022-11/msg00127.html
+* lib/autoconf/programs.m4 (AC_PROG_EGREP): Also set
+EGREP_TRADITIONAL and ac_cv_path_EGREP_TRADITIONAL.
+* tests/c.at (AC_PROG_EGREP and AC_EGREP_HEADER):
+New test, taken from Frederic Berat’s email in:
+https://lists.gnu.org/r/autoconf/2023-03/msg00043.html
+---
+ lib/autoconf/programs.m4 | 10 ++++++++++
+ tests/c.at               | 24 ++++++++++++++++++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/lib/autoconf/programs.m4 b/lib/autoconf/programs.m4
+index 1b7460c8..62ba6b8b 100644
+--- a/lib/autoconf/programs.m4
++++ b/lib/autoconf/programs.m4
+@@ -371,6 +371,16 @@ AC_CACHE_CHECK([for egrep], ac_cv_path_EGREP,
+    fi])
+  EGREP="$ac_cv_path_EGREP"
+  AC_SUBST([EGREP])
++ dnl
++ dnl Also set EGREP_TRADITIONAL even though unnecessary here,
++ dnl for wrong but too-common code with the following pattern:
++ dnl   AC_PROG_EGREP
++ dnl   if false; then
++ dnl      AC_EGREP_HEADER([printf], [stdio.h], [has_printf=yes])
++ dnl   fi
++ dnl   AC_EGREP_HEADER([malloc], [stdlib.h], [has_malloc=yes])
++ EGREP_TRADITIONAL=$EGREP
++ ac_cv_path_EGREP_TRADITIONAL=$EGREP
+ ])# AC_PROG_EGREP
+ 
+ # _AC_PROG_EGREP_TRADITIONAL
+diff --git a/tests/c.at b/tests/c.at
+index c37f43b1..fad54760 100644
+--- a/tests/c.at
++++ b/tests/c.at
+@@ -232,6 +232,30 @@ AT_CHECK_DEFINES(
+ AT_CLEANUP
+ 
+ 
++## ----------------------------------- ##
++## AC_PROG_EGREP and AC_EGREP_HEADER.  ##
++## ----------------------------------- ##
++
++AT_SETUP([AC_PROG_EGREP and AC_EGREP_HEADER])
++
++_AT_CHECK_AC_MACRO(
++[[AC_PROG_CPP
++  AC_PROG_EGREP
++
++  # Although this code is incorrect (it should use AS_IF),
++  # it follows a too-common real world pattern.
++  # For now, test for it; we may remove this test later.
++  if false; then
++    AC_EGREP_HEADER([^], [limits.h])
++  fi
++
++  AC_EGREP_HEADER([$], [limits.h], [],
++    [AC_MSG_ERROR([[egrep-related macros do not tolerate misuse of 'if']])])
++]])
++
++AT_CLEANUP
++
++
+ ## ------------------------------------ ##
+ ## AC_NO_EXECUTABLES (working linker).  ##
+ ## ------------------------------------ ##
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0004-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch b/meta/recipes-devtools/autoconf/autoconf/0004-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
new file mode 100644
index 00000000000..0a768022878
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0004-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
@@ -0,0 +1,327 @@
+From b5891a57b586ef6ff78bb752d62915b78cd58d7e Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 15:07:58 -0400
+Subject: [PATCH 4/7] Overhaul AC_TYPE_GETGROUPS and AC_FUNC_GETGROUPS.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+AC_TYPE_GETGROUPS is the last remaining use of AC_EGREP_HEADER in
+stock Autoconf macros.  It uses it only when cross compiling, as a
+fallback from an AC_RUN_IFELSE check, testing for a bug in system
+headers from the late 1980s or early 1990s, where gid_t *existed*
+but the second argument to getgroups needed to be an array of int,
+and this didn’t cause a compile error (i.e. the system headers
+declare getgroups with no prototype or an incorrect prototype).
+AC_FUNC_GETGROUPS also uses AC_RUN_IFELSE to test for obscure
+problems specific to long-obsolete Unixes.
+
+The downsides of AC_RUN_IFELSE and AC_EGREP_HEADER seem more severe
+than the chances of someone compiling a current-generation program,
+that uses getgroups, on an OS old enough to have one of the really
+nasty bugs.  Accordingly, this patch changes AC_FUNC_GETGROUPS to use
+a host_os-based *blacklist* both in native and cross compilation.
+This is limited to the two host_os values for which either our old
+code, or Gnulib, documented a serious bug: ultrix* and nextstep*.
+Currently it does not try to pin down the exact version ranges subject
+to the bugs — that would require research by someone with access to
+the full history of these OSes.
+
+An incorrect guess by this blacklist can be overridden by setting
+ac_cv_func_getgroups_works in config.site.  AC_TYPE_GETGROUPS, for its
+part, now does a series of regular old AC_COMPILE_IFELSE checks to
+probe the prototype of getgroups, and considers that good enough.
+
+While I was in there I noticed that AC_FUNC_GETGROUPS does not
+AC_SUBST a documented output variable, and that the name of this
+variable is misspelled in the manual.
+
+* lib/autoconf/functions.m4 (AC_FUNC_GETGROUPS): Use AC_SEARCH_LIBS
+  to probe for getgroups.  Use an AC_CANONICAL_HOST-based blacklist
+  for bug detection, not AC_RUN_IFELSE.  AC_SUBST the GETGROUPS_LIB
+  output variable.
+* lib/autoconf/types.m4 (AC_TYPE_GETGROUPS): Check only the prototype
+  of getgroups, using AC_COMPILE_IFELSE; do not use either AC_RUN_IFELSE
+  or AC_EGREP_HEADER.
+* doc/autoconf.texi: Update to match. Correct misspelling of
+  GETGROUPS_LIB.
+* tests.local.at (_AT_CHECK_ENV): Allow GETGROUPS_LIB output variable.
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ NEWS                      | 11 +++++
+ doc/autoconf.texi         | 25 ++++++----
+ lib/autoconf/functions.m4 | 61 ++++++++++++------------
+ lib/autoconf/types.m4     | 97 ++++++++++++++++++++++++---------------
+ tests/local.at            |  2 +-
+ 5 files changed, 120 insertions(+), 76 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 53c57ff59..8e4ecc1bf 100644
+--- a/NEWS
++++ b/NEWS
+@@ -38,6 +38,17 @@ GNU Autoconf NEWS - User visible changes.
+   This matters only for uses that, contrary to the documentation
+   and despite warnings, use m4_divert with numbered diversions.
+ 
++*** AC_FUNC_GETGROUPS and AC_TYPE_GETGROUPS no longer run test programs.
++  These macros were testing for OS bugs that we believe are at least
++  twenty years in the past.  Most operating systems are now trusted to
++  provide an accurate prototype for getgroups in unistd.h, and to
++  implement it as specified in POSIX.
++
++  AC_FUNC_GETGROUPS still includes a short blacklist of OSes with
++  known, severe bugs in getgroups.  It can be overridden using
++  config.site.  If you encounter a mistake in this blacklist
++  please report it to bug-autoconf.
++
+ ** New features
+ 
+ *** New macro AC_SYS_YEAR2038.
+diff --git a/doc/autoconf.texi b/doc/autoconf.texi
+index 037c8055f..5d5f613e6 100644
+--- a/doc/autoconf.texi
++++ b/doc/autoconf.texi
+@@ -5257,17 +5257,26 @@ and also contains workarounds for other portability problems of
+ @defmac AC_FUNC_GETGROUPS
+ @acindex{FUNC_GETGROUPS}
+ @cvindex HAVE_GETGROUPS
+-@ovindex GETGROUPS_LIBS
++@ovindex GETGROUPS_LIB
+ @c @fuindex getgroups
+ @prindex @code{getgroups}
+ @caindex func_getgroups_works
+-If the @code{getgroups} function is available and works,
+-define @code{HAVE_GETGROUPS}.  Set @code{GETGROUPS_LIBS} to any libraries
+-needed to get that function.  This macro runs @code{AC_TYPE_GETGROUPS}.
+-
+-This macro is obsolescent. New programs need not use this macro.  But
+-they may want to use the Gnulib module @code{getgroups}, which provides
+-workarounds to other portability problems of this function.
++Perform all the checks performed by @code{AC_TYPE_GETGROUPS}
++(@pxref{AC_TYPE_GETGROUPS}).
++Then, if the @code{getgroups} function is available
++and known to work correctly, define @code{HAVE_GETGROUPS}.
++Set the output variable @code{GETGROUPS_LIB} to any libraries
++needed to get that function.
++
++This macro relies on a list of systems with known, serious bugs in
++@code{getgroups}.  If this list mis-identifies your system's
++@code{getgroups} as buggy, or as not buggy, you can override it by
++setting the cache variable @code{ac_cv_func_getgroups_works} in a
++@file{config.site} file (@pxref{Site Defaults}).  Please also report the
++error to @email{bug-autoconf@@gnu.org, the Autoconf Bugs mailing list}.
++
++The Gnulib module @code{getgroups} provides workarounds for additional,
++less severe portability problems with this function.
+ @end defmac
+ 
+ @anchor{AC_FUNC_GETLOADAVG}
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 655d6ba8f..74512e97d 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -698,47 +698,46 @@ AS_IF([test "$ac_cv_func_fseeko_ftello" = "need _LARGEFILE_SOURCE"],
+ # When cross-compiling, assume getgroups is broken.
+ AN_FUNCTION([getgroups], [AC_FUNC_GETGROUPS])
+ AC_DEFUN([AC_FUNC_GETGROUPS],
+-[AC_REQUIRE([AC_TYPE_GETGROUPS])dnl
+-AC_REQUIRE([AC_TYPE_SIZE_T])dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl for cross-compiles
+-AC_CHECK_FUNC(getgroups)
++[AC_REQUIRE([AC_CANONICAL_HOST])dnl
++AC_REQUIRE([AC_TYPE_GETGROUPS])dnl
+ 
+-# If we don't yet have getgroups, see if it's in -lbsd.
++# On older systems getgroups might be in -lbsd.
+ # This is reported to be necessary on an ITOS 3000WS running SEIUX 3.1.
+ ac_save_LIBS=$LIBS
+-if test $ac_cv_func_getgroups = no; then
+-  AC_CHECK_LIB(bsd, getgroups, [GETGROUPS_LIB=-lbsd])
+-fi
+-
+-# Run the program to test the functionality of the system-supplied
+-# getgroups function only if there is such a function.
++LIBS=
++GETGROUPS_LIB=
++AC_SEARCH_LIBS([getgroups], [bsd],
++  [test "$ac_res" = "none required" || GETGROUPS_LIB="$ac_res"
++   ac_cv_func_getgroups=yes],
++  [ac_cv_func_getgroups=no])
++LIBS=$ac_save_LIBS
++AC_SUBST([GETGROUPS_LIB])
++
++# Known severe bugs in getgroups on particular systems.
++#  - On Ultrix 4.3 and NextSTEP 3.2, getgroups (0, 0) is reported to
++#    fail, rather than returning the number of supplementary groups as
++#    it ought to.  We do not know the exact range of releases affected
++#    in either case.
++# We currently reject all versions of the systems with known bugs, and
++# no other systems.  Please send corrections to bug-autoconf@gnu.org.
+ if test $ac_cv_func_getgroups = yes; then
++  # This AC_CACHE_CHECK exists so that one may override an incorrect
++  # guess by setting ac_cv_func_getgroups_works in a config.site file.
+   AC_CACHE_CHECK([for working getgroups], ac_cv_func_getgroups_works,
+-   [AC_RUN_IFELSE([AC_LANG_PROGRAM([AC_INCLUDES_DEFAULT],
+-      [[/* On Ultrix 4.3, getgroups (0, 0) always fails.  */
+-       return getgroups (0, 0) == -1;]])],
+-		  [ac_cv_func_getgroups_works=yes],
+-		  [ac_cv_func_getgroups_works=no],
+-		  [case "$host_os" in # ((
+-			     # Guess yes on glibc systems.
+-		     *-gnu*) ac_cv_func_getgroups_works="guessing yes" ;;
+-			     # If we don't know, assume the worst.
+-		     *)      ac_cv_func_getgroups_works="guessing no" ;;
+-		   esac])
+-   ])
++   [AS_CASE([$host_os],
++     [ultrix* | nextstep*],
++      [ac_cv_func_getgroups_works=no # getgroups(0,0) fails
++],
++      [ac_cv_func_getgroups_works=yes])])
+ else
+   ac_cv_func_getgroups_works=no
+ fi
+-case "$ac_cv_func_getgroups_works" in
+-  *yes)
+-    AC_DEFINE(HAVE_GETGROUPS, 1,
+-	      [Define to 1 if your system has a working 'getgroups' function.])
+-    ;;
+-esac
+-LIBS=$ac_save_LIBS
++if test $ac_cv_func_getgroups_works = yes; then
++  AC_DEFINE(HAVE_GETGROUPS, 1,
++            [Define to 1 if your system has a working 'getgroups' function.])
++fi
+ ])# AC_FUNC_GETGROUPS
+ 
+-
+ # _AC_LIBOBJ_GETLOADAVG
+ # ---------------------
+ # Set up the AC_LIBOBJ replacement of 'getloadavg'.
+diff --git a/lib/autoconf/types.m4 b/lib/autoconf/types.m4
+index ef2456135..af3872b2f 100644
+--- a/lib/autoconf/types.m4
++++ b/lib/autoconf/types.m4
+@@ -258,44 +258,69 @@ AN_IDENTIFIER([ptrdiff_t], [AC_CHECK_TYPES])
+ # AC_TYPE_GETGROUPS
+ # -----------------
+ AC_DEFUN([AC_TYPE_GETGROUPS],
++dnl We now unconditionally assume that if <unistd.h> has a prototype for
++dnl getgroups, it is accurate; and that if <unistd.h> does _not_ declare
++dnl getgroups with a prototype, the second argument is an array of int.
++dnl (Older versions of Autoconf made these assumptions only when cross
++dnl compiling.)  See AC_FUNC_GETGROUPS, over in functions.m4, for why
++dnl this uses AC_COMPILE_IFELSE rather than AC_LINK_IFELSE.
+ [AC_REQUIRE([AC_TYPE_UID_T])dnl
+-AC_CACHE_CHECK(type of array argument to getgroups, ac_cv_type_getgroups,
+-[AC_RUN_IFELSE([AC_LANG_SOURCE(
+-[[/* Thanks to Mike Rendell for this test.  */
+-]AC_INCLUDES_DEFAULT[
+-#define NGID 256
+-#undef MAX
+-#define MAX(x, y) ((x) > (y) ? (x) : (y))
+-
+-int
+-main (void)
+-{
+-  gid_t gidset[NGID];
+-  int i, n;
+-  union { gid_t gval; long int lval; }  val;
+-
+-  val.lval = -1;
+-  for (i = 0; i < NGID; i++)
+-    gidset[i] = val.gval;
+-  n = getgroups (sizeof (gidset) / MAX (sizeof (int), sizeof (gid_t)) - 1,
+-		 gidset);
+-  /* Exit non-zero if getgroups seems to require an array of ints.  This
+-     happens when gid_t is short int but getgroups modifies an array
+-     of ints.  */
+-  return n > 0 && gidset[n] != val.gval;
+-}]])],
+-	       [ac_cv_type_getgroups=gid_t],
+-	       [ac_cv_type_getgroups=int],
+-	       [ac_cv_type_getgroups=cross])
+-if test $ac_cv_type_getgroups = cross; then
+-  dnl When we can't run the test program (we are cross compiling), presume
+-  dnl that <unistd.h> has either an accurate prototype for getgroups or none.
+-  dnl Old systems without prototypes probably use int.
+-  AC_EGREP_HEADER([getgroups.*int.*gid_t], unistd.h,
+-		  ac_cv_type_getgroups=gid_t, ac_cv_type_getgroups=int)
+-fi])
++AC_CACHE_CHECK([type of array argument to getgroups], ac_cv_type_getgroups,
++[# If AC_TYPE_UID_T says there isn't any gid_t typedef, then we can skip
++# everything below.
++AS_IF([test $ac_cv_type_gid_t = no],
++  [ac_cv_type_getgroups=int],
++  [# Test programs below rely on strict type checking of extern declarations:
++  # 'extern int getgroups(int, int *); extern int getgroups(int, pid_t *);'
++  # is valid in C89 if and only if pid_t is a typedef for int.  Unlike
++  # anything involving either an assignment or a function call, compilers
++  # tend to make this kind of type mismatch a hard error, not just an
++  # "incompatible pointer types" warning.
++  AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
++[AC_INCLUDES_DEFAULT
++[extern int getgroups(int, gid_t *);]],
++[[return !(getgroups(0, 0) >= 0);]])],
++    [ac_getgroups_gidarray=yes],
++    [ac_getgroups_gidarray=no])
++  AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
++[AC_INCLUDES_DEFAULT
++[extern int getgroups(int, int *);]],
++[[return !(getgroups(0, 0) >= 0);]])],
++    [ac_getgroups_intarray=yes],
++    [ac_getgroups_intarray=no])
++
++  AS_CASE([int:$ac_getgroups_intarray,gid:$ac_getgroups_gidarray],
++    [int:yes,gid:no], [ac_cv_type_getgroups=int],
++    [int:no,gid:yes], [ac_cv_type_getgroups=gid_t],
++    [int:yes,gid:yes], [
++      # Both programs compiled - this means *either* that getgroups
++      # was declared with no prototype, in which case we should use int,
++      # or that it was declared prototyped but gid_t is a typedef for int,
++      # in which case we should use gid_t.  Distinguish the two cases
++      # by testing if the compiler catches a blatantly incorrect function
++      # signature for getgroups.
++      AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
++[AC_INCLUDES_DEFAULT
++[extern int getgroups(int, float);]],
++[[return !(getgroups(0, 0) >= 0);]])], [
++        # Compiler did not catch incorrect argument list;
++        # getgroups is unprototyped.
++        ac_cv_type_getgroups=int
++      ], [
++        # Compiler caught incorrect argument list;
++        # gid_t is a typedef for int.
++        ac_cv_type_getgroups=gid_t
++      ])
++    ], [
++      # Both programs failed to compile - this probably means getgroups
++      # wasn't declared at all.  Use 'int', as this is probably a very
++      # old system where the type _would have been_ int.
++      ac_cv_type_getgroups=int
++    ])
++  ])
++])dnl AC_CACHE_CHECK
+ AC_DEFINE_UNQUOTED(GETGROUPS_T, $ac_cv_type_getgroups,
+-		   [Define to the type of elements in the array set by
++		   [Define to the type of elements in the array argument to
+ 		    'getgroups'. Usually this is either 'int' or 'gid_t'.])
+ ])# AC_TYPE_GETGROUPS
+ 
+diff --git a/tests/local.at b/tests/local.at
+index 64a9fb264..db49f84a9 100644
+--- a/tests/local.at
++++ b/tests/local.at
+@@ -401,7 +401,7 @@ if test -f state-env.before && test -f state-env.after; then
+       [interpval|PATH_SEPARATOR],
+       [GFC|F77_DUMMY_MAIN|f77_(case|underscore)],
+       [FC(_DUMMY_MAIN|FLAGS|LIBS|FLAGS_[fF]|_MODEXT|_MODINC|_MODOUT|_DEFINE)?],
+-      [ALLOCA|GETLOADAVG_LIBS|KMEM_GROUP|NEED_SETGID|POW_LIB],
++      [ALLOCA|GETGROUPS_LIB|GETLOADAVG_LIBS|KMEM_GROUP|NEED_SETGID|POW_LIB],
+       [AWK|LEX|LEXLIB|LEX_OUTPUT_ROOT|LN_S|M4|MKDIR_P|AR|RANLIB|SET_MAKE|YACC],
+       [EGREP_TRADITIONAL],
+       [GREP|[EF]GREP|SED],
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0005-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch b/meta/recipes-devtools/autoconf/autoconf/0005-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
new file mode 100644
index 00000000000..f5121b28481
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0005-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
@@ -0,0 +1,83 @@
+From a7dc6d83c7d12b8409c512c3c10ad29f01e6c164 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 21:54:31 -0400
+Subject: [PATCH 5/7] Fold AC_C_STRINGIZE into AC_PROG_CC.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Another of the last few uses of AC_EGREP_CPP is to check for the ISO C
+“stringification” operator.  As this is a feature of C89, let’s fold
+the test into the extensive C89 tests we already have, and make
+AC_C_STRINGIZE just lean on AC_PROG_CC, in the same way
+AC_C_PROTOTYPES does.
+
+* lib/autoconf/c.m4 (_AC_C_C89_TEST_GLOBALS): Add test of preprocessor
+  stringification and token pasting.
+  (AC_C_STRINGIZE): Just check ac_prog_cc_stdc.
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/c.m4 | 31 ++++++++++++++++++++-----------
+ 1 file changed, 20 insertions(+), 11 deletions(-)
+
+diff --git a/lib/autoconf/c.m4 b/lib/autoconf/c.m4
+index 33648b5b9..c8c6a665c 100644
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -1143,6 +1143,21 @@ static char *f (char * (*g) (char **, int), char **p, ...)
+   return s;
+ }
+ 
++/* C89 style stringification. */
++#define noexpand_stringify(a) #a
++const char *stringified = noexpand_stringify(arbitrary+token=sequence);
++
++/* C89 style token pasting.  Exercises some of the corner cases that
++   e.g. old MSVC gets wrong, but not very hard. */
++#define noexpand_concat(a,b) a##b
++#define expand_concat(a,b) noexpand_concat(a,b)
++extern int vA;
++extern int vbee;
++#define aye A
++#define bee B
++int *pvA = &expand_concat(v,aye);
++int *pvbee = &noexpand_concat(v,bee);
++
+ /* OSF 4.0 Compaq cc is some sort of almost-ANSI by default.  It has
+    function prototypes and stuff, but not \xHH hex character constants.
+    These do not provoke an error unfortunately, instead are silently treated
+@@ -2112,16 +2127,10 @@ fi
+ # --------------
+ # Checks if '#' can be used to glue strings together at the CPP level.
+ # Defines HAVE_STRINGIZE if positive.
++# Obsolete - new code should assume C89 compliance.
+ AC_DEFUN([AC_C_STRINGIZE],
+-[AC_CACHE_CHECK([for preprocessor stringizing operator],
+-		[ac_cv_c_stringize],
+-[AC_EGREP_CPP([@%:@teststring],
+-	      [@%:@define x(y) #y
+-
+-char *s = x(teststring);],
+-	      [ac_cv_c_stringize=no],
+-	      [ac_cv_c_stringize=yes])])
+-if test $ac_cv_c_stringize = yes; then
++[AC_REQUIRE([AC_PROG_CC])
++if test "$ac_prog_cc_stdc" != no; then
+   AC_DEFINE(HAVE_STRINGIZE, 1,
+ 	    [Define to 1 if cpp supports the ANSI @%:@ stringizing operator.])
+ fi
+@@ -2130,8 +2139,8 @@ fi
+ 
+ # AC_C_PROTOTYPES
+ # ---------------
+-# Check if the C compiler supports prototypes, included if it needs
+-# options.
++# Check if the C compiler supports prototypes.
++# Obsolete - new code should assume C89 compliance.
+ AC_DEFUN([AC_C_PROTOTYPES],
+ [AC_REQUIRE([AC_PROG_CC])dnl
+ if test "$ac_prog_cc_stdc" != no; then
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0006-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch b/meta/recipes-devtools/autoconf/autoconf/0006-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
new file mode 100644
index 00000000000..6b370267809
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0006-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
@@ -0,0 +1,115 @@
+From e25dfa75e18295d28de67747b4ff9d65f65c4f06 Mon Sep 17 00:00:00 2001
+From: Zack Weinberg <zackw@panix.com>
+Date: Sun, 2 Apr 2023 22:17:55 -0400
+Subject: [PATCH 6/7] Remove the last few internal uses of AC_EGREP_CPP.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Most of the remaining uses were converted to AC_COMPILE_IFELSE.
+The use in AC_FUNC_LOADAVG becomes an AC_PREPROC_IFELSE because
+we can’t be sure getloadavg.c can be _compiled_ at this point in
+the build.  The use in AC_C_VARARRAYS could be either _PREPROC_ or
+_COMPILE_; we use _COMPILE_ because, _PREPROC_ is never used, then
+we don’t have to do the “checking how to run the C preprocessor” test.
+
+* lib/autoconf/c.m4 (AC_C_VARARRAYS): Use AC_COMPILE_IFELSE instead of
+  AC_EGREP_CPP.
+* lib/autoconf/headers.m4 (_AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H)
+  (_AC_HEADER_TIOCGWINSZ_IN_SYS_IOCTL_H): Likewise.
+* lib/autoconf/functions.m4 (AC_FUNC_GETLOADAVG): Use AC_PREPROC_IFELSE
+  instead of AC_EGREP_CPP.
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/c.m4         |  8 ++++----
+ lib/autoconf/functions.m4 | 10 +++++-----
+ lib/autoconf/headers.m4   | 24 ++++++++++--------------
+ 3 files changed, 19 insertions(+), 23 deletions(-)
+
+diff --git a/lib/autoconf/c.m4 b/lib/autoconf/c.m4
+index c8c6a665c..b8350c339 100644
+--- a/lib/autoconf/c.m4
++++ b/lib/autoconf/c.m4
+@@ -2197,11 +2197,11 @@ AC_DEFUN([AC_C_VARARRAYS],
+ [
+   AC_CACHE_CHECK([for variable-length arrays],
+     ac_cv_c_vararrays,
+-    [AC_EGREP_CPP([defined],
+-       [#ifdef __STDC_NO_VLA__
+-	defined
++    [AC_COMPILE_IFELSE([AC_LANG_SOURCE(
++[[	#ifndef __STDC_NO_VLA__
++	#error __STDC_NO_VLA__ not defined
+ 	#endif
+-       ],
++]])],
+        [ac_cv_c_vararrays='no: __STDC_NO_VLA__ is defined'],
+        [AC_COMPILE_IFELSE(
+ 	  [AC_LANG_PROGRAM(
+diff --git a/lib/autoconf/functions.m4 b/lib/autoconf/functions.m4
+index 74512e97d..499e4c024 100644
+--- a/lib/autoconf/functions.m4
++++ b/lib/autoconf/functions.m4
+@@ -842,11 +842,11 @@ AC_CHECK_FUNCS(getloadavg, [],
+ # Some definitions of getloadavg require that the program be installed setgid.
+ AC_CACHE_CHECK(whether getloadavg requires setgid,
+ 	       ac_cv_func_getloadavg_setgid,
+-[AC_EGREP_CPP([Yowza Am I SETGID yet],
+-[#include "$srcdir/$ac_config_libobj_dir/getloadavg.c"
+-#ifdef LDAV_PRIVILEGED
+-Yowza Am I SETGID yet
+-@%:@endif],
++[AC_PREPROC_IFELSE([AC_LANG_SOURCE(
++[[#include "$srcdir/$ac_config_libobj_dir/getloadavg.c"
++#ifndef LDAV_PRIVILEGED
++#error setgid not needed
++@%:@endif]])],
+ 	      ac_cv_func_getloadavg_setgid=yes,
+ 	      ac_cv_func_getloadavg_setgid=no)])
+ if test $ac_cv_func_getloadavg_setgid = yes; then
+diff --git a/lib/autoconf/headers.m4 b/lib/autoconf/headers.m4
+index 7f70e8fd4..19c124cc3 100644
+--- a/lib/autoconf/headers.m4
++++ b/lib/autoconf/headers.m4
+@@ -721,13 +721,11 @@ you to include it and time.h simultaneously.])
+ m4_define([_AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H],
+ [AC_CACHE_CHECK([whether termios.h defines TIOCGWINSZ],
+ 		ac_cv_sys_tiocgwinsz_in_termios_h,
+-[AC_EGREP_CPP([yes],
+-	      [#include <sys/types.h>
+-#include <termios.h>
+-#ifdef TIOCGWINSZ
+-  yes
+-#endif
+-],
++[AC_COMPILE_IFELSE([AC_LANG_SOURCE(
++[AC_INCLUDES_DEFAULT
++[#include <termios.h>
++const int tiocgwinsz = TIOCGWINSZ;
++]])],
+ 		ac_cv_sys_tiocgwinsz_in_termios_h=yes,
+ 		ac_cv_sys_tiocgwinsz_in_termios_h=no)])
+ ])# _AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H
+@@ -738,13 +736,11 @@ m4_define([_AC_HEADER_TIOCGWINSZ_IN_TERMIOS_H],
+ m4_define([_AC_HEADER_TIOCGWINSZ_IN_SYS_IOCTL],
+ [AC_CACHE_CHECK([whether sys/ioctl.h defines TIOCGWINSZ],
+ 		ac_cv_sys_tiocgwinsz_in_sys_ioctl_h,
+-[AC_EGREP_CPP([yes],
+-	      [#include <sys/types.h>
+-#include <sys/ioctl.h>
+-#ifdef TIOCGWINSZ
+-  yes
+-#endif
+-],
++[AC_COMPILE_IFELSE([AC_LANG_SOURCE(
++[AC_INCLUDES_DEFAULT
++[#include <sys/ioctl.h>
++const int tiocgwinsz = TIOCGWINSZ;
++]])],
+ 		ac_cv_sys_tiocgwinsz_in_sys_ioctl_h=yes,
+ 		ac_cv_sys_tiocgwinsz_in_sys_ioctl_h=no)])
+ ])# _AC_HEADER_TIOCGWINSZ_IN_SYS_IOCTL
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0007-Support-circa-early-2022-Gnulib.patch b/meta/recipes-devtools/autoconf/autoconf/0007-Support-circa-early-2022-Gnulib.patch
new file mode 100644
index 00000000000..8d6dfc51eb5
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0007-Support-circa-early-2022-Gnulib.patch
@@ -0,0 +1,31 @@
+From 1982523c6f052a2b361035a9d5d9737510ed0738 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 3 Apr 2023 09:12:40 -0700
+Subject: [PATCH 7/7] Support circa early 2022 Gnulib
+
+Problem reported by Frederic Berat in:
+https://lists.gnu.org/r/bug-rcs/2023-04/msg00001.html
+* lib/autoconf/specific.m4 (_AC_SYS_LARGEFILE_TEST_INCLUDES):
+Bring back for compatibility with post-2.71, pre-2.73 Gnulib.
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/specific.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/autoconf/specific.m4 b/lib/autoconf/specific.m4
+index a2dc5d488..5dc006959 100644
+--- a/lib/autoconf/specific.m4
++++ b/lib/autoconf/specific.m4
+@@ -277,6 +277,8 @@ m4_define([_AC_SYS_LARGEFILE_TEST_CODE],
+ 		       && LARGE_OFF_T % 2147483647 == 1)
+ 		      ? 1 : -1]];[]dnl
+ ])
++# Defined by Autoconf 2.71 and circa 2022 Gnulib unwisely depended on it.
++m4_define([_AC_SYS_LARGEFILE_TEST_INCLUDES], [_AC_SYS_LARGEFILE_TEST_CODE])
+ 
+ # _AC_SYS_LARGEFILE_OPTIONS
+ # -------------------------
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf/0007-Support-underquoted-callers-better.patch b/meta/recipes-devtools/autoconf/autoconf/0007-Support-underquoted-callers-better.patch
new file mode 100644
index 00000000000..7648a0b2617
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0007-Support-underquoted-callers-better.patch
@@ -0,0 +1,55 @@
+From 794182506c3c5814d48b2fc4d832770f608ce0ef Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Sat, 1 Apr 2023 20:25:13 -0700
+Subject: [PATCH 7/7] Support underquoted callers better
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported bh Khem Raj for mcpp 2.7.2 (2008) in:
+https://lists.gnu.org/r/autoconf/2023-04/msg00001.html
+* lib/autoconf/programs.m4 (_AC_PATH_PROG_FLAVOR_GNU):
+Add two ‘@%:@(’s to cater to underquoted callers.
+* lib/m4sugar/m4sh.m4 (_AS_PATH_WALK): Use quadrigraph instead of
+‘#’, for underquoted callers.
+Upstream-Status: Inappropriate [oe specific]
+---
+ lib/autoconf/programs.m4 | 5 +++--
+ lib/m4sugar/m4sh.m4      | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/autoconf/programs.m4 b/lib/autoconf/programs.m4
+index 62ba6b8b..d06d18c4 100644
+--- a/lib/autoconf/programs.m4
++++ b/lib/autoconf/programs.m4
+@@ -543,11 +543,12 @@ dnl   # for best performing tool in a list breaks down.
+ # ----------------------------------------------------------------
+ m4_define([_AC_PATH_PROG_FLAVOR_GNU],
+ [# Check for GNU $1
+-case `"$1" --version 2>&1` in
++case `"$1" --version 2>&1` in @%:@(
+ *GNU*)
+   $2;;
+ m4_ifval([$3],
+-[*)
++[@%:@(
++*)
+   $3;;
+ ])esac
+ ])# _AC_PATH_PROG_FLAVOR_GNU
+diff --git a/lib/m4sugar/m4sh.m4 b/lib/m4sugar/m4sh.m4
+index ab5ca7db..368487fa 100644
+--- a/lib/m4sugar/m4sh.m4
++++ b/lib/m4sugar/m4sh.m4
+@@ -1389,7 +1389,7 @@ m4_if([$1], m4_translit([[$1]], [:;]),
+ for as_dir in $as_dummy])
+ do
+   IFS=$as_save_IFS
+-  case $as_dir in #(((
++  case $as_dir in @%:@(((
+     '') as_dir=./ ;;
+     */) ;;
+     *) as_dir=$as_dir/ ;;
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72c.bb b/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
index fe9779e4ddb..dba9f1eeefb 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
@@ -19,6 +19,15 @@ SRC_URI = " \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
            file://man-host-perl.patch \
+           file://0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch \
+           file://0007-Support-underquoted-callers-better.patch \
+           file://0001-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch \
+           file://0002-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch \
+           file://0003-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch \
+           file://0004-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch \
+           file://0005-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch \
+           file://0006-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch \
+           file://0007-Support-circa-early-2022-Gnulib.patch \
            "
 SRC_URI:append:class-native = " file://no-man.patch"
 
-- 
2.41.0


