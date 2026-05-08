Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37024CD37AD
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:45:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15393.1778251504781209618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gI1ZWKd4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9588382931=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648B4eeX470902
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 14:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=i/jfRsmwL3EiaUpHVRj6Pcp0Qsfe53vpZ69JAjQor+8=; b=gI1ZWKd4rT+s
	DfRhG+vf9y7VoPi5KEfIL/XfOgVenY5xSTmjece6Ik/mTfgP+0tCE+uyGV6oZwNQ
	HPrlx4u6KfNK/G0MqYufjwuzw0CHrnbcDSxqkfQpT6kGbZycgFuMreQSWo32z1Zt
	oJFY+ccrxg5OTlRHdFFvQ+sFcQCTTQ1ErNY+a1XhN6l9nJdF/ofG7nHQxT9Z4nn7
	t2snLhytdQQBlOwmSwmeM7wBO7bYuIj4uDtH9oLVFg2CiaEOISTvFNgbl8TSH0Ft
	mdUa8cwYvLYeJ0kFeHV+cDuAxCH7LuP/8K6B7ZwYsf0VukM+MJCEUlB8SEGskUbk
	XsSZHvvOQQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1cbvrc3v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:45:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 8 May 2026 07:45:01 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 8 May 2026 07:45:01 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] time: 1.9 -> 1.10
Date: Fri, 8 May 2026 07:44:59 -0700
Message-ID: <9794ad872630866ca298282a25bc5722c001522d.1778251103.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1778251103.git.liezhi.yang@windriver.com>
References: <cover.1778251103.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: poynhhn10S3YjNOjuh3SZoFUJidOOdGh
X-Proofpoint-GUID: poynhhn10S3YjNOjuh3SZoFUJidOOdGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MCBTYWx0ZWRfX7joSHY0bcRv2
 iUpbL40wloWRAy6V9j6cLIQjZuN/rwJ6C0YDF3u7EyNT6+KCLdJ4sofXZYW2Ao4K+TYN2ny3dh0
 XW2S1yUHdSSO4oEQvxqcTp5SBpThTEIVfq52iWHFWYi0vD0SBMng6NiqytyWpf47HBz4a70nH0/
 ZRjqYMSC479dly8vvb24H9FosAUtvLbFKtFYGQnEPObTrto4tGlpY3X6dot3nV2U42tUajey/ue
 nPd/fmjvQ5iNJXmqUTz397TXM5igN0P8kHQCSFATAwxOb9XpkGNoFE+XOnI20ifHfyiQH6VZTfL
 7KJZQpjiXResZv4uqp2E21jtX+vewApSzzmw+3vZN/cuoZCj9H50gp51hIOHvrA68oZrNa1C6du
 iQLEUeB1ec/oyFZ/9/1z8net6zGo0ozoqIodpmlf5VHTMkpAjZpPbkK7rysM0Vdm2SlTq+EpV9a
 R4Lf7XXlichdIQlatYw==
X-Authority-Analysis: v=2.4 cv=U9iiy+ru c=1 sm=1 tr=0 ts=69fdf6ef cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=7mOBRU54AAAA:8 a=7VCH-C7_lETss_BExYoA:9
 a=3A4WKLa3fEv9RwDY:21 a=FdTzh2GWekK77mhwV6Dw:22 a=wa9RWnbW_A1YIeRBVszw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236720

From: Robert Yang <liezhi.yang@windriver.com>

* Remove uneed patch, the src/resuse.c has been removed in 1.10:
  0001-include-string.h-for-memset.patch

* Remove backported patches:
  0002-maint-remove-K-R-declarations.patch
  0003-maint-fix-compilation-errors-with-GCC-15.patch
  0004-maint-remove-obsolete-autoconf-macros.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-include-string.h-for-memset.patch    |  27 ----
 .../0002-maint-remove-K-R-declarations.patch  | 131 ------------------
 ...t-fix-compilation-errors-with-GCC-15.patch |  65 ---------
 ...aint-remove-obsolete-autoconf-macros.patch |  43 ------
 .../time/{time_1.9.bb => time_1.10.bb}        |   9 +-
 5 files changed, 2 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
 delete mode 100644 meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch
 delete mode 100644 meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch
 delete mode 100644 meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch
 rename meta/recipes-extended/time/{time_1.9.bb => time_1.10.bb} (61%)

diff --git a/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch b/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
deleted file mode 100644
index 1258a0d5eb..0000000000
--- a/meta/recipes-extended/time/time/0001-include-string.h-for-memset.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ebc3368161ee909d5f854af8928e7937e35da41f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 15 Aug 2022 07:24:24 -0700
-Subject: [PATCH 1/4] include string.h for memset()
-
-Fixes implicit function declaration warning e.g.
-
-resuse.c:103:3: error: call to undeclared library function 'memset' with type 'void *(void *, int, unsigned long)'
-
-Drop this patch when upgrading to 1.10+ future releases
-
-Upstream-Status: Inappropriate [Upstream has dropped using memset in reuse.c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/resuse.c | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/resuse.c
-+++ b/src/resuse.c
-@@ -22,6 +22,7 @@
- */ 
- 
- #include "config.h"
-+#include <string.h>
- #include <sys/time.h>
- #include <sys/wait.h>
- #include <sys/resource.h>
diff --git a/meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch b/meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch
deleted file mode 100644
index cfa2b0f63b..0000000000
--- a/meta/recipes-extended/time/time/0002-maint-remove-K-R-declarations.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From b4a9f76b5f30bda67a57a2c6df6221f95ed80b9b Mon Sep 17 00:00:00 2001
-From: Collin Funk <collin.funk1@gmail.com>
-Date: Mon, 12 Jan 2026 20:19:34 -0800
-Subject: [PATCH 2/4] maint: remove K&R declarations
-
-* src/resuse.c (resuse_start, resuse_end): Remove K&R declarations.
-* src/time.c (fprintargv, linear_argv, summarize, getargs)
-(main): Likewise.
-(run_command): Likewise. Avoid -Wincompatible-pointer-types.
-
-Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=time.git;a=commit;h=4eb6d87fc18929d75a444fbb05a2c4ec7fb052ba]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/resuse.c | 10 +---------
- src/time.c   | 30 +++++++-----------------------
- 2 files changed, 8 insertions(+), 32 deletions(-)
-
-diff --git a/src/resuse.c b/src/resuse.c
-index 9d3d18a..5ba3057 100644
---- a/src/resuse.c
-+++ b/src/resuse.c
-@@ -48,8 +48,7 @@
- /* Prepare to measure a child process.  */
-
- void
--resuse_start (resp)
--     RESUSE *resp;
-+resuse_start (RESUSE *resp)
- {
- #if HAVE_WAIT3
-   gettimeofday (&resp->start, (struct timezone *) 0);
-@@ -66,16 +65,9 @@ resuse_start (resp)
- /* Wait for and fill in data on child process PID.
-    Return 0 on error, 1 if ok.  */
-
--#if __STDC__
- /* pid_t is short on BSDI, so don't try to promote it.  */
- int
- resuse_end (pid_t pid, RESUSE *resp)
--#else
--int
--resuse_end (pid, resp)
--     pid_t pid;
--     RESUSE *resp;
--#endif
- {
-   int status;
-
-diff --git a/src/time.c b/src/time.c
-index 7e07995..4438749 100644
---- a/src/time.c
-+++ b/src/time.c
-@@ -315,10 +315,7 @@ for details about the options it supports.\n",
- /* Print ARGV to FP, with each entry in ARGV separated by FILLER.  */
-
- static void
--fprintargv (fp, argv, filler)
--     FILE *fp;
--     const char *const *argv;
--     const char *filler;
-+fprintargv (FILE *fp, const char *const *argv, const char *filler)
- {
-   const char *const *av;
-
-@@ -341,8 +338,7 @@ fprintargv (fp, argv, filler)
-    Print a message and return NULL if memory allocation failed.  */
-
- static char *
--linear_argv (argv)
--     const char *const *argv;
-+linear_argv (const char *const *argv)
- {
-   const char *const *s;		/* Each string in ARGV.  */
-   char *new;			/* Allocated space.  */
-@@ -421,11 +417,7 @@ linear_argv (argv)
-    RESP is resource information on the command.  */
-
- static void
--summarize (fp, fmt, command, resp)
--     FILE *fp;
--     const char *fmt;
--     const char **command;
--     RESUSE *resp;
-+summarize (FILE *fp, const char *fmt, const char **command, RESUSE *resp)
- {
-   unsigned long r;		/* Elapsed real milliseconds.  */
-   unsigned long v;		/* Elapsed virtual (CPU) milliseconds.  */
-@@ -637,9 +629,7 @@ summarize (fp, fmt, command, resp)
-    Return the command line to run and gather statistics on.  */
-
- static const char **
--getargs (argc, argv)
--     int argc;
--     char **argv;
-+getargs (int argc, char **argv)
- {
-   int optc;
-   char *format;			/* Format found in environment.  */
-@@ -723,9 +713,7 @@ getargs (argc, argv)
-    Put the statistics in *RESP.  */
-
- static void
--run_command (cmd, resp)
--     char *const *cmd;
--     RESUSE *resp;
-+run_command (const char **cmd, RESUSE *resp)
- {
-   pid_t pid;			/* Pid of child.  */
-   sighandler interrupt_signal, quit_signal;
-@@ -738,9 +726,7 @@ run_command (cmd, resp)
-     error (EXIT_CANCELED, errno, "cannot fork");
-   else if (pid == 0)
-     {				/* If child.  */
--      /* Don't cast execvp arguments; that causes errors on some systems,
--	 versus merely warnings if the cast is left off.  */
--      execvp (cmd[0], cmd);
-+      execvp (cmd[0], (char * const *) cmd);
-       saved_errno = errno;
-       error (0, errno, "cannot run %s", cmd[0]);
-       _exit (saved_errno == ENOENT ? EXIT_ENOENT : EXIT_CANNOT_INVOKE);
-@@ -759,9 +745,7 @@ run_command (cmd, resp)
- }
-
- int
--main (argc, argv)
--     int argc;
--     char **argv;
-+main (int argc, char **argv)
- {
-   const char **command_line;
-   RESUSE res;
diff --git a/meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch b/meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch
deleted file mode 100644
index ef78002468..0000000000
--- a/meta/recipes-extended/time/time/0003-maint-fix-compilation-errors-with-GCC-15.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From f178a9cf1ff71bbf1054ad85588b1b7a313ee584 Mon Sep 17 00:00:00 2001
-From: Collin Funk <collin.funk1@gmail.com>
-Date: Mon, 12 Jan 2026 20:42:21 -0800
-Subject: [PATCH 3/4] maint: fix compilation errors with GCC 15
-
-GCC 15 changed the default to -std=gnu23 where the current code would
-cause -Wincompatible-pointer-types errors.
-
-Reported by Ondrej Pohorelsky <opohorel@redhat.com> in
-<https://lists.gnu.org/r/bug-time/2025-01/msg00000.html>
-and by Khem Raj <raj.khem@gmail.com> in
-<https://lists.gnu.org/r/bug-time/2025-03/msg00000.html>
-and by Marcin Serwin <marcin@serwin.dev> in
-<https://lists.gnu.org/r/bug-time/2025-10/msg00000.html>
-and by Sam James <sam@gentoo.org> in
-<https://savannah.gnu.org/bugs/?66450>.
-
-* configure.ac (AC_TYPE_SIGNAL): Remove obsolete macro.
-* src/time.c (sighandler): Remove type.
-(run_command): Use sighandler_t which is defined by glibc or provided by
-Gnulib.
-
-Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=time.git;a=commit;h=4bfc492fcfa7778df7fc473ee901c1bdfdb02de0]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- configure.ac | 1 -
- src/time.c   | 6 +-----
- 2 files changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ede8fd5..beb2077 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -66,7 +66,6 @@ dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
- AC_TYPE_PID_T
- AC_TYPE_SIZE_T
--AC_TYPE_SIGNAL
-
- dnl Checks for library functions.
- AC_FUNC_VPRINTF
-diff --git a/src/time.c b/src/time.c
-index 4438749..b8309a0 100644
---- a/src/time.c
-+++ b/src/time.c
-@@ -74,10 +74,6 @@ enum
-     "David MacKenzie",              \
-     "Assaf Gordon"
-
--
--/* A Pointer to a signal handler.  */
--typedef RETSIGTYPE (*sighandler) ();
--
- /* msec = milliseconds = 1/1,000 (1*10e-3) second.
-    usec = microseconds = 1/1,000,000 (1*10e-6) second.  */
-
-@@ -716,7 +712,7 @@ static void
- run_command (const char **cmd, RESUSE *resp)
- {
-   pid_t pid;			/* Pid of child.  */
--  sighandler interrupt_signal, quit_signal;
-+  sighandler_t interrupt_signal, quit_signal;
-   int saved_errno;
-
-   resuse_start (resp);
diff --git a/meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch b/meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch
deleted file mode 100644
index 4a49d79753..0000000000
--- a/meta/recipes-extended/time/time/0004-maint-remove-obsolete-autoconf-macros.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 0b860a81d54b1d44823bd0b5ce3a817594fb388f Mon Sep 17 00:00:00 2001
-From: Collin Funk <collin.funk1@gmail.com>
-Date: Mon, 12 Jan 2026 21:06:53 -0800
-Subject: [PATCH 4/4] maint: remove obsolete autoconf macros
-
-* configure.ac (AC_PROG_CC): Call instead of AC_PROG_CC_STDC and
-AC_PROG_GCC_TRADITIONAL.
-(AC_CHECK_INCLUDES_DEFAULT, AC_PROG_EGREP): Use instead of
-AC_HEADER_STDC.
-
-Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=time.git;a=commit;h=d957319127352cc67de4de5fd5d1537f289c0a84]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- configure.ac | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index beb2077..1af59c2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,10 +27,9 @@ AM_INIT_AUTOMAKE([
-
- dnl Checks for programs.
- AC_USE_SYSTEM_EXTENSIONS
--AC_PROG_CC_STDC
-+AC_PROG_CC
- AM_PROG_CC_C_O
- AC_PROG_CPP
--AC_PROG_GCC_TRADITIONAL
- AC_PROG_INSTALL
- AC_C_INLINE
-
-@@ -59,7 +58,9 @@ gl_WARN_ADD([-Wsuggest-attribute=pure])
- AC_SUBST([WARN_CFLAGS])
-
- dnl Checks for header files.
--AC_HEADER_STDC
-+AC_CHECK_INCLUDES_DEFAULT
-+AC_PROG_EGREP
-+
- AC_HEADER_SYS_WAIT
-
- dnl Checks for typedefs, structures, and compiler characteristics.
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.10.bb
similarity index 61%
rename from meta/recipes-extended/time/time_1.9.bb
rename to meta/recipes-extended/time/time_1.10.bb
index 9436a83cca..d59fde4d92 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.10.bb
@@ -13,14 +13,9 @@ ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
-           file://0001-include-string.h-for-memset.patch \
-           file://0002-maint-remove-K-R-declarations.patch \
-           file://0003-maint-fix-compilation-errors-with-GCC-15.patch \
-           file://0004-maint-remove-obsolete-autoconf-macros.patch \
-           "
+SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e"
+SRC_URI[sha256sum] = "e8c29fb4ab599d8478e41e8618f50db8aede9c90af27d0d2ef28ae50d5de09c3"
 
 inherit autotools
 
-- 
2.49.0


