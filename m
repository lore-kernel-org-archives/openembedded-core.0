Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9F2C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3051.1787945899903243491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GODL+yMb;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso9322505e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945898; x=1788550698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E/zdNrXfo5KxgBpO2sBylJCsfj/XJ2mpbY9Wr4lPY/g=;
        b=GODL+yMbdmzBpLQ2Dg5rsNV3bQAawzEscPdA0mfMMfxzbaYYQSO7ndaTg3ieIomMiT
         EV5XWASG/8BpIz7xcrhhljHPs/XDmnAOowNrKHhs1v3+fTGJv1UnB0++vG+VfR2ZmxJO
         NbFaQAXvrHCBrMfAiwyBTR8fFA8xgVcJb115I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945898; x=1788550698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E/zdNrXfo5KxgBpO2sBylJCsfj/XJ2mpbY9Wr4lPY/g=;
        b=Xk9IQEcl2F5z8rX2F0eXKk079ALqjZYF8kjepNlPII1CeQ8jmHBlf08QQG97iYxRUW
         8+G/QOeK+TAYPyQqFrVSRPNjL7aa8ZWyGBEF19qCT4kaWMGGPUgd5owE/7tB0kt+nApn
         qTJ+8sKwB6Whn4aPWeqbzjopyPa4hzMPSe35ALpY5wTlE6FjMceS30eB3DeOSeal/4TX
         iLsszSwsls9l7YoT1fA5eiBlO+DOReMJF0T6H8pJbjW06di6JmFDmF6DPBj59Iexhfb7
         F/fKJme/1O8ZCX7/HQifdSM3F6O60NwggJgihcLxuabQZkIhVSxvOhD8rgcjsh6tBU5H
         dg4g==
X-Gm-Message-State: AFuF++nJdCumdOuFZl85USWlsJb6cw23575O+TFKuYXzvV4cg+JL3+2G
	LBR5DENBGT17+7GHm+qqdma17Dex0sGkMGkDkrrECGDCXAzpowLHASRQcy4ubDYTQKS+xDIVgrp
	pAjuVid4=
X-Gm-Gg: AR+sD12wfSv9N1ch/HoMdAxQV6z/0sBmNXPWGu0ErojcAQs5ey6oljO7ZHKirbDPQOf
	wyqdru90HNdZZO5bcsdIHlmkDfKXhlc37LzZTtBmOrN//6aHj+jwBy/3YD/N8Vi9HmHYN3w7TRt
	WZSm+TilTQxzFHZqwognnUgcoO/VPRma6wBKPa0/lyPjTNY6RfTTG2zVPtZoO9n0r7WrcLDR5ZS
	+IC/9IeT+TRBApZ0oo9wAQQDFvLhDjEJrBKSqzt6hsxYKG2FsoCr8dKZk6IdNXQu0Y9UBtCr7th
	dwTsFiczK94UfqTW4tT3Jrz/mEa1lw6/3oaEEBj6uXOXPswzsEzTYvyUONXJJm+53LbkRi+WG/n
	n6yScN4okawjhDMRBi34DrFm5Hki/lSwiNCjSkNHyTqlEn2tbfMGmLAvHeYDIV5lkMQbXqcOFv5
	ZTnRLISD8bwzYA4BWekFHMxWBJDva6uAk9FtX4uDgRzxxmQByT4ovbq8TAOr9BY8y9B3x858EoF
	/JnejGyHn77WFhJS+FG4ujKtJpU1uiKDLIYfi+3iQbu8k7cyWIecWigZBi3oRfM
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr128690125e9.3.1787945898112;
        Fri, 28 Aug 2026 12:38:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/56] gstreamer1.0-libav: upgrade 1.28.2 -> 1.28.4
Date: Fri, 28 Aug 2026 21:35:34 +0200
Message-ID: <85323e499032b8178ee3209787267169a738c1d1.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244585

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 62104c0ccf0aec7254f206fa9406b0a8f6715a86)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...streamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
index 856c8838167..4898c421905 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45ba65535870aa7c026119d2e90b35dc760e1cf6f50bffbfe8d71223a3043a4e"
+SRC_URI[sha256sum] = "bd17a5df2874a7a58bcbaf7b940223379ad9613624db8ead783db03e74bb904b"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 

