Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69B9D7879D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 16:13:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20311.1766160799865163959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 08:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=glydgr+v;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso1190954f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 08:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766160798; x=1766765598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=glydgr+v4GUstSxGVD66LkFuB4UGptoWqvzKpGZwS6M8iqLmNiacdDtOqn8u1TTXLF
         m6LVZly0qkQXB/5I4KEFT+GiNgeRiGqkKq95UJ2PHZmz/AtsEAJ6psOn/QLMYxzykpeO
         NWa/3NVNeefZL49DUt7Np1Gi8Ac8kMDB64TtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766160798; x=1766765598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=K74Q629cGSm9dvY5AcN61vm6ILpglPfU1p6Bzf7qQV6LjsqP/zaW/Wu8fPNLXD5O3U
         QMyltBMVql+2DJIEvNAbRJ5zAVMsPIqf4VUPrl1wyOE65ZM6ocCvRFC7a7og10sV4KfT
         4I4Lr+JmMTS71n/LGtC8JlrVapoQOP09v3f31TKV0a79Qc8U2PUWCZHyk2Ysd66RXWoT
         AuKPiwII/1y8cxBG5uStwZOUqsODElfiMPntQKDkAUp8Fj7tVTq8GSUp7Vhdh0s4RLd9
         RedlOFgwuUp+vTIKLK/ZXyslTV/cPqd8UdIxNin2z+eO0fhgYIcqs5QCVsYPd4lVkaPx
         Domg==
X-Gm-Message-State: AOJu0Yy8dRKNMK6gw9019175YV5HksipMC3Zsg39QKCEWTksPKz8PTPv
	G/tNF038nRS/yNjVDXmeeUHBdZJ5KHZdqBUIWPOYO8yoHqRhJjEl4I81/WSbOWj6N7R/SmGosUV
	9LQuX+gg=
X-Gm-Gg: AY/fxX47qwLW2XiYOefIwiNHa32AiVe+jS41Ff7JHdnjAnLc/Qt/jWJPCB4sL/M2Sm+
	rxqwBA8DWgoIS3pMqLtabn25R3q3oJ3uz1sF1SmRjuBbLAKQ35UHDX9wBolQkSxzKN9FnXCkxV0
	G5VqatMcEgw0n7vjGFyZ/rhlXNBGQ5WLWSErozwE5yKZSUKGb8RJugDg7kGHzR0reYJCtgnrwS/
	uAYisi1K6ZRvVHmCfEA17F6yhBQslOcjRkpN5Es4xbgJVNnb5WCtLdt9zmeIBaZw7VpSKjye9vA
	u0zym78O05Th6Mi4u2K0hvQsr44EBYUGoH9b+3ASzNt4YPwuIepVypVcztHI0SG35m476rSqoGC
	yvT3FohxKpavRF7l68RDFHkM8sQSaYB+LAWaZqdEoaQyzGwG7g53115/7m2iyQSpTBkXBYio9SA
	gsfhRY8jOIvqOOhP+A6h2MDrangyd2kskOJjmkwMjFhvoWMaopmj81hZ7Hh3rPsAid0fsdajQph
	kJgmlUzvLN+PoogUvs=
X-Google-Smtp-Source: AGHT+IEORitEyT6k5N6qBsOiEGgIigo5PY0qKvlIisYv/e7YzRXMOXNuNxDqG59HIZZgf5bliGqXBg==
X-Received: by 2002:a05:6000:3109:b0:430:f494:6a9c with SMTP id ffacd0b85a97d-4324e4cd1b9mr3047733f8f.17.1766160798130;
        Fri, 19 Dec 2025 08:13:18 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm5888287f8f.29.2025.12.19.08.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:13:17 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v4 2/2] meta/files/layers.schema.json: use URI shortcut for some remotes
Date: Fri, 19 Dec 2025 17:13:11 +0100
Message-ID: <20251219161311.2293512-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219161311.2293512-1-corentin.guillevic@smile.fr>
References: <20251219161311.2293512-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 16:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228241

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


