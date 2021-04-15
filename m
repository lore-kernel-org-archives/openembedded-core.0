Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.8306.1618498778176375118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 07:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id o5so25503785qkb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=nrkkDqyBkYizIOhAc+9S3M8pQ1MwGdGq0tAV2SO6L0k=;
        b=bUOqjjb43/R5ySqirtE7kJkBdKx8LqFg/6l/SsA/68e1w4MKDxbsX2QyL+Qen/JiRs
         SC+nK/T84h6nDVv6n+8C1u2ajD1VrdRVWNPZmX8UF9PyYuQGyT5jDnA1ZI13mJ2TrNj7
         UEWes71U1mmVBGuEONZKJPbdyGmtiE8rlq2890DDiOXEzfDR4+Eu+2av19istT43AzNJ
         zDZZ2xfMW+U/dzYgCYlzPDbrCnys+pnwy98QnV4xIKU71XsQtDG8SxFd9IBBik8KUqLs
         iVrTKgH5iiwtO8kdv0Kl7WhN45i+xi+lyYa/5l/yOIAP1OoW0f5pzSwIafMgwMtz9En/
         zPzg==
X-Gm-Message-State: AOAM531JTvYejrBGr2ltHanJ/QnSDJI6MoQB8qHaL6FNR3uf22R05Xkw
	p5zWUNL/Ae0FrRY3qS+sKZd6E9ZrjPzv7IF4
X-Google-Smtp-Source: ABdhPJwfuZnJz0+WSNRNGc3bvn9GQqq8GimkAHsHs8IrDLB9uoFS7Ivs0Bd8EKazBZG7n5kp+bTbWA==
X-Received: by 2002:ae9:e858:: with SMTP id a85mr3835861qkg.214.1618498777044;
        Thu, 15 Apr 2021 07:59:37 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id 8sm2134886qkb.32.2021.04.15.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 07:59:36 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] gstreamer1.0-plugins-base: Use bb.utils.filter to reduce code
Date: Thu, 15 Apr 2021 11:59:29 -0300
Message-Id: <20210415145929.2007522-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210415145929.2007522-1-otavio@ossystems.com.br>
References: <20210415145929.2007522-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../gstreamer/gstreamer1.0-plugins-base_1.18.4.bb          | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
index 4621d9f198..13944a6cc3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
@@ -67,12 +67,7 @@ PACKAGECONFIG[wayland]      = ",,wayland-native wayland wayland-protocols libdrm
 PACKAGECONFIG[dispmanx]     = ",,virtual/libomxil"
 PACKAGECONFIG[viv-fb]       = ",,virtual/libgles2 virtual/libg2d"
 
-OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '', d)}"
-OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
-OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
-OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
-OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' egl', '', d)}"
-OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'viv-fb', ' viv-fb', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.filter('PACKAGECONFIG', 'x11 gbm wayland dispmanx egl viv-fb', d)}"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-- 
2.31.0

