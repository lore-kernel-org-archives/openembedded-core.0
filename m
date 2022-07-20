Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1318AC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.51624.1658306723114854210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RdJe2bDp;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id l23so31815398ejr.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lZ8J8OqOkGDLJnE0l14pM5x8bDbVqW8cKgYWkP2HGOo=;
        b=RdJe2bDpuiFabOt5sGp/+D+A2oNu4/46h0t+Uf5ERa3N3rwyH1cv8xzoeC0N9NNjYp
         Enydg4ercmdSKyCeH/MuWYofTjik5DoKMr5/qKQxWKCYUK2Kz7JujW9Ij2VJNwmGUhgM
         2wpoHCtra4J9GZ24kAEDWFQ+iLfybyZ0h2YTCzsenFUAgZcduETBjl6vkjyh8VjgzUBl
         auGWOINdI7kC0et4hW21IrEJ2givi69aRyVTYalldULZLaU+IKqDomnJiqDIO4FB2x1K
         XsmpvbNpATliy29EatU5n+PajElENaE+zzsuqkdxBGGQxwe/R4c4yUdhsjaucRyPzTPs
         GyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZ8J8OqOkGDLJnE0l14pM5x8bDbVqW8cKgYWkP2HGOo=;
        b=gpaWTFjXye81a0rOLnmuLy/iPU51KndtM+XzdmQTuesKhCKfMi+VDIWQV1wwJCah1E
         +EoFZyIrz13GpcqdNnul/5lVCCoL0Cv4zW09Xh0bvQRSPOo6qAfh0nSUt1OgH58DxNXT
         8LIRLJcjqu5hjts6iGPOou1N1chIB5nFHOPGEQ+fMD7DnskJ93l5k/04Q/6lBR2JKusU
         irHOJKwIJ0JNTxT4eJK55xAtKe6lv9hLQ/x4ffskRheL8KiTCQ9Yks54fPpk9705RfeV
         iXX8RviXiyG3MDCglJ5i2eTNwLGau84P9MQTdt/032D1Xg7YKd4OSqkjtaa8pDVZHl9Q
         Dg/A==
X-Gm-Message-State: AJIora/74sr+3z/osiL5jRtPZrDKUGWOnP8R8o0UfAi+gnzr7n61ZSwW
	P7VjJyfbbz3i0+zMC60xdhE9Q7GXR6c=
X-Google-Smtp-Source: 
 AGRyM1v3K98+PzpbKR9ffBj7Pyus80cXRhw1hyATDYEsvsYIcTEkxFU9iLXfgykFrBMdDDCgriuzDA==
X-Received: by 2002:a17:907:6890:b0:72c:7533:8901 with SMTP id
 qy16-20020a170907689000b0072c75338901mr33688537ejc.100.1658306721702;
        Wed, 20 Jul 2022 01:45:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/51] libuv: upgrade 1.44.1 -> 1.44.2
Date: Wed, 20 Jul 2022 10:44:24 +0200
Message-Id: <20220720084442.2940187-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168327

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb} (93%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.1.bb b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
similarity index 93%
rename from meta/recipes-connectivity/libuv/libuv_1.44.1.bb
rename to meta/recipes-connectivity/libuv/libuv_1.44.2.bb
index 4c96d80a65..4c1b8eed56 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.1.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
 
-SRCREV = "e8b7eb6908a847ffbe6ab2eec7428e43a0aa53a2"
+SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.30.2


