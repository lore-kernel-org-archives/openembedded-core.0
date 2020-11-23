Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.40375.1606158838176934699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 11:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=neHb2Ybk;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id gj5so24916651ejb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 11:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmiIhRKRXSjxUjlhtsEow+ed3LAAq6yOH6EX2Y0NNBM=;
        b=neHb2YbksoKl71TXbnSzP6TbgJkUpNt0fmvYBBJA9cu9AtlX3ssdSFC29sRSBYQx/L
         wJpi4vZNDKs2VjyBG/3lbS2PYxELwGv3ALbgCn2NtN/XHuHjbUK42bSFDLLvRVHoBT1m
         ydf+sSuYX/ToHQiitkYmI24t9/MLhunwBQK/1BSUt3ZcLrxAZ7BBLvUWW2jE7/QfkGMJ
         6Vn1IfJiv8tB3/etPuqagS5aW/fMNzJAfa5GFBlmGlcURl5XyWD53CQbpjr6uyocfdgL
         eRhvnmqkOJbwcZoeiru5JWnT1RV1H+Sy5UEuifn7q7dbbhKoFHEePbMpC+SyGkWOSXFM
         75Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmiIhRKRXSjxUjlhtsEow+ed3LAAq6yOH6EX2Y0NNBM=;
        b=Zr7WYhjGhfyLi/N6y9aFmmN0UtIrepAIDqUzcR9fxPJ0Lgh9K8ks7Hv2nG6gM/wsl0
         YISCsndmHdGVipS7tC66cF5vlWRT4NhF7ZKEDpSi18DUDWs7IpTWUCubyT+CbK93BXHK
         Jt25KwZ98EA1hESoALi1UC7HFlfhme0D4SMoEr00fh9K07wmz+FffODTVSWu4htWP8+B
         7nPwMksxDOduiumS/ginSIFLR3Qh0OZEZoZnBUE3SCVoWt1pEmfeOYbIEC9uva9OtcVR
         1bK60BYwW/5/UwppU4O9iKPoGwwdZpqxNBGLwV7Mw4MsrGwxr0ONZ0nIwCuPMBz4XTb+
         0B0Q==
X-Gm-Message-State: AOAM530Mn6mP5qlr4U3CKJ2B1WIvCrV4QUW0ifBuPQ+NGkDPDE4NKSqp
	8NKCkjfva9JRc5gCYZTWLgNPIcl5y0OQgg==
X-Google-Smtp-Source: ABdhPJy500GS2f2F1uv5ZE9reBz/T5xMkYfaA05k39eO6pPMVMHPtoF7OPdlv4N5GF0dDaqLCnFfdg==
X-Received: by 2002:a17:906:2932:: with SMTP id v18mr1012496ejd.144.1606158836313;
        Mon, 23 Nov 2020 11:13:56 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf38a200d486093f26cdb940.dip0.t-ipconnect.de. [2003:cf:af38:a200:d486:93f:26cd:b940])
        by smtp.gmail.com with ESMTPSA id y18sm5498673ejq.69.2020.11.23.11.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 11:13:55 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH] libsdl2: Add directfb to PACKAGECONFIG rdepends
Date: Mon, 23 Nov 2020 20:13:49 +0100
Message-Id: <20201123191349.7503-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building libsdl2 with PACKAGECONFIG[directfb] then directfb is
added to the DEPENDS. But the automatically generated runtime
dependencies do not add the directfb package to the runtime
dependencies. Most likely this happens because libsdl2 does not link
against directfb but uses dlopen() or similar. Thus, the runtime
dependency to directfb needs to be declared explicitly.

Here, a runtime recommendation is used to allow ignoring the runtime
dependency using NO_RECOMMENDATIONS.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 2ef7d2e5ef..ae42db2610 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -58,7 +58,7 @@ PACKAGECONFIG ??= " \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
-PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
+PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb,,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
-- 
2.25.1

