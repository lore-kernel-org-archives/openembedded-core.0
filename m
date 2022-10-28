Return-Path: <ciaran.courtney@activeenergy.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A192C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 12:31:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.5627.1666960273414076416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 05:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@activeenergy-ie.20210112.gappssmtp.com header.s=20210112 header.b=D6OjYmlI;
 spf=pass (domain: activeenergy.ie, ip: 209.85.221.41, mailfrom: ciaran.courtney@activeenergy.ie)
Received: by mail-wr1-f41.google.com with SMTP id o4so6400859wrq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=activeenergy-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6E7OxeJDGDQLjBzgA8Yf3g67y74Gkv9dmio3yc+aoHw=;
        b=D6OjYmlIhjU/JBtSdaz+chBrrWISz4bMcQihEL6V/37fvnVYfpeZ7jeLLh6+jcd583
         rKxOJepKxl6H70dXnidga8yZXDIPCXzlanifqyuKlphbk8u2RexFmBVAkUNi6/WlE9kJ
         3v/WWqrV6pkzvumuQa7gYGYsSoeYd75R+V51FARS8qmrDySlBbL+K1fTeay3gz+SJl7r
         /BmxFY52hFWHRQ0M7jcVIM1ujhxBTV5uKljYSXQpTFcsSamLME+cg77gOJnQKhQ9C1fO
         WfO81HNfiVfHVc6C7FuP1DnAYRi5j78hfNoOz9LZ+4W/NF0kmAZhiycfQv7VPTE7kIdv
         wp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6E7OxeJDGDQLjBzgA8Yf3g67y74Gkv9dmio3yc+aoHw=;
        b=lsRxYF8KueBLwAgeX/sz9QfuYAsEHOL/WHzCUEQoL9Nqr0wZWD0dZ79GEyYYJVG1/f
         mtLnezNBGeOaVEQwX161be/izqpi+qGhTTBdB6ZTFx8k3PX1U3IYJIFEPdufMdFlfviF
         8t6/h8AsqBl7RZohAU7EgPOJ6rzT4ejIspvLfGa+6MT655guVRGvq25A9PjzlUyxz8H8
         DBmN2Z/Lt/fR5C6fbMvhzxsOOfqME5FanFNolj2XT6OGK7HKtFdTxiWHKbgul1rBNsX4
         BrOB6Tkp3X7YmfyPRZkxxts0GDG01xqof0QPG40IzO5RLS1E5t9a97aKx0rkREMerSMW
         KMJQ==
X-Gm-Message-State: ACrzQf1x802zplBaxN2rdpc5QDdyZMKa8yPbcJxKkN57X/7lHaNWFZEL
	zgSfuCkH0/wdZI5pqsdpKRFP98bz/aZ0evLU77Y=
X-Google-Smtp-Source: AMsMyM5vtwZGQCSIGDTahAs3g36L83hrB0lM9EF3iAv/RZN4fWCYd5/SdlEls25IYKPRFGZxHsympg==
X-Received: by 2002:a05:6000:1008:b0:236:60e8:3d40 with SMTP id a8-20020a056000100800b0023660e83d40mr20753074wrx.3.1666960271492;
        Fri, 28 Oct 2022 05:31:11 -0700 (PDT)
Received: from jammy.nmea.abb.com (95-45-31-11-dynamic.agg2.rms.bbh-prp.eircom.net. [95.45.31.11])
        by smtp.gmail.com with ESMTPSA id a9-20020adffb89000000b0022cc0a2cbecsm3582389wrr.15.2022.10.28.05.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:31:10 -0700 (PDT)
From: ciaran.courtney@activeenergy.ie
To: openembedded-core@lists.openembedded.org
Cc: ciarancourtney <ciaran.courtney@activeenergy.ie>
Subject: [PATCH] wic: swap partitions are not added to fstab
Date: Fri, 28 Oct 2022 13:30:50 +0100
Message-Id: <20221028123050.3910-1-ciaran.courtney@activeenergy.ie>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 12:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172254

From: ciarancourtney <ciaran.courtney@activeenergy.ie>

- Regression in 7aa678ce804c21dc1dc51b9be442671bc33c4041


Signed-off-by: Ciaran Courtney <ciaran.courtney@activeenergy.ie>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 58965b75da..dfaa901567 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
+               or part.mountpoint == "/" or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
                 continue
 
             if part.use_uuid:
-- 
2.34.1


