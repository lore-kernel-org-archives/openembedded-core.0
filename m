Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA159C43219
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 13:50:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.8218.1633096244621447771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZddEzfBo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 a131-20020a1c7f89000000b0030d4c90fa87so1585416wmd.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7rTiHDK5pryr0pmt8w7RV1b3cgs75kLWcDBWCNK0ITs=;
        b=ZddEzfBomnfw9wmMRqNmmbgfefWWkavcLM3EUaxFaP/iMAfrHDsMXTwx+Mz22MVeMF
         qW+rsBYJndelhTTJPU4n0J0KXPyxQsfkrXe+yXCqocQ7kLfWUHieFDexBRJRKzG4c6bU
         LtJPa6GECdesK8+Ef5phx5TkUEIvFH+JEBTXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7rTiHDK5pryr0pmt8w7RV1b3cgs75kLWcDBWCNK0ITs=;
        b=QFpiLpxBEMEa51LzETyL6xfsb4fuuKraulZDvWFNS0Eo3FF6ING/QG2/GfHFXOlm8l
         d848E4X7aoQrk6e9bgSkXQIQQGRWW7/2C/6ANqTs3lW2Gz/6REb3CNv1eYexur21amcr
         SEvw/HUXE4AGgI7izknTOxMgwcYmh1Kf6gqzyJCNLow2Oh+rdbYzMtR8xkWafqeOhTjT
         pml+n7229wkWfX9U+E7IhvIM/DiJlC0Inok+41vVAXVD2nKfZEKGB9D+zJ3xB0VSpi+p
         jcwxE3X7cAk7M4IpPnX/eohckWtH6EieMmjvkp5YrZmnm4dmbc34Hzh3qWn6ynrGxpdF
         080A==
X-Gm-Message-State: AOAM530EohfGxz4Wp3V7xEr9qNdFTputnhiOr0ITWbW9Jfcu8kUjaOap
	G76fJmfx0Mi8P6IxFmLHSap12e+msTlsomu3
X-Google-Smtp-Source: 
 ABdhPJyLx9APtnTigYifkd8gxpnE3L4ttiOGv097V2uwX6SNW5zQv2mb+nNkLntHddPWOzt9/AfLZQ==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr4606056wmc.15.1633096243098;
        Fri, 01 Oct 2021 06:50:43 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:415a:6029:9a90:9863])
        by smtp.gmail.com with ESMTPSA id
 o19sm6193155wrg.60.2021.10.01.06.50.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:50:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] mesa: Ensure megadrivers runtime mappings are
 deterministic
Date: Fri,  1 Oct 2021 14:50:35 +0100
Message-Id: <20211001135040.2251283-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
References: <20211001135040.2251283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 13:50:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156520

Add a sort to ensure the package dependency output is determnistic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0a7a3ca7bca..282671d30f3 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -257,7 +257,7 @@ python mesa_populate_packages() {
     import re
     dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
     if os.path.isdir(dri_drivers_root):
-        dri_pkgs = os.listdir(dri_drivers_root)
+        dri_pkgs = sorted(os.listdir(dri_drivers_root))
         lib_name = d.expand("${MLPREFIX}mesa-megadriver")
         for p in dri_pkgs:
             m = re.match(r'^(.*)_dri\.so$', p)
-- 
2.32.0


