Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.8304.1618498774708003080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 07:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id h7so18380740qtx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=OMhzt9nAJOZ/veCoXmEaPl0h2LdL+145lKYSdqHh/DU=;
        b=s2dbLBZZrvvScj9sAGWFZVQR0vFgrLSZZ2OawywUJXD3m19N8EHMYaZPMsq96rCRSC
         SacFvNBRHPNzSOGHYqghiCZmury8EEPHp9gUXpK77pB3U9AXtuFOVmVhOWXyWDIkjd5O
         TtrxSHG9DIh5nnpTfBGQMYFet3oHA/HqgBGrUBBAb3YsAY3rUqtRrWNtO/gLvA43FZC0
         4e2Fuu4gXNOVQxqZjEnuUAooAx4uj2bWghmbEMGzTYStQ2DbOsC2MIbfd5eSSjAxpSbH
         YPZPS/otxVtcrbqCV6/yjk74J2cYLm+U9IUC8nhmrkUhRZd2EJhLVALOIwFHgXKKxjq6
         J8bg==
X-Gm-Message-State: AOAM5313NaurhcPSGXHFT+ukUxLLyG7zTR0V6T3+30u7gKC5xJelGa8W
	0oaKrU66NzXbl8tACGrDkRETknA7bmJxNPAZ
X-Google-Smtp-Source: ABdhPJw0iy044BJrsx0WpPgSNXlCynGhGI+yfBZ7zSA1Tgo4OxOl1dNJtRuUhMSCZH9F/ThHTliOJQ==
X-Received: by 2002:ac8:1183:: with SMTP id d3mr3383149qtj.390.1618498773537;
        Thu, 15 Apr 2021 07:59:33 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id r1sm2114928qtt.3.2021.04.15.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 07:59:32 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] gstreamer1.0-plugins-base: Add 'viv-fb' OpenGL Window System option
Date: Thu, 15 Apr 2021 11:59:28 -0300
Message-Id: <20210415145929.2007522-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

This adds the 'viv-fb' PACKAGECONFIG option to allow Vivante GPU window
system to work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../gstreamer/gstreamer1.0-plugins-base_1.18.4.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
index 728a99e08b..4621d9f198 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
@@ -65,12 +65,14 @@ PACKAGECONFIG[egl]          = ",,virtual/egl"
 PACKAGECONFIG[gbm]          = ",,virtual/libgbm libgudev libdrm"
 PACKAGECONFIG[wayland]      = ",,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[dispmanx]     = ",,virtual/libomxil"
+PACKAGECONFIG[viv-fb]       = ",,virtual/libgles2 virtual/libg2d"
 
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' egl', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'viv-fb', ' viv-fb', '', d)}"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-- 
2.31.0

