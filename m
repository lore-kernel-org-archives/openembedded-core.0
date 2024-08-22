Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C3CC5321E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.9400.1724319346876590603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Prq9KT3o;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3e2f5163dso6005971fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319345; x=1724924145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrvFFGsHNrPpeZg0p/mMZ+T2iyI3p2dB+De3ViGmsQw=;
        b=Prq9KT3o5/Oco6m8nY++aeEGXziI1UCbgP5EanYnyyqk3RaVpoPOmghyjJaawvlvr6
         i2rHDdHGUVkRI3gddtbPCI2RJln0KMAjAQnvQs6uVb9nntkx7ij0+NEfkwAtPtDmcQU5
         CjNz7FNy4+r9oRuYqsaB3xt9Qs4RIVcLTaLML93GAPZT8v2ftbeq8pk7JSfNZciD03Dj
         q4tOJzSvOGQ+nSMuz1AdhLmi2eSqpAbGROnQA4b7CD4GfQOIxEeeG8xlZNByn1zDey47
         oiSFq6UCGW2R5FKyDI7TAv9jXv+aCJOrv4dC/5JjDAxLgvBJZIw0w/eWB21J/F+Q7H2+
         l8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319345; x=1724924145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrvFFGsHNrPpeZg0p/mMZ+T2iyI3p2dB+De3ViGmsQw=;
        b=DOCYCQVPFl0PcO2eJOqzW1X4m9BN1FgihOpkAnBF28z1G8g+eOHs3HTr3+KsSxAjCY
         F7lQ7Gb0Pr5HIQl/U6CCyxCAWBIxQSsx9SJJ0eTgRrXkDB8vRQrANdjIL0HwA3EjSGaB
         skKYaSqVvj2Cw568AXhXZZGbKOAiuWi172CvdJfu2CHm50iWbhBmsr1jsWMTQtTlP0KI
         2kNHGColTgtOJiA8bY8tOyzKLa/LEiWCO8t8fEI4dDlcxHU0ynVYnh7/Jw/syqBbXhNL
         L49QGslj2v7WPyAiD2SiGGl+g9YLF8kiys94463aXCUnpDdoVYr1auJC7I1IOEJfEyOT
         5szg==
X-Gm-Message-State: AOJu0YwmiHsFjeuk1zeQpHZnMd5cmhUwOvawH0evOEVl7fTnp9exx2X2
	+95u8arKcnZJkapgd4kIM/2iFyLYhf11QqHRkmHu6FOPf/M+LMiZYk5yrA==
X-Google-Smtp-Source: AGHT+IH6Z5y6cvyclqgr2xl0InX/RxPnTjrXZSzilF9uDvVYFJavFSiGi/nzdYopJW5V6EEZrcd1sQ==
X-Received: by 2002:a05:651c:50d:b0:2f2:9a2e:c257 with SMTP id 38308e7fff4ca-2f3f8952027mr33511351fa.41.1724319344641;
        Thu, 22 Aug 2024 02:35:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/32] xkeyboard-config: upgrade 2.41 -> 2.42
Date: Thu, 22 Aug 2024 11:35:20 +0200
Message-Id: <20240822093521.36790-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203646

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xkeyboard-config_2.41.bb => xkeyboard-config_2.42.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.41.bb => xkeyboard-config_2.42.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
index 79ce7dea35f..cdc6422d464 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f02cd6b957295e0d50236a3db15825256c92f67ef1f73bf1c77a4b179edf728f"
+SRC_URI[sha256sum] = "a6b06ebfc1f01fc505f2f05f265f95f67cc8873a54dd247e3c2d754b8f7e0807"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.39.2


