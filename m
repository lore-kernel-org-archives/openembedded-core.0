Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEB4C43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.12406.1668951098015355681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qGhL268p;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 84-20020a1c0257000000b003cfe48519a6so4741009wmc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8fbsyggfH68LVHsGsMJfQy76+tQDNmlSgyB4SSHoY8=;
        b=qGhL268p6QuCnbM6m/faT3y2qz4uRIy7EXuM0UKteau1+bdcbxjqpzDRw8RCFFMxn8
         JhkTUNG3wbGlOcj7kBTFtA9apqysDPqSHoJBh6sxOyy3FVDM4Tezy5ih4pMUHg+UgmFl
         bZdh7xoyid1P2dlvvgzKoqWNgoHK0RS45fRs3XmCmKtUw4l1uV3UmGhGacbzhJ6AFc6Q
         N3eE+E966UcA0hZ80pYlMC3AzKxggEdAZZbs3vYT4Wfpwd5AAY+Yi5UrD1xT22gVl/EH
         WGy/d65HYSo2OJvam6czGOKfuVhLN123FkhjrljKZ0S8p14xtUA4Q9s/9VeUw76i0DiN
         ePZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8fbsyggfH68LVHsGsMJfQy76+tQDNmlSgyB4SSHoY8=;
        b=HB2k36bDqBe0Q2eWLpxI8VBzKuqjRqgca6HGPOJXu4AjDnos6oCLW8AnyJogSmkwXY
         SST3IYFDGTYES67NuP6Ne9Qg+9XGTsRexC6ZAF9mN0Hat8UhkbbBvAW1JnHUVWx02v7M
         VJVmtKq9xJR+Ki85VKTTtpE14jYO9aWzxUlEfbPaLkvsLMB//MQ0fIbXLhmlNU+6wGqY
         q6scqRPmRupn2a6h7Um71tVCzi4DyMomBOfIhwUdWrz1PnBnbVARtFe7JVGek4M7UEaL
         Jt+Nc86H+83GbDSE08bUEwTsd+XojtK3H1Wv3p4+XBDiIrXi7ag5WcrT0CMrhJyjsxnG
         YO5g==
X-Gm-Message-State: ANoB5pmvrSlKvYVBh0vZpotN6l6c8ALZ2j7lcEKLIfQXXZobqgYqKYRl
	kNdcpUmca9smPlqeW7FAnttmGXFrMKQ=
X-Google-Smtp-Source: AA0mqf5jzEEyEtqCjiXn5hNUFQerPpJN3hoNES3iX/jvvBh43VNUU6ckKVVKlVVxBvUBupi4WmwRJw==
X-Received: by 2002:a7b:ce9a:0:b0:3cf:4aa7:7576 with SMTP id q26-20020a7bce9a000000b003cf4aa77576mr13598466wmj.39.1668951096295;
        Sun, 20 Nov 2022 05:31:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/17] xf86-input-mouse: update 1.9.3 -> 1.9.4
Date: Sun, 20 Nov 2022 14:31:16 +0100
Message-Id: <20221120133122.2464634-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173592

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xf86-input-mouse_1.9.3.bb => xf86-input-mouse_1.9.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.3.bb => xf86-input-mouse_1.9.4.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.4.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.4.bb
index c38dab505b..191987494e 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.4.bb
@@ -10,5 +10,5 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
-SRC_URI[md5sum] = "a2104693bbcfe1413397f7905eecd3dc"
-SRC_URI[sha256sum] = "93ecb350604d05be98b7d4e5db3b8155a44890069a7d8d6b800c0bea79c85cc5"
+SRC_URI[sha256sum] = "7f6f8551fc238abdddcf9f38906564c1f8c7dacb0ad947cfc110487aefbd8d4c"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
-- 
2.30.2


