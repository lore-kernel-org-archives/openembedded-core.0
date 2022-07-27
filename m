Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D96C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 12:00:50 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web08.19008.1658923245204760540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 05:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so17058989fac.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 05:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qWeBIWld+eccg1nnl3JHWDcQdtEtK1qSENiyrRIZMEI=;
        b=4UPfqAIX7ACX5BrdghMdcKsLM6knUKr2muwS0C6BmezhaZS7aPZILMThOBf0yzNOUB
         GTTvXp0Em6rRrFPKN2IHnj0bFe80rGld5TKm47uLVrXrqYPK9Ai5MSSwtXkumTgzHRcb
         axkdi7mUcgOf0iNy60RRbq0EPpiwPtM3FJOBLTqDoPbyE2DjdJ7gy43RwKZMniIK6l1c
         3eleJCubS1Y9XUQX2XM3Q7jOyIQPfZs02xKhQEXZ2lPigUQHekedevUCH7r7MNcRexyH
         ALThhO8yqVVby1zBTDu5oepxIvAv1/zX6FeFD//wl7PpujAlc+2g8LufQCKUEE7g44US
         iZXQ==
X-Gm-Message-State: AJIora81HnQ7qw+bPR6WDtzmz5bNqbik3l54yPoHEKGi2OTGkgGQhxTs
	QGtDA3OgijnLFthSXor3JePAAjM13YpFwA==
X-Google-Smtp-Source: 
 AGRyM1uAT6CYXsnd9qabnBZy00wBz1vmOVKHDJ58obkT40aSipiGxCcPwtlbnbqzsC9p8fsKjtM9jw==
X-Received: by 2002:a05:6870:58a9:b0:10d:7f19:349a with SMTP id
 be41-20020a05687058a900b0010d7f19349amr1862708oab.290.1658923243826;
        Wed, 27 Jul 2022 05:00:43 -0700 (PDT)
Received: from localhost ([2804:d51:59d2:bc00:5dfc:6f17:839f:61a4])
        by smtp.gmail.com with ESMTPSA id
 t134-20020acaaa8c000000b0033a40052fabsm7077298oie.38.2022.07.27.05.00.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 05:00:43 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libusb1: Link with -latomic only if no atomic builtins
Date: Wed, 27 Jul 2022 09:00:36 -0300
Message-Id: <20220727120036.633822-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 12:00:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168559

Backport a fix from 1.0.27 so we only link atomic if no atomic builtins
are available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...k-with-latomic-only-if-no-atomic-bui.patch | 51 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.26.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch

diff --git a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
new file mode 100644
index 0000000000..7c20dc0478
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
@@ -0,0 +1,51 @@
+From a6890a6a9a8f88b567631874e209aaadc79e28e5 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [1.0.27]
+
+Fixes #1135
+Closes #1139
+(cherry picked from commit 95e601ce116dd46ea7915c171976b85ea0905d58)
+---
+ configure.ac | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4f12510..96787500 100644
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
+-- 
+2.37.0
+
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
2.37.0


