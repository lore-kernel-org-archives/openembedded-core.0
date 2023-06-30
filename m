Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB844C001DB
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:34 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.3836.1688092166730973435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qqNzk4LN;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-56584266c41so889752eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092165; x=1690684165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iexN2GhYm1Clael8C2SbuPLAfALafdirKQmUuX1pFRI=;
        b=qqNzk4LN+s2P/585W42hsrfa2YybnRjkuewtlKMKgIPXDobVAtwznNgru1uAlbOrF3
         45Pazvz6q4P+ucKxENbsGQ315VfSZBw6gReQVo3jPyrhXeXDdfCxvMH/lrEaLXqybY/w
         EoQIbLsVAI7JHXaG77h8fnK5US9vMhGUJ3+ZF2VFPjFuKdRlKcNa1+QWo6sSWBYm6AJz
         RRdIybP+BJMLCTfxpz0BFrVCQ0Wcl8hcT6+5KHh2z5JuRMK/JNuNW2yXbjoawQmptGvp
         smQgymaE3XAOLvlCuxKyBa9AyJA9sq0vGbiZEEx3TUj1jt9bSeivvfEjn4tra4UQ9A3t
         wM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092165; x=1690684165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iexN2GhYm1Clael8C2SbuPLAfALafdirKQmUuX1pFRI=;
        b=MkeDUYvj6Hzknn3fhWXi/LdARcft91Gahn/1mgk6t2xYshzuVK+XOdaKcFrJTvufJV
         j6VvSL82UUd75dJy1aHUj2KsoFeuW7+Cw5AusuBK1Z2oEiozQb0hdFgnyrkKEYK67mq3
         O3OLoi+36wzgOJHo3seOnWZSxahuXfaTSZniBGTgnNFJfnC7sZwBer94LWHmsXrXIjUA
         qSH/0O+TB8GVX+AxKDB7jPtq4GGd1JhksSBSQSTz6GAUTFxmRTcu9qRkaoIbI1KeLNg+
         PtiMcFunVChCP+wkfFbMhLNBysuFYOzUeRTI63n4hmmwCfqaazprbgHcDGrV98tWnjwv
         6Eww==
X-Gm-Message-State: AC+VfDznV0THTeP0m0I2Sssp46oNly0H8UtMaI+lhhIzg5Oq1PePhEsM
	HtCZr3ldbMK91ipby1NFryx4ddR7EESxpHXo80moLg==
X-Google-Smtp-Source: ACHHUZ5ozb9ypKX7d3BJnL3mDfngiXVt9NHoDSxCqgUIp14Jh75WFJkmeIdoXMcxQvGZz+X5pe64pQ==
X-Received: by 2002:a05:6808:158d:b0:3a3:6e8e:5168 with SMTP id t13-20020a056808158d00b003a36e8e5168mr1286631oiw.39.1688092165652;
        Thu, 29 Jun 2023 19:29:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/30] weston-init: make sure the render group exists
Date: Thu, 29 Jun 2023 16:28:44 -1000
Message-Id: <40007e8925ee63bddddad6e475f75b5494304903.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183648

From: Randolph Sapp <rs@ti.com>

Add the render group explicitly here to make sure it exists for the
useradd command.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3134fca12c6f74d2b99f79fb751bc5513c5b937a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 77dda03cf5..2b32bc4a08 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -93,5 +93,5 @@ CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/we
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
 USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
-GROUPADD_PARAM:${PN} = "-r wayland"
+GROUPADD_PARAM:${PN} = "-r wayland; -r render"
 
-- 
2.34.1


