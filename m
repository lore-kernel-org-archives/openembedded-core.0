Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FC2C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 17:31:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.129.1638466298475471233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pV5yFf0w;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id y8so233585plg.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9e4Xa2gl4Np2c4z9FitQFUOlh6lllVTNe5YVNlFhfnk=;
        b=pV5yFf0w9SwxKREmOn8/rqbqQdkZdzqFnih2CtBu+PLdIj+AEUk0tp9uIgE1LDI+Lj
         4Yh+sH9E85frEd1HyP75IBHcE+7iu7B0+T5vIf5hhI+LcALLNBMt9Xf2XJ6P0uBsKRao
         NTvE3C66mHqy5KvaTGry2PFMUYXzNORa9m+jf7/kYkyjxjsGlOJxRVZTOk5AMQulrKOG
         qRZTIH6RZ8F6Eow/WBltS5qI5UUNnB1i7/7aoFoRokW6sTDWZ7xa34InR5zHeq4kpx0D
         M6vbRLTz9yh3p8UQWEL7x5ZxCTdxO00sUA6zA4fu7rhS+GwD+jEZZsJaIc6R9TZEU3gW
         kEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9e4Xa2gl4Np2c4z9FitQFUOlh6lllVTNe5YVNlFhfnk=;
        b=iZVzhQQVVQcp+GhTJng3WjzCkPNetLRG+FCm1YPqEiwcrhq9DrZ4ZNL4tB8IJMwZIu
         4QrVq1k1AKSF+B5P9X+MljpvWWOA922YK7nXe8kzALUmTDkrCg8e/ZW3TJVc0M/efGiQ
         lDOQjxpGCUTQ70l0p2Ba3fZ7gqNBfcvDU+AC6dyy+x8OnlJPahsP6xuwKv7PLZB3cfgb
         iYuNmXTW+8WOgWk0Kb+G0vy7HcrA7v2yCH8x8h2OOKDSkR14lUrLU0l+Nx5+5KmahUjl
         v2cGKg5/jGSi7DVvWyxTZJjpAvajt0veP3wqX4nXAEGJiww7RcMCFrNvhHumjFQGnm1+
         jmvg==
X-Gm-Message-State: AOAM530HVgmhx8XUzEN+ZRGpsGF8L/QYqQYntOJ0bZ9yFdzSNwOpTlrp
	BnoztLajokVLrKcUxu5hvB7w8UwHScNEPw==
X-Google-Smtp-Source: 
 ABdhPJxTF7lp+hUAeGW+ZivdH/Fa5L6MKxpB/iyG3PGMYDaIKLSGDRgenLKbaf7saF+n54LuAHe8pQ==
X-Received: by 2002:a17:902:e5d0:b0:141:cdfe:97d7 with SMTP id
 u16-20020a170902e5d000b00141cdfe97d7mr16454520plf.65.1638466297597;
        Thu, 02 Dec 2021 09:31:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 f8sm427838pfv.135.2021.12.02.09.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 09:31:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] perf: Enable libunwind packageconfig on riscv64
Date: Thu,  2 Dec 2021 09:31:34 -0800
Message-Id: <20211202173134.31341-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 17:31:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159099

libunwind now supports risc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index f473272096f..7bbc1ad70c5 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -31,7 +31,6 @@ PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG:remove:arc = "libunwind"
-PACKAGECONFIG:remove:riscv64 = "libunwind"
 PACKAGECONFIG:remove:riscv32 = "libunwind"
 
 DEPENDS = " \
-- 
2.34.1


