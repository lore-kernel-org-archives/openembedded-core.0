Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F9FC98312
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:59:50 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7737.1790171986250903373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HbG906wt;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so6563875e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790171984; x=1790776784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sbTlpzpopziojd9vF4n4WhO65lrpDf0y0st4ggYnxOs=;
        b=HbG906wtjYk0Q4kFl9u4yGlDn8/c8KqNMaa59mFQLb2NYH2ySxcmyPC7OAcWDQ3EBQ
         DYOrW3nZAmyIwqRtGmGkVyHBhNji2Y61rjIePHnYMg7KWrMi7FEykCWknxmG49jxmbr0
         Omkz+8UHIVkXqRKMZH8b6BrWiyl0/xoIcneSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171984; x=1790776784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sbTlpzpopziojd9vF4n4WhO65lrpDf0y0st4ggYnxOs=;
        b=wOTTBFhZKBjHH4oE61iwmOFspssHaKd7xGWfRuw4KKWEBGaSlPSuB/JthPi8KNRx6b
         CYiVmpynSGSnl1qVgPmqhYFBDtCVCl/szWX/7w8VQ0xn6OrWEXyz4aS+Qg1a607tJs6i
         btv9YLr0cBsrLfG7yAm1B/tL7jRwGiz7FICtWvvN4ib8rD4KQaa1c7V8nbIg2zLBmM9m
         JAdFEtdOY7pvn3tvnTLw1i2B7ytiPlr0foOY7YJBI0G6m6rU8V61i4o1YLaJ878TsFqc
         c5UUnMRVcBHRK3XjPkAxUVFg4HzMARheF/LSQ+cNocli50Rd6fGeZzPLLdsEaL9Ry77N
         ykPA==
X-Gm-Message-State: AFuF++nZkHBOZqN977FAQMNx+Jd3XG4zMTztoWTCx7p90glunXydVjBN
	cuBpjVZP33czOokureCNiEXHSyXyCDDf7irivbwORSbZ7TNDUCLbnYGiEFBSdEotPTVq/hiOSZ3
	aDnEScvc=
X-Gm-Gg: AYBFou0M8YyFJv7oCKzvEUHz42enGRB1AG+pUNSRpVPWdUkEAmYO18kFAdka1fOYtZJ
	lwbqAJjZzumFqZ7mNiurPLphc5pNZ+Dznr2imdlZEvV7K+wJSMbwninRNry9lFFMvVtkMttxmgC
	tes9Znz0yZ6/HFqvJG3bxgJV9sgdv+l95f9pY25nZG9Dd+tHah9Rpk9tJCl2yJBTWc9LarUNVJA
	FyEXN1RGBpHDlQUPofa4CQsr2cx1QQS46U0Iix9okTIGc/+7SHo7Yjq7liqAeg9ZkaBo6b2uyHP
	GwTc5F2o/bYkHeE1PJvPFX6MsVyniEDsvd200bmpbrQ0KbB6HNRBPIKwx4LcXp5z43aR3NNjo76
	4Rg0dpZ0L2caJ7mrgzReoTiiD8mfVadQaeh95H7peqvPZBwOX5KUFuV+CHqM+tWGcwBxqsvXif9
	s73jehD17icANhqmLnq3099YTNc+WYQU356Ncjcrj2w4PSFwqzkxZ+JSeVrkffVr4J2/9EHemlg
	S3P81T8FZBfyFATe/I+NWiZVRY=
X-Received: by 2002:a05:600c:4f4a:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49fdee0a97fmr44798365e9.2.1790171984416;
        Wed, 23 Sep 2026 06:59:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe43fc27csm8027945e9.2.2026.09.23.06.59.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:59:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] python3-hypothesis: upgrade 6.168.0 -> 6.168.1
Date: Wed, 23 Sep 2026 14:59:37 +0100
Message-ID: <20260923135939.3797785-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
References: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 13:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246517

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
index ec75251e705..7386f26afa4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "72af51087b7b5ab21c49f0d502f803c20897678652835596bd2a8b169a39135e"
+SRC_URI[sha256sum] = "fd8acb5c67f260dfbdcc1b2dc95ff48b2b3f90708ae595c76f591bbf3f6f8eeb"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

