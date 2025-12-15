Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440B5D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:33:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45403.1765794803396083753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GegDoXzB;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so19409515e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765794802; x=1766399602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=GegDoXzBblqw1/OtQsQpuqxpbjuZjvluvabSIf2Ey4eJ0EKwKC89M4gSbMyaJHR9ml
         jGw3np1dUUBHH99vyuoie+c1O46QwSZ+goX1akj7y+pt4lePxZ6YlyHenAgKtn8JZliC
         pP2B8vtRd6xs+qw7SUm14U0LtR48mfpT6SsJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794802; x=1766399602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=ZigC3H05nE0vynrSdp7fSV9aErWk3m+oeMHl6LKFSC0n/x9jClvDUq+YmERLNWlHWb
         nERSFNsDIWTN/eAHcOfijOT32+DND+7jITeV9R8uIfGLxOahjbGmTSqefRv9XsvzCV9a
         uPOqT6c0DDAAlfBCb02FvhBvIPmiFF8Y59z2J/2d1341xsUgtgXuD83Pc/rQoOexrVgA
         NNJh+12vsBd3J23MaszPWQH81Bn5/QN7Dl4bZzL4/jWrrFggChW5zyYYRlZrB4Q73uGf
         i/XjWAUbTD0Bj+RF6D34WKqHI6Ex06Ng76XLtBjsbHPJVX1ACGYlPUukkmDXLDq8GlYG
         /U+g==
X-Gm-Message-State: AOJu0YxA0nwAEb6rbfgzR8gYntxqYxnAEve0UZ+91WBn4//oUzbvqOvm
	eFCUvBCPXWuEdHL4tB9Wq/4cY8XejMaMJG0gXp+4Lxf73fknjhmQnfqyEbKVkeDZm5ixTTFQgKY
	7Y0NDQl0=
X-Gm-Gg: AY/fxX416rwFY3vs9c1DhLvO6Nrz9Fb+IF0qfzrqESHpXPJx73Wpwu24IhmpzF84ZQW
	h18bkh14Omp6rgwoMsc3kjPWs+l0ofVExZKMFYVXpF3khs85GHTwxFCvpTH9MuJnpeUVDZiPjnL
	MHMa+Dnzg5qjmsVUi37w3y/Mg4rMfIVTvQdAIO67uuIrm66DJXzevvCRX5SL8Hk38K8mOaEdS/U
	Q122j1YeaEGj/YXgseF1tkZItK/hebmhxM/+PhgbCl0yR/jr0Kaup7ewqXcSXNIal1AD4ubL7bB
	xbvTjhOVhEGS9DT8KacoeD+GyYPZYQQPycktQu0JkXKcsAJIAPIDO4hzsyScW1PyPdq21dF9tR4
	PpWFeB1BtGQccXYhKTNXw2mQHUzclhYrrf7nDoKfg7Sg5E26EMr2n31Ix0U5AWjT4z6M5NmY1z8
	96wFj2iCeYXy+X3XnEmICf+VPZianwk1R2xfqnSA7JmQMt4qrSG3/CvSbgslgJfjhDB/Dk0xWuL
	3sP062eDHS09yIUons=
X-Google-Smtp-Source: AGHT+IF1gVQPQirOyI0yOvTBTFU8RDidfe+m+k6nELmaNSzTxcrOp5CSmffsExwV20PS+R1Op5MZzA==
X-Received: by 2002:a05:600c:190c:b0:479:33be:b23e with SMTP id 5b1f17b1804b1-47a8f907d4cmr118480675e9.17.1765794801756;
        Mon, 15 Dec 2025 02:33:21 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f2e8esm180810675e9.9.2025.12.15.02.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:33:21 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v2 2/2] meta/files/layers.schema.json: use URI shortcut for some remotes
Date: Mon, 15 Dec 2025 11:33:12 +0100
Message-ID: <20251215103312.902774-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251215103312.902774-1-corentin.guillevic@smile.fr>
References: <20251215103312.902774-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227725

Among the three sources, only two have a single remote. So we can replace
their entire structure 'remote' -> 'origin' -> 'uri' with a shorter one
(property 'uri' only).

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/files/layers.example.json | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index f3b6522083..d990502205 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -5,11 +5,7 @@
             "git-remote": {
                 "branch": "master",
                 "describe": "",
-                "remotes": {
-                    "remote-alex": {
-                        "uri": "https://github.com/kanavin/meta-alex"
-                    }
-                },
+                "uri": "https://github.com/kanavin/meta-alex",
                 "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
             },
             "path": "meta-alex"
@@ -18,11 +14,7 @@
             "git-remote": {
                 "branch": "master",
                 "describe": "15.0-hardknott-3.3-310-g0a96edae",
-                "remotes": {
-                    "origin": {
-                        "uri": "git://git.yoctoproject.org/meta-intel"
-                    }
-                },
+                "uri": "git://git.yoctoproject.org/meta-intel",
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
             }
         },
-- 
2.51.0


