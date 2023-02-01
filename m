Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F856C636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:42 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.24366.1675260872242944363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=G2Wwftt1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id g9so10621375pfk.13
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcvkmvDUNapSVND1BEJ/gqCedXvRqHw23AVqCZEE/fg=;
        b=G2Wwftt1taDuxTQpXL0OAaUBqFhAdicpmJ00D0xINWTQi4gexiFzPKWdhm+BiIZb0x
         gEQLNrtusOtStFWkapM/CDLuu9TVwF6rrmD3v41ilVx4gvf3O7DOJdRx7dAtSKQhlCyi
         1p/B6e0kiyvqzpbWMCNaWA4kT9nguuPElqLG/ldMwcUYk4f52xj6Yf6YWWg9vclmGB19
         jo8uqzoEU1kf36uX0scnB+I43D6lVlefrzF0hbL6/ql962DOYWfeUtK4y4qONK8Bacap
         orMsD/Ofj62BDXHwYRXueEPtSWaW4yBVYcD5j1c689ICPyCfnPGSKhy2scaU85uInbab
         BBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcvkmvDUNapSVND1BEJ/gqCedXvRqHw23AVqCZEE/fg=;
        b=E7/VwFCi/oPmOJO4DIvyJIxI8VGotX7SmuiImETKIkxQl8HBNAwaKVbR2HY32awPe8
         NYBXb3STAPASN0WdFMo/0sY4JpDdPERn34JN1xd4uN+zq6Hj+Nh/ChbqZQlwNK25Mxc5
         g2oi+YgxY+Ze47ueqh/zDmNgMbL/xSjthsBdX6uA0HRe00QufPums1vbxMPZAXmI5g4z
         cfmjE9giU6s/aVEEwifZlrrqD7k0dqYqUF5/aeoql4hhBmG7cLK7LfRf6ddOvcnrMj5F
         iYvfsep/42hcA+GwTX2ToLaztU8jJills2psY57cfi97YNOHngHshey9Axu4XszjSCEQ
         h/Rw==
X-Gm-Message-State: AO0yUKXCSIGdm/P/OODLabezCcFY/aI+LVzQOLjaoeSlEaRuyCVtj8oZ
	Tl67tCvD4lQdsAIcrC2dkvpRc5N+PCLrZY7iRWw=
X-Google-Smtp-Source: AK7set+x5JQryhJFacq5YO1HWlFK5hLYW9Z/7HfCF0CVsXi8Ztv6tbvQ2ND2rMTiQPOaNRK6gOGctQ==
X-Received: by 2002:a05:6a00:1995:b0:593:da8:6f34 with SMTP id d21-20020a056a00199500b005930da86f34mr2820848pfl.5.1675260871127;
        Wed, 01 Feb 2023 06:14:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/17] libusb1: Link with latomic only if compiler has no atomic builtins
Date: Wed,  1 Feb 2023 04:13:53 -1000
Message-Id: <f66b0fd1ba7c017e9db7bb94d767d8becb41a455.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176550

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
2.25.1


