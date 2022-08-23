Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447D7C32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 18:01:57 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.1164.1661277716194185549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lVDo4dzL;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id bf22so14679737pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 11:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7d6SyKYnCt+L0avf7q8W0n6TnAZf3lWgEJfsceBWe4Y=;
        b=lVDo4dzLESmbxeTCdK75dl4MjDWBFmUBmNWFtuSY6gSfVgNwrrjj0LWpYH1q3hpa59
         GYC4RNzansiFVFqhnwM61mR4W0UHDWuRn77PV6gwetE/hw4t4M7eT7E+8+O+m6TEnZ1f
         rfkZdHp/ohFkFv2y8fpzIkOCEJzIuwVEWrMSgvyfNraWCjcmwO7f+amQ9bn6fxmsvG3h
         sUirU+36XjbE+aCCncfF7nB51XPlEDu6N1GO590OCoX7hIVI7mDD7YAtKpr9nloYmJCY
         Iad+0AuURvCXjHYKc7UKI18V9m786ttrkNZl1LAeKXs/3PpZUqSKuDJY1lUB+FInBbIM
         jiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7d6SyKYnCt+L0avf7q8W0n6TnAZf3lWgEJfsceBWe4Y=;
        b=wnlA3iwd2BrMXe+DzKdq8B0zVJE31s/BkRo9erpesQWF/6uN9IMYfqHeI3hReZEnSB
         Ers477TI6v9IxPXXPpzJluaqubxa5PdokA+MOQwrUBEvtULzVhMpp/nu4fL4Eybdk7OX
         uP/QL1IJXFo8xdkHw/GpPbaFvzwjy+vzGaBJ9j4tgUsq270v+TAMShSxPgPBQ3VypKTp
         awzLU5fdqWPhNnkJcGc0+P+OKIKFc9c9WvJVIW0g2jxe9L7XR5ekN2T2ZMvdSJp+1YSd
         /5y3pDV6ic8p+zKSduKDzNPEWNdPnpfS+MyBGTxOfbBMxHUZUgiy+M5qGtYYVvRZBEsG
         VQTA==
X-Gm-Message-State: ACgBeo28AotNq1dYY/JhBdEtqHYNipCyBbH1wGep5ic5k6HzoK4j/0l+
	jQmqe1UvzPA1Qyklv0k/Z2wFRrUMmQCtrw==
X-Google-Smtp-Source: 
 AA6agR6TXt7Z1HxoAfJWJomrpdUeACa7iGpnB0ewAGRe0xoWdCvwPd9VGBahgq/1NUfwDPtS1Q80zQ==
X-Received: by 2002:a17:90a:d982:b0:1fb:aec:e8db with SMTP id
 d2-20020a17090ad98200b001fb0aece8dbmr4251290pjv.148.1661277715315;
        Tue, 23 Aug 2022 11:01:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a2c0400b001f54fa41242sm12290295pjd.42.2022.08.23.11.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:01:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] ccache: Fix build with gcc12 on musl
Date: Tue, 23 Aug 2022 11:01:50 -0700
Message-Id: <20220823180151.3321962-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823180151.3321962-1-raj.khem@gmail.com>
References: <20220823180151.3321962-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 18:01:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169723

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ccache/ccache_4.6.1.bb  |  1 +
 .../0001-Include-time.h-for-time_t.patch      | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch

diff --git a/meta/recipes-devtools/ccache/ccache_4.6.1.bb b/meta/recipes-devtools/ccache/ccache_4.6.1.bb
index 0d6471ddbc..716aec0584 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.1.bb
@@ -13,6 +13,7 @@ DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
+           file://0001-Include-time.h-for-time_t.patch \
 "
 SRC_URI[sha256sum] = "59b28a57c3a45e48d6049001999c9f94cd4d3e9b0196994bed9a6a7437ffa3bc"
 
diff --git a/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch b/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
new file mode 100644
index 0000000000..6c1d3cf4f9
--- /dev/null
+++ b/meta/recipes-devtools/ccache/files/0001-Include-time.h-for-time_t.patch
@@ -0,0 +1,31 @@
+From 3d3364221c235c733436abaeeea9b5e6813b06ae Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 10:27:21 -0700
+Subject: [PATCH] Include time.h for time_t
+
+Fixes
+src/core/Statistics.hpp:41:37: error: 'time_t' has not been declared
+|    41 |                                     time_t last_updated,
+|       |                                     ^~~~~~
+
+Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/1145]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/core/Statistics.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/core/Statistics.hpp b/src/core/Statistics.hpp
+index 3e9ed816..0017f209 100644
+--- a/src/core/Statistics.hpp
++++ b/src/core/Statistics.hpp
+@@ -20,6 +20,7 @@
+ 
+ #include <core/StatisticsCounters.hpp>
+ 
++#include <ctime>
+ #include <string>
+ #include <unordered_map>
+ #include <vector>
+-- 
+2.37.2
+
-- 
2.37.2


