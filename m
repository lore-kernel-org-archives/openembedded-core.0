Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F394CC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:31 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3655.1657094848544225873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TXHHQg7P;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x10so10871269edd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Cl3D9LT+O/LDW5gJuMI/7WcvUkv05DfisQmOneVvsA=;
        b=TXHHQg7PWsJ54/VMYF/d2AtPEdJd9uIJT6Z4xwPx9le6mgxJiUtNwgE7WJtdXgOXhn
         Bw0cgbjYlp3vOmKuqDSFGiWaPiKJA0Fm8kw3jHtQxQ+beMOjqdygLMutkL4+U+ZOH5CO
         8VWp449//p3RIXi6z1oz9kKVwIQ6RCz3RLWSVAGCn48yyGH2qe6RqT+l4ttfC4ypv0G/
         XdGjhWRZWchH8QRPPrTli297SMYTOb7mCWQNOnNy2y0NSUnptibd+PV4aWxwegwc2Lcn
         ParJIfj/G4qf46G5rXN7lxzVXNp3AhvYFQgUrBHg5Fe9ph3bBza25aEW69t1jBO5RS4V
         bgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Cl3D9LT+O/LDW5gJuMI/7WcvUkv05DfisQmOneVvsA=;
        b=l69dblmMBXVyB6Q0ld8dXzr9bixUpba2SzCANa2jpRueuLyUP0ScSgx9JDEzKguB2H
         BBpNo9qheBn+BXVq1u/xfArPOJYGPxQ7aIzVmaVT4TbJBLgVpQxCh06X7RsSgEzqIvT9
         dQUCL5WmWPeUbrPs8WAXpgn9p1QjneejibhOIbs5+PttXsJAv3huTBpv5++ZdaPDizYK
         0rlTfXI7D0njPakN/v8weVHAiBTXQOyi3nv18SAFX2j8AThpN6zm9XZPt0A7LoY1N8/c
         YtxxctJaAmUoAF1+AXQI6V8pkoFps5vY7jOwV2esUgh0irdmS7uXuT9ZjqxgQ110r9BT
         BtMw==
X-Gm-Message-State: AJIora9UP79gQuXR2xb3m1qwkuWKtKUXIiEEKbctCocwcWgW2AhKSlHT
	ht/uGIWLjFALZo5fgzFryOtiBLT2rEzgsw==
X-Google-Smtp-Source: 
 AGRyM1tl+f8tAtETU+tMLQ9UGodcd8pN4aixeqShdPQT7BV7U2/U5UqeLvVk1BVId4OiSOcGJMeWuQ==
X-Received: by 2002:a05:6402:518b:b0:435:c1ed:3121 with SMTP id
 q11-20020a056402518b00b00435c1ed3121mr51570016edd.405.1657094846872;
        Wed, 06 Jul 2022 01:07:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/27] diffoscope: upgrade 216 -> 217
Date: Wed,  6 Jul 2022 10:06:56 +0200
Message-Id: <20220706080721.3072553-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167689

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_216.bb => diffoscope_217.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_216.bb => diffoscope_217.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_216.bb b/meta/recipes-support/diffoscope/diffoscope_217.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_216.bb
rename to meta/recipes-support/diffoscope/diffoscope_217.bb
index 87172e9512..d5ab38f8ad 100644
--- a/meta/recipes-support/diffoscope/diffoscope_216.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_217.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7809caabf4369a1f1dffb9fa37e247b4326aa3366cabd6ab3eb7de5cb4402c39"
+SRC_URI[sha256sum] = "1e9791e3f718ca809d98fb319b150ce6222a682b4009ea00838b9d8705003950"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


