Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94459C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:52:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.9435.1646754777955266701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U9B9ki+z;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id 9so17437716pll.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 07:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+m1oHeIDCRMVqLxCFYno5sheYiVACgrIrcq2nPJeIWI=;
        b=U9B9ki+z3lfeyogPw5Th793Vrzvqk5Ugwhh0PPvy2zUriEevdphEZ6VEdfNUX1e5rX
         1rC66jXWhpL8lsBphfKTtA574FZSmi48b5Izo0hrHtbA9DezzmUKip62IZocnhn1ntmu
         HZyoJCC5sMNQQBvI6hDIexMZuFhErDKbZ9B2QYw88F7Cip/v9v5z3YGqM9VEZb5cei5A
         +FCXwBV1q2JrokzjfE53001V96CaL+8rhKpJAbPhdMQSPE2i1XaFcri7QO6kfP7At+pD
         lvWsARV8+47knVl3J5wjmTyRd++NOizdGEq7APeIJepXMQKTHNwB00uP0K1wmFD+feqh
         NpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+m1oHeIDCRMVqLxCFYno5sheYiVACgrIrcq2nPJeIWI=;
        b=eavnY30bHOsZLzSFneq/KuJGnCTjdvjilRo3KCBPdiOkoZYL735rkMii5f8LS9F/l7
         VM0IwM76zRHje+QbQtOeAlqytjmZHB1aSYsLYngWmGZZGsm7+03cA079D7R3uFQfXzL8
         973glayQzt+ebcf8jCX76BQOonIL3Vh61nQAkJLd0rA2TXs7MxM6zsAjKUNVE5oiKWNE
         fV51ym/nOKAJ8md/AqJLbA0Bct7EuENclJg974xj+VrFhRGXHbn1A+8D2bgTAJYT50RM
         pToJcatKRzmYeJX/wOUBBqrN1bMwrT1SjeHXDdw1HfAa2L5d/GRyHPRSNS7JLgi0jLj6
         6xVA==
X-Gm-Message-State: AOAM531vdf82qBzF4w31oQA7DDqNDaqdSAwirH+FKp0DDFnXeONyMNsm
	N+rfGMlCM1+hPAcG7xCi8ZDOFt7/Ux5iAw==
X-Google-Smtp-Source: 
 ABdhPJwhiAk+FTx3QovHRMLbY2o/qdyQPrCz7ewhF1y2Z4N+epSMd2c4NeHLalF8RchwnDO2RNzMdA==
X-Received: by 2002:a17:903:2308:b0:151:8ca0:cd8d with SMTP id
 d8-20020a170903230800b001518ca0cd8dmr17966263plh.119.1646754777179;
        Tue, 08 Mar 2022 07:52:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm6559106pgn.35.2022.03.08.07.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:52:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] piglit: Remove virtual/libgl
Date: Tue,  8 Mar 2022 07:52:50 -0800
Message-Id: <20220308155252.2454464-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308155252.2454464-1-raj.khem@gmail.com>
References: <20220308155252.2454464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 15:52:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162931

virtual/libgl is usually provided by same package that provides
virtual/egl by the stacks which implement it, removing virtual/libgl
means we can build it on stacks not implementing GL

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 865eb4c272c..3ae7a14e465 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
 X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
 
-DEPENDS = "libpng waffle libxkbcommon virtual/libgl python3-mako-native python3-numpy-native python3-six-native virtual/egl"
+DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl"
 
 inherit cmake pkgconfig python3native features_check bash-completion
 
-- 
2.35.1


