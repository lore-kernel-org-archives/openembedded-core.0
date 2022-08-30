Return-Path: <andrey.konovalov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46409ECAAD5
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 19:25:16 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.16141.1661887510030889979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tQv/NPlg;
 spf=pass (domain: linaro.org, ip: 209.85.167.46,
 mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id bq23so16909834lfb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZsQPf/pqae9kHwNYTOzUN7sxO5hVvyWWz14mOkHCOXQ=;
        b=tQv/NPlgMCPswUaTG20MiVbIJCjSGT6mtZZjmI5XykoXcH2oewd3uUw3qXAdwDwW4N
         cHfkfddPZxUsuNBh2DNTyc3qKBTO88rz9UQBDYff9cQT3lIywnLoBiJLunzMil25CdVv
         U89zY4AU//Fb7yhR2+JMxySrBi1TtRX5ezqADpS3HkGk4ERs9t/q2p9p363HOq91UIEl
         TVZ9Wh4gsJ9UiHUbcDPzpJhGML0ZMOr+Y6FXn6IiBBcWBlRMB0WxcfIWub2NrdCs5Y1a
         mnVeMJOfnj6n4ojIRu6O4WeyeBJI3odVsGxk1qRXLwYzoz7i74eOeUBRP8txpqV8rO9U
         xQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZsQPf/pqae9kHwNYTOzUN7sxO5hVvyWWz14mOkHCOXQ=;
        b=WaTLte8mPul70aqjq+23m1/MRhRraOz+OkbaI5AL1Wb9LujuFD8ZGbnSkXRaVED9SZ
         QXgZqsOAMOXjSIM/byp/dNaVe4AbI+FFdaQj/gIJJdm0xI6iYRVfRfGJKHojcex4W81O
         TyK7bfxvrXLSVLrv3l5swxVj7fjiWK8kpYXKza3xsSY/NfLHzA+0A1KwwXDGfj9DLIkt
         Y+2YW7BLvArCnye3a8iMTs8oT0SilZ85vmS897R2dEqDV6ElyfCjcUND8I6Jkf9QLZAO
         hWmjhT2bN8Lpz77DkBV+FO6wRUbmft9d6nFTUB6uJ3CeOQ7v2JaxXHsWDkMOZZ2aCGvO
         Vkdw==
X-Gm-Message-State: ACgBeo1BIRZaMn9gA2RDc8e7+sipzC/8RBIvokcaNMUFjEywRzHb3f9Q
	Hbc775LuZaVqpkurpSFr7A34hvxomOzuvA==
X-Google-Smtp-Source: 
 AA6agR7rIWKOVLUAcVrwZNdKcT+q+nlWWtpkVYgjFnF1DbD9OA7OjHrQFBnIUutjz3esJ+wKmVRaww==
X-Received: by 2002:a05:6512:228a:b0:48a:fa84:e298 with SMTP id
 f10-20020a056512228a00b0048afa84e298mr7638489lfu.183.1661887508266;
        Tue, 30 Aug 2022 12:25:08 -0700 (PDT)
Received: from localhost.localdomain (78-107-207-230.broadband.corbina.ru.
 [78.107.207.230])
        by smtp.googlemail.com with ESMTPSA id
 o17-20020ac24e91000000b00492ef074fc1sm1702118lfr.183.2022.08.30.12.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 12:25:07 -0700 (PDT)
From: Andrey Konovalov <andrey.konovalov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 2/2] mesa: build clover with native LLVM codegen support for
 freedreno
Date: Tue, 30 Aug 2022 22:25:02 +0300
Message-Id: <20220830192502.296267-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830192502.296267-1-andrey.konovalov@linaro.org>
References: <20220830192502.296267-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 19:25:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170086

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index eb7296e834..1e04aff998 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -122,7 +122,8 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true,-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
+OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
+PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
-- 
2.25.1


