Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA4BCD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105030.1781424197108887143
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hmz1Ketp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so25294965e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424195; x=1782028995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hf5RES5y9ZJzJFAngPOWPDfB4iNPbqJHlkcDDB0X+c4=;
        b=hmz1KetpLfB2B4xDq3J7aOJcsE+mUpx74pjM9FgHseQy9+lGyBCaSIGpPZiSGmQnoe
         P9FqeSoaCsv3pMaWK/p1YDPR/mq/uj48O0BP+O8QnuAhBepw5vm6ZLPNLn8DW+3f8G6A
         xVPXlRycKDQumwolP8Hl7U4R97KlkacYVCUwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424195; x=1782028995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hf5RES5y9ZJzJFAngPOWPDfB4iNPbqJHlkcDDB0X+c4=;
        b=d+/bXUGhkm8myjqBAN9DkGKg+mMvfqMgQrVKrJrz98NM1ew767arbwcNDXidG/e1OC
         zWPrhJSJ0tn4tH7ikKO7aw3hZlKft8hBT+QZWwRrKMHXR6mxFDTbLOf8Baek0LKC/P+N
         NvcFXZ/pxA0edvqtEIAatACnOmV8YzD1dQiTBCrs9AwBSnmc86cPLQUg6oQNVqbhNHDA
         7eapeSjYKKsuAtUYZNj8TsgRHu+vsc9M3NKACqLEXhhzCXmJjT4i1Xtk3OZWRl2p5ont
         m0CVdyYTnEO+9wtzYHdwV4j7QWb/BA05hsEoOXvDb6N0jvbpuyNJtuj/cuLa+Cp3gIRr
         YXpA==
X-Gm-Message-State: AOJu0YyBNC+BwGu3Ccir098dAAQ0OWouy2XJGYGvVZU+f6q6qoOU0wTw
	XdZeyy0I4OW4wvsMPs6VpNSfZYLx37+hUEWGMPo7euZpmpICmVoA6eJ9ZNVRXu8EPMx0EVJ28AP
	H5tz0
X-Gm-Gg: Acq92OGISE5iSPkvcDZhnIVmOELafQHR11NhI5oJMl1lo4Hj4rb41BJWAbrjebS9T3d
	+dCqOXCTT+VCZ566X5jYqUhZce7GQszAqhYnaPhFfbAaKowgnETSpExYsKO71bekZ7/8UDi2Wo4
	6Ydb+cUm5cGngD1InGpm6mAY/fxcHg4kZGbkz572E/nwGN81Hm7xtD35cY4t8zMKb2yo+kUdLl9
	eWIlx3CDQSvgAJAwSa+X0kFUD4qeyXQy2Ldj70dTVrSZ9KhjUWoy6e/gDP9qo6Ul49SXFqyqfbB
	0n3Lvu7Dp+mH6TGCjoQYjI6+27kXLVCmQscwIIrvPQtI6jTG1RPmWe3ymOxb0YUZiWagzZxwgw4
	Xm6xtvk4ZerxmFhBDd5Rs4IAudu6hBJITlIXRYmvbaEN4NcLcOtTkORHkIBaSSI/jTUFow9XgfO
	geYrfH+pa4rjtIYi2bTI8rns4U24SpmcTyfZ4f8M69YAZM4tf30gcq
X-Received: by 2002:a05:600d:8497:20b0:490:ba61:7981 with SMTP id 5b1f17b1804b1-490ec4ee151mr83140145e9.23.1781424195168;
        Sun, 14 Jun 2026 01:03:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/56] gstreamer1.0-python: upgrade 1.28.2 -> 1.28.4
Date: Sun, 14 Jun 2026 09:02:15 +0100
Message-ID: <20260614080307.4017177-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238688

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...reamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
index 181e3d8ea45..555b3105942 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "12fdd8e19af97d797a6b2c195228e6c9edc4cddfa68274912b78ef66068ad822"
+SRC_URI[sha256sum] = "c4eb382720b4443fb801a53418dff0bd4cd7478716d5ced493504a675b4d09fd"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"

