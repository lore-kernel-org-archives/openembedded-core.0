Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.19086.1611482011986396677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 01:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZpbwBndS;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id f17so11617354ljg.12
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 01:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACXRKCt6/9DZ9n3o6ZV1sBW/+Q7CjGLMtmUBnL+5+Iw=;
        b=ZpbwBndSQ6Q5Ds9gaV7WsDutII8BCpS3vlMordSOcnoxCIqjgo8LVru7giyN2TRzk1
         VX0QunOXG4q1ZiT76YD0Diz90kpQHAO4EJ6g9jjOwW7G3yKh591+sjzAfkYEVW4zesNO
         roCX76/5rW2OaTvq0lMwaMJZcS/vmqoUTdZu//CO11foL1vNl2+zHvsw6aMbjO6GX3jj
         4vzFwIo8waHkA+5kdGMn4MvgeBZHG4E+rtNW7yhYWBnTD66A5l55T/7pFlnocmUXTSm8
         UotG+3KBqwkzKy41rpvB8M3vlmkugwtkX2o802Lo1gmpBfB19yUXqr1l/juulykgZCUk
         rYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACXRKCt6/9DZ9n3o6ZV1sBW/+Q7CjGLMtmUBnL+5+Iw=;
        b=fvl+WztCCZ4wbZJvGSK0A58wwk/OcgOjwe3WNjzcU0LkOPejTliemRFRQNzftlapVs
         d/9e8kU2TLyRE1/RqGR0f2QkGp/pk688GpjmlDO8AXS+K1xjWhlLEDSmgkiHKLbuX7mA
         zfAruOkOKXnsPj/TcKwJX+J39m4Be0kblj3zHq2DsJhAWTJ4j0QqlvGx8H/B8UJZ4GxV
         pPW0DmaZyS4F45e0P+d1yM5pJzBtNO4c/t7YiBezLk1VxDmyBZv7QtJOElQ6OGRPKiDJ
         4sXLGqm/CfnC3PJMiLUcY901aHM6b8/vA2y4PqWHOCq0InSR/GGb/YglR0AXoowVZkgN
         T0Jw==
X-Gm-Message-State: AOAM5316WAlOnI2fO6mEDxd20LRasqPnEWsYvZtTaNSpOyoQlaimGQIv
	oHbNd0pOYETUyDzLyrqU4A/fP8s4FWA=
X-Google-Smtp-Source: ABdhPJwTPCeUd4XVcLPWBlkaUYAP3YnxnV1RfPDWN+pR27AkhOAq28v+Q6PUR6sFU9lPRQxmDW8h2A==
X-Received: by 2002:a2e:b8c6:: with SMTP id s6mr136275ljp.275.1611482010051;
        Sun, 24 Jan 2021 01:53:30 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id t4sm1618338ljc.50.2021.01.24.01.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 01:53:29 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH 2/2] meta: Fix native inheritance order in recipes
Date: Sun, 24 Jan 2021 10:55:46 +0100
Message-Id: <20210124095546.3329-2-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Classes native/nativesdk should be inherited last to prevent unexpected
behaviour.

See [YOCTO #5729] for details.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.32.bb | 2 +-
 meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb  | 2 +-
 meta/recipes-devtools/qemu/qemu-native.inc             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.32.bb b/meta/recipes-core/glibc/cross-localedef-native_2.32.bb
index 5a0abbb70f..ec59c6ba10 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.32.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.32.bb
@@ -14,8 +14,8 @@ require glibc-version.inc
 #
 AUTOTOOLS_SCRIPT_PATH = "${S}/localedef"
 
-inherit native
 inherit autotools
+inherit native
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb
index 7fdc4c86d9..8778cab124 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb
@@ -1,7 +1,7 @@
 include meson.inc
 
-inherit nativesdk
 inherit siteinfo
+inherit nativesdk
 
 SRC_URI += "file://meson-setup.py \
             file://meson-wrapper"
diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index aa5c9b9a72..54e49d8bc6 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -1,7 +1,7 @@
-inherit native
-
 require qemu.inc
 
+inherit native
+
 EXTRA_OEMAKE_append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
 LDFLAGS_append = " -fuse-ld=bfd"
-- 
2.29.2

