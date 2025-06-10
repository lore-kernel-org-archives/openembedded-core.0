Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E134EC71131
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:08:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.91271.1749571732164153613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fNhMcUtS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2363616a1a6so10792535ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571731; x=1750176531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jahSKpcYuMBldeiuQQNm5TjKQzSqkQSS4IQmDCs89po=;
        b=fNhMcUtSR1tpu8n5YWial9fCD/OZ+v2QKC59H4RavSNthVUvLSLjBOcNZiH78OB1vc
         SNz+sIPgndN2/wanOSotT8xd/a0KtEAAs2m6AUIrB30us4w/S7hmnuxvbX6FMmg1fiaw
         GueVU1eS9AivKdE8dcFf1C5goH7E6Z1Pmoe4IQNHWL+RoXWqpLjmGRCLkUmGDGw7R+t7
         7NtvxpNty32o9CjXqr1vvVBwa5mov9YLQcB3ogirwBsPJgcO1YF9AwtONbmSaOsFpvP6
         cTINX6siO9TAxmA2dcUAXqAdj2dmJ+yqXYTJbrLaG8fkDJBsJfgir1FsTVAMmRlCKDPM
         470A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571731; x=1750176531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jahSKpcYuMBldeiuQQNm5TjKQzSqkQSS4IQmDCs89po=;
        b=Qrddhqgcmn4W2RssET1lV9dpSBszplm7gwUtnXTB85h5piz07wX1FrZMZb1YGMRbLA
         pyasjwdQ9xgULCENJ2DKtKw/c2pQNHsy68xx3h+Pvxxosc4UB1UYqGsqFE/1JjjDWVRe
         2qk2YbFrzk6Wa7BymbfYe61/XZMP5LkmWTBkDUMDbKlXzWWfqJhZEWi4N74o/lbqrxkg
         6ZIxglQ5bqjklaVVJT911/MSpjPPv8R84v1PujIHnqTv7sh/3plJHPoWJQxhs70tBI62
         8VVsneErG7rChERYESMT7I2GDzyJwbP43Z0n+4gBoaOCVxxl5WH/ZPYhoWEihTYfndki
         F00w==
X-Gm-Message-State: AOJu0Yzf8D2/x6fNRt/eefgpXjJCU5Ta0Wx+0h8S/lkND3WbMcuEKDs7
	UoG0gvOoPlMgpza2aS40MsUYXtzoty01daWrx2Zc9vIjEc9jDA68fV1SdenrWV0k2ifcMv5EkOI
	EEYhq
X-Gm-Gg: ASbGncuvYrcq2kl62/7raLVi3jlQxFCcEZKr8zu8jTqcRGeYICBJjT/X9tKEb1XLzRe
	onDYObkqzCE16c8rL+7Q0m0QQ7EHglTuOqadFTNcrqTMUMVMhdQwX6YtFRToMy2qKwC0YcMq9b3
	jTIcQ9OR1kPXLKfDiQfqUfX8Fa7Na4xgfdgluD/gs0qxlIa+d+goPQgqcrYQ7XLRjG9W0gi2dVJ
	iO7Y4C9jqwEMUcndlhmCBe4rtGgu/mq4rOvAwDi3CEeqxDEkW6FzD/XqHURA3w4Iadpt/J3TFsr
	ChnHd3DYpBbBQ/qCMVU1hmoT4zeR16f/gtKcwwx9a234+4ZZ6sXepA==
X-Google-Smtp-Source: AGHT+IFipWvJPaE4ywx0EFEXEsmxjqNyumAY+uF4dK4vrHbiezMycpM0FxcVRDR6332rsHfZktPDhw==
X-Received: by 2002:a17:902:e890:b0:235:e71e:a37b with SMTP id d9443c01a7336-23601d973ccmr260450365ad.34.1749571731350;
        Tue, 10 Jun 2025 09:08:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.08.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:08:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/32] libsoup-2.4: update patch 0001-CVE-2025-32911.patch
Date: Tue, 10 Jun 2025 09:08:14 -0700
Message-ID: <d95ddd4ebb4ea78fc64cfb025306f1f953ded3f9.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218370

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-32913 also fixed in this patch

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/435

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/0001-CVE-2025-32911.patch               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
index 9ef0643837..d75594bb4f 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
@@ -3,7 +3,7 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 30 Apr 2025 14:59:55 +0800
 Subject: [PATCH] CVE-2025-32911
 
-CVE: CVE-2025-32911
+CVE: CVE-2025-32911 CVE-2025-32913
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-- 
2.43.0


