Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B57C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:00:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.14017.1749736802567298340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 07:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KNnFtkm0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so897533f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749736800; x=1750341600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GioE57BBY8UyN2SZBI1lXeVktD18H4WP/qfdGUAYbOs=;
        b=KNnFtkm06EcqHMKLg3cjmEF1KUNbsu9rdLTHqAKQ2wHrl1u8b03RQxuunECYz3pjXp
         O+CVa2ySAG0/qWOarOlpqYxyFRsC9bKnvUsJuMinEagi9gXQEkmOP1bSo8tlz8d408v5
         mkoaj8Q4E8RNmqy3TXwkb+EzpjxCd16kOPY5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736800; x=1750341600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GioE57BBY8UyN2SZBI1lXeVktD18H4WP/qfdGUAYbOs=;
        b=EHRHMHD5AV78krNV4p7vg/zzWTZfrJ6uhul266ICIv0K2mB5yhEoWYb/yKt4a2R9pG
         wPY1dY1/K3MXOGRdSuMaEkFQGutN1WZQhj5Qcv00MWseGieTyCakgoOFTJYCn5QZI7We
         KpQvR20zGBb0osmXLyoJRW07S2KWHeeGLFkH1MA/mX3JSuKAxwZSTAJzaFrxOtMvZBfa
         ODn+XAkKVtmMKOVRlLbXpwDf8H6eclPsB9NSl0mvSfRdpNZZBoYQ1jUNxZQ3AtoHs6mA
         x1gMYByD/xdc4ba0a3IwLFi22frqHweAN7ji56/9ycRCIR+/IRBKxxl23wQA5mZd1nAh
         ZurA==
X-Gm-Message-State: AOJu0Yxw85LLMai4wblcSdB/2XWuOGOhpjrxpaJNuuZkdOzNGo7sfJP1
	i8YeXPeVcyRN2XhIV6a4E8zTjgaWnBrkWpogRfd/3eUkECzmj7/lANcBZ/txw1ZTtCZMhOuCA+U
	akxZtZ5g=
X-Gm-Gg: ASbGncu4i1CzM+I/s98UVMOVqU6/HxFORcGFpcZAy3bnzDZx6o9b2c/Fk0X9XvykU+k
	XaJyCPWYGy3PFeK6ogqUTCIeTmDW59jxpXodWC75mnjPxzilhv3UQrsAkIYOhkoOzrHu8IHA1Tn
	aAJlml84GsE4qtMpTl/WD1/KOTPjW5Ge20s4N7GdLzaEPaFRHbQXj3v52kDCb+uL1YDPMNrpYLx
	iBM1jp9xbmJdYPIM+FNGoK4Bw7ZxKvw1JoSZHKoQCf7cKAI7KCmip2A9qJWmFAUbVDZi9mxypVn
	lY+na5ha4+BELNmDvZNMmFVifalQLgy0ppKYb7S04dBgod0duYfdyU4wLYqnhwCuBkgJJD7lP+f
	t/FdXfbgOxjdZxPw=
X-Google-Smtp-Source: AGHT+IE6R8O0cRUOE///ZifmIVqckerAWN9k1UbTEpgLokDI+4xU/VjVYKhCzmX68mnTtfOxTs/eDg==
X-Received: by 2002:a05:6000:2c0d:b0:3a5:2e9c:edb with SMTP id ffacd0b85a97d-3a561309c8amr2826227f8f.47.1749736800521;
        Thu, 12 Jun 2025 07:00:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9e93:4c2d:3b22:8e08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2089474f8f.4.2025.06.12.06.59.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:59:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] bitbake.conf: Automatically defer native and nativesdk inherits
Date: Thu, 12 Jun 2025 14:59:54 +0100
Message-ID: <20250612135955.1413300-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218524

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9a91d6aa6a4..af3465b5b1f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -947,6 +947,8 @@ BB_DEFAULT_UMASK ??= "022"
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 BB_DEFAULT_EVENTLOG ?= "${LOG_DIR}/eventlog/${DATETIME}.json"
 
+BB_DEFER_BBCLASSES = "native nativesdk"
+
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \

