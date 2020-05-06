Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.5574.1588769910071179590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 05:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CP7+WO1T;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id z6so2554793wml.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bd17MM0um02cbbjvHCXHaEOSgdVllK+YEEqgaJGP3M8=;
        b=CP7+WO1TOoDKdefOADyGs96joiCONLiTEJXSyMUjk8fHq5gU2P1WXeyXBm/qCKXGeX
         DNcbq0RBB4RLhmnM5EW9viqetip59AS+w2eQyzECIpxFsakxm7tLNfvq6XBugCEEiuaP
         rMYNey1Pdw+rHfYgBB/tnp2egTEHpY93He9TbzNa9MoqupoOB/EUPUEwdwXKfVigktGN
         wt4p/n0E3cQqk+EdBBTbF057VKqv+EWEWs2z/OQb6DsVVEa4wRNje/ca33izUedam/tq
         3JY+NEXlnprvtNihXLkFZnjATbwZoY/MoWxrmx5/Sw+b1vZQEihnajoGQAFuKI8z/RLT
         fy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bd17MM0um02cbbjvHCXHaEOSgdVllK+YEEqgaJGP3M8=;
        b=QQhgSyXzBnjHNNbNYJ+hEIIioDsVObbh5ZsT4Kx2ut1tb+qcUUSqLyT1cvykux81/h
         B5Exox3oTnyZmpXy0UEdXkhBA78cXLdRb9Lu++0M9dOCoC6qrp7/QB7T1S43a4YoXzr8
         h/M+axHhWwP3FfqOe9sU/Zk5EAkTMbThTlcFaMYY2X7ZRKaUDk+EVUQgp7vzUyYdCQGn
         FIR9oAxYsOKTC/FUzoFNmwap+1MQberjiff4UbR6GT13sMGvEQhYOjWkFIog764XddP4
         GnqHRDHK5LQioa9DksQZxicDweMIHcAKHAFELNWzRuh32AhdRkgCHN6PWFpVaBKgk5Dv
         xK2A==
X-Gm-Message-State: AGi0Pua6H0jH4K1gu2ReOtIIapbZQo70c8+oOww2sHaj2u0JutyK+fv2
	WR7Ipzv4EjIq79lwI3vMPAtQCN9D
X-Google-Smtp-Source: APiQypJKykfq61oHLshJaepwfwOYRu/LSQodRjFXZp5AoNk8fJxwA0Lb8Wy+t4PWMSYkBTWJJMGqxQ==
X-Received: by 2002:a1c:b684:: with SMTP id g126mr4085160wmf.163.1588769908136;
        Wed, 06 May 2020 05:58:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id d13sm3049826wmb.39.2020.05.06.05.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:58:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] mesa: enable x11 for native/nativesdk
Date: Wed,  6 May 2020 14:58:15 +0200
Message-Id: <20200506125815.20563-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was found to be necessary for libsdl-native to enable opengl, as otherwise
the opengl check would fall through to the host with unpredictable outcome.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc                | 4 ++--
 meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb     | 2 ++
 meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b7ef496fdc..f59503bf14 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -72,8 +72,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
                    elf-tls \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls x11"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls x11"
 
 PACKAGECONFIG_remove_libc-musl = "elf-tls"
 
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
index 6583ea2371..57b43ff28c 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
@@ -15,3 +15,5 @@ SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "fe40f7a4fd39dd3a02248d3e0b1972e4"
 SRC_URI[sha256sum] = "7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
index 95fc0b642c..1612a50f19 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb
@@ -18,3 +18,5 @@ XORG_PN = "libXxf86vm"
 
 SRC_URI[md5sum] = "298b8fff82df17304dfdb5fe4066fe3a"
 SRC_URI[sha256sum] = "afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.26.1

