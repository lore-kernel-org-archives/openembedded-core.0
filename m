Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFCBC001DE
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:34 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.3839.1688092169920572123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FsItK1SM;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.41, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-56368c40e8eso896814eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092169; x=1690684169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h+KFt8gFfKVKW4SlvTeFw7HJdE21UO8NsacWuKbMc0=;
        b=FsItK1SMWIiKY1pw9ynJDTVw7zd1Dwr0Gw5TuRwsil5ZwfX7KewWMkGtkaSD18ShrY
         eWUPrcdxcKSRSz2vb/Gs/GCdjuOmIv3miGmsA+fqBIe/3D1sDYCB5TzIRPABWHP+iL5b
         ucmCJR28sIJGoe5oyFfCZ+ldiYMyt7051xVaYlbD5630UqeHgG/0RG2wXIKx59/ZxV4B
         eD96wCJB8wYlj7I2uZ9rSLWDnk9tWXpQDCSQz+UMakS5K/6sCR9FnSTzRpnj6M6fKsVq
         TgCWPeNeicbAFfQJ8qxWEWKp3o/AbrhF7ygi/vsLknGvjSS4x8YMEcB7QglmP40lfXPU
         Bl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092169; x=1690684169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h+KFt8gFfKVKW4SlvTeFw7HJdE21UO8NsacWuKbMc0=;
        b=EsUU2p/rhlvVKhp3T4aGcUiVbpXkD48rqAEC4LOkxGKbo/mh/oXNXJ4vkbrrcX/+SN
         UMzaE++ki2W36/Qp6tWmQ3KjKDvvucdS5bCbTK8+qGDCb0iiJlX8wnO2eoX9jGiRadaA
         lhEmqvWCOeQYiSiqqjRWpPpAD3kZ5pLAgEsxu9aVjc/JtMTf3O/mzIfXuWcv1cqTxJO4
         Lv6T7PXVlqvwb9qFxmpdba3Y4sq6PbratfX/wAUrvF0abYvZw1r4xGqAVVqeqDaRIxXB
         eKdWMwJjZ6bGlK2VkTKX0gQXtR5XyJ96XAjRdS8QB13d/4TY/dsuuz3Rema0X144zdZ1
         vrPw==
X-Gm-Message-State: ABy/qLb3zL+ahV/vjzrVCJSeTfIlpluptJkgUlYgxnkb9kf/nk0mEQMU
	o8BqzO1yw8u9PBe3ROwDjYaG9yDRVRpj3rr7Wnjq/Q==
X-Google-Smtp-Source: APBJJlGnZFEiyiS0mEnYTCO+viEdL40q4ijKxE4ucRZGeFmCpHvjmJaBymXjYhsN+0tfyGxbiTyLQA==
X-Received: by 2002:a05:6359:a23:b0:134:d78f:67bc with SMTP id el35-20020a0563590a2300b00134d78f67bcmr1322116rwb.14.1688092168850;
        Thu, 29 Jun 2023 19:29:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/30] weston-init: add the weston user to the wayland group
Date: Thu, 29 Jun 2023 16:28:46 -1000
Message-Id: <955f602c26869f670470c1555bb53c281594ad08.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183650

From: Randolph Sapp <rs@ti.com>

Add the weston user to the wayland group so all users accessing the
global weston socket in /run all share a group.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 30198b36b00a1967d1f8f8f556a0ba2415954f4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 82dd9a47f0..73a20a7194 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -92,6 +92,6 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render weston"
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,wayland weston"
 GROUPADD_PARAM:${PN} = "-r wayland; -r render"
 
-- 
2.34.1


