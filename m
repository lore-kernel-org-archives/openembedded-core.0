Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BA1C433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.3069.1639000810800241831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ime3edng;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 137so2825027wma.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U1V3caJxnFvC+6uy0AF+BC7w/JMhm2dVgztIhhcGSOM=;
        b=ime3edngtnwV2Wwk8K+EuF94M3zZ/j3Yfs3C2XISZYhqeNcH4H5bvVgUeddbmHItDK
         fIbLIBCTQZWNE/7ShrQfPOffx0jCPnM1WeVgl5eN5hP/0QytgziNkK+kn6skBqg8jIEZ
         nH0Cs6ziLayV2s3ESH7ue/ZWpVrGX+ZrC+6ViI2IDXg2njicAbidaNk+cmpT4sXNpjHH
         lucAYoHA1sx7OYgEngAf67DZ2dwxiDl2xlWTGP6uv+Y3oyr3t7ZZq+ANcM8r7AfeDRbl
         KjapJYZJtxsQDkA3W3qjRvrVhXs38I/EKPtansesbEdXYpcOT7lcO86qJff1BjKiJuvj
         N3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U1V3caJxnFvC+6uy0AF+BC7w/JMhm2dVgztIhhcGSOM=;
        b=nLSh1UMM6OuR1bJ42vfpU+0JvDZFAFLmt6HM1N5dmlMSe2iZOJbYREhUwIixvGj2fE
         yhGkXybis9fvxsm1Se5BD4GP80B1QCFtmDU/3thyz2lWdrM1dTFkZtuIliP7O5geVLTL
         xCPAcWqVrKCBPIndNC/99o+ccKG1BPlqlAkU2oiEn71XLJpoB83pRY/stJj++1I+Ai46
         L0qK6xGXF7ujoVGZQNRA9YNYqvBqJcVnu9vLJv5pnTs/fDAn+YSVHPGG8R+HQys8ZaVX
         /2moc93yFmCrkZnizWgL1jT55GxHhHJNnrU3vQNiMsftX28SPmJWxzy1PtjK2WG/yEeq
         a8+Q==
X-Gm-Message-State: AOAM532UQ/GY8CQZeO2kM7neeaEZlYkwgDXvHI3Ji7O5qfBdQTBpRF4j
	6XugFzOLxnFKiL4EBaDG1QSwtIJSQ5mZlg==
X-Google-Smtp-Source: 
 ABdhPJzB1E/YYNRNkbx3lxW3CvBSIMTtgAjsYZjUd7DPMFO6B4DJwOf8aXBhQjGtWkHbtXNanpq6Aw==
X-Received: by 2002:a1c:1dd6:: with SMTP id d205mr1657625wmd.77.1639000809401;
        Wed, 08 Dec 2021 14:00:09 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/29] freetype: upgrade 2.11.0 -> 2.11.1
Date: Wed,  8 Dec 2021 22:59:36 +0100
Message-Id: <20211208215947.1979470-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159384

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../freetype/{freetype_2.11.0.bb => freetype_2.11.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.11.0.bb => freetype_2.11.1.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.11.0.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.11.0.bb
rename to meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 1ec34e7372..78babdcbdb 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.0.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
           "
-SRC_URI[sha256sum] = "8bee39bd3968c4804b70614a0a3ad597299ad0e824bc8aad5ce8aaf48067bde7"
+SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.20.1


