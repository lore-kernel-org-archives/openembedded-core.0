Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D2CEB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 19:23:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.27511.1686856848604689629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 12:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Dh4KxLgl;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30fa23e106bso5284043f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686856847; x=1689448847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sq54Ns1sBD1HoPxWH54MbgS4hW3oh4QYXcyRVcckrVw=;
        b=Dh4KxLglF/5kNoLafq8F+Ymm2iZ/zkzUzFm2L7SI2pWdQmok9LXWVe0ZFoHJ52AWBF
         /hnFHlpwBTNPptx0U4xQOkPhHFfT/l4nKoJwxRdvxGHEM4tQyCkKxcds20UulH1PWUTx
         kXUeultBxCCoXuvFXpiB64dnpvcv4vRcGpWTYow/1S1TrVvEJWwu9nAJJjtHV8OIBe2w
         mQsdawHMMZrxgrZjYftZWEDuy2XVilvgUz5oNVK3QUew1LFeh6WdnV3z2aNzVJSBDVic
         V6D+Tg2jz/gr32Pt6P/ZtCFvRFeWTKCzkXVHeTY2bjYiPc/BLak11OE5tRAvCs8791HR
         kb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686856847; x=1689448847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sq54Ns1sBD1HoPxWH54MbgS4hW3oh4QYXcyRVcckrVw=;
        b=eSyAEL2KBuy/qK8IwczLUBzoJxZ6OZdtFRQoFIwKZi+838DsyfluP2QE0NknXDrs3Q
         QZkEVlcFdTXqHju4DQl9nIRg9qS5adr5La3PitPvUoDn2S2qdgq/t72h/wztRDmiCg4P
         w/BbR4VAMkI4oCj3Z72xuZ7ts0bxJ5J7a6LBQp19MnMUfGQFY8upe9PKju/vQx8LLSaS
         dfCtrZXLIw3WG05XFbTUds2k7y0G/i2yQYu1l0h3jn5o5JDlLd6MSU7OcEBgfKlRDcp7
         2O5j7gXxhPeOaPKTHq4acXWxSVsEcvdN6hX1YrI9SoeU3LTKKNMKgusp4kSgYi/kgKSd
         IDkw==
X-Gm-Message-State: AC+VfDxegfYYx73XPEluS8cPLJxdatD5kmruyKMeQmWjzIyO/VR/cWJd
	sXY5FqQtOLCdZIxW6V9+HG3Ge8lobQxxvNCdZDs=
X-Google-Smtp-Source: ACHHUZ6Ljgf/R3YjPoecuKfg3eQER4YMM8SdMIgYI4SdlbdR7N4Fos2dvyGzY7O8fCMgg8EOkotqig==
X-Received: by 2002:a5d:5607:0:b0:307:9f8:4f30 with SMTP id l7-20020a5d5607000000b0030709f84f30mr9509259wrv.70.1686856846477;
        Thu, 15 Jun 2023 12:20:46 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.180])
        by smtp.gmail.com with ESMTPSA id e3-20020a056000194300b0030ae901bc54sm21788097wry.62.2023.06.15.12.20.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 12:20:46 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] weston: Upgrade 11.0.1 -> 12.0.1
Date: Thu, 15 Jun 2023 20:20:39 +0100
Message-Id: <deed9a7ab127ac6997884f93300205dea46c9979.1686856412.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686856412.git.pidge@baylibre.com>
References: <cover.1686856412.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 19:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182869

Tracking https://gitlab.freedesktop.org/wayland/weston/-/issues/488
we're keeping -Ddeprecated-launcher-logind but plans should be made to
remove this/work around.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../wayland/{weston_11.0.1.bb => weston_12.0.1.bb}     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_11.0.1.bb => weston_12.0.1.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_12.0.1.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/weston_11.0.1.bb
rename to meta/recipes-graphics/wayland/weston_12.0.1.bb
index 4f6ce19915..be9dae6289 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_12.0.1.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
                     "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/uploads/f5648c818fba5432edc3ea63c4db4813/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/12.0.1/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "a413f68c252957fc3191c3650823ec356ae8c124ccc0cb440da5cdc4e2cb9e57"
+SRC_URI[sha256sum] = "b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -71,13 +71,17 @@ PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=fals
 # Weston with webp support
 PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
-PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
+PACKAGECONFIG[systemd] = "-Dsystemd=true -Ddeprecated-launcher-logind=true,-Dsystemd=false -Ddeprecated-launcher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
 PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
+# Pipewire support
+PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false, pipewire"
+# neatvnc support
+PACKAGECONFIG[neatvnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false, neatvnc"
 # Virtual remote output with GStreamer on DRM backend
 PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
 # Weston with screen-share support
-- 
2.34.1


