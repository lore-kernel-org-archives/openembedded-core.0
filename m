Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18D1E69189
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:25 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87805.1766434103811883656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=flMTULj1;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64d2c50f0d6so2644328a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434102; x=1767038902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qnL89D6tEbH9N9o22YeJuC13lzvDezvjUyE3ihdntE=;
        b=flMTULj1OjOnpmj1o65j7mjNL0jlRw7m7tD2drHhK725VAmHsiR62hRW5hGRdSekUb
         5aXMxhSuEVX0yu3I55uOfSCgWIBDbdhyzOsfLSVHPULGfAhcZUul4FNoA7yasg5ObFpd
         YO0RHDEZTHq1HqMmRRyznW9A8dOmg/Zs1482OVkXSapwarmUXBTBonvhZqdPj60NdF6g
         5GwCZFAMCNOhpRHvhASuVgtUjKgDTZS2S0L6Jmf/KMVTsY40H0eTPKYT5ODsvO8zDZ7i
         wInQyGEnJg4dAAfV9xr7G/0Uza+HCojtxtoMxOPsZd3l56EVoHse0hfsegVUpmukbmpP
         4kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434102; x=1767038902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qnL89D6tEbH9N9o22YeJuC13lzvDezvjUyE3ihdntE=;
        b=GQn9875H4C7y9xHnva7FC7a3k4hzC3Etc8LdR4pBoX+wg6LDsfFgqtxg7jlkEx7lZX
         jhUDFCA+pJERKwwBRzRAhQs2JWgeushHV6NsJ54AP8gyANk8yXf0oKjDhORNtux/NUXW
         yUQYJqMUeMn3WPKEPfTPZtRWqYM/UYokPjlPMsh/byGE++KXDtPwBnELZu74sRqb19JP
         fI8oBmgYsXEcoH5LSPZh9zH13L8mAzhWrwyAV3lyyGGIHNWWF6JHpkSec2TUJhSfLH5D
         eztpgLm2Z6ymLjIR0vERgTMTBOSQWxdSBc82oxWXdSFWVUEbcfbnAGQv4Cw0b8qC0ngM
         OwYQ==
X-Gm-Message-State: AOJu0YxnVdc+/xt3FVe2USEeGd/N7gGCqTxUApSiwyECOSZdnckcuuE7
	8b9u1Yy1HGxi57GlecnLV5Hl1QtWn5uYteNftgJKlYvip+RxF8Wt1RlHQ/BvGg==
X-Gm-Gg: AY/fxX5haXOQYSeXURn8ibREgWhKrsG1XAsLeYBxP9vlsShnPBqgsXV+2DQaw+c785C
	LZX3Y35+/mQGZikTYT4zpKQ28ZO9pErHBHR5ZzYEFsG7szGsFE+QkHsR85cDXwwfgB0qc+O4g0F
	NKXCIJdbprRnWZasCC2pP4yjKj9qfEqEdvBRoHdATnAjrT61sZojxzDNA0HOxF/E6iUKnnGK79m
	eWEJwR3IbUF7Xi1s05TIAgXmx9V1bAEJ0ELgitH2Aoyb8pBH2gs1UPoRrYRksU7nYAVaGXJ3MCC
	MfA4y5aD2PtPV5Bo8dw9J1AM3kOCDZVhjIcknbr8VIMzvbBWCfD1pnPnzKrG6c2nZ5jx3MJjCIF
	bJhXOgw5wNIv1aTbK9q1K1agX98bnVSdO90jd5FAzPqo5sNp1e3fOxyy/IhyTJqcMFTDZGBuKiV
	PwIj+ii0QccFdbi11WjnLb0UKVzyC6onUZ6EhLinKNRIm39EIqbTikQ5lPxA==
X-Google-Smtp-Source: AGHT+IExqnmmapSCQPEcnPPiXkK6cpQvuYMF8ZtTf7gP8riQJ2vKSLQ7r88QgkP5bai2v/ZExlAO/A==
X-Received: by 2002:a17:906:4fd0:b0:b76:23b0:7d89 with SMTP id a640c23a62f3a-b8036f1d8d3mr1322064766b.14.1766434102042;
        Mon, 22 Dec 2025 12:08:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 052/114] python3-certifi: upgrade 2025.8.3 -> 2025.11.12
Date: Mon, 22 Dec 2025 21:06:34 +0100
Message-ID: <20251222200739.2278706-52-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228377

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-certifi_2025.8.3.bb => python3-certifi_2025.11.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.8.3.bb => python3-certifi_2025.11.12.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb b/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
index d3e842b4bd..a7ba12b620 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407"
+SRC_URI[sha256sum] = "d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


