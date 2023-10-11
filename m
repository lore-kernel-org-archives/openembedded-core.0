Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F95CD98D5
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:01:57 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.5172.1696982511956823621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2opYBjHh;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.46, mailfrom: steve@sakoman.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-77acb04309dso271044639f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982510; x=1697587310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtpIsCalLTGmQueM4YNqjpLa94WeoR2Dmd3rkyHSuok=;
        b=2opYBjHht6kjGr6dgyk2yzEfjrclBHxzXhyFwR08CPbIbOnds/Lnev0pVHbtjEsv0a
         8z8MmhzPnsdhrfhJQE+bZ8aJNgeQ52ilmBrl/cSEWoThi3fp2Mw4f8o69gZiPV5cpjKP
         7WNlbOUXuiCutf9oX4YrV6nyxey1FYEcTH+AK2c7cflCKLsn17CReFaSfEKAX4PDAkgH
         IFk9leK5ncnalPj74idgKbOkul5zN+M2T2c1IM1Uh+5LhiS1YRueiVg8nJc/AZMZiRUN
         j8drgS3MDfIboIpxiJ26PIwwoYMAZPtrUaFToWSbMfM0vSXRQgrpTbsYlEWJh/JqyYIJ
         GzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982510; x=1697587310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtpIsCalLTGmQueM4YNqjpLa94WeoR2Dmd3rkyHSuok=;
        b=qhuLyuHlU+WnXI4n45NwexKbgXn9qV1Ds+1nlxbY7GFsXNBdAByfujdJGGrdIoHoh9
         Wy3lnys5o4wXPD6fYjdc/VjattRAhuyGs4CH45C3/HHLwWZrQPTabEDRn7yavyG0R69I
         OsiLLqRcdojoYADGj1q4MUSthZntqmFoOtlS/TW+kXjyyFHKbNr88CkBVO0NgIUR8z+5
         VCQQlTfnurX+9hAKhX8Vgqm2j36duPewN8Hsphw72k/bnPxR3bfwhWFKdtxT+Xp0hPNr
         /MHIsQdkYeIGqiaTGMzUzTjp6kojluIj2oKrGH5MPwEU/j4CQNEkE0a4u21lD2eYxBAy
         t4Ew==
X-Gm-Message-State: AOJu0YzIPyUGVkQBnDL4VIv0WXMnZFBESQDPyTwF3SbEKhZe1J/CiO7C
	WGjLrbKCcbWUjgUsEMPOjNcjm6kl7ITvB8iwUFc=
X-Google-Smtp-Source: AGHT+IFEzrvBb6DGbBDV2orzsdHJEZahOduWHaY9grfrLrZDA2TTarY8zNeOQpn+p+BfsfZq6n4gig==
X-Received: by 2002:a05:6e02:219a:b0:351:111d:9cfc with SMTP id j26-20020a056e02219a00b00351111d9cfcmr27962959ila.21.1696982510315;
        Tue, 10 Oct 2023 17:01:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.01.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:01:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/20] gstreamer: upgrade 1.22.5 -> 1.22.6
Date: Tue, 10 Oct 2023 14:01:14 -1000
Message-Id: <f481d973d7f942f8a9492cd71985bd1d428ac59a.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188919

From: Archana Polampalli <archana.polampalli@windriver.com>

This release only contains bugfixes and security fixes.

Highlighted bugfixes in 1.22.6:

Security fixes for the MXF demuxer and H.265 video parser
Fix latency regression in H.264 hardware decoder base class
androidmedia: fix HEVC codec profile registration and fix coded_data handling
decodebin3: fix switching from a raw stream to an encoded stream
gst-inspect: prettier and more correct signal and action signals printing
rtmp2: Allow NULL flash version, omitting the field, for better RTMP server compatibility
rtspsrc: better compatibility with buggy RTSP servers that don't set a clock-rate
rtpjitterbuffer: fix integer overflow that led to more packets being declared lost than have been lost
v4l2: fix video encoding regression on RPi and fix support for left and top padding
waylandsink: Crop surfaces to their display width height
cerbero: recognise Manjaro; add Rust support for MSVC ARM64; cmake detection fixes
various bug fixes, build fixes, memory leak fixes, and other stability and reliability improvements

https://nvd.nist.gov/vuln/detail/CVE-2023-40474
https://nvd.nist.gov/vuln/detail/CVE-2023-40475
https://nvd.nist.gov/vuln/detail/CVE-2023-40476

https://gstreamer.freedesktop.org/releases/1.22/#1.22.6

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.22.5.bb => gst-devtools_1.22.6.bb}          | 2 +-
 ...streamer1.0-libav_1.22.5.bb => gstreamer1.0-libav_1.22.6.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb}  | 2 +-
 ...plugins-bad_1.22.5.bb => gstreamer1.0-plugins-bad_1.22.6.bb} | 2 +-
 ...ugins-base_1.22.5.bb => gstreamer1.0-plugins-base_1.22.6.bb} | 2 +-
 ...ugins-good_1.22.5.bb => gstreamer1.0-plugins-good_1.22.6.bb} | 2 +-
 ...ugins-ugly_1.22.5.bb => gstreamer1.0-plugins-ugly_1.22.6.bb} | 2 +-
 ...reamer1.0-python_1.22.5.bb => gstreamer1.0-python_1.22.6.bb} | 2 +-
 ...rtsp-server_1.22.5.bb => gstreamer1.0-rtsp-server_1.22.6.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} | 2 +-
 .../{gstreamer1.0_1.22.5.bb => gstreamer1.0_1.22.6.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.5.bb => gst-devtools_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.5.bb => gstreamer1.0-libav_1.22.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.5.bb => gstreamer1.0-plugins-bad_1.22.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.5.bb => gstreamer1.0-plugins-base_1.22.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.5.bb => gstreamer1.0-plugins-good_1.22.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.5.bb => gstreamer1.0-plugins-ugly_1.22.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.5.bb => gstreamer1.0-python_1.22.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.5.bb => gstreamer1.0-rtsp-server_1.22.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.5.bb => gstreamer1.0_1.22.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
index 3e029396a6..90bbd9c733 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "2add1519aa6eeb01d544cb94293688ee3bc2079f6bca6075bf5c23d00a0921be"
+SRC_URI[sha256sum] = "8928560efaf16137c30285e718708e5d0bab0777eb4ef8127e0274e120d3d86b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
index af9dc5d2d5..8906556b44 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8583f0c1f4fcb01eed11fa1e3c21126543a8bd739ed4fc1db31f756a5ab01d9a"
+SRC_URI[sha256sum] = "7789e6408388a25f23cbf948cfc5c6230d735bbcd8b7f37f4a01c9e348a1e3a7"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
index 5d99810cd4..2579aa3d66 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "cf0cb9c4de06c5d62eef77cb31238bbaf257dc88802010072eedd1c168f136a4"
+SRC_URI[sha256sum] = "223833c42518ad7eb1923bb4dd3726809f59a66d6e9aaaa69cb29ad0750c8758"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
index 94e5bb894c..35c6003cc1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "e64e75cdafd7ff2fc7fc34e855b06b1e3ed227cc06fa378d17bbcd76780c338c"
+SRC_URI[sha256sum] = "b4029cd2908a089c55f1d902a565d007495c95b1442d838485dc47fb12df7137"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
index 74105a44e7..45b806e800 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "edd4338b45c26a9af28c0d35aab964a024c3884ba6f520d8428df04212c8c93a"
+SRC_URI[sha256sum] = "50f2b4d17c02eefe430bbefa8c5cd134b1be78a53c0f60e951136d96cf49fd4b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
index 93f0e76ee9..6b76ba957e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "b67b31313a54c6929b82969d41d3cfdf2f58db573fb5f491e6bba5d84aea0778"
+SRC_URI[sha256sum] = "b3b07fe3f1ce7fe93aa9be7217866044548f35c4a7792280eec7e108a32f9817"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
index 29d705aaaf..77f79a630a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "2680473b218158f18467cac3e1c50291b7ff4e0710dd350a59eaacbc29c09a54"
+SRC_URI[sha256sum] = "3e31454c98cb2f7f6d2d355eceb933a892fa0f1dc09bc36c9abc930d8e29ca48"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
index be817bf3f5..addf12c427 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bf05232415cf6018142ae51dd3b897bb73432687b5ce1786bf46edc6298ce5b0"
+SRC_URI[sha256sum] = "51de2d6d13b12ce095eac97c0b94ee59c2aeba3712bb7462b78c4d57dde176c5"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
index 84c51e8a6c..fd79fe4324 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f343eb54964ebd4d8c071be5eecad586f28feb0156e036e06b148d0e7febb1c0"
+SRC_URI[sha256sum] = "0ae33a8b50443b62f11581a9181e906b41cd3877b2d799dbea72912c3eda4bb3"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
index 231d252323..bf4c105057 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a9a550267c9584df0e8c70434d30476e8fd0018b733c1c1ee33deaf422bdb24b"
+SRC_URI[sha256sum] = "d9ba2fc26bef98c78e982c599f585d46bbb65fe122da89c2d7ab41f468a52c7b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
index 2dacf037f8..a898464322 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "4408d7930f381809e85917acc19712f173261ba85bdf20c5567b2a21b1193b61"
+SRC_URI[sha256sum] = "f500e6cfddff55908f937711fc26a0840de28a1e9ec49621c0b6f1adbd8f818e"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


