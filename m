Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.285.1616517455210843729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=dVXyphwo;
 spf=pass (domain: blade-group.com, ip: 209.85.221.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so21435432wrc.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGre4bY2zk9eUhKGtL6iuIPDt3BoFkcQoqSX8LJq1Mw=;
        b=dVXyphwo3HhlmBSMvENK+tqmaH9ZMCeu7/ub8fqqBJ0oFeHUHuIqi+tB/0tt7b8feN
         0yXhVhXkHBkz6ABm4KvCA4CeLHebehgVZJJ19Gl4OgowIW5u/ibHlLxAwfKFenO6YrDX
         Fb/pNwF+zaVFGX3VkNLmkQNPxo5U+q3KmHDEsg3ob3rg9bFwHP1Z9y34oW7kieHyYuON
         ZIORKr7S1icKLhXXYkg6ataScwHO2kbGEyxueD2yajbczfxS4s5dFvuXJHViLV7/JZ6O
         NuLJITFlESPDfD2ztroI8DgrifJYxrucY4PGg48vm9caSbw2yXZJnZTtujEK+YG6Scsw
         GY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGre4bY2zk9eUhKGtL6iuIPDt3BoFkcQoqSX8LJq1Mw=;
        b=kXrjOH7XPiS2SJ/Q64Yt468Y3QI428x5BWU33uJxn5UDCJpfJpC4YfSB0xqteA6rQW
         APbffAlUpiQcqjSU2jpVMeHgZWE9rXJMi4NrLfN/PqwWkx248h5wroC2eE0ySk3qRjZh
         81YJThk9j0hmj31FmY4JIQ5tpgBU1ImLNM7U8U4iYvBBcD+5fuB9c2s9unwua8M6jZIv
         NLiAy+ihqQZJUheVwbB6OYQDe5fbSzgAIvmFs0/uPPOvGvrAvDwf/llq9gTtyzbceD1U
         vmBEvyjkCg09ugia3AxzM3tmGHMqQR8pYbvhoDHhYqR/0RgWvsky18Iq+0d+Gbz9PPaX
         krkQ==
X-Gm-Message-State: AOAM5305PEA35vpRvmanQ5ON5fnQu8J5/uqRyTyUqIVjExqu+R6BFxAH
	uQo3CvxNNNXlK3f7aAFaUUu6j5WLtZ/pkA==
X-Google-Smtp-Source: ABdhPJwQ2MtLlyT3HsPl+8rBAOyU0StMUm2mSONjehSww/IcM0L3GTJv00Ugy598M/xrUgCRWxEA3g==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr4912154wrw.351.1616517453456;
        Tue, 23 Mar 2021 09:37:33 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id w22sm3092493wmi.22.2021.03.23.09.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:37:32 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] ffmpeg: disable GPL features by default
Date: Tue, 23 Mar 2021 17:36:49 +0100
Message-Id: <20210323163649.809502-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

--disable-gpl is the upstream default, and using GPL features violates
the license when linking into non-GPL programs.

Enabling it by default breaks user expectations, may cause people to
violate the GPL by mistake.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 9dd56fbba4..08be38ca50 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -43,7 +43,7 @@ DEPENDS = "nasm-native"
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
-                   alsa bzlib gpl lzma pic pthreads shared theora x264 zlib \
+                   alsa bzlib lzma pic pthreads shared theora zlib \
                    ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips32r2', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
 
-- 
2.30.2

