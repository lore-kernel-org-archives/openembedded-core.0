Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533D5C4167B
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.2683.1639608048100053243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLf5osq5;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id u17so40762205wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oyW9jlpRVzioVvupDcuT+qzotwxbBhfa4ihq6XA1wwo=;
        b=LLf5osq53a79oagKzAokg3armAKKzB38lkHMWbIbs1Ro/sbDLbpIcZChqF9fSnxagA
         mgK9rGymvs5eCHYcLbyIK2E+t8yszHpHtZVA1Bu+e3aWaEurk57s6kU410QpEyFjBeIn
         359zPPKzNaVWN0PTyY/gvqb2HrlEX143K8gnq7naRAKj8FMGwD+isp8kJwPcv+H4eH3f
         PnjByVrUdn1y60WNdi0NNX+S7Daa21U7dJvJa6m3eTd9MEIa9YJe+KmdP0nLZQF3Q7DC
         pqYzq3SqrcFsFildCfTA+X4uTlSLR6G1FDB/03rxbn5z/ZYcwdv++1y5SG6x53+X+1HM
         jxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oyW9jlpRVzioVvupDcuT+qzotwxbBhfa4ihq6XA1wwo=;
        b=2VT1NCNunkl7ZD7A0oALgg5vN6mz5CFPtUj7d7Y8UpX1B4hbAoUEScCAr9Wr7PrVqh
         ZRU2bsFRo8wU1gBlAULkh31uYNEPzwe4l8ZUNjEiykvVeiYDPzUqZbv9iQ8CZENZ0TKs
         MecAZUZS611wcXv3s/AneXdHxFsXelrmGZ26eFYIfBJJrry1X0gcGlnUJwysHFED58Kk
         Mp794xkmDkyzib83JD7O8UBKosep3cPwWpybY4RpSfiCxDODZdpzuxHnEueCZRLx6Jxr
         oGWQ+a99XcaWgKu4Y/ha7aGx6II/HcHLBby+ToVzTP7ljJQCRsysnoYGHP6oUFux1tOz
         VI9Q==
X-Gm-Message-State: AOAM5309JLJnoAs2JoHSU6/LqA9asw0p3+sywQVUIuQfMYA83s04FTQk
	4rAAPIxmLY3wL2ulmn2vj7UBGZq+As3gFg==
X-Google-Smtp-Source: 
 ABdhPJxmupu27GdgVgWc9vdUyOCrHdXLEfJgwgd/ghOdYgIE3CPQ7YnckD4sTS7N7kXFQVoXp0GhXA==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr6517522wrd.369.1639608046774;
        Wed, 15 Dec 2021 14:40:46 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/26] harfbuzz: upgrade 3.1.2 -> 3.2.0
Date: Wed, 15 Dec 2021 23:40:20 +0100
Message-Id: <20211215224034.1814148-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159754

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_3.1.2.bb => harfbuzz_3.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_3.1.2.bb => harfbuzz_3.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_3.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_3.1.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_3.2.0.bb
index 368f7c1bde..647bafc4d3 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_3.1.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_3.2.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4056b1541dd8bbd8ec29207fe30e568805c0705515632d7fec53a94399bc7945"
+SRC_URI[sha256sum] = "0ada50a1c199bb6f70843ab893c55867743a443b84d087d54df08ad883ebc2cd"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.20.1


