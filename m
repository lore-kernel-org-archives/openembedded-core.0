Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC99C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 19:40:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.38.1649783014350004909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 10:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6IgGQzq;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id v12so4368454plv.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0t6kPBJ1p6FnE4XLZvNBn8mQZ1iJfPWnPhb2xa1njjI=;
        b=G6IgGQzqGtAKqU1EkVH5c/isO6dXrLdzXisuvma/gz/vDf92E9fi9/q51htAxzHScw
         bLOyq0LnuoiYr8dmSoXDn5mvK0ZhWEn+2Ox4FT6H3cXcfymOXHtG/9TO8mzYJbf698k2
         5mUgnGKh9KJ4wvRQnO+OLWYvxuRKxXihtGN64Z4poWutSoNLqd0wblTcBotChb5ajaux
         tB2cnPndtv58BqGesIGEng/B1PLbkzN83Z1P79cB1hiL1NdcosN4IlCVQMPJ8dmCfRgr
         JTe+lwahT0kvQqgoanM7vckqAv9N95J5ehgjILemmZxKE0K51q+xsWT19+qViiHHwUyx
         EVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0t6kPBJ1p6FnE4XLZvNBn8mQZ1iJfPWnPhb2xa1njjI=;
        b=Qb6Gt7EgyKDEZYZS+jLmQOuYmpni7XnN4ZV80BRQC3lXiitH7j47d4mtmhArVGU96K
         F6LmNqQxHylwtTiUHuQz0JS+Ws1JF0tf0pLeLpE0cAlumZLaEHZyqRfUU74JSXrhZmz3
         DkxAZKJg+Zgi/5EfczIlxD5vu6ryy5lgjQnN0K3wd6HoRiKed1TAf8pJ3gjTMPmVZoGN
         CSpDWg5p30p//GQTxs6cOkZ6AmrYsJa4j6drycASPT9a3jDjL75U8owtu2GXSLJKwtk5
         Mm9rm2ea0y+DohvoGlgAS37TLihvxtXbp8/Ino9yF99xJSHT6vDLw6ZGQHYP8PKSWh9A
         BjKQ==
X-Gm-Message-State: AOAM533RQfPuD9nhFPfZ4D2iAnprC2lPkdw6DGn5BgTD+QBMbldtb4wv
	WeQdeF7PkGheqAuvOLbT6AxVkrbocTgIjg==
X-Google-Smtp-Source: 
 ABdhPJxZEWr6MeY15c1/RsEOY3oSiAL8aDRhyRKgUPjRamSS2tk/x7h4f6NIv4iACI7rxW/ZMmPAQw==
X-Received: by 2002:a17:902:768c:b0:155:e4a2:1f09 with SMTP id
 m12-20020a170902768c00b00155e4a21f09mr37544732pll.43.1649783013643;
        Tue, 12 Apr 2022 10:03:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 s3-20020a056a00194300b004f6da3a1a3bsm44338142pfk.8.2022.04.12.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:03:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ccache: Fix build with gcc12/mips
Date: Tue, 12 Apr 2022 10:03:31 -0700
Message-Id: <20220412170331.3234683-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 19:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164281

Avoid gcc12 failure to inline function on mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-Do-not-use-always_inline-with-mips.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/ccache/ccache_4.6.bb    |  7 +++-
 2 files changed, 39 insertions(+), 1 deletion(-)
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
index f019679cf18..740f92fb45e 100644
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
@@ -24,3 +26,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
 PACKAGECONFIG[redis] = "-DREDIS_STORAGE_BACKEND=ON,-DREDIS_STORAGE_BACKEND=OFF,hiredis"
+PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF,,"
+
+lcl_maybe_fortify:mipsarch = ""
-- 
2.35.1


