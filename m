Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.6499.1616720840047880509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NpdsOJi+;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so3451345pjc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KN6/JaWQk1cuGwpc3fZEVuFmTpuwt7S3CboyargQpfk=;
        b=NpdsOJi+5T3xlcsXmI22vxSFH+K8gvsK12XaSziQAhKaOuufT5FAOQkZAoHOJTKFiR
         MWox713FtmQ4vi57bpcHQLr1egdvYa3l7RPyXuoguuhliuOW/hMJNGZXxyQUi8sW+pZU
         4xPjOvuINwSDAX+irqe+FT5jfQvipwcPpsV4Xx0p650jrX/45BWXruYmya38Av1eXtRD
         zxu8NlUvUq0LtfreCoSJdUlG/q1ciCBnwxndJPDb1KfGDmd8zXBWCLBwiP1jQ3eyh6tB
         nbgSwnbdWsiPnsngaVVMKOcfxYSxYgeFBMVYnQmXis8qW2VQAskYhr28nn7ok4LyJdaC
         W1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KN6/JaWQk1cuGwpc3fZEVuFmTpuwt7S3CboyargQpfk=;
        b=IqLpy8YHUdkC8AfQUb1fA68UdNJzC5fqyetd8wZ4SapUsViQygJi7vyBlI27tIrIzL
         zA9IMhOUwLvvEnEgCoZHL1IHbPDRs0Qfbn2s3/RnHHJR033ucAKzqJVHPaa0zBAUHcB2
         pTO9SJnxKaKPP/zYXiN4qOYZYI7kWu3X/MIsrjDcXns41/JcSO8dBAgYV6n6gmo/mF05
         IRDmWhl8e7mKbh5YG0A2rRnwX9odFwXbbUd9RkDB8fz7Y1N6obMJ/u6wRRJMbvqk2XCZ
         WUSmibnjdZDGjXerhckTPGo2STdVIHdZ6PlOziwhmJYyHuG9IoxXjVSFwBWv2Hh0tBmr
         y2Mw==
X-Gm-Message-State: AOAM532aLE8KBuTnKHkrwoO2e7zHbaT6UzAK7BNB5zkf8rFXNRLh5QG2
	vjTrb2bm9jBFrTOTVMIn8/yJIqAUDQlt1g==
X-Google-Smtp-Source: ABdhPJzsFS3FUfyZHTGn5mAB+oMmcXdB3hD5a/hHW5fPff/SZW7/TMt4g4fXkncha28n5RMTQO49TQ==
X-Received: by 2002:a17:90a:9b18:: with SMTP id f24mr10827788pjp.96.1616720839172;
        Thu, 25 Mar 2021 18:07:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id o76sm5768766pfg.217.2021.03.25.18.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:07:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Yann Dirson <yann@blade-group.com>
Subject: [PATCH] gst-examples,gstreamer1.0-libav: Add option to exclude from world build
Date: Thu, 25 Mar 2021 18:07:16 -0700
Message-Id: <20210326010716.1055632-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When LICENSE_FLAGS_WHITELIST does not have commercial in it then the
the dependencies like ffmpeg will become invisible and render these
packages unbuildable, therefore world build will report parse issues

its better to exclude them from world build in such cases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Yann Dirson <yann@blade-group.com>
---
 meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb       | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
index 4670ab34db..196258e00f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
@@ -33,3 +33,5 @@ RRECOMMENDS_${PN} = "gstreamer1.0-plugins-base-meta \
                       ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-libav", "", d)} \
                      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "gstreamer1.0-plugins-ugly-meta", "", d)}"
 RPROVIDES_${PN} += "gst-player gst-player-bin"
+
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
index 6a84f92f31..7c39e7da37 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
@@ -6,6 +6,7 @@ SECTION = "multimedia"
 
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
 LICENSE_FLAGS = "commercial"
+
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
@@ -22,3 +23,5 @@ inherit meson pkgconfig upstream-version-is-even
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
+
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
-- 
2.31.0

