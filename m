Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web08.6395.1604630580228148402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 18:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t+Ix/hNl;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id n18so3972124wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 18:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KUfB5/6N0t1l5/QleELvhnc/mXQ02AqewnCwa5pk9v4=;
        b=t+Ix/hNlGqjMKsC9IYcQLt0+9JcIWTj2eihEGmDft5SduoYCtIHKlhwTaMlm/6DO79
         oYGjrsJO9mzBN2JonpMeNtVhvMQFcBziz4S78QyLSZGHxIHLF2Y/5S+0RYJQITDfnBK3
         JvBAMwnunKsjoRqBbC5M/hFZ8ZMSCT8RRHi9wknFYoW4GQ4UsZ7m1A8HY2uixw232sNP
         +dwruNYgR/pDbza0qkzfrvG/DxBPyix2lB9XRhJ+6z34VZnoIwIXg7JuAIp2ZkRPeayq
         eJqQJld71t4dOd5YkqPXza2ZboXv9WpeqipMdn4umek4p3tafkiHAf1AkuVCfgXmvWVO
         at7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KUfB5/6N0t1l5/QleELvhnc/mXQ02AqewnCwa5pk9v4=;
        b=BaBEzWkI1GPc6oNMBEMY9iVH09KbNVjROKrIWagXoR7gdh+XklCQql6Uziedk7f1dT
         G0X1Oy2Ms/40+lbmrXsNx77k2qQO+pRrG8WILR6qacEto8LzBdFSSPYtq90uln2XvstW
         tfTQzMQpBavBUCR8JhW/kPjd/npCfyU2bXCjGHeHkqQtDlBy0OYVlQkZLzrFeZm7Pusv
         a0b3a1V424fdUu6NPh8TrK5sTdZVTWs9Fcuo+0nHMfsfGS7Pyq3Qn64SJ4SCc8WATj1Z
         fCe1fYWLnQqUQiqRJpBEDBiXj2me6Jh5kbRst16aCaUE2eyCDgCL2uWo52rx2ARA2XUd
         NBig==
X-Gm-Message-State: AOAM5302uJvbF+3RD+bkWS01Hm8Uqzds8m8BvLnnxSVgG7UYvMajPR0h
	N/T/YOIm1MXba8a8qZer98ojWFMO7Gs=
X-Google-Smtp-Source: ABdhPJyjZ1jyad26mlFFdjHFwfGxt7nJjz3w2NmYS6YlKREYue1I/9ozQp5Kz6G2lg3jyDsfRkDo1w==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr29434wrm.139.1604630578378;
        Thu, 05 Nov 2020 18:42:58 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u202sm35750wmu.23.2020.11.05.18.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 18:42:57 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] webkitgtk: fix opengl PACKAGECONFIG
Date: Fri,  6 Nov 2020 03:42:52 +0100
Message-Id: <20201106024252.112148-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201028210558.21070-20-alex.kanavin@gmail.com>
References: <20201028210558.21070-20-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* ENABLE(OPENGL) was renamed to ENABLE(GRAPHICS_CONTEXT_GL) in r254064:
  https://github.com/WebKit/webkit/commit/92f9916b4a0d799c3f7be10b69aa53f40a149a2d
  and
  https://github.com/WebKit/webkit/commit/b3cb3ba4fa713e23ae27b2a79c14c6735d40d671
  but AUH doesn't notice that and builds without opengl in DISTRO_FEATURES are now
  failing with:
  | CMake Error at Source/cmake/OptionsGTK.cmake:323 (message):
  |   Either OpenGL or OpenGLES2 is needed for ENABLE_GRAPHICS_CONTEXT_GL.
  | Call Stack (most recent call first):
  |   Source/cmake/WebKitCommon.cmake:58 (include)
  |   CMakeLists.txt:173 (include)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
index 1acba6be1d..56cd1eb9d4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geocl
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
-PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
+PACKAGECONFIG[opengl] = "-DENABLE_GRAPHICS_CONTEXT_GL=ON,-DENABLE_GRAPHICS_CONTEXT_GL=OFF,virtual/libgl"
 PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
-- 
2.27.0

