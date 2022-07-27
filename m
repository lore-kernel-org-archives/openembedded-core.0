Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D5AC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 16:56:01 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web12.22148.1658940952996421985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so23266854fac.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CDWX9a5llo0EtwAv+z2m1rbCh5mUjXgss9Q7Lya+LVE=;
        b=HINENTVX5AuqhOxR8JNp8nPkkfQ/HtMvC22D76G0jzzLL3D6uF2wx7DMXly3gqqhXX
         AjOswD61lU88kFAbhdVg5rD2Nc7wGcRJOGZ5xuNvXDfTpYdzK17LQR6VSj0PegkWvjYW
         ReyIN4B1Wy4Z9a3I5Io9xHnnH5slC1gxiuyi8dL8ntMHCmPBqkVrQvueUfoRQMLFP9rv
         ErnrJLyE8zDEp+2bzyI+ZphuRwDOlxd3Y5mljcemELU78SMyyAKN4cKYFwl5TNVyRf0r
         idr5DV+AntAjvfGkQSOPMwL22Xnar0itSnraj82mk2p6m9wGgTBq5xvm8oCRSP9bFQHy
         LguA==
X-Gm-Message-State: AJIora+Mo2fhhM8aaI9tg0E1R8gkJYnRfrrL1wrl0k9Fl7kTIxygfbqx
	KRC8s1a9BEr/tZqy12W+z93Et4e4+gE34g==
X-Google-Smtp-Source: 
 AGRyM1t7CuM/buEIknT/5mb8WoS/pXuN9KlTmUfvkTPD2uK/FnvYoNYpPgmdhHvajgq3mYRH9im9Qg==
X-Received: by 2002:a05:6870:b520:b0:10d:758e:678e with SMTP id
 v32-20020a056870b52000b0010d758e678emr2710869oap.101.1658940950485;
        Wed, 27 Jul 2022 09:55:50 -0700 (PDT)
Received: from localhost ([2804:d51:59d2:bc00:5dfc:6f17:839f:61a4])
        by smtp.gmail.com with ESMTPSA id
 b17-20020a056808011100b0033a9f4c13cesm7375786oie.13.2022.07.27.09.55.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 09:55:50 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libusb1: Link with -latomic only if no atomic builtins
Date: Wed, 27 Jul 2022 13:55:39 -0300
Message-Id: <20220727165539.658218-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 16:56:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168579

Backport a fix from 1.0.27 so we only link atomic if no atomic builtins
are available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- add signed-off-by

 ...k-with-latomic-only-if-no-atomic-bui.patch | 53 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.26.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch

diff --git a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
new file mode 100644
index 0000000000..5c49cbb8a7
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
@@ -0,0 +1,53 @@
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
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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


