Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA23C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:55 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.5728.1678402721652551172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4WPMUJ8I;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so7892512pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OklKpEZ/0HcmG4UFtCno2IRDyn43rPpDAKpIL8UFBPk=;
        b=4WPMUJ8I8CPKQkqjK/rFzPVogF388Dqlyh+v/rkYlndeH2rgjtQ+KrbBD/MY4YWXGu
         MlL+BOZEOB0mmnHk1EgwehqakzWHs+Q6mfCTT83jLTNBFGk8UVQoGM6hCZRW2YYbFzLm
         wCymr10XQNFpMwYximY+IxYmzXBMhxRH1d4DeTan2VwFOiWYFBsLAokf6tJ0nxi1JQ6A
         AXoTjw0I/UgCm4VFhB3u99oOeYso0xHXTaDKP3616BciWGj0ug2NJr1SBJaV6CRfTxEA
         LMQB1QsqwZcnb9Ger1FkukbX+hImM/RvQIbAzY8VsgVFvqiXy3Ky2kmdCM5QdSKibW4n
         mdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OklKpEZ/0HcmG4UFtCno2IRDyn43rPpDAKpIL8UFBPk=;
        b=L7SnXDuX8EV77mqMWnod2xA3tOQwNd0q5XIk8bCi+Aj+D68YhQ3EyS4bt4o1X5g17s
         5DvqHTPiMKRFOeoHpammxFpoGJQ7hkZvQaB2VwJ06Bv/UVemvOp2ALLU+eROHRQ+U/cJ
         o7AEXZUHjGpN9voeGDfvYWg5oSf6RGjJLnZPm7qk01Rp2p9hH8OJXVi6+/3h78apCSoh
         0Ihajvy/SHGUWmbw2DCmf0mBCqD1Nc3acXzZffJcAMAtLE87y9KluVwPwnrKQPKRqOmF
         5eU+M8zGyedBoHC/X6XkHk/SFyE4GqWaKclGLekKX4QndWESYSZ3Bn4gSLVt3au62Ulh
         JZEw==
X-Gm-Message-State: AO0yUKWS2Nv10EkvU+f2xFq0XqKLC7bfuMiw3ycTkixBD7PvZt17RzUJ
	X49lKal/OTjDGNtHs0TnfeIBCuMtaGots/cyL60=
X-Google-Smtp-Source: AK7set8O5rM1bZ6hY55z5UnNElC6X6KjAZ+n9GSlivjIqnPtFGnXPg9SrkhHYspBqTE7/T4TAXFVNw==
X-Received: by 2002:a05:6a20:431a:b0:cb:77ef:b502 with SMTP id h26-20020a056a20431a00b000cb77efb502mr27337506pzk.5.1678402724670;
        Thu, 09 Mar 2023 14:58:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/27] vim: add missing pkgconfig inherit
Date: Thu,  9 Mar 2023 12:57:53 -1000
Message-Id: <23ebc701863795ea2d43df8ff01211c8377e2107.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178291

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
index fcb5cf6334..da586a5699 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -33,7 +33,7 @@ S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools-brokensep update-alternatives mime-xdg
+inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


