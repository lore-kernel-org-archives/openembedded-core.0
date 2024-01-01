Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D449C47073
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 21:31:52 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.15621.1704144710055843860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 13:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=eiBsnxiN;
 spf=pass (domain: underview.tech, ip: 209.85.219.43, mailfrom: vince@underview.tech)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-67f8d9fe99fso70725536d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1704144708; x=1704749508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rucpd53rVmwD9qUaI27R6Z/t4Y/JPkT3GkvlsVjtH70=;
        b=eiBsnxiNHErvK4TaMe86dT6teU11TNGNsRbSq7M85uTcUirWf5elTUvFYmJgvvpQyl
         qvRQnMHj//s4471Hjcy9ZC8ClCe9jiI29kgtYMEVxY9bPpf2VljpoovrH8xNDOdEJq/+
         T8ikcN94KRNt85EPKUD0XuMozI13C1YOqVLhPMlFc7VO2EnAFMkhX3LaHBWPaX0tP4Tv
         eTXAaMPxdEZfqjyzip+JQjJjS+ow6YEdmlVybB7+1jH60RO5yjwULWdsNdKAvOxAvKz8
         wMuGBXCX+wS1JuOhG7rSLBhYvNAyCKqsbMMNGhl+WZrrgfVwQYbTQiF2yPsbYOXRaCKz
         AXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704144708; x=1704749508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rucpd53rVmwD9qUaI27R6Z/t4Y/JPkT3GkvlsVjtH70=;
        b=YfIlEZcAVXmbl3ypPKFSuHhbTjOTvBoGzZJCTVULjqt1oFpausXuSJguFFFbcgOCeU
         iLOkZZwVPFAlKYryqD3VqpWEpqZE+LiGVwhcyC1CX4y3MTiKsgamDCcwwQs5DzGXZgzV
         l8vXgT4tig1+nP97J0PK4r+EoeVz+I5RLY3U4cXQjEbo88Hscip69nEusIjCXn70SF3q
         mD2AHDom26vQaubiLCvNQyPCZeI1mLhPmiRMit12WH4czhQXNhpuZBVcOgx/Lb+e5/WT
         USz9Roes26LoAMMd2o+tIvwqd4BlpsCP1OtTD0oQq+ZB4YiMK0YYDejXxILEL5GArYAP
         ILsg==
X-Gm-Message-State: AOJu0Yw4ry2/sJV2lM158A9NZ9xJpqzXuBlmg7pse+0lKLdcwpjVy0r+
	K2NGFDYXDGrA7bYrUTbK0aM+hCdYIE6m2IuIHO3s0gfgU/g=
X-Google-Smtp-Source: AGHT+IHWa3KqKofDjjVRbt4A8gNrQ3eR0yf3FoRrpl5SkeyPsq5FLm9c/1o97fnmbWapL6rNq3zAVg==
X-Received: by 2002:a37:ef09:0:b0:781:62da:7bcd with SMTP id j9-20020a37ef09000000b0078162da7bcdmr10142629qkk.146.1704144708702;
        Mon, 01 Jan 2024 13:31:48 -0800 (PST)
Received: from vince-B550I-AORUS-PRO-AX.hsd1.mi.comcast.net ([2601:406:4d00:a9b0:c204:4786:6cc4:f4b8])
        by smtp.gmail.com with ESMTPSA id pb21-20020a05620a839500b007811da87cefsm8790486qkn.127.2024.01.01.13.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 13:31:48 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 1/2] packagegroup-core-x11-xserver: use RRECOMMENDS for mesa-driver-swrast
Date: Mon,  1 Jan 2024 16:31:16 -0500
Message-Id: <20240101213117.437651-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 21:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193190

When building qemux86-64 machine run into

nothing provides mesa-driver-swrast needed by
packagegroup-core-x11-xserver-1.0-r0.qemux86_64

mesa-driver-swrast package is add via the
PACKAGES_DYNAMIC variable, but gets included in
RDEPENDS of packagegroup-core-x11-xserver.

Put it in RRECOMMENDS so that error nolonger occurs.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../packagegroups/packagegroup-core-x11-xserver.bb           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index ebc1330055..c0473306ff 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -10,13 +10,18 @@ inherit packagegroup features_check
 # rdepends on XSERVER
 REQUIRED_DISTRO_FEATURES = "x11"
 
+XSERVER_RECOMMENDS ??= ""
+
 XSERVER ?= "xserver-xorg \
             xf86-video-fbdev \
             xf86-video-modesetting \
             "
+
 XSERVERCODECS ?= ""
 
 RDEPENDS:${PN} = "\
     ${XSERVER} \
     ${XSERVERCODECS} \
     "
+
+RRECOMMENDS:${PN} = "${XSERVER_RECOMMENDS}"
-- 
2.34.1


