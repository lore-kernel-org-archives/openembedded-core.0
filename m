Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCA7C07E9D
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.4223.1667832922280615366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZG9fsB9k;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bk15so16553297wrb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3R2bktVFMgPsiqrHiSiXw2VYg1OeuAuLf0HNn1bzmY=;
        b=ZG9fsB9kN3rsONu34ys3WSrJTQGC5TZp8LbFPmX8sIhOQtzKI8HEMB9sAtSajEBWFN
         37kHsHqB0wzjk87PTtppci2Uw+zqVwn5WV7Dt4i11mtHcrlNAt2XpLQo7IVBw5I+YLaM
         cfGr0xdDc4tBrX4aicHqe0y3jP3ykl8ZnpVgJB39E5SnsvHJNCSbcmCDfypSIfZyJ1MO
         2LFuMDfeBSD5dRyS+4IwCCajcOI7456viX+o7sOpuMItIIvZ/+0cvP04GfX6amgyjza/
         ZIH6ZIdlVtYFgdttHn//h5ttpRQW+wC1aAVrHz6dKfgVx5JXF+MZ1Szr5FgPXLMvIiKI
         ahdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3R2bktVFMgPsiqrHiSiXw2VYg1OeuAuLf0HNn1bzmY=;
        b=NJJ0twAW6wTNk18a+xMe0nhkohxb39IqzlG0cSILdGe+jQOjjalyP1vgudh6QgZftu
         Kdm6b4zsVx2bLeB3VkVVkt5lSH7VLDhn1YTRIjKhiLeACZfsTH3AnbOPcaW/nw6dJuA1
         TXZD5KVALcInf0XUEVA2GU9V8NsIbLVeG/T1dNvc2BCSAtcBq/H/FXKa6odT/cHN6yKC
         qk2hInm4Wakh6rOSfl9p3sxYZJcEaBYB4nBJ94H3dPhwt8+aMT8qb9hdfGXAWQfEKWMj
         Wuv+8VOqZ59Vqr6g804kwsbpd6CLiKZkGSSJnMCvuNDrW2LO+9vYZ8bxDRgFLonidxRs
         mhLg==
X-Gm-Message-State: ACrzQf1kaklq1YCvi8VL9Xy74px/Yhp6G96JUHexdZQGLpYqk+fD0I5T
	wwN7asM3Hqrrgnf2bR0WVB5KGT1PdBw=
X-Google-Smtp-Source: AMsMyM7eX4MWmhKt90O+x9nQ/J+hh1o59nPgrpuHiWd+VfgXBYYU/tyk7Ll5/KMtPLEjW55ICpUBOg==
X-Received: by 2002:adf:f688:0:b0:235:f9ec:ae54 with SMTP id v8-20020adff688000000b00235f9ecae54mr31221786wrp.319.1667832943343;
        Mon, 07 Nov 2022 06:55:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/48] makedepend: upgrade 1.0.6 -> 1.0.7
Date: Mon,  7 Nov 2022 15:54:49 +0100
Message-Id: <20221107145508.1051404-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172878

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-util/{makedepend_1.0.6.bb => makedepend_1.0.7.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.6.bb => makedepend_1.0.7.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.6.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.7.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.6.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.7.bb
index 2760edd173..12dea012dc 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.7.bb
@@ -17,5 +17,4 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[md5sum] = "8a583055c84914060c35b6c2f963fc07"
-SRC_URI[sha256sum] = "845f6708fc850bf53f5b1d0fb4352c4feab3949f140b26f71b22faba354c3365"
+SRC_URI[sha256sum] = "17c1adf0284aaee473abfff0e8d3e754770615e1275f2a0043b9d97a00ed5cc9"
-- 
2.30.2


