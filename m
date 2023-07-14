Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4470C3DA40
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.816.1689374005059012577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cBGNQnUM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666e6541c98so2363497b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374004; x=1691966004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acTJ9G93htgI9+fjpAksQQ+x2uGfW6xnSrGznrhJ83E=;
        b=cBGNQnUMjms0SgzIeaftfbncHJCm1V7RFheqSGymHJBn3ZSxjDHDby9WSO7XPS0T5y
         xlzoK9t56E6tazkyjnfG4lLWJDulhU5AlwmnN+//REgtwDB9k5labN1M752gdRiVEuyt
         nWOA/lkIAVGwz2tzrzCwnUJVosclzXwkhUyRzqCQAeER7+LwpXC2uyeScS51gbyscpNs
         yBz9bM45UfRAIUBiH3h80ZvNJxeh0PjT5TDGf0Cg8m129yx9UFsqRmkbRHsWYEcw6f41
         0OWf+cPZAVQFsfQG1OUhV2bKafcenke9jPC9Byw1ck1hbPbD62JKuZxXvIu1Tt78aZTF
         aJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374004; x=1691966004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acTJ9G93htgI9+fjpAksQQ+x2uGfW6xnSrGznrhJ83E=;
        b=It6KkaywC0XaY0x1I+qzkjihw3KV81DNNnjwAaMmYQTc1lXJTnTOf4iXHf/tTfT7SU
         5wDbhN5GWsqqKzyUekV4JA83YveIGxchFI2vAp7ziJI95S05z6MxoCzMIi1XOW1Pk5hf
         dFO0hcWmdQb7R/yLpjNnFob/TgG++bDtEypltqmcdr/WVtgDrsoaCYKIFDCrCbQXM+Sz
         k8o65sgKGB7oHggue/4RnDi32pWeDvkwm/yKDKLbFISeUFl8sOJB4TnBCVktJqdEWnLD
         +i8aulBN85vXkIjvvb8tegM8fh0O6mApY5KvJHVnM7aqBvV2dK4uGIrjEEWdhcjtje7I
         vOOA==
X-Gm-Message-State: ABy/qLZlRAz1gn8OQf4oG79mhBQCtrpR9Iu68OZt2/Cm3aU+u4n3Wum4
	d0C9/pIwLFv529FC8wPz6jMqbNc9wnagmiTdPYw=
X-Google-Smtp-Source: APBJJlE7zGJyq++Pm1Y4i+RcgyxJM1A5CcBRQfG3qwXZfphmInJfOQLYjNOpk0WD0zzP2xcQo6PX4g==
X-Received: by 2002:a17:903:32c9:b0:1b8:860c:2a7 with SMTP id i9-20020a17090332c900b001b8860c02a7mr7287599plr.28.1689374003925;
        Fri, 14 Jul 2023 15:33:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/26] gstreamer1.0: upgrade 1.22.3 -> 1.22.4
Date: Fri, 14 Jul 2023 12:32:41 -1000
Message-Id: <a071696747ece93409d533a2e966cd59195a056d.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184289

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
==========
-   Security fixes for flacparse, dvdspu, and subparse
-   d3d11videosink: Fix error on pause and play
-   decklink: Correctly handle SDK strings on macOS and free strings
    after usage on Linux
-   filesink: Fix buffered mode writing of buffer lists and buffers with
    multiple memories
-   gldownload: handle passthrough without a critical
-   h265parse: Fix framerate handling regression
-   oggdemux: vp8 fixes
-   mp4mux, qtmux, qtdemux: Opus audio mapping fixes
-   pngdec: Fix wrong colours output from 16bit RGB images
-   ptp clock: Work around ptpd bug in default configuration
-   srtpdec: fix critical warnings on shutdown
-   v4l2src: fix support for bayer format
-   v4l2videoenc: support force-keyframe event in v4l2 encoder
-   vtenc: apply DTS offset to ensure DTS <= PTS
-   gst-python: allow more functions to be called before gst_init()
-   cerbero: fix vaapi variant; add qt6 build on windows; ensure errors
    on unguarded use of new APIs, require macOS 10.13
-   packages: ship codecalpha, rtponvif, dvbsubenc, switchbin,
    videosignal plugins; fix pango crash on 32-bit windows
-   various bug fixes, memory leak fixes, and other stability and
    reliability improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7bf88db7f2f55540bf7891474a3a28f5681ddbb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.22.3.bb => gst-devtools_1.22.4.bb}          | 2 +-
 ...streamer1.0-libav_1.22.3.bb => gstreamer1.0-libav_1.22.4.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.3.bb => gstreamer1.0-omx_1.22.4.bb}  | 2 +-
 ...plugins-bad_1.22.3.bb => gstreamer1.0-plugins-bad_1.22.4.bb} | 2 +-
 ...ugins-base_1.22.3.bb => gstreamer1.0-plugins-base_1.22.4.bb} | 2 +-
 ...ugins-good_1.22.3.bb => gstreamer1.0-plugins-good_1.22.4.bb} | 2 +-
 ...ugins-ugly_1.22.3.bb => gstreamer1.0-plugins-ugly_1.22.4.bb} | 2 +-
 ...reamer1.0-python_1.22.3.bb => gstreamer1.0-python_1.22.4.bb} | 2 +-
 ...rtsp-server_1.22.3.bb => gstreamer1.0-rtsp-server_1.22.4.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.3.bb => gstreamer1.0-vaapi_1.22.4.bb} | 2 +-
 .../{gstreamer1.0_1.22.3.bb => gstreamer1.0_1.22.4.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.3.bb => gst-devtools_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.3.bb => gstreamer1.0-libav_1.22.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.3.bb => gstreamer1.0-omx_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.3.bb => gstreamer1.0-plugins-bad_1.22.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.3.bb => gstreamer1.0-plugins-base_1.22.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.3.bb => gstreamer1.0-plugins-good_1.22.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.3.bb => gstreamer1.0-plugins-ugly_1.22.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.3.bb => gstreamer1.0-python_1.22.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.3.bb => gstreamer1.0-rtsp-server_1.22.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.3.bb => gstreamer1.0-vaapi_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.3.bb => gstreamer1.0_1.22.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
index fa82ef7861..beaf1a9b91 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "446ac9c42d502cbfd9081737cc1b853b3c1f50db77ca7ccd01aea10f687550c1"
+SRC_URI[sha256sum] = "4c52053ce8c1df72fd81721e9f53de3b146edcf2de28f607be705bce4cf909d1"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
index c5af676a95..4d59353e08 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2ec5c805808b4371a7e32b1da0202a1c8a6b36b6ce905080bf5c34097d12a923"
+SRC_URI[sha256sum] = "9a751bc740de768e791c37a95f0a924c6a41d12fd7f37f54ce6a4e834be122d3"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
index 694a12b1c1..fc70805daf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6f51c2331c334593c2c3cf12e9f22b9e3b419a3247cfb2fec0e1bd845569863a"
+SRC_URI[sha256sum] = "5fcb872d977b035fb75a2d0ea955ba052dc3bdae282f8f60aa9d865808784211"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
index bbcbded1ac..da6f69c2d3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "e1798fee2d86127f0637481c607f983293bf0fd81aad70a5c7b47205af3621d8"
+SRC_URI[sha256sum] = "eaaf53224565eaabd505ca39c6d5769719b45795cf532ce1ceb60e1b2ebe99ac"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
index 44056b04e9..7b78c7d5c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "1c596289a0d4207380233eba8c36a932c4d1aceba19932937d9b57c24cef89f3"
+SRC_URI[sha256sum] = "292424e82dea170528c42b456f62a89532bcabc0508f192e34672fb86f68e5b8"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
index 8de1d1c5f5..0ae1758a3f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "af81154b3a2ef3f4d2feba395f25696feea6fd13ec62c92d3c7a973470710273"
+SRC_URI[sha256sum] = "d7120c1146a9d723d53d5bfe8074da2575a81f0598438752937f39bb7c833b6a"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
index 21102d59b6..1b3d3b6da7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "3dc98ed5c2293368b3c4e6ce55d89be834a0a62e9bf88ef17928cf03b7d5a360"
+SRC_URI[sha256sum] = "ffb461fda6c06d316c4be5682632cc8901454ed72b1098b1e0221bc55e673cd7"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
index 0cf1908e76..e35bef3d56 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "70bed3fabe634bc622ef6de4e6eb1c33bc9cefd64bdab200f6fa316b468c731c"
+SRC_URI[sha256sum] = "e1302dcc0f2451b64380dcc0dd3b82735795e8951dc812d938d8ba91f388163e"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
index 0f8a89db7c..29eb4bb011 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d02a39dfa9bdbf99a3dd2d378e17942b3ce42dfe36fb0c27e2d0b01722fc561d"
+SRC_URI[sha256sum] = "4666612d7a99c60dcd6f0bdba1b7a74d2562a0501b2a3e0576f0916bf1d8811b"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
index 6e0014c090..34c15bb377 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a27867062e8b69305fca5b7d3f13ed7c318b703e7d72756c94395bd305c7b32c"
+SRC_URI[sha256sum] = "967b8e353d82d0081a68dc53639b25d9fb4ca89bfa1e061403e0cd7d23585ba6"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
index ca7548758c..2eadb79637 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "9ffeab95053f9f6995eb3b3da225e88f21c129cd60da002d3f795db70d6d5974"
+SRC_URI[sha256sum] = "11cb0498bc16b93d8b99d22f75f829b8d0abfd8254840b2120618db5532dc655"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


