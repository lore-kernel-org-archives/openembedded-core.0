Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B49C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:18:53 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.5923.1658837924351978795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PLct8mym;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l23so25835591ejr.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OI210cD/1UyA0nWhbND9qVLlr0VFhWO06I0aRH9M770=;
        b=PLct8mymGfHj4ja62Mu2CZ4KAsXjx4/EZ+fmVo282WC/5KLl7YOf4XzgJy0oKrFmbh
         h+OKIi9eFuJOxGr7rQos0c2wyP74FYU8YtWer+ryBjoxgKfGQI94vreUxUHoCzuiYJGz
         J7JNW755jKOUiXT29bJy8Ax3FxnvQBrJkir+ki1Um2xgYenVhACXdBn63L4wu+Jt85ww
         2+GI3naFAckIa2e/mHGaJjMePfdzJw0GbnkqpI70UegKRtfwMqwUHLYVdsJWuq1PF+v6
         PY3jdc+sGu/DuHpze1K94+cHDTXJBM9P+42LtoRoHUWLrX3Um8XcRfjItgns1PL24Ngj
         pnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OI210cD/1UyA0nWhbND9qVLlr0VFhWO06I0aRH9M770=;
        b=8A0fIJkJecETxQtq3YRevIa+223qpMs/z7RCjePUAV3BpQIBQEN5h38fovz4pCrKEo
         /uiXWV+5350Iux2Z4SUYNwR1nb9xWZ2O2XJSTRmrfK3PZ1q6cHuEkuhy0BKzj6hJvI2s
         kQ8tNe89VxfGjJJ+kUG7X7sAi+fT5Dt43GcA0S1st3bT4uTNT8BCeC1XcIAmyrpR9Gqf
         t0YzW6Sxg6BKoZG8K63+pc4/M4EDTCTQCbCWiiFMXrfV24CN96yaB9QONODQHdIlc0ZA
         agmSuh8EAngxvlwFHbX94j61bvGHJE0+6ycSOksBayngBUpjLGyhN6JBPhouJ4i2phRf
         HbPw==
X-Gm-Message-State: AJIora9ns9dzcUXfvG4FlVmqjTbaaas8BANcaomE2f0NMWte1degh1K8
	1eg9KKC4AtRHwhAzH+9G/u0EaTIAGiQ=
X-Google-Smtp-Source: 
 AGRyM1vrLDV62Z++J8LFTOaAUmNVkjwaf32wz5AbRBlwKuGRrXnzuVW9W57zJ3M4Q5Ww8LBm1K9WIw==
X-Received: by 2002:a17:907:2723:b0:72b:5a8a:f983 with SMTP id
 d3-20020a170907272300b0072b5a8af983mr13926869ejl.635.1658837922620;
        Tue, 26 Jul 2022 05:18:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 gx27-20020a1709068a5b00b0072ed9efc9dfsm6393351ejc.48.2022.07.26.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:18:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] glibc: revert one upstream change to work around broken
 DEBUG_BUILD build
Date: Tue, 26 Jul 2022 14:18:21 +0200
Message-Id: <20220726121821.3814251-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 12:18:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168503

* work around for build failure with DEBUG_BUILD:
  http://errors.yoctoproject.org/Errors/Details/661468/

  TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.3.0/ld.bfd:
  TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/build-x86_64-oe-linux/libc.a(libc-tls.o):
  in function `__libc_setup_tls':
  /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined reference to `_startup_fatal_not_constant'

  introduced in:
  https://git.openembedded.org/openembedded-core/commit/?id=50ca0eea5424c89c9b39cf69d8bd73fd65f06e95
  with:
  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=a2a6bce7d7e52c1c34369a7da62c501cc350bc31

  Temporary reverting as discussed in:
  https://lists.openembedded.org/g/openembedded-core/message/168463
  (it's also reverted in buildroot now with: https://lore.kernel.org/buildroot/20220720213853.1A27184110@busybox.osuosl.org/t/)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lement-a-useful-version-of-_startup_.patch | 128 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
new file mode 100644
index 0000000000..2421a63605
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
@@ -0,0 +1,128 @@
+From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 24 Jul 2022 19:41:41 +0200
+Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_fatal"
+
+This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
+Upstream-Status: Inappropriate [temporary work around]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
+ sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
+ sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
+ 3 files changed, 19 insertions(+), 65 deletions(-)
+ delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
+ delete mode 100644 sysdeps/unix/sysv/linux/startup.h
+
+diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sysv/linux/i386/startup.h
+index 213805d7d2..67c9310f3a 100644
+--- a/sysdeps/unix/sysv/linux/i386/startup.h
++++ b/sysdeps/unix/sysv/linux/i386/startup.h
+@@ -1,5 +1,5 @@
+ /* Linux/i386 definitions of functions used by static libc main startup.
+-   Copyright (C) 2022 Free Software Foundation, Inc.
++   Copyright (C) 2017-2022 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -16,7 +16,22 @@
+    License along with the GNU C Library; if not, see
+    <https://www.gnu.org/licenses/>.  */
+ 
+-/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
+-#define I386_USE_SYSENTER 0
++#if BUILD_PIE_DEFAULT
++/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
++# define I386_USE_SYSENTER 0
+ 
+-#include_next <startup.h>
++# include <sysdep.h>
++# include <abort-instr.h>
++
++__attribute__ ((__noreturn__))
++static inline void
++_startup_fatal (const char *message __attribute__ ((unused)))
++{
++  /* This is only called very early during startup in static PIE.
++     FIXME: How can it be improved?  */
++  ABORT_INSTRUCTION;
++  __builtin_unreachable ();
++}
++#else
++# include_next <startup.h>
++#endif
+diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sysv/linux/ia64/startup.h
+deleted file mode 100644
+index 77f29f15a2..0000000000
+--- a/sysdeps/unix/sysv/linux/ia64/startup.h
++++ /dev/null
+@@ -1,22 +0,0 @@
+-/* Linux/ia64 definitions of functions used by static libc main startup.
+-   Copyright (C) 2022 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-/* This code is used before the TCB is set up.  */
+-#define IA64_USE_NEW_STUB 0
+-
+-#include_next <startup.h>
+diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/startup.h
+deleted file mode 100644
+index 39859b404a..0000000000
+--- a/sysdeps/unix/sysv/linux/startup.h
++++ /dev/null
+@@ -1,39 +0,0 @@
+-/* Linux definitions of functions used by static libc main startup.
+-   Copyright (C) 2017-2022 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <https://www.gnu.org/licenses/>.  */
+-
+-#ifdef SHARED
+-# include_next <startup.h>
+-#else
+-# include <sysdep.h>
+-
+-/* Avoid a run-time invocation of strlen.  */
+-#define _startup_fatal(message)                                         \
+-  do                                                                    \
+-    {                                                                   \
+-      size_t __message_length = __builtin_strlen (message);             \
+-      if (! __builtin_constant_p (__message_length))                    \
+-        {                                                               \
+-          extern void _startup_fatal_not_constant (void);               \
+-          _startup_fatal_not_constant ();                               \
+-        }                                                               \
+-      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),           \
+-                             __message_length);                         \
+-      INTERNAL_SYSCALL_CALL (exit_group, 127);                          \
+-    }                                                                   \
+-  while (0)
+-#endif  /* !SHARED */
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 96fe39c548..df847e76bf 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -48,6 +48,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           \
+           file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.35.1


