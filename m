Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC13C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 11:49:35 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.11378.1670500171160895927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 03:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=egymB9yl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id u12so1296866wrr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 03:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=K8OS6ABFHdmo/Onz1xPpIXhILPeIdFYbhow2KqR34jI=;
        b=egymB9ylJhGHmwj1kNQ9IxYmetNMRDgqOpyqcZs+L63zoOWJrYgYf03TYGik4yBET7
         HLPsKbcqf98qFI010qJXmj3FAEI9KHX0Jxsaub2A3NVyRQ4JN+EmQNsgQE8sjabhZI/s
         FRE+ezlhjyV+KeCP3ZoI04noYpU7PsPqi4PX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8OS6ABFHdmo/Onz1xPpIXhILPeIdFYbhow2KqR34jI=;
        b=CuidZTKsUW8Y+E2Wj/oX0m0l0Eubc10XX4NIovgPdUZWYYKmxHZDIsVrtds6Ki6o64
         mK8ltZDWQanG0UxwHAQG/GnSJkLHzlmqldPMFM4oYYz28VfIQsfX/boKPuNBuDdl4ZXd
         prGziqRvk1qQ4wuUoXa5m/Rrui4pjmwlwXwWzbA1BXPbJwFQOJW+/LBmOu0g6+Y7IsZd
         OSLzNSASuXuy+CwOgNukULVAJnRH6NCQb2hJQGgk05D1I2gqg6EhsEDvcw8bY0NHoFRw
         rghKUlRPg9hQ9Tx0R52JixhqpcbVRrZhjtYXopZZZ6zFKqIH7Q1VLgGxNdgGMaBuGW9j
         kaxA==
X-Gm-Message-State: ANoB5pkzj9w5hZIyMuv99X9Jjo3K3Yxby+OnncVSx3NYoKqQ0JfE0tf+
	z81V/ASVpok0xuX2yYBAGnUkFnFBLE/A1jEp
X-Google-Smtp-Source: AA0mqf7pQQet3WWCYoI1VtXx7YNOZSIw8v29+IchpRdqQGaZPq8FFiPluBUdyGe901WAif2DZs73mA==
X-Received: by 2002:adf:a45b:0:b0:242:64fd:3e05 with SMTP id e27-20020adfa45b000000b0024264fd3e05mr1199180wra.53.1670500169372;
        Thu, 08 Dec 2022 03:49:29 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002366f9bd717sm26569592wrs.45.2022.12.08.03.49.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:49:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/checklayer: Update to match bitbake changes
Date: Thu,  8 Dec 2022 11:49:27 +0000
Message-Id: <20221208114927.2332109-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 11:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174399

Bitbake additions for the addpylib API mean we need to update the parsing
function call to be clear we're parsing in configuration context.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/checklayer/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index aa946f3036c..78c74ca6ec3 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -43,7 +43,7 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
 
     ldata.setVar('LAYERDIR', layer_path)
     try:
-        ldata = bb.parse.handle(lconf, ldata, include=True)
+        ldata = bb.parse.handle(lconf, ldata, include=True, baseconfig=True)
     except:
         raise RuntimeError("Parsing of layer.conf from layer: %s failed" % layer_path)
     ldata.expandVarref('LAYERDIR')
-- 
2.34.1


