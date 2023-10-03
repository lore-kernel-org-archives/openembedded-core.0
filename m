Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C56E8FDA9
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.143.1696361832805961702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iNa2ILZM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27740ce6c76so883292a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361832; x=1696966632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3zXzXFLEum7nwTCCfw3qEdP6B7OCbEv0l5NA6irHGI=;
        b=iNa2ILZMQh7IzAK5mlF7s2s7iikdk8JqTsO/Zdnddy0+sKrD8D4semcIuyZB1HoKjs
         TsiQwnvif4ePmZMo1SKr1bqcZH5biNRZtAIWVBMrnoEE6fAa+5W25LugbU7CcL/YC0Gy
         77oxta+ziilS4OQIHPOg9qV8BkePnwrZ+cINdBotxb6HOJA/9E+zg9Raj84BIl/ywHJv
         xsw+wsM2WHzKzh6Rclr8ygewEYg3xW10VgyosOAXzvokOwjD1LISH7Ce1/5F3Xd+7UoR
         +bnMkwirt7uXqpucG6+9ojCt5ZLLDE5usR7bl0veWtl674afuG7AHgth0khjdkPO76dM
         Z/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361832; x=1696966632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3zXzXFLEum7nwTCCfw3qEdP6B7OCbEv0l5NA6irHGI=;
        b=ETOjvg4lxw/ZNgtXmS4buvW0+6Kux/xYPofBQcoYMg8r0Dp0b0Ql507u5XoTRE6TvL
         wRUVzxuhcC3BraLpUJUUcvTYNeI+in90oT4QlH6ubWoeSCBghj75QwIfvZmovC+AkWvw
         49fY5Tjb1McyH0uMfBC2j+s1+ZjRCumgyrXBkEIZKRPbBuozRoA4bFKh7veaxGKlUPfF
         AESF152/ZI/WZ5ak6CuNBlbTsY7ouZkPOx8yldoYbVPcr6BFxbxqRpVG4cO9CISD1w95
         G661uJBw51aAKTlFAlbqFFn6k88hyM9e6Xit22Sy2cZINey6Pa/Qsdh/9n+g7+18NyXp
         g3AQ==
X-Gm-Message-State: AOJu0Yw+0ptPdeKW1TACqb6C1hsxXnzfWm5ZZNrbgOimVu3hS/pydCTK
	UZdyODWYUT7YU/lavphr08kqIxiQWDBL8C3FNcA=
X-Google-Smtp-Source: AGHT+IGYrXP2e7knj/z+Og6xhAOYpCEEnoJsDJ3ZEnfkAd8N2GkuARRzHysEJI3655MPIBK5lLyWSQ==
X-Received: by 2002:a17:90b:2252:b0:276:a310:2be3 with SMTP id hk18-20020a17090b225200b00276a3102be3mr263576pjb.19.1696361831520;
        Tue, 03 Oct 2023 12:37:11 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:37:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] ccache: fix build with gcc-13
Date: Tue,  3 Oct 2023 09:36:48 -1000
Message-Id: <6618e5bf994f49ed93bebc4280980e297be6af98.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188658

From: Martin Jansa <martin.jansa@gmail.com>

* needed on hosts with gcc-13 for ccache-native

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


