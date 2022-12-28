Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C49C5479D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:53 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.176132.1672213052771447699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PuG39h9n;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bs20so12121748wrb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i43CeVEWDXq7REpK9p8g1hAcGrAaOnWsO9ZagdrB6W0=;
        b=PuG39h9nJa8IU+udwST1MmNiBj0bqdIjOdzW6NFfyCjvMF7LPK/t7z7HOGqaT7y1qQ
         O8pNeNzQ2GSOLMI10SGxJ36zKJ3ZMMXTDqsQ8rgmIo8WuGsh3JiLYv++qMtoJcyc/fiK
         PAjPLPhbfOOU/macqf1AiFd7qcwWvtoz0kPaS5SUGaIW2t7GO6vvuijcLKnnchUVsncr
         Hy1U/8vFxm2n8l6bDB5NH0ieRfa3TNqyGULuOUeiu8WQo7UMXkkUG/x4Ri7nLIB6veL/
         ajoHg303JHHtochteeY2fkMRP2Bwq699ROq8bOlJF3T/SVPxD1JxeCFHBgFiZpGBc1bI
         cQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i43CeVEWDXq7REpK9p8g1hAcGrAaOnWsO9ZagdrB6W0=;
        b=6Xz+bUQNlaKFum7tV7Oi2a4XLDjRa+Y/Heu3oz0X/iXpFIDOa6Y3Gs0ahAb6Ym5iUH
         1zW0LyccZR03Ah16Y+JEx0D/xK0ozWAdCJyzKqfn48mq32qPS+ZpmJjeG3u8dO0uP+EW
         oNic6cFKA/uQwH8OPrW/9MtO0qEqInZa/Llme8wtmXkjSQMrBB8CDl1V/fFNxVeXNCQA
         7ysaqBpShcTDPET2IGd+5utzN0H78WdOsOLcmcGnWLHzdLqFx7Q3MU6Ph/vlP5BTSD/U
         4yu9R8HVF33ISB2mL6FHoDSQXPXn/OLq28z3LHguULjJ86qC0GhUbe9Pbg+Q1cKAzyV9
         HqGQ==
X-Gm-Message-State: AFqh2kr1tIZXAOXDHirfuDdQmtiD0+Z1XC5jhqLm3DS4mZI44ndNcX0g
	h/oaSk66CZ+CJFwp5ZdvsNDu8czHvfk=
X-Google-Smtp-Source: AMrXdXttjbW1jRV/Uqsae8/datPoDyS1lYin36OjMvyVjXoC0FTr2N+3h1Bt3VRwnFRYzBEIvxl2VA==
X-Received: by 2002:adf:edc3:0:b0:276:ef1:db8f with SMTP id v3-20020adfedc3000000b002760ef1db8fmr9659436wro.31.1672213061781;
        Tue, 27 Dec 2022 23:37:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/25] libxv: update 1.0.11 -> 1.0.12
Date: Wed, 28 Dec 2022 08:37:14 +0100
Message-Id: <20221228073721.3454255-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175059

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxv_1.0.11.bb => libxv_1.0.12.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.11.bb => libxv_1.0.12.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
rename to meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
index 3c8bf08153..c587000c28 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb
@@ -14,6 +14,6 @@ DEPENDS += "libxext xorgproto"
 
 XORG_PN = "libXv"
 
-SRC_URI[md5sum] = "210b6ef30dda2256d54763136faa37b9"
-SRC_URI[sha256sum] = "d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "aaf7fa09f689f7a2000fe493c0d64d1487a1210db154053e9e2336b860c63848"
 
-- 
2.30.2


