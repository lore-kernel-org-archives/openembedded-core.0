Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2537210FC446
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:34:37 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117523.1775684074024267742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B/9lOkH9;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c1a170a50so67040c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775684073; x=1776288873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UynboO++5ZlMQd6Vr/dwL4tAh2JLdcEi3s12dw4Muvs=;
        b=B/9lOkH99oLMud8GII/Bp6l/e7un2uYvzejtnVuG4Y1W0qZRFh6nR//i6ertwWD8jp
         l0fQrNGV1WWJoVRZkoy/m05rNi9l/7GEK8hTGpNHO6uyv9CAV0JjxF0rCiXsbeL7Bj+c
         LP2mcexVNsTUzOmSGjUtK2JRt80Eqb5ofIY42XuSflGcTv3XxcODYxNlcGFqxU9aODsd
         fNdFdFOZWbUI2gFnrkLNBhchlTgBRQ0wiIMLfTrsZtrm5hqIDlCH0MAZ6nElnF5mNNx7
         pJ8ET5Ve1l6tFmRAQoVAG41M7wKsPjd5rYH66FgHS3NzWiZcF2NW5gPH6jwZ3zLf/sca
         z+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775684073; x=1776288873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UynboO++5ZlMQd6Vr/dwL4tAh2JLdcEi3s12dw4Muvs=;
        b=rJ/eMzFWiIIa78jCXUFsGMye/Uts3RzXBv18PZcNWD3SM7jqi9FtUl7tFfnuPOlflX
         86UlVWKjAz6hjiV2BjwNRyz5/OF9pO+WblYwLtUQs3q+8V+Eaqp5rj0XpdJzA5EKYqSe
         goT0MW+xjBjd18GYrI4rhHvWEtPTCHBnnR7DzJKE+IiMY+Tzo75k6byFCntm12rsC9r9
         wsxihpETKGICushaTSUZ3KHRG+rVtC6ZiWexBcFMtixDADfrDQzsiNebIL7BoVeQ3tC8
         DTt1sA/yKdg1Ly0MYmu5HSVZmIM3vGUSQNvtDPQZjFdnKlpCih1ygDg26iPiDKB1jA77
         krXg==
X-Gm-Message-State: AOJu0YyOmVJJZBVgFOFdlurpXyAZ2Gz31fnR877ALxl7vb0/gw/Qrd+F
	h2YfIKJavbPCgAl2Q/jr5No4gcm9cOZ5FWdY3glg3bgauQOQXMnn2pybiGD59SYf
X-Gm-Gg: AeBDieuuyXHiXWpi9/DThSiwJ3FiwE8egdQMOHSGKmMiNJzPEQg7VbNa/BILRTLx3oK
	7136EemcUD7N1lKdGVdQa1L1TBnC/meh6hhlguc3dxtSLoLnc820jdUNKmPaj5sMvy20wx2zxVq
	hYSSYWkMHdRzt4jvu2nq3p/Ld/e9tR6tuiide7THIjTBtk3x2tn726K4h2vNgBUWunk7YlabWRu
	lZx5fy/F3Z15hEnTs13cYvgZ3lLj1N6HWqGtHSmvwA+YCDm7/NGGGNwKvongxBFoV3kYbZVpZ9A
	w0i7pmVRNMT9+SRgQd0PSQJHOONTDC1IdNw0wvGvhoQSx2nwI250ouQ1uZU/XOeOHE8pyWcxqHH
	MvU/pKH5B9X5dG6hLmsXbczkKQdcq1q8mmZTIp9143Vgb4kzHGITddewj82/W6518zRCtqJ4/aI
	XzJ3TFTnOA2yCTxrzAFmm0uzHqpEsu9olkDHqaHHmdmTK+zjR/WFrJmxIFXkgwT1AdYeYKFlBn/
	PLdnEYxdD9F68L9lxHhFfmw27aNRxzQJNmVihfcbEtIDMmRJsk8TNXOHuqa
X-Received: by 2002:a05:7022:eacb:b0:12a:6c4b:9cf0 with SMTP id a92af1059eb24-12bfb6ec4d5mr10642299c88.3.1775684072846;
        Wed, 08 Apr 2026 14:34:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd8ff27sm20399246c88.7.2026.04.08.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:34:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2] time: Use upstream applied patches
Date: Wed,  8 Apr 2026 14:34:27 -0700
Message-ID: <20260408213429.1492328-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234860

time project now has a maintainer and has taken bunch of
patches submitted over years, backport the needed ones for
compiling with GCC-15 and Clang.

Current patchset was not adequate for clang and moreover
the applied patches are slightly different than what we are
carrying

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Reflect correct upstream status for 0001-include-string.h-for-memset.patch

 .../0001-Fix-the-type-for-sighandler_t.patch  |  27 ----
 .../0001-include-string.h-for-memset.patch    |  12 +-
 .../0002-maint-remove-K-R-declarations.patch  | 131 ++++++++++++++++++
 ...t-fix-compilation-errors-with-GCC-15.patch |  65 +++++++++
 ...aint-remove-obsolete-autoconf-macros.patch |  43 ++++++
 .../time-1.9-Fix-compiling-with-GCC15.patch   |  33 -----
 meta/recipes-extended/time/time_1.9.bb        |   5 +-
 7 files changed, 249 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
 create mode 100644 meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch
 create mode 100644 meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch
 create mode 100644 meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch
 delete mode 100644 meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch

diff --git a/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch b/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
deleted file mode 100644
index 0f8bf6e03e..0000000000
--- a/meta/recipes-extended/time/time/0001-Fix-the-type-for-sighandler_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From cfef684e2c2c93c4a871d6c2a7af8f4c1b7c6741 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Mar 2025 09:29:58 -0700
-Subject: [PATCH] Fix the type for sighandler_t
-
-__sighandler_t is private interface in glibc so its
-better to not use it, as an aside fixes build with musl
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-03/msg00000.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/time.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/time.c b/src/time.c
-index 7ff29a4..82eb66a 100644
---- a/src/time.c
-+++ b/src/time.c
-@@ -728,7 +728,7 @@ run_command (cmd, resp)
-      RESUSE *resp;
- {
-   pid_t pid;			/* Pid of child.  */
--  __sighandler_t interrupt_signal, quit_signal;
-+  sighandler_t interrupt_signal, quit_signal;
-   int saved_errno;
-
-   resuse_start (resp);
diff --git a/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch b/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
index f6ea212667..a7ab8dc624 100644
--- a/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
+++ b/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
@@ -1,13 +1,15 @@
-From c8deae54f92d636878097063b411af9fb5262ad3 Mon Sep 17 00:00:00 2001
+From ebc3368161ee909d5f854af8928e7937e35da41f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 15 Aug 2022 07:24:24 -0700
-Subject: [PATCH] include string.h for memset()
+Subject: [PATCH 1/4] include string.h for memset()

 Fixes implicit function declaration warning e.g.

 resuse.c:103:3: error: call to undeclared library function 'memset' with type 'void *(void *, int, unsigned long)'

-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2022-08/msg00001.html]
+Drop this patch when upgrading to 1.10+ future releases
+
+Upstream-Status: Inappropriate [Upstream has dropped using memset in reuse.c]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/resuse.c | 1 +
@@ -18,8 +20,8 @@ index cf5a08c..9d3d18a 100644
 --- a/src/resuse.c
 +++ b/src/resuse.c
 @@ -22,6 +22,7 @@
- */
-
+ */
+
  #include "config.h"
 +#include <string.h>
  #include <sys/time.h>
diff --git a/meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch b/meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch
new file mode 100644
index 0000000000..cfa2b0f63b
--- /dev/null
+++ b/meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch
@@ -0,0 +1,131 @@
+From b4a9f76b5f30bda67a57a2c6df6221f95ed80b9b Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Mon, 12 Jan 2026 20:19:34 -0800
+Subject: [PATCH 2/4] maint: remove K&R declarations
+
+* src/resuse.c (resuse_start, resuse_end): Remove K&R declarations.
+* src/time.c (fprintargv, linear_argv, summarize, getargs)
+(main): Likewise.
+(run_command): Likewise. Avoid -Wincompatible-pointer-types.
+
+Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=time.git;a=commit;h=4eb6d87fc18929d75a444fbb05a2c4ec7fb052ba]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/resuse.c | 10 +---------
+ src/time.c   | 30 +++++++-----------------------
+ 2 files changed, 8 insertions(+), 32 deletions(-)
+
+diff --git a/src/resuse.c b/src/resuse.c
+index 9d3d18a..5ba3057 100644
+--- a/src/resuse.c
++++ b/src/resuse.c
+@@ -48,8 +48,7 @@
+ /* Prepare to measure a child process.  */
+
+ void
+-resuse_start (resp)
+-     RESUSE *resp;
++resuse_start (RESUSE *resp)
+ {
+ #if HAVE_WAIT3
+   gettimeofday (&resp->start, (struct timezone *) 0);
+@@ -66,16 +65,9 @@ resuse_start (resp)
+ /* Wait for and fill in data on child process PID.
+    Return 0 on error, 1 if ok.  */
+
+-#if __STDC__
+ /* pid_t is short on BSDI, so don't try to promote it.  */
+ int
+ resuse_end (pid_t pid, RESUSE *resp)
+-#else
+-int
+-resuse_end (pid, resp)
+-     pid_t pid;
+-     RESUSE *resp;
+-#endif
+ {
+   int status;
+
+diff --git a/src/time.c b/src/time.c
+index 7e07995..4438749 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -315,10 +315,7 @@ for details about the options it supports.\n",
+ /* Print ARGV to FP, with each entry in ARGV separated by FILLER.  */
+
+ static void
+-fprintargv (fp, argv, filler)
+-     FILE *fp;
+-     const char *const *argv;
+-     const char *filler;
++fprintargv (FILE *fp, const char *const *argv, const char *filler)
+ {
+   const char *const *av;
+
+@@ -341,8 +338,7 @@ fprintargv (fp, argv, filler)
+    Print a message and return NULL if memory allocation failed.  */
+
+ static char *
+-linear_argv (argv)
+-     const char *const *argv;
++linear_argv (const char *const *argv)
+ {
+   const char *const *s;		/* Each string in ARGV.  */
+   char *new;			/* Allocated space.  */
+@@ -421,11 +417,7 @@ linear_argv (argv)
+    RESP is resource information on the command.  */
+
+ static void
+-summarize (fp, fmt, command, resp)
+-     FILE *fp;
+-     const char *fmt;
+-     const char **command;
+-     RESUSE *resp;
++summarize (FILE *fp, const char *fmt, const char **command, RESUSE *resp)
+ {
+   unsigned long r;		/* Elapsed real milliseconds.  */
+   unsigned long v;		/* Elapsed virtual (CPU) milliseconds.  */
+@@ -637,9 +629,7 @@ summarize (fp, fmt, command, resp)
+    Return the command line to run and gather statistics on.  */
+
+ static const char **
+-getargs (argc, argv)
+-     int argc;
+-     char **argv;
++getargs (int argc, char **argv)
+ {
+   int optc;
+   char *format;			/* Format found in environment.  */
+@@ -723,9 +713,7 @@ getargs (argc, argv)
+    Put the statistics in *RESP.  */
+
+ static void
+-run_command (cmd, resp)
+-     char *const *cmd;
+-     RESUSE *resp;
++run_command (const char **cmd, RESUSE *resp)
+ {
+   pid_t pid;			/* Pid of child.  */
+   sighandler interrupt_signal, quit_signal;
+@@ -738,9 +726,7 @@ run_command (cmd, resp)
+     error (EXIT_CANCELED, errno, "cannot fork");
+   else if (pid == 0)
+     {				/* If child.  */
+-      /* Don't cast execvp arguments; that causes errors on some systems,
+-	 versus merely warnings if the cast is left off.  */
+-      execvp (cmd[0], cmd);
++      execvp (cmd[0], (char * const *) cmd);
+       saved_errno = errno;
+       error (0, errno, "cannot run %s", cmd[0]);
+       _exit (saved_errno == ENOENT ? EXIT_ENOENT : EXIT_CANNOT_INVOKE);
+@@ -759,9 +745,7 @@ run_command (cmd, resp)
+ }
+
+ int
+-main (argc, argv)
+-     int argc;
+-     char **argv;
++main (int argc, char **argv)
+ {
+   const char **command_line;
+   RESUSE res;
diff --git a/meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch b/meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch
new file mode 100644
index 0000000000..ef78002468
--- /dev/null
+++ b/meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch
@@ -0,0 +1,65 @@
+From f178a9cf1ff71bbf1054ad85588b1b7a313ee584 Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Mon, 12 Jan 2026 20:42:21 -0800
+Subject: [PATCH 3/4] maint: fix compilation errors with GCC 15
+
+GCC 15 changed the default to -std=gnu23 where the current code would
+cause -Wincompatible-pointer-types errors.
+
+Reported by Ondrej Pohorelsky <opohorel@redhat.com> in
+<https://lists.gnu.org/r/bug-time/2025-01/msg00000.html>
+and by Khem Raj <raj.khem@gmail.com> in
+<https://lists.gnu.org/r/bug-time/2025-03/msg00000.html>
+and by Marcin Serwin <marcin@serwin.dev> in
+<https://lists.gnu.org/r/bug-time/2025-10/msg00000.html>
+and by Sam James <sam@gentoo.org> in
+<https://savannah.gnu.org/bugs/?66450>.
+
+* configure.ac (AC_TYPE_SIGNAL): Remove obsolete macro.
+* src/time.c (sighandler): Remove type.
+(run_command): Use sighandler_t which is defined by glibc or provided by
+Gnulib.
+
+Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=time.git;a=commit;h=4bfc492fcfa7778df7fc473ee901c1bdfdb02de0]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac | 1 -
+ src/time.c   | 6 +-----
+ 2 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ede8fd5..beb2077 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,7 +66,6 @@ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+ AC_TYPE_PID_T
+ AC_TYPE_SIZE_T
+-AC_TYPE_SIGNAL
+
+ dnl Checks for library functions.
+ AC_FUNC_VPRINTF
+diff --git a/src/time.c b/src/time.c
+index 4438749..b8309a0 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -74,10 +74,6 @@ enum
+     "David MacKenzie",              \
+     "Assaf Gordon"
+
+-
+-/* A Pointer to a signal handler.  */
+-typedef RETSIGTYPE (*sighandler) ();
+-
+ /* msec = milliseconds = 1/1,000 (1*10e-3) second.
+    usec = microseconds = 1/1,000,000 (1*10e-6) second.  */
+
+@@ -716,7 +712,7 @@ static void
+ run_command (const char **cmd, RESUSE *resp)
+ {
+   pid_t pid;			/* Pid of child.  */
+-  sighandler interrupt_signal, quit_signal;
++  sighandler_t interrupt_signal, quit_signal;
+   int saved_errno;
+
+   resuse_start (resp);
diff --git a/meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch b/meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch
new file mode 100644
index 0000000000..4a49d79753
--- /dev/null
+++ b/meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch
@@ -0,0 +1,43 @@
+From 0b860a81d54b1d44823bd0b5ce3a817594fb388f Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Mon, 12 Jan 2026 21:06:53 -0800
+Subject: [PATCH 4/4] maint: remove obsolete autoconf macros
+
+* configure.ac (AC_PROG_CC): Call instead of AC_PROG_CC_STDC and
+AC_PROG_GCC_TRADITIONAL.
+(AC_CHECK_INCLUDES_DEFAULT, AC_PROG_EGREP): Use instead of
+AC_HEADER_STDC.
+
+Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=time.git;a=commit;h=d957319127352cc67de4de5fd5d1537f289c0a84]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index beb2077..1af59c2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,10 +27,9 @@ AM_INIT_AUTOMAKE([
+
+ dnl Checks for programs.
+ AC_USE_SYSTEM_EXTENSIONS
+-AC_PROG_CC_STDC
++AC_PROG_CC
+ AM_PROG_CC_C_O
+ AC_PROG_CPP
+-AC_PROG_GCC_TRADITIONAL
+ AC_PROG_INSTALL
+ AC_C_INLINE
+
+@@ -59,7 +58,9 @@ gl_WARN_ADD([-Wsuggest-attribute=pure])
+ AC_SUBST([WARN_CFLAGS])
+
+ dnl Checks for header files.
+-AC_HEADER_STDC
++AC_CHECK_INCLUDES_DEFAULT
++AC_PROG_EGREP
++
+ AC_HEADER_SYS_WAIT
+
+ dnl Checks for typedefs, structures, and compiler characteristics.
diff --git a/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch b/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
deleted file mode 100644
index 76141aec18..0000000000
--- a/meta/recipes-extended/time/time/time-1.9-Fix-compiling-with-GCC15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 831194f0be7733c99c7a2c69d9e9695b82e05010 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ond=C5=99ej=20Poho=C5=99elsk=C3=BD?= <opohorel@redhat.com>
-Date: Thu, 30 Jan 2025 08:48:47 +0100
-Subject: [PATCH] time: fix compiling with GCC15
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-GCC15 complains about incompatible pointer type in run_command()
-Initialize interrupt_signal and quit_signal with correct type
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-time/2025-01/msg00000.html]
-Signed-off-by: Ondřej Pohořelský <opohorel@redhat.com>
----
- src/time.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/time.c b/src/time.c
-index 7b401bc..c8d7ab0 100644
---- a/src/time.c
-+++ b/src/time.c
-@@ -803,7 +803,7 @@ run_command (cmd, resp)
-      RESUSE *resp;
- {
-   pid_t pid;			/* Pid of child.  */
--  sighandler interrupt_signal, quit_signal;
-+  __sighandler_t interrupt_signal, quit_signal;
-   int saved_errno;
-
-   resuse_start (resp);
---
-2.48.1
-
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index d6d8aa6e1e..9436a83cca 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -15,8 +15,9 @@ BBCLASSEXTEND = "native nativesdk"

 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
            file://0001-include-string.h-for-memset.patch \
-           file://time-1.9-Fix-compiling-with-GCC15.patch \
-           file://0001-Fix-the-type-for-sighandler_t.patch \
+           file://0002-maint-remove-K-R-declarations.patch \
+           file://0003-maint-fix-compilation-errors-with-GCC-15.patch \
+           file://0004-maint-remove-obsolete-autoconf-macros.patch \
            "

 SRC_URI[sha256sum] = "fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e"

