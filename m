Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227EDC4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:34:56 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14992.1784298891020188060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UchItkwt;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e7632b193so478646585a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784298890; x=1784903690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OSX/CKAOckLe/FXpAxijy0EGZL3d/0Hzt3IOmYSN+gk=;
        b=UchItkwtYpLk9/EtpYHiGTXAmyUQaa+G2xVZKauaHOBvRFohvMlYceOq/775GOG65U
         AP1e7HZBLFi0Yw1xjP/lrLLZ7ljdieqaBic9r0qPAEk4wBpfGKgFJO/OBA3Kz55fnLRZ
         GGrC+tuEqbCVwKIXP1YsLgFvTSe67hdIfBaMfEm6ahyyOAcZDWXLY5oBUVWn6/++BdS7
         h1EW4XLDUl5Frg93gguPEkAVpk2B9E+dnegM5OrtPJLlws3IFZpj6pfJhB8sjiZHH+DS
         HCeFvUXDNqUVP01iWEbmOe4tBmeQLmiHPqYKEQFTEUwhEk2Q6Uy0AQDmPoSM5IEEHDAE
         Mr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298890; x=1784903690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OSX/CKAOckLe/FXpAxijy0EGZL3d/0Hzt3IOmYSN+gk=;
        b=hkT6B1tjqN6rqSO2V1qz0aU99/6JG6X96Kj+I+sMZWENhRXAab0N+PMoPEFM8a8/TJ
         LX8l21Uug9B34DuNYqCHBcDAWP6bPqpV1zWZd9FZ54frNfcoq3MrxWL0wavKHpuHfPlg
         JtjWOdqhQHoHaAALnsny+4Wp0zV71S4iE0IrOv0v3XPsBNU3ahg1cLtWhPA8f/7AMsvc
         ERiQvNKuLc/lX4IjtMWjFvDnJDES4aR9vD1JB4JuFD8F4WIeb39eAs3iiXpGc1+zo7Uf
         /y9eHT3Pwu2fHY1Aw1E8csEaWxK2C7mZxT8a/ODhNPnOb1ZA717SkIFj5zDR+puMdq6P
         RmCQ==
X-Gm-Message-State: AOJu0Yx7S/Cl+oKXRFDmowKtY/SCU/Xe1IwLPUJhk8s32aAQn83YHYNr
	Dyfv68DI0OMSHM9yGTF8igJ1txXyWuxiCC1vnJG9FBb8X3KNIFibv59L61i/vQ==
X-Gm-Gg: AfdE7cmA4oIRDjK2DIB+MbZOwFOZr59kGYM3vRJJgkjodeiixWOZ8lKMODfFpwrxUjI
	8VZyu3sfqwflNjFjj16O7ZpxdLRJbf/DMP9Xt9IvGwjcxtMCdDIewZNGDDvcnjWKSKpv2s+It0h
	6JnivC4FwBxjnlmMEGqzmmNPcM3S1t5IEPqEov2Y2y2xpsyeDKE9V9Xturls7yLafo2e9dJ/8sB
	MLnbNnQ1BKo0ooX06EIamTP9YNuK9ZFRq6jKsQjbQ9O5Zv+rFoYZ5/i6eIQJ8Eg1GsOKSLjGSlo
	sHvEoAQTrvO+Gh9YXDuB+j38t4m9oN8QyKorr58Jj0A1469/heGZm1RRDS4O2/h/bfa7vYmu/Zv
	BpKmcCx5sY3Pxq/gjxIdjGpsS+uUCrWnXcTkpgHF9sC/B9jNm8d5bpCW/059aD7bLROpyzPOvmJ
	sQylc71l8+EqCqBw87StwEAopZRkzwRjB1qWOEpTJ7pb1D
X-Received: by 2002:a05:620a:31aa:b0:930:9fdd:f4e4 with SMTP id af79cd13be357-930b3f346bamr339466785a.23.1784298889754;
        Fri, 17 Jul 2026 07:34:49 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5493cb0sm165208785a.42.2026.07.17.07.34.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:34:48 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] oe/path: fix bare `false` NameError in __realpath's isdir guard
Date: Fri, 17 Jul 2026 10:34:22 -0400
Message-ID: <20260717143425.3521709-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717143425.3521709-1-twoerner@gmail.com>
References: <20260717143425.3521709-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241197

__realpath() wraps its os.path.isdir() probe in a bare except that
assigns `is_dir = false`. `false` is not a Python name, so when
os.path.isdir() does raise (for example on an ELOOP path), the handler
meant to absorb the error instead raises NameError and aborts the walk.

Use the builtin False so the guard degrades to "not a directory" as
intended.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- No change; carried over from v1.
---
 meta/lib/oe/path.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index c4588ad0e65a..f0462d276196 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -234,7 +234,7 @@ def __realpath(file, root, loop_cnt, assume_dir):
     try:
         is_dir = os.path.isdir(file)
     except:
-        is_dir = false
+        is_dir = False
 
     return (file, is_dir)
 
-- 
2.50.0.173.g8b6f19ccfc3a


