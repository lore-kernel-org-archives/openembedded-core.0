Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1575C54E5F
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:20 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.14868.1709739733603207693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Alzsli+t;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3f893ad5f4so1018810966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739732; x=1710344532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=audhK3F/Ym7me8XU9+HfiTnvwOx1pL+7coRsCqE47/4=;
        b=Alzsli+taDz1joIfudWW9X4fjQxy/fDblujrWLlEIU7NdX7xCF1CurzUQ29L2L080p
         /ZA4TbxdHya/WCal6G+hDbUk3la/nD1mcOHgBoNrxk0Miqo8VmsPXO0DhJC0hO2CjYrp
         VQumM0Z18A5A2WoJuv4Bzaw7Li7n8316YnWVySMGT3EA+Gb4TV5YGTWXmdRNlKhPRmde
         jrgTfwsBbwvlLZsnMuGBATvtpmri2P9Adgr9BfPNdsLGnKc2yfGq87aJlKyXNAazkkcR
         PqyL6w9MDavoPtrIRNA63E/n9ypB+vlsOryGf+OSFPjFkL9PMvvPuoHt2xuKnbLfP7qB
         jfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739732; x=1710344532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=audhK3F/Ym7me8XU9+HfiTnvwOx1pL+7coRsCqE47/4=;
        b=whLehNFzU1eVzpHcYqvbhP54HfLJESL3S24GjgiwMScFyjniJSRh5R8Wy8y2aTBJif
         QW5kYJAwtZuSH5TUWWcYLrbafY14+9qhTCjm4g8uzznI0OU4MbM6D5OVWaPxUw4OK5BY
         6JmKhTky7xfQSFkexQPwiNWDoYFtaaWV/futgDy5DFt/vHaIWLxkq6Erl16vfPEpNt6a
         lOjNnfQpQKq3r2MML8TmetZBYRcCTXO7Grf06gspR/AIAGE/MzBRcu/MCCzzOMyeQGL4
         ZOiPtTQulss2XWMWQDPHbUELRJKwjMoXSKIzBMf6GFPGny25bYwLU2uC4OY2oMOBeVd4
         2nzQ==
X-Gm-Message-State: AOJu0YzSmaoGLD8LL0+R8s3fpoGB0iLS61CzjSWQVdgR2fdtvBq1AIS+
	2AqpNTCic925XY4HlG6lTnEyeKhoAIWIP1HwFINy/oyBBAL0fuH2vTiA8Tib
X-Google-Smtp-Source: AGHT+IE16wwoTZB9P/ncjrN+k616JLD2pyq0Xr/W1ME/xXM6685zNjSw2VsSGD+Il7gWf4OgWIx2DA==
X-Received: by 2002:a17:906:714f:b0:a44:5515:3b48 with SMTP id z15-20020a170906714f00b00a4455153b48mr10521534ejj.14.1709739731811;
        Wed, 06 Mar 2024 07:42:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/47] libusb1: upgrade 1.0.26 -> 1.0.27
Date: Wed,  6 Mar 2024 16:41:25 +0100
Message-Id: <20240306154151.3741709-21-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196703

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...k-with-latomic-only-if-no-atomic-bui.patch | 46 -------------------
 .../{libusb1_1.0.26.bb => libusb1_1.0.27.bb}  |  7 ++-
 2 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
 rename meta/recipes-support/libusb/{libusb1_1.0.26.bb => libusb1_1.0.27.bb} (83%)

diff --git a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
deleted file mode 100644
index 3c223e0822f..00000000000
--- a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 95e601ce116dd46ea7915c171976b85ea0905d58 Mon Sep 17 00:00:00 2001
-From: Lonnie Abelbeck <lonnie@abelbeck.com>
-Date: Sun, 8 May 2022 14:05:56 -0500
-Subject: [PATCH] configure.ac: Link with -latomic only if no atomic builtins
-
-Follow-up to 561dbda, a check of GCC atomic builtins needs to be done
-first.
-
-I'm no autoconf guru, but using this:
-https://github.com/mesa3d/mesa/blob/0df485c285b73c34ba9062f0c27e55c3c702930d/configure.ac#L469
-as inspiration, I created a pre-check before calling AC_SEARCH_LIBS(...)
-
-Fixes #1135
-Closes #1139
-Upstream-Status: Backport [https://github.com/kraj/libusb/commit/95e601ce116dd46ea7915c171976b85ea0905d58]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac          | 16 +++++++++++++++-
- libusb/version_nano.h |  2 +-
- 2 files changed, 16 insertions(+), 2 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -153,7 +153,21 @@ if test "x$platform" = xposix; then
- 	AC_SEARCH_LIBS([pthread_create], [pthread],
- 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
- 		[], [])
--	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
-+	dnl Check for new-style atomic builtins. We first check without linking to -latomic.
-+	AC_MSG_CHECKING(whether __atomic_load_n is supported)
-+	AC_LINK_IFELSE([AC_LANG_SOURCE([[
-+	#include <stdint.h>
-+	int main() {
-+		struct {
-+			uint64_t *v;
-+		} x;
-+		return (int)__atomic_load_n(x.v, __ATOMIC_ACQUIRE) &
-+		       (int)__atomic_add_fetch(x.v, (uint64_t)1, __ATOMIC_ACQ_REL);
-+	}]])], GCC_ATOMIC_BUILTINS_SUPPORTED=yes, GCC_ATOMIC_BUILTINS_SUPPORTED=no)
-+	AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_SUPPORTED)
-+	if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != xyes; then
-+		AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
-+	fi
- elif test "x$platform" = xwindows; then
- 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
- else
diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.27.bb
similarity index 83%
rename from meta/recipes-support/libusb/libusb1_1.0.26.bb
rename to meta/recipes-support/libusb/libusb1_1.0.27.bb
index 2af6fcdea79..f2431d75c89 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.27.bb
@@ -11,14 +11,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
-           file://0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch \
            file://run-ptest \
-          "
+           "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
+SRC_URI[sha256sum] = "ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575"
 
 S = "${WORKDIR}/libusb-${PV}"
 
@@ -41,7 +40,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-    install -m 755 ${B}/tests/.libs/stress ${D}${PTEST_PATH}
+    install -m 755 ${B}/tests/stress ${D}${PTEST_PATH}
 }
 
 FILES:${PN} += "${base_libdir}/*.so.*"
-- 
2.39.2


