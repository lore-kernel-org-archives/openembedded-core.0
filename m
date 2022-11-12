Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98933C4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.2925.1668262229786839138
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Pm7Y1kIl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id j12so6430395plj.5
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MkfVQs9/YaOmzkJPjERSHvzRZVYsHgLFQOF5JFh6eQ=;
        b=Pm7Y1kIlc6CFKFt2OlqkB0Tpvhyg3F5T31k2c3FXjNzoXgw0oEWZaiIKU2T9BVMQpX
         wcjJpYEaMc6E9p7or9DyfnTu4w8ULtJ7p8jfhDg0RAaofeUQ1IxBXaXMX+bFc1s36Yig
         /50k2Gp8Kis7SnWPRJThxcqrTo9/4hiRh3uwDfPuHUZUy3arBj0yAILPzMNu15esnbeT
         XDZPds9/aUpufaHfIVM/PLUR3oHyugRCswglVi6oo4TY4CZvKyUSRvwwKXATeI6Pe1Ji
         5WnGFUDJ4OorGbgPnkIyfCDEYoz17x+46IGP0Yl79H+3bQf5E6JSU5+jzM+MZoNlQ1Ef
         K43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MkfVQs9/YaOmzkJPjERSHvzRZVYsHgLFQOF5JFh6eQ=;
        b=NIALrbBjmBlZs5NA4mrGgXHcuaHQvI09AiQtvxZ3id1OUCxCVdNrW9IFYDLAGX0RDU
         kVB2YPlA6ygJLhIcRVanEx0+pek7OMmRWTJwARXWCWZzxTITfxLeiI3TYKfM8xBYbrKg
         asa+UFDQop/d9jTkl+Hn7p6OeBifBpvbj83EHtMPR+xEtoh3kOlpv7on9vyDIvOY2Auk
         SidBOK8iJSjIl4GgQxOHX9CMvt6iMzyejXPvBP3FPSP8b66RvzXfaK7A4e+4GNNl4hgp
         /uWRgSMo+rcRxzhZlaOxPqHoItNlHcoKRlyFmDHQC6d26x4Ky/Oy1MgaDdTQCvFAzw4e
         FMnQ==
X-Gm-Message-State: ANoB5pmYNRf0VYpREQy8Us4N0JpRGWwWv8qRmAvyqIQHQZIWDxZQ258y
	HFEfeJL0s1btLHGJ6AKn18grEqE6+P0K1U5R
X-Google-Smtp-Source: AA0mqf55AXx6IRDX2HTzYHG45YoX8FE1AMtBTpzBiVupzHbnnl8vdFWJPBpgh1KADKRG08NOihyJjg==
X-Received: by 2002:a17:902:9a81:b0:185:378d:7c2a with SMTP id w1-20020a1709029a8100b00185378d7c2amr6802975plp.127.1668262228836;
        Sat, 12 Nov 2022 06:10:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] wic: swap partitions are not added to fstab
Date: Sat, 12 Nov 2022 04:09:59 -1000
Message-Id: <ce99d451a54b8ce46b7f9030deaba86355009b1a.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173160

From: ciarancourtney <ciaran.courtney@activeenergy.ie>

- Regression in 7aa678ce804c21dc1dc51b9be442671bc33c4041

Signed-off-by: Ciaran Courtney <ciaran.courtney@activeenergy.ie>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f1243572ad6b6303fe562e4eb7a9826fd51ea3c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 2505c13fce..42704d1e10 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -115,7 +115,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
+               or part.mountpoint == "/" or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
                 continue
 
             if part.use_uuid:
-- 
2.25.1


