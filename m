Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D04C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:01:19 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.36544.1741784468996298554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 06:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QOOVysvR;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso7093594a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741784467; x=1742389267; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=QOOVysvREi2ClOzCNwkl2QzKddpsAwwLkUci9Bm616xzzaMQ2Emp4yDfdxgwZNJxh/
         9CwkCpW8YPpevYXg5VAbgh3MCw207vxzWp2vOmkdMIszgsoXdE6UX+xEbxF4G/1AsR5y
         btcaS2IBU6tddE7lcW6vKrDGl6f+Tjvw4S+Y+NhomQlLnOAwdtUe+o5sStT/75GbEZSy
         ceo9Tw6IlkSztXDE1P0qdq6bzehQchfxBaKMHXn8s1t3VQ3HYvh/j1iyOZR9P9iLPvYL
         ldMNkxUz0SaxQEusPa+4w8qX0Xp9a4+zIrO3RD4KqqUp9p1vFmAmFqEQl3X6ZR6KsqX1
         0C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784467; x=1742389267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFl6TKtG+VCWRFN0ARm8el3ubuDwENnGZL+tU1N6Jvs=;
        b=bef6kCXXREhPMctBvu5wr4JRx9ASjV1GB1ICjg5+w7ZkUuMiO31IvcLLyH5356MMqq
         DIKw2YebI1jxH8Kfx3gJ0BiIeysZ0fR5YJZWmTWYZ/o3gepipM0r54iBjKHcVmdyuNs0
         jJf7/VCIwTmaFT9PRNsT3gLz9s68l+5/1rRQvyBdgJn0nGoafepLLNVRijXnIfTIybXI
         lhkdQACcHuvgmLwjvvgFtfRO3C2eVZt10S1zTcvMFnZ2SHQ1U9mdlGVTT9+rMfyWSXMp
         DreKjSB0wHiT3Vpk0/86sS7c2kBCImgkEj+6OAaftRCBTeER4H/UYx6ZuARpoqImtb47
         M1BQ==
X-Gm-Message-State: AOJu0Yxyk3xJE9dMVIyoII+5cLau/zfvcBW7tD+EBo1vONlSP/clJRr7
	7ld6rdeAV4LesojNsxomyQzOGvpTdFiBSqaglXbenZFV3Vq9zItw8FyQGhPm
X-Gm-Gg: ASbGncun8d5zuoTlidJPWex1NYRJ3weXQbc2Ftmpn4RifXQKU3+3qi18eCwgbQuhHzQ
	lR7HJdKBuiGXOKaYzAWM8gmWFrSQ//viSwyVuNF/N5w2lAk3MjP9N6qr8ia0lnZYvpAGy9JSwK7
	4jRTzFDPJVz5YBK6yRcXyrWzhcYHWA3hy4diHIzyad5mlBCeD1u6hrKu7xsFa+an23AIm7AQpeP
	GGOFFUpIiZjLRLTmUEtAxhdnZvjp4e99MWHOFMe6uwXcj6PrMWJ8c+eZAOLCzyfl0U0c5KBie9Z
	6p+alOatjE+/uAerl3bVUDRPZyoy9TjYWDwlLdEgQfgfrcD14nb+MfSaw+WdTGKXtDEBvwReQ3q
	9KG4bOxV/KTk=
X-Google-Smtp-Source: AGHT+IE7RK9viWjizmnTwYNVoz5WOAjP/EYIPSGJZjqaUDX7SuSscK3MS9afNXYR3DLCMpmFqLJSbQ==
X-Received: by 2002:a17:907:3d86:b0:ac2:64eb:d4e8 with SMTP id a640c23a62f3a-ac2b9ad91a3mr1026890966b.0.1741784465365;
        Wed, 12 Mar 2025 06:01:05 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988b64asm1068306266b.155.2025.03.12.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:01:05 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Mar 2025 13:00:47 +0000
Subject: [PATCH OE-Core 4/4] eudev: Drop --output=... from kmod call in
 init script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-upgrade-kmod-v1-4-4de94f131b64@gmail.com>
References: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
In-Reply-To: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212654

This awkward invocation is no longer required as kmod just uses the stdout file
descriptor, rather than explicitly opening /dev/stdout.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev/init | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 477a525b21212ad72d2661e27e1218fca9fee5db..790cd3b9339b6334dbab1feaa65f8948d72c76ea 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -27,8 +27,7 @@ make_static_nodes () {
     [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
     [ -x @KMOD@ ] || return 0
 
-    #output to /proc/self/fd/1 since /dev/stdout not created by udevd yet
-    @KMOD@ static-nodes --format=tmpfiles --output=/proc/self/fd/1 |
+    @KMOD@ static-nodes --format=tmpfiles |
     while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
     case "${TTYPE}" in
     'd')

-- 
2.25.1


