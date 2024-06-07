Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1508BC27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 06:36:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.35708.1717742156199352390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 23:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0DR8YGf;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42163fa630aso7589485e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 23:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717742154; x=1718346954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOwxGlDDFwPuQrXv4DvKG0ZzaaE835ZLU/mI4HuuDYg=;
        b=Z0DR8YGf/AWU+Vlnl+3Sss8dPa8YtRvRIzY/cyOEBgrQnQ6TwRhD/ucuJKyfSGVBV9
         WQmR/7I133sJEez/Ib0l9Qa6Wp6ujy1lwI/MxfZ0SCTYy1EX51RcGjgN/tYK7vBrQHSc
         Du4XVwW7bhOXAeJGbh/tqkcsNJ2Z963dsQ/TXTl2Wv6o31FVeMghkBl1ILgx00AOB9pL
         JRMbP8/h91DY2rEFmwXEyc7E+hQUV14hZgGmqVJkISJGTLLE72gdso7vO0MD6m956vON
         6afKDhkJVJONNexFRrLN0ZFS53pcPb0lI9FRpquRtEYotSptidBX3wb115J2NqnWwQdi
         +guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717742154; x=1718346954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOwxGlDDFwPuQrXv4DvKG0ZzaaE835ZLU/mI4HuuDYg=;
        b=QiSN3X2vkxWM9MCV1qEmy0InnLe4vhoBZweklpBHzvNlUzFXZHhc8YspaEkOFMy0q3
         tO3SZc225N8vl0NWVUxnm1n/dkHnI9tuwYcPurUSlbkdkYEcClirtVguAK3nbuz/ytVZ
         mBSgM7GiBA3RKLHMTOfJnHPDi+vVemM+jMEE5hQstoL6lzJm1UG5DBIpTJO0HNjFBNAX
         EOp8IM/rmRihe1gXftLEULxYHEkb1RNw1nDaDs3ZIT+n7CMoTrGtdRtnTChqaZRxzIL5
         LC5rjEXkRmMGCvDfuHMBxFJMo1D4tCgRPj952okTI+QTg5VIN/Viu5P/l7aL1a6hUjBu
         Dv9g==
X-Gm-Message-State: AOJu0YxZcexzd6E1IkAJTEPw3kiPGIpKOAlizJAqJ7lTW9NkAvGW3uX8
	UTjWtQA1dFhjMr8rR4T990yDdu5ULE2GDDOePNn68k+oDA6e2ikwzcZcEQ==
X-Google-Smtp-Source: AGHT+IEeFCewAXg8y1RAEHdtjBKVN2STEvhJNNoTQB6CvKvVcv+3PYga54bqU7Ubj7lnXEOnFXyNfA==
X-Received: by 2002:a05:600c:a05:b0:421:ad:f104 with SMTP id 5b1f17b1804b1-421649f497emr15136955e9.10.1717742153532;
        Thu, 06 Jun 2024 23:35:53 -0700 (PDT)
Received: from ltbabn.skidata.net (178.112.145.204.wireless.dyn.drei.com. [178.112.145.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe37csm78300325e9.3.2024.06.06.23.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 23:35:53 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
X-Google-Original-From: Benjamin Bara <benjamin.bara@skidata.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: adapt webrtc audio dependency
Date: Fri,  7 Jun 2024 08:34:13 +0200
Message-ID: <20240607063413.184390-1-benjamin.bara@skidata.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 06:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200423

Since d5755744 (MR !2943; landed in 1.23.1), gstreamer switched to
webrtc-audio-processing-1. This fixes:

./gst-plugins-bad-1.24.3/ext/webrtcdsp/meson.build:7:13: ERROR: Dependency "webrtc-audio-processing-1" not found, tried pkgconfig

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
index 693ee06669..dbd504e87d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
@@ -92,7 +92,7 @@ PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-load
 PACKAGECONFIG[wayland]         = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
-PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
+PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing-1"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 PACKAGECONFIG[x11]             = "-Dx11=enabled,-Dx11=disabled,libxcb libxkbcommon"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
-- 
2.45.2


