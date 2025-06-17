Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2409C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.23107.1750176013402663022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eQKkt8mB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2363616a1a6so46821485ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176013; x=1750780813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5JzkmT/icoLHbI8z/OEvUm+NPeYXHVTyF/UdxoZxMo=;
        b=eQKkt8mB6xntzDf4LRSqsADoIIvjpIJp1H7AZWykOerpb6B6IdqOIAdsPS7eu369WQ
         sBi9tuiTH4Yea5kXynfq/9aMknF54qgyUwSLqoGT3AxJYyqGaxc6azing2gImZOrsGl4
         5DII8dQGOkHO05qJDm7ofvXZHcgIcvR2/LUCHQDCb0f3hCx96qm1N4QeJGyI+iMKV772
         rvigpzGsJEbxESHZNJ1sKWjfo77OW+5islepkvHX4H/4I4HoQQh3YviaGdprat1x+up1
         VT3RwBozhRRT5zUlYjuRKsVvulOUYEJa/zlnuqw7P07+QrGZ5ImdryVyPdG00RuED1hU
         gHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176013; x=1750780813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5JzkmT/icoLHbI8z/OEvUm+NPeYXHVTyF/UdxoZxMo=;
        b=gGPdUezLDW2ovXJMK61IKtUuFmJ3EKBZN3j73M6/r/0BtCFzr1PJ+zc4KvnzoO5o7S
         E8+60kAyhgNns2s6bCE7UzLBFgVAsZc9yY8JqhBKyLHjjBxj5ITVXZZTsax63D/XTaYp
         iUBC4L0FBNoXujybUtEOxs7QEFVOvIMC3RBTO/wOMI07Bfw5gyQbH8zIdOwGe91p+k59
         EFIZYweHQZ81T+1neb7Y39sE8FSCSiiyvZHs1k1s4MNhiSYUP65+sMGLRwaZicsaWc3o
         kjCcx7p/uMXgSVKUf9RxlVZ7kTLxa2GPaz8GzgfPEyZ0p2eomitWyo5lEiYvKR5Ar1wp
         Wf8A==
X-Gm-Message-State: AOJu0YwMrBk4V4fo4ddTIVhc0CVONkZtKCNMi8gnLOyVAVzpytv5hmgM
	HlgMu7SQolKJd6QCP0uVJqO/D8dBAMxuQeMQSC2/aB5qoQlvy25YCvvDMOSIXsHd1KjgiT1xOmx
	MvbTr
X-Gm-Gg: ASbGncu98W7EX/nW5Byu5mKYtRJYFl5rzYm3adaRkdVCaUhBOE5suzAqDhx0YYfswud
	PVZv468n/YFj8xosjhCnxF5FImslEH/ENzl98GWvO2xnRTwHJQE0ncVXkam+gvIEi8kR5UwuOlK
	0F6uNwWKMBE2kiuS+tqUfcRO9R3kdssnKgDnSGJvLPJ9aB98VkDBowyV5smmISTMKXlWWikff7l
	duAty5dU1RscU0u9mPDtZjO1UFjRk+RUCubF+jiOLT8TNi0vENtlno578y1Gr/Cw0kMFAJ/QYsR
	GoHVEhlrFWfnnDgxem3OY9vYcbtAqFGFFZPBKCM7PJNCw0+6qzJ+AA==
X-Google-Smtp-Source: AGHT+IE7cxi+J8E+QsvXIebF6pIw4i8Ksn4bJYoAmKdWV4vdYrr888lbv/DDCUnLKUy7KdCQujh+Og==
X-Received: by 2002:a17:902:da81:b0:234:a139:1207 with SMTP id d9443c01a7336-2366b13c9e7mr198762225ad.30.1750176012204;
        Tue, 17 Jun 2025 09:00:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/12] python3-requests: upgrade 2.32.3 -> 2.32.4
Date: Tue, 17 Jun 2025 08:59:46 -0700
Message-ID: <27a860d7b34250326daede0ade382db47e22c114.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218894

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://requests.readthedocs.io/en/latest/community/updates/#release-history

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-requests_2.32.3.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.4.bb
index bc9b2289f6..49d44298f6 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -7,7 +7,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-python3-requests.sh \
 "
 
-SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
+SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


