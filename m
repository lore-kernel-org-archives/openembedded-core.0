Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8918C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 14:12:51 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.48033.1690207969618890129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 07:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nX6rvFE7;
 spf=pass (domain: linaro.org, ip: 209.85.208.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so6263116a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690207968; x=1690812768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4ijDD4z2b2DcSQkHVL4Luq5NJOZdiM+Rkxy3hZO0VM=;
        b=nX6rvFE7CRvHRLgtPqMEbjO78a2v/vuAxBE0Vfi50bnqpzh/nCgV/fIkbqJxmkCMPK
         GpRcGKGj4hV7CeU1hEl9wWj9toTHkDrfbIDU9v54h1748HeZ4MHVA1YLZRAW+lXYPTK0
         3L7DHuSYxNRaDN7BZ/UBmX/GlenEPvX+QoVm2tU+dCegEIg0DGGaCJ+Rav6nc9QSR7sa
         XjBEP75exUqoEBEilNpq1cOgDOMuiEmWncF2FVcp6yQKzRv57w8jbrL8VCiPe7HkUWbS
         dEsL0ds8xn/6u7hFO/nfMDXN0vgyDeuQiE10NEPyUj6O7rRaaAbSEgKPcQLU/ezKowAf
         +4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207968; x=1690812768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4ijDD4z2b2DcSQkHVL4Luq5NJOZdiM+Rkxy3hZO0VM=;
        b=NNdh/MCYH+PpynXnYvxURWDH/fTQSzWtOddOTmEXQW9/028QKU0AquEd6/3MYG5N3w
         WfwiT10rr3YVcNG3UOoK06IFu0uk7st3opbq3I0b1F4DyK6806OUugBTuaFBcuRh2HzG
         9/y6v7zuXosRAFReFSWkFV7yMPHfRp60aW9cZnc8NSCeAF3IGd31EneP3fsasWsUg7+H
         oJOsbNp5qz90yGq41VQfok5/QmcxWBvoKNQoPALqP4hcF5Ax/GEv7zMBYRjg90dJu3x+
         dLuvvXtbbRc1/9tsLLqFnplcRrpm5SUWpX3oZunKPQ7GJbuB+Uotcg3DVoVjplcXE8Ro
         gmQQ==
X-Gm-Message-State: ABy/qLaSzsBdmvk9RtuqVyqcMHKB6KZiALTubpanr0M4xFwvMk2Lwi6v
	n3oKbX6QNioFmiX4w2XnQMeQ8uYDcFA8W90aS4rHvIeh
X-Google-Smtp-Source: APBJJlHTG/CxULEIdof20Edq1xohvJ1ECcLApaxMYyZ2xCJyc6kqI5vVGuVwNy8XY0grMM6iYAFrGA==
X-Received: by 2002:a19:6549:0:b0:4fd:d92e:31ca with SMTP id c9-20020a196549000000b004fdd92e31camr4952569lfj.36.1690201879831;
        Mon, 24 Jul 2023 05:31:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b6-20020ac247e6000000b004fbf5242e86sm2178023lfp.228.2023.07.24.05.31.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 05:31:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kmscube: bump SRCREV to get offscreen rendering to work
Date: Mon, 24 Jul 2023 15:31:17 +0300
Message-Id: <20230724123117.1960113-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 14:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184793

Newer kmscube added support for offscreen rendering, using render nodes.
Bump up SRCREV to get this feature supported in oe-core.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index ca76251d7ab3..b385ff7452df 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,8 +10,9 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "cf4ec7f35521eb54d72ce0c92ce65b2249171cbd"
+SRCREV = "53ea71efe63470cf698726d983e9da5748a754a1"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
+
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


