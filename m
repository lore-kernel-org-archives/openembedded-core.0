Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C77CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 10:47:44 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.50546.1759142862508261098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 03:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Y1pEvPgT;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27eed7bdfeeso40218155ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759142861; x=1759747661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8t/2deDRjkGqhF1uAF3MGJJCYl0+qQCLi+nXPJ3ORY=;
        b=Y1pEvPgT4nnbJ4WQ0EGN0VSBkWxJPkF+ssE6BfsoUlk41qDOGgPXOgOG7iDAyHpzSe
         eULVN9SYpLqAJ70VIGcv+OzZ/yJkWdDLfTb0f+6fMUShLVpd8zEH3SY3hIwX8R8WYIF7
         jmF4hGb7Z5Ufhm6LcwErLcPTENqahzQCg91zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759142861; x=1759747661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8t/2deDRjkGqhF1uAF3MGJJCYl0+qQCLi+nXPJ3ORY=;
        b=XKTyvcN7eS5fprrGPrbayseElxciTDF597nDWt0gyh/qcjAO98FHQbGaQdcNObln2X
         Z3Jcgf6VDv3vspf3lZc8XCAfsewPxVGuRHhyLK34PAdlnekp72DaDZIIMUk+ncR5Tdsx
         vvkAYk95W7gtMgVoRUOdxtlImyx0XhYhktUKcraOiKQZwDCcUUAaAhNuM8830M7iJ+4T
         eCRscWNJsWyXBGeMHeMV4eJwS35JDQfmMQcw1g/8qkO+PdrpsySdayNS4iFha57OJRFe
         bn0WcER7Zl6ZvOrqFTRNF7fObtmvEnfdrl8FMNGqbrzVjMNDPzRVxustQxRJxpokSe0g
         ys1w==
X-Gm-Message-State: AOJu0YzfPDwkod22kG3FQFhEkpB2kmFkY4tBWBU1dAOA3xhwU5LMnoEk
	ApMLHdP/C1ciBW+bxgz0a9EeBvwnsYVcuT6WUpvhbBd2ikmFePvnxwl4u1KjvJtwZ5PqseRqXb0
	KBj2GWB4=
X-Gm-Gg: ASbGnctTgJgpL89WY/5iEQEM1M9Aq3UDjpXYFOpMUkHIIXIGlkj5w8P4KCln/Qmipnx
	zaFiR/LUgQcLOWY0x30bMS6yKTFyIpwM6hQSXAbcD+PWEoNweH65N1nDY1QbxYUVx5AWvo6/QrA
	c9qwLVjbhdf1osSLC0H/nFH78IFJG5JIxcfLuF0Ayx7Du2Ml3a/Ayi1E7sQVZ+ANBzWD7m5UbWB
	Y1srTPOaH91NBQT26VGKQyowAjf0hVP7XxGTJmCuqSAAFzZlV0f+lt9QVP9+WgwvuxibUKY6tuE
	SeWJZmD5xM7vDfILukYLMDWPZHg/blAgpQmWUE3xs+P+w/o/DSl5H1YNajQzJfwPshPjg9kVDED
	zrcYmBemtsupGPLlAI8TmAKx/p26pFwTV7jEmA5mBWBKevswd
X-Google-Smtp-Source: AGHT+IG7eT8OdGrGUta+KDGnEt7JzrIChdM8VtiLXqFoR9eegRK3DhuPmJNlxKdDrbINq7cJLYNmUQ==
X-Received: by 2002:a17:903:46c3:b0:267:fa8d:29a6 with SMTP id d9443c01a7336-28d17170332mr674625ad.25.1759142861315;
        Mon, 29 Sep 2025 03:47:41 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:3c2f:b246:468e:ceed:5944])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed670f748sm127499825ad.42.2025.09.29.03.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 03:47:40 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] ghostscript: upgrade 10.05.1 -> 10.06.0
Date: Mon, 29 Sep 2025 16:17:31 +0530
Message-Id: <20250929104731.19684-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224134

From: Vijay Anusuri <vanusuri@mvista.com>

Dropped 0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch

Added fPIC flag needed to prevent a linker error during the build process.

This upgrade addresses CVEs:
CVE-2025-59798, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801

Changelog:
https://ghostscript.readthedocs.io/en/gs10.06.0/News.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...Fix-compatibility-with-C23-compilers.patch | 67 -------------------
 ...ript_10.05.1.bb => ghostscript_10.06.0.bb} |  5 +-
 2 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.1.bb => ghostscript_10.06.0.bb} (93%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
deleted file mode 100644
index 78f3fc1c34..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From c595086bfe206776676e290df98cd09e91210e27 Mon Sep 17 00:00:00 2001
-From: Alex Cherepanov <alex@coscript.biz>
-Date: Thu, 3 Apr 2025 17:19:41 +0100
-Subject: [PATCH] Bug 708160: Fix compatibility with C23 compilers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* fixes:
-  http://errors.yoctoproject.org/Errors/Details/853021/
-
-In file included from ./base/genconf.c:18:
-./base/stdpre.h:348:13: error: ‘bool’ cannot be defined via ‘typedef’
-  348 | typedef int bool;
-      |             ^~~~
-./base/stdpre.h:348:13: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
-./base/stdpre.h:348:1: warning: useless type name in empty declaration
-  348 | typedef int bool;
-      | ^~~~~~~
-
-Upstream-Status: Backport [Partial backport of https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/base/stdpre.h?id=ae940946473ceb8c5353bc6e7f04673c6e60502d]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- base/stdpre.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/base/stdpre.h b/base/stdpre.h
-index dda30b6..2f9c84e 100644
---- a/base/stdpre.h
-+++ b/base/stdpre.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
- 
-    This software is provided AS-IS with no warranty, either express or
-@@ -341,7 +341,9 @@ typedef signed char schar;
-  * and the MetroWerks C++ compiler insists that bool be equivalent to
-  * unsigned char.
-  */
--#ifndef __cplusplus
-+
-+/* C23 has bool as a builtin type. */
-+#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
- #ifdef __BEOS__
- typedef unsigned char bool;
- #else
-diff --git a/base/gp.h b/base/gp.h
-index ad5bb61..cf2c9cf 100644
---- a/base/gp.h
-+++ b/base/gp.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
- 
-    This software is provided AS-IS with no warranty, either express or
-@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, int origin);
- /* Create a second open gp_file on the basis of a given one */
- FILE *gp_fdup_impl(FILE *f, const char *mode);
- 
--int gp_fseekable_impl(FILE *f);
-+bool gp_fseekable_impl(FILE *f);
- 
- /* Force given file into binary mode (no eol translations, etc) */
- /* if 2nd param true, text mode if 2nd param false */
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
similarity index 93%
rename from meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index 417bf52a99..8bb5bb985c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -24,10 +24,9 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
            "
 
-SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
+SRC_URI[sha256sum] = "5bd6da34794928cc7e616f288e32bd0be7f9a5ca2d3c206a0af2c19a4e3a318f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
@@ -47,7 +46,7 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
-TARGET_CFLAGS += "-std=gnu17"
+TARGET_CFLAGS += "-std=gnu17 -fPIC"
 
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig
-- 
2.25.1


