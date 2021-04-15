Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.2082.1618530195766605332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 16:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id i6so9967989qti.10
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 16:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=sQqA2uN2RWXkbhWuBNEWBVDZ7iCv2oivTWvDaXobk1w=;
        b=CniNAuiPdLMOKnELZCSVoUKplwd3AA4FAvCzdDACo7PsIdCS/Z721Xslt1VAW9JfIl
         BzaUUVzPQbDX6nlrBb+y5JRniAX9AoyQ8ReGsvkPWUKw45O5zdLF7glrw5gKjduAFAQv
         ZeC3MOJx2kGFKOLWwhYzkb/CrWt4tOi6Lzua5jsveSzigHSJfnYEyDVyMjAjhUpLia2+
         lE/Tr18U3XrhInjYa1L0pwUA/BjjRaddCrR1WGpx+8k11nsZUq2GxzgY+Ib3yMf2rAAS
         kfNvxi7EduIM1+h3MJCtrduYDZY0n8q4M7jk4AS+8Xs6BYj5xo78S1qOgcY8cEOR5tzb
         LARw==
X-Gm-Message-State: AOAM531RxdKJ8pQE2UHkmdiJ50lgUwWKl+NyoFSo4VCMzQOgoF6lK2s3
	xbeAkjBxd/Xo0GL0QZBbttD54xN1v5UYwTqp
X-Google-Smtp-Source: ABdhPJzXfZyJqt0VlYVIwB5rhyEzx5yZV8bdxJWlJY+Gcp1OtIxr0nnF+NYbEm8WDjpE4ZqkA42wZQ==
X-Received: by 2002:ac8:1288:: with SMTP id y8mr5530800qti.231.1618530194674;
        Thu, 15 Apr 2021 16:43:14 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id k26sm3139909qkg.120.2021.04.15.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 16:43:13 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/2] gstreamer1.0-plugins-base: Add 'viv-fb' OpenGL Window System option
Date: Thu, 15 Apr 2021 20:43:03 -0300
Message-Id: <20210415234304.2035707-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

This adds the 'viv-fb' PACKAGECONFIG option to allow Vivante GPU window
system to work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

(no changes since v1)

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

