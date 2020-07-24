Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.7594.1595601778748392629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U+2V9Iri;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id v4so551058ljd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZllx7RBI72l9lQuDwGpmFUEV6vErSSk+0X4LZ2BWKA=;
        b=U+2V9IriMaT7awkpSVdZB20WlhIYcdIbh/DRpUchX344izWsM7V34ro7lxrSGkpEe9
         gOMpnaKcZ9X1rj/ccZY0UFXJkI7slE4XOLePLbhV0q1OFhXXZBgvQXKXOOOi9t21zUkt
         SRyBxSxIDcQlVZV2vlpyuSS3J1VCCi2p8ZCNUMTUxNlIHCyvW7yfM/Hj3+htnb3GKMmW
         dgffoDzoG1pVHBZ/tDixsFBB2+sBVwp3tHtKg/9zfGI9OBjaZm0UYRSyyximMtbtx9lZ
         Gdaf8rtRQlju1LednnbPbIlo9tQFJP62xroJ1/1xxDKnROxBvLVimMBVTM3pNMeZ9PMo
         h+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZllx7RBI72l9lQuDwGpmFUEV6vErSSk+0X4LZ2BWKA=;
        b=nWEEKUzAxVWNaTq9ASo2DdCbvY2uzyn5VqzvzLgscF0LmMz9eGG+KjfYtVU/VOA8SS
         jYiJX044cYmgl49VBHwjKQX3sUgu1nfn9glBZaWKHa51BIC85s1U+7M+xjXZvQiRZyYz
         fGjuUVJ+ko8xzP+8/ia9N2q/tOPAW3KyOqqcd7xrVBFjHiiRHEAPWSmgO8vP6DZT+UKV
         W2UcAi/6M4cs3nGNXH7VDD1woLFvrj/QCNHbL8FR5HdCfGPbNU/cBP7IRvzrTWU8wBFU
         csixIef4IeLd02TgaBzOcbkU0GHO6ftycILfZV/ZH0FtRlHz5oM1OYzbVeGgZar/WHn1
         XgHw==
X-Gm-Message-State: AOAM530qwOZNW8pJ6tPFP30nquvl84Yx+PEUwU0G7mB8R8oD4e012GWz
	gTAXvyrL88FytvuQhDOdaT1BJHp05GQ=
X-Google-Smtp-Source: ABdhPJyQNUbb4/MX0XTuL/D/5Vm47cbZ6Ty1/iejl9X1R4EbqPcTKCZ79neAn+EeDG5D56KHJBFutw==
X-Received: by 2002:a2e:5141:: with SMTP id b1mr4155442lje.336.1595601776344;
        Fri, 24 Jul 2020 07:42:56 -0700 (PDT)
Return-Path: <dbaryshkov@gmail.com>
Received: from eriador.lan ([188.162.65.229])
        by smtp.gmail.com with ESMTPSA id x22sm284511lji.133.2020.07.24.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 07:42:55 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] mesa: enable freedreno Vulkan driver if freedreno is enabled
Date: Fri, 24 Jul 2020 17:42:53 +0300
Message-Id: <20200724144253.4030969-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If freedreno is enabled in PACKAGECONFIG, enable respective Vulkan
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4fe5f025ebbb..6fd92035f02a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -121,6 +121,7 @@ PACKAGECONFIG[dri3] = "-Ddri3=true, -Ddri3=false, xorgproto libxshmfence"
 VULKAN_DRIVERS = ""
 VULKAN_DRIVERS_append_x86_class-target = ",intel"
 VULKAN_DRIVERS_append_x86-64_class-target = ",intel"
+VULKAN_DRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${VULKAN_DRIVERS}, -Dvulkan-drivers='',"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-- 
2.27.0

