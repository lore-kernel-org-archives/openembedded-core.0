Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F41C36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.7180.1742420546082897248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=miSxJEgm;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224100e9a5cso638885ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420545; x=1743025345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdNbFQ2hyGi9eiQzPHoL5ti66A8ek4y5Pkq1M4MENQ0=;
        b=miSxJEgmM5Dz92DDjs7taU4zXAjxxniFBaObJx0WC99YChysGWqbfekcNlOi547xKi
         k6rIBostru0lvzAWii5Mec9YH3XdK4LNYgyC9sVLJDJj23mfH7D8PudpCM31oZnx0m7y
         RdasSMdZsZmukNpTkgoeYppzAqoKiyjX+Mev5M+oGRzwTzTk9mLYmgf4WB52hxpFE1GO
         rE95q9xvEwca3BXt3w/C2DKQb5jntwY0v3Q13+VTv/RxLmwfS0rgM/vCPNkC0e6+nYHB
         NFuYPmyJSXJZe8NuUZ6T8HIXMCcHPMiBlO93jkffYG7cZRNi/cLVBASH93ABLHNZX8OP
         y0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420545; x=1743025345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdNbFQ2hyGi9eiQzPHoL5ti66A8ek4y5Pkq1M4MENQ0=;
        b=ZrDfiWVhZDXln1ltzVqSAaTyyHmp7sK+ztCRnEH4w7mvPwOxOjW36/jRgdpsyzspZf
         orCRTHapYQb5E6bLcWks+HKqXB6ZurqUl62ZiU93R/9VvXzZ3B6KROX4jmn/kVjGhrTN
         cpcJ/aHvDsDjl0ROfHiPqw8q/dVODVMO0xlnl+yIYTdgrlJKvmvQMkU0yE/Rfib68BFx
         F22kZaDu2B7EgFWCYLZJfX78LrsMNBmUEcHjgAJYqOtugBL/qutpl4wcDgAGu+zZc8Z5
         7kipapkWFnOf3pmSfVCfOE8QiVC3UdbdTIIfNJG5JLU1Unz10GpTrlIVi6pik26TgkVJ
         nsTQ==
X-Gm-Message-State: AOJu0YwFODgDeK09k8w1WJ05U2848XZJ43jpe0qhHuZAkYJw4Xw3ZsJ+
	Jm1jWlfO7P67lZ8fG6P6ps+4Rg9nSF0LWtpruZo204wLKiLnYU9vOuFOEewn
X-Gm-Gg: ASbGnctAsvMUvcM0y7GlVF5Br6PvYIfkITikYiPfxrw3yB8+0Eg75GZlYUWSlZPc6TO
	4lNhNO5ZkV8xjP/cojKBZqdTGUM/J7qQR7IEkA3/cWOOcoeAfsCrHfAEZo3nxD0ZZYb5eqfIl+A
	1U76MiavLoShQ2JEKvaajDugNl6/mIB+lkkKLt4P/Xm+BlUb+dsqn3euAUPY9/0UgQUEtVRpLSg
	GoTGM2qjGKqjH3xiLTBpYOPHU6hDeUQi078vvZdDXGyP8PHWCbMNzgsTM6UDAvLxWg+qNzTxqY7
	bNzwfJEJofjMgrEqjXqnN398HUxR3CZp9ndz
X-Google-Smtp-Source: AGHT+IHpuDqmSpHZS0xBveZiY6Fvav/iqbJGvCJPdLmQGifacJuVsOL/q4lk924O1AwylBnZ0PmGEg==
X-Received: by 2002:a17:903:320e:b0:224:1eab:97b5 with SMTP id d9443c01a7336-2265ed68d5dmr14617905ad.1.1742420545224;
        Wed, 19 Mar 2025 14:42:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 9/9] man-db: Fix musl build with NLS
Date: Wed, 19 Mar 2025 14:42:12 -0700
Message-ID: <20250319214213.2505249-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213364

_nl_msg_cat_cntr is not defined in libintl on musl systems
therefore add configure time check for it and use it to guard
the use of _nl_msg_cat_cntr

Add missing dependency on zlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ck-for-_nl_msg_cat_cntr-in-configure.patch | 61 +++++++++++++++++++
 meta/recipes-extended/man-db/man-db_2.13.0.bb |  4 +-
 2 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch

diff --git a/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch b/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
new file mode 100644
index 00000000000..09ff221d4a4
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
+Upstream-Status: Submitted [https://gitlab.com/man-db/man-db/-/merge_requests/13]
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
index a6ac82e6628..12debfa30d6 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://flex.patch \
+           file://0001-check-for-_nl_msg_cat_cntr-in-configure.patch \
            file://99_mandb \
           "
 SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
@@ -18,9 +19,6 @@ RDEPENDS:${PN} += "base-passwd"
 RDEPENDS:${PN}:append:libc-glibc = " util-linux-col"
 PACKAGE_WRITE_DEPS += "base-passwd"
 
-# | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
-USE_NLS:libc-musl = "no"
-
 inherit gettext pkgconfig autotools systemd
 
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}"

