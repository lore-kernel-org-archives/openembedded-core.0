Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.5867.1622797837796206204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BN3lK2Qy;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id i13so10304995edb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LjrjUI75npg8jShRgKiRm/zQ2KRRjaW4Y/h6yhHWJLI=;
        b=BN3lK2Qy1weXgYdPWWz6tpuNlVBrvXw/haMxs0XjcUOj54pFLf9cintJmNMnAe8jHo
         /KNTiKPKI3L66wCP1JuOOgHpAqYccaTf9+cLT6po7wfILquW0yQTKKog6yh7xP2U12gx
         +dbPqCCZO17XP2RxtLgsNZXWZ/JYOhWCRjrWRwDtlV4FKtcLlZv8wDMEuMLSL2OX0Xmh
         xr2b2zhzBFXkZzySA53KWz59KghCwSF363WX/HDEXe2f+qaMG7xU0945OIXARLj5TXOy
         RfXUL4FxaUnuNTAvz3JEiPgoPxu7qEoff/x5m0Q6q/1iBvAxSKh42GT8fjoWh8npDpEe
         XOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LjrjUI75npg8jShRgKiRm/zQ2KRRjaW4Y/h6yhHWJLI=;
        b=RVuBooU3b8zM1mW8oPoLel8/91W8ajZwl6xmwIC3B3rlHHTHqzNwx5A5xUUPTCur/n
         cjJ1auR9NfJLu3oxHMnG2MhbtOe/Dpqb1nHHxo2+RKNFHBtF3k+WTU/gBtxeDHB263dh
         jt4C0tmwq0gQNqYef5r5ef7LME7TsFSkehbahwJRluifU6LOLpveOOz9h08K8rFeKLTs
         /Bb34e/ZA926UGB9LqrWHKtKtmybRk+LtNd4maZcFwnhMghxHg35WQS7B+Uf/a1SjM4b
         BJGJ9fbCskVHRBR9m31g2D8n7wO+M3ycPvLlYDfrq66pKTe3jEP5+VE9QX0E9OS7JaD8
         fl5w==
X-Gm-Message-State: AOAM5309/DNFFrGch5MTdXDAFxSXMHod3b41xNuKiJsVFoV9UKfQcnXi
	HHUd/RFcHXhhbOVIPqmpxltgivomxxCmTA==
X-Google-Smtp-Source: ABdhPJzKxCvwfxf73xDXoi6Oa1hPfvW0c6q0IDVobibtbgZcMwTt/wCqCCGOPb3OIb3lBPqUOxJX3A==
X-Received: by 2002:a05:6402:1d0c:: with SMTP id dg12mr3612638edb.155.1622797836253;
        Fri, 04 Jun 2021 02:10:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/11] virglrenderer: explicitly depend on libgbm
Date: Fri,  4 Jun 2021 11:10:20 +0200
Message-Id: <20210604091030.1380877-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtual/gl may not necessarily be mesa, and virgl needs
specifically the gbm part of mesa.

There's also hope nvidia will support gbm somehow, someday.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index 3991895823..65bd1af942 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://virgil3d.github.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
-DEPENDS = "libdrm virtual/libgl libepoxy"
+DEPENDS = "libdrm virtual/libgl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1 \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-- 
2.31.1

