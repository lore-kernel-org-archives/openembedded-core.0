Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AB3C63797
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.105.1675289804679891149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wLfneUlT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id n2so13632470pfo.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=autNiWTotri+RjMuqcxvSF/CMC/9d70WwTRZz8ApPNk=;
        b=wLfneUlTU1a486zGNTFK5IVxtdxs9QQAblV9cFqhwkvbc8FpdojECqAQubk2jFdsp3
         OQnUwBuzhtimv2YSouiYPxY+Eb7tOmVV1P9nlW1kwuOtFsntnobL6lXmLHuxoqLLShge
         xYlNto+qAGcSqGJu3IWxRLalEsQLV7wBiqOCxXVyz/JoA0M+LocHXL0KnFKni0iD+vsR
         ilgaHAGh9RahKC8bu9ShRmjt35bJFjtMcgZHtHuke1GL2Ot8Cc4hkiLSuW+afVX8lqZG
         4EJMXgMjTmjFmoK07VHCexFXr9hCPdRoqkCnLx2OORL2HGH3Vka1oWNHvtGa+DRHQa3l
         wdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=autNiWTotri+RjMuqcxvSF/CMC/9d70WwTRZz8ApPNk=;
        b=d8/Ni4zQn0au31JphxhsqzfBnYMMMfagGExLH7qMAH0YlNLthNvDJUEas/DvltBWUn
         LUFnjGhp7VzCyelK/ScVG/AH6w1pUgmZUtg3NT7RyP5o8IbtNye2ukr0DAj0H3CKnici
         yOEd3WWXGFiA9fC+tkPvYH2t9nWjD97ZWfWcapQ+fl2HRgzX51fN8LxOdnOo03an4bst
         RRDHEAg3mHAVjW8SSOznbLjf/8MBnluI71KFYBu7AyIAwLq5/FHk+MiAbS6CYuLIYciC
         A+yWMXVSqIhoxBV3nCF+YGynFpfe6sudXhFScopfu+kL2hrlx3p7Mi6BFX3oT7tZ+aZH
         XkTw==
X-Gm-Message-State: AO0yUKW7MbUauT0oihiyV9gweYnUQX7L4OPQhR9+b8EGAUQ3W9MddIZV
	2mS4ZRKIkc5d2f5it69D7rpWOGKxGoMBGyazC70=
X-Google-Smtp-Source: AK7set9cbBmDmJwEDT8kz5Yf+ffqkajOz5291QZgY2lWSJk+u/g04YuoyaUA0+RW2+rwdloxSr5dKQ==
X-Received: by 2002:aa7:9409:0:b0:594:251f:ffe1 with SMTP id x9-20020aa79409000000b00594251fffe1mr2122980pfo.19.1675289803625;
        Wed, 01 Feb 2023 14:16:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/13] libusb1: Link with latomic only if compiler has no atomic builtins
Date: Wed,  1 Feb 2023 12:16:07 -1000
Message-Id: <c660d75211352a47797c3d400dd504759675a0f6.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176673

From: Khem Raj <raj.khem@gmail.com>

This makes build use compiler to decide from where to get atomics
instead of assuming that it should always come from libatomic, helps
sharing build artifacts with OSes which may not have libatomic installed
because it is not required on those hosts.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a026d9afcbe07a8324ca951ba3439373dcb3771c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index fd63e7adc2..ff3f0be7a5 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV}.tar.bz2 \
+           file://0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch \
            file://run-ptest \
           "
 
-- 
2.25.1


