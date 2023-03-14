Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F672C74A4B
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:22:42 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.11823.1678807361856000364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Z6jsoyw1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id nn12so15733945pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678807361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyQ0qm0UYwt+MMb1//Ja+8KwU9m+a0p9n426ujOblqI=;
        b=Z6jsoyw1A5VJrQHROgvyeNPgWL9xFtbOZKVqj2QDkgmc6TYHL0uAkf/lN3zqHj10qb
         W1ElqXAt2O9HqpEsbXN6o9+6f2CUJU8Nou0LuoiikVa7hojRom2WkTwpyMv3cTYsUh9X
         K6GbL+VskUqt+WvyY0d6i5jugi/wdHFkhZf9rZxVHgnKDIaDvI6/hzqgXT1VuJ6S0oHb
         BdoccgIupPoMZwfmiOarSmM9EpFdHJyStIQDewHpck/gG+/SuGT0r2meLsUudwKX4W+E
         hdewa8WZ9DDzy86Gjq3tZE2WTNQO6nluhDY3gLhiM8vF3QivOOySTln7GwYcC3I/IBNh
         WRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyQ0qm0UYwt+MMb1//Ja+8KwU9m+a0p9n426ujOblqI=;
        b=nV4RNs04EnBxJy7Wl0q3h43Y26iUrFSdpH4AUWW000VPlm2KnC9ywZ6trrfnhrzZ5/
         +p8OLhll+H9HLoeFWr76kLPLMsx/KLDjqetVIM1P3rT/obAyEG0U3rRMjS4JoCC0f+PT
         Ni64vLHvhSSobdQ+wcs7nM5Xc+e1dvFs2HPDTDbjqbFIXafXGl1jBOF/t0OXiXnmimvt
         hbtnhrGpYkuaff2Thw9qCLFJ+f3H4h/VBUxN8/d4CSaHzamZGRgmvGySM+MYK+nepe38
         xHzIb53VWm3KlHMLtD82PC1+8OlsXsgbrcJ5cUA0+y+rI1HbBYosiR9Ww6V/bz0m/q+y
         gVxg==
X-Gm-Message-State: AO0yUKVpGdmUG4k320TU8dy/rRS6HrfWRfbzXMmb9SDnDGii7wcyJLLu
	ctwRYM2Y+P//Ual9P8T92QtisYJ2gn970rRWZMc=
X-Google-Smtp-Source: AK7set9CaBE8Z3hpdYcY+I8mV/3Lpi5K/7Hxft2iTJJCxyDIn+a0bNvI1i0yP+qNV/upuno4gKiOmQ==
X-Received: by 2002:a17:90b:38c3:b0:237:d44c:5861 with SMTP id nn3-20020a17090b38c300b00237d44c5861mr40070367pjb.12.1678807360967;
        Tue, 14 Mar 2023 08:22:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a284d00b0023d0e743ff6sm1871977pjf.3.2023.03.14.08.22.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:22:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] vim: add missing pkgconfig inherit
Date: Tue, 14 Mar 2023 05:21:54 -1000
Message-Id: <c84f0822e7cffc62e2f042bf9d2e424f85f74ecd.1678807105.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678807105.git.steve@sakoman.com>
References: <cover.1678807105.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178506

From: Ross Burton <ross.burton@arm.com>

Vim uses pkgconfig to find dependencies but it wasn't present, so it
silently doesn't enable features like GTK+ UI.

[ YOCTO #15044 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 70900616298f5e70732a34e7406e585e323479ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 234ecd0027..828cf84757 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -33,7 +33,7 @@ S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools-brokensep update-alternatives mime-xdg
+inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


