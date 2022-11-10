Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02993C4167B
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:06 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.8.1668103983812497982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mR57FQMR;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id cl5so3438392wrb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9PJ4xvwV945Sd+UsDdAjsdQNXil4GeaOlzPBdfpe3Y=;
        b=mR57FQMRKC//OECdPu78dHhN6lXGuhSXx6+ZPrkUzPpMKpvqfh46gZTtWvxMYp4Qxd
         TW+qgMDrTYcbtFR0dR6WRhDVti+h6ot2MHdDebEGvd6J8dF3jp3YuuP5bGZLqQMRr4Vv
         2u3dadhgMh0mRp9E+CXxEEEDKV6hC8UjBatxamxwc9VcZoc1TWcvofWxgMA2jYKCG9nv
         KvffiK3XrspxLO2qN5hEDt0SWGwaDONtjDxwkPVcbbIab5svxt8nFCDqqpPVfgJ3CzP0
         JHFNdA7oLXm7iu2gWsH6PYxCaaEu++SubQSpj3p3l+xJLJ3QpITWsYr3+tISNvcK8vIB
         xZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9PJ4xvwV945Sd+UsDdAjsdQNXil4GeaOlzPBdfpe3Y=;
        b=Qq1QvNdFNbUlvzuE50AxrX2xe092In99DhXoKDQ2H643whMkBJw+JyP7rW4LR0SkLD
         VDeID42UHISbAxyz9S+h78TL8rQqYA983EAwPuvbKLO7Gn+P0z4NAPoLcSjzVGpIM1s2
         7Et4fkgsiY274FWWuqLDUVRGqsfEJopI8clzDO3kvsjZCwyI9vmEGBhUtWF39pVLlOjr
         JumqxJuedWunfhtYTHGmSEIwq+4ZvMom/CwdfcRyzJ2dTq9WQ5pOE1AQQQtyQrNqyylS
         sa51VnYPz6RiKX8UI1ML6ZBuK/oQTBXrpvdy0C4fBRk3uHLerKJ07X3NL8xaZnoCrPC2
         YJ9Q==
X-Gm-Message-State: ACrzQf2JLLbK/FcS6xXuHdt86qZPsVW9ic3wEp1tCvowjniNI2UZirq1
	sbgHKup91O79x4LL5fGuUxO7rm71ASI=
X-Google-Smtp-Source: AMsMyM7nCaGtx1NB/bgU29Oj2q4WIzOxOBjZm5JR5i4d/nGtoMLNkzlOLEN+vj4kGO7KfrnLXeqrEA==
X-Received: by 2002:a05:6000:1e0b:b0:236:8a6e:8d with SMTP id bj11-20020a0560001e0b00b002368a6e008dmr41450981wrb.20.1668103982202;
        Thu, 10 Nov 2022 10:13:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/19] libxinerama: update 1.1.4 -> 1.1.5
Date: Thu, 10 Nov 2022 19:12:33 +0100
Message-Id: <20221110181249.1240200-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173086

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxinerama_1.1.4.bb => libxinerama_1.1.5.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.4.bb => libxinerama_1.1.5.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxinerama_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
index edce35da5d..966edf6792 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
@@ -15,8 +15,7 @@ PROVIDES = "xinerama"
 PE = "1"
 
 XORG_PN = "libXinerama"
-
-SRC_URI[md5sum] = "0d5f826a197dae74da67af4a9ef35885"
-SRC_URI[sha256sum] = "0008dbd7ecf717e1e507eed1856ab0d9cf946d03201b85d5dcf61489bb02d720"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "5094d1f0fcc1828cb1696d0d39d9e866ae32520c54d01f618f1a3c1e30c2085c"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


