Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.4153.1612955536544377147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 03:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tjHPCCpQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: raymsmithuk@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id n6so1996030wrv.8
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 03:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UhV9TCNZqSqzxCSB82M4SnHAtqbrsYMp8znV9LaznXs=;
        b=tjHPCCpQMRrTFbWtnEvwa3MoHoJQYAqI6jWmQXen+oixP5xiRRgko7bylsGOQ+BRDK
         lBZ5aWzUYaJoM3SOyDcU+A4R+F6tXrx3tKEM0vEN5GrNrr1Mqyr1xyxJKQgrAH0qPMkC
         zGY1L5aFYP5lOiMODLQ3BkdSPQXVXRyrUadR6roITKVXLjR2cglXi/IjKkJf2Y4TyloM
         pw+UXYT9zzoEG5jHm/5BVaHui2UtWXRRYmRsrHKMp3e1O3mHbW27x78mkw4HK1depCKn
         L4iOLEL8+rSPjIh45SYsameIZa9fL7w25qdmrgIt/5uGOLlzSJQzRV0P37KfA8cX98w5
         HT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UhV9TCNZqSqzxCSB82M4SnHAtqbrsYMp8znV9LaznXs=;
        b=oPwZ5sjo8fn9eLQpXHVfpTSSJho/PFrSivopJDBKhUGk1qAZeSFeTBUlZHxvykNkmR
         eCU7u79bdln71bQnb+Em0HZv1wzR8bGgpJuzL5wz0DUiSIMupvX15semjJBr3x/R34cJ
         zq74Xy86WWoRBeG9mjbK44W/7M/BxTns8tm8YXhuU4UbxSNY7b2q9BxpIBmbxyRrOURE
         xadefHswvk4VuttielgPtlet98tinxD+hFiXBey1mh5Q/zDU+UZxPDL9tmu8vpGS1Ete
         CVttW38L/3kWvftBRKYtYcFNH5y792ifcLwTSCN430o4Es+112RxBlBsvQwQQaVg4nVT
         iT/w==
X-Gm-Message-State: AOAM531MwqWQc1b+XgTUAqXePoBgcHyyYBGDXr1SXlT7g4Ykutx8ulcs
	JH/F3mlgr+yb39Kw20TXxlYYmR56RP0=
X-Google-Smtp-Source: ABdhPJyj6+RaaeFSCKQBL34v1FmU95wKdYiNmc1W9r0rOnXhG6VsIa5rMcLoH/vsHRCfYiDF3c+OLw==
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr3009219wrq.274.1612955534633;
        Wed, 10 Feb 2021 03:12:14 -0800 (PST)
Return-Path: <raymsmithuk@gmail.com>
Received: from ukcam-rsmith01.brightsign (elite.brightsigndigital.co.uk. [217.138.180.132])
        by smtp.gmail.com with ESMTPSA id c9sm2577073wrw.76.2021.02.10.03.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 03:12:14 -0800 (PST)
From: "Ray Smith" <raymsmithuk@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ray Smith <raymsmithuk@gmail.com>
Subject: [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
Date: Wed, 10 Feb 2021 11:11:13 +0000
Message-Id: <20210210111113.17318-1-raymsmithuk@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mesa doesn't _require_ either of these features of the distribution,
it (conditionally) _provides_ them.

This has a desirable side-effect of enabling a build of mesa that
supports only OpenGL ES and EGL, without having the rest of the
distribution think that full OpenGL is available.

Without this, a distribution can't support different machines with
(non-mesa) OpenGL ES/EGL-only drivers alongside mesa drivers, even
when the distribution only needs OpenGL ES/EGL.

(Note that currently mesa internally requires OpenGL support to be
built in order for OpenGL ES support to be built, but this is a
detail internal to mesa that should not be exposed to the wider
build)

Signed-off-by: Ray Smith <raymsmithuk@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cb075a8b89..bdb978de95 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -44,12 +44,10 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
-
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
-- 
2.20.1

