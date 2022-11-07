Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F914C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4284.1667832918122543357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EsEMuWLE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso9791423wme.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Op3hkTonijaW5qkxkvqtdcyeufzZ8DbYEkOwKYV6FQA=;
        b=EsEMuWLEogUyd69Hw0AHmap8ILvFmhRTmeoXRWqTuVdppC3MQ+JsveGGi5xh/smm3R
         a3wXAh1aijb7tGjU5NfOvS/IeBj3W4z7mN4V5mTxCiR0Nr5iAbybEDxxdyjViYkI4vKo
         q++kOxtfBb5C/LKjgbIT0+quvJnF0Yn5Vby+QjJbPCWKwuQVsCTl8JC0hBxQlRcs+6Z5
         /3t0HLHa/g2v3D+jaINRn1JmktWNto/1VAZoFVAYLYlWUc7p3PGbLycK5t/6JauM7cNg
         X8XBBcnYoVdoN/ZLLEmgcoSFSgGozR/kIIYuHw4sk53zxQFo3WcVC2rT8UZaOHM0QuCb
         ATSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Op3hkTonijaW5qkxkvqtdcyeufzZ8DbYEkOwKYV6FQA=;
        b=wJk/32XmvgW+kerdQC2Az3WVJX8RP5OZepbKeFJWuWZIzSiRrmAXiSf686tugkP0fu
         KKoCiWL/ZnEkffnsU3ViHqyvRSENs98eyso8okPfOrkCtlwarRuimM+pOa/ME8rxTKNX
         GV06tXGm/GqvskC2lh5Tlk02PoGuRADkzYNA3dFc8uV6/V+p2W+uRE/5i8dfll8lNBHR
         KKRrm0exgQctiB3QVUoop1Drn8VSQA7zl0u6nD3/RPnm29LbGWk/TeYgRBxHvUSD2mm5
         AyBwRFETlAkbbSKkapSXA8f7/92pHz+Wk9nIcQQTIzr5NQBvG6Vnm8eqYUacIcYdboN3
         0J4Q==
X-Gm-Message-State: ACrzQf10sahYQtWrW5Ufc2IPIYhuhMiFQG4mLaItjN/UcpvDwl6IvwTt
	rQucW/iGGoULKLyxhws4Rdy+eLntCNY=
X-Google-Smtp-Source: AMsMyM4+geHn5mm2wWZrc4aE2InDUFP1jQQ3VnqR8s+mgq0sWv8FZREyBwO2VwsaWoequolHht2Z/A==
X-Received: by 2002:a7b:c5d8:0:b0:3cf:9cd9:a889 with SMTP id n24-20020a7bc5d8000000b003cf9cd9a889mr10394240wmk.26.1667832916626;
        Mon, 07 Nov 2022 06:55:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/48] piglit: upgrade to latest revision
Date: Mon,  7 Nov 2022 15:54:22 +0100
Message-Id: <20221107145508.1051404-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172852

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index c9cf5795e9..8d66df4e09 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "80465078a0ae8f12411db66850ee14f017962fa7"
+SRCREV = "1cd716180cfb6ef0c1fc54702460ef49e5115791"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


