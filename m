Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20824C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156315.1783358251714886975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GfnE69UF;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so32763475e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358250; x=1783963050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXkLnRBCATS1ijajqX1WDPA3ffw2D5QXmKz0hRFtvSA=;
        b=GfnE69UFQVtbsmv/e30LbOCp8VGY1aaCfOw2PRKhYeCHnpD7CvAWEbQIXLCMkabNe0
         moRGfSkM3oIZkucIea1wVvVib1eYYM18BMBFmX4qjy3bIX1vSfVxFIj0poGXNxodNX0Y
         e+leOuFhWrXUx+agkN7WmTw9YqkYd0uTJcbKG64mUDTVJ3SVn58uAc4isvbQRyVfHrmj
         jIPyu5shylZ3WP8BpeXrUxHpYJj//GGucg9imNBLfolPpqAP00GMemuUveAJrHBo/Vws
         szIfPvsln09xyiA01g756H/57FhyCabJxUDRKsEvOGsWMqyWv+dNx1lCm5rhNBOo6QiZ
         f5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358250; x=1783963050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXkLnRBCATS1ijajqX1WDPA3ffw2D5QXmKz0hRFtvSA=;
        b=r+oInRoLffD3DXsGga9U5Zpf8DV4hqGFKchrXFv8NeTiICunkQdh/jW0LC7c282kZK
         iAulSciA4acNCVsDvCZD+m8qLAMXW31MIlcZyjH4zosPlwxX23wfmKJHflws4nEOi+Ls
         SOdO/Yy+2Yb1m64WkygSZy9UMHeJTpXO0bxE3o4v/+cd8fsFWEeu6YzL42ITCXvkXRzy
         vs88iPWNnJZ59K8cV29hM/XURhmd7Ba/s5BjmDS2wyJkp+Tp7M64lH957dryvVud20km
         pUS3nLxh0cuh7L8WkKlLUn8A/y9JJxlAuC74gtDTXhWGfw33r8QNc910Nkt2w8yuZQpw
         xHUw==
X-Gm-Message-State: AOJu0Ywqe2QfP2y3r/Sy751SSsYN/dQhVPoDyy1Cgn7qGN/XZCs4siis
	ZNjWz10wbqLmGOiNvQEwkmWHLI3hHsgZJZjlIlZtRlMFEjIy0iyjgrXRvLReTg==
X-Gm-Gg: AfdE7ckpiym3nX8fkPSP+jcvY/O6Wuy8sbtN7MZIKis7GNEqJ3bPWumZbsRqialYLQf
	ZJXpwvPRuaEzVJ/rXg8jnkPYepgm3+b8pXf5W4kA9cvF266hcnbWHJzpk4XVPO/nlNAMvuPUsTf
	r7EEoUH9dUa28xftaymSacHLjkCgG3CmgFhP8iogm0GsCuoBVfg+8dY9Ca7ukJcvRatxHIOuOPW
	yKaJj9KAdjmXH00Ll36EemmAj7M/tYQxIGbyQcwX3Bc8k7GCH+rB/GRaf9agRkbdpUoDWk6AWls
	XGJJqy7Kfqk+bb19YYlTlO9pHquHAsr/6voN3fcvQaACzz5/Y4mXuIMnC1HLQ7/1YuYri33nWFQ
	JpaFMZSEMyjjn2LkMeCzfqZToCqtnkE/uXaH/0m01pPEtLHpfIDr9pK9WzRu85IGvwmi7yRhi28
	4bi2yX72BNfzbPF4L3pfbDsLb6C1U6G4JsqRCTvP9WDTYO4PE3
X-Received: by 2002:a05:600c:609a:b0:493:cbd4:8910 with SMTP id 5b1f17b1804b1-493df093128mr17461675e9.18.1783358249921;
        Mon, 06 Jul 2026 10:17:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/45] python3-pdm: upgrade 2.27.0 -> 2.28.0
Date: Mon,  6 Jul 2026 19:16:42 +0200
Message-ID: <20260706171701.70536-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240314

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pdm_2.27.0.bb => python3-pdm_2.28.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.27.0.bb => python3-pdm_2.28.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.27.0.bb b/meta/recipes-devtools/python/python3-pdm_2.28.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.27.0.bb
rename to meta/recipes-devtools/python/python3-pdm_2.28.0.bb
index f378e1edda..23d2f9e521 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.28.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "dbfbc484065d0150fa5b29484ead908354313d8699cf74c099d4531826bd04de"
+SRC_URI[sha256sum] = "ca7d21548955086985070d2fe4334a55e59093a466b25eebc6bb0769a0539e89"
 
 inherit pypi python_pdm
 
-- 
2.47.3


