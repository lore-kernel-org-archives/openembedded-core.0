Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6F4C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:51:01 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.21.1660081860161433266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dNKMspyZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so265966pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ynGMn/1otpPzv0BuFks15odDD77vBv6A+MOKL/wB2Qk=;
        b=dNKMspyZU9OxoXs+Np3MaLtgwAPD/fBLrWirgsZ916l7yoOsJnnhfC16eMxaIWbtya
         pTNx02nS/Rs3AzeB1BCSk/8g8mfqPjlyX+av8tnHh7hAfMLezseTwkzNSdCGWuWREI7M
         G3d175WHPPH/Xrm0YtTcGFVc/I1F9jZEl3NjUfliEltJFjzpFjTW6/p53qMCEBJ+s1E8
         9mYVNb/H8qlWb7Q6sOyncE9ASDsD9KVFN5i/q4x2bxVYLuxada2weuzrbYY6lkmU/8V/
         VjTcFZbVmtWyx7Aeie39DJUZizSCO+Mnfup/rpTjq0/qrQDIfelMiioWGjIjUBvnyVfY
         H1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ynGMn/1otpPzv0BuFks15odDD77vBv6A+MOKL/wB2Qk=;
        b=09wPzp3Sl+Qh+51SAOxf8hp/TtkpYFhTfBCQyiJsSW6Yj1y3xW6tmlLMfmI7KatsiX
         grKFYXD6GegUCe04MkxD1djDdFoS4vye42qkhCCD2FeFj0y61awRRzz8gx/+JT1aF4Ik
         4Mq6jbh3X4x34woRm54D1OWx3XlXD7xVtd8tIxDpLAjhCbel8LytyFGCvkHwiwHo+LbJ
         RSMcexz1VTm4LRWoOtVZhuRiBkx3/W8XsOWkbWb9hK60zd5o6Yd6mSdP5BrNui4S3ZPh
         HsVeCz1Ow5B6MhE/m6lI44e6/7BdMXMzWOIH/JWxQE6INrqFuDuRUoJ8CKtvFPdrPmSJ
         PGLg==
X-Gm-Message-State: ACgBeo26HmstrWtEprFsOPu02nF88emFeC4tnDnXR3itqGzg4lt/2EHD
	Ij/9z2Qtjp+MrxYQEhCUknr13otJbIdp+zBZ
X-Google-Smtp-Source: 
 AA6agR6vxtsJQ7JzWRDdI172S2yiG5UYuXIcKEfXjA2VL6eIkcLcz3ZtoDq2ar2gvaMbgIVpCoA78A==
X-Received: by 2002:a17:902:ed83:b0:16e:eb08:fafc with SMTP id
 e3-20020a170902ed8300b0016eeb08fafcmr25300673plj.117.1660081858978;
        Tue, 09 Aug 2022 14:50:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a626083000000b0052c7ff2ac74sm402219pfb.17.2022.08.09.14.50.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:50:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] glibc: revert one upstream change to work
 around broken DEBUG_BUILD build
Date: Tue,  9 Aug 2022 11:50:32 -1000
Message-Id: 
 <c6435f0fad9477aa83b04ef15e1939e9ed2b3c4e.1660081510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660081510.git.steve@sakoman.com>
References: <cover.1660081510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:51:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169174

From: Martin Jansa <Martin.Jansa@gmail.com>

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

  instead of revert we can use -fexpensive-optimizations which
  will optimize-out the symbol, but that works only with -O1 and
  not -Og used by DEBUG_BUILD

  upstream report:
  https://sourceware.org/bugzilla/show_bug.cgi?id=29249

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 642348f9b4656a090b5a272c18a6723c60100e08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


