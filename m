Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E41AC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.3351.1637741322144243404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N9/tfo80;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i5so2625046wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UR3WELEOWGgMdaqVPhdRzrzaxs0AG/N0Lk5OlAF+QhQ=;
        b=N9/tfo80w/VT1+dNqOG34TPZeSOyboM6+roYFmpQnYERvgkqGwThWEkgR3jpTyPJE6
         IDApZ17VFxmGRGiKsFgxlRAwtBMQ9SSQe1UYm25qP2EOFqeYL4xaGXk5YO2y3vi2bK7b
         mvMDfl9zOESk4yCjfPjO8BsnDZTjCHzijKWYVrfzWtVCNvy2SB100fA/J0T8kzQtzipX
         tyKd8zfcPEm8DLIfGgOz7PM3No1zc3ByoJfcPOYL0GTIXJB9lYAxPuPkAwTzskNv9WuQ
         QC1sOgbFiQmAsRIPRfyMN4SAX68G+FIs0x/lguzghODyvF3YmX4Ws+T5OagaJz4597+Q
         gCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UR3WELEOWGgMdaqVPhdRzrzaxs0AG/N0Lk5OlAF+QhQ=;
        b=RYmeyBjQkIxigqAYgFzLynsoUCnfoRZhvnshs06Vtat/cqdKgheicH4I4S2gdd3HE6
         TzUyM56/26XNmMX2aKrqJY6Gw+pRSL/oBSt/1qQN3LU7YwOJSdfqnR5pGF1YHCMzQ9t+
         AFjLFU+exlAgbJz9ffNWuPQ+gImW/G0CjFl4Iy7yHKIUQAUyr3IWT3ScyhJ8ZY72tyhw
         fqqFXjv98pNY3+Y1zRylNP3hW4lTFnuPo4viynU9owoIhYjT8DC0cFRUwq6u4OPtJGNG
         rEmH2xXeneSqzPzeladXFGxvf/WibZU2ECo/tP2KTIHkWr1XXh7otC7RTYVqvP20LlhL
         Rx3w==
X-Gm-Message-State: AOAM531T+y6ECLhkN99r5mLtTn+h9BxdPkUxzbSW7tjQoaVTK6AIAPdg
	+RN9Zkfw1GwMa+ifYvB/g3xhrZVcG1IhqQ==
X-Google-Smtp-Source: 
 ABdhPJzCXpTkBZX8jH6AaV5D+fvaAkHHRIEybvQX8GEi3fOJFKcSxOW7tPgjNeicy6CID+z0d+cTYw==
X-Received: by 2002:a05:6000:248:: with SMTP id
 m8mr16434305wrz.404.1637741320645;
        Wed, 24 Nov 2021 00:08:40 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/21] elfutils: submit patch upstream
Date: Wed, 24 Nov 2021 09:08:19 +0100
Message-Id: <20211124080828.530981-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158668

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...infod-client.c-correct-string-format.patch | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
index 5b225c532d..85f22cb395 100644
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -1,4 +1,4 @@
-From c3055ce9eb32d0d24abc5cea5e1d231c499312a7 Mon Sep 17 00:00:00 2001
+From 38ddd0d1863f83e8ec545d0160bdf00bbb5569ba Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Apr 2021 23:29:10 +0200
 Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
@@ -12,20 +12,20 @@ architectures, therefore directly using integer printf formats will not
 work portably, use intmax_t to typecast time_t into printf family of
 functions
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [via email to mark@klomp.org,elfutils-devel@sourceware.org]
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- debuginfod/debuginfod-client.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ debuginfod/debuginfod-client.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index ee7eda2..083ec2c 100644
+index c875ee6..df9737d 100644
 --- a/debuginfod/debuginfod-client.c
 +++ b/debuginfod/debuginfod-client.c
-@@ -226,7 +226,7 @@ debuginfod_config_cache(char *config_path,
+@@ -231,15 +231,15 @@ debuginfod_config_cache(char *config_path,
        if (fd < 0)
          return -errno;
  
@@ -34,16 +34,17 @@ index ee7eda2..083ec2c 100644
          return -errno;
      }
  
-@@ -234,7 +234,7 @@ debuginfod_config_cache(char *config_path,
+-  long cache_config;
++  int cache_config;
    FILE *config_file = fopen(config_path, "r");
    if (config_file)
      {
 -      if (fscanf(config_file, "%ld", &cache_config) != 1)
-+      if (fscanf(config_file, "%jd", (intmax_t*)(&cache_config)) != 1)
++      if (fscanf(config_file, "%d", &cache_config) != 1)
          cache_config = cache_config_default_s;
        fclose(config_file);
      }
-@@ -267,7 +267,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -272,7 +272,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
    if (fd < 0)
      return -errno;
  
@@ -52,7 +53,7 @@ index ee7eda2..083ec2c 100644
      return -errno;
  
    /* init max age config file.  */
-@@ -275,7 +275,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -280,7 +280,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
        && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
      return -errno;
  
-- 
2.20.1


