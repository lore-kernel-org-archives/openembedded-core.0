Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47631C7EE31
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:30:01 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.89.1685068194552783066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kEhLiYPO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ae4e49727eso2607725ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068194; x=1687660194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2Fd7dD0Cnq2V+d7ErnLRFl63IiuYcAmI+C/YDXdWk8=;
        b=kEhLiYPO0hoGGao1gBBG5aLLle9w+MGt+Cel/ZFYERkgcHiayQTLqb3Bun/AIgY/WR
         Wn2sdIdnctzIG75PPsWaBjihndW3WFvE0lf4TPfJYt9oOW4B556MdN5RvQABJkv1DAVn
         LLEh00eOgfLc+4eQowO3lmPSeLxy83n8T3um1MhyICocGh2YGORsckcRmmDI5XG/9OMQ
         QDe0uC6MEU+wPTPoJ4h4vBTL6YYYPa7KiRFE51kRVLSdssF9zrezhnkzHR22S7gREwVH
         ygH09wUQjNuE4QyCVyBJU2YEpo+dTCAVoinxZ+UmWJIkwPNUbBMUtOIQlyQr648BCvZT
         ujJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068194; x=1687660194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2Fd7dD0Cnq2V+d7ErnLRFl63IiuYcAmI+C/YDXdWk8=;
        b=N+2p2tMJbHlXfanTM8dbDCHKueMin5FQdxT/M58LBODdpOGrtOlet8C4DlZEn18V0v
         b9SMTWT/hWPkksy438vEXTXAQ3TUdeioZkIf6QLFmP6p5HgTgbYczuyw706Cb5r2etsU
         tl8MhP5PCRdTX2l69mtHWpD7eoaR56Jk1G2sQUCwANmeHlyj4hkJIb4xdt2/fQLEyCKk
         QQ4A86S5NWt0xP8s05ZpXTaUQUJZtLPS61TFzD1vp+WijqSb8ynCkz9AQL5FEtUNfppe
         iVtaFfszRAFsnbkoZfC99y1K2Ai8g4R8CcNncEQ/7g281b32UNdjAq5LiB+cvLq4L9qa
         lS0Q==
X-Gm-Message-State: AC+VfDz+jVaZSdPFwA+VzQw+gjzxukJiKfuBRHbdXZ2ubx/bhF0KmN9r
	boQtaIs7Eyzq/+5HvdlTscMfKAFLTQ8+oHJ3jnI=
X-Google-Smtp-Source: ACHHUZ7gnvSzf8WrQgpMjJI0W75JU5Gu8mRClhi+60ycCrGTrfGNHgjZGm92yvEqMOev5luwDD83iQ==
X-Received: by 2002:a17:902:7c05:b0:1af:bb99:d590 with SMTP id x5-20020a1709027c0500b001afbb99d590mr796396pll.7.1685068193652;
        Thu, 25 May 2023 19:29:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/21] weston: add xwayland to DEPENDS for PACKAGECONFIG xwayland
Date: Thu, 25 May 2023 16:29:06 -1000
Message-Id: <4e42196754b19926b2219c6ffda47bd389e9d9fb.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181750

From: Ming Liu <liu.ming50@gmail.com>

Otherwise xwayland.pc would not be present in sysroot, this leads to
some xwayland configs missing like have_listenfd, have_glamor.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f1932cb5a408320a5b542e20ba2807718349e8f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston_10.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_10.0.2.bb b/meta/recipes-graphics/wayland/weston_10.0.2.bb
index f81a33fd1e..e09f94d9bb 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.2.bb
@@ -74,7 +74,7 @@ PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,colord"
 # Clients support
-- 
2.34.1


