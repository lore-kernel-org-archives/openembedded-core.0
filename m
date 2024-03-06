Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5ABC54E66
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.15041.1709739745488517578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PxirV462;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44ad785a44so640865266b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739744; x=1710344544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOX7QCy34gD/nTa9F6SU6JGJWVVGEn/DTY7xg0ewwdU=;
        b=PxirV462dKB0BR0KHqiAuuQE+BShGdmEbxICt0ByexroqJ4AIFxwhlNiVkP/OMbKzw
         kLRM9ljURkcpZPMArR1a7/wqS+i/KAQfKqSAO5rGlUVcPwWFVO/JCaVv/KddTea9M+xH
         k26jVRMWXs9XZciFgcCeEusR6L1veVEDZS8VNZjPj2JCM1AKRuR7xj8DgNBYuAMC/2/x
         ByCvLks+SYWdWeenUeS5YU+IGsRRx7bAOwCmQJY1yb+XaaOh1NyfpzMPfdGi6/lasZPP
         6ay1TR24Gug8ZRzSzTFKzv5yv5V7BCa/ZzoaV0KbjYYh6bDtAEPdnhTLhATR30ytCGIT
         4VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739744; x=1710344544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOX7QCy34gD/nTa9F6SU6JGJWVVGEn/DTY7xg0ewwdU=;
        b=t4QuoFbGpQGyX0N3q3iA/CLhX/v/VyffA+am5hkNF0HwNYDO9Ydv+OM1W4fVeJ/cC/
         XWNYc4GVUaxihUDXscLFVJe+U120NJxxXNP8JvN0Z7jUxIhxKiVEZ7P3L11AcxQ1g6Ev
         Xdfexi+Kf6WV1vBdXQLcrOyLUGRMFa7ZhFkE5Aeur2n9SJljxIjuwt2HEYgSWzx7w+b9
         rYbqDODR5Ya8F+EjG+OWixYbCXVsqhtR3Hq9UVb55Hpe4iFjyM5Hpc4QbqUVRClSJFjw
         ggFIe4EVhytDV42jHB5Tf/kaJEHUTYNKiyiDslE8ydyMbPVNiDjJHQoKr/TMptarRWBH
         F1Zw==
X-Gm-Message-State: AOJu0YwDzeFjkHz9b0zDp/YWrbHEz8zH05d206Zlygvlse+e+eHkn7A0
	7cO0izpoD2B69peqz7pCWleCWXIFBxajQr0fvYm0CcZCjZFMaYKb6FTHdV7O
X-Google-Smtp-Source: AGHT+IGeQ42kVyl0Y/P3g8nMjwYV9aAmAcxV+q3kba6QAdCFQct621NrCtK67Dcsdbl916RlLXOTKQ==
X-Received: by 2002:a17:906:ae8b:b0:a45:9b85:3bc5 with SMTP id md11-20020a170906ae8b00b00a459b853bc5mr4527437ejb.33.1709739743919;
        Wed, 06 Mar 2024 07:42:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/47] ttyrun: upgrade 2.30.0 -> 2.31.0
Date: Wed,  6 Mar 2024 16:41:47 +0100
Message-Id: <20240306154151.3741709-43-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196726

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ttyrun/{ttyrun_2.30.0.bb => ttyrun_2.31.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.30.0.bb => ttyrun_2.31.0.bb} (93%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
similarity index 93%
rename from meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
index 73c6c58c9d6..122dd9d8e70 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "c217f6be6addd4d008f110efa53fbec79681dbfd"
+SRCREV = "6f15ed326491a17d83ca60cd2bda47fb5e8a0175"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


