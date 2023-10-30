Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF62C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 18:04:23 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.156423.1698689061393798242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 11:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XuTCXN5Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c594196344so70148061fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 11:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698689059; x=1699293859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcTuK96pZlk48PM95J0eHd/wKv3sh8cz1Mhi2hgqQuw=;
        b=XuTCXN5YwInj3nLWkJdImqc8584BFozSKs9vTiSEg4FldkvSZIZ1jCUT7Ch82NlrXb
         2cuxI1aFKnZ+qfbo4sSrJOS8MhjxMLcWkashExJ5/O0JDTYGBt8bM6H2XYD/Ha9WsStD
         khOYrCe/EjrRJjITMfToh13Ku7RGdgbq916loEZkGPkcN3CkeJyu6YMnVK2EIq4OHYyr
         04pnDzfCLDEo/OHToyBg5/m6AM9Dg9b6Njx5QJYBSFjZ36NabN+zM1LVy2AQoAa56rhu
         /tyAWbtu/zw4QIji8tukkwPQK4rilaK9m8aUY+U3FC84EKVtV4Fgs00bmYBBiE6S5Xqf
         mUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698689059; x=1699293859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcTuK96pZlk48PM95J0eHd/wKv3sh8cz1Mhi2hgqQuw=;
        b=NNf8oMLVn8lexqdiaTZ4FVllcEGCa8qFwZDbSA0HK4VbwdoQajsPUAmgrc0r60piUC
         dcv2vWvrdAh5j6Ihhq3f18LRebphz8Ni33l/WxEZ9N5sD+jl5jF8ULpGH6f0W6sm2zWT
         XaCV03kWUMil9NCaJZVGqGYhl0gNTdEXxbtXdXYLybxfMFH2jxV3QLXP5BQLfjBPfFV4
         4VPAgpPzjZPXp2G61YEgR4coHvUODG4//p9mdHwXBHLLqiHinwqpxl4Zb0aMx35xDCbd
         Xoq8j/AoHS9BbsdLFEjXELSS2QniuRCpMqtRl/kaC5bfv0XOa/WodhTVVnuowkewn4pI
         ZjZw==
X-Gm-Message-State: AOJu0YzRve6Yrhsz7Lu0crlmv2tBrupk1S8pWEr0xsJu50eE0dyZWz3p
	Cug/YcjZA5ucrSuljsUxUIOUU20on6Q=
X-Google-Smtp-Source: AGHT+IHtOAzcFi8eG4cgSLnQSxdIIkpWE6rpjn7ZsLOk6bJ0q3UBOwdxSutSNlRPWLjUZCB+mYsnOg==
X-Received: by 2002:a2e:8055:0:b0:2c5:ab3b:d676 with SMTP id p21-20020a2e8055000000b002c5ab3bd676mr9000155ljg.9.1698689059081;
        Mon, 30 Oct 2023 11:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id x24-20020a05600c179800b0040523bef620sm7255330wmo.0.2023.10.30.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 11:04:18 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] license.bbclass: prefere plus singnal over append on IMAGE_CLASSES
Date: Mon, 30 Oct 2023 18:04:13 +0000
Message-ID: <20231030180413.553254-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 18:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189804

The append override is much harder to remove so chnage that.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-global/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index b2e0d3faba..b915d39acd 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -418,7 +418,7 @@ SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
-IMAGE_CLASSES:append = " license_image"
+IMAGE_CLASSES += "license_image"
 
 python do_populate_lic_setscene () {
     sstate_setscene(d)
-- 
2.42.0


