Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1143FC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.3493.1652871542424809652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HUEBGoU4;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id f9so3130684ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5NjQrRHL8FBgxc2j7xSCYD/osgCmdjTVgRX1GgunBxk=;
        b=HUEBGoU4ajMMSzAIjlUIWUoyzOO/L9xShwWtOuTkkkwV/nIzorSDZs9Y6+CyB0CgfZ
         XaxDJ2OLK5gK/bhprSOgLIDRS2ZlphsSSzxaT1YVZHy2i7tQqh3pFYzhIkGI1qVtVzz9
         8B4G9FQDNeMZSE3mdAP9j4muNtbOFuMCg3VOgmi8gs/8xQ5aFpP4V6oIDfqXonNC2cBx
         yz3/St/bLUdq6Vw9IW+qQJS5YoEVn/fKKEKXwPQw2j8jD/S/rvRx5Frk71HmirHIy/Ga
         Yp28Gz2b3y+cShVpGmTP6uRH6BMRzM3l6JHiBUMWdZx9eVfhpB4P7ZcUM59MvFCgY30D
         GM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5NjQrRHL8FBgxc2j7xSCYD/osgCmdjTVgRX1GgunBxk=;
        b=OeC7vj6nxG+bCiIUK4LUL+0OUT3/b9xtqZxr4/7JMfbqgKwKGVIlRcbHPxsPrJd8KK
         fb3MBqCgZCKhfLKoNRms/ETROB/dklJ7/695++8uDKQY1hdV8rx15/uAhoktmo3YY0E3
         5D3l6eWXrOuTC9Q/ePA+KEJcAvdMVF1iIm90TT7octXXkayuR/hKKiHWw+/jClgzow3k
         /MWkf4QYhCW1xnjdO8LFxH5hygHWj18J3WJKdnYUPNI1TYZ8kI4YSLshZ2YI3XDu2MLw
         jdym1CtQpqWIkW6se3s1QjDCTo7JXyUJ6J+Hkj47bWiO/poe9YmF+L7pICwUvrxW6Wxg
         UVEw==
X-Gm-Message-State: AOAM531DQ93z+cpl6UUopSEJEDjJV8TIP5MZhgmPe3BhnSg9PpYVJO9g
	mPG5jMv2vTCl8ZmQCvDv0sFLUQ73kjg=
X-Google-Smtp-Source: 
 ABdhPJxtQPaTKXH60PyY0hhVU6sLRDMFHXD0YyqhFmtf/l2gRutAlPHQUkFhMSrcGM+qQ7BTldJtxA==
X-Received: by 2002:a17:907:8a1f:b0:6f4:b5fb:e1c8 with SMTP id
 sc31-20020a1709078a1f00b006f4b5fbe1c8mr23442572ejc.240.1652871546574;
        Wed, 18 May 2022 03:59:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/49] gstreamer1.0-omx: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:13 +0200
Message-Id: <20220518105843.3299331-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165816

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
index 835f9a31fd..c4f5d719bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c"
+SRC_URI[sha256sum] = "7efed7cc5b0acf9a669e38c5360a7892430a4e86c858daac6faa1ade2b151668"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.30.2


