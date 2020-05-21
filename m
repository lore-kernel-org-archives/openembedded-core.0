Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.10436.1590080454540480809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 10:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kNdrYU1p;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id be9so7141740edb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JoBX2Fpc0m3n7rMh4zszL+ilXaPcR1zoi8ZGGJE7V28=;
        b=kNdrYU1pfDOUKyZWX4sJWN4JV6+8Nk4mf/+dawBqY8Y+o22cZ6lZOxnRtb1BnNdQwa
         epefSKYmv7v8D/RH5csnQVy/b/FXICPTKVkmr2F2aFO2HAWzKPHhqedgJrIugDrCQt16
         gsaQ94YedwJfUxFP2a8H/yJkQX4O0x+wlHYkSJgxJfi2qdQjUVcKK8ztTzjbfyodjEYS
         zMQ6va3DQ3bNiCM1reDHj+aOxgbEvT2hoNE65n++zXtUPY/xJRYNBQFxEHs5WgIsSkvq
         iN1xJ9WH3hEnQknBVjGg//CqoNmakB6phtGtWrZtBxgsVLwk024FPqFs6BsYvZVlPI2H
         hlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JoBX2Fpc0m3n7rMh4zszL+ilXaPcR1zoi8ZGGJE7V28=;
        b=teMCrjGiCFeg4gniTSX6z8AmXsBxfLYGYhIdJYau/dQR6WU46VxDnJyExVRVRe1OXM
         GsmHpjxeYfPFmB4Nb8oNSkbcoPOI7krYALRnao01/IuGo63pagdtaWTIKXkBS9jBvqwJ
         cOYphy0cGwWTvhscdM/QcPQMR1SZcO0VJ64OxMQqQ/CrB6jjSBRD6a1VsNOoeQyZ++Om
         j5RgVNyWitwM2ID9WhSL4VfuCc8CpaQeu+bg1sWnWheJZE5zxclQ48uCL756S5Fwwwgo
         zmkSanrQ+ONaO42byYFZZe9tgXtO/2deOcGbrOg401tSD71YakgrPtBf37b0PIMvmDvc
         NFPw==
X-Gm-Message-State: AOAM532ORF1/oZ+VgMP7HsTQzcpjQZ0IK11aEae0MVVvt6bltSFDpUDh
	VnnLaFPzAjz8o1KEvLbULxDgORsQ
X-Google-Smtp-Source: ABdhPJzXIA404nGaplGaW/3VG1TZiMNz7ArPep/GdyAUKkDK5wwtKcIwpPdiwK6/Ig3Kax8MTAjxUw==
X-Received: by 2002:a50:f40d:: with SMTP id r13mr8067672edm.93.1590080452695;
        Thu, 21 May 2020 10:00:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id cz9sm4960252edb.18.2020.05.21.10.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:00:52 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] libsdl2: enable opengl option for native/nativesdk, subject to 'opengl' in DISTRO_FEATURES
Date: Thu, 21 May 2020 19:00:19 +0200
Message-Id: <20200521170020.4123-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521170020.4123-1-alex.kanavin@gmail.com>
References: <20200521170020.4123-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows virgl support in qemu with the SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index c1c941e452..83dce86801 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -45,8 +45,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-native = "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
-- 
2.26.2

