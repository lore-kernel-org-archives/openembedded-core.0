Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A001DC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 04:37:32 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.5436.1634618251621483641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NjzT5l7m;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id m26so16533502pff.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0XsmCZakFCWrhpUKnFyZZh644wg9pCARs/AgqEfbIY=;
        b=NjzT5l7moLono3Vkltx6Hh/t+SYnDU2SZVjvrGfNY6ZZwV8kf17cxxRJuERRKBIoZu
         4VM+BmNsq9Z7rdZHVcNonEjiBpFdFqSWCzyqFn9U+o6XzwyVdvXfweqTfZ61PNPygMa9
         tuFI9nLH67Rdh8gaQCb+AvGv2PAPLPGGPV1HBTWleVOiXWWzXD13o4Hwiu/BCOxTAxKQ
         eJBlyt5YyjswdAXBhFGcvQpK+KFlR60hKZlnstA8Zvk2ZZ9ThnTUATAG3UB3CzEEvTOI
         bPIYnCiP8LbZ17+07iKhV2ydltObZ7BJaJpuSBYpAsj4ZJrQ/yh+Yge9CJSyBiL1WQGY
         iz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0XsmCZakFCWrhpUKnFyZZh644wg9pCARs/AgqEfbIY=;
        b=ouqV+8+zVv32v9eIeEkZxr+w/3h+3QZE4hUZWyIFQ3VFgVjER+ltcisCLsdFnH1WrD
         T3XT+eBTuO0ry7vPV/hjw9hTC+3MT5PvKCTz5UJjbaCO16nCYeuJgi/ReR4VydcBjapQ
         EG3fMvV5NvlfekkM05gzEoxt+MDMcdg2a/r+A/AVotv+YswigyHbHBf/8p9MtEpY4wNx
         QCYdZXP7eXxiZDy4f6fQab/JwMbFIf/AVCaxaHcMdOhnhjKcEgSef8gTgvj8mIme9RJ/
         BJ3+JuGyKapj8Iho8Hk8ZbEziP6r1VazSNCR6Z4of8VGrNTbCUVoBIRELp0CAMSQanSK
         n6yA==
X-Gm-Message-State: AOAM533JB1NOmvlyFXyM8trgkJQJSwHTzwc26hsnW6Y8bVT7Hf/o4lTD
	yLLA5vbmbcky9rHODHEL6ov7+xdxXic=
X-Google-Smtp-Source: 
 ABdhPJxQ29ddJTOOjqJkYneQdwM5rUYf2hdI7RgFwcKfsVAnLJr30YyhxKGdVJnPPdSbE9MqxLG5pg==
X-Received: by 2002:a62:8f8e:0:b0:44c:f130:9291 with SMTP id
 n136-20020a628f8e000000b0044cf1309291mr32890450pfd.19.1634618250989;
        Mon, 18 Oct 2021 21:37:30 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 t11sm15614974pfj.173.2021.10.18.21.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 21:37:30 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	martin.jansa@gmail.com,
	umesh.kalappa0@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v3] state/staging: Fix directory not deleted for race
Date: Mon, 18 Oct 2021 21:37:25 -0700
Message-Id: <20211019043725.72580-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 04:37:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157103

Modify the SYSROOT PATH to fix race around issue when rust-hello-world
is run for two libc one after the other.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index 42163f7b81..bb625f4240 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
 DEPENDS += "rust-native"
 
 PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TARGET_ARCH}"
+PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
 
 # In the cross compilation case, rustc doesn't seem to get the rpath quite
 # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
-- 
2.31.1


