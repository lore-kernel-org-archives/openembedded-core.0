Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE26C00528
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 13:56:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.47791.1690207006884860857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 06:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Hf2ONUWS;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so41941835e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690207005; x=1690811805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwC+mQm0zUXQ4kcyOYkMquOAdweghySIG4k65tvyMzg=;
        b=Hf2ONUWSFM50oOelyX+OD4HX5pl+ygk8V8wydPbpjsxAdWPu0sSVw6bHmLSTU0Vpv4
         hl9KDDVc9jyspD/fgTRA4pg/3LLoznI8drPKkP3d5kfYrT8SrhLfvntqxDOsPJWEUyrS
         e79gmUwfJS/hMg/Mu+M2wUOB+yffe+m60Z2mKsfRH5XfbG8IsWzYephxU4/P+LfSA3BT
         SHdELynE+2lomlfHI4XM2dM8Qd9wCVUaUzqFiYPUlQPjqMv0Ym922VfoRX27ZA3IUfQs
         TmhNfHFpZeH/PypHLMMNy3KJ55DjtYI9+sJVOJFR9ipnVJk/NXwr0QrWYyzH5kl7kWpA
         hW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207005; x=1690811805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwC+mQm0zUXQ4kcyOYkMquOAdweghySIG4k65tvyMzg=;
        b=LgcvsBMEbGfCYlx3RgKSlMthuXIObGPmi8UgistJlX9QUc1SlCUDMus68wl7ZfE/6D
         bem4Emh0xnEBs9hC/40Lxi5vwM0MuBMTOSIEFkwC0vbSP6u/GtSpooLIGrtafBu0ZC3n
         a99FPHTT/dC1UNI/3mxojBOwjd9NhPKGkeckDdfe71J8aZLgrsP62AWcZSAyRO+d9VcV
         giPur/mdRtgFgYk/sazGOlYZONq4/g3Rl+5zfpPzFjSwC5mg1tdcxu9JCbdo5F3GD4Ky
         Pg1V5IvCkgeS53l9/dI1loDOG2pake1+R0pcrZTJUPE6uFNgK79ilWzfKo3GLXYPfl/u
         7o3Q==
X-Gm-Message-State: ABy/qLZ6SMJpRxgo9H01MpQgRBy1oViIGwHednY+0ENQP9EdWpFqwoom
	NTdcmJO4CzACdGMgT7PC2zR5qXvy/VOfrqol1fdLdGk3
X-Google-Smtp-Source: APBJJlFfXQa7mmMXjVUB2VDzQSBxQwW4UCn7vTV1xpT7WLhdkxIr2iQm99Hrdf3rOXeYzt0QNxoH3A==
X-Received: by 2002:ac2:5059:0:b0:4fd:d32b:2338 with SMTP id a25-20020ac25059000000b004fdd32b2338mr5023457lfm.23.1690205526389;
        Mon, 24 Jul 2023 06:32:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q11-20020ac25fcb000000b004f85d247069sm2201560lfg.218.2023.07.24.06.32.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 06:32:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] mesa: enable swrast Vulkan driver if LLVM drivers are enabled
Date: Mon, 24 Jul 2023 16:32:01 +0300
Message-Id: <20230724133201.781898-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724133201.781898-1-dmitry.baryshkov@linaro.org>
References: <20230724133201.781898-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 13:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184789

The software Vulkan driver requires the LLVM to be built. Make this
driver enabled if the `gallium-llvm' config option is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ade097d7cc5a..79a1d975bf75 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -106,6 +106,7 @@ VULKAN_DRIVERS:append:x86-64 = ",intel"
 VULKAN_DRIVERS:append:i686 = ",intel"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
+VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 # mesa development and testing tools support, per driver
-- 
2.39.2


