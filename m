Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85263C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:05 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2947.1683671577194549818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=reGIUHi3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6439b410679so4106996b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671576; x=1686263576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27k/LZZYqkl8m/hRlYIg/LJxULAULUffuyxJAPQQxI4=;
        b=reGIUHi3tcttwzpx5iIshKzkkEI2V1r0yF5yNLTS0b6aLtfFxHMP7dBzVJ7C7LoOds
         rmIivKsZSCyACVhJdv7fJgj2cLHAMnn8FhQvvMmW0KUg77a6Se9XAo+1kaXyfPClZ7p8
         6YEriDthBRSFTOohkHo5kyqv+g2NqDNN2fNrqZOTFTYjppmgoxB0Bmgdhhgt8iHGOXs7
         vhLnu6mC6tf8Dl3wX7A/ngjbj0Ro0zX6GMbrNDs1oAm48lIicaG/Npvqpjhya9o3r3jZ
         Ym2+RDleXDNNZ9Ui6M97RtpFCd9xyGSjI+rDG9/jvI+c3dvzbMFlq1wVM4xpqxaWRA08
         LZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671576; x=1686263576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27k/LZZYqkl8m/hRlYIg/LJxULAULUffuyxJAPQQxI4=;
        b=gHgZ09lep1jiiAL70+BjJj/O4fHljRl1St1kNZJbHXHNoge3hueaTg+gOqhvZp+tzD
         55iGMe6Lc3PSfovqXGZaEwCbFXJIXMBSuH7SS12ewZ5hysvRvrnVEthzMlohFeSE1eTf
         tZkzgEK414U9vMEUo1Y0XsGOYcJw5WsbInwkB1PvgWGyNV4kcSgcIf+SJCPcjzNcLk0L
         RgBZbbT7R4ImUm64S44nowNvWxgrreuwU49z5E8Dr7IdS+SiephIcfysmMX37lJSG0U3
         Fp8hbkRzf+FibLKDAvarC9+XSqbUb17y8EoxVhoLqFs69LVljNTkIJ6K8fSZcEnIn+7F
         zx0Q==
X-Gm-Message-State: AC+VfDzLeyS5FBLBKQtk4d9ZBMN8/UYFfqidCXdgVB/JuK8Y3Fal+BhX
	kzneVVCAkY4vVk2X7SYEPZe4XKsoEtof2vY3GoA=
X-Google-Smtp-Source: ACHHUZ7Idl5q4A0LrVoIREAGI9fLXu4Z0LLCNhxK89PiiuadW+VLz1Qwllg9eJ9fKRiDcX0K0Z7E0Q==
X-Received: by 2002:a05:6a00:23d6:b0:643:53b6:d845 with SMTP id g22-20020a056a0023d600b0064353b6d845mr18880872pfc.13.1683671576282;
        Tue, 09 May 2023 15:32:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.32.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:32:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] wpebackend-fdo: upgrade 1.14.0 -> 1.14.2
Date: Tue,  9 May 2023 12:32:31 -1000
Message-Id: <f068a9448cc4fc57188d55b35abe2de056b10298.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181090

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Reverted a change introduced in 1.14.1 which introduced crashes both
  with WebKitGTK and WPE running under Wayland in some configurations.
- Fix a crash caused by wrong assertion, which was typically triggered in
  debug builds when using the NVidia drivers.
- Fix WebKit no longer repainting after provisional navigation with
  PSON enabled.
- Fix graphics buffer leaks by always freeing them in buffer destroy
  listener callbacks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit aa37e18a51714af3281b4127dceb40b38aa8ac3c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
index 708201043b..b3d7b229c8 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
+SRC_URI[sha256sum] = "93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.34.1


