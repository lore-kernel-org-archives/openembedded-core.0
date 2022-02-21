Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA48C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:27 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.5698.1645406906407033444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bTBgaGmX;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id z15so1581325pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X4xVXeduiKApS5jdl9z3vg0p3yiRh7xu17Yg0fxqzdw=;
        b=bTBgaGmXC53ncTHkMTbGihkBt4zgCeyZzxDAbRNA3kDNiJDRYCgivx37TVTBHPAL15
         MrQfNd8ZTkH2+sltjU6SQU55QTDSuKy7p58FIFP4GkZDeUR9XJUOe7OjRWB7Yp9yezha
         Z06RTL2bXrl9WnxfpzyWmQTlmZjv9F9waBidX98pVCf4wbQKhZOCb2AbR6kUDDwnq/X5
         6nlpZbW7bRmP+kY6mUPQzAHhURWoT0pX994nU4kMfQzunO2ZwrXlFZtFBVRswv6ZEaaV
         T7UUuMxq7snpEoBoWP5CWaczvGplNkY5iSWuA0G/SffuwEgPOIx++0mkeAAerjTndntV
         Wy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X4xVXeduiKApS5jdl9z3vg0p3yiRh7xu17Yg0fxqzdw=;
        b=6CjT5qvrvQ5vR8MOAVmbXHpCSJdhed8WqRxSdh84xX274w/cll6pYmjGcYX4iGFq78
         mvwzNSctyaVjdoJfniXocY3kmH9BnPnnvFKemxbX3hNDh1anlO0NCFmzHP655rD7FLoy
         guBMuLk6imrqBIJy2LFlTOHJU9n7v0tYooq4mqK5EL8dCF2pebIk81XUmSC43ycMCX7U
         5jjF2JSpXmNEA3mUWTL/JzGs8GhS6LbeA5s5sgiT1aket0JfAoyMLyTsbLiiOeasZOKS
         wCW6Ow+OJEvHeyF7SKSz5v1kYQvc+WKeobNAopZ1WO36Ol40B31P2JavvoiCj7TsYzWD
         f7mQ==
X-Gm-Message-State: AOAM5325EiCyT3lIfFjeT1uMR/Ii9JPJcpx4OoQY88/NmNGZsQLy5FlD
	VE1KJdOA3F2CTTPv3kIIO+V7W/zdVbC3mQ==
X-Google-Smtp-Source: 
 ABdhPJyroVXOHnkuIY9ZTuL35+pUoRPCPNoXq7QCCHF3UBsSXeWHIyoWj6o8Zw+GhY2xnfrDjDs+LA==
X-Received: by 2002:a63:4560:0:b0:370:1f21:36b8 with SMTP id
 u32-20020a634560000000b003701f2136b8mr14198170pgk.181.1645406905427;
        Sun, 20 Feb 2022 17:28:25 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/19] python3-py: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:44 -0800
Message-Id: 
 <22391dfe28d6f19fe863cbe51039406ed0225d44.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162007

Upstreama provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index f8be3935e5e..02027248f46 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


