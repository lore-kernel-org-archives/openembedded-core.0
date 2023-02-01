Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B086AC636D4
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:41 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.97.1675289793059977464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ecNVHoy1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 7so15271pga.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IC0Or7et1L3HN+HP99FV59yu1Yvy0H5AkauzXj3SP+0=;
        b=ecNVHoy1yBBgomA/qM/q2ex1KzOIXTA9enMiJUR5R2Ju6CCvNsMO0gXr9wj6l4FoP0
         VnHmQB3X9zPHTRHewtz/M+DwMqdnaKG43ce0+j5sP/mxL3a+oLKLAUg9milKZ+ggIL+f
         FvYgkl1MCEHAJqkjQZ5Q7B+L4czNkMInoYU8mwmBnqcSnvnF1o1glIzKMbUW8neaC5rM
         iMG4OB84Sc7oYEhkodDuIuMgEFxLsDZ0jAZH1OnFh3vzSTYfHUNW6dVGDEMl0ZTTXrWi
         gTZYl1OgoN0DZVzHXUZnWQi5v+S0zCkB2uD12vNcXnv4fmz53SACCTX3cNJJ9kYJ25K9
         pTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IC0Or7et1L3HN+HP99FV59yu1Yvy0H5AkauzXj3SP+0=;
        b=GyMvgnf4GV8xk0v1t4dJamAytoaZGEvPMJN+d1hrk6nFXhx2eblhFM/SRddG5E2M7B
         DRE8b8iGyTDtbHM2Zqh/kQg4P49DF/7+fcaFIhzBamVM4YJiKDzUIXEeKmyNL79OaZFI
         JFZ1YO1Z3XsN6hoKDe+FeDHxsX/mB9KYtJ+iYc4TGT4CtJZa68U8FcT2B5ycZjfxs54G
         T9F+Ytk5yJ4JaoHkO8LFaGw+KW5+zg2Xaq1TFIU7TJlRSIrndwtAxYKnBGrSd1OO1tVO
         2QBu7j/jq7hq7NwaqXC3aJp+T9iwr5mfdq2iGA8iwS6j2uDc4jIvvfxzVhQyoY91CWL1
         9EZQ==
X-Gm-Message-State: AO0yUKUICby4UkcaCErfkhFB2shAra2/aAU2MGqgoQXZ1OnRgD3Rptay
	Lux/XTSa/blQqT515mhLUYYQ/GnYKpW2Qpy5eYE=
X-Google-Smtp-Source: AK7set9s6BEN0jXQk4vDQ3VvebzCDDVyw6jQhQ+cdX1lWx3sL5Gj+KKRK64W4D1dSsyaLAORjmvAEg==
X-Received: by 2002:a62:e117:0:b0:590:7616:41eb with SMTP id q23-20020a62e117000000b00590761641ebmr3713440pfh.30.1675289792062;
        Wed, 01 Feb 2023 14:16:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] spirv-headers: set correct branch name
Date: Wed,  1 Feb 2023 12:16:01 -1000
Message-Id: <e7d0e6941c7e94f37eb43a3b5dae550513394cc0.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176667

From: Ross Burton <ross.burton@arm.com>

As of last week, the SPIRV repositories have renamed their master
branches to main:

https://github.com/KhronosGroup/SPIRV-Headers/issues/313

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2957da09f13607ac00ddd4a87ec9ad0014326507)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
index 72416b441f..9e4a695325 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.204.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
 SRCREV = "b42ba6d92faf6b4938e6f22ddd186dbdacc98d78"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.25.1


