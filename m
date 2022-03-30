Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358BCC433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 18:00:50 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.1283.1648663249725486183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 11:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zior6iCU;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 mp11-20020a17090b190b00b001c79aa8fac4so1700514pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oeGOyVCs1byrGelUMV9svI3UGiy0T8JaY/1WBbIa7mU=;
        b=Zior6iCU71hjYy6qcqFHTjxpcBMACgqplmG3y1NupsW7I2ZK2fGfdAtT1ldha6ovcr
         ycV+P1k/oS6wHb+KYKmGecJ+SwbIiTNcVQtTePbkWAmUxmx9yTo2zj5cRL9H3Oh1NJgm
         1Skh/Xioyj7+Sy5Jzt83FZlYRbLZGM/IpRCnjXyNLdLEiFaj8zsfsTOf38Eux0nJztaj
         jSjKKVQBMhaTT5scJCjmATcQzuofpizcG8IkRzDGbAbzOGws4fO2cl8CVK3JCWTKNSeP
         L+RBiCL+PJ6zmzPrLG9S16I53ojM6kr+/pmXrT9D4zpQY5HKJ4edUwGyQO2XfeTAJirM
         ltwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oeGOyVCs1byrGelUMV9svI3UGiy0T8JaY/1WBbIa7mU=;
        b=BlpiMFjdq3imBl1f4tp5nUZP5C4QPpGojlRXfb5ZS/O9tME2xld9by9IopfE1GxZ8x
         PBwINf7omczv8LG2uzVI9OUNxJynM+gdxkxFlPKpoPpcutM6nq4/tGpukGJh6UTLFIEk
         ij+JVtcN8YH/+t8GN89n9MN1UwP9Hk6uBG41KsF+S5iz9y03CsGwrtEMVVUiO3wEckma
         y/B+rGbybPwUQO2W5ux77TVxvEt0SdrUtei+vgFKHFIxDIvUbZuoUSLzI7qX66z7Gwkf
         vmFSChpZzwng7vZXdkNeBkMCJQBvPjsC4bvkP6VYJvVC59CmjYqyRF9o5L8IjI3T5JEx
         ZBOg==
X-Gm-Message-State: AOAM532Cm4jmdw9EA5cRH5MgKdiMtw6C1+sNuNIG1rjox4UcpMCVbWPd
	/pU5x+fXOnXsA1WQBz9JOy85AOYeBak=
X-Google-Smtp-Source: 
 ABdhPJyD0Sf8d3zGreGC9kkK1rIwx+uKTtfZNyYXo/KaaXB9OcwwCvU7U5zu6jD6vwAY6C/p+0R3LA==
X-Received: by 2002:a17:90b:4f8e:b0:1c7:3652:21bc with SMTP id
 qe14-20020a17090b4f8e00b001c7365221bcmr853735pjb.38.1648663248822;
        Wed, 30 Mar 2022 11:00:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 r1-20020a63b101000000b00380989bcb1bsm19817725pgf.5.2022.03.30.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 11:00:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] weston: Add a knob to control simple clients
Date: Wed, 30 Mar 2022 11:00:45 -0700
Message-Id: <20220330180045.3953825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 18:00:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163792

Some graphics driver implementations ( e.g sgx ) do not yet support APIs from mesa
21.x, and some portions of weston simple clients depend on these APIs,
therefore introduce a way to specify all or a selection fo clients to
build

Fixes

clients/weston-simple-dmabuf-feedback.p/simple-dmabuf-
feedback.c.o: in function `create_dmabuf_buffer':
| simple-dmabuf-feedback.c:(.text+0x1076): undefined reference to `gbm_bo_get_fd_for_plane'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston_10.0.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_10.0.0.bb b/meta/recipes-graphics/wayland/weston_10.0.0.bb
index 8424b4d5482..93f7b596594 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.0.bb
@@ -45,6 +45,9 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayla
                    shell-fullscreen \
                    shell-ivi"
 
+# Can be 'damage', 'im', 'egl', 'shm', 'touch', 'dmabuf-feedback', 'dmabuf-v4l', 'dmabuf-egl' or 'all'
+SIMPLECLIENTS ?= "all"
+
 #
 # Compositor choices
 #
@@ -77,7 +80,7 @@ PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,colord"
 # Clients support
-PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
+PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
 PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
 # Weston with screen-share support
-- 
2.35.1


