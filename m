Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CA5C6FD1E
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.8707.1678229327932319480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iTwtavmD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id fa28so9075348pfb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmZYwgtnavzVMKIUqHMotUhNLcnDH10yfiyWbzQuLyY=;
        b=iTwtavmDx1MWGEdi0Sc+tfVCLU/Zg2t8yQC45dNR9YHPz5s+6uITxokorR3IlKd3X8
         9mg2tP81QHek/x65nvkVwOsTCvoDMej9+7iOsXLJKa1CpcFtdmp3UDMQ4IAuEXi2fptU
         pHyY/oPe6eB+GuD2Rx7N7ZVwLisvnxtrbOJC/fQHD219QLcN3LAib31Z3hkkwNpYs8gV
         LZ6Hi0LwXGDOCZWFefaU7arq7hBZumWC1m/s3vyo82Fyiq3rWtL5EIfYW4EubifRx5vg
         uJnLM/Jq4QRmwnReenRtu51d8XiNVSPfV0QUq2DYbYzzCQeWGF/wOZ2JU+nTHDYi1twP
         qYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmZYwgtnavzVMKIUqHMotUhNLcnDH10yfiyWbzQuLyY=;
        b=r6bUunn6JUF8267c2eQ9bUoWEi2N0KBRc2rt8HZOxM2u21jXUBJV3BYXyR2Nqyyk5U
         UheJ6GyRGzPPbrEiTdW4N2CqqqJL2L6qYakTctCtzUjDRO25Anu5ZV+Rf8GfNqr7Br1s
         efK6FzduiUqYkXgWgZXn9ldpQ4iPAPKdg4m0KYtnHzPslJAjGYllSFN+Ts2HhEMcYpbx
         dqstlB1mayHPm2ov2gI+mZpBE3CKWudXIoDaJJvHu7yC+n1aG3/GZC40xo0scUjIRUL9
         W/sGPxcRm1oBdJBiKUF/XrZdqZbAv1iy0Gb9iXeeNMn4Z4i7qwq60P9LZuO9HixQJdQU
         8GZQ==
X-Gm-Message-State: AO0yUKVOmWMhoAM3t7l47jSJlR7A0sswj6sPtr41yYAb7dXwPwYvnYky
	6zPztS9T4nw7Kk/Byr3wrHFhInc4AlA2xNnBpOA=
X-Google-Smtp-Source: AK7set/cAjP5Odbgzw6+guHicHbAIIDtmFP9WhqiCwH1i1tj0XXO6ofIOMNSQuXMZ2OhJGjjsqFGIQ==
X-Received: by 2002:a05:6a00:804:b0:5a8:1866:7cfe with SMTP id m4-20020a056a00080400b005a818667cfemr22183198pfk.17.1678229326741;
        Tue, 07 Mar 2023 14:48:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/23] apr: update 1.7.0 -> 1.7.2
Date: Tue,  7 Mar 2023 12:47:50 -1000
Message-Id: <013633b9f4b7dff2616c6d2e59e4d8118e3ce51f.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178138

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes for APR 1.7.2

  *) Correct a packaging issue in 1.7.1. The contents of the release were
     correct, but the top level directory was misnamed.

Changes for APR 1.7.1

  *) SECURITY: CVE-2022-24963 (cve.mitre.org)
     Integer Overflow or Wraparound vulnerability in apr_encode functions of
     Apache Portable Runtime (APR) allows an attacker to write beyond bounds
     of a buffer.

  *) SECURITY: CVE-2022-28331 (cve.mitre.org)
     On Windows, Apache Portable Runtime 1.7.0 and earlier may write beyond
     the end of a stack based buffer in apr_socket_sendv(). This is a result
     of integer overflow.

  *) SECURITY: CVE-2021-35940 (cve.mitre.org)
     Restore fix for out-of-bounds array dereference in apr_time_exp*() functions.
     (This issue was addressed as CVE-2017-12613 in APR 1.6.3 and
     later 1.6.x releases, but was missing in 1.7.0.)  [Stefan Sperling]

  *) configure: Fix various build issues for compilers enforcing
     strict C99 compliance.  PR 66396, 66408, 66426.
     [Florian Weimer <fweimer redhat.com>, Sam James <sam gentoo.org>]

  *) apr_atomic_read64(): Fix non-atomic read on 32-bit Windows [Ivan Zhakov]

  *) configure: Prefer posix name-based shared memory over SysV IPC.
     [Jim Jagielski]

  *) configure: Add --disable-sctp argument to forcibly disable SCTP
     support, or --enable-sctp which fails if SCTP support is not
     detected.  [Lubos Uhliarik <luhliari redhat.com>, Joe Orton]

  *) Fix handle leak in the Win32 apr_uid_current implementation.
     PR 61165. [Ivan Zhakov]

  *) Add error handling for lseek() failures in apr_file_write() and
     apr_file_writev().  [Joe Orton]

  *) Don't silently set APR_FOPEN_NOCLEANUP for apr_file_mktemp() created file
     to avoid a fd and inode leak when/if later passed to apr_file_setaside().
     [Yann Ylavic]

  *) APR's configure script uses AC_TRY_RUN to detect whether the return type
     of strerror_r is int. When cross-compiling this defaults to no.

     This commit adds an AC_CACHE_CHECK so users who cross-compile APR may
     influence the outcome with a configure variable. [Sebastian Kemper
     <sebastian_ml gmx net>]

  *) Add a cache check with which users who cross-compile APR
     can influence the outcome of the /dev/zero test by setting the variable
     ac_cv_mmap__dev_zero=yes [Sebastian Kemper <sebastian_ml gmx net>]

  *) Trick autoconf into printing the correct default prefix in the help.
     [Stefan Fritsch]

  *) Don't try to use PROC_PTHREAD by default when cross compiling.
     [Yann Ylavic]

  *) Add the ability to cross compile APR. [Graham Leggett]

  *) While cross-compiling, the tools/gen_test_char could not
     be executed at build time, use AX_PROG_CC_FOR_BUILD to
     build native tools/gen_test_char

     Support explicit libtool by variable assigning before buildcheck.sh,
     it is helpful for cross-compiling (such as libtool=aarch64-linux-libtool)
     [Hongxu Jia <hongxu.jia windriver.com>]

  *) Avoid an overflow on 32 bit platforms. [René Hjortskov Nielsen
     <r... hjortskov.dk>]

  *) Use AC_CHECK_SIZEOF, so as to support cross compiling. PR 56053.
     [Mike Frysinger <vapier gentoo.org>]

  *) Add --tag=CC to libtool invocations. PR 62640. [Michael Osipov]

  *) apr_pools: Fix pool debugging output so that creation events are
     always emitted before allocation events and subpool destruction
     events are emitted on pool clear/destroy for proper accounting.
     [Brane Čibej]

  *) apr_socket_listen: Allow larger listen backlog values on Windows 8+.
     [Evgeny Kotkov <evgeny.kotkov visualsvn.com>]

  *) Fixed: apr_get_oslevel() was returning APR_WIN_XP on Windows 10

  *) Fix attempt to free invalid memory on exit when apr_app is used
     on Windows. [Ivan Zhakov]

  *) Fix double free on exit when apr_app is used on Windows. [Ivan Zhakov]

  *) Fix a regression in apr_stat() for root path on Windows. [Ivan Zhakov]

Dropped patches have all been merged, addressed separately or are backports.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ffae93f24bb1e3954b232099153fd059cfd7daf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit a308e10ef4ad9e097b025f009866eae178259781)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ion-to-disable-timed-dependant-tests.patch | 20 ++---
 ...CHE_CHECK-for-strerror_r-return-type.patch | 52 -------------
 ...-runtime-test-for-mmap-that-can-map-.patch | 26 +++----
 ...ir-path-references-from-installed-ap.patch | 25 +++---
 ...configure.in-support-cross-compiling.patch | 63 ---------------
 ...ze-doesn-t-match-in-glibc-when-cross.patch | 76 -------------------
 .../apr/apr/CVE-2021-35940.patch              | 58 --------------
 .../recipes-support/apr/apr/autoconf270.patch | 22 ------
 .../apr/apr/libtoolize_check.patch            | 21 +++--
 .../apr/{apr_1.7.0.bb => apr_1.7.2.bb}        |  8 +-
 10 files changed, 51 insertions(+), 320 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch
 delete mode 100644 meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
 delete mode 100644 meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
 delete mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch
 delete mode 100644 meta/recipes-support/apr/apr/autoconf270.patch
 rename meta/recipes-support/apr/{apr_1.7.0.bb => apr_1.7.2.bb} (91%)

diff --git a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
index abff4e9331..a274f3a16e 100644
--- a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
+++ b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
@@ -1,14 +1,15 @@
-From 2bbe20b4f69e84e7a18bc79d382486953f479328 Mon Sep 17 00:00:00 2001
+From 225abf37cd0b49960664b59f08e515a4c4ea5ad0 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Thu, 26 Mar 2020 18:30:36 +0000
 Subject: [PATCH] Add option to disable timed dependant tests
 
-The disabled tests rely on timing to pass correctly. On a virtualized 
+The disabled tests rely on timing to pass correctly. On a virtualized
 system under heavy load, these tests randomly fail because they miss
 a timer or other timing related issues.
 
 Upstream-Status: Pending
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+
 ---
  configure.in     | 6 ++++++
  include/apr.h.in | 1 +
@@ -16,10 +17,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  3 files changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index d9f32d6..f0c5661 100644
+index bfd488b..3663220 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -2886,6 +2886,12 @@ AC_ARG_ENABLE(timedlocks,
+@@ -3023,6 +3023,12 @@ AC_ARG_ENABLE(timedlocks,
  )
  AC_SUBST(apr_has_timedlocks)
  
@@ -45,10 +46,10 @@ index ee99def..c46a5f4 100644
  #define APR_PROCATTR_USER_SET_REQUIRES_PASSWORD @apr_procattr_user_set_requires_password@
  
 diff --git a/test/testlock.c b/test/testlock.c
-index a43f477..6233d0b 100644
+index e3437c1..04e01b9 100644
 --- a/test/testlock.c
 +++ b/test/testlock.c
-@@ -396,13 +396,13 @@ abts_suite *testlock(abts_suite *suite)
+@@ -535,7 +535,7 @@ abts_suite *testlock(abts_suite *suite)
      abts_run_test(suite, threads_not_impl, NULL);
  #else
      abts_run_test(suite, test_thread_mutex, NULL);
@@ -56,6 +57,8 @@ index a43f477..6233d0b 100644
 +#if APR_HAS_TIMEDLOCKS && APR_HAVE_TIME_DEPENDANT_TESTS
      abts_run_test(suite, test_thread_timedmutex, NULL);
  #endif
+     abts_run_test(suite, test_thread_nestedmutex, NULL);
+@@ -543,7 +543,7 @@ abts_suite *testlock(abts_suite *suite)
      abts_run_test(suite, test_thread_rwlock, NULL);
      abts_run_test(suite, test_cond, NULL);
      abts_run_test(suite, test_timeoutcond, NULL);
@@ -63,7 +66,4 @@ index a43f477..6233d0b 100644
 +#if APR_HAS_TIMEDLOCKS && APR_HAVE_TIME_DEPENDANT_TESTS
      abts_run_test(suite, test_timeoutmutex, NULL);
  #endif
- #endif
--- 
-2.23.0
-
+ #ifdef WIN32
diff --git a/meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch b/meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch
deleted file mode 100644
index d0a9bd9129..0000000000
--- a/meta/recipes-support/apr/apr/0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 8ca3c3306f1a149e51a3be6a4b1e47e9aee88262 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 Aug 2022 22:42:03 -0700
-Subject: [PATCH] add AC_CACHE_CHECK for strerror_r return type
-
-APR's configure script uses AC_TRY_RUN to detect whether the return type
-of strerror_r is int. When cross-compiling this defaults to no.
-
-This commit adds an AC_CACHE_CHECK so users who cross-compile APR may
-influence the outcome with a configure variable.
-
-Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1875065]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- build/apr_common.m4 | 11 ++++-------
- 1 file changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/build/apr_common.m4 b/build/apr_common.m4
-index cbf2a4c..42e75cf 100644
---- a/build/apr_common.m4
-+++ b/build/apr_common.m4
-@@ -525,8 +525,9 @@ dnl  string.
- dnl
- dnl
- AC_DEFUN([APR_CHECK_STRERROR_R_RC], [
--AC_MSG_CHECKING(for type of return code from strerror_r)
--AC_TRY_RUN([
-+AC_CACHE_CHECK([whether return code from strerror_r has type int],
-+[ac_cv_strerror_r_rc_int],
-+[AC_TRY_RUN([
- #include <errno.h>
- #include <string.h>
- #include <stdio.h>
-@@ -542,14 +543,10 @@ main()
- }], [
-     ac_cv_strerror_r_rc_int=yes ], [
-     ac_cv_strerror_r_rc_int=no ], [
--    ac_cv_strerror_r_rc_int=no ] )
-+    ac_cv_strerror_r_rc_int=no ] ) ] )
- if test "x$ac_cv_strerror_r_rc_int" = xyes; then
-   AC_DEFINE(STRERROR_R_RC_INT, 1, [Define if strerror returns int])
--  msg="int"
--else
--  msg="pointer"
- fi
--AC_MSG_RESULT([$msg])
- ] )
- 
- dnl
--- 
-2.37.2
-
diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
index fa6202da79..a78b16284f 100644
--- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
@@ -1,4 +1,4 @@
-From ee728971fd9d2da39356f1574d58d5daa3b24520 Mon Sep 17 00:00:00 2001
+From 316b81c462f065927d7fec56aadd5c8cb94d1cf0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 26 Aug 2022 00:28:08 -0700
 Subject: [PATCH] configure: Remove runtime test for mmap that can map
@@ -10,24 +10,25 @@ mutexes
 
 Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- configure.in | 32 --------------------------------
- 1 file changed, 32 deletions(-)
+ configure.in | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index a99049d..f1f55c7 100644
+index 3663220..dce9789 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -1182,38 +1182,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shmget shmat shmdt shmctl \
+@@ -1303,36 +1303,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shmget shmat shmdt shmctl \
  APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
  AC_CHECK_FILE(/dev/zero)
  
 -# Not all systems can mmap /dev/zero (such as HP-UX).  Check for that.
 -if test "$ac_cv_func_mmap" = "yes" &&
--   test "$ac_cv_file__dev_zero" = "yes"; then
--    AC_MSG_CHECKING(for mmap that can map /dev/zero)
--    AC_TRY_RUN([
--#include <sys/types.h>
+-  test "$ac_cv_file__dev_zero" = "yes"; then
+-    AC_CACHE_CHECK([for mmap that can map /dev/zero],
+-    [ac_cv_mmap__dev_zero],
+-    [AC_TRY_RUN([#include <sys/types.h>
 -#include <sys/stat.h>
 -#include <fcntl.h>
 -#ifdef HAVE_SYS_MMAN_H
@@ -49,14 +50,9 @@ index a99049d..f1f55c7 100644
 -            return 3;
 -        }
 -        return 0;
--    }], [], [ac_cv_file__dev_zero=no], [ac_cv_file__dev_zero=no])
--
--    AC_MSG_RESULT($ac_cv_file__dev_zero)
+-    }], [], [ac_cv_file__dev_zero=no], [ac_cv_file__dev_zero=no])])
 -fi
 -
  # Now we determine which one is our anonymous shmem preference.
  haveshmgetanon="0"
  havemmapzero="0"
--- 
-2.37.2
-
diff --git a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
index 72e706f966..d63423f3a1 100644
--- a/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
+++ b/meta/recipes-support/apr/apr/0002-apr-Remove-workdir-path-references-from-installed-ap.patch
@@ -1,8 +1,7 @@
-From 5925b20da8bbc34d9bf5a5dca123ef38864d43c6 Mon Sep 17 00:00:00 2001
+From 689a8db96a6d1e1cae9cbfb35d05ac82140a6555 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 09:39:06 +0800
-Subject: [PATCH 2/7] apr: Remove workdir path references from installed apr
- files
+Subject: [PATCH] apr: Remove workdir path references from installed apr files
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -14,20 +13,23 @@ packages at target run time, the workdir path caused confusion.
 Rebase to 1.6.3
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- apr-config.in | 26 ++------------------------
- 1 file changed, 2 insertions(+), 24 deletions(-)
+ apr-config.in | 32 ++------------------------------
+ 1 file changed, 2 insertions(+), 30 deletions(-)
 
 diff --git a/apr-config.in b/apr-config.in
-index 84b4073..bbbf651 100644
+index bed47ca..47874e5 100644
 --- a/apr-config.in
 +++ b/apr-config.in
-@@ -152,14 +152,7 @@ while test $# -gt 0; do
+@@ -164,16 +164,7 @@ while test $# -gt 0; do
      flags="$flags $LDFLAGS"
      ;;
      --includes)
 -    if test "$location" = "installed"; then
          flags="$flags -I$includedir $EXTRA_INCLUDES"
+-    elif test "$location" = "crosscompile"; then
+-        flags="$flags -I$APR_TARGET_DIR/$includedir $EXTRA_INCLUDES"
 -    elif test "$location" = "source"; then
 -        flags="$flags -I$APR_SOURCE_DIR/include $EXTRA_INCLUDES"
 -    else
@@ -37,13 +39,15 @@ index 84b4073..bbbf651 100644
      ;;
      --srcdir)
      echo $APR_SOURCE_DIR
-@@ -181,29 +174,14 @@ while test $# -gt 0; do
+@@ -197,33 +188,14 @@ while test $# -gt 0; do
      exit 0
      ;;
      --link-ld)
 -    if test "$location" = "installed"; then
 -        ### avoid using -L if libdir is a "standard" location like /usr/lib
 -        flags="$flags -L$libdir -l${APR_LIBNAME}"
+-    elif test "$location" = "crosscompile"; then
+-        flags="$flags -L$APR_TARGET_DIR/$libdir -l${APR_LIBNAME}"
 -    else
 -        ### this surely can't work since the library is in .libs?
 -        flags="$flags -L$APR_BUILD_DIR -l${APR_LIBNAME}"
@@ -62,6 +66,8 @@ index 84b4073..bbbf651 100644
 -        # Since the user is specifying they are linking with libtool, we
 -        # *know* that -R will be recognized by libtool.
 -        flags="$flags -L$libdir -R$libdir -l${APR_LIBNAME}"
+-    elif test "$location" = "crosscompile"; then
+-        flags="$flags  -L${APR_TARGET_DIR}/$libdir  -l${APR_LIBNAME}"
 -    else
 -        flags="$flags $LA_FILE"
 -    fi
@@ -69,6 +75,3 @@ index 84b4073..bbbf651 100644
      ;;
      --shlib-path-var)
      echo "$SHLIBPATH_VAR"
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch b/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
deleted file mode 100644
index 4dd53bd8eb..0000000000
--- a/meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d5028c10f156c224475b340cfb1ba025d6797243 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 2 Feb 2018 15:51:42 +0800
-Subject: [PATCH 3/7] Makefile.in/configure.in: support cross compiling
-
-While cross compiling, the tools/gen_test_char could not
-be executed at build time, use AX_PROG_CC_FOR_BUILD to
-build native tools/gen_test_char
-
-Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in  | 10 +++-------
- configure.in |  3 +++
- 2 files changed, 6 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 5fb760e..8675f90 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -46,7 +46,7 @@ LT_VERSION = @LT_VERSION@
- 
- CLEAN_TARGETS = apr-config.out apr.exp exports.c export_vars.c .make.dirs \
- 	build/apr_rules.out tools/gen_test_char@EXEEXT@ \
--	tools/gen_test_char.o tools/gen_test_char.lo \
-+	tools/gen_test_char.o \
- 	include/private/apr_escape_test_char.h
- DISTCLEAN_TARGETS = config.cache config.log config.status \
- 	include/apr.h include/arch/unix/apr_private.h \
-@@ -131,13 +131,9 @@ check: $(TARGET_LIB)
- etags:
- 	etags `find . -name '*.[ch]'`
- 
--OBJECTS_gen_test_char = tools/gen_test_char.lo $(LOCAL_LIBS)
--tools/gen_test_char.lo: tools/gen_test_char.c
-+tools/gen_test_char@EXEEXT@: tools/gen_test_char.c
- 	$(APR_MKDIR) tools
--	$(LT_COMPILE)
--
--tools/gen_test_char@EXEEXT@: $(OBJECTS_gen_test_char)
--	$(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIBS)
-+	$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $< -o $@
- 
- include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
- 	$(APR_MKDIR) include/private
-diff --git a/configure.in b/configure.in
-index 719f331..361120f 100644
---- a/configure.in
-+++ b/configure.in
-@@ -183,6 +183,9 @@ dnl can only be used once within a configure script, so this prevents a
- dnl preload section from invoking the macro to get compiler info.
- AC_PROG_CC
- 
-+dnl Check build CC for gen_test_char compiling which is executed at build time.
-+AX_PROG_CC_FOR_BUILD
-+
- dnl AC_PROG_SED is only avaliable in recent autoconf versions.
- dnl Use AC_CHECK_PROG instead if AC_PROG_SED is not present.
- ifdef([AC_PROG_SED],
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
deleted file mode 100644
index d1a2ebe881..0000000000
--- a/meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 49661ea3858cf8494926cccf57d3e8c6dcb47117 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 14 Dec 2016 18:13:08 +0800
-Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
- compiling
-
-In configure.in, it contains the following:
-
-	APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
-
-the macro "APR_CHECK_SIZEOF_EXTENDED" was defined in build/apr_common.m4,
-it use the "AC_TRY_RUN" macro, this macro let the off_t to 8, when cross
-compiling enable.
-
-So it was hardcoded for cross compiling, we should detect it dynamic based on
-the sysroot's glibc. We change it to the following:
-
-	AC_CHECK_SIZEOF(off_t)
-
-The same for the following hardcoded types for cross compiling:
-
-	pid_t	8
-	ssize_t	8
-	size_t	8
-	off_t	8
-
-Change the above correspondingly.
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
-Upstream-Status: Pending
-
----
- configure.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 27b8539..fb408d1 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1801,7 +1801,7 @@ else
-     socklen_t_value="int"
- fi
- 
--APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], pid_t, 8)
-+AC_CHECK_SIZEOF(pid_t)
- 
- if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short"; then
-     pid_t_fmt='#define APR_PID_T_FMT "hd"'
-@@ -1873,7 +1873,7 @@ APR_CHECK_TYPES_FMT_COMPATIBLE(size_t, unsigned long, lu, [size_t_fmt="lu"], [
- APR_CHECK_TYPES_FMT_COMPATIBLE(size_t, unsigned int, u, [size_t_fmt="u"])
- ])
- 
--APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], ssize_t, 8)
-+AC_CHECK_SIZEOF(ssize_t)
- 
- dnl the else cases below should no longer occur;
- AC_MSG_CHECKING([which format to use for apr_ssize_t])
-@@ -1891,7 +1891,7 @@ fi
- 
- ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
- 
--APR_CHECK_SIZEOF_EXTENDED([#include <stddef.h>], size_t, 8)
-+AC_CHECK_SIZEOF(size_t)
- 
- # else cases below should no longer occur;
- AC_MSG_CHECKING([which format to use for apr_size_t])
-@@ -1909,7 +1909,7 @@ fi
- 
- size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""
- 
--APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
-+AC_CHECK_SIZEOF(off_t)
- 
- if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" = "4yes"; then
-     # Enable LFS
diff --git a/meta/recipes-support/apr/apr/CVE-2021-35940.patch b/meta/recipes-support/apr/apr/CVE-2021-35940.patch
deleted file mode 100644
index 00befdacee..0000000000
--- a/meta/recipes-support/apr/apr/CVE-2021-35940.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-
-SECURITY: CVE-2021-35940 (cve.mitre.org)
-
-Restore fix for CVE-2017-12613 which was missing in 1.7.x branch, though
-was addressed in 1.6.x in 1.6.3 and later via r1807976.
-
-The fix was merged back to 1.7.x in r1891198.
-
-Since this was a regression in 1.7.0, a new CVE name has been assigned
-to track this, CVE-2021-35940.
-
-Thanks to Iveta Cesalova <icesalov redhat.com> for reporting this issue.
-
-https://svn.apache.org/viewvc?view=revision&revision=1891198
-
-Upstream-Status: Backport
-CVE: CVE-2021-35940
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-
-Index: time/unix/time.c
-===================================================================
---- a/time/unix/time.c	(revision 1891197)
-+++ b/time/unix/time.c	(revision 1891198)
-@@ -142,6 +142,9 @@
-     static const int dayoffset[12] =
-     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
- 
-+    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
-+        return APR_EBADDATE;
-+
-     /* shift new year to 1st March in order to make leap year calc easy */
- 
-     if (xt->tm_mon < 2)
-Index: time/win32/time.c
-===================================================================
---- a/time/win32/time.c	(revision 1891197)
-+++ b/time/win32/time.c	(revision 1891198)
-@@ -54,6 +54,9 @@
-     static const int dayoffset[12] =
-     {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
- 
-+    if (tm->wMonth < 1 || tm->wMonth > 12)
-+        return APR_EBADDATE;
-+
-     /* Note; the caller is responsible for filling in detailed tm_usec,
-      * tm_gmtoff and tm_isdst data when applicable.
-      */
-@@ -228,6 +231,9 @@
-     static const int dayoffset[12] =
-     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
- 
-+    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
-+        return APR_EBADDATE;
-+
-     /* shift new year to 1st March in order to make leap year calc easy */
- 
-     if (xt->tm_mon < 2)
diff --git a/meta/recipes-support/apr/apr/autoconf270.patch b/meta/recipes-support/apr/apr/autoconf270.patch
deleted file mode 100644
index 9f7b5c624c..0000000000
--- a/meta/recipes-support/apr/apr/autoconf270.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-With autoconf 2.70 confdefs.h is already included. Including it twice generates
-compiler warnings and since this macros is to error on warnings, it breaks.
-
-Fix by not including the file.
-
-Upstream-Status: Pending
-RP - 2021/1/28
-
-Index: apr-1.7.0/build/apr_common.m4
-===================================================================
---- apr-1.7.0.orig/build/apr_common.m4
-+++ apr-1.7.0/build/apr_common.m4
-@@ -505,8 +505,7 @@ AC_DEFUN([APR_TRY_COMPILE_NO_WARNING],
-  fi
-  AC_COMPILE_IFELSE(
-   [AC_LANG_SOURCE(
--   [#include "confdefs.h"
--   ]
-+   []
-    [[$1]]
-    [int main(int argc, const char *const *argv) {]
-    [[$2]]
diff --git a/meta/recipes-support/apr/apr/libtoolize_check.patch b/meta/recipes-support/apr/apr/libtoolize_check.patch
index 740792e6b0..80ce43caa4 100644
--- a/meta/recipes-support/apr/apr/libtoolize_check.patch
+++ b/meta/recipes-support/apr/apr/libtoolize_check.patch
@@ -1,6 +1,7 @@
+From 17835709bc55657b7af1f7c99b3f572b819cf97e Mon Sep 17 00:00:00 2001
 From: Helmut Grohne <helmut@subdivi.de>
-Subject: check for libtoolize rather than libtool
-Last-Update: 2014-09-19
+Date: Tue, 7 Feb 2023 07:04:00 +0000
+Subject: [PATCH] check for libtoolize rather than libtool
 
 libtool is now in package libtool-bin, but apr only needs libtoolize.
 
@@ -8,14 +9,22 @@ Upstream-Status: Pending [ from debian: https://sources.debian.org/data/main/a/a
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
---- apr.orig/build/buildcheck.sh
-+++ apr/build/buildcheck.sh
-@@ -39,11 +39,11 @@ fi
+---
+ build/buildcheck.sh | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/build/buildcheck.sh b/build/buildcheck.sh
+index 44921b5..08bc8a8 100755
+--- a/build/buildcheck.sh
++++ b/build/buildcheck.sh
+@@ -39,13 +39,11 @@ fi
  # ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
  # output is multiline from 1.5 onwards
  
 -# Require libtool 1.4 or newer
--libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
+-if test -z "$libtool"; then
+-  libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
+-fi
 -lt_pversion=`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
 +# Require libtoolize 1.4 or newer
 +libtoolize=`build/PrintPath glibtoolize1 glibtoolize libtoolize libtoolize15 libtoolize14`
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.2.bb
similarity index 91%
rename from meta/recipes-support/apr/apr_1.7.0.bb
rename to meta/recipes-support/apr/apr_1.7.2.bb
index 5e62e5683f..807dce21da 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.2.bb
@@ -16,21 +16,15 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch \
-           file://0003-Makefile.in-configure.in-support-cross-compiling.patch \
            file://0004-Fix-packet-discards-HTTP-redirect.patch \
            file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
-           file://0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
-           file://autoconf270.patch \
-           file://0001-add-AC_CACHE_CHECK-for-strerror_r-return-type.patch \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
-           file://CVE-2021-35940.patch \
            "
 
-SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
-SRC_URI[sha256sum] = "e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea"
+SRC_URI[sha256sum] = "75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.34.1


