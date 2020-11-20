Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.748.1605893802933706803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id q5so9606266qkc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=x1aTuxvT6p4vyDeO1LBM7Z2Xd3PRFkySvLU62kdyo1E=;
        b=iLdNfod+oqCAG+rZJT+lAKDk0TkzYgc93mO0JyhMcRqaS5j2vJ4+PL7eD2/M+ko7jn
         3+yWqlJFjNg1k3JIJZ1mFmSO8QnQRBsirz4E/kLccv2YI5pL2DyY2pKqe2JC4+LtR19b
         FHcwKO/T6A7VuDP9K54rmFOIN/5hhLEFy+gfLMgyEi5+niqDN2J+SxNsm1A4Vz8tKQ+K
         XXzmdH540+yif1neyUfjWo1ByRzCK5rMCwNPTDH8yoE6GtbIFEA6lleILNWARmYTOonu
         kcOFgkBywInZqKSGXKCuk4AkFL2D3qjavQ70adrp0TnbvqNd85g22wtwbwZIL6tutzUo
         f8xA==
X-Gm-Message-State: AOAM533XVtNj8Z/OYoQKaLj89ho7PCPmaqm61PiZzqdnLtavOYaNOUcj
	ra81VzmaJu0Gi/ewpA4G3e0+7lzpZOH0Xw==
X-Google-Smtp-Source: ABdhPJw1xTcnCynn5w8wOWrxvYooXxlTAb+fOp+u6VrZFHRJQCdoT9auntiwmCzKVFKebKDfKEzRGQ==
X-Received: by 2002:a37:4758:: with SMTP id u85mr17148575qka.274.1605893801760;
        Fri, 20 Nov 2020 09:36:41 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost (191-221-68-106.user3p.brasiltelecom.net.br. [191.221.68.106])
        by smtp.gmail.com with ESMTPSA id l46sm2535252qta.44.2020.11.20.09.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:36:40 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] gstreamer1.0-plugins-base: Add 'viv-fb' OpenGL Window System option
Date: Fri, 20 Nov 2020 14:36:29 -0300
Message-Id: <20201120173630.1296722-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

This adds the 'viv-fb' PACKAGECONFIG option to allow Vivante GPU window
system to work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../gstreamer/gstreamer1.0-plugins-base_1.18.1.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
index 8e3ff21c90..8813b8faca 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
@@ -62,12 +62,14 @@ PACKAGECONFIG[egl]          = ",,virtual/egl"
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
2.29.2

