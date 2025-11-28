Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC14ECFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10267.1764310759675503797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CuAOUbRN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-298287a26c3so17749395ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310759; x=1764915559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zaj91ZfqnVslSgdhNoHM/P2vefBcgQH9EkpLwiSA/Ao=;
        b=CuAOUbRNxI0minVTo1NXjxp2LYUkG8LbHtZkdHBfv3y3TS+RgWOoxery9ZHjAjWhG9
         4CsO1gSgDnUyLEJwqUjXA2BgZUxx6U4xdIl2n8C7GaEmK53zGAZVy8fOTN0TLk7eIa+N
         5HXae1ZtHAbfMyhKCD8RwUljcGK6G9M5L2O2B+u2dw33h+zYRH2aSlBYioA3LXoodfEl
         MZqWMwDsnVDgITfNrXymGGK0+VgGt+/CGH93nS3+4Y8W7X5WzxTI9XQNvNN9aSjVDiSU
         6VUpDJnCetmpGr4YbJWmJwOOPHPFEN1Yi8XARFLqpznsdAueAi4Rqm6xMAGgHwkaWr7T
         X7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310759; x=1764915559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zaj91ZfqnVslSgdhNoHM/P2vefBcgQH9EkpLwiSA/Ao=;
        b=Mp8F2HcXo2YpvXcQoifmWcRFDP7LtycHMXI7oplSxUp36/GYnkrYJaTu7DAPjUj8QA
         OhtKUmFY6FxnoF8LWg/AI2GOdPZzOGhI4rU2j2i/ZT3vDaUjw86sCtEUv0KIX9A3h5jJ
         G8LkWeAAAGNyEJ/hueSROjcRPC4qtETJ2wVxw4WZtXUFVlLqFVo0hRHsdsWEwFYMkCyF
         36g1cSHQTLSD1MZ/SREKNANjFxs8nX+pma/t2arOoEJ8vkRGqC+bLBQ3DINtgEkTLdPe
         iyonEh6BC0D2FP+Aj6JO/ZKSQlKVNzqRcHd0XELDG/WRlTuOJT9iR4f3x31dGKPwoxBX
         sLww==
X-Gm-Message-State: AOJu0YxdmEc90NBB60mwk59lcV/trHTI/BHdG2RDOcWuJ/WfeGyiM6OA
	Y9cfXTpIXSTE/6smJeg4ehWQ9OuYE0fwJruq6FvM2rUv7xsNTBQtThv8mvKyVA==
X-Gm-Gg: ASbGncshkR4vMCI0IuO9hKng7WHFBtCribJOP7aPzwKI3ISg2rT7ODYAZWLvXVwdwCS
	skmWlnzhW04DaZyPtbqQPGuppBcO65h0mbxezz73PFTk7fq1HNeOJczEijL1jd9aadzQNPVgZLu
	nTG5iynk74qH3NaHsvBjlLO+utXrBIevN9l4zOCDYiMEoCycNjf5FcOcn0vcZN3bURB227u1cx0
	Ju9Fr0/m4O6L2mWAhPsGpwPkisbHqrzxW5INSwVX35Y+J3EOuWP+9MlLLzeTJ6E10X3T/KhCv8G
	PIXw7O2+o4wVGep/ne8jXwAqUcccRU5lQFv417Zxf+IDzNDwyeomkKtzq0Q87JjhozKPp4YPvwR
	96j3rBz0FZ9glxvysIGcdTh2r04Vb0xCWEQCrXQOSO8vi2r+2pWTGk4DegkpXBJ3XOm/MryI+e/
	9Gt5YM/aKI+mpLISHv3SDKbcHm
X-Google-Smtp-Source: AGHT+IHz1k3NDHFpiWnN6/szO/5mBDQRlnWv9vj08yRxWm16/IMNPazNFp9BsWwJEepfTjecCBZfnw==
X-Received: by 2002:a17:903:2343:b0:294:ec7d:969c with SMTP id d9443c01a7336-29b6bf5d616mr298395045ad.49.1764310758914;
        Thu, 27 Nov 2025 22:19:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 12/14] libinput: upgrade 1.29.1 -> 1.29.2
Date: Fri, 28 Nov 2025 19:18:49 +1300
Message-ID: <20251128061851.1634479-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226895

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.29.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.29.1.bb => libinput_1.29.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.29.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.2.bb
index 809c291e23..f771085388 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "dc2c1ad181be88e1487468f7ca6f9d320981f133"
+SRCREV = "917783150a5bab7d55eedc5714f1b49b192426ac"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 

