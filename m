Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.2192.1618530198901886864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 16:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id er3so4113513qvb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 16:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=+0qgm/Dy/Bkd1O46C2TEf8D+Bk276fbkKeuuTIYUaJA=;
        b=IsAURQrqL1ODcLx2z1pzlpJKg/rFjF9XrmkDm7BJD5VbH7LlYPK/N4OcB0YR2qeKcB
         fIEHEDNcU8grL5pXtBz4GjvySqGbmIxy7KpR5tSMM8RcUhvXyR5xiRYMTY4SuSFGB5g8
         AcmNWFmgM/XzNb6lrobRXEv9Gl2Bov9bbNoY+UUf73RHIpWeoIa1SilfpSftwniEQwyD
         BPdPPO7ykG/2GBfQ0s8NMt/YvqTOSEfmB1rSAlGHrjKFE1YYJR3Snl4tl5fSo64t3Uw9
         TjUMPAF9anUW7rkATHrfpRiJfSZSXwc+7R/QzGeqi53uBf8RZVnAIiQKplFvN1RKadYo
         nhWw==
X-Gm-Message-State: AOAM530z+ejqGxwbXUZqu73MXZv8wY2aBCXliC0Q6UyhSa9GrYYJPH9V
	shTVbvDS2MAYHTTB6DJFQmME7mi7f/yKssYE
X-Google-Smtp-Source: ABdhPJySVb3Zqr0LjF8JmKiVFH65SLi2GXTHyNECf/BqARsZZhnfRSEaLXDHt/mqYrclBAMXR1XrdA==
X-Received: by 2002:a0c:d605:: with SMTP id c5mr5567940qvj.25.1618530197851;
        Thu, 15 Apr 2021 16:43:17 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id h7sm1698432qka.39.2021.04.15.16.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 16:43:17 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] gstreamer1.0-plugins-base: Use bb.utils.filter to reduce code
Date: Thu, 15 Apr 2021 20:43:04 -0300
Message-Id: <20210415234304.2035707-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210415234304.2035707-1-otavio@ossystems.com.br>
References: <20210415234304.2035707-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- drop _append as we are not appending the variable

 .../gstreamer/gstreamer1.0-plugins-base_1.18.4.bb          | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
index 4621d9f198..beddfb0386 100644
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
+OPENGL_WINSYS = "${@bb.utils.filter('PACKAGECONFIG', 'x11 gbm wayland dispmanx egl viv-fb', d)}"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-- 
2.31.0

