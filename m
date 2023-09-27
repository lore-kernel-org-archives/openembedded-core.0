Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17967E82CBD
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 18:27:47 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.24672.1695839264181432837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 11:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1dcvbpD;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-534659061afso5161719a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695839262; x=1696444062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zT7pfqJwAgl/sgqVPdyDPzJ+RfSJGx5f/O2fHALNAMo=;
        b=A1dcvbpDyhzaLhTaK9FNtwbmm6gJdFqRjT9pESW5tHIPkN/D4RNUG1pfxs9AC/s4nm
         uSjVn4Owcj7HVSWnRn3oKuR7udoq99LEYEk41bbQuUXsaakGJ9oAw7wSXuZccmPs2qW7
         JfkSiNJE51plIwa8RECdsC/09AJModIGWZpv0aiYKUtWjvIZg/vtMPRR3uPX+pzLwQXO
         Nqkxwo1/aRhTY2RViaPBGguKq8Shvz4bLPWAs9d3ePS3Efvb9SyOQWgG+rqHDTgcJPEm
         TH65DBxx9XcZrzk1M3PhV2x0Ivak1Wsvi4BZ0cJO46V7bMud5hwOP8AIeB/Ujl8kCKNe
         Uj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695839262; x=1696444062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zT7pfqJwAgl/sgqVPdyDPzJ+RfSJGx5f/O2fHALNAMo=;
        b=ILTyU+TTcxuYUQix5+Nz3+S5n0400FZ/g1BO4pTudGA5BpVS+hhrY7xEedX0K6xKOU
         i67jD/wXmR/AmOjJjAaNvC1D6vjnH6f/lVXt6EBaRSYFxukYApkXNIlR+BPG4c5Xe922
         F2vt/fZGbcjIJgT08DYeSqZQi9CUstiKjHH1s6qBtxnHvigpvb3gZVJ80bcKBATPVWc4
         p3VavULJ3hhBZ8lIJMCjkOqmtigNBIKowfN0DtutSwobcDfhhBasluU0jGdvbwXiBh6t
         1aCPnUPP2dvX7dNwQ/m/9NvX7Z4GlWyzDn0snqsnYU3XZLu+U1tsxpS5+HPNoKX78GOE
         mmEw==
X-Gm-Message-State: AOJu0YxhMOdsM0S4WoJ4CmvV58zUkPonKp3MSeNUyOOAD+vsAyzkwcQ/
	5wQMGsCfsNXJHfYCouYuBoY+n88JztY=
X-Google-Smtp-Source: AGHT+IHNyPqYzSAeFxKozEn8PZBrA3NIvpxkBrYBuCocIzKZtZTggWAvQZd+jZa9AkhLWUnBftED9A==
X-Received: by 2002:a05:6402:1659:b0:522:1d23:a1f8 with SMTP id s25-20020a056402165900b005221d23a1f8mr2471307edx.26.1695839262330;
        Wed, 27 Sep 2023 11:27:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g7-20020aa7d1c7000000b0053112d6a40esm8595960edp.82.2023.09.27.11.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 11:27:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] ccache: fix build with gcc-13
Date: Wed, 27 Sep 2023 20:27:35 +0200
Message-ID: <20230927182735.3519736-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 18:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188339

* needed on hosts with gcc-13 for ccache-native

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...x-FTBFS-with-not-yet-released-GCC-13.patch | 92 +++++++++++++++++++
 meta/recipes-devtools/ccache/ccache_4.6.bb    |  4 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ccache/ccache/0001-build-Fix-FTBFS-with-not-yet-released-GCC-13.patch

diff --git a/meta/recipes-devtools/ccache/ccache/0001-build-Fix-FTBFS-with-not-yet-released-GCC-13.patch b/meta/recipes-devtools/ccache/ccache/0001-build-Fix-FTBFS-with-not-yet-released-GCC-13.patch
new file mode 100644
index 0000000000..d62e1ef26b
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache/0001-build-Fix-FTBFS-with-not-yet-released-GCC-13.patch
@@ -0,0 +1,92 @@
+From 1523eaeff4669e421b3f60618b43c878e4860fe6 Mon Sep 17 00:00:00 2001
+From: Joel Rosdahl <joel@rosdahl.net>
+Date: Tue, 5 Jul 2022 21:42:58 +0200
+Subject: [PATCH] build: Fix FTBFS with not yet released GCC 13
+
+Reference: https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Fixes #1105.
+
+Upstream-Status: Backport [v4.7 https://github.com/ccache/ccache/commit/19ef6e267d38d4d8b3e11c915213472d5662d593]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/Stat.hpp                  | 1 +
+ src/core/CacheEntryHeader.hpp | 2 ++
+ src/core/Sloppiness.hpp       | 1 +
+ src/core/Statistics.hpp       | 3 ++-
+ src/util/TextTable.hpp        | 3 ++-
+ 5 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/Stat.hpp b/src/Stat.hpp
+index 2f56214a..074cdeeb 100644
+--- a/src/Stat.hpp
++++ b/src/Stat.hpp
+@@ -23,6 +23,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ 
++#include <cstdint>
+ #include <ctime>
+ #include <string>
+ 
+diff --git a/src/core/CacheEntryHeader.hpp b/src/core/CacheEntryHeader.hpp
+index 4c3e04c7..dcc32e1c 100644
+--- a/src/core/CacheEntryHeader.hpp
++++ b/src/core/CacheEntryHeader.hpp
+@@ -21,6 +21,8 @@
+ #include <compression/types.hpp>
+ #include <core/types.hpp>
+ 
++#include <cstdint>
++
+ // Cache entry format
+ // ==================
+ //
+diff --git a/src/core/Sloppiness.hpp b/src/core/Sloppiness.hpp
+index 917526bf..1ab31d71 100644
+--- a/src/core/Sloppiness.hpp
++++ b/src/core/Sloppiness.hpp
+@@ -18,6 +18,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace core {
+diff --git a/src/core/Statistics.hpp b/src/core/Statistics.hpp
+index 3e9ed816..54f32e9c 100644
+--- a/src/core/Statistics.hpp
++++ b/src/core/Statistics.hpp
+@@ -1,4 +1,4 @@
+-// Copyright (C) 2020-2021 Joel Rosdahl and other contributors
++// Copyright (C) 2020-2022 Joel Rosdahl and other contributors
+ //
+ // See doc/AUTHORS.adoc for a complete list of contributors.
+ //
+@@ -20,6 +20,7 @@
+ 
+ #include <core/StatisticsCounters.hpp>
+ 
++#include <cstdint>
+ #include <string>
+ #include <unordered_map>
+ #include <vector>
+diff --git a/src/util/TextTable.hpp b/src/util/TextTable.hpp
+index 05c0e0e5..60edee75 100644
+--- a/src/util/TextTable.hpp
++++ b/src/util/TextTable.hpp
+@@ -1,4 +1,4 @@
+-// Copyright (C) 2021 Joel Rosdahl and other contributors
++// Copyright (C) 2021-2022 Joel Rosdahl and other contributors
+ //
+ // See doc/AUTHORS.adoc for a complete list of contributors.
+ //
+@@ -18,6 +18,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
diff --git a/meta/recipes-devtools/ccache/ccache_4.6.bb b/meta/recipes-devtools/ccache/ccache_4.6.bb
index f019679cf1..d94c5d591a 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=ff5327dc93e2b286c931dda3d6079da9"
 
 DEPENDS = "zstd"
 
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
+    file://0001-build-Fix-FTBFS-with-not-yet-released-GCC-13.patch \
+"
 SRC_URI[sha256sum] = "73a1767ac6b7c0404a1a55f761a746d338e702883c7137fbf587023062258625"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
-- 
2.42.0


