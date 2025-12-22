Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89001E69185
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87675.1766434091160630431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DrqfiVUM;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so3886156a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434089; x=1767038889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXW7racjIRyReq0DZIKReCz0Q9WD7G4S37irHPzJGY0=;
        b=DrqfiVUMruGZo/tTDIWyFvJOxc4CM7kzGeC8MfmnWmf7tgqKLoUxY+FuNY6t3M1ueT
         6ncjOBWgTOcBMg1Ot65CbhVyt68GXWffypoPBCv29EXF/9FooZN+HsSyT9ewyRK1lEqQ
         uqXt16y/+mbHZfpAf8rbhzDEMvz+bpwdRFLJBYfaJrTd6rHNO/YbuNAdI3GNovpdk9QD
         4ca2nVw4pdG/hJWJGFXjEmpN4amLOF/VA/k/GdoKvGwc3lFY/MLUc7FpcjO+D+You2hB
         qxDgs3C/QYwq/paM2Kmv4E4DmFnR8++8BPpNivofQ+pIa0YGk8mkyYNstbhjsBJxoqjM
         CHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434089; x=1767038889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nXW7racjIRyReq0DZIKReCz0Q9WD7G4S37irHPzJGY0=;
        b=v9E0KPoIebLp1sPp8MwjAoexDNEqUorQdeTNl+6vjGRp7DKV0xQNQlATs3iTliKu4q
         Nv15zXlGfPjgNWb/P/r2rQ6tyV3W7eS8J8IRuWp4HgRPTkwZMxvunrYaFZUcCiOlByVP
         dtWpnclTHUU2x1w+2PoPKsnJ4BTeyRQj6xOFhqACZOPCMaFABh3/Sm/jnZhl06fYY283
         oGuGXgLEXcUvEnzxMp559id2ZP+huHce3s6O1kZD9UgdXPjMBu+T0AxcB16rTogpXUag
         BHGrT3a04A/rqwGYEwnk/lxi/uaP8yNDSCVHaAzECrgKPr9SgRV1XBLPeoaYKGjZNfFH
         fODw==
X-Gm-Message-State: AOJu0Yx5Kfbv/QxfsPwTYYt9X31ao9lMHLpZyj1BVHW57p3g67K0TWd/
	xsY+Fyc58JLjBhTpfvMkpPBu+90Zxxf/KMX7dUvcuwODkmPRlHMbahqIRjNamw==
X-Gm-Gg: AY/fxX5yoYI4QOIoW+0A6x/r5Qk8gA/oDnA8RAs0TsFoMfpUPSkECYCl5a8Gx/c7uV9
	j/0WGC2f3ldLSCSWKnGH3mv7A7K7zOpbOBQHxcILkz4iBKrHF61clAI1/iUPlY/XSQmBNW0LWlE
	hyw0HMYAjA0cIuufUeCJ+QanSzQGuuAqnAXiT6hYRM34cBL+YIsb8yCEGrT98EsulOGsMAdP4h8
	Xmx6/mM58v5jk3LGwxHv2bn+bX+VO6cicoJqK5cIc0tQJsIi6+7qqdqSe9De5iYhxejCzqhYu4P
	/ItTO77Yltzyh6N+jvELRPWkhZQXVJ8rGsoFGBrhOKMD7yL25N51ASfmsfPg4i5Xk8eyHqyKznI
	WxVETt43HPTgLHpAJaVT51vPaOWVOEKb5xExnyUHNkmMj2Ob6YQA+UZdbrt9ChdL1sj32VfFksz
	WJZp4i8uGDGorpfL+p3lpLik/PfneyJ/s40k93kxc36iL6s+lpUM0pbYLGPA==
X-Google-Smtp-Source: AGHT+IESfkP9mTS6McahOz4/0DLo8E/gWXHpuZ69II8w24b1tVlJLnqS5hWqpr16Be8HLezgj6bxVQ==
X-Received: by 2002:a17:907:2da5:b0:b77:2269:8de6 with SMTP id a640c23a62f3a-b8036f86bb4mr1194600566b.19.1766434089392;
        Mon, 22 Dec 2025 12:08:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 033/114] libinput: upgrade 1.29.2 -> 1.30.1
Date: Mon, 22 Dec 2025 21:06:15 +0100
Message-ID: <20251222200739.2278706-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228358

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../wayland/{libinput_1.29.2.bb => libinput_1.30.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.29.2.bb => libinput_1.30.1.bb} (94%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.2.bb b/meta/recipes-graphics/wayland/libinput_1.30.1.bb
similarity index 94%
rename from meta/recipes-graphics/wayland/libinput_1.29.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.30.1.bb
index f771085388..8309d33304 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.30.1.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=${PV} \
+SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.30-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "917783150a5bab7d55eedc5714f1b49b192426ac"
+SRCREV = "baf1ceca88b3a668dd263f50bfaddfd205306028"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.3


