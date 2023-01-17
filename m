Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC06C38142
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 23:19:00 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.2332.1673997537748428138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 15:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TjI6DM6X;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id g68so22110605pgc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 15:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgA4V5mKpPFbUq5eH77Mq406hQBJ1H+mElV4w63Iii4=;
        b=TjI6DM6X/D/3WYETwq7htHAj4Hrkw9owB1vnYE3QTW4Yx5NLIxVYDmZkOS88kdLIJv
         WZ/JW3k3j/ADr4GFioKbDGtiza1VhHipXgFTlMK7rPVK76aLIxBUQ4eo3gVa8yJ8s7XS
         yv+FX/f/JlDqWBa//WG2UzDeNsd4uhXc+re9hImJRXWCxp4xPuhi1ak+8vft3ssuqM/c
         ysu7gjo/b4mFNt2ETuz7GOaLiUkg/I9JgjIqL1F6NmEIkoTduBbNOGTOsr8Brxzy55aD
         bSo9B71OL1Oyfmqm34wK61EBl8ajvBcrHvWLY6zkp3KR4DIik64zWGg+DML7Jmn2UgY/
         0CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgA4V5mKpPFbUq5eH77Mq406hQBJ1H+mElV4w63Iii4=;
        b=oTNk5XTLVR1rvKXqsXA16Mkx4CEvUdvXaXEHgKBI3jHsNaSF5BZz1DXIpCiHaSE09H
         Xwv0EExmMXRynBCjVIAmiAaVeV6sSWZ70Q9KvpR1F6WRnPQtSLpFUlWgEcy98F6ZHdwC
         QilIrr6eZWUmGQcoVyI4dwnXdGL0zrOLHIaWVBvkGlcG5UVMMjEGFoXldcd99Z4AZjAm
         cOUZNSUyZujNW3+XCC5dTcSDlVuZTrxPlUo+J17vKz8kARGZPmgpRpKJB66ffa6qHyok
         CN2A7EeUo4pSaCfNIL6x3grWKFL9r6iTPn13MRf2C/P4aumXKIB/Xj3ll1/Wygv4vWap
         jndQ==
X-Gm-Message-State: AFqh2kqHzzny/1IxgpvNeFZf6P6QGybDyGnVGvisuMaDCZijmkrpMpFS
	6yPC2D5DPgqfdfUjbHnZK7deWRjyB81UrQ==
X-Google-Smtp-Source: AMrXdXsogwMzYmfpU5fjMEyWgzr+ub0H/kXKqGawz183HD3C+8JJgEQ6Kx/gr3Z+fSgM+gHd3gRD/g==
X-Received: by 2002:a05:6a00:4c9c:b0:56e:a7a7:35a0 with SMTP id eb28-20020a056a004c9c00b0056ea7a735a0mr6034919pfb.25.1673997536880;
        Tue, 17 Jan 2023 15:18:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id y15-20020aa7942f000000b0058d92d6e4ddsm5445717pfo.5.2023.01.17.15.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 15:18:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] vulkan-samples: Drop using u8string_view
Date: Tue, 17 Jan 2023 15:18:52 -0800
Message-Id: <20230117231853.1511529-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117231853.1511529-1-raj.khem@gmail.com>
References: <20230117231853.1511529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 23:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176068

Its deprecated in upstream fmt as well. Moreover it helps compile with
latest compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Deprecate-u8string_view.patch        | 59 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch
new file mode 100644
index 0000000000..c2304bdd48
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch
@@ -0,0 +1,59 @@
+From 93987b1ce7d6f91387202495aac61026070597df Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Jan 2023 21:37:52 -0800
+Subject: [PATCH] Deprecate u8string_view
+
+Use basic_string_view instead
+
+Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/dea7fde8b7d649923dd41b0766bdf076033c62a2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/spdlog/fmt/bundled/core.h   |  3 ++-
+ include/spdlog/fmt/bundled/format.h | 15 ++-------------
+ 2 files changed, 4 insertions(+), 14 deletions(-)
+
+diff --git a/include/spdlog/fmt/bundled/core.h b/include/spdlog/fmt/bundled/core.h
+index 50b79351..e8b029ef 100644
+--- a/include/spdlog/fmt/bundled/core.h
++++ b/include/spdlog/fmt/bundled/core.h
+@@ -1484,7 +1484,8 @@ FMT_API void vprint(wstring_view format_str, wformat_args args);
+ 
+ /**
+   \rst
+-  Prints formatted data to ``stdout``.
++  Formats ``args`` according to specifications in ``format_str`` and writes the
++  output to ``stdout``.
+ 
+   **Example**::
+ 
+diff --git a/include/spdlog/fmt/bundled/format.h b/include/spdlog/fmt/bundled/format.h
+index 1bb24a52..39426361 100644
+--- a/include/spdlog/fmt/bundled/format.h
++++ b/include/spdlog/fmt/bundled/format.h
+@@ -407,21 +407,10 @@ void basic_buffer<T>::append(const U *begin, const U *end) {
+ enum char8_t: unsigned char {};
+ #endif
+ 
+-// A UTF-8 string view.
+-class u8string_view : public basic_string_view<char8_t> {
+- public:
+-  typedef char8_t char_type;
+-
+-  u8string_view(const char *s):
+-    basic_string_view<char8_t>(reinterpret_cast<const char8_t*>(s)) {}
+-  u8string_view(const char *s, size_t count) FMT_NOEXCEPT:
+-    basic_string_view<char8_t>(reinterpret_cast<const char8_t*>(s), count) {}
+-};
+-
+ #if FMT_USE_USER_DEFINED_LITERALS
+ inline namespace literals {
+-inline u8string_view operator"" _u(const char *s, std::size_t n) {
+-  return {s, n};
++inline basic_string_view<char8_t> operator"" _u(const char* s, std::size_t n) {
++  return {reinterpret_cast<const char8_t*>(s), n};
+ }
+ }
+ #endif
+-- 
+2.39.0
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 26300ecb1d..7f52cb66c9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https;lfs=0 \
            file://debugfix.patch \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
+           file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.39.0


