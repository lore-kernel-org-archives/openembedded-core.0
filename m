Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84259C4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 17:00:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.28917.1669309203651441867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 09:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XEDZHP/K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1650909wms.4
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WnPA1CrDPInlw249HnG23yJg6qPzns/LQATe4R99EQ=;
        b=XEDZHP/KRGZckOHI2ALm0oOQj/zA44miRHgOstPBsRsvx1Lws2KN1/NmBZPoyMTXxA
         ioaKbD1x3ixEwg9A0ULG3InU5JO+pasvwUx0R2b0cxcFitnEL9ZqdOdfNhCTFup1yZSI
         siTeVnDZVHw/ZbokppPw9zk0vJFlEAUjb8m74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WnPA1CrDPInlw249HnG23yJg6qPzns/LQATe4R99EQ=;
        b=bDDoAJQ7l2Gc49keiS8Zm47pGUTQj0K4Px3Ow5wb4YA6wc5EMajm7mCNwrFbiKUUsh
         doiY5qQog83a2reHvcs75OLDgQAjOfFYYgKBiHv4YfynFK+BsQ5UZ97VkG87RcsmG4II
         P9Pzpu9VudPFQyU981s7YbzY6ZM51g1RixmG1ylQdG64nMe057CuuXN4aHN5Jxhl2Y/X
         +e4QITRiCe8JX3hWAp1XhjHMbXDbL68nhTRI7nIF5PBWZdXSlcXqkRg+yZt1YVEvVtDf
         rd5S5CLp7yAU3NUO+8XKK+k3OE6NhvgDF7ve8VdojLWHChkoKURudkZww0khRlujRX3W
         ciCQ==
X-Gm-Message-State: ANoB5plTp59EqL3gorEbTUPrnfLLnR1rN/a+DNQa+XlJeHAjgwcKDddZ
	xANP98fyvWy4txCHPej4qfW/uR+SUBgoqQ==
X-Google-Smtp-Source: AA0mqf6oldGkZkLOwRaXnlFHRNpyfJecl5p2gO1BZsbUDVxM1CGRVCX9L4JH4oXDXvCIh2podxttUg==
X-Received: by 2002:a05:600c:1e0f:b0:3cf:e9a4:3261 with SMTP id ay15-20020a05600c1e0f00b003cfe9a43261mr28436990wmb.41.1669309201402;
        Thu, 24 Nov 2022 09:00:01 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4038:3d32:5f00:5957])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c2cc900b003c7087f6c9asm6409054wmc.32.2022.11.24.09.00.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:00:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: Drop do_package base definition
Date: Thu, 24 Nov 2022 16:59:58 +0000
Message-Id: <20221124165958.3976351-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 17:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173755

I can't see how anyone would be using this very old package function definition
since package.bbclass is always inherited in modern OE. All it seems to do
is waste CPU cycles. Drop it and it's associated EXPORT_FUNCTIONS entry.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8203f545192..c81aa51ef3f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -381,10 +381,6 @@ base_do_install() {
 	:
 }
 
-base_do_package() {
-	:
-}
-
 addtask build after do_populate_sysroot
 do_build[noexec] = "1"
 do_build[recrdeptask] += "do_deploy"
@@ -786,4 +782,4 @@ python do_cleanall() {
 do_cleanall[nostamp] = "1"
 
 
-EXPORT_FUNCTIONS do_fetch do_unpack do_configure do_compile do_install do_package
+EXPORT_FUNCTIONS do_fetch do_unpack do_configure do_compile do_install
-- 
2.34.1


