Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.749.1605893806335618389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id p12so7658375qtp.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=ino8AMJgFkWWrMZZ/Na6WygV2WpvxwhnN8P3I17AIEM=;
        b=NEQYIVzxtsYbVUFX2PKHoqUVnTck1t0zUCaBV8X9PmEHA90nrXEmrZsA4TDxxdElcA
         MqmdEJlb2JaPpRu4uaj8SH4y/aSkgtgKOZnarpzIKnin4nmRu1R0d/HSo6hqLzEYOl1P
         v97E3RRfnU2Ogl1v8fEimC1FQqe5Agy6Q90SSQHqOVBaxpfeR5Dflt7/cR4HySyUPt6d
         ZoVhsYDCBWWZpMM+zxJ1cYKE5+1JtjKMh5MFYE6932uyv3WlTZ61aDZcbcrClU267vdR
         GAu5hDy0v8Li/zEWIvWDpVat6iXHNpdO5v23N6yDfy61WBoso8LJJKfh6FnwErSTyWFU
         Tsbg==
X-Gm-Message-State: AOAM531Rckgu4MXCnIxLmXNW1sFEZLGJIgDwRj8E6gof5NrNivtkNayr
	QjAjJ+TDjEhTpV/5lvxNfmr9QXsqR8/8lQ==
X-Google-Smtp-Source: ABdhPJxkdPAp4lCrHYZGmnvjUoAJurXD5Bk0Ec6sfJqANJm7xPmloD2tezDb80kITRemBKnc45PCHg==
X-Received: by 2002:ac8:590f:: with SMTP id 15mr17373361qty.249.1605893805160;
        Fri, 20 Nov 2020 09:36:45 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost (191-221-68-106.user3p.brasiltelecom.net.br. [191.221.68.106])
        by smtp.gmail.com with ESMTPSA id n41sm2613495qtb.18.2020.11.20.09.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:36:44 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] gstreamer1.0-plugins-base: Use bb.utils.filter to reduce code
Date: Fri, 20 Nov 2020 14:36:30 -0300
Message-Id: <20201120173630.1296722-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120173630.1296722-1-otavio@ossystems.com.br>
References: <20201120173630.1296722-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../gstreamer/gstreamer1.0-plugins-base_1.18.1.bb          | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
index 8813b8faca..43d51552f1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
@@ -64,12 +64,7 @@ PACKAGECONFIG[wayland]      = ",,wayland-native wayland wayland-protocols libdrm
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
2.29.2

