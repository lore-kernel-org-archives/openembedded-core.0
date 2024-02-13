Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05E5C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 17:01:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.17148.1707843677137592380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 09:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKt3UaQJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d9b2400910so29457655ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707843676; x=1708448476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uEaGzY+R9u5thX0orYBYzS7e2ES9i+34PqNz+9mq/EU=;
        b=KKt3UaQJ+sCD/gwFKT1JYuJs9b1tDxSKF5bK2pXk9Z+oeHFrygDnSALjsn3n3mHZ6N
         TfE+lF/eRBdkMpaaC7armBGL+EAEcVfQBmaXLohAmKUJvuIAGCnQkTse5A8TqUfKei8c
         0aaKfAarpCFRAdJHlY9t+91DtnlfoZbIzjhwiZBqtD+Qapx/7hGh3j8ZdM19UgefC+mY
         oH5MPjltod/ZNMA/ovqCLBqw4Z2+1EwQ7eY+6oDI8YWaZQKwmSwAhilmzxxUdIjV/G1E
         2df9eMIeXiabgML72JPysyUGnJ/4MrDYIXq89F+gRLgjZbnsUwMLCNXdKqB4OntmrAmw
         DOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707843676; x=1708448476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEaGzY+R9u5thX0orYBYzS7e2ES9i+34PqNz+9mq/EU=;
        b=f3VT1NmjmzCxNxT19lgNMZl/qhCf6pRkhgzd3RRSBE+LH1N23HRxXqkDu6vrCnBTHd
         sIwefQQHPNgIuVuWRyIAy6crMNN3ZhutDTFVNBwe/IhMAgIR5mr2+CnErs28L2yD21OB
         mu/3FxWpUJjF2ND4uncyWpA4cv3+tEoKn5Wc1hvf7k2mtJwDQTWxpgkyB/SSqKxcWVUX
         hRV9gobHkOZXaBB3NEoPRxGsw0ui3Pq5+MhZkt3+GGjaJ0ZnJ/k3xLjb/Kr3gMMix+Um
         gniGQSG6VSzkJ8iKQbwRjvsZM9XI/wEvI4nZEeqKZnZ1FKAxR4TJ1a33SkK7bXHZGlMl
         ex7A==
X-Gm-Message-State: AOJu0YxOQu80cGI3fy21dKcgfap3ggcvIirS8Xsvyyf+Zab8HdxRuwSD
	hmHHMW2oHZYjB/fRHuiQe5/m5CQ9VAQ6PJjFQr5o6dluZGoUudeG/4dD28+Tb9s=
X-Google-Smtp-Source: AGHT+IEdzNJ2+w6zFhzHStFpoONYw/xZQEyLcFyBkPn+j/2e5Wnj/TfiGKRPmf0K+u6aoFTOeEH4vQ==
X-Received: by 2002:a17:903:24f:b0:1d9:4e80:ceb6 with SMTP id j15-20020a170903024f00b001d94e80ceb6mr4389756plh.8.1707843676082;
        Tue, 13 Feb 2024 09:01:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::130a])
        by smtp.gmail.com with ESMTPSA id s15-20020a170903320f00b001d9537cf238sm2301796plh.295.2024.02.13.09.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 09:01:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] piglit: Fix build with musl
Date: Tue, 13 Feb 2024 09:01:08 -0800
Message-ID: <20240213170108.191806-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 17:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195421

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-libgen.h-on-musl-linux-systems.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
new file mode 100644
index 00000000000..35e919e5525
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
@@ -0,0 +1,31 @@
+From 232a67b651ccb415b7d4d47584613359b7ebd920 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 13 Feb 2024 08:53:37 -0800
+Subject: [PATCH] utils: Include libgen.h on musl/linux systems
+
+musl does not provide GNU basename like string.h on glibc based systems
+does, it does provide the POSIX compliant basename function therefore
+allow to include libgen.h on non-glibc based linux systems
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/877]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/util/piglit-util.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/util/piglit-util.h b/tests/util/piglit-util.h
+index 4d3606c70..fdfd903b3 100644
+--- a/tests/util/piglit-util.h
++++ b/tests/util/piglit-util.h
+@@ -52,7 +52,7 @@ extern "C" {
+ #include <math.h>
+ #include <float.h>
+ 
+-#if defined(__APPLE__) || defined(__MINGW32__)
++#if defined(__APPLE__) || defined(__MINGW32__) || (defined(__linux__) && !defined(__GLIBC__))
+ #  include "libgen.h" // for basename
+ #elif defined(_MSC_VER)
+ 
+-- 
+2.43.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 1bc3b784c77..ab749f78670 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
+           file://0001-utils-Include-libgen.h-on-musl-linux-systems.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.43.1


