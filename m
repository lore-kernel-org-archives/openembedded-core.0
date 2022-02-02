Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1D1C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:32 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.2256.1643826511428214881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kdWBk+ZW;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id l5so420044edv.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPZnShSFqaLdqIFiBjWIC1i/jKzYWZzMfKh/NtilzAE=;
        b=kdWBk+ZWrFX2h7XjVnyGRpqYHjPticOOzbMR8/tj36rGY4mvxJLeXabTAoDD7UqeZ3
         VLBk+KFOMyqiPUpXYkL2b6whpovFKGRjjSWUGB3qSwukLVra0qbwnVYUmoA6fhMgpVpc
         L47NmU6lulFoXcScrAMAvBRqmaPhmFwjzKsdQ7KH/TpkeqXeeA3s8fUI0pa8Sw5W2Pwl
         gQoRaNegki4wTn1SWVOhz4f3W3eopYqR3nLJwJ+taGaBzqkWXeZID2DfjbCGXzd8Cvny
         KYlcTAr2fIPyAh/lOjYYyNoD7Mz+6RIMeBF8SPLPSb+AbsMTUncpVZ6EcIflKGHm5ims
         BCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPZnShSFqaLdqIFiBjWIC1i/jKzYWZzMfKh/NtilzAE=;
        b=gbhzeBGSiPFvJf7PWw/7x9DECYPaQWHQURRjTWBbvlQftbvoVZMYT36eiKB557ePxg
         wH/b9NA61s6143RC22XbhzeU8gdwTqa7tP+K+y0Awb5iJxr+aFzR+xhoVMLTdsoIj5VC
         LZOzqT5KfJ6b/Vs+W228XSEJld+BUJnbakXewOQsWC+1eJs2tiFtt4k6HXUdEBW1XlsX
         gy/2xhI7j4hoRhyftsWQJ1VJxi0IFjJZZZWMzUBMkY8nEJ2pzcpUrIv8Mk+rLX2Q/+mR
         VrjPEynN0ZQn9XJ1XyPOGHnItWMq2EN+gv7nZF0CViKwmFNJ6hFuGsj0cVk/U1Y09tV0
         JcaA==
X-Gm-Message-State: AOAM531azK5tsiwjfr5uN9eaYUpBTJ8QOrDfFBkVH84HvJG8tzbSnjI8
	uXyVTBkJtBvHUUWFuSSbOoDKZYbZaKo=
X-Google-Smtp-Source: 
 ABdhPJwvQyNglshmbCow7uLqlHo9AabKt9zSQXuD/vPuFk8F+Tfnoxztebshn+vEVfSrbKLugTaXuQ==
X-Received: by 2002:a05:6402:3c3:: with SMTP id
 t3mr31656580edw.336.1643826510053;
        Wed, 02 Feb 2022 10:28:30 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/33] libcap: upgrade 2.62 -> 2.63
Date: Wed,  2 Feb 2022 19:27:56 +0100
Message-Id: <20220202182758.919991-31-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161256

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 4 ++--
 .../recipes-support/libcap/{libcap_2.62.bb => libcap_2.63.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.62.bb => libcap_2.63.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 89f6bcd65f..9884fb5641 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 42b3e19d4e584fb9b47fb471e02bb25de90ac641 Mon Sep 17 00:00:00 2001
+From fc60e000169618a4adced845b9462d36ced1efdd Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
@@ -20,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcap/execable.h b/libcap/execable.h
-index 0bcc5d4..6e2a080 100644
+index fee17b4..5bb0c55 100644
 --- a/libcap/execable.h
 +++ b/libcap/execable.h
 @@ -23,7 +23,7 @@
diff --git a/meta/recipes-support/libcap/libcap_2.62.bb b/meta/recipes-support/libcap/libcap_2.63.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.62.bb
rename to meta/recipes-support/libcap/libcap_2.63.bb
index e08cac7218..4b7111890e 100644
--- a/meta/recipes-support/libcap/libcap_2.62.bb
+++ b/meta/recipes-support/libcap/libcap_2.63.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "190c5baac9bee06a129eae20d3e827de62f664fe3507f0bf6c50a9a59fbd83a2"
+SRC_URI[sha256sum] = "0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.20.1


