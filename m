Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E776C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:05:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.8670.1636625135775531072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YJwaDV4F;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id z200so4576126wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xXPlOXWsvrzV1gLRDA+DjaVZt8OL6S4/7vN+wKCbmGU=;
        b=YJwaDV4FcixemQWjdpBKel5U5M+OWcmfAAJHfpqNxfj2KGnAzztyRD5ax8qhqRYY3A
         hwSKyjOJ9I55t3T59ybHb+8ST79BoWVpccNgYsnurcNIsKAmqOCgUb8/oAy4vkHeRzsR
         KWj9iDCFVx3Tv7A1ZjtRGRLWM8g8xWlxlPiHMkiGYYezmE7A4xbH/Gj/DEc5bXlxpHel
         NwYLqpbICo9xFSIWiYMy1rTEwhdJo/OLvMjl/axzvAPO+5qvMmT9tunn1Y8MkBws3t3j
         taHH+b7sdwys7D/BCFUjVgzzLLod8nXsClHUZYPu95DuiWSq4eUSZUP7wvTOPD1/cYue
         xxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xXPlOXWsvrzV1gLRDA+DjaVZt8OL6S4/7vN+wKCbmGU=;
        b=lYA69QGwJakbdXs24yyNJlo3+sUs+Atlb38FgP1lKpfDUyS2ZrPEShiogkIGTmwvAd
         tH5Nm2ARxbrxblKhDrkuICmmp1bi+9A9czB/frpFhUOAFO6GPYAqRJSqOuSedoDSM+Pz
         9053IiPG3/KKDO8gt4vhoytDYxEsSHT1f0HfONkT6PybN3PK6KDyJl4IkRH80+4IJmGe
         DPw3UY639rt3w9/KjmOSs+SsaGCGBpvwPJHgEwuwo78AIcrQOTDdTqU8GbV94P5EsF4r
         18bmtDt8iRBunDvFT7Q+b9Yg89dkJhB0zAGudh5ecqdi3EJk4sbPSGdfNUn1ry8pk/ec
         Zs1A==
X-Gm-Message-State: AOAM532UC58bnytI0rzlTDaozRI3dWX+1+iu/le4sRC4tv8UAXfjE145
	XWhWRibIKb6HiaMgVATy1g1tzwUfSJ0=
X-Google-Smtp-Source: 
 ABdhPJw3vY8IWbNFWxU5XsYJRsn8UDNv08I+IXI8PXPRsLVnF18ZYdJ8HQ23DJBmmFrVqhUU9CR4xQ==
X-Received: by 2002:a05:600c:3b1b:: with SMTP id
 m27mr7165051wms.125.1636625134182;
        Thu, 11 Nov 2021 02:05:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t189sm2378239wma.8.2021.11.11.02.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 02:05:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] xserver-xorg: add missing libtirpc dependency
Date: Thu, 11 Nov 2021 11:05:31 +0100
Message-Id: <20211111100531.3822580-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 10:05:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158153

This wasn't a problem in poky, but was exposed with a nodistro build.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 4a7048aced..71c934ef38 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -28,7 +28,7 @@ inherit meson pkgconfig
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt"
+LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt libtirpc"
 DEPENDS = "xorgproto ${LIB_DEPS} font-util"
 
 # Split out some modules and extensions from the main package
-- 
2.20.1


