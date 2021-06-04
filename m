Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.6021.1622798104432115700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gxPXq8P7;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id g8so13477151ejx.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LjrjUI75npg8jShRgKiRm/zQ2KRRjaW4Y/h6yhHWJLI=;
        b=gxPXq8P7F3aOM/Q6jbWjuJ3xAa73FaJIcsidkK/3vNi4GQJkz9izFxBSGkP1bRLDep
         F7LiFxNNTQCG54o8rYiGp+HwsLCojApxKHKIFeL0Mh01zI+P+bcNd58B5iIeTrGEJiAe
         bnHX6jgqUfzS7K/6l86dNp6TCE7owFoTvAEMNw14HcwEz7qKudaUgmqkNe5u+eJoZOSw
         IzIt7PwHYI5foWdiJ8fbRGazXmBbv4umEE2PYqjwPyqWGueiW5kbU7baaL0jShfxQiUR
         BdsgoVVbRFQw+BRWG3J9KysNmgN0y4pGBbWhDwoBl0zAigGFtRZr3Fb287I/hUQkR5rs
         rcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LjrjUI75npg8jShRgKiRm/zQ2KRRjaW4Y/h6yhHWJLI=;
        b=Kn5gSec3DE5qjgNg0WC1VmiM+0boPsfknfNu+tiYaiyFyzGCSehAJAYAPAyn9WxiVK
         XQhejqfduSTKQyZqpvN5wl3Quyj7oUC8Onf5zj9k59G1NEmDsEQv8vomOrPH5M77Umln
         U5Xh7JhekbtdrdzIvOgkYnvuzSg7+P3/xfn9eBw1zk7nt86gK4k8tBn9Fof/PSduVQE1
         Bgha2lVo71pfz85vPe0XsaBXoCMBpXclU5Kyzs3p/Qv1z4/tPnJuFnOza3JlLTQDSgK5
         Ftx5T4jTtyLEFJ7i4K+hULr0DZN6+krOEp4QoMoeRwrxR72c5lErtb1pS0QgtLtElrYL
         kXsA==
X-Gm-Message-State: AOAM5339nrrJEEGLKHxyXp0Y7AlmF409j0cnqj03/n2sijc3QCVj2ZKx
	Ya+l4O81dSNdjgyc6gklKbmzIjbkMja6Cw==
X-Google-Smtp-Source: ABdhPJxxg3VfXR0fsibnOa4rpGNNMtcDeV2CSnr5+u391W7jBD3jvEUAddctgZhmHEGhw2BsYiLS9A==
X-Received: by 2002:a17:906:4341:: with SMTP id z1mr3343121ejm.422.1622798103060;
        Fri, 04 Jun 2021 02:15:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/10] virglrenderer: explicitly depend on libgbm
Date: Fri,  4 Jun 2021 11:14:49 +0200
Message-Id: <20210604091458.1381144-1-alex.kanavin@gmail.com>
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

