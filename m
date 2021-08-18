Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.57256.1629305437134383170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YwDYX6AU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id r7so4619234wrs.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u8YuM3DX/QcQRFAFPaKinhHp+bPYN7aqBG+lGZ4x/9Q=;
        b=YwDYX6AUrZzIu7E8EvP6rJf3mndTs0G3elPfgesF9/0O7CmzrjgwpLuoEeOmTcdUS7
         w0dWOkVcixtNVx/6FQNGo8LQ3rzP6+bRlzXlbzdHLp76fFkXXO1ur2ekB9sMhZS6PjxC
         daiX2XSB8SOOInTNKFSiQ5RXxQZyFMsGGkI3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u8YuM3DX/QcQRFAFPaKinhHp+bPYN7aqBG+lGZ4x/9Q=;
        b=iVShDYrFNKl71VuP6fO/r7v4uypi+rQQ0JT9eP/J2JSlflXZUm6IlXNK0OHRE46E/X
         Az2KygteG6cZ53G5ebpMM8dynfDYB84VHKBr5xW5DCArX2YQiqA4ZrZQ4INpDpj1CnMb
         6dBmO/FxxzozTrQSdzkZGyQn4nrDzCK/AQlouzbRDZ1HJko8pIVdf7rC1imwCBcVjDvP
         A1w0HjqsumX91D8Mn51FRXEoXvBWh005Pj9nT0qK+VVN5wUYNhRPmPpmYcxdhGZ30Vx1
         E1umFSM0iRx1e2cFmyDFvYqIA1nvNim3Iu6/eGM9kInXlSxCYXIC+LEQd+wd98W79BWv
         crEA==
X-Gm-Message-State: AOAM533NugbDvKeNx+bqsqNDIUZ690qW8oVbvYmSeJRMtgTCkpkxj22B
	KSI0cD5Vs2QOb1i9FCLXVKqhvhpq8Yr9Ew==
X-Google-Smtp-Source: ABdhPJyNqSzCVwQxj8H3qEnkXtb1EjOGBfhhEK6C695kKMd8ayRAQ03prFtADjrjuXxWAnn1CeDvgw==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr11796451wrr.49.1629305435668;
        Wed, 18 Aug 2021 09:50:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id z126sm343363wmc.11.2021.08.18.09.50.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:50:35 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] pseudo: Fix to work with glibc 2.34 systems
Date: Wed, 18 Aug 2021 17:50:32 +0100
Message-Id: <20210818165033.3935964-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The merge of libdl into libc in glibc 2.34 causes problems for pseudo. Add a fix
that works around this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/glibc234.patch               | 86 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/glibc234.patch

diff --git a/meta/recipes-devtools/pseudo/files/glibc234.patch b/meta/recipes-devtools/pseudo/files/glibc234.patch
new file mode 100644
index 00000000000..86fad5a3def
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/glibc234.patch
@@ -0,0 +1,86 @@
+pseudo_wrappers/pseudo_util: Add versioning to dl* symbols to work with glibc 2.34
+
+From glibc 2.34 onwards, libdl is merged into libc. We need to work with libaries
+linked with older libc and newer ones without requiring glibc 2.34 to be linked
+in. To do this, use an older verison of the symbols. Sadly this is highly arch
+specific.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/pseudo_util.c
+===================================================================
+--- git.orig/pseudo_util.c
++++ git/pseudo_util.c
+@@ -28,6 +28,11 @@
+ #include "pseudo.h"
+ #include "pseudo_ipc.h"
+ #include "pseudo_db.h"
++#include "pseudo_dlsymvers.h"
++
++#if defined(__GLIBC__)
++__asm__(".symver dlsym,dlsym@GLIBC_" DLSYMVER);
++#endif
+ 
+ struct pseudo_variables {
+ 	char *key;
+Index: git/pseudo_wrappers.c
+===================================================================
+--- git.orig/pseudo_wrappers.c
++++ git/pseudo_wrappers.c
+@@ -28,6 +28,7 @@
+ 
+ /* include this to get PSEUDO_PORT_* definitions */
+ #include "pseudo.h"
++#include "pseudo_dlsymvers.h"
+ 
+ /* used for various specific function arguments */
+ #include <dirent.h>
+@@ -122,6 +123,12 @@ pseudo_reinit_libpseudo(void) {
+ 	_libpseudo_init();
+ }
+ 
++#if defined(__GLIBC__)
++__asm__(".symver dlerror,dlerror@GLIBC_" DLSYMVER);
++__asm__(".symver dlvsym,dlvsym@GLIBC_" DLVSYMVER);
++__asm__(".symver dlsym,dlsym@GLIBC_" DLSYMVER);
++#endif
++
+ static void
+ pseudo_init_one_wrapper(pseudo_function *func) {
+ 	int (*f)(void) = (int (*)(void)) NULL;
+Index: git/pseudo_dlsymvers.h
+===================================================================
+--- /dev/null
++++ git/pseudo_dlsymvers.h
+@@ -0,0 +1,30 @@
++/*
++ * Copyright (c) 2021 Richard Purdie
++ *
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ */
++
++/* We need to use the older symbols in libdl.so rather than the newer ones
++   merged into libc.so in glibc 2.34 onwards since libpseudo needs to link/work
++   with newer libcs and bianries compiles with older ones */
++
++#if defined(__GLIBC__) 
++#if defined(__aarch64__)
++#define DLSYMVER "2.17"
++#define DLVSYMVER "2.17"
++#elif defined(__x86_64__)
++#define DLSYMVER "2.2.5"
++#define DLVSYMVER "2.2.5"
++#elif defined(__arm__)
++#define DLSYMVER "2.4"
++#define DLVSYMVER "2.4"
++#elif defined(__mips__)
++#define DLSYMVER "2.0"
++#define DLVSYMVER "2.2"
++#else
++#define DLSYMVER "2.0"
++#define DLVSYMVER "2.1"
++#endif
++#endif
++
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index dacaef1a66b..c7684f00cbd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://glibc234.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.30.2

