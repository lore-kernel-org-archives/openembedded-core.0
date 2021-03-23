Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.729.1616519040651408767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 10:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Onv9uMLZ;
 spf=pass (domain: blade-group.com, ip: 209.85.221.50, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f50.google.com with SMTP id x13so21522375wrs.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nn5I6muMlNzkoqn1n1tUAjz3WGmFvPBQYHcziunpioU=;
        b=Onv9uMLZCn/PeVCYkKyjw0d/ngyAwTLqtNbb0DP23sxPLLDtgas6SudciMsghd313G
         m8II4CPNdjJG0FKXZeSkOmV+k4CzJfQ4i0+8D2U2xIDKZnVaBwHeyhHQ23r2R/fIoT/s
         nGM6CrtZDUgKxAJbbKW21wQ6UKas1VXKzj1MvzQ/tidfmkdh5tADoxuaVHR2PdvUlGRs
         jvm8fxfkaM7emmzK59buxD/KO6o08kCvWSl44AqQobZDq1yADNtafYdAraz0QmTPAvDf
         WaQGfiiA8E4kYHgrJStG6KAf55bYuXR36BD+9EKbDCclKYMPCMIxh+obd7l7+chCJOq1
         ypPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nn5I6muMlNzkoqn1n1tUAjz3WGmFvPBQYHcziunpioU=;
        b=ani+OA+pnH0sFkkr7OKQ4ihPh9hdmSxOp6Rz5r3kejPg0kqNxxMUaOt974uY6MmO5F
         aQrqlAdkF0D3kTQHNv+bycjAT+01zGrryJOXNJ/Uiev8I1cqU/h86w43ZORA71P6xPa7
         Ixxt31+W6EA9eMrekjwmpBdm7DuJR7iNr1lBuy8s8Eqhe9TMvvqbPIliJ/8MtcrLKmR1
         8fpsgOmSi4cuULguv3uQFDwN+sw0VDhBVwX/obR4rz+7l6BKExRCneIVV0mL1r8KP5Kg
         /6mFuE76JoEWeH+dTJM6V4Igx2dQWbO0KdW7Ys+osExk0pXQKeDsCuON42owHM0B1//z
         uF1A==
X-Gm-Message-State: AOAM533goaiNlmIfQyG4JbO2XivVM0xmpnQtNjHPFmPtQnA2tXRF1vCm
	W4TMX2z+yyomDymI2xUxwoGajG9yjBHp7A==
X-Google-Smtp-Source: ABdhPJzThi6lXzwVaopeoBa/MuARfPAFXuoWjqDyc8Pz/rDH+hnXPntYU17Q3TQB2MHmGE4HWhmDag==
X-Received: by 2002:adf:f005:: with SMTP id j5mr4858257wro.423.1616519039118;
        Tue, 23 Mar 2021 10:03:59 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q17sm23763876wrv.25.2021.03.23.10.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 10:03:58 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] gstreamer1.0-libav: remove explicit LICENSE_FLAGS
Date: Tue, 23 Mar 2021 18:03:44 +0100
Message-Id: <20210323170344.811024-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This flag does not describe the gst-libav package, but ffmpeg instead.
It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.

It is above all not needed, the real problem is even more clear without it:

 ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
 ERROR: Required build target 'gstreamer1.0-libav' has no buildable providers.
 Missing or unbuildable dependency chain was: ['gstreamer1.0-libav', 'ffmpeg']

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
index baf87fd871..3ea5560dc3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
@@ -4,8 +4,6 @@ muxers, and demuxers provided by FFmpeg."
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
-# ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
-LICENSE_FLAGS = "commercial"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-- 
2.30.2

