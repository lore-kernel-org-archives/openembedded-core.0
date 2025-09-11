Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573C7CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.41416.1757580707433245679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0zA0H3w;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3dae49b117bso447476f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580706; x=1758185506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzySFHi7a7e6CXiLDVBY8slLtQvdmYYsjeqRU01cww4=;
        b=F0zA0H3wkGVN1oaojKbdUqMUkwc0hFt6Wsvubwmv/EJ0qXOpFVO/f2GToWigYFB6Ih
         Bo0BBmceAKpKmMJTEGp1xCRESCjDIzUJTFUhlCEKeo3/VHEYTM75PsoeckLS/BRUDbdn
         /JhQZatc8OB+6tNtrKPh5yoGyqWdi53oPmMZaq7oZMB2L1GqGDKpwInUK7Ma9aqBTmDH
         kdfUjfh5gDVEtCv5Em51jpazG1iLLJAWFBoszbZUeHaTWTiZCiTSjsdMWqbB4ebfGmBi
         ojq6PIVIKaKoKJsY5JWpW7HIDp2MdRO1yts7hLaknOmWzUyHx9E9CO9tmV28CkcO5MYn
         jIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580706; x=1758185506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzySFHi7a7e6CXiLDVBY8slLtQvdmYYsjeqRU01cww4=;
        b=mFnFlkEJOC1Xjfs1hUI683Q/y7UFe7pqeosuMz1u8TZeAmChVPk+c/zdx0F9aJuocO
         4a4saUesPlW9imEpUJ9IlWuwDW6Nkv4lCL04VWCoDJIxQSndvRgDiInmAZE7V4Xkm9G3
         evoihY6YfUg3R4olr3r6Xhw2/tsK2ghVabRl6/+OZ8msETdLhnzV/MW92PHuRGfFRfM7
         Wqt7bZZPT/CEYLQO9490eUu1qT1gYqUf+ypNONIMoIjsgS161Jj7yDkM67GB8RbhV++T
         c60K29T7Bix3zSLipocNXQQ3WMN2EKkcRKIhMR+SjPCvahL3HfiWu2zjADSvkD11QZq+
         cjzQ==
X-Gm-Message-State: AOJu0Yw/a8uAz3cuRY5ZRE2xLr/pw5UMCf4GNsjPHZFdiUa0hZiUAwdY
	stKI3iUbje02W0uijWN9jraovJ+ynMdCoHHbXdRtCVXhpoV0goHTcQHuCqs+IQ==
X-Gm-Gg: ASbGncvWlDmPL0BOZp95UG9koNnXQO+V0EJW2DEODGNBv1FPFDwCR4nA/SimWusbzgf
	ohaTONqosQIJUQXceNQxuJpW/EptgFzkfv+R1/ahfOUnOx37T+JWSy5jkQDJQDKBbAQZ5mLBYgP
	Lx2XTzyC0H28bEsx0EjAntYwsED+5cRJAZTQIXsF77IAQcS6mYjvMaRCbljXIPrxKtpSDVBOKPy
	Ig8A00AjiFYyta429fkmEc6R2EVFsWCVM7SYOHmYmk01PRZPCilV9vKp5dL9pkbv/mBY1RWtKxg
	01UpqFoERmRn2fZPOzdu/FUkBLNw9Hb9H1mE30Sso4ir68NI72YSf49BWlcyOSoXSnmvpPxqO6P
	255SuH+ZSqHl7qHUpR6etJU/+rcJfsio3FEyIp3dLLQWRtmJHw+S7mMSU4dKhQidf+wh9GtMABe
	8N5AqJS5V7hJDNE5bzXGMq0yPfYn8OLkVOKdZIA0hqH/JfC/jQ0IbOxdGC1A==
X-Google-Smtp-Source: AGHT+IFQGPg1IqlJ07YVrPJ9sZ/dSkTFMhhhpE7uPyaD6t1HVUWpquAVsQzt/CdUelU2qgX6j6JNCg==
X-Received: by 2002:a05:6000:1449:b0:3e2:804b:bfcd with SMTP id ffacd0b85a97d-3e642bb7cb5mr14417487f8f.19.1757580705751;
        Thu, 11 Sep 2025 01:51:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/16] ffmpeg: update 7.1.1 -> 8.0
Date: Thu, 11 Sep 2025 10:51:23 +0200
Message-Id: <20250911085123.1551425-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223263

From: Alexander Kanavin <alex@linutronix.de>

libpostproc removed upstream.

License-update: formatting.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_8.0.bb}    | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_7.1.1.bb => ffmpeg_8.0.bb} (94%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
similarity index 94%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index 5a86ad563f9..ecaced7690b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -12,19 +12,19 @@ LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-
 LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
 LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
 LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
-LICENSE:libpostproc = "GPL-2.0-or-later"
 LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
 LICENSE:libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
 LICENSE_FLAGS = "commercial"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+                    file://COPYING.LGPLv2.1;md5=eed22b3456132611e3d4aa7a7ec64dac \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                    "
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1"
+SRC_URI[sha256sum] = "b2751fccb6cc4c77708113cd78b561059b6fa904b24162fa0be2d60273d27b8e"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
@@ -32,15 +32,14 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv6 = "arm"
 
 # Should be API compatible with libav (which was a fork of ffmpeg)
-# libpostproc was previously packaged from a separate recipe
-PROVIDES = "libav libpostproc"
+PROVIDES = "libav"
 
 DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc \
+PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale \
                    alsa bzlib lzma theora zlib \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
 
@@ -51,7 +50,6 @@ PACKAGECONFIG[avcodec] = "--enable-avcodec,--disable-avcodec"
 PACKAGECONFIG[avformat] = "--enable-avformat,--disable-avformat"
 PACKAGECONFIG[swresample] = "--enable-swresample,--disable-swresample"
 PACKAGECONFIG[swscale] = "--enable-swscale,--disable-swscale"
-PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
 
 # features to support
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
@@ -154,7 +152,6 @@ PACKAGES =+ "libavcodec \
              libavfilter \
              libavformat \
              libavutil \
-             libpostproc \
              libswresample \
              libswscale \
              ${PN}-examples"
@@ -164,7 +161,6 @@ FILES:libavdevice = "${libdir}/libavdevice${SOLIBS}"
 FILES:libavfilter = "${libdir}/libavfilter${SOLIBS}"
 FILES:libavformat = "${libdir}/libavformat${SOLIBS}"
 FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
-FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
 FILES:${PN}-examples = "${datadir}/${BPN}/examples"
-- 
2.39.5


