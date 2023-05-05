Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F72C77B73
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 03:45:11 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.19242.1683258309459014085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 20:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dzhM2B0U;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-24e5d5782edso1245691a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 20:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683258309; x=1685850309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqr1zhTTY8vTkiejWnkOtV9cY1sHCtcAD9PrhVnYGXc=;
        b=dzhM2B0U18J+YWC+iPE76qRs5t/3gJ+M2SlXOTRMIW4LqlkK7bN5QnvwLu3ho/XgFX
         qAQ+wMZluhQhXLUskh0x0tLLbIlf3gdI8W8jYdbEtakGdADfi4baycMqRcg4vrfD/PlL
         14010ws2c1hVegrTMzi49bblva8KVLbLlWhhq5dmnuPytQSaPnljaGJvK0Bvz2octYEU
         S+ecj3tjmXvCTblqWOndP8MmvHnLmfozilNW7CsXhzJ6UmYLrrqPXw8uCoipZxpjp45/
         o6poiRUkUqTWNx02eAonYPF4LFkudWxO5eOmia7kJKoSGzQ9iY4QMdAf6BLK5R/dCE2o
         j28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683258309; x=1685850309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqr1zhTTY8vTkiejWnkOtV9cY1sHCtcAD9PrhVnYGXc=;
        b=D2AO160dHYXKjG60phYWeuWxdI2BnhmR+ifcNK6fHtSbUsdVjVORQtKSEsacZmpddk
         GlWOJ38GSqmWITu/Ac6e1WaPQ4QbMXf6iQsyiKk/ukKRt3iJEYukt4f2ewLtLGGBlcgu
         e4lVQ9sl6wgOcjYUcdTzUVCcrDG764RTrgvDsUVywfR9tudb4+KUwnthSsatMvoQ+2m0
         2VoDt3MKKBwyfqqxGYUlQp7YPsAcVfGXn+71soRLqsAuqucMW6Z96KXTSYlx0L8bWLne
         mBSnUHMyRLuSZ9NHAOex/mSq7z2qgWQcxWAGeW7n++6FJwmqAsZd040TG5yyum87OyUV
         0mPw==
X-Gm-Message-State: AC+VfDzhGyQgSdYmgF4jVJ+BoDjmJTiK2bKVL2C1q882R+ALrB7o1ZPy
	JStwYiPXGlozoWv/Cja2A32w7ssJbBqMfg==
X-Google-Smtp-Source: ACHHUZ6eTXO4KLPcSh5BXAWKgYS1auxmkUy7h3Y99Aijircm+h+egJrnvVJymvb12X9L3NnqpUjJhQ==
X-Received: by 2002:a17:90a:e60e:b0:24e:1ca3:7279 with SMTP id j14-20020a17090ae60e00b0024e1ca37279mr13849pjy.38.1683258308519;
        Thu, 04 May 2023 20:45:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id i14-20020a17090ad34e00b0024e3d26f644sm4489389pjx.3.2023.05.04.20.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 20:45:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] e2fsprogs: fix ptest bug for second running
Date: Thu,  4 May 2023 20:45:05 -0700
Message-Id: <20230505034506.2317260-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 03:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180896

From: Qiu Tingting <qiutt@fujitsu.com>

At second running, there are four new failed case:
  d_loaddump f_bigalloc_badinode f_bigalloc_orphan_list f_dup_resize

The test_data.tmp is necessary, but it is deleted by run-ptest.
So it should be restored after testing.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 1 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 1f873b055e..020bb69b16 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -8,3 +8,4 @@ rm -f *.tmp
 rm -f *.ok
 rm -f *.failed
 rm -f *.log
+cp ../data/test_data.tmp ./
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index f29c55e346..d3786d6f4c 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -141,4 +141,7 @@ do_install_ptest() {
 
         install -d ${D}${PTEST_PATH}/lib
         install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
+
+        install -d ${D}${PTEST_PATH}/data
+        install -m 0644 ${B}/tests/test_data.tmp ${D}${PTEST_PATH}/data/
 }
-- 
2.40.1


