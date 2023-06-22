Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B45C0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:23 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.1208.1687401380774963367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=K0ar1ju/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-553ad54d3c6so2252286a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401380; x=1689993380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQukTiuDWXEf+q9GvKr07tcAHL21ETAv8D5R2nHu1ck=;
        b=K0ar1ju/aGdxiumWl73ICcy/vQp5x30/bQIEsuGp0hnQE1BEfKxhVtPWvyKXn+Qjj9
         rCefEwD/AiyKxAr7grwIuDdTtsYmKnx3f6MdJKxt6HaPeos5Yj1Ss/hmd0RJoV22kFsa
         UTl8KeG2GDgFljTQZ1jXXvQQu+aR8A6FSyLZzdm5nJvHkfbR2Y7/c/xFT3q4idrdy0X3
         J0nxq96LccjrCIT4SAUlirpPQlD1Kmi8Fq8HCGXUKpk4JucYoZdFJEy8vtpyXEa9nXcy
         JGC1GXVvvKwIDPglPjfZmYez2P/LoYU6pBQ+V238ZBmf+ahfZO/FHpm2auBOysv5FnY3
         HFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401380; x=1689993380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQukTiuDWXEf+q9GvKr07tcAHL21ETAv8D5R2nHu1ck=;
        b=bgwHmJm6KD4vy6echPpN37ywjeUtsdXQb3Jii5XOrhgn62tHEbyEqqZ8JFGgnQaUSp
         2iZ0Y+0cB1ncPcpfYQah5j220WHHb58jfc7Bfxjb+k0c47jf4RpQBAAeesip4+fOgfEV
         kK5j7DMWea6oqwaH4id1diTh604tDdiJJ0UAUVktUKQumtvefxdbrF5dlx+6FAoWIGIQ
         tM9tFtkyahhJxB8JkMY5gBJSkxp6tl0CSspunkdPxhJLGozd9zW+MVRIsjF6TrQg1IFT
         b/7hHigEFMURZ01IoBcqtqXe8XKYNXjv8hf0FiDkgjo8ZdD4M5AZQ17qaQ53KS1JoVS2
         iQtA==
X-Gm-Message-State: AC+VfDxXXgQaE/XBCTI9o4icDquZ6sIzwSfI23MZwv3WxP9hWyVXkPo9
	zIjWnR4g2D3BC3VzNWjUFI6TgNDhONw57nLWLOo=
X-Google-Smtp-Source: ACHHUZ6mM+h0QXvPz75hXLU/da+l5AeKIV6R22wTOlK8gNZxdRpo7et205S/uLvPrkBc5pZleiudVw==
X-Received: by 2002:a17:902:ecc2:b0:1b5:561a:5c9a with SMTP id a2-20020a170902ecc200b001b5561a5c9amr9290373plh.39.1687401379864;
        Wed, 21 Jun 2023 19:36:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/23] libxft: upgrade 2.3.7 -> 2.3.8
Date: Wed, 21 Jun 2023 16:35:39 -1000
Message-Id: <eb918993806029bde27ea8d799c37b6d007fdb40.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183207

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
add check for missing glyph in XftFontCheckGlyph()
issue 17: libxft-2.3.7: Bold fonts in urxvt missing leftmost pixels
issue 18: Problems with rotated text (monospace font only)
configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
Clears autoconf warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5f6eae1dfb910347ab47ca868e6978768fb14f46)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxft_2.3.7.bb => libxft_2.3.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.7.bb => libxft_2.3.8.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
index ad126d2092..2699c1dfd7 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb
@@ -20,7 +20,7 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[sha256sum] = "79f0b37c45007381c371a790c2754644ad955166dbf2a48e3625032e9bdd4f71"
+SRC_URI[sha256sum] = "5e8c3c4bc2d4c0a40aef6b4b38ed2fb74301640da29f6528154b5009b1c6dd49"
 
 XORG_PN = "libXft"
 
-- 
2.34.1


