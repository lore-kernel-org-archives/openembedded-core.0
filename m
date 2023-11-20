Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116B3C5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:03 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.602.1700498342015513713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zBMk6Sgu;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-359c1f42680so12422835ab.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498340; x=1701103140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bweCzYnmHrUyPnfFF7+12//ohNjOd708tMNRPHLWXe8=;
        b=zBMk6SgulXdyyi5USqVcKoR7Co18BN/fXxlxGsZGI/XrUmT/otmvhAJelcaFwH90V+
         TBsIUPEowAdtBMAhCk4VO8cPDjT0BBwj5pmMr0X5xs+kGhBGhY2rgi3bsncfIt5X9SyH
         7+3+AEXFivWygjO6hEgqOuZQL6krkoBnJ66IdweK8YG3hE4/BZKCJLDUPtw3CsJ6MQj6
         cRvgODAbf2q68bmJ9kCscy3D1wxv80XSeE3YRkLX8/zM8500MrCCwmWKi9PD+4YiMoVq
         ljoAluxVAvKZNLhqx20Q/OgjuJWz7GkH/8SG4jzjdzHuTrlIMzUTjvNv1Lk7R11AMAQs
         ux7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498340; x=1701103140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bweCzYnmHrUyPnfFF7+12//ohNjOd708tMNRPHLWXe8=;
        b=oeSrOhYwGPXr3gV4k6FS3OYA33jAM2Hgd+J7a9iMmtB6VVwpYxc1DmRpLAjbv0f3mU
         DCAZoKG5V00aXnpGkEQ+Vy0XWcJBtQlqTvBAzlZ6HOQ63xka3InQkZym2sy4YYpx8nW0
         WLRYGYs0ZM55fPxrJsPpMxy/AJgcaBugI5OYjrBio1wZWZZPwQO0LzcSBgKI5U3hWuKw
         w5prQirtOxjguAn/vYwp2KsksS7jY8PXJxMvrfTXE4Ri8ws+OgzGL+P1DQRb2ixahLGp
         8bfLKujobhC8A/f/Udv4xsB6kzf5sJyvp2yA2JyyFGK/pMqLlYqaRBRBVfZk7Qz/PXMG
         VGrQ==
X-Gm-Message-State: AOJu0YyVSA2G+mW03/nhRvw3tArw3oHfVoAqFll1596y+IMfY6B8TPgH
	zSsoew+CvO2puDzovAr/w90mWTNAa1pjHDDkc9ZtRw==
X-Google-Smtp-Source: AGHT+IHy5wtOAnqPqZPq2ET9W3Y8Umb5iJRfcLShUXGx/Rw2mcEwnTg4ePOO45a0GgygT9zDXPnExA==
X-Received: by 2002:a05:6e02:ecf:b0:35b:d7a:eb85 with SMTP id i15-20020a056e020ecf00b0035b0d7aeb85mr974360ilk.3.1700498340720;
        Mon, 20 Nov 2023 08:39:00 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.38.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/33] libsdl2: upgrade 2.28.3 -> 2.28.4
Date: Mon, 20 Nov 2023 06:38:17 -1000
Message-Id: <3923426c799f8772fb84303000d04ac3d968e84f.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190892

From: Wang Mingyu <wangmy@fujitsu.com>

This is a stable bugfix release, with the following changes:

Enable clipping for zero sized rectangles in the SDL renderer
Notify X11 clipboard managers when the clipboard changes
Fixed sensor timestamps for third-party PS5 controllers
Added detection for Logitech and Simagic racing wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit f47de111cd66c3f9a5a6d5589e1fd034027a0a75)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsdl2/{libsdl2_2.28.3.bb => libsdl2_2.28.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.28.3.bb => libsdl2_2.28.4.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
index f866a3618f..3fed10878f 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "7acb8679652701a2504d734e2ba7543ec1a83e310498ddd22fd44bf965eb5518"
+SRC_URI[sha256sum] = "888b8c39f36ae2035d023d1b14ab0191eb1d26403c3cf4d4d5ede30e66a4942c"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


