Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353E6CE7A86
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 21:05:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8589.1695416718105804978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 14:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kuIYgMkq;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c3d6d88231so24269405ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695416717; x=1696021517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggZjUOFBkgx3k/JWtcFIOSKxtSEEbPg+uxk7eusTDaE=;
        b=kuIYgMkq7NrlHCNCsNlDUdkRAaiksV3rmeDlZUJ8ILeCPadfDiUJjQpZNjTgPm2gYI
         0hPCqMB79UcmSSpe/KxA6kFkdD4ZhAcn7Aadp44zLE4+M6u53NAj4QoLJPsPFKjhYnis
         PaRHhDsw1AM+r7PmVtRR3O+UxDN3ZP791WERzYkjcl1pG3u9SVrbsIPSsXRZwWtwjRuG
         AexXuQbOVYAGQy2JzeMttTEgQxTOZ+qJid/cgGIHh/IlecZT27rqyJ2HdtFljMIBnu9l
         fKzB0JdwtgS10x8wURRZI5Z4OkYU8CzOfys7vEEglh4CIRL6f0WbBKK35yQvHT/P0nEO
         Xsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695416717; x=1696021517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggZjUOFBkgx3k/JWtcFIOSKxtSEEbPg+uxk7eusTDaE=;
        b=JUdmlFXHvkf1MAV4eg1AfgwFdYL/HzBL26TRH5Ihy8Q55H0wuMI6fRQjN9gpmx1YP7
         V/qNTQOKO/PVLaAt/06M9n/fXJPvaz17pf0UPq4qxtMN3aRW7O5tnZKRVjyN6RFRbgic
         tha0Qt9EXxNcsBVu+8sGQJPIo6zHvdCurfoApdhhXmaYJJLnVNapsRPf+IlH+wkg3GI8
         /x5/QyWzKE3HNxeGdlbySCIZFUEFs87K0dRj/LoVScjoI85A6KFWuXyGebcU1LvngSPP
         yZUFJEQCYaJs2bZra+Gv1YFYUE0SSG4Rt9IuRX2dkihE64+VXVKVfO4tELQVOlO6Rzgl
         TA9Q==
X-Gm-Message-State: AOJu0YwTalalB1kEmiHONd7L6bgB7fQ+GlCPeZyHcdQE5WNoxOUxdBJA
	Kq9PNzCFHUbP47zYtWwcI97eEl4mlc2QVQ==
X-Google-Smtp-Source: AGHT+IEe0sOc0nLze+Y5oQ9fLUI37KmnHuZPz0U2PHMJb6dfu9SptB/TkgzYpxNMZDjqK567gIxbaA==
X-Received: by 2002:a17:902:d4cb:b0:1b9:e9b2:124b with SMTP id o11-20020a170902d4cb00b001b9e9b2124bmr608729plg.64.1695416717303;
        Fri, 22 Sep 2023 14:05:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001a5fccab02dsm3943623plf.177.2023.09.22.14.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 14:05:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] debugedit: Use musl-legacy-error
Date: Fri, 22 Sep 2023 14:05:08 -0700
Message-ID: <20230922210508.24087-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922210508.24087-1-raj.khem@gmail.com>
References: <20230922210508.24087-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 21:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188137

Use error.h to provide GNU extentions for error API
Drop the patch trying to do something about it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Added

 .../debugedit/debugedit_5.0.bb                |   4 +-
 ...tools-Add-error.h-for-non-glibc-case.patch | 102 ------------------
 2 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
index 257238fa245..63ad7babd9a 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
 
-SRC_URI:append:libc-musl = " \
-           file://0001-tools-Add-error.h-for-non-glibc-case.patch \
+SRC_URI:append:libc-musl = "\
            file://0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
@@ -20,6 +19,7 @@ SRC_URI:append:libc-musl = " \
 SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
 
 DEPENDS = "elfutils"
+DEPENDS:append:libc-musl = " musl-legacy-error"
 
 inherit pkgconfig autotools
 
diff --git a/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
deleted file mode 100644
index f6d64cb4e7d..00000000000
--- a/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 4c797d3b559ba51bd9ccd9a2036245819acce843 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 23 Mar 2023 10:54:21 +0800
-Subject: [PATCH] tools: Add error.h for non-glibc case
-
-error is glibc specific API, so this patch will mostly not accepted
-upstream given that elfutils has been closely tied to glibc
-
-This is a OE specific workaround for musl.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tools/debugedit.c      |  7 ++++++-
- tools/error.h          | 27 +++++++++++++++++++++++++++
- tools/sepdebugcrcfix.c |  7 ++++++-
- 3 files changed, 39 insertions(+), 2 deletions(-)
- create mode 100644 tools/error.h
-
-diff --git a/tools/debugedit.c b/tools/debugedit.c
-index 668777a..a72c3c0 100644
---- a/tools/debugedit.c
-+++ b/tools/debugedit.c
-@@ -25,7 +25,6 @@
- #include <byteswap.h>
- #include <endian.h>
- #include <errno.h>
--#include <error.h>
- #include <limits.h>
- #include <string.h>
- #include <stdlib.h>
-@@ -40,6 +39,12 @@
- #include <gelf.h>
- #include <dwarf.h>
- 
-+#ifdef __GLIBC__
-+#include <error.h>
-+#else
-+#include "error.h"
-+#endif
-+
- #ifndef MAX
- #define MAX(m, n) ((m) < (n) ? (n) : (m))
- #endif
-diff --git a/tools/error.h b/tools/error.h
-new file mode 100644
-index 0000000..9b24418
---- /dev/null
-+++ b/tools/error.h
-@@ -0,0 +1,27 @@
-+#ifndef _ERROR_H_
-+#define _ERROR_H_
-+
-+#include <stdarg.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <errno.h>
-+
-+static unsigned int error_message_count = 0;
-+
-+static inline void error(int status, int errnum, const char* format, ...)
-+{
-+	va_list ap;
-+	fprintf(stderr, "%s: ", program_invocation_name);
-+	va_start(ap, format);
-+	vfprintf(stderr, format, ap);
-+	va_end(ap);
-+	if (errnum)
-+		fprintf(stderr, ": %s", strerror(errnum));
-+	fprintf(stderr, "\n");
-+	error_message_count++;
-+	if (status)
-+		exit(status);
-+}
-+
-+#endif        /* _ERROR_H_ */
-diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
-index da50e6c..c4a9d56 100644
---- a/tools/sepdebugcrcfix.c
-+++ b/tools/sepdebugcrcfix.c
-@@ -29,10 +29,15 @@
- #include <endian.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <error.h>
- #include <libelf.h>
- #include <gelf.h>
- 
-+#ifdef __GLIBC__
-+#include <error.h>
-+#else
-+#include "error.h"
-+#endif
-+
- #ifndef _
- #define _(x) x
- #endif
--- 
-2.17.1
-
-- 
2.42.0


