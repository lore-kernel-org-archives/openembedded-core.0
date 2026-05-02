Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93E3CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9500.1777739446821315756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KbQ+/fI/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891b0786beso18996085e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739445; x=1778344245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcZSg+HIgGh+ZRHQ6HVxDbmDhuOwciJ/gOndi3tdz8I=;
        b=KbQ+/fI/kEJmpO+4avZWVz2RID+t3y4YPRT3FcASX4748sPUw8h00TqnYD+cXXDoWS
         4l7FI0t33pW50uZNmQ669uqzV2bP9oUIkycU2V8ECAoQIWOF3/LABD5jy7XlbQWUr6LB
         L3a+ZAIWSBwm45nvEGwR1TMYaH8hdLGvxs55A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739445; x=1778344245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcZSg+HIgGh+ZRHQ6HVxDbmDhuOwciJ/gOndi3tdz8I=;
        b=fsX3rxz+hpRAjpr4vG7ezjy89nvMSVyOpw6cZzim5VnSBqWW/aAO64gO0Fl70ozpUA
         9jsbYdA+cU4/Wwm4VlPaXQwH7UiAzlFEpuIGkIrsouua/ku1z2sVQ/UznnMWcGh5Ay+k
         JWirvXexIYQ3TtbFsLLfDBwc7oogblDSqFAzGkQFUn7InLixw87ZJtoSrXBtj7teC7TU
         K/8VJ0urkFH9aA8j70yDetj4RpwLvkJnR8TzPK3VvwrZysFwCWGGxm3+NUmduQxyHQ86
         iv8FkzGsPK/UOzJYo+N9SxGfcSRBNPsoPTpbiKOMYBKdVCoXquW5oLcF/CVjYu1Jp4Qc
         y3JQ==
X-Gm-Message-State: AOJu0YyjlSEFILGu0x/nQ5vNXXUWOinNqqSnaG6rzXhlPiaf3ZibHdJs
	aBABu+8Yiw9UObwawGVGw7HYAKuHsCX0vEfjfLmcg6tnFM4fRlGzsKwg0rRG6gIFt3kHJG4JStg
	I+5RshXLkKYZAdMc7hCY4wfA6a7wZa7mzG8P9B7IWRrUToTCCFCJd2Tbk54yLqT4wy9SNXRT+Dc
	mKolkduch+nK4J21A=
X-Gm-Gg: AeBDievPcaIrFpE2ov2aUfxf+egkQlJTOTx0hcg+8b6v/T83E1ujHLYej2ZppzBk7qI
	Cf4fTUpe8TxwO2jry3eMbHNZoK/WtLbZZB/9QJNKkDRLpGwYx2jrrAe7BkdY6SM2qjcoM2rf8h6
	E+7UH9BJjx7pLAtFWulwwHMdS+5kap5SLNfACOcZ7Ranjsg7n4N0srH56G6U1fH56GdrMjHSZ+0
	Cq3N9Wpoc8zVULATmOH0IxbpgnRyEMAtWqlpDvz9+m8NETw1XoMg83LMPPc9hANGuIgz4A32wm1
	vGdDoNLEL7+kFMD8lP25IW+GPzDF9PhKjp43GQrUclgJM8wp/7YeCi+89w30i8oAUuWsbaJrrxZ
	8BNNFiKNMPBwpXHlOJaEpAyV4NekoEYGBtckQ92RlRGe9UAOwm0lsvPx9UOT/pml33SjvZ42NgE
	da7KIruauFI/4eywjSiwMajK7jZr4zq++ZPZEuIS4QYglIT11xjRk+7vI2RmmyHio=
X-Received: by 2002:a05:600c:698d:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-48a9852f4b9mr54707905e9.6.1777739444652;
        Sat, 02 May 2026 09:30:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 35/62] python3-hypothesis: upgrade 6.151.9 -> 6.152.4
Date: Sat,  2 May 2026 17:28:55 +0100
Message-ID: <20260502162929.1377831-35-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236344

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-hypothesis_6.151.9.bb => python3-hypothesis_6.152.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.151.9.bb => python3-hypothesis_6.152.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb b/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
index 157e4a2ee01..f08e0bad792 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2f284428dda6c3c48c580de0e18470ff9c7f5ef628a647ee8002f38c3f9097ca"
+SRC_URI[sha256sum] = "31c8f9ce619716f543e2710b489b1633c833586641d9e6c94cee03f109a5afc4"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

