Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A42C41535
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3090.1639000802739050337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SKUY79F8;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id c4so6464705wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x8OVTl3bzreACGqvm/+QPD1oB8u2TQHzs3jQQvOQTZg=;
        b=SKUY79F8Y3YEWgnvdmgCnR6zGeZ+V7yjFokS96USomWo4/sSNQDaQsI0g+X552pvxo
         KAIvQ6zl2qnpdlJp9h8MBVIn0OwIZAKa1EW/I2i0zMQiZx9utdT/hmtWtVVdLKS699Pp
         2qR2g8CRETs62U+3Mv0EC44QtGtTna41jXZERp9F50DqrV2Wuw/RRzesNXzqDaaacDSM
         YQm4fMfbZtQILd5jB1jeeN1lCMsynVi5dD/pd+P3VXk0b053xksbEMhIqvVxH3ZyTEhs
         Kwwul78W6c4a3DP+vZWYqxLiXNBO6hZ/JgwqWFq3yLMsmiEKp2xF7lebkvCv65UPqr/k
         6fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x8OVTl3bzreACGqvm/+QPD1oB8u2TQHzs3jQQvOQTZg=;
        b=cmZ0DIAqhXOoNsYc+waIPnjXclxpEdzjHzrYgbSDsBwnXbVLcUzfTK8e+gopGnXxD8
         wQX66R3dT07kXSyqX2vcDe4i5LMehSmTtURhnS6YPkJb1uk0Y9lTHlRY/HXTSnGvpnGM
         rahX26U/tNocLl7JR70B4wFZ3bxoGaB1WyMAajKo1TswVFsl0vo2GIXeTJir/WPP8amo
         GVvYtr399u3KGLxaoVZJkPdiQ5p4bPWi3x7Adx8f1FMyH31BCn3Wi9FjYJp44iv+EfpY
         pMJDh7W59BiRKEcWfDY1Hmr1c9WNnIENn/VAIv9xQsTilTxjSC2mDrdHEr3CKldVGIpn
         2Tag==
X-Gm-Message-State: AOAM533uZ9Q1rw/9mG/pefp8n6w6tb3dCpxuS475YjCZJ0sf/zZJqFyI
	Y8j1g9Q86Cj5eJ+8D8Yk0Axu60mCpKbSNw==
X-Google-Smtp-Source: 
 ABdhPJzaRMcW4YN134kioGh7Eq/i+6tBQpgJZzTHQxxy/TUPqJsgtfvosLERlwaymUrzeKZ8pQ/9cg==
X-Received: by 2002:adf:e8d1:: with SMTP id k17mr1495446wrn.465.1639000801354;
        Wed, 08 Dec 2021 14:00:01 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/29] ell: upgrade 0.45 -> 0.46
Date: Wed,  8 Dec 2021 22:59:25 +0100
Message-Id: <20211208215947.1979470-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159373

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ell/{ell_0.45.bb => ell_0.46.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.45.bb => ell_0.46.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.45.bb b/meta/recipes-core/ell/ell_0.46.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.45.bb
rename to meta/recipes-core/ell/ell_0.46.bb
index 64434c278c..4dea9442af 100644
--- a/meta/recipes-core/ell/ell_0.45.bb
+++ b/meta/recipes-core/ell/ell_0.46.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "fedfcceee56eb63ab1eb98bf120a3cfbecee50bcd893874328c889f1b381e7d7"
+SRC_URI[sha256sum] = "f4fc647eff32f622e21f8851ed0c8b7270f4800149c91be601754e22d82cbb4d"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.20.1


