Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E47DE7719B
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.14217.1736325758448991191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fi7pWQSx;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so1222224a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325757; x=1736930557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8yIz/WETDDUvKTqavqmQz5xvSjSwmSGXOdawiCx/40=;
        b=fi7pWQSxKCxOCElSlGRi1nFYHyfkpKofyqo/tBWFbdCZvKTYipCvE0xM3vKklLMZrz
         ymRl9vWCv2f6eDEz1EcMU1iU/xfP27wx9DaZgIuhbNnan43r01uBBXVhyhUcRaBOEJuW
         ddue0d2AT1+PsAI0g52dXM2aVeCwzMJZHn3Lvn/1X7PKsMcb043AI2GSKRdFwgbhq+vn
         XRI85905AP1npPvUtLpmVOt3Penazc1/AmDmeCb+GX6oaTYLAmRIjx3wU5o+2KVIbh4X
         C0MgAeqagcKmTTRziw19cD+0sCLUpfZzQpwfURrefZvhzQrVCaAdY44xZWpF40+oqnsJ
         g/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325757; x=1736930557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8yIz/WETDDUvKTqavqmQz5xvSjSwmSGXOdawiCx/40=;
        b=KCaLzodYpZg40/iZAP4YeRk8akF+QukUi1slEVffIS1sizKJYhgIiUklD8/flnuQ0z
         yqEQpa5vMlI/JX84ixs3ZT6xFlK52LfvctPSR2lLMBjoEK6ue3cnqe+V7LIdbiA+A1TV
         xUOa8EEe9f6fNtBRpGaYmyTNhPeOTYNaioRHW9o48QFqnRF0xiGw+G61fSs3fQiwfq5N
         afEaYMPJPjiNcoisefWB1fKC8WsFS/kN0N24TSbnSTLFV//CQaHo8HbAS8wfIbkIc6l+
         rpHBOKnz6uAQ+lIJ4/2iQti/5FRrvqt1NUwhwPqJFe0TtC2LcFpUZ8WYmghw/J5YWgu8
         0dRg==
X-Gm-Message-State: AOJu0Yxyw5sTCIuJLCbl94kgVOVRA2S3/tcI1aXdyyXQr+a62fy7TLT0
	7JrA5IEYekHnDwf1GoOyeWWnqOUoVfyafnR8GGAGdUT97c2nex3/fuw/wg==
X-Gm-Gg: ASbGncuv7V3tts6kRZyQc39TBsvPl/6UB9OE/9sHp3c31OT5flsg8oCJPOfIBvMi2Ya
	YdJQHQcursJBJPn+/qVhXH98GqO8rDIuVKLc2vw5E9NeFwhxtCNkD+YJ9P7lCPJP5OjBu4zg3YS
	t5yqKYUQoFWMlLwyFUlbA9y0fWgsLW7AJ8sFI37BgdIuncrSBTyEqf3XgYTH696penZPpSTT1mz
	iA+6voQpgl3A+1EAxcmwbB8RK7MR2pFsFtOEwAc3bXwnoUX+reffUP+Ly0LCxjUcvD5emq9fD+6
	6L1Wn1NXLWWc3Ko/QQ==
X-Google-Smtp-Source: AGHT+IEwDVZWLm682PkLgUv6syS8ep0Dd0GFUrH0XoZrlENlhT4RyUV3joe5pyMSxi7o6UKPBqbFsA==
X-Received: by 2002:a17:907:72cf:b0:aac:333:a0a1 with SMTP id a640c23a62f3a-ab2a7ed9741mr152157366b.32.1736325756689;
        Wed, 08 Jan 2025 00:42:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/20] vulkan-samples: update to latest revision
Date: Wed,  8 Jan 2025 09:42:16 +0100
Message-Id: <20250108084226.117178-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209532

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 2dd4bba5230..7cd6b9c27ea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "4838e02a4b08236931bec0532fc26ee3871b466a"
+SRCREV = "04f03b32b860ab25ab2731433597d9a23929c386"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.39.5


