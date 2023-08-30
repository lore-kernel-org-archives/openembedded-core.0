Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A47C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.1286.1693417723132392050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rCGziHsl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68a410316a2so4312151b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417722; x=1694022522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvPzqtaSzVCOadygMVv5shVpeNorg+cSS+YbtYx1EKQ=;
        b=rCGziHsl/NXmwGwnQbAmDCUPmCCuw3rQERb8jDffR9CBXh1g4BUKv3V/vlsCanAmPc
         0kC9Ilzgnx0lAfBkkjE3LH6CmRLjWfIRZSQvNYGXsNNQSPkcVAGokU9iquyttjS5FqMt
         bMJTg8oNlew0M5PXW6kLl7n5h4BHCPeghYqXxIX/dY01E/xdW1UEvYowmGS1mILiQRK0
         8rZx70uD5xP1UZ65YPwCqt5AzLRVcyGstl3uQZCuRsOk91I9rZoham8t8JJlgyJYQp6y
         tWe1lulSlK7Hv461x8lZKbsXfXTCJQkkY6jFKWbQqtA8a2JTgf23WGAEg0zUUDow/Ucn
         PL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417722; x=1694022522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvPzqtaSzVCOadygMVv5shVpeNorg+cSS+YbtYx1EKQ=;
        b=PB2RtVnrucQXsgLrBG0iQdu8Dmjjp7FYF4ftYQuYkTFkugR0r4TIsSZSTj1h+cK0UN
         jL00KIC4TiIAYoR8AYjI25wheuA9WGtuiJTiXierza9VOxt0a2g52zZhcNBpJJvbTX5C
         4Ydj16wNugQkdkcmGcaeI88edmrO67yQBJw28y8TWy+dSiL7IG+U3oNd3NkFaxWzPIqf
         WxXFrNKDYuaxsomi4GbewRXQC52FltjlwtHIfxZC2Hv3ucN4FluGbXS2CDUbwb0qWvNu
         1FUxAYFtDubLchFV199QVuIPaZHpk4AyMIw8tX65SpuIVz4i7qRL+o7kQZH/qKBD8m68
         ZVKA==
X-Gm-Message-State: AOJu0YxZrs9dvruw77n9vvUtYhBh6C34Ji6d2YxP2Jzeq/WOLvZZ0KqZ
	Gjgk511nbGeJSpWC5qAIKJjqqc1XU2qusOtf0Cc=
X-Google-Smtp-Source: AGHT+IFAv43tfGj7x3L9LGTH+b6o0ua36xtAU71Ol3vCyFXlPLCyrh/DJ7uCDFfcU1jyE/3bDCDKFA==
X-Received: by 2002:a05:6a00:cd3:b0:68a:4bef:5f9a with SMTP id b19-20020a056a000cd300b0068a4bef5f9amr3531799pfv.0.1693417722160;
        Wed, 30 Aug 2023 10:48:42 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/20] gstreamer1.0: upgrade 1.22.4 -> 1.22.5
Date: Wed, 30 Aug 2023 07:48:09 -1000
Message-Id: <2b41b6054936ee8d5237a981f8cbdcbea54d244c.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186907

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a894c9499863f127380c38f0b17d51b356391821)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.22.4.bb => gst-devtools_1.22.5.bb}          | 2 +-
 ...streamer1.0-libav_1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb}  | 2 +-
 ...plugins-bad_1.22.4.bb => gstreamer1.0-plugins-bad_1.22.5.bb} | 2 +-
 ...ugins-base_1.22.4.bb => gstreamer1.0-plugins-base_1.22.5.bb} | 2 +-
 ...ugins-good_1.22.4.bb => gstreamer1.0-plugins-good_1.22.5.bb} | 2 +-
 ...ugins-ugly_1.22.4.bb => gstreamer1.0-plugins-ugly_1.22.5.bb} | 2 +-
 ...reamer1.0-python_1.22.4.bb => gstreamer1.0-python_1.22.5.bb} | 2 +-
 ...rtsp-server_1.22.4.bb => gstreamer1.0-rtsp-server_1.22.5.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} | 2 +-
 .../{gstreamer1.0_1.22.4.bb => gstreamer1.0_1.22.5.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.4.bb => gst-devtools_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.4.bb => gstreamer1.0-plugins-bad_1.22.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.4.bb => gstreamer1.0-plugins-base_1.22.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.4.bb => gstreamer1.0-plugins-good_1.22.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.4.bb => gstreamer1.0-plugins-ugly_1.22.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.4.bb => gstreamer1.0-python_1.22.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.4.bb => gstreamer1.0-rtsp-server_1.22.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.4.bb => gstreamer1.0_1.22.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
index beaf1a9b91..3e029396a6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4c52053ce8c1df72fd81721e9f53de3b146edcf2de28f607be705bce4cf909d1"
+SRC_URI[sha256sum] = "2add1519aa6eeb01d544cb94293688ee3bc2079f6bca6075bf5c23d00a0921be"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
index 4d59353e08..af9dc5d2d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9a751bc740de768e791c37a95f0a924c6a41d12fd7f37f54ce6a4e834be122d3"
+SRC_URI[sha256sum] = "8583f0c1f4fcb01eed11fa1e3c21126543a8bd739ed4fc1db31f756a5ab01d9a"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
index fc70805daf..5d99810cd4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5fcb872d977b035fb75a2d0ea955ba052dc3bdae282f8f60aa9d865808784211"
+SRC_URI[sha256sum] = "cf0cb9c4de06c5d62eef77cb31238bbaf257dc88802010072eedd1c168f136a4"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
index da6f69c2d3..94e5bb894c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "eaaf53224565eaabd505ca39c6d5769719b45795cf532ce1ceb60e1b2ebe99ac"
+SRC_URI[sha256sum] = "e64e75cdafd7ff2fc7fc34e855b06b1e3ed227cc06fa378d17bbcd76780c338c"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
index 7b78c7d5c9..74105a44e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "292424e82dea170528c42b456f62a89532bcabc0508f192e34672fb86f68e5b8"
+SRC_URI[sha256sum] = "edd4338b45c26a9af28c0d35aab964a024c3884ba6f520d8428df04212c8c93a"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
index 0ae1758a3f..93f0e76ee9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "d7120c1146a9d723d53d5bfe8074da2575a81f0598438752937f39bb7c833b6a"
+SRC_URI[sha256sum] = "b67b31313a54c6929b82969d41d3cfdf2f58db573fb5f491e6bba5d84aea0778"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
index 1b3d3b6da7..29d705aaaf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "ffb461fda6c06d316c4be5682632cc8901454ed72b1098b1e0221bc55e673cd7"
+SRC_URI[sha256sum] = "2680473b218158f18467cac3e1c50291b7ff4e0710dd350a59eaacbc29c09a54"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
index e35bef3d56..be817bf3f5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e1302dcc0f2451b64380dcc0dd3b82735795e8951dc812d938d8ba91f388163e"
+SRC_URI[sha256sum] = "bf05232415cf6018142ae51dd3b897bb73432687b5ce1786bf46edc6298ce5b0"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
index 29eb4bb011..84c51e8a6c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4666612d7a99c60dcd6f0bdba1b7a74d2562a0501b2a3e0576f0916bf1d8811b"
+SRC_URI[sha256sum] = "f343eb54964ebd4d8c071be5eecad586f28feb0156e036e06b148d0e7febb1c0"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
index 34c15bb377..231d252323 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "967b8e353d82d0081a68dc53639b25d9fb4ca89bfa1e061403e0cd7d23585ba6"
+SRC_URI[sha256sum] = "a9a550267c9584df0e8c70434d30476e8fd0018b733c1c1ee33deaf422bdb24b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
index 2eadb79637..2dacf037f8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "11cb0498bc16b93d8b99d22f75f829b8d0abfd8254840b2120618db5532dc655"
+SRC_URI[sha256sum] = "4408d7930f381809e85917acc19712f173261ba85bdf20c5567b2a21b1193b61"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


