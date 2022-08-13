Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A08C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 12:39:44 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.4385.1660394379866273845
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 05:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=peyGaJNC;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id x21so4247633edd.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=WPnP8vbA1S652S9QvbNcl824LHuEHU3j0k1vhOhzg8I=;
        b=peyGaJNCkNeV9XVyDXYQw/py3c/6NVBZH3n+lgOfjDBvsEoN6ON3hxJ1xRdI3I2mMH
         u5EcqDyw5LksHx96QEf8IvK4Z9aZJ/cVSXhcDVtyhuLKqj13GFSwYpWAVBvbWwcPHCqo
         bHZ181/1N29dfzV5HVfr8LmFmxUlFMfYGgVEDFbNcRg0ATFIKigriNHSoI1+X/K8w8d0
         fnqGnDVVS4OU0QQ/qLuqHjUYqnC+FnzWFN0ttve2sBVgiP75CZYtRgEMHqpTPuWkFZNn
         0D6gPd/KMnuPPUexD9jaTr0w06CsapMJHVmYjJlwHE2NrTiEX53iFZARBPD3glAclcAV
         fE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=WPnP8vbA1S652S9QvbNcl824LHuEHU3j0k1vhOhzg8I=;
        b=7xhtKJ3DGLaqH25kRUbIMQZwUITdWAf7D67WVfG+ybBUAeqkZwayEa3d9JVE5XYvtN
         YuuL8HqpaJjgh36is6D16FEC1h3C3t986himIxoedy/7t+SCUvUrEhBYoq7o8rByV1JU
         nVHg62EOQ9/cHAW13dQSW8F/U5nqzutaKt9bXVEHUDVCM9ZdhVXuvNy78nS5ioz9lnjS
         F35R1pJWh3IVUcqcX4f+WRNTIUNSm6L2dPHABkRFyOKSQCi8Pp6Yc/4YHU5ACcu1Hb0u
         LFCs+BFWAHxQ0ymJu+38QiEi/+SLqOTPkbEE8Cn3RXXYWqrwfd/xDr4MdIvHGRUqGoa5
         r92w==
X-Gm-Message-State: ACgBeo1Qws71vsw15C8oBrNkmSucudbRvHrzeQ5DLVobOWdL75SkylvT
	PyWrNfvwhOdffg8ocMJI1C7TORHR3Bo=
X-Google-Smtp-Source: 
 AA6agR7gdpW3eTifCBdJZhzbiFLqjN5S+XBFsePtdSAlvjywyzIgP/cnGnZE4CvOpABRj3pvnNvRiw==
X-Received: by 2002:a05:6402:5188:b0:43e:7a7f:34f7 with SMTP id
 q8-20020a056402518800b0043e7a7f34f7mr7151847edd.406.1660394377994;
        Sat, 13 Aug 2022 05:39:37 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 y16-20020aa7d510000000b00442238ac703sm2912266edq.69.2022.08.13.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 05:39:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] glibc: apply proposed patch from upstream instead of
 revert
Date: Sat, 13 Aug 2022 14:38:48 +0200
Message-Id: <20220813123848.3647980-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220812192725.2600254-1-raj.khem@gmail.com>
References: <20220812192725.2600254-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 12:39:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169304

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...lement-a-useful-version-of-_startup_.patch | 128 ------------------
 .../glibc/glibc/0025-startup-Force-O2.patch   |  28 ++++
 meta/recipes-core/glibc/glibc_2.36.bb         |   2 +-
 3 files changed, 29 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
deleted file mode 100644
index 1982598339..0000000000
--- a/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 18b04419d5984f5c6c89fab5e72fcdd1942491cb Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 7 Aug 2022 12:51:48 +0200
-Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_fatal"
-
-This reverts commit a2a6bce7d7e52c1c34369a7da62c501cc350bc31.
-
-Upstream-Status: Inappropriate [temporary work around]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
- sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
- sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
- 3 files changed, 19 insertions(+), 65 deletions(-)
- delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
- delete mode 100644 sysdeps/unix/sysv/linux/startup.h
-
-diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sysv/linux/i386/startup.h
-index 213805d7d2..67c9310f3a 100644
---- a/sysdeps/unix/sysv/linux/i386/startup.h
-+++ b/sysdeps/unix/sysv/linux/i386/startup.h
-@@ -1,5 +1,5 @@
- /* Linux/i386 definitions of functions used by static libc main startup.
--   Copyright (C) 2022 Free Software Foundation, Inc.
-+   Copyright (C) 2017-2022 Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -16,7 +16,22 @@
-    License along with the GNU C Library; if not, see
-    <https://www.gnu.org/licenses/>.  */
- 
--/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
--#define I386_USE_SYSENTER 0
-+#if BUILD_PIE_DEFAULT
-+/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
-+# define I386_USE_SYSENTER 0
- 
--#include_next <startup.h>
-+# include <sysdep.h>
-+# include <abort-instr.h>
-+
-+__attribute__ ((__noreturn__))
-+static inline void
-+_startup_fatal (const char *message __attribute__ ((unused)))
-+{
-+  /* This is only called very early during startup in static PIE.
-+     FIXME: How can it be improved?  */
-+  ABORT_INSTRUCTION;
-+  __builtin_unreachable ();
-+}
-+#else
-+# include_next <startup.h>
-+#endif
-diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sysv/linux/ia64/startup.h
-deleted file mode 100644
-index 77f29f15a2..0000000000
---- a/sysdeps/unix/sysv/linux/ia64/startup.h
-+++ /dev/null
-@@ -1,22 +0,0 @@
--/* Linux/ia64 definitions of functions used by static libc main startup.
--   Copyright (C) 2022 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
--
--   The GNU C Library is free software; you can redistribute it and/or
--   modify it under the terms of the GNU Lesser General Public
--   License as published by the Free Software Foundation; either
--   version 2.1 of the License, or (at your option) any later version.
--
--   The GNU C Library is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--   Lesser General Public License for more details.
--
--   You should have received a copy of the GNU Lesser General Public
--   License along with the GNU C Library; if not, see
--   <https://www.gnu.org/licenses/>.  */
--
--/* This code is used before the TCB is set up.  */
--#define IA64_USE_NEW_STUB 0
--
--#include_next <startup.h>
-diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/startup.h
-deleted file mode 100644
-index 39859b404a..0000000000
---- a/sysdeps/unix/sysv/linux/startup.h
-+++ /dev/null
-@@ -1,39 +0,0 @@
--/* Linux definitions of functions used by static libc main startup.
--   Copyright (C) 2017-2022 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
--
--   The GNU C Library is free software; you can redistribute it and/or
--   modify it under the terms of the GNU Lesser General Public
--   License as published by the Free Software Foundation; either
--   version 2.1 of the License, or (at your option) any later version.
--
--   The GNU C Library is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--   Lesser General Public License for more details.
--
--   You should have received a copy of the GNU Lesser General Public
--   License along with the GNU C Library; if not, see
--   <https://www.gnu.org/licenses/>.  */
--
--#ifdef SHARED
--# include_next <startup.h>
--#else
--# include <sysdep.h>
--
--/* Avoid a run-time invocation of strlen.  */
--#define _startup_fatal(message)                                         \
--  do                                                                    \
--    {                                                                   \
--      size_t __message_length = __builtin_strlen (message);             \
--      if (! __builtin_constant_p (__message_length))                    \
--        {                                                               \
--          extern void _startup_fatal_not_constant (void);               \
--          _startup_fatal_not_constant ();                               \
--        }                                                               \
--      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),           \
--                             __message_length);                         \
--      INTERNAL_SYSCALL_CALL (exit_group, 127);                          \
--    }                                                                   \
--  while (0)
--#endif  /* !SHARED */
diff --git a/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch b/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
new file mode 100644
index 0000000000..1f3426295a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-startup-Force-O2.patch
@@ -0,0 +1,28 @@
+From 5e635e5dc7d1b21a78f38109d4f43a03bec865c8 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sun, 7 Aug 2022 12:51:48 +0200
+Subject: [PATCH] startup: Force -O2
+
+Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=29249]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ sysdeps/unix/sysv/linux/startup.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/startup.h
+index 39859b404a..e1fc1b682d 100644
+--- a/sysdeps/unix/sysv/linux/startup.h
++++ b/sysdeps/unix/sysv/linux/startup.h
+@@ -21,6 +21,11 @@
+ #else
+ # include <sysdep.h>
+ 
++# if !defined __OPTIMIZE__ || __OPTIMIZE__ < 2
++/* Force to fold strlen.  */
++#  pragma GCC optimize(2)
++# endif
++
+ /* Avoid a run-time invocation of strlen.  */
+ #define _startup_fatal(message)                                         \
+   do                                                                    \
diff --git a/meta/recipes-core/glibc/glibc_2.36.bb b/meta/recipes-core/glibc/glibc_2.36.bb
index 6ccb392f09..1cfa8101ef 100644
--- a/meta/recipes-core/glibc/glibc_2.36.bb
+++ b/meta/recipes-core/glibc/glibc_2.36.bb
@@ -50,7 +50,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
-           file://0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
+           file://0025-startup-Force-O2.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.37.2


