Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988D2C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 20:33:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.1929.1647462811635336523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 13:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TvQsQEDq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d7so4588632wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t3gU02UZEoiOeJeLRAKWxel8Onsxalzt82j0yJi/Gjk=;
        b=TvQsQEDqvl8yyCZ2QGlw5OE6RsyUO1GaPaytprjiewHQZTsONuQTSqiSgmw2DA6S8/
         D4TicolzZJu19gZCUPhXPnHGcaujxAPH/K9oWyt8XwU0yfx89iGbB5Pk5PI2STGOYDep
         qrTd9t7Vj79r4fz25asleFXkALzObtSuYDe6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t3gU02UZEoiOeJeLRAKWxel8Onsxalzt82j0yJi/Gjk=;
        b=fmh+UFbNXMVc1uwHD/ZQSYyaRVKDAxaWpm9zjfrgTVwPMIZSH5Xj9FzAPL0aTcSCVu
         KUIuHIhqJS7p3amfVXSyH5uMtuha/u2t3shwyFls1NxRVjb6MEix8PGf8wkc74AjydfU
         M1FyhljNr8NGyV9iZcfn2vUYxFzL9NrHOSKnq5Ae4BXgQYE/JLFAHxxzzgfKN1Xoh10Y
         qvLrsUuOa4YgRa+Uy5qb4Hm250Yg4/4oDSMV+1caPQhSaSwUgP+YcJs2rxqzOXnglTQu
         AUdY4F+90K7MP2ezA8lIJ6ytBD4ki2Z9FzgTUcvDTa9VL2qqnS4vl9t1Ywe5JNxbDwvZ
         +dOg==
X-Gm-Message-State: AOAM533DmIP20UtstrgCNqFMp9JO+WBomaWg273Mc2SXcmZ7BiIKcNzn
	++bL4puD63mTxnFWQAjmgsP7/vf6Mg6gCbLd
X-Google-Smtp-Source: 
 ABdhPJzLEjcFNRhrxG14UuNqqfscEioN7pGSR0Dq9Td21QkJ/iNI2NvJv+cCJcYNFlQeyw8WQTRF4Q==
X-Received: by 2002:a05:6000:1448:b0:1f0:6620:968f with SMTP id
 v8-20020a056000144800b001f06620968fmr1323231wrx.714.1647462809997;
        Wed, 16 Mar 2022 13:33:29 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b00389efe9c512sm6520630wmq.23.2022.03.16.13.33.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 13:33:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] cargo: Add missing nativesdk support
Date: Wed, 16 Mar 2022 20:33:27 +0000
Message-Id: <20220316203327.950175-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316203327.950175-1-richard.purdie@linuxfoundation.org>
References: <20220316203327.950175-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 20:33:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163358

Copy the target definition for nativesdk to allow nativesdk builds
to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cargo.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 0ca38143c0b..4a780a501ff 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -13,6 +13,7 @@ BASEDEPENDS:append = " cargo-native"
 
 # Ensure we get the right rust variant
 DEPENDS:append:class-target = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
+DEPENDS:append:class-nativesdk = " virtual/${TARGET_PREFIX}rust ${RUSTLIB_DEP}"
 DEPENDS:append:class-native = " rust-native"
 
 # Enable build separation
-- 
2.32.0


