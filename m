Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66338C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9370.1672830362981472240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BjKC9Gj5;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t15so23700276wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dT92rhaO8Ux+6CqgVUI1plEPTFmRa/z4p2h9YJ5+IY=;
        b=BjKC9Gj5MNCX8GhhT2V3SvclDMU7mQwHtmIGU9r1qWGuwgtfTbvqN3mdAb4lcf++MG
         yGnzPRGk8zap7qVKtdn1y3X1znyhB9jmDVY3UnSntXopuTEVDliDJDEg7vQp71eoduXs
         xhhCG6sumZmjIghrfQ8rXQgNKsmHi4A6tZLYd9OaDl+g5hfus97kiesyXcrf9GbJ1bTA
         eZRbl3T36sYt7gLdYoSdT6EBDRGOgo+zunNm7QZnZBvpUmHhLkSL9Jq5o6Nj5qkYyHz1
         y1Tf1sfQWka2VxP6EiaWnid4hnnB4yV5cvZmXnKwq4f3Nv2A23vbkeb4AW45SkgeujaV
         Z1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dT92rhaO8Ux+6CqgVUI1plEPTFmRa/z4p2h9YJ5+IY=;
        b=6dP1bSGB3hExcGLqo8qn5zl+1pB4A4nMxpjGI+NTO2mrL/RIgPykVeOaTgqO3Vp4DO
         vkTKnN6CoSFjnBtBWg8TcMGRQML4+24thNmeAUXzluJlOOmZKdm8/v2U5dZOAehN0NIT
         BrGD1O3yy+qNFW7u+Ypn0AUjt1osEgyFIWjqta/eg2u8db+wY/TA/SHJE3loQEvFkjeQ
         if2Y9JaCJcJbUofofGuVKeVgmdP5Up/CmSdZTsYMwBvE8BxJc+9DiDBKebgWwSXNRw2p
         vfI/aNRAEz/DSYLjbT/F+LtF0fQ+xw4cqk09bA7eFXL0/jVWiit8EAcZv1OxFUZzzJ6H
         HBGw==
X-Gm-Message-State: AFqh2kqISQv4GiwOo1NqaOYYennUjxl6dCU2b3Ke29F0+seMtWM80i+m
	iGfwMm75Ub4YNHr5RIYi0aSyXtD2n6U=
X-Google-Smtp-Source: AMrXdXs7/pig9JfdDtIkSAUKx6Q5YqQt4C8XEuOs2BOtg5F3HVkDbY03alTwHXAkQVnAmgejYIlDwA==
X-Received: by 2002:a5d:4911:0:b0:242:4bbe:2d20 with SMTP id x17-20020a5d4911000000b002424bbe2d20mr28786000wrq.42.1672830369002;
        Wed, 04 Jan 2023 03:06:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/77] harfbuzz: upgrade 5.3.1 -> 6.0.0
Date: Wed,  4 Jan 2023 12:04:52 +0100
Message-Id: <20230104110548.2537259-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175405

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../harfbuzz/{harfbuzz_5.3.1.bb => harfbuzz_6.0.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_5.3.1.bb => harfbuzz_6.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
index f56403d428..46ab6a4ca8 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d"
+SRC_URI[sha256sum] = "1d1010a1751d076d5291e433c138502a794d679a7498d1268ee21e2d4a140eb4"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.30.2


