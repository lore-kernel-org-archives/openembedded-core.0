Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B017C43217
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.5696.1645406902565546260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BefP/V3b;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id qe15so13615509pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RtcFMuPclQ4DUz920xLyzHC54n4w5lFOmmvPeqnMHeE=;
        b=BefP/V3b+zd7MT2WLg1Z4lGY/7ulrollSgd/VE9NmcPiTwLiZNrcj5fxNQt/otnnmf
         03YGUmvUgVpHJyq+YFrK/FqQwZc8lUv/42v4/ACzW4pRhYGL07y0Z6y/eyRw5MSGgS4A
         acSO7gSD5FIXy3osMFb8qP5C7B+InEm7SK8sPt3UUbOs7AZp3u0JkF8pRp/MvTNJ9jYk
         68TwCRHB+pN0bNlt14qmg/9kXs+3fnDSmXk5p4q0H75bQ5um9VR+wkAhYdm+zuLGekWr
         rTT9a6lVd8ELAyItJxAA0edI+B+ThvhaV5hH8FBSgHFHfrek+2WZOyx9qCUFgyF61ceo
         CJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtcFMuPclQ4DUz920xLyzHC54n4w5lFOmmvPeqnMHeE=;
        b=iAArUENAxYLUi4otqRTGLbc0RRnjbtb1DRyK3TUmCtXkfZ0TbO3/yFPcmc0CDJXD9Z
         Sigwo8uex51O1Su/9GYt6v1h/3rW1QMu3ylFEKg6zbcAZ54cXVyZKpNiQGz3PuiI2a/j
         Dn8i8E6cg52rJM7RpCV67GUW2Zb0RjAQvqPytFiSAYKQqtgyvPxxvLiHqjFlAq7/bi94
         H9kGXE0hxUoLOSdo20DySxCgogTpe3b9McBD9FpnBofStfQykgIsX2LMJz8CBad+vw95
         l+qtP483lnxqGGG1DIv7ThxamxAnmhxVd+/XEp9ls7iueNULNmTzn0y+Q0Xvukgz/z1l
         rEKQ==
X-Gm-Message-State: AOAM532cbBRO1btruehQay7F+SO9OC5Em51zJcj4vu6jgt6dHDvpp3ds
	//jZD1pY1vrS8VTztcDQnMApwtCowgWIVQ==
X-Google-Smtp-Source: 
 ABdhPJz1p3iY6/3wK7bUc2aotk8Xx5bXzbzrbAP0SxsQnZzaWbLA/2BYLqWAvvUlV800ubBt0rmlJg==
X-Received: by 2002:a17:90a:2c0c:b0:1b9:fa47:1caf with SMTP id
 m12-20020a17090a2c0c00b001b9fa471cafmr19229199pjd.34.1645406901699;
        Sun, 20 Feb 2022 17:28:21 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:20 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/19] python3-zipp: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:42 -0800
Message-Id: 
 <1196c354c581fa0db267a349ee837b304e80aa09.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162005

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-zipp_3.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
index 9ce987c8702..d0f936faf7c 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebce
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 DEPENDS += "${PYTHON_PN}-toml-native"
 
-- 
2.30.2


