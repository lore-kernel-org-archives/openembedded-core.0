Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1267C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:14 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.1777.1645114213730460646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZmfjFksK;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id p14so8379688ejf.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aHMxGWzZSi5o4aS/laHpslzC4+AoVqfBZF3N+Q1QlkY=;
        b=ZmfjFksK74SRlygK6I5MKQzkhE3Ld1dnhhz3D9z39fXGGo+cDtPEwoPCDj/YbxJR0X
         uOtZTTOSthCx38D6PTUGtLhpUQZ6R9SDUYJLQL5WxETHy745uuB0jLF7e35+ZR2FPUrr
         O72HVC944ji7Znba8267RP9fSDfM0s5nVtpllJiRW3FPPHnLs0NzdoCTD02ZSy7PyXeM
         L5MaA9wj7eSLr76i0QEsXBGYyt4Fn/3FTmFkvuuWNlBh7I3n1PeFeoVjcMwgjlpV50Bp
         jRgZGoUWTm/+JO1wy3DtdRgW198LV6dJCJbuK00fZdGzAv65TV2IPr+WQTPvPnFr5u93
         FbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHMxGWzZSi5o4aS/laHpslzC4+AoVqfBZF3N+Q1QlkY=;
        b=Y39cok+XLB0wqeO22Yv5AKbox+PUmcxsrugog+Vb+lt0SdvYge+8y2vPMt1mkTbr++
         NmzKNH469/k7Fcv6Y2/Q1PBkWdbO1GqghoSBNfdWiRZDziUZihs6q3hCScN3/1/xiIrr
         UOwvgbtBEYUJIFxbBZF1xu3XvHk8n3ao9v1TNr+76ipMWGhGUWCYAir9xx4BjI4hFNDA
         qF4kx8IfqipDo5BSlh2osqz9Za7cxLRyN2TjNX0x1R1pqHMLBMVLqqcy8O/oDS0MFt6n
         uouvgm4EbMvBR0CG9B9WjC002vua0vhWU84FqME7Ud7EXLSnN2vbxALEsIOvW55japPU
         QIJw==
X-Gm-Message-State: AOAM531051UwHFZZIiWSUYbuomKa5pUeLJWGMYQ26txFq7p4tG7AN/IY
	BOCGn/c6GGyMLUsD7i22//m3zQCnkag=
X-Google-Smtp-Source: 
 ABdhPJx5NsTJQ5TzjGuXqjMs9X5TvdjkvIeJwt/srKETujg344FVqJ5azfTz6giMOLYG1nk6Bb2/qA==
X-Received: by 2002:a17:906:2daa:b0:6cf:3c6:dbb7 with SMTP id
 g10-20020a1709062daa00b006cf03c6dbb7mr2909660eji.688.1645114212315;
        Thu, 17 Feb 2022 08:10:12 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/28] shaderc: upgrade 2022.0 -> 2022.1
Date: Thu, 17 Feb 2022 17:09:36 +0100
Message-Id: <20220217160939.1424397-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161842

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../shaderc/{shaderc_2022.0.bb => shaderc_2022.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2022.0.bb => shaderc_2022.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2022.0.bb b/meta/recipes-graphics/shaderc/shaderc_2022.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2022.0.bb
rename to meta/recipes-graphics/shaderc/shaderc_2022.1.bb
index f5ad0bf3bb..fe9d94094c 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2022.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2022.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "b0aa18323d65d2ca885d0affeef2aa0b56eb45f7"
+SRCREV = "e4722b0ad49ee60c143d43baae8390f75ba27d2d"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.20.1


