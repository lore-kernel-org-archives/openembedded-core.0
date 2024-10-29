Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258A3D3A690
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1985.1730228434544670106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OplFdWNS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso4040566b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228434; x=1730833234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gK6plURsivoTAivG3RWY+w0ODRbLQWHXWUuAvmfABiU=;
        b=OplFdWNSp3zxMVqhMBNm3qcknqG1fg1+tGp50xrI70w37lQUv/g2y2TeNW+mW1hIZg
         if9Kr38CcmjKYFfiqZg/3ijoHMfM9KbSMur9ZM0aeXtt96DBgoOv2k6nrSsj+NouPxtw
         F/CwmJjphmlPi4U//+qeVYKUAxS3B5HUL63MnJeOhDk/FrJzTXMZ0XT5w/ZNjlE5aiOL
         fLXsrUZuwCgwDhBZRgrzYje+oPgTzFbf+eKpsiohxkdK26LATe3285pLZ/sxHCq5QR/1
         2bfFSb2PW5AaP7rgdbUJAUXBbdOdGjJWVsKLRuWfbohC1Og6LDeRMw8rcQUL86JtYC8l
         dJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228434; x=1730833234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gK6plURsivoTAivG3RWY+w0ODRbLQWHXWUuAvmfABiU=;
        b=b2wUCB60s8LUu3GbiNWzXP9rtc3KZDZXeYHAiaEi1noYGCacSEZrc78BwAs4X2U+fj
         hPuoU3hqIVBqeoQUtW65JqPIY9U7oJ8N+qx2tMzy89u17/Ph/VrfhTYKmkb96BOeYoHX
         OMuIwaEBFdOc3QnR73DLIpyz91tVvhVzivvg60CiAU3iRWNRNrXR7R7KvBIXvGITf95s
         LSXVd5GsDMalX+JrcrgGMF+y0uD+zNStveE7wBlnNSy8YWSQhesG+hE9EonNvhfOY9Xt
         CCzG0ZclAK1Zu5ul6xIisA9KEcynzOvPoMXJwjiSiRFsHVyCIzHNLtVtdf/UT4TNHCVj
         SPpQ==
X-Gm-Message-State: AOJu0YzmZd+NEkY+aZw9i+bIJSWcNJsqxSHudCkvRmxDTjeLLci/njOU
	HGot8H5GHnBxVEiag32rklnNwWt94C8j73/OtNvTM+vPW4OYJeFUkApq+/idHL8YVK1LYyTW2yL
	z
X-Google-Smtp-Source: AGHT+IEQz1DOFyECYhIHzHVmRS4KdzAPitMX0SHRNJHv6cgIbC0ZhIb1RvZLNS9H1h35BMbDMV2f9Q==
X-Received: by 2002:a05:6a00:1393:b0:71e:16b3:e5dc with SMTP id d2e1a72fcca58-7206306de34mr18408672b3a.19.1730228433702;
        Tue, 29 Oct 2024 12:00:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/19] libffi: backport a fix to build libffi-native with gcc-14
Date: Tue, 29 Oct 2024 11:59:50 -0700
Message-Id: <1054417a217417ab192dc4aee8307133451fb0e4.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206527

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


