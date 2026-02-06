Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8864EE208C
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:43:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8688.1770374627960281294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F+kfj4wj;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82307c6902eso1052629b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770374627; x=1770979427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd7JMcQswvaQkY20wOzL/75h+RTdIrOK4/vKd1E196g=;
        b=F+kfj4wjhVtVSw3MeacrMTyOGQDyFGn51++pj8tznp14RK4q/EG25GYZm2Z5b+phq4
         g57PwSkLs1bGhs07SUH6/YB7QkF9HvZFdA1dj+CS551S9ZPyHBOx/psGrRqcxAg6dDZT
         bYi6KBP85qt6U8mNTiiiZ8Y2rHhERtFpJY61fyGWS1Dxf2M3UkSRgOd5Tgv6TN3ioRCF
         lpK5OTUqS/buZcvN9u1xf8ECXWzBMWIioX4LsH2MV8+VRxP9ZyCD7ztXCf6iV9PP4yyV
         WUTbrK9cfmIkWkQ0Vmrz2Z/0SpwKy5uwmo1biFvQvCxVeZcnz4xUEsivFMXWG3r7M8Ka
         jnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374627; x=1770979427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rd7JMcQswvaQkY20wOzL/75h+RTdIrOK4/vKd1E196g=;
        b=IAfG3HcU7Jfo8qDOiIofcmvJmHaoxQrUgFH0oeGMiJCbuzi+OrZAaHsCbJk9mMx3ih
         pWe7UxPUIbaTveLFgGKLjxXBAxkX7LR3MOJeChr8J0bY0MANl0JO0CuppoUn8pUalrpe
         ZfJFCj6p1IVT9eA1EUZOERhho+gEQKbY0P+jxGiOMxkT4Lv4q7r9wKGy4qZh+yPXl6TR
         BL0YCRwbO4DIO2osNf2j6qRF8mw6dDmsk4J8iUVjfp3Ye6oEOGKGsf1pEpDl3Ym8UpbW
         ySWc7fUn2Ore8yXAVF2qVVeDZKYR5fFKJ/UdkA5TsV0/vZfjUR6YUMmumrLGj3l0daKL
         d2Nw==
X-Gm-Message-State: AOJu0YwXAy8S1xam7PDy2K+2vgnlj0JAmoGqxu+dbQwnNipFE8mHUzu/
	kYFDIyjg79bQRaoxzs1mhht7wTLPUiSmOcs+3PQx11ePTEO5ybHsrSsfZJUjxQ==
X-Gm-Gg: AZuq6aIkU4zajwMYMIaKvBbQGw3af3DL8Ol+yZwzlZEZqtx9tZA2TAD2JxGDYy22Fcn
	Xi8Dw2tIy2RFNpE4MthVArQpMqvQACapElN2QRC3LHzGx5jeZ4dHRSNGF82wO7Lx3UH+MVJ0QUU
	WsQcFq3Y8NYw+Vcc/ncf4YtyBM/uEUKtanRIBs6aBT50Jrwo/ZvDiFdCScFJAOEO0ICoUNJI5kr
	0N9ZgZzqIMymyuGTgzrZ1M0RyK/1IRjXbqNOkqXxfXtdxAg++gzc1I68RBRatzu46M0s6bmB/X/
	dkIdmCUHccgmAsNeCc552hE4wk7zYi4y4KT4aVilNZ9f6aU6jC74YICbiLZWe0Tv0xQ7+Us0KzI
	EGBq9ucA7KLp7iSVcxknim65jEBPTlY23Hu+AJstYuGqVgqbdVSrg9CnrXvGEVDy18Mal6E9Srk
	nHOtQEK2lYjIFPUSzT0gk7g90=
X-Received: by 2002:a05:6a00:2d09:b0:81f:cea1:f93f with SMTP id d2e1a72fcca58-8244176209dmr2337990b3a.53.1770374627003;
        Fri, 06 Feb 2026 02:43:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418ff231sm2374434b3a.69.2026.02.06.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:43:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 5/5] harfbuzz: upgrade 12.3.1 -> 12.3.2
Date: Fri,  6 Feb 2026 23:43:22 +1300
Message-ID: <20260206104322.2604271-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
References: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230607

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../harfbuzz/{harfbuzz_12.3.1.bb => harfbuzz_12.3.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.1.bb => harfbuzz_12.3.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
index c22d6bd4b1..12bebc4bee 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07"
+SRC_URI[sha256sum] = "6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8"
 
 DEPENDS += "glib-2.0-native"
 

