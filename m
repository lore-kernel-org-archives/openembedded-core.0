Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3FAEE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:37 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.13053.1692801387535431942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qoPvKFPR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-565403bda57so3258174a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801386; x=1693406186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCM18Dk0iZ029F+t+0ppxO3sZk3esYwHoQUavb2JT4I=;
        b=qoPvKFPRA+D+z9pjB8//gs5QOpVykAxFM6Po4NdkKPHszSAhG+HFQvh71KTDs1qdHk
         e8QjCh3osWK/iFyPTbL177BYzcJZAeSsFrjlwuYv4jdLWd1kMNCzgKVlyHQKvIASkAKr
         lI5DdIzdEWdm7dDUHMHzZuHA2HkRB7038i29V8DbmAyzWG1m2B2EtcuUgCJN+4zXNjY4
         oqCmBvIoqQh1TvF09DpmB0qD4iwMHefjVZ1GyToTWyf1U5dPKyHexP2zAGOI8eba+7xm
         LocrVvONYT6RI7Vy+eRROYmpL56oEWGwuhS+LNvNbh2Xdndat/6GqxVfcouHMttomb37
         hv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801386; x=1693406186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCM18Dk0iZ029F+t+0ppxO3sZk3esYwHoQUavb2JT4I=;
        b=Wn9hpHuefx1R+Xso2kixLQJgvxYF50+72BVqMnWkKepv9sZg+zK8jMrVX5fvBjqoGp
         vGVbMiFF2tA0EzYI7WlnelB2zyZe03/EI1e3Fuk/Ge2KEttIg4dtAkMUSYEL3anCiLI+
         RlSFn2kOXoDlM0/7gQJYR0SqwfUujG1Tn6oQ37guLZ4vD5ruopAAR/9+sqix5lhUwkUi
         RUSCa0j3Q1yOHGpcYzJBQQNoU9/cSzWcFLcYkaM5xINjN20++xX15RT0Rtwq796YGf9B
         AaDaQPX8O+vA62K/UbDnaeA+VVdsvdoyORI5nbLMpRxL3vZYVWGQcTqCJNIZsJSY7Sj9
         wnBA==
X-Gm-Message-State: AOJu0YyxK3qLJLYeuroe5WHjq8Cutjwb1IV/UfTDo7YTYAwUPp8KMHhG
	PtdlEtjKOzIei7BQLDtfSFto6cqDzkYBbQ7F/zw=
X-Google-Smtp-Source: AGHT+IFvytTrm4mAUGbdSvu/xuhvgpo6BwSmKpGnmu8Pt03483Ob0VobYq5N7TRkTTUpcZ36kcL94w==
X-Received: by 2002:a17:90b:11cd:b0:26b:6e98:29ce with SMTP id gv13-20020a17090b11cd00b0026b6e9829cemr8846498pjb.27.1692801386389;
        Wed, 23 Aug 2023 07:36:26 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/36] gstreamer1.0: upgrade 1.20.6 -> 1.20.7
Date: Wed, 23 Aug 2023 04:35:35 -1000
Message-Id: <c6b7492406540aca60dfd8c9913c7ac14fcc750f.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186586

From: Archana Polampalli <archana.polampalli@windriver.com>

This release only contains bugfixes.

Highlighted bugfixes in 1.20.7:

Security fixes for flacparse, dvdspu, and subparse, and the RealMedia demuxer
h265parse: Fix framerate handling
filesink: Fix buffered mode writing of buffer lists and buffers with multiple memories
asfmux, rtpbin_buffer_list test: fix possible unaligned write/read on 32-bit ARM
ptp clock: Work around bug in ptpd in default configuration
qtdemux: fix reverse playback regression with edit lists
rtspsrc: various control path handling server compatibility improvements
avviddec: fix potential deadlock on seeking with FFmpeg 6.x
cerbero: Fix pango crash on 32bit Windows; move libass into non-GPL codecs
Miscellaneous bug fixes, memory leak fixes, and other stability and reliability improvements

https://nvd.nist.gov/vuln/detail/CVE-2023-37327
https://nvd.nist.gov/vuln/detail/CVE-2023-37328
https://nvd.nist.gov/vuln/detail/CVE-2023-37329

https://gstreamer.freedesktop.org/releases/1.20/#1.20.7

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.20.6.bb => gst-devtools_1.20.7.bb}          | 2 +-
 ...streamer1.0-libav_1.20.6.bb => gstreamer1.0-libav_1.20.7.bb} | 2 +-
 .../{gstreamer1.0-omx_1.20.6.bb => gstreamer1.0-omx_1.20.7.bb}  | 2 +-
 ...plugins-bad_1.20.6.bb => gstreamer1.0-plugins-bad_1.20.7.bb} | 2 +-
 ...ugins-base_1.20.6.bb => gstreamer1.0-plugins-base_1.20.7.bb} | 2 +-
 ...ugins-good_1.20.6.bb => gstreamer1.0-plugins-good_1.20.7.bb} | 2 +-
 ...ugins-ugly_1.20.6.bb => gstreamer1.0-plugins-ugly_1.20.7.bb} | 2 +-
 ...reamer1.0-python_1.20.6.bb => gstreamer1.0-python_1.20.7.bb} | 2 +-
 ...rtsp-server_1.20.6.bb => gstreamer1.0-rtsp-server_1.20.7.bb} | 2 +-
 ...streamer1.0-vaapi_1.20.6.bb => gstreamer1.0-vaapi_1.20.7.bb} | 2 +-
 .../{gstreamer1.0_1.20.6.bb => gstreamer1.0_1.20.7.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.6.bb => gst-devtools_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.6.bb => gstreamer1.0-libav_1.20.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.6.bb => gstreamer1.0-omx_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.6.bb => gstreamer1.0-plugins-bad_1.20.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.6.bb => gstreamer1.0-plugins-base_1.20.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.6.bb => gstreamer1.0-plugins-good_1.20.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.6.bb => gstreamer1.0-plugins-ugly_1.20.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.6.bb => gstreamer1.0-python_1.20.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.6.bb => gstreamer1.0-rtsp-server_1.20.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.6.bb => gstreamer1.0-vaapi_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.6.bb => gstreamer1.0_1.20.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.7.bb
index 2eee50e6d8..2409ea25e1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "2c64037c823fb88751a47dacf3d4752a52b7951190d6e05fc44855e912e81d71"
+SRC_URI[sha256sum] = "2df2ddfee05f6ce978207de9086ca22f00fc36e04f74a11869074da178585e35"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.7.bb
index c54913e8a1..f3f53893b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7d619a030542a4a5a11e0302742a3d9b05f8e5cfc453025683a0379bc50aa013"
+SRC_URI[sha256sum] = "65e776e366f7f3549a9a829418817f464dcc5dc9845220c64a886683d8841b56"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.7.bb
index b29d393bfe..bcbe0206d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "48e82008a2a0ad5f4b525aba8a6c49c4ca2d7d25c6b1b14d107dd747e26d5a8e"
+SRC_URI[sha256sum] = "e3dd418e3235db044104c1cb024f609e57035251fd1718e4e3e5d64780af1805"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index fdb4509691..86b5301d8e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "d98c73fa5cdddb372a91199464515cfc80c89bbe05e3d4387ea4381e4224483a"
+SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index 8d1aef1fc8..8822c6a905 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "54eac357d6cd66f183b94a26e493bf4d5781bc76bc60cad122742626caf8f1a3"
+SRC_URI[sha256sum] = "fde6696a91875095d82c1012b5777c28ba926047ffce08508e12c1d2c66f0057"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index 81f5dd0932..dfb0c0f342 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "e51365cfa9b19bd736dafe2c8828254a55d66996a3c60550bb0d50041c381a44"
+SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.7.bb
index e62e9e9815..1068bb4d80 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.7.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "ca3fb6abc9f6e981d204a736c254e50cc1786a2f5038d83023e42ea009b10246"
+SRC_URI[sha256sum] = "e761665bb3c66fb35ff3567a283b3763b494acf0fe1df8f4abeda047b22dbc55"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.7.bb
index 77745b8ba9..83445fab09 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "aa619e08ddd9f92755f4bd24ba9577e81ae4c86bff170c3e574153ec3cdc80cc"
+SRC_URI[sha256sum] = "a63db0cb502308446db3d3b0a23772f1966f9f2b98fddc22fca49560a0575adc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
index 017edec426..2901be69d2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "800122a798387bd4b18b558737d30a010d94154f41bd210d4c4cc2d80ecae90f"
+SRC_URI[sha256sum] = "2c8f46aa9df2245e5b39a2082be8e9d3edc0f61bc34f667803d7a21da1b51987"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.7.bb
index d67abf408c..21676bddde 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "57028a2cdabb749eb38a53f45cfa36f02b4e5368fb6d8684ef31d9e73ddf653b"
+SRC_URI[sha256sum] = "40b9747408c7066a1344adae001d2d53203adda012814944a1c0a5cff3f33dd6"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 7ceb319d9b..6d002198ae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "0545b030960680f71a95f9d39c95daae54b4d317d335e8f239d81138773c9b90"
+SRC_URI[sha256sum] = "1757184a07b9703219e8b1961f81cb1dd64320d147fc045ac8eb499efbea79be"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


