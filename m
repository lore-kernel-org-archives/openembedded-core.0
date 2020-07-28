Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.10858.1595937985642106014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 05:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison-systems.20150623.gappssmtp.com header.s=20150623 header.b=vs+yNvkQ;
 spf=none, err=SPF record not found (domain: madison.systems, ip: 209.85.210.195, mailfrom: matt@madison.systems)
Received: by mail-pf1-f195.google.com with SMTP id r11so2950644pfl.11
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison-systems.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ryQ9oPxj4H3rvjoxhI7KvrWpv4KUz6IthivPjC+ddzg=;
        b=vs+yNvkQ9UhAkmJwOiQ+zTVoK/cJk14/b8yiZeJgcSM2ffR3sw1x43WxXj13kBnMTF
         OliN9Oioftw5wz5CSXiJbTIDdSbtplNy5+MAZP2s0t5bk58jfjUnzfsJ3oEgdBVMmFdt
         FwKyoKTnwywqCaNG0Vj7t2+J/IwYEu3LFRyGpBTk7ESHIq45T/S2nNVt1CNfRrcZc5Lt
         QKBz9ppkyC7UfpdeD+j8QPw7NgMROeOqD9ylSzdjRgTHRyubA0lCfooqnaDbm9chcjwe
         D9W7QtHHtkeMBAKudwjkqL+/1/tbDpTDTZRTdvdrbpT+QLeqfzYAOKvrzTOuvjcXwBoW
         +o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ryQ9oPxj4H3rvjoxhI7KvrWpv4KUz6IthivPjC+ddzg=;
        b=lG2NgtVS8IXFRN/586ci53V7/dBgBGIe/3DKmSDf+hi98XXCEv50M4w2x0t/Kv5CyS
         k6muMnmpngrIYUgdnvxkVUdvwXj3eOHq1k3drXN6Cxdexgi+hIzjFcTIRpA53FGq2AXF
         Gn9b9taTbzk5WYBdXZZ+tjAaZ6UKpeikURifm1qpvmtWK6uu+8mYM3xrnATUPy/ECON0
         jCPnh4o3IDvM0jwoXb6m2KF/VR4xPgyojgF7QuraZ2PsRiCaYWOzsTBX4LcDSYSvf7CQ
         xRSgCTJwhd0oD56dFNuaz/MYFNqxx+XPRxcifF1bB9al/G4VVASDiw0cJohr5NmlpyGa
         l2Cw==
X-Gm-Message-State: AOAM531fB1ciTgA/LksSkL1WiaEPKwX2ydQ5kQHrqhmNzKe//M9wTcIk
	3ZsdqScMTlS6yaI5ZXOu/MxwK4uGhCLg1g==
X-Google-Smtp-Source: ABdhPJwWkzxScD6ujLbICb3QciZEdkqq4emUKhP+vvA9e6Xd/s+0Lx+psl3z85dJPRB3b0843YnufQ==
X-Received: by 2002:a63:d30a:: with SMTP id b10mr23630660pgg.430.1595937984417;
        Tue, 28 Jul 2020 05:06:24 -0700 (PDT)
Return-Path: <matt@madison.systems>
Received: from legion.athrat.org ([2600:1700:87f0:9cff:d880:5c:3d27:f52c])
        by smtp.gmail.com with ESMTPSA id k100sm2812996pjb.57.2020.07.28.05.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:06:23 -0700 (PDT)
From: "Matt Madison" <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Matt Madison <matt@madison.systems>
Subject: [PATCH] cogl-1.0: correct X11 dependencies
Date: Tue, 28 Jul 2020 05:04:40 -0700
Message-Id: <20200728120440.1286163-1-matt@madison.systems>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cogl depends on libxdamage when configured for X11 support.
A dependency was added for this in 2012 with
959a2f6d88d8fa6874fff83b7a1f0e7d4e36b887, but that addition
was lost when the recipe was reworked in 2013 with
b508fdd2b19ca30da8d09caf646897dc4cf195c8. That commit also
added a dependency on libxi, which is not actually needed.

The missing dependency doesn't cause problems in most cases,
since mesa also depends on libxdamage, but when an alternative
opengl implementation such as libglvnd is used, cogl fails
to configure.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 1c5d0b79cb..d581ad1c04 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -21,7 +21,7 @@ EDEPENDS_GL = "virtual/libgl libdrm"
 EDEPENDS_GLES2 = "virtual/libgles2"
 EDEPENDS_KMS = "libdrm virtual/egl"
 EDEPENDS_EGL = "virtual/egl"
-EDEPENDS_X11 = "virtual/libx11 libxcomposite libxfixes libxi libxrandr"
+EDEPENDS_X11 = "virtual/libx11 libxcomposite libxdamage libxfixes libxrandr"
 EDEPENDS_WAYLAND = "virtual/egl virtual/libgles2 wayland"
 
 # Extra RDEPENDS for PACKAGECONFIG
-- 
2.25.1

