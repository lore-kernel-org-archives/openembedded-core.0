Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47EAC10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.258.1714512261468948033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=guE95yuw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ec486198b6so9677035ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512261; x=1715117061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzP99QncDysFEmaYMwpDdnCypariTE1B7BwalOdUGE0=;
        b=guE95yuwH6LJQBWje/cJYzkb2VCVPhHnLuyLAUrrY/c08/mZ2+pLPqPaGwOU9vIxN3
         FoPOE4wSqgKlpuHDGASh9YTz0uewt6lcv/0tB4odHHoUfKuyNLQ1O11vzXpEnbxHiEZD
         WIu+n2Ia46BDaRNg7ACJZM+0GCc5E7RMs+67L98Zrg4cLAa5HlUyaYSGnTZWJRK37f9F
         /ZNPwew2YlF3i9EsO0eB5fB4gFXr2NpNhL3IePOposxT+FQQqiOpfsKk450wmSNkpKtk
         RvHA/kPW9WIeuNxxF5Xwvq/bu4a1adKHQwCc7cBIOMaEjIifxqnNDGA6LOVvBWG8Bn2w
         8Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512261; x=1715117061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzP99QncDysFEmaYMwpDdnCypariTE1B7BwalOdUGE0=;
        b=uR+jFeSl97c6uOCJ55cX/ZFzrf52+iEs8uuixpHGTgLH5kMk5JD8fGG2MtSpza5skw
         wRkzyJXQTVFNKk9XDrloyk+OjF9DmxV9bm80fBQeOYvYQYboGEh2yGPQFlYsWQU+KUeZ
         KCVqHH4O4Br3FFb6bkT3JKw1JL3YzSzKtwnwE4Nloygxgfd65t8ynC+2Mt638sc8Wm7d
         cFcmK5RabL6jc+7eOKhnip3SJO4uV8u51v0UDLHNMv7HvXEljGOPeuH8wNwylp6/hX9R
         Y4BxRmDxaX73r3pnDLgMxhNf0uz0vduzuMrXNf+LtL6LPxZezlxKP4H/BPVjjCsGSNvY
         OvdQ==
X-Gm-Message-State: AOJu0YxTQJdXIKCvtPHcLPheOxAKd6O9yl61Lip9Y4+k3qLxaS03xVKG
	dEE2JLz1dAOtxkIXimcgLru+vsVY3peUeqzUA1bEJ/A5Cja/vsKyRFjBMJMioePKeSxHLgCz2vm
	DfhE=
X-Google-Smtp-Source: AGHT+IGaFB2yNEFtfeGpdGgx6DpxKbHWHt98fAkYFpRU8/qj45TfiIE+CFd4nRRN6hhUzD8JzuZ9Iw==
X-Received: by 2002:a17:902:ec87:b0:1e5:9dff:a52c with SMTP id x7-20020a170902ec8700b001e59dffa52cmr839127plg.10.1714512260625;
        Tue, 30 Apr 2024 14:24:20 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/17] libsdl2: upgrade 2.30.0 -> 2.30.1
Date: Tue, 30 Apr 2024 14:23:50 -0700
Message-Id: <9d5bbe4389ee33e89ba419924fe82f4ce872fb26.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198769

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed a regression causing SDL_WaitEvent() to return spurious failures
-Fixed X11 cursors on the latest release of GNOME
-Wayland windows automatically have OpenGL enabled again
-Fixed memory corruption when converting signed 16-bit audio to float
-Fixed audio artifacts when converting signed 8-bit audio to float
-Fixed the clip rectangle not being updated when the viewport changes in the SDL renderer
-Convert mouse wheel coordinates to the rendering view in the SDL renderer
-Fixed a crash handling controllers on macOS
-Fixed a crash setting a window fullscreen with Emscripten
-Fixed the keyboard automatically popping up when resuming an application on Android

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a17c05585a0da0166087ae0cd3cd4331a1fb2615)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsdl2/{libsdl2_2.30.0.bb => libsdl2_2.30.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.0.bb => libsdl2_2.30.1.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
index 99dbf36477..891e91190a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0"
+SRC_URI[sha256sum] = "01215ffbc8cfc4ad165ba7573750f15ddda1f971d5a66e9dcaffd37c587f473a"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


