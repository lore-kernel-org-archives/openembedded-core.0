Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1816C07E8D
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 18:32:00 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.168282.1692210717318826176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 11:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gzU6Cj8c;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso45001915ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 11:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692210716; x=1692815516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKO8NclC625SvFyZj6F39sNekIpZKf3TMjW5iWcUqZk=;
        b=gzU6Cj8cC7WN4bcJyUiBLM6UISxrHbHQQUYA3Bo/m4RGcxdDtBRgqf3ArdRUXxZbem
         gGjdw9ZHdIjx6O9CgN6HhMn/uWJ9uHrX7rUhB9eaLKDlEMpdF1BXkXtAuddzxZmHhK9f
         vHIWAVBYV4IJTBzK1uxYqPrISEXf+CSaY9mk4ID39vtxffQEqSGHtIIt9H2tJyJhhmye
         lZ7xWIDfAVozynapyrCI2EFsfj5GzKPnLXNNOvxPsyotv73v+npDeXtz/qMiXAVhP4/M
         SMZDaKhwx/Vuxhho8KTNqiUT7p3L2k7UTuhNRmqdb74l6iwhcMqBpZQ/okvgh8P8ahcD
         KrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692210716; x=1692815516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKO8NclC625SvFyZj6F39sNekIpZKf3TMjW5iWcUqZk=;
        b=Qvi1oXvvoGEJUFEMOr6puCrfIC2cLmTjGiYBxssChFc0JQ9GpsCeBIGlOfcMdAAsVx
         R8PC5cAou2iOxu2NMOwojD1QGBVHzg2l252wGEbZZ2/+OzWhu5RpKQioBXfLwNI7H1h4
         ITI9WKlC/CBYLZ02j2AUDCBpdGsxjkJCczAB3i00SEhtF90LqsVzOIooj884ajQjYDC8
         ORTKEMJ2Wo9DgZQCQBzztPFPk5x6++2psx+D9GMi/D7aTmberytwpqxyeoPIVN0QAJdE
         vR6se/NxATFYcYoi3Z0IULXa1RlqFQ1LyZHcfH/EBzVKpjJUP0Q7xmGsFjM9kUyQGS4X
         9xqw==
X-Gm-Message-State: AOJu0Yw5AJaH/mHrZYtv+zGKM0Tmpyu5cfsY6F45VcsFCYC5cF6MQJxP
	/9Os3HGz4eohakumKzd5gSAGYE/GZuexTw==
X-Google-Smtp-Source: AGHT+IFtA9drw3AbmZsNPeEsjkDrWm4etgQWCHz/hWs0feCxscfXliFNnE0ssaLMyDBMXiGbUzeTaA==
X-Received: by 2002:a17:902:bd42:b0:1bd:d141:f02d with SMTP id b2-20020a170902bd4200b001bdd141f02dmr2289893plx.68.1692210716270;
        Wed, 16 Aug 2023 11:31:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b001bdc8a5e96csm5772920plb.169.2023.08.16.11.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 11:31:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] build-sysroots: Add SUMMARY field
Date: Wed, 16 Aug 2023 11:31:53 -0700
Message-ID: <20230816183153.4110152-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 18:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186137

Fixes build QA warning about [missing-metadata]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index ad22a75eb23..72da88921af 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -1,5 +1,6 @@
-INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "MIT"
+SUMMARY = "Build old style sysroot based on everything in the components directory that matches the current MACHINE"
+INHIBIT_DEFAULT_DEPS = "1"
 
 STANDALONE_SYSROOT = "${STAGING_DIR}/${MACHINE}"
 STANDALONE_SYSROOT_NATIVE = "${STAGING_DIR}/${BUILD_ARCH}"
-- 
2.41.0


