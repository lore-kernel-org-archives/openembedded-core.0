Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596D6C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:11 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.15467.1721310365307170617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iL6x4mmM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fb1c69e936so5727935ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310364; x=1721915164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRHJ2Bk7mgrX8PrHcmFV/mfeSgwfKtFpSgMKqi7n0X0=;
        b=iL6x4mmMnjXtDqzvNCtbuuYtnupwvndTvBdvwltV32GY6j9FmGSssf2GWPwnbeATY9
         +MbhIgP7FoYtsnZJxs++X6XNULRZZJbh2wPZWBvyHi0Je/ca+TGFLTpamedr961UcFEZ
         HSa27W6F0A5OCerzBwrt4XRkk8NeMuAo4xyV0lmCZRNzxVA35pNhXqn4yyKhc2DmFNIX
         SqMUNFQyqaHtdy7hAtmHcj5qgMOcKyvujMcEHk9AKah/WmbcY0XDuBw43vXRjI+ua8nz
         izLVK0r+ROyFQkfI84icQ3l9r7+VtpGsOdEzuxbAFdBiWgUOXu/E3Teaf0sqoo8WHXH7
         8PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310364; x=1721915164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRHJ2Bk7mgrX8PrHcmFV/mfeSgwfKtFpSgMKqi7n0X0=;
        b=aBjo1HkCqrgBiaDSX7P8OLGHoFpaY/lBOcUeYLmPSOaYQw20JdlBmU6ATYmlLQfEAu
         Ao+XluHE7T9N2yRwbyDNlhcfRVl3jWWrGDB+7rgF4aIbuucjgss+I2FC1w+ALDnS/wSv
         yCAwa4r9FszACKLXch4T1uGuL85Uuvbh2sqiFK6ksmUFZcGS2uX2OOL/rxprvZ8NRyUz
         i6dzmTm0nZEPbBnPNaaO4F9EpE28vayU4Trukpo5gKEDf4StAc4A1uPUJGHJ3WTrPPX+
         UVLWompCMwP0zo92NIFE8RFytc0yecGpPoheBzwppUBaXyr5w/b7k6C2m9L+2puIGapp
         iCSw==
X-Gm-Message-State: AOJu0YyJ4NF5WRXXgJd5E+jf2e5dTqFURrZ4S77dWGEThRxiWZf5021B
	vQMgBkRbrdwKNsaBy8fdCwY3i3ouYXm0lUY/Byzv06VAe+Bdk24dp/I30it23UzrSayCHKmQWZl
	G
X-Google-Smtp-Source: AGHT+IFwX8Yc9lgPGJp4mZlb3/a4aIXrW5Wsa4TIxCeTFH+cj7wDVTJaXnt4F/08I7OydN38NcPGnw==
X-Received: by 2002:a17:902:e5cd:b0:1fc:3dad:25ed with SMTP id d9443c01a7336-1fc4e154fe1mr43832535ad.9.1721310364532;
        Thu, 18 Jul 2024 06:46:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:46:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/12] vulkan-samples: fix do_compile error when -Og enabled
Date: Thu, 18 Jul 2024 06:45:37 -0700
Message-Id: <cfff19bb3fae45e62f77e860a4413669a6dc0e81.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202221

From: Changqing Li <changqing.li@windriver.com>

When debug build is enabled(-Og is used), vulkan-samples do_compile
failed with error:
In function 'ZSTD_compressBlock_lazy_generic',
    inlined from 'ZSTD_compressBlock_greedy' at TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21914:12:
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21551:30: error: inlining failed in call to 'always_inline' 'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlining
 | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21736:32: note: called from here
|             size_t const ml2 = searchMax(ms, ip, iend, &offsetFound);

Refer [1], always_inline is not suggested to use with indirect function
call, replace always_inline with inline to fix the issue

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107931

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 246de52fe59de0612d1145357c5e904a51363c8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ce-FORCE_INLINE_TEMPLATE-with-inline.patch | 52 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch
new file mode 100644
index 0000000000..22538d4119
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch
@@ -0,0 +1,52 @@
+From a7bfe82a311c713b12bb83b8488574ad5c784f89 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 9 Jul 2024 04:29:11 +0000
+Subject: [PATCH] zstd.c: replace FORCE_INLINE_TEMPLATE with inline
+
+Refer [1], always-inline is not suggested to be used if you have indirect
++calls. so replace FORCE_INLINE_TEMPLATE with inline to fix error:
+In function 'ZSTD_compressBlock_lazy_generic',
+    inlined from 'ZSTD_compressBlock_greedy' at TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21914:12:
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21551:30: error: inlining failed in call to 'always_inline' 'ZSTD_HcFindBestMatch_selectMLS': function not considered for inlining
+ | FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
+      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+TOPDIR/tmp-glibc/work/core2-32-wrs-linux/vulkan-samples/git/git/third_party/ktx/lib/basisu/zstd/zstd.c:21736:32: note: called from here
+|             size_t const ml2 = searchMax(ms, ip, iend, &offsetFound);
+
+Upstream-Status: Inappropriate [ Latest upstream ktx don't have this part code ]
+
+Has report this issue to upstream Vulkan-Samples, refer [2]
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107931
+[2] https://github.com/KhronosGroup/Vulkan-Samples/issues/1089
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ lib/basisu/zstd/zstd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/basisu/zstd/zstd.c b/lib/basisu/zstd/zstd.c
+index eaf13738..423f149e 100644
+--- a/lib/basisu/zstd/zstd.c
++++ b/lib/basisu/zstd/zstd.c
+@@ -21548,7 +21548,7 @@ size_t ZSTD_HcFindBestMatch_generic (
+ }
+ 
+ 
+-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_selectMLS (
++static inline size_t ZSTD_HcFindBestMatch_selectMLS (
+                         ZSTD_matchState_t* ms,
+                         const BYTE* ip, const BYTE* const iLimit,
+                         size_t* offsetPtr)
+@@ -21596,7 +21596,7 @@ static size_t ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS (
+ }
+ 
+ 
+-FORCE_INLINE_TEMPLATE size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
++static inline size_t ZSTD_HcFindBestMatch_extDict_selectMLS (
+                         ZSTD_matchState_t* ms,
+                         const BYTE* ip, const BYTE* const iLimit,
+                         size_t* offsetPtr)
+-- 
+2.44.0
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index d60c0f3190..4e688e44a7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
            file://32bit.patch \
+           file://0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch;patchdir=third_party/ktx \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.34.1


