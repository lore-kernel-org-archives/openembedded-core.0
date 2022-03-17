Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A7CC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 17:32:09 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.544.1647538328556652895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hGvrsjHm;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e3so5447412pjm.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CcNAu7roNE8BnP7RKZ6l0cWpJKD9ZNYIhpL1aEMVots=;
        b=hGvrsjHmG9fgju4UFqPPlMCUXH10lzYNTXVqLN9PLED8nFML8O/9M+xpgfenVDyLkx
         volRqbdKaVIH7aeB2SqXacr6zxTDw2E7QZUExzq1PpYwQ3yu/qGkMW3efejoc9SZL2nH
         bRt8dg+m4v46St72ZB7J2GEmgDexRmrYwgHti987kBlZymIodJ2jtOnGBcntyfNdsKj3
         zR98uWXgvnKgvwPfeFk0iIceLirhT9zN6ii5qxzBRWjhQfd4yiadKuO0TtlKiulzrmOl
         oTPT8N9htM2VTAdoEszkmVxaVTsrE5b+ZSjAGF1x9PhGVffqPP/FJJ/O0TFJVlIjee1G
         KKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CcNAu7roNE8BnP7RKZ6l0cWpJKD9ZNYIhpL1aEMVots=;
        b=GVlALj88m29aNBejTOHXAEDySFnNiA7Hy7qrQ1mKveK4sPkvMHh8IcOAJkgZdJdNA3
         3/YUdd++suXRS1D/ZYT5SiB23I66VtCeNmxOmc3vEaDMvNgph/TcJ2jpvXpo5UmYdzwq
         D3yK3iO/wNQFwMI2QqgcL5f2opk55XQ3DQgAa54z9xtQteuq7pGW5W8Px6sxJAiOj8Xc
         qyA5KJOL+95/DkY2BhkfeyTHY2oznfsTdJmBmgt7xfSluKjbtOG9+XPYdO42sndzMsqY
         GkzKmEDwgHExrNy4TFeKjdqABQZIdBng9eDznTTNGAZaoT4FYDJJB44mPhZkGSMakE6P
         ZWdA==
X-Gm-Message-State: AOAM533wfXwp+soMymAOXynXgx9MT9U8LmbENB1T9S6EUaspg5dywIiD
	AKpRJbT1rBjNTtqmVTgwoqJUhg8L0GE2Ng==
X-Google-Smtp-Source: 
 ABdhPJwVTg/NrQQudMLgpQGX0cjCji3eU8U9S2xtmH5dxms70lisrE8MUwbGy8WPJq7pS/H1Rtcizg==
X-Received: by 2002:a17:90b:3e8e:b0:1bf:489a:930d with SMTP id
 rj14-20020a17090b3e8e00b001bf489a930dmr6692129pjb.214.1647538327447;
        Thu, 17 Mar 2022 10:32:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 pj13-20020a17090b4f4d00b001bf2ff56430sm10759189pjb.30.2022.03.17.10.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 10:32:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] weston-init: Use pixman on riscv64 qemu
Date: Thu, 17 Mar 2022 10:32:03 -0700
Message-Id: <20220317173203.3443742-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 17:32:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163429

Helps boot weston/wayland images

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index c34582137db..20698b1020d 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -15,6 +15,7 @@ SRC_URI = "file://init \
 S = "${WORKDIR}"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG:append:qemuriscv64 = " use-pixman"
 
 PACKAGECONFIG[no-idle-timeout] = ",,"
 PACKAGECONFIG[use-pixman] = ",,"
-- 
2.35.1


