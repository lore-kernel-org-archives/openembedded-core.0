Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D19C36003
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2969.1742372208352208012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8dSQ3/S;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so139906705ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372207; x=1742977007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJfhKKk5tXyoAgrACSTBuwSbDibDlnZpMTXJl78eHRI=;
        b=T8dSQ3/SseGdZZO0u6nmUZgEZr/EcPUWdceiHHMkV6wEM1Qvo9IbMHcXTnyOtwDGhI
         xiVv1+mOhfzd7xoHJtoiFk7DoISRnYCMbfgY1VGReaNF7gKSLsUtwirXQMb3Y2dn5Kyb
         44f1Fdig56ZP+h+rGvevscXmJS7R7oMX6GA4lgiODNIRLHjm5gl41bjNyM6404M6w7aH
         /nvHWxff7fi/9dRVKidC4awysBnZG8EuPa7HKMXxpKwSjthjv/zV7YL4fmyorC3+vf82
         Cc6FVHHq8/H8ycS6z7Im3H9EAzR8GcMEo11hNk/I6mFRuFWGIyiH/7vKQT/f2D5higMG
         VmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372207; x=1742977007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJfhKKk5tXyoAgrACSTBuwSbDibDlnZpMTXJl78eHRI=;
        b=AUOLK9fpJDORrhXGNj/+Jej9LUqtOthFd0PyNHbTFBgv9M/y04ly6Qk9k4O1s9lPSQ
         xG5pRGO6r18T/WqFnu0UnT1KLlKnvYcPzEW63pn/XCpYMfRMOZ3xYF/l4X2IliQPGM3s
         fRZUl1XfyKwpXJu4fgq3Vs2ALxRJaJLglmpUw77O2AHeUmQgVKzxDxJe7XlIrYYPwtQ1
         l+3r3jIQsIyDRA32NW/31j7u4LkhHcjpef/EcZiGBVyuCrpan/EIRHmXfhjwpFwbYoIH
         bYWXAy8Ecx2RXxiyN6ibrl9I1X1WJ14jxLpyOStnYGJaTBBgWr4xA+Z5QaoJzJRn2GVT
         VCZg==
X-Gm-Message-State: AOJu0YyjNc0qE3eqVpKnjHZ+iOT0tjOvTrMzPPMtDPdKTv/AKeqHQVWM
	oxWcZpjDf2qRTMJF0zcmX31ek2VXxS40xLGA3al30PQDZXKfZQVSa1sBB8rN
X-Gm-Gg: ASbGnctvUpYhawaCU+gCtmsoZQM90QN3m7m+/MuqpNfi6+i2TCTD1yCI/eMFS5fUWKL
	9MjKiYZthceZkXm6bXf1Ey0XSsMM7BlbPTl8sLArKzGFOLFOBgdBMJ0eVV6LbwdUR6Gg3n2Mj/E
	o4lZrwJE9WNyqMcypwwLNoOaIUBslSYK+2maJ2p6fUDEVTiIzp5OncNcNZAzlO25fb5t+BV6TAm
	tp7Cq4S2TsXKoSp6hBi8u9OIBedUtqm+K02uI55Mt87UxHp04/vzXOhwY/JmdmC164Bh1/izNyx
	NQk2pJ6i6gJmBsMx1Nkd4POWAnTH9ks75NA8
X-Google-Smtp-Source: AGHT+IGcYQtgq4nVgD5FXtDMIgmgo3U8go1ltgbu/Fn0TWXIK+Trpi83HxMDMWvUfBifLxf8BL0hHA==
X-Received: by 2002:a05:6a21:168c:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-1fbeb27ec20mr2985083637.5.1742372207517;
        Wed, 19 Mar 2025 01:16:47 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 27/27] man-db: Fix musl build with NLS
Date: Wed, 19 Mar 2025 01:16:09 -0700
Message-ID: <20250319081610.3536475-41-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213307

_nl_msg_cat_cntr is not defined in libintl on musl systems
therefore add configure time check for it and use it to guard
the use of _nl_msg_cat_cntr

Add missing dependency on zlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ck-for-_nl_msg_cat_cntr-in-configure.patch | 65 +++++++++++++++++++
 meta/recipes-extended/man-db/man-db_2.13.0.bb |  4 +-
 2 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch

diff --git a/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch b/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
new file mode 100644
index 00000000000..3e32a4777d0
--- /dev/null
+++ b/meta/recipes-extended/man-db/files/0001-check-for-_nl_msg_cat_cntr-in-configure.patch
@@ -0,0 +1,65 @@
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
+diff --git a/configure.ac b/configure.ac
+index bf4628ef..140b4b62 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -404,6 +404,15 @@ AC_TYPE_PID_T
+ AC_TYPE_UID_T
+ AC_TYPE_SIZE_T
+ 
++dnl _nl_msg_cat_cntr is required for GNU gettext
++AC_MSG_CHECKING([for _nl_msg_cat_cntr])
++AC_LINK_IFELSE([AC_LANG_PROGRAM(
++	[#include <libintl.h>
++	extern int _nl_msg_cat_cntr;],
++	[++_nl_msg_cat_cntr;])],
++	AC_MSG_RESULT([yes]); AC_DEFINE([HAVE_NL_MSG_CAT_CNTR], [], [_nl_msg_cat_cntr from GNU Gettext]),
++	AC_MSG_RESULT([no]))
++
+ # Check for pipeline library.
+ PKG_CHECK_MODULES([libpipeline], [libpipeline >= 1.5.0])
+ 
+diff --git a/include/manconfig.h b/include/manconfig.h
+index 62baa184..eb4e5eb1 100644
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

