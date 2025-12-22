Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294A8E69178
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87775.1766434076345774564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h7YshPgh;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8010b8f078so507487166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434075; x=1767038875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35LXbdgr+5Bj3ZNvP5vWvUdsbXkQzjVUBMnvZgpYu4g=;
        b=h7YshPgh9tTWUzUsQieehFvPPuZzgZl1gVppFxWr8euXR1roeTjmFNwYpeJswL/Xd+
         2Rb1t7+RHgBh9ogpExXZZl1huZGH0owScOM4ZiKFXA2mvK5lv2zpkOMtnnuqw0AgtZ3o
         drpCQqNeg9AxmmGsWHL1gfOiWZjXeyCP5f1TjLve5WTVb308VFpcbjPWG1s6KcIlLZyP
         v4tYjRL3iAFFzR6El+KqLhZCVAPlg4drXLyIrC4/V+1uS9GzSIkKV8dSPvaGDkyC+n8s
         tDsq1Zz37eMQ16Qqdf3tZx+LpBuT6Fu0w7UiuRIOs+pWca6wS3bj6uFTSPtEHyRHVdWk
         zoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434075; x=1767038875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=35LXbdgr+5Bj3ZNvP5vWvUdsbXkQzjVUBMnvZgpYu4g=;
        b=xIV0gatOz04aq0msWHB7bbbmlzQP6ncJ/Hnx0+wlYcCvlb4faLm59ucmai0vegkBoB
         6/LCABL8UIB3gXVc614sR7BEx7yIyoZ3Mx6I1XOrUmBxkm0be90vSEMc7jJPaA1V4GK0
         rK36JHH687ofDv2e9r7mHW69T8V8alZyVGo7piInhp7rNZlk/De9qOoNVDxpb5Tp/68l
         TgMcwvC/GT0XWPs+rWHGbXCjHNPfrJsOmjTEbKLxP+6GcESqOjqOhn63/ar9AgVbYsS4
         sv+9xmoOzMfZGURMfqNGnQDSxr8CvBhvKEz8GydE09PSjfFLtGLnvt3vLuV+H+dW0YQW
         RN6w==
X-Gm-Message-State: AOJu0YyxD4IWShoiyC2XtSytPY4p1JuaUyHZC1M89S7de0mnhJHDilHC
	R2DarP/HCWC3oiRJLezx9YZ9ihf+u3tKUvrV8OPDlqtg1DAPpLXGGI5VSbl0Ww==
X-Gm-Gg: AY/fxX4L/JGPY/u4PDLCp8uSJVtcf+9O/yY4eW0vQRBTJ5tCal4JJ4FdSm+IKB7GP+P
	YXIymR3i4E+SAFdcruONyfDYvHkVtO4Dir55IyWL/FWrqzK9sUL73tH2u82AKeZUW8II19P4srO
	ogIYGU8oR5VZSFUVnlqTdX6br8FltdcWxoXTpKSxJezyv6/m8iK4g69nas2yDyHU1FCVPFGtISm
	bi3KY0p5MIyJiXWPRFLGRbBqMC6cJcTkqmijtqFn/EMa6LZqpvvWuFfzVVlm4hL5xo+HLx/D8MQ
	x5VShArXQbNGXC96CU99jaTJivuEVv2ceBvGiulFk7K4K68/qGeGxMJR6O4bZ+8wfPtRSlzLCa+
	HH7j28s0Uxa++P3H5zJ5B06DHL8uh9/RTV2e1ELQRfoOwUWDHrmxE1A/lAI/gthhI7sgH1p3Gvl
	7iRMHhqMgTCCIG78nmuCoyf+L6+1/ppHxeJxYwN2DX/PmxIo8=
X-Google-Smtp-Source: AGHT+IGoUoBAQohrW/pFL1BRLfIj3qxwF6Dq7bMEP9xbQ0PCPJJF8pZHgaYzoOGDegIc8Kk9etCzZA==
X-Received: by 2002:a17:907:d0d:b0:b76:7f64:77a5 with SMTP id a640c23a62f3a-b8036f5ad02mr1465684466b.20.1766434074638;
        Mon, 22 Dec 2025 12:07:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 014/114] gn: upgrade to latest revision
Date: Mon, 22 Dec 2025 21:05:56 +0100
Message-ID: <20251222200739.2278706-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228339

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 8637216988..e61f3936c9 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "092f4f0d612e5982728c8b872c2e69cf3d04b21f"
+SRCREV = "64d35867ca0a1088f13de8f4ccaf1a5687d7f1ce"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.3


