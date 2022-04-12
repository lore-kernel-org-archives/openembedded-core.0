Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED04C433FE
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.6483.1649733225521692485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 20:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FO55SmAs;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id k14so15978994pga.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vSFimG91yUEmetpTcCcidfpwnEwygDLjfBd0UOKn7bM=;
        b=FO55SmAs/tHOQAppaQs9mrFcTGU5/Llu1Kd6arI9xppWJ9Q1trk8MNx5pcGl2cbdQb
         R8A3w4atWGOMcysi9UVfLjtKhPE8+IBClXYVaAQR/5MN9Tlp5ziBX+1xQehpTPlgLp8/
         6/Mg3YlX0F0LQ6lnt84wfJgaBI5wuF2B9D5i82d2Jt68TlYsYlIB38pFf1ayHe3ObMjr
         iPowr/3vWsmhSXoQjiCaPmSsIruC3LwBDMQIYvoZPr/Fn5+hfh2ZawXhvd6+ZFEY0lY6
         JRpIv9xCakc8eYEf9npjJVIxRatu6WQfzvPVJna80TSspY0VGYiaskiaJFBw8cXd7nxw
         sHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vSFimG91yUEmetpTcCcidfpwnEwygDLjfBd0UOKn7bM=;
        b=4xlrFFw6EWM0DrRwHbY9Eyi5RqWAmrZyzRZ2UEkwvLMG4s8Qe3RvRcFJ3rqkjccE6P
         gi/qePR4tHABnuEh/HRW/Xj7D29KI4Bx9uSdR2KTSwvN/txBFrzu6MpKRcKpWXzl5uCY
         Nwv7DnePdMnVjGpq/DEiToz/b61P8DEzx6jim5V3Csdf1150pAcKOo+ZgWMlR6Ixk6oQ
         MN1qZJ2d5SoklnKqlToWhWNSm0Aipm+9X+YOi2e+gaymwFhh4hmXZWvVivZUbObP93LY
         TvVuEzCB7omkbbGu8gERNiU4hX+tYpvLFzGB/JCwOFLKBk3atklyAq3dZUCczIC3LR4k
         Qp+A==
X-Gm-Message-State: AOAM531A/JJ/gLcyuUkyx5ZLMoIR3IHfNM6y25Mp7ZusKwFxJ5lgLF8R
	o5DAyz2NYoHiQ5LgnfR6cW4/cKhHUcBCzQ==
X-Google-Smtp-Source: 
 ABdhPJwSzvtLqqzZ3SOUHZL2fNrTCFvZqWn9rKglOCuYDxtUrVoUrgqfCvCchRGYU9ruW4Qu0zbBsA==
X-Received: by 2002:a63:5219:0:b0:39d:7212:4b3f with SMTP id
 g25-20020a635219000000b0039d72124b3fmr4054639pgb.255.1649733224732;
        Mon, 11 Apr 2022 20:13:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a17090ad3c400b001c65ba76911sm873046pjw.3.2022.04.11.20.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 20:13:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] ccache: Fix build with gcc12/mips
Date: Mon, 11 Apr 2022 20:13:41 -0700
Message-Id: <20220412031341.594068-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412031341.594068-1-raj.khem@gmail.com>
References: <20220412031341.594068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164251

Avoid gcc12 failure to inline function on mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-Do-not-use-always_inline-with-mips.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/ccache/ccache_4.6.bb    |  5 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch

diff --git a/meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch b/meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch
new file mode 100644
index 00000000000..90cf27b4187
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache/0001-fmt-Do-not-use-always_inline-with-mips.patch
@@ -0,0 +1,33 @@
+From e57ce7af6f1ef0400aa847d79a7d3bc8803838bd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 Apr 2022 20:09:18 -0700
+Subject: [PATCH] fmt: Do not use always_inline with mips
+
+mips/gcc-12 is not able to inline this function as reported here [1]
+For now workaround this for mips by not forcing always_inline attribute
+on functions
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105234
+
+Upstream-Status: Inappropriate [GCC MIPS Workaround]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/third_party/fmt/core.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/third_party/fmt/core.h b/src/third_party/fmt/core.h
+index 92a7aa1..e343ae0 100644
+--- a/src/third_party/fmt/core.h
++++ b/src/third_party/fmt/core.h
+@@ -212,7 +212,7 @@
+ #endif
+ 
+ #ifndef FMT_INLINE
+-#  if FMT_GCC_VERSION || FMT_CLANG_VERSION
++#  if (FMT_GCC_VERSION || FMT_CLANG_VERSION) && !defined (__mips__)
+ #    define FMT_INLINE inline __attribute__((always_inline))
+ #  else
+ #    define FMT_INLINE inline
+-- 
+2.35.1
+
diff --git a/meta/recipes-devtools/ccache/ccache_4.6.bb b/meta/recipes-devtools/ccache/ccache_4.6.bb
index f019679cf18..983b62c1359 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=ff5327dc93e2b286c931dda3d6079da9"
 
 DEPENDS = "zstd"
 
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
+           file://0001-fmt-Do-not-use-always_inline-with-mips.patch \
+          "
 SRC_URI[sha256sum] = "73a1767ac6b7c0404a1a55f761a746d338e702883c7137fbf587023062258625"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
@@ -24,3 +26,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
 PACKAGECONFIG[redis] = "-DREDIS_STORAGE_BACKEND=ON,-DREDIS_STORAGE_BACKEND=OFF,hiredis"
+
-- 
2.35.1


