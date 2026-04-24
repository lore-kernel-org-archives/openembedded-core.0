Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5459AFF8840
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31978.1777064215957745708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3mj2jdjw;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64690545e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064214; x=1777669014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1M/PmWk62OhFa3ip1rilOlBy6C1FV1RusQweKoNTRA=;
        b=3mj2jdjweJ7xQsQDAdKcJtorAsMlG44LidQYkPP5mKWcMiDIKnBv9dpSXlbx3rVbGx
         vvlm+VRfAUXii/vyzECxTM8yQQP6qUdGr6m6uZZ8sMmYnGkbqV+12l/EdApfNlpCeivk
         0KLuMilJNLlSymoj4O280PWvdbMKKXHSmYhVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064214; x=1777669014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1M/PmWk62OhFa3ip1rilOlBy6C1FV1RusQweKoNTRA=;
        b=UsZ08264alKDnkXUHGtnnS7YHfqDFpyryjoyHfb33QIQ9MK8DhXwO7XMypzMAKSS+k
         JRq9H4uzK1hEBu5PAM0okSo/scWt31RK6gjU6qJav8oPxSetOulPjAHRZNWRaGZOduc4
         H8FG/rNpZbzBQhD08vH8+yIfp8VEDV20Ojuj53xQSq5wX0jWB+V5sc0k8TY46DNprofa
         /jGmy4XVyC1ATaRAqczqkx7/rsPrx307AkYP52hSoPVhb0p81ZqZ1l04gkYjhfI4U+pr
         Vu1CrJrFPReUzxL+X5dZGYQ7gUYZLlJpHZiaVaYOfe+oHKEUWAGGE14YpWm55Mbxjicl
         tQKQ==
X-Gm-Message-State: AOJu0YxV9Jb3H2nl1W3apaEpWif2SfXl8bsHtIozoLACjrswo+3YqZZ+
	9M8/GtuuU4uc+dQentur4CDQeKGyPSoYFgi8xKsd/v+QlUCa8ao+hXP6V2bc5BT0MsMlTf1gFZe
	P8x51aRhdQtDn
X-Gm-Gg: AeBDiettiVJTRhr5vKPzArZ6oOjmAnU8Ka5zLSy87NfriFcEMBMhOmM8heBFhFbWN7j
	qjiAFns8uKQpDEAuHggKvuSHEnIkemoYBWrkN6Zq7zfC8nR2zarrY/onTwLSuSx1bM2qtFIw1Vr
	tGnRwyunJlUb6k/t3wZPi24xOQSyA237guAU/Q+a/jo3kJeDNR9c3BLTh+pcMLUKw0+gs8KsWkQ
	Irncyv+J6nx9OmyT72ZnP4Jx6M4CkP+4n0B9368Ksm/01i4iGe1ZxJJXRXE8UJwvrZfx+uR9qc5
	h6+D4a4vxqo3NgrLj4gFH2mPE0h6+63NJ+aojEorVt8Ojfbso04Pz2OlSkBiS2l9vwoTkkI6VbI
	Rbniamd2cjvn6WGA/uT8ipE8iyBmT7nPdB/0fAJwWKSzS7prJxbCH7bfjuzw6s/FjA2syuyY678
	Bc7Rcvf9TCna0dWGdGzRYq3r+rfHsEkmLPCJmkM0rFPA4sq4ye7tupW3cEjnvy72RXm9K1EGpMp
	V14JJ8xdpX7mD+YyykdFuo1PMlcgcK7/tW2lA==
X-Received: by 2002:a05:600c:3b04:b0:48a:5574:3a57 with SMTP id 5b1f17b1804b1-48a55743eb7mr240785255e9.29.1777064214047;
        Fri, 24 Apr 2026 13:56:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/66] cmake: backport a fix for gcc-16 on host
Date: Fri, 24 Apr 2026 22:55:29 +0200
Message-ID: <cd220988c8f49a426c8c9f5766bb7ce672c19c3a.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235903

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../cmake/cmake-native_3.28.3.bb              |  1 +
 ...mpilation-with-gcc-16-devirtualizati.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |  4 ++-
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
index 7b250752d80..eecc2df5387 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
             file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
             file://CVE-2025-9301.patch \
+            file://0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch \
             "
 
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch b/meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch
new file mode 100644
index 00000000000..2f28e3a7ba9
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch
@@ -0,0 +1,36 @@
+From 0f8fdfb55950e383d9780b875bc8d7213db8a42a Mon Sep 17 00:00:00 2001
+From: Brad King <brad.king@kitware.com>
+Date: Wed, 24 Sep 2025 12:02:37 -0400
+Subject: [PATCH] bootstrap: Fix compilation with gcc 16 devirtualization
+
+Avoid including a header for a subclass whose implementation is not
+compiled during bootstrap.
+
+Fixes: #27256
+
+Upstream-Status: Backport [v3.31.10 ea04e19daf7010781d0df980b9683a642093e381 https://gitlab.kitware.com/cmake/cmake/-/merge_requests/11243]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ Source/cmake.cxx | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Source/cmake.cxx b/Source/cmake.cxx
+index 636a0da5b8..0e05afb7a6 100644
+--- a/Source/cmake.cxx
++++ b/Source/cmake.cxx
+@@ -124,12 +124,12 @@
+ #  include "cmExtraEclipseCDT4Generator.h"
+ #  include "cmExtraKateGenerator.h"
+ #  include "cmExtraSublimeTextGenerator.h"
+-#endif
+ 
+ // NOTE: the __linux__ macro is predefined on Android host too, but
+ // main CMakeLists.txt filters out this generator by host name.
+-#if (defined(__linux__) && !defined(__ANDROID__)) || defined(_WIN32)
+-#  include "cmGlobalGhsMultiGenerator.h"
++#  if (defined(__linux__) && !defined(__ANDROID__)) || defined(_WIN32)
++#    include "cmGlobalGhsMultiGenerator.h"
++#  endif
+ #endif
+ 
+ #if defined(__APPLE__)
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
index 1841bfd1cfd..f018ca21ff1 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -11,7 +11,9 @@ SRC_URI:append:class-nativesdk = " \
     file://cmake-setup.py \
     file://environment.d-cmake.sh \
 "
-SRC_URI += "file://CVE-2025-9301.patch"
+SRC_URI += "file://CVE-2025-9301.patch \
+    file://0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch \
+"
 
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \

