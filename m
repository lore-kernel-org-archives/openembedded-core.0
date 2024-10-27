Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1F8D13573
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 17:02:14 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.33433.1730048527213763436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 10:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IEXrc/4l;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so2507581f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730048525; x=1730653325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sIj7ddWrsG0CocbfAVWsnQ1mCbTKpzK7sNJu6TBq7g=;
        b=IEXrc/4l5bLoqvoHYaJcPtbvDvJ+DLnbYAof/cDuAmLMKDG3QTtKR0K0DMKuaxQYmm
         rMcnm1Ez3ULug0jOARzZXsf84a6y4ZSfD8ADR7DL/pIXqGROXR6I6xUgXT2oSoRRsWHO
         4HH1GfvzwZWmnHYPa+8SQPXI7iqq8K/5BtHyOqZwi9V1g9o5IhxT4YIBSPVBQlB6COhH
         L5kx0HLZnnYEfpxbdHBq0YfO81Ij775xkwMSYI5vpgfU+p6fdrz7Aa4iWAM18cYXL1I4
         yTMmez2YVpJWqI6rA+Hi9BW8TFYsPfaU/TWpoYEIRnUbSzdEqKICiULpLLptQSStF793
         efZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730048525; x=1730653325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sIj7ddWrsG0CocbfAVWsnQ1mCbTKpzK7sNJu6TBq7g=;
        b=fwDK2rxSHqfUFXFLgiJiTkIHkedTY0O0dShmZd2hD7V/tuSATImBHoijl1HglwQAL/
         iMsXrmanO0rq6TYqeLQigqHZIPCwQqyT0T0DSw1cFmZ43vOTUyc7/iVvNv3Y9DJ5S4C2
         UVWhHyB/Nty8enpBVPOjtMleH/z7nzttLkpU0jzpVAnMb4zp4nJD3PXMZ6N3lJYElX74
         WekNwR1ohe1aWakC/oAuPhVZFFCo5x9c3VzzSdne6y/J46QfGORA2Jtqbln7DmFXoCc2
         wEvpHgd8ujyogYfOIYC4KefpHD1G3ugP/X7SiRp6LycmyUtQpIyYBX7NSFHEDW5zYTfs
         8A0Q==
X-Gm-Message-State: AOJu0YzjHyHIH+xTL99rw88Nk7M/9v84hEoLm6TBFyTLDfNEYDi6v4yF
	6GU0JsguowsoHmc9aUr7sjUB+ylvQdr8t6CEykr1GdYxMdQkxdr2glfkPg==
X-Google-Smtp-Source: AGHT+IGbnzGP1j/uGhZ3eoQTp+lkGnOvVX4mY28R6V+Io+yGrAwrXbPwBRbudPCA94WKU1JBd+or+A==
X-Received: by 2002:adf:ea8d:0:b0:37c:ddab:a626 with SMTP id ffacd0b85a97d-380610e69f9mr4392660f8f.7.1730048525147;
        Sun, 27 Oct 2024 10:02:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bd8sm7206199f8f.87.2024.10.27.10.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 10:02:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v2][kirkstone] libffi: backport a fix to build libffi-native with gcc-14
Date: Sun, 27 Oct 2024 18:02:01 +0100
Message-ID: <20241027170201.2888251-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206407

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: forgot to add Signed-off-by in v1

 ...ward-declare-open_temp_exec_file-764.patch | 47 +++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.4.4.bb   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-Forward-declare-open_temp_exec_file-764.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-Forward-declare-open_temp_exec_file-764.patch b/meta/recipes-support/libffi/libffi/0001-Forward-declare-open_temp_exec_file-764.patch
new file mode 100644
index 0000000000..4b135961fd
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-Forward-declare-open_temp_exec_file-764.patch
@@ -0,0 +1,47 @@
+From 216bf8daeb30880957e0c888efbed1f0a7478c32 Mon Sep 17 00:00:00 2001
+From: serge-sans-paille <serge.guelton@telecom-bretagne.eu>
+Date: Thu, 2 Feb 2023 14:46:29 +0000
+Subject: [PATCH] Forward declare open_temp_exec_file (#764)
+
+It's defined in closures.c and used in tramp.c.
+Also declare it as an hidden symbol, as it should be.
+
+Co-authored-by: serge-sans-paille <sguelton@mozilla.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Upstream-Status: Backport [v3.4.5 https://github.com/libffi/libffi/commit/ce077e5565366171aa1b4438749b0922fce887a4]
+---
+ include/ffi_common.h | 4 ++++
+ src/tramp.c          | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/ffi_common.h b/include/ffi_common.h
+index 2bd31b0..c53a794 100644
+--- a/include/ffi_common.h
++++ b/include/ffi_common.h
+@@ -128,6 +128,10 @@ void *ffi_data_to_code_pointer (void *data) FFI_HIDDEN;
+    static trampoline. */
+ int ffi_tramp_is_present (void *closure) FFI_HIDDEN;
+ 
++/* Return a file descriptor of a temporary zero-sized file in a
++   writable and executable filesystem. */
++int open_temp_exec_file(void) FFI_HIDDEN;
++
+ /* Extended cif, used in callback from assembly routine */
+ typedef struct
+ {
+diff --git a/src/tramp.c b/src/tramp.c
+index b9d273a..c3f4c99 100644
+--- a/src/tramp.c
++++ b/src/tramp.c
+@@ -39,6 +39,10 @@
+ #ifdef __linux__
+ #define _GNU_SOURCE 1
+ #endif
++
++#include <ffi.h>
++#include <ffi_common.h>
++
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <stdlib.h>
diff --git a/meta/recipes-support/libffi/libffi_3.4.4.bb b/meta/recipes-support/libffi/libffi_3.4.4.bb
index 4ceee6f3cc..f727e91345 100644
--- a/meta/recipes-support/libffi/libffi_3.4.4.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.4.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32c0d09a0641daf4903e5d61cc8f23a8"
 SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
+           file://0001-Forward-declare-open_temp_exec_file-764.patch \
            "
 SRC_URI[sha256sum] = "d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676"
 UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
-- 
2.47.0


