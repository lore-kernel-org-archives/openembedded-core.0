Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9F9E6896F
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 10:15:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9217.1730369732750627145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 03:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEzNsctw;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso6374265e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730369731; x=1730974531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhTVbo8kkejhQ3roqrx164Vu/MyysuTp3Vfk7H4kswE=;
        b=HEzNsctwBna0QjNWVOrChXjX+A9u6z9WOP9Jx+aJj7Ku+Stbna3zwUxBmkLi4jMBgQ
         U6zxtNwJEQpvtNatBEgpp80YDH6qlHaFg7abgFLowexlY2N6Frfp/dUgvyP6d2Tc6PAF
         7eHvoMZm8/fexKIuRQAeRscF15Lo1K2HlYvHatiH44K1ULpdpR0GJBF6FkM2RWPzZi3Z
         Gz1ApH/qJcF4lc46pLQmJamUf8f2d/883rLBVuQUmo5FcbOLH7K/owjMgZl11ldcEqJR
         wYTKV/I0SEjrf25zFNT2SJCOBsriOfEff9c1HlL5gc4w4fSe/4+mhwu/30+i9kfOHzpW
         fHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730369731; x=1730974531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhTVbo8kkejhQ3roqrx164Vu/MyysuTp3Vfk7H4kswE=;
        b=N7g0jumNHaNqjVokgCqNtYpMWZcqXJOhAMDhZY5k2/KdYGlHA3rG2cHvhKwAvojBQZ
         0mrlHVoqE3+fd3c1Vu285KxO18euaCYd6fvHHgLZC1TfLGx+TzEyTqXJC5dXpJjT0vuW
         QmrpHqdt2NfdKIOYV5M2Q+VuIMS2Uz7iIO8rWXnVKdiTqhhWRMjiQgudvU84ltDz4w/R
         efsAG9LLPr7wtgZs/Q0x1/XQVaQl6h2X4GEKZ2iWNzGWB7dqqsIn0cQVI5EaUg8BoV+G
         arkhfaNU124UeULJe9vEPZHYnqMxjfjly5zb1clc6mNSvyhehMxibJ9PuNhkf3ppwHBC
         FlCA==
X-Gm-Message-State: AOJu0YwRTXnVbsBm6SLo8vJPg+4Ga3OvU2gxIJz+Xi8yjldcZTDprawT
	N1HH6OfCwVTInm6ArrqzTJUJzq1ti+KvIDidZdIgFu2Vc1/LiLnxHMXGxg==
X-Google-Smtp-Source: AGHT+IGIFNDEMimm9CPYDBoizYpfYnnEKR9ofdNCqlFQXOoI63MfdxS051nut5Flt9TW9VVQgLJYyw==
X-Received: by 2002:a05:600c:1f91:b0:430:57f2:bae5 with SMTP id 5b1f17b1804b1-4327b7eac96mr22609035e9.27.1730369730882;
        Thu, 31 Oct 2024 03:15:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab254sm20394425e9.3.2024.10.31.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:15:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/sstatetests: run CDN mirror check only once
Date: Thu, 31 Oct 2024 11:15:24 +0100
Message-Id: <20241031101524.1912927-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 10:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206574

From: Alexander Kanavin <alex@linutronix.de>

The first no-fail check was an attempt to work around the old
CDN's instability (and it didn't really help); it should not be necessary
with the new CDN, and only delays a-full completion.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index ae295bef5f7..b1035f25038 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -978,12 +978,10 @@ MACHINE = "{}"
 
     def test_cdn_mirror_qemux86_64(self):
         exceptions = []
-        self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_cdn_mirror_qemuarm64(self):
         exceptions = []
-        self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, ignore_errors = True)
         self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_local_cache_qemux86_64(self):
-- 
2.39.5


