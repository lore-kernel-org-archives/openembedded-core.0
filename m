Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5F1D116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:29:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4219.1764667773710177968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RAEyCrGq;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso2262849f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 01:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764667772; x=1765272572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+pBVhzoL21YU4uSINNr3pzhxAGcbaAQmOkQAJTYUig=;
        b=RAEyCrGqbVBqtZqqnXinhJ+xnq50g/YG+3oIvImVjqPsF6phrNdBQZpXYvRRrUnriN
         JlgYf734lJLDMSqYn6Aqs/kv4sf8edBAVh3PaPA6sKKcRMTYQ9mXnMc/9kqnMCGP42WV
         3VnRsRjLYSVIr9mbKciyv0UJ3c8xMFLK0E8uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764667772; x=1765272572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+pBVhzoL21YU4uSINNr3pzhxAGcbaAQmOkQAJTYUig=;
        b=oDSceuZbhbxMA0+ZxG6BSXhaSBNlbFcEHcsJLiq0qTWjg5yxERGXuKeyMo9cJvv95J
         MyPdUvptZB8StvgTVVghSBt0diARMAnOIoKFgnjXXiobWHJaD0qmJdniKqObOrqT3hzI
         CfEPMWbh5owxSK4+fDFVU76a+kEP61JflRIBsAMWgEoJOKrOh9CjPzniT4VWWO45Tvpx
         tn9RWo6zAIOmcbtjU/B03XPZ6w0v+33BOV2VhXvZ2HgPbTXTUN+CW2GDV0rPxXGEk2Mm
         A8uOT6ahimgycJVUSfoszUgJt61E+eQL0B5kHrm7iiBuhNc4KxL4hhS2MjmteKHcEvVr
         sVAg==
X-Gm-Message-State: AOJu0Yw6a9xOKcw9VuGyNwvsoy2a/QsmuVNLALJFzy1LtUUyh8N8YFAo
	NKf2dXgIZDe7DHIiI/AbSKCFrH3YLtzsdnM1rgu2WyrfbrWGNroYnaiI/GOwJefLNGQjeMW2y78
	3vZ+m
X-Gm-Gg: ASbGncsfqEfzZmUna8EW40Hxk73iInh+qUL/S5SxHAlbvDX/8oDZMEO0Ccq47Rowkpr
	+vSQjU1xoAhgQOKgK6h9qmENxCNbb/KRibv1Bk00NXasUngaYvWJ9c3o7nXFPmhkWvDRyHp+3eg
	5BzJc69tHzLqYDN+PpRt6ZrnzncEH+rP88hlrhiHnKT/qFPeIrltbeB9lXT4gNBIfwZ272cO3gq
	0inD9Qeyv2bB2CmrKeZqSyWeDziyuD+leUb9CtUn5GuXsW8H1WmY1GEYWJ4PKj8/BF+7TdkVIx5
	cbPaxPGm5ZGQyihATp9xy/iM26Qrw471q895rB/S32WrayILEND8DVa53Ot/Uy+ML6++ktcnnXs
	NJb2lz4hjEv2TiNGt6laqg4KkofXfU9xWKjZ/LMY4eL+wkoU7uX92JOx3luZE3qiMbtRk7/GkT6
	/V9kzhThoNjVsMYae7AGnfDUlY
X-Google-Smtp-Source: AGHT+IFZER2lXsrghgvTQgaL4abBI92sXlUKfnIhkjNlHYzb9V80/bD3kBbWYJt6zuoQ1MQfaAt9Sw==
X-Received: by 2002:a5d:66ce:0:b0:42b:4267:83d5 with SMTP id ffacd0b85a97d-42cc1ac9d42mr32465635f8f.8.1764667771429;
        Tue, 02 Dec 2025 01:29:31 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm32148400f8f.15.2025.12.02.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 01:29:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/3] python3-hypothesis: Upgrade 6.142.2 -> 6.148.5
Date: Tue,  2 Dec 2025 11:29:24 +0200
Message-ID: <20251202092926.1370646-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 09:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227152

Upgrade to release 6.148.5:

- This patch improves the error message for FlakyStrategyDefinition
  when the precondition for a rule is flaky

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-hypothesis_6.142.2.bb => python3-hypothesis_6.148.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.142.2.bb => python3-hypothesis_6.148.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb
index 5ba7c66577..b461e8f9b6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "c4204a2ce327e45fbaf83a2b58142a285135698dc1d08e368ae9901f06b49e64"
+SRC_URI[sha256sum] = "bb0c67bff155b8d8cfe8fbc1f1218028f7e2f0ee7f24d8ccc89f4c14ee4e65c0"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.3


