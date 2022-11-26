Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F66DC4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:56 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.70839.1669472147715051050
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CdX0Vnqs;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso3261758pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIyKZw0V9I+e4GJml5ejTWnSAnX3jfgikn2s0R+FT8M=;
        b=CdX0Vnqs20X8Sdxg7M0hMp++PzKADGSSxQuEQCDCf/qcq1T61gpOqGCE2dulEm5uv/
         kOZ4vXUYGIEnNA0ZNOwEJu/TZNbUl/0j8VsSuSMrib+lgpNJS6oVLplOKHrpcsK6WIwI
         jq/yk/7ADYFiUkrl7tubhk3KpCCgggagfkW2uhN0L7iTJpw4TbUeMpddwrIKOVpFAoXx
         UFflDH0nGHVj4rkUFRc1f3u6AXxyfaV3tC+5Fv6D1lMlMCFspZx04W/mCRZvT4chhSmI
         8wZWUCHs//SqvZ0zgfQmOYnUTYx6amX1gSrR49bFJbJ/i7FBRduTnzhjW87m9bq8sCcX
         pe0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIyKZw0V9I+e4GJml5ejTWnSAnX3jfgikn2s0R+FT8M=;
        b=PolQJyVFUTHmW9WJ5r7SHV89Mn96M0IhrRmawW25L7b8dj+P6qx2nz1TxzZt4wu1rI
         z6a/MBzky1Xgmj7peOcl/ccCzY4Yrhoc9qxxKvGy/ynx6Cck8rT4vIwuDj027gp5FZrM
         bLVdNtGMMFa3sGtrd+e129e/Fse8DkPqehbpsavaly+l7kN4BsF25KoEQKPkFskyxbpo
         EdsGXohGMoop4nemo9F5fGeENhoXs4VL6khAxMQZYhM6EcD1tg4R1zA70k17Ok48HLQl
         0ncTDg0OpUM4KqPbc319IXjtPrT9UeAA+VOrOFSe/ZzV8YU3pAJUITj03cAHh62/HgB8
         EkBw==
X-Gm-Message-State: ANoB5pl00MF1vZEgw5/nIoI22Y6pDJIq7eCOjQsVz7pCyfzK1k0SbZMp
	6Nh7Fbwp/EQtVTbJB6F9zmFGkFbIsluuQ4eg9m4=
X-Google-Smtp-Source: AA0mqf7q20wrbbdM74OEJttO2RRqH0Y9dZjzVd0/0Gn/mR+Dvgs3Jen0uA2tLB4C3MR0mR7IEeo3SA==
X-Received: by 2002:a17:902:9a8a:b0:189:58a9:14a4 with SMTP id w10-20020a1709029a8a00b0018958a914a4mr13131289plp.18.1669472146746;
        Sat, 26 Nov 2022 06:15:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/37] mesa: upgrade 22.2.2 -> 22.2.3
Date: Sat, 26 Nov 2022 04:14:23 -1000
Message-Id: <ce5362f7a4a051d4a468edb016f7f872fe77cbd6.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173812

From: Wang Mingyu <wangmy@fujitsu.com>

Mesa 22.2.3 is a bug fix release which fixes bugs found since
the 22.2.2 release.

New features

- None

Bug fixes

- r300: register allocation sometimes generate invalid swizzles
- nouveau: Updating to Mesa*22.2.0 makes videos have corrupted colors in Firefox
- [radeonsi] OpenGL rendering issue with Unreal Tournament 99 & OldUnreal 4.69 rc4
- GravityMark segfault when using ray tracing ANV
- r300: wrong primitive positions in CXBX-R emulator with nine and RADEON_DEBUG=notcl

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d7037207e5c7d93031311b3ad88e4548ce8bb47a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_22.2.2.bb => mesa-gl_22.2.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.2.2.bb => mesa_22.2.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.2.bb => mesa-gl_22.2.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.2.bb => mesa_22.2.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 78ac0964f6..3754bb14de 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
 # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
 SRC_URI:append:class-native = " file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
 
-SRC_URI[sha256sum] = "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9"
+SRC_URI[sha256sum] = "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b885d2ea2d5c098d6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.2.2.bb b/meta/recipes-graphics/mesa/mesa_22.2.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.2.2.bb
rename to meta/recipes-graphics/mesa/mesa_22.2.3.bb
-- 
2.25.1


