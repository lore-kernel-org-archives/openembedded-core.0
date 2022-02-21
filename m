Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C10DC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:29 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.5736.1645406908551216041
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aEJaZzIg;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so1495602pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1dEeEM7O/kcVvEVIjSYLF/yWoBvDrNA8gSBfwiQVOSQ=;
        b=aEJaZzIgANoT6x6NWdzHHXy2T4TWteF3oWG9ykYgd+aSWcHR/98eOgtAl3MqFLBzle
         pSLVYyXaoYswYON4GoQZR9dhPxBryzMEF/g/sP9lv2AkcHvLaHtzoVqylcpjf/02Oz0l
         0qAJ4Ag+eEmP8h6owtnTkQijXYpb45LpGaaLA5tD1yFlBKv27vTrtsGfIjMA8zpryMJt
         ebgezFb5okL9klrnBmwUF5+3+xsvMUTPsIrTBJo1yr5pj1Es6eiTlHObjRa5v2bPokjC
         +7smtFseQlIPwZ80RfK7koPZYsc4QvmIL/cmwrDYISJdw1ChRQKGS3djtIGd8t3d6h8a
         OW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dEeEM7O/kcVvEVIjSYLF/yWoBvDrNA8gSBfwiQVOSQ=;
        b=Zkb2a3lilUHHfczs3vPDt2TGQfKXxHcwf1ijkwXkFSsgrjXAk/rJcFxMod41qOl1z6
         uARkYUit6Y+JzOZ8XAqnb5Djvkz6K+ddQzL4c1sk6XyABvPko8KNJWhJhdh9eCxl5cDU
         u1HyEQF+ENr+Xzdc7MfH+OBAeX1d0HYI5wQytW/OpHSSoi0tTGEpUYiAE9R32vkJfVA6
         Q5f4wFxp8Vzfu2PsREI0rbX/W6DRXApA5A6pa6XP6s54+bpzEC0rGYJjs1eNeJTTZChk
         GCEc1UVxA7EHQPThqZRFtGABFVM6dNGOpQfhszaYBWeOOkOahdhiEPMeeBIE9tOMe7Y4
         /XKA==
X-Gm-Message-State: AOAM532nCGMjbg0YVTk1JZVE/yEETh0Ev8nH80VKlap7qWqTncHsTkoD
	l9nEBqcWGeHee0WAUZH6vY85zl+1fGPNkA==
X-Google-Smtp-Source: 
 ABdhPJzSlZg/i3qB3Lx+te0d3P1bdLcZrMUNunYF5f6aOl42EO0uyRkk561eExtPThn8BsJeQuA5dw==
X-Received: by 2002:a17:902:a98b:b0:14f:ae28:c660 with SMTP id
 bh11-20020a170902a98b00b0014fae28c660mr4309588plb.94.1645406907621;
        Sun, 20 Feb 2022 17:28:27 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:27 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/19] python3-pluggy: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:45 -0800
Message-Id: 
 <d6f96d57d94f0b3f16329cec291ea2e5884c08b1.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162008

Upstream provides a pyproject.toml which while it does not declare the
setuptools.build_meta backend is compatible with it.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pluggy_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
index 14a7ccb0b0d..73bbcb02697 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} += "${PYTHON_PN}-importlib-metadata \
                    ${PYTHON_PN}-more-itertools \
 "
 
-inherit pypi ptest setuptools3
+inherit pypi ptest setuptools_build_meta
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.30.2


