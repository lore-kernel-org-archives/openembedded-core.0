Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB476C7EE24
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.40958.1684291509409601980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tY2iSqLh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-24decf5cc03so279725a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291508; x=1686883508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QMIDGLvMHCY8vKbt7t6rvYRbt7NpfQWZ+e7VBGBcnQ=;
        b=tY2iSqLhX/fWEErXMxbMNo7BkeYQMhPIY77+vDCDTJBi4NW4iWhw9nIPKnpXJev6B0
         oI7ouDnOhKl7JUuxaeTQ4RPLDIpPFhaOwcd0qqOEie/tQFlJZhpRSrkSfNyL180J/zyI
         SJ9g1Vv+Gi/gdeDzVYa3qc68KrIeT4bMsEiLRJ8no6Dz9R+HQv27pYsqRNyh5pm+SlMH
         vXqUOw8PoJ4ERO/KvU8u7RLpVhxcCf7C2X2zWctYrVPCpnkd+LZDGsmK5ZhSFHD6JTdo
         tOfdm61ZF+7ATf57J11p98rm+RctDtm2izupW0GQCOUqTZR4KV06Iq92Yn3QgRbTe1vs
         npmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291508; x=1686883508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QMIDGLvMHCY8vKbt7t6rvYRbt7NpfQWZ+e7VBGBcnQ=;
        b=RlFhJdxT4HFBlJYkKg9HiFSeJ+g/cT+MCSik9AIvT79JmEMwmD+P0ddhkGrhPYNIrX
         vs+bQVEzQa1cdx9gxHHbPMLobNliBgIN0nhErUrMnbH/st/92EIhH2qDRE9uVCejLjDE
         K0brgla6fB6ozMUhGl1xAGwbli2NBHTQLf2xK/I5LSGFWqvgFGlRjDjK1OARmYC8t9qY
         9al2UuNmbTHdIgk0SCFvFE67dzweHKvnLVoYJKw6usHPuZC2K6HcnD+mqj4Jnm9nM1gX
         FhwP2O7228ga89LxwqHbeOYXx4owi1Fx3ABxu8fcvW/VzqGgaRORqlJ1cdeohz1HbWkR
         O6dQ==
X-Gm-Message-State: AC+VfDwcVMNuX9XHBdAt4r5kqKq2rYPy6WYmlxzzIuXj6nuiLrvZHr7p
	R/ilOccxJPOFcVMoXgfUNo7JI3NgR0Fh1pRWzhc=
X-Google-Smtp-Source: ACHHUZ4KRJIDr3kDrrQb/RL0pMhpehrZaBz3q6BMiJUO4heTw9nJmVBFEhvu2TL3P5s6xQk//QfLhQ==
X-Received: by 2002:a17:902:a612:b0:1ae:4a0b:5957 with SMTP id u18-20020a170902a61200b001ae4a0b5957mr2482155plq.54.1684291508560;
        Tue, 16 May 2023 19:45:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.45.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:45:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/13] weston: add xwayland to DEPENDS for PACKAGECONFIG xwayland
Date: Tue, 16 May 2023 16:44:36 -1000
Message-Id: <20cd64812d286c920bd766145ab1cd968e72667e.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181442

From: Ming Liu <liu.ming50@gmail.com>

Otherwise xwayland.pc would not be present in sysroot, this leads to
some xwayland configs missing like have_listenfd, have_glamor.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f1932cb5a408320a5b542e20ba2807718349e8f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston_11.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_11.0.1.bb
index 2daecc9856..4f6ce19915 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
@@ -73,7 +73,7 @@ PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
-- 
2.34.1


