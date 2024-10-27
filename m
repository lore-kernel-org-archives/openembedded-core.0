Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DADD1356E
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 16:03:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.32309.1730045021028338950
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 09:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CwKZBZtZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so34460175e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730045019; x=1730649819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6p0PSiBg1srAaIStMGd7Q30e56Q2j7FV1KbQOinEi0=;
        b=CwKZBZtZTdVvHR3qlNeYh3wzVnQ7D177+Uag3EgGp271hLDB8HagbcK86XNNX9m9vl
         I09XPAdFP9Dhy0tar/WqUUUfTD5UDVmqJA9ct1HPirrPOCJRnskV0vXIU4j/NsyW9Qqn
         EdNI45yWwWgJhNmvE1r+173w+PYLB6aE3Rgu0sqFb6wjqZCR8JQYlzQw76tUHkLP2Xrg
         zrypQXFt1MecbCa7WbLSGnv9iV2fKDEWkOP+TevS3+bm6/qurQJoPmOFuUCtjDelwIYP
         9pQgdw9g1BJvdAUkwDrMObRL9X7fZezADVKHNhXKwFmxxv/oZaOTFJj31uEcWXocT6O5
         W5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730045019; x=1730649819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6p0PSiBg1srAaIStMGd7Q30e56Q2j7FV1KbQOinEi0=;
        b=RNrpC+mI1oSKRtDt0t4weCgkULYuHonNuv2h8skjZzSeIYXDQuSNtiOMn6BVOC/7GP
         HN2UX+Q0kAjsTXhVXPlHeYxDhC03ojArvs00UcGC6uGE8lzvyepL+ZckUCvfglnvxrEh
         tlRYszqzr1GpEgljHw85LW9Y9Bsu55bMUcKzwbFhERJq+0mpOPmvStcDf/fJAVpYIEVk
         4+hEpsKcv5LWmInkSuhVY3Iwb5/2Ejo3WjYFwEuY690jR5NJmf2dY2W/KkqmMUlE05xa
         l9zgQfg/7+6KHGzAdFFgp7OYxWS2E6nTBO5cZWi0omWKz0doO0HlxEoeOxwmd2LeBF02
         q7ZQ==
X-Gm-Message-State: AOJu0Yz6uqtYLjYxAIjsDOOUMRLJm7+97iYCFKhbopeXGFDVwwtFkOZy
	cNdp0vMbYQ+rSKxRk5cxBzYU8wPZScpjSZrqtCKsKickA0VXRBz7RxM5WA==
X-Google-Smtp-Source: AGHT+IFI9jn7YFAdtiRXaezO+VdzG6y9Q7oZoiVoes+NkN+QczX/hvrSD+cnFqazy31JD/LGNWIqCQ==
X-Received: by 2002:a5d:44d0:0:b0:37e:d2ba:6f11 with SMTP id ffacd0b85a97d-380611f5c32mr4360705f8f.47.1730045019154;
        Sun, 27 Oct 2024 09:03:39 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573551sm79514085e9.6.2024.10.27.09.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 09:03:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] libffi: backport a fix to build libffi-native with gcc-14
Date: Sun, 27 Oct 2024 17:03:36 +0100
Message-ID: <20241027160336.165861-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 16:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206404

---
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


