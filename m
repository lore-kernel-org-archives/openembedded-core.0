Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6A2C4708D
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:39 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.32487.1671380012791267522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7UPtXJgI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id js9so6902010pjb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGq3zr3oKEUUZvtA/kvIr8L80NEKFWs2vPvuImFUWNM=;
        b=7UPtXJgInQDdRWLNU3R+a7NokfEgpH5LiTzdeeZ30KBjIA9nCx6UekFRc3MYuQABvJ
         pVLYJRT0Flwhbq4lWOUxLi1i9hoRwMrv42yriVRuk3L7OcPCHiTjfJXuMluF6ICmnbIa
         9FTqGA4uotQU8P5FVydUP3vuON5pXHh7kw6br0Iss0hpTAVnpq/Q37+jeLVCrBurYBwP
         +6h1we/xCf0G6IfJT7+0bSq2otwL4CnOKBUHN1CPuvKxoecFsgKChR/HyqxAnoRfo1TC
         Fxz07oQREW1XQ/tZgrZ39QTVO4bjj7FPyX8HNteJiE4mZZIvp88/YTYYYZ4asv/McN76
         kQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGq3zr3oKEUUZvtA/kvIr8L80NEKFWs2vPvuImFUWNM=;
        b=XI6z9TqCuR/UyrETm25GwX8S72zTAvtzETKo+HfhmMwtkB0LKLpqhiFs0MIxUIUOV/
         il2ytDhAQyIs8zxLfdXGePWHhKj9uq6Sja6MrC3fjuCBUMkDef1G9QNEBSUO2hCsDpZ9
         lr+DIzAWLoIHSz7stzR0BQ/vZKfDSE+3ZKCGE2iDD04+0qCDJuVxS1R8g3+37Ekmg79m
         gbUGjy5ur+tvnGnpiK2xM71gCDRZXlEDVBiURvVXIjLNM0iqxgdxOYihn/MaF5Ra6ve1
         N/r7ESRG71ba0aR5YRJJXbU48/wEJKqm7WlQMj8f2Cj3BPaFBDVS01VBiYw7D7uZt/dp
         ZbBQ==
X-Gm-Message-State: AFqh2kq54b1XnwAK3McqFTjB43kdGHdVhJuCVRHCYdo6EVHn/4rQ+xPi
	j7z10f5juskc6FavjYdzPO4D7WkniYivZZ47FCM=
X-Google-Smtp-Source: AMrXdXt0iA0D+micy5z06+6jeuTGu2I02X3RTseB79qI5IGYzp3uSCqNm8eKPPxqK3KeLb/q1i7h3w==
X-Received: by 2002:a17:902:b48f:b0:191:1fbf:cd4b with SMTP id y15-20020a170902b48f00b001911fbfcd4bmr1261285plr.38.1671380011884;
        Sun, 18 Dec 2022 08:13:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/19] xwayland: libxshmfence is needed when dri3 is enabled
Date: Sun, 18 Dec 2022 06:12:53 -1000
Message-Id: <7a27f91670d6978433ecab5d3ef694303d5da79e.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174796

From: Carlos Alberto Lopez Perez <clopez@igalia.com>

* The build error happens already at configure time:

| meson.build: ERROR: Problem encountered: DRI3 requested, but xshmfence not found

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 451fe4a067432b432b9cd38d2fc78072f6ce5421)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xwayland/xwayland_22.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
index c1c5407dee..51d847a093 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
@@ -23,7 +23,7 @@ OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
 "
-PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false"
+PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false,libxshmfence"
 PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl virtual/libx11"
 PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy virtual/libgbm,libegl"
 PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
-- 
2.25.1


