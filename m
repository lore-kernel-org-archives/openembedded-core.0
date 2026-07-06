Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DD7C44503
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155287.1783358232918025518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aXavFtHu;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b77b150aso30746325e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358231; x=1783963031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p23z6zTWUMc4TXIwJQEo02HeqqXKMgUVf4TpcXxFYE=;
        b=aXavFtHuDdgnokMrdA/OSLwBHEEbuVbtp4CaoRSfJrdBy6DJzoBzHugzqIXXsz64Ne
         /zdeP6Rus0tNU2sybUJbfixEbUAnzyKRtOlC/oZC1qIb2+NBFX56GHQuc6i/KQ7srWyh
         w85cVaI80tM43yOA0uEZvco7x6VgMts4w+S51hOz7XCR+UHfOk1DPTHsd3WN/4HASenL
         CooVU9LLRqFviTuHkVxFQf4v/83S6rOMkqqzwI/hnB21DvUvDeZBmmod2so1JpgNV4dR
         rrDKSPV3pYpmY3LSe3+137DKtxkphQKJFGvP9lWXFf7Vy5JDYcQ5MyhEYgh3dox6GhMQ
         kvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358231; x=1783963031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/p23z6zTWUMc4TXIwJQEo02HeqqXKMgUVf4TpcXxFYE=;
        b=V5+HvdMLnoD8Mzt7JTQIuyeLztU1weQCkdzeIiLlHWh1f83hf6S6qn7r5n1/9brwTs
         CJnMzfZvNw6PkDg7F6graNB5eVQLSVwIGco02rKiZokmkSssULPCzkPi9t7segfFx9Kb
         AVtMPvE0YNIWPtgNgTyzD3rHSLx66Oge7SkFqCGKt1hUGskX+VFiYoJNHO+kaAmTHqkx
         fLJjp7ubKdzTi4qhcXNlq8bLrrT7plmjCyKFFrFGNzjav8llyBvzG1X9aHuz/QzezN6V
         KRXUzziCtc3g2VRwcyOaqME+RRevSPlcbSRx6f4r9JMUcXJEWdrH96zII0WeTK0ICbnw
         p/Qg==
X-Gm-Message-State: AOJu0YxuzM4B2x1K321UypLYHNVXuDoP+lQ6sPGGZZ4suaaMkCsd1OQV
	Yf4dVKUNMZtEJ1MvFWTeUdrnXrtWOK8GKcftMwPPJiGBCs/zhRlHTjYpvk1dVg==
X-Gm-Gg: AfdE7cloG1H7LA281G/xXCTBWMWlAnkTzmI6tqZDjrL31y8OHL8ciloRy2lxdqEHqYi
	5Yfg1iJX4anqhN6TRihcK0qXDqFwY29/CjMSTMdGVp0AbheezF91uikDD3IpwRj/lEl6AbYXsPW
	6cxkvX0434qd7+5mMEKLxTGO7cp9vDeUGNOcRbp1MLX07qrL+2zXA8lziOw3g7PtL50ITqVWTo/
	AJu+de3xx0/OSeCsIEIJzyEjPUIMAME3igNisk3+GnhhcwYl1NpVWcW3RZTJG1+b+BgTw/uoT9b
	e7T21wxMBzh1YitIoGNnLR5mcoMT5+2QwX3dwXuwBC8GvlV1hU7Ru4YJ/ZOpTKujmRa04Hjg7vP
	XmJqC8Ryk6eSO0HUYoogfEVsgpo5E7tYz1CLglCoSdu7EH9M4KUziyLWm1iGDnbQYrPxs8QpTYX
	2+OtptrtGshU2U7OqnYtfimp6SXWFIm0H2ySpE/5NLRN600gq8
X-Received: by 2002:a05:600c:828e:b0:493:b6d5:72df with SMTP id 5b1f17b1804b1-493df090d47mr18434375e9.35.1783358231135;
        Mon, 06 Jul 2026 10:17:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/45] cmake: upgrade 4.3.3 -> 4.3.4
Date: Mon,  6 Jul 2026 19:16:22 +0200
Message-ID: <20260706171701.70536-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240294

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_4.3.3.bb => cmake-native_4.3.4.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.3.3.bb => cmake_4.3.4.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.3.bb => cmake-native_4.3.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.3.bb => cmake_4.3.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f183f823e3..f08b0715ba 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85"
+SRC_URI[sha256sum] = "fdeff897b9eb49d764539f2b1edc6eb7e1440df325678a97c1978499e931adda"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.3.bb b/meta/recipes-devtools/cmake/cmake_4.3.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.3.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.4.bb
-- 
2.47.3


