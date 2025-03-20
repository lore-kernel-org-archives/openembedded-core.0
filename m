Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC06FC36001
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 19:36:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.3926.1742499370274733844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 12:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OlrMWi7Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225b5448519so23780345ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742499369; x=1743104169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZM56yao1ghA49QGDDcahIbeTuTQnsKuTSG/zadw/kU=;
        b=OlrMWi7YQGc3V6mJJgN7jUuYK1978R7e2Ua/b6iBfUoVw3fYM7S0YupoJdA/Kg3f3/
         ZQouhCbkH7l/r3zN7zI2ylZGkzu6omWDbX9E+6wS/z/YZHxvdPuMXlAM1X8KFRw3wa8S
         z05BakyCrf9A09cvvQ2fjo7O7KaN9yfRbdEm2a+n4HSdPlMwxMDQ9MjftgzwCHt8ApKR
         ksWv3JIW5DN3+gPO2FPE8YqVWGnuNecE6LFUGLj0E8l5rEfZQHro19tlRRld9YnI+qUl
         U55cwn21kZ4ZO/etn0uE9mBR0qY+zvm5lLRSXJ1bqEOepycLhl24ZESmyJ9jdqEZRa6V
         aoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499369; x=1743104169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZM56yao1ghA49QGDDcahIbeTuTQnsKuTSG/zadw/kU=;
        b=dXTdQgcjCCUBRu1mop40D/vU5ok/SERTqp2DHupmihBIa4mhpe4SfnEvJwWKCdZNkO
         PIbwH1B33JqdXPdpi5XJNx60+Km63ZIYbRkzyKtV3NbCrUF5AB0GZ10NetqLigsAK6OL
         tbeU8LZiQI8BmiCedFksAq98dqdhbMoZlKYrcYu2X59XbByY5FuU+MSBo1VrIYU10EPR
         +doDlJrtXDTkARvSfwAd04zPP+xmQ7nVzD7VcFmNrtiUG/UuzK6+UpbPLle29ZOwSkQi
         QdRimC0wGqPtvi05lQtWyfSsNYWTAn6Xx1Sb8fP+KdwPrqz/wgZ3t1UFR3XXXbGV6wCS
         uu0w==
X-Gm-Message-State: AOJu0YyWbwWk32/L1gIDbNgLmv3jkF+WodmgUwUiCB1ytozUJiPKdH1I
	HZFZAZkFx6UyUhi8AeNM8Zyp/cdLounTZtBmfc9Fsj1wOkiWbjLQKm2KxPsT
X-Gm-Gg: ASbGncvzusv6cc+NUXGtRvVyl/0KPQb+joTXG3CWuch65AcdvQ4ICF1oGUFJi853H9n
	8MhGDFdoNehrR4OKCLKywBtCwFWhOk9ZJ2HyYn90bTtasBiPrnauwf1qGCPALhHSAn8taXIRPqc
	KIt4R0LIIjnh4D0a00SWGEpScHvMPdjrhSMFHlidhI7P/XB/BKH8g77kthvJswqEyM9bOrVqEiI
	7CNwPqDJ6zZciTLw/y2U4fs+JffbQlTzMnblaGl7KWdVV17hOjxwVJqDpXNsTSTu+ep7A3hkLn0
	y3cTKZlIsV320vwW85StYCcrXR7vKSdCy2H2
X-Google-Smtp-Source: AGHT+IEYsYY7mOTdASuzoN1k9KP95gGiLJbBrcjfJYsnVz8Ifj1kZG4fnP7pbjhqHrVDOwVZsRnNDQ==
X-Received: by 2002:a05:6a00:2e26:b0:734:b136:9c39 with SMTP id d2e1a72fcca58-73905a13a5emr852588b3a.19.1742499369142;
        Thu, 20 Mar 2025 12:36:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fab1aesm203796b3a.36.2025.03.20.12.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:36:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 2/2] man-db: Fix musl build with NLS
Date: Thu, 20 Mar 2025 12:36:05 -0700
Message-ID: <20250320193605.1469436-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320193605.1469436-1-raj.khem@gmail.com>
References: <20250320193605.1469436-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 19:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213428

_nl_msg_cat_cntr is not defined in libintl on musl systems
therefore add configure time check for it and use it to guard
the use of _nl_msg_cat_cntr

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v5: Change status of patch to Backport as its in upstream now

 ...ck-for-_nl_msg_cat_cntr-in-configure.patch | 61 +++++++++++++++++++
 meta/recipes-extended/man-db/man-db_2.13.0.bb |  4 +-
 2 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch

diff --git a/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch b/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
new file mode 100644
index 00000000000..feef52b11c8
--- /dev/null
+++ b/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
@@ -0,0 +1,61 @@
+From ea00e32a87cc733dd5aa05cef407a5bee3e6db29 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Mar 2025 22:42:45 -0700
+Subject: [PATCH] check for _nl_msg_cat_cntr in configure
+
+_nl_msg_cat_cntr is not available in all implementations e.g. musl libintl
+does not have it, therefore add a check to detect it and use it only if
+it is found.
+
+Upstream-Status: Backport [https://gitlab.com/man-db/man-db/-/commit/7430ca617b5cee3d4420da3158382c5ffbc3e77d]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac        | 9 +++++++++
+ include/manconfig.h | 6 ++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -404,6 +404,15 @@ AC_TYPE_PID_T
+ AC_TYPE_UID_T
+ AC_TYPE_SIZE_T
+ 
++dnl _nl_msg_cat_cntr is required for GNU gettext
++AC_MSG_CHECKING([for _nl_msg_cat_cntr])
++AC_LINK_IFELSE([AC_LANG_PROGRAM(
++	[[#include <libintl.h>
++	extern int _nl_msg_cat_cntr;]],
++	[[++_nl_msg_cat_cntr;]])],
++	AC_MSG_RESULT([yes]); AC_DEFINE([HAVE_NL_MSG_CAT_CNTR], [], [_nl_msg_cat_cntr from GNU Gettext]),
++	AC_MSG_RESULT([no]))
++
+ # Check for pipeline library.
+ PKG_CHECK_MODULES([libpipeline], [libpipeline >= 1.5.0])
+ 
+--- a/include/manconfig.h
++++ b/include/manconfig.h
+@@ -24,6 +24,8 @@
+ #ifndef MANCONFIG_H
+ #define MANCONFIG_H
+ 
++#include "config.h"
++
+ /* STD_SECTIONS must contain all of your man hierarchy subdirectories. The
+    order is important. Manual pages will be displayed in this order. Ie
+    if "1" comes before "2", then a kill(1) will be displayed in preference to
+@@ -138,13 +140,13 @@
+ #define UNLIKELY(cond) __builtin_expect ((cond), 0)
+ 
+ /* GNU gettext needs to know when the locale changes. This macro tells it. */
+-#ifdef ENABLE_NLS
++#ifdef HAVE_NL_MSG_CAT_CNTR
+ extern int _nl_msg_cat_cntr;
+ #  define locale_changed()                                                    \
+ 	  do {                                                                \
+ 		  ++_nl_msg_cat_cntr;                                         \
+ 	  } while (0)
+-#else /* !ENABLE_NLS */
++#else /* !HAVE_NL_MSG_CAT_CNTR */
+ #  define locale_changed()
+ #endif /* ENABLE_NLS */
+ 
diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index f28bd4a9265..2bc36a9aca0 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://flex.patch \
+           file://0001-check-for-_nl_msg_cat_cntr-in-configure.patch \
            file://99_mandb \
           "
 SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
@@ -17,9 +18,6 @@ DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
 PACKAGE_WRITE_DEPS += "base-passwd"
 
-# | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
-USE_NLS:libc-musl = "no"
-
 inherit gettext pkgconfig autotools systemd
 
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"

