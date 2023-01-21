Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9A8C38141
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 01:23:52 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.2540.1674264231088725225
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 17:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ChQ5ol6u;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9so6773911pll.9
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 17:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4W2ihy6qhe91Xc5tRqrO0VeCj2xDVq67FqsTP+rBwc=;
        b=ChQ5ol6udZ/swEOFq34e77O3pIf/JvecD5KnyIRYunKcfGKWETA77h5VPBIQbnjGt2
         j7OjsrBBPpxYM4+dBziNcORJgofRDaqI8NOtpp9v7JcD9rcFoabOhcIUexGkX4d/w8pM
         x3fcIYVZ/IYv+bpkgRwc5dvDbVXxki0BRg1qB9T8RV46A9+U0pk1i0+g2/u1l88EPq7M
         z0X2XMSz8WfeChbC2y4PlmkqAxpYhM3T3CS/f0/0yB6z8FNvjEAQCTCFdkLJ5tBHgh7F
         zha905Dz86PYaAo8PIPAYlsbIuT8F7PpCVQfskEC+6n/xBlA1rtsazElO+dnoEVic9Zc
         c0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4W2ihy6qhe91Xc5tRqrO0VeCj2xDVq67FqsTP+rBwc=;
        b=0f8u2O8wDdKzCZvDUeBrWVjyH3jrB59o3kUvwxPA29pcuyohxtnAmZ8IYa5Yp7DNIj
         ilsVC/lxGLXXy2txMcAVxBfvH3po2sfY3L4OhaToTqlY71is3P/zqfb2P2HR4kImonzi
         XfFxSQGRyv8Vm2QFIiVtmRMgnR7RSQgNkCPcKv5ifAKMpGNmSVQ7iUokfFjzzKyP6kuX
         kKWdi33nPs0RIZBsH0jJp8EGh6R/FqXRQOoVgiXhtzNbM4UA5F2wwPaO4PX2vBsESa5D
         Zv80vX4+AMrburMnIXwbw3vyOErZDM9Lwcjm9L9Qx10lnv0AlWrtwfW23yzmPRQ6Xkqd
         4B6w==
X-Gm-Message-State: AFqh2krvFA6yOgk0Cf2d4NRDz6h35qXKr5E/idlb9gTsIFgsY1tAS2KR
	8VLdIyCnaknCWZrRm0LmT5Um4209xteY5w==
X-Google-Smtp-Source: AMrXdXvGGfBjZAPY9moUkLFiYiqq9n7vZPCc0KJFOiYuSVrVFJLAMmY8+zuEB0mYWpPiDh/yaIaZSw==
X-Received: by 2002:a17:902:ea0a:b0:193:389d:ecc5 with SMTP id s10-20020a170902ea0a00b00193389decc5mr24003377plg.47.1674264229987;
        Fri, 20 Jan 2023 17:23:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902bd0500b0017f756563bcsm14229235pls.47.2023.01.20.17.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 17:23:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libusb1: Link with latomic only if compiler has no atomic builtins
Date: Fri, 20 Jan 2023 17:23:45 -0800
Message-Id: <20230121012346.2967570-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jan 2023 01:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176253

This makes build use compiler to decide from where to get atomics
instead of assuming that it should always come from libatomic, helps
sharing build artifacts with OSes which may not have libatomic installed
because it is not required on those hosts.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...k-with-latomic-only-if-no-atomic-bui.patch | 46 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.26.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch

diff --git a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
new file mode 100644
index 0000000000..3c223e0822
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
@@ -0,0 +1,46 @@
+From 95e601ce116dd46ea7915c171976b85ea0905d58 Mon Sep 17 00:00:00 2001
+From: Lonnie Abelbeck <lonnie@abelbeck.com>
+Date: Sun, 8 May 2022 14:05:56 -0500
+Subject: [PATCH] configure.ac: Link with -latomic only if no atomic builtins
+
+Follow-up to 561dbda, a check of GCC atomic builtins needs to be done
+first.
+
+I'm no autoconf guru, but using this:
+https://github.com/mesa3d/mesa/blob/0df485c285b73c34ba9062f0c27e55c3c702930d/configure.ac#L469
+as inspiration, I created a pre-check before calling AC_SEARCH_LIBS(...)
+
+Fixes #1135
+Closes #1139
+Upstream-Status: Backport [https://github.com/kraj/libusb/commit/95e601ce116dd46ea7915c171976b85ea0905d58]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac          | 16 +++++++++++++++-
+ libusb/version_nano.h |  2 +-
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -153,7 +153,21 @@ if test "x$platform" = xposix; then
+ 	AC_SEARCH_LIBS([pthread_create], [pthread],
+ 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
+ 		[], [])
+-	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
++	dnl Check for new-style atomic builtins. We first check without linking to -latomic.
++	AC_MSG_CHECKING(whether __atomic_load_n is supported)
++	AC_LINK_IFELSE([AC_LANG_SOURCE([[
++	#include <stdint.h>
++	int main() {
++		struct {
++			uint64_t *v;
++		} x;
++		return (int)__atomic_load_n(x.v, __ATOMIC_ACQUIRE) &
++		       (int)__atomic_add_fetch(x.v, (uint64_t)1, __ATOMIC_ACQ_REL);
++	}]])], GCC_ATOMIC_BUILTINS_SUPPORTED=yes, GCC_ATOMIC_BUILTINS_SUPPORTED=no)
++	AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_SUPPORTED)
++	if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != xyes; then
++		AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
++	fi
+ elif test "x$platform" = xwindows; then
+ 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
+ else
diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
index 7371faf017..301e60c14f 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
+           file://0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch \
            file://run-ptest \
           "
 
-- 
2.39.1


