Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC02CC636D6
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:53 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.8291.1676011362174896044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ia7h0aw8;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bk16so4023994wrb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr3lqtsBjfJxHPa9jAHFsI2UA7TtKe9tpujBGhAjmzs=;
        b=ia7h0aw8nb6o+VEKWCArJ2ZsA4YRerGJgdD/JDcFMfA1/tVFcXSE1U+9hhUnvTrpZt
         a9E0j0lod/aiu4YyKNxdsEYADYGAGY96tJ8D2TLs3YSWBiEAraJL72mwgTY4ykwrHKEF
         p7hmgzW91EiHvtWWIGrCw5PnUhHYbPp8xwWy4D+jP7zstbVEcR0/HQUIbLcOEeOHTKYT
         zsZ2RWN0kLSLWxoHoaGjUpH9YOtyFTYwTCh09ibVbGh+xmlYDZhx7M7GFbgMiR4kabq0
         HKEMuFoj61J2Tkjp+fn4cXqH+l9VnfmlL5nKxZiXOJrBV+l5uChQBmkmuoggpDVIB7Rl
         IgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xr3lqtsBjfJxHPa9jAHFsI2UA7TtKe9tpujBGhAjmzs=;
        b=HuxPXjgMR3/nkqGqX/B09k1TexKDtHJU8NZ5tFgGB7ZhU4qnqmOrk3QtMVnSqF29ya
         MIfzhZh+iBFa+hgZiiWGACJWtorXu8y7OrwsdBZpa8GKYmvw82Iq7XPL/HU3oXroHTov
         620tP5INOfh28Gv8XOfxG8XCYAZzbmmoaZsOqrjBLFaCvwNqXuTvfhGrPRllOWnXUeYR
         L3YoqIvAfGPHejsyudEDXVQCczS1lSeV11ZZmNqomvrDVuVK6MS9roJgTUFMJ5lLdxAx
         04L6+qdmQsIZVhVaIJg/EhKIInAPTdA0hJ79nyiwvDPhnhbMKzaLFZ+MpHpR76nLSD67
         +sAQ==
X-Gm-Message-State: AO0yUKW9PXHxGxrjeKdl89oRllkdjW6MBlLCO2mtdrwYEXwLWryd58nC
	NstX0lc+zA6t68mBH8jOqVfBaiJsbho=
X-Google-Smtp-Source: AK7set8FD640I9hnKNmAI+mLnxoIeOcWcJaGJgfEBT7NJVwv95byF1i8cYZA1q3g9w/xAtjMTqbrMg==
X-Received: by 2002:adf:fa83:0:b0:2bf:ae16:817c with SMTP id h3-20020adffa83000000b002bfae16817cmr13197473wrr.29.1676011363769;
        Thu, 09 Feb 2023 22:42:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/8] gstreamer1.0: update 1.20.5 -> 1.22.0
Date: Fri, 10 Feb 2023 07:42:15 +0100
Message-Id: <20230210064216.4123807-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210064216.4123807-1-alex@linutronix.de>
References: <20230210064216.4123807-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176981

Drop xingmux license snippet from plugins-ugly as it moved to plugins-good;
the license was LGPL in any case:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/d132592423be64ec18a223b67810ac89f391277e/subprojects/gst-plugins-good/tests/check/elements/xingmux.c

videoconvert/videoscale plgins were merged into one.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...tools_1.20.5.bb => gst-devtools_1.22.0.bb} |   2 +-
 ...1.20.5.bb => gstreamer1.0-libav_1.22.0.bb} |   2 +-
 .../gstreamer/gstreamer1.0-meta-base.bb       |   3 +-
 ...x_1.20.5.bb => gstreamer1.0-omx_1.22.0.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.0.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.0.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.0.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.0.bb} |   4 +-
 ....20.5.bb => gstreamer1.0-python_1.22.0.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.0.bb} |   2 +-
 ...1.20.5.bb => gstreamer1.0-vaapi_1.22.0.bb} |  21 +-
 ...spect-the-idententaion-used-in-meson.patch |  24 +-
 ...ts-add-support-for-install-the-tests.patch |  56 ++--
 ...005-bin-Fix-race-conditions-in-tests.patch | 300 ------------------
 ...er1.0_1.20.5.bb => gstreamer1.0_1.22.0.bb} |   7 +-
 15 files changed, 66 insertions(+), 365 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.5.bb => gst-devtools_1.22.0.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.5.bb => gstreamer1.0-libav_1.22.0.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.5.bb => gstreamer1.0-omx_1.22.0.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.5.bb => gstreamer1.0-plugins-bad_1.22.0.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.5.bb => gstreamer1.0-plugins-base_1.22.0.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.5.bb => gstreamer1.0-plugins-good_1.22.0.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.5.bb => gstreamer1.0-plugins-ugly_1.22.0.bb} (88%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.5.bb => gstreamer1.0-python_1.22.0.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.5.bb => gstreamer1.0-rtsp-server_1.22.0.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.5.bb => gstreamer1.0-vaapi_1.22.0.bb} (70%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.5.bb => gstreamer1.0_1.22.0.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb
index 9db31c18e4..3e9a789d24 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "5684436121b8bae07fd00b74395f95e44b5f26323dce4fa045fa665676807bba"
+SRC_URI[sha256sum] = "4d21fee5c15f2877c0b1f6c2da0cdba67ce7caab2c199ab27e91a1394d5ba195"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
index e5925c6510..625a52ea55 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b152e3cc49d014899f53c39d8a6224a44e1399b4cf76aa5f9a903fdf9793c3cc"
+SRC_URI[sha256sum] = "0e48407b4905227a260213dbda84cba3812f0530fc7a75b43829102ef82810f1"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index 57a9adbaec..6cc11e1928 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -34,8 +34,7 @@ RDEPENDS:gstreamer1.0-meta-base = "\
     gstreamer1.0-plugins-base-audioconvert \
     gstreamer1.0-plugins-base-audioresample \
     gstreamer1.0-plugins-base-typefindfunctions \
-    gstreamer1.0-plugins-base-videoscale \
-    gstreamer1.0-plugins-base-videoconvert \
+    gstreamer1.0-plugins-base-videoconvertscale \
     gstreamer1.0-plugins-good-autodetect \
     gstreamer1.0-plugins-good-soup"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb
index ec5efcd408..ed4c44583e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bcccbc02548cdc123fd49944dd44a4f1adc5d107e36f010d320eb526e2107806"
+SRC_URI[sha256sum] = "dbc951a99af532380e599aa8acd9e1385fdb299b46b5868cd2be4230ad888341"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
index 2f1793d1ce..b9fc17f3e9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "f431214b0754d7037adcde93c3195106196588973e5b32dcb24938805f866363"
+SRC_URI[sha256sum] = "3c9d9300f5f4fb3e3d36009379d1fb6d9ecd79c1a135df742b8a68417dd663a1"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
index c37b542c57..01ef63c104 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "11f911ef65f3095d7cf698a1ad1fc5242ac3ad6c9270465fb5c9e7f4f9c19b35"
+SRC_URI[sha256sum] = "f53672294f3985d56355c8b1df8f6b49c8c8721106563e19f53be3507ff2229d"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
index 0bd953743e..85f8a247b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "e83ab4d12ca24959489bbb0ec4fac9b90e32f741d49cda357cb554b2cb8b97f9"
+SRC_URI[sha256sum] = "582e617271e7f314d1a2211e3e3856ae2e4303c8c0d6114e9c4a5ea5719294b0"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
index f765e626c9..9c384fea5c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
+                   "
 
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LICENSE_FLAGS = "commercial"
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "af67d8ba7cab230f64d0594352112c2c443e2aa36a87c35f9f98a43d11430b87"
+SRC_URI[sha256sum] = "a644dc981afa2d8d3a913f763ab9523c0620ee4e65a7ec73c7721c29da3c5a0c"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
index 05e9ace276..b6782a842d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "27487652318659cfd7dc42784b713c78d29cc7a7df4fb397134c8c125f65e3b2"
+SRC_URI[sha256sum] = "6c63ad364ca4617eb2cbb3975ab26c66760eb3c7a6adf5be69f99c11e21ef3a5"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb
index c9cf42903d..f943c829c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ba398a7ddd559cce56ef4b91f448d174e0dccad98a493563d2d59c41a2ef39c5"
+SRC_URI[sha256sum] = "aea24eeb59ee5fadfac355de2f7cecb51966c3e147e5ad7cfb4c314f1a4086ed"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb
similarity index 70%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb
index 716f50ebe1..8a703f533e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "510c6fb4ff3f676d7946ce1800e04ccf5aabe5a586d4e164d1961808fab8c94b"
+SRC_URI[sha256sum] = "593ccad19f88e5fa29f40f98356c007806bd535828707b1406944d16a90bdff5"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
@@ -40,14 +40,21 @@ PACKAGECONFIG ??= "drm encoders \
                    ${PACKAGECONFIG_GL} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 
-PACKAGECONFIG[drm] = "-Dwith_drm=yes,-Dwith_drm=no,udev libdrm"
-PACKAGECONFIG[egl] = "-Dwith_egl=yes,-Dwith_egl=no,virtual/egl"
-PACKAGECONFIG[encoders] = "-Dwith_encoders=yes,-Dwith_encoders=no"
-PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/libgl"
-PACKAGECONFIG[wayland] = "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland wayland-protocols"
-PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxrandr libxrender"
+PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,udev libdrm"
+PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
+PACKAGECONFIG[encoders] = "-Dencoders=enabled,-Dencoders=disabled"
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/libgl"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libxrandr libxrender"
 
 FILES:${PN} += "${libdir}/gstreamer-*/*.so"
 FILES:${PN}-dbg += "${libdir}/gstreamer-*/.debug"
 FILES:${PN}-dev += "${libdir}/gstreamer-*/*.a"
 FILES:${PN}-tests = "${bindir}/*"
+
+# correct .pc install location - fixed in upstream trunk
+do_install:append() {
+    mkdir -p ${D}/${libdir}/pkgconfig
+    mv ${D}/${libdir}/gstreamer-1.0/pkgconfig/*.pc ${D}/${libdir}/pkgconfig
+    rmdir ${D}/${libdir}/gstreamer-1.0/pkgconfig/
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 312c04fbfd..1b9278db04 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,20 +1,21 @@
-From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17 00:00:00 2001
+From 559e1dd850b2b9eb3a415aa43e932e5e48f605cd Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
-Subject: [PATCH 1/4] tests: respect the idententaion used in meson
+Subject: [PATCH] tests: respect the idententaion used in meson
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- subprojects/gstreamer/tests/check/meson.build | 10 +++++-----
+ tests/check/meson.build | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
-index 9c4228b6e4..506606684d 100644
---- a/subprojects/gstreamer/tests/check/meson.build
-+++ b/subprojects/gstreamer/tests/check/meson.build
-@@ -146,11 +146,11 @@ foreach t : core_tests
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index 9787b0a..16caac7 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
+@@ -145,11 +145,11 @@ foreach t : core_tests
  
    if not skip_test
      exe = executable(test_name, fname,
@@ -22,15 +23,12 @@ index 9c4228b6e4..506606684d 100644
 -        cpp_args : gst_c_args + test_defines,
 -        include_directories : [configinc],
 -        link_with : link_with_libs,
--        dependencies : test_deps + glib_deps + gst_deps,
+-        dependencies : gst_deps + test_deps,
 +      c_args : gst_c_args + test_defines,
 +      cpp_args : gst_c_args + test_defines,
 +      include_directories : [configinc],
 +      link_with : link_with_libs,
-+      dependencies : test_deps + glib_deps + gst_deps,
++      dependencies : gst_deps + test_deps,
      )
  
      env = environment()
--- 
-2.33.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index d18c19c397..568e38cbf1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,7 +1,7 @@
-From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17 00:00:00 2001
+From 08b1aaff972a7f6349373fc1ad4cc23081adb52c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
-Subject: [PATCH 2/4] tests: add support for install the tests
+Subject: [PATCH] tests: add support for install the tests
 
 This will provide to run the tests using the gnome-desktop-testing [1]
 
@@ -10,19 +10,20 @@ This will provide to run the tests using the gnome-desktop-testing [1]
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- subprojects/gstreamer/meson.build             |  4 ++++
- subprojects/gstreamer/meson_options.txt       |  1 +
- subprojects/gstreamer/tests/check/meson.build | 22 ++++++++++++++++++-
- .../gstreamer/tests/check/template.test.in    |  3 +++
+ meson.build                  |  4 ++++
+ meson_options.txt            |  1 +
+ tests/check/meson.build      | 22 +++++++++++++++++++++-
+ tests/check/template.test.in |  3 +++
  4 files changed, 29 insertions(+), 1 deletion(-)
- create mode 100644 subprojects/gstreamer/tests/check/template.test.in
+ create mode 100644 tests/check/template.test.in
 
-diff --git a/subprojects/gstreamer/meson.build b/subprojects/gstreamer/meson.build
-index d20fe0040f..b595d8f990 100644
---- a/subprojects/gstreamer/meson.build
-+++ b/subprojects/gstreamer/meson.build
-@@ -562,6 +562,10 @@ if bashcomp_dep.found()
+diff --git a/meson.build b/meson.build
+index f9f591d..3906fb3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -606,6 +606,10 @@ if bashcomp_dep.found()
    endif
  endif
  
@@ -33,10 +34,10 @@ index d20fe0040f..b595d8f990 100644
  plugins_install_dir = join_paths(get_option('libdir'), 'gstreamer-1.0')
  
  pkgconfig = import('pkgconfig')
-diff --git a/subprojects/gstreamer/meson_options.txt b/subprojects/gstreamer/meson_options.txt
-index 7363bdb7a1..a34ba37dad 100644
---- a/subprojects/gstreamer/meson_options.txt
-+++ b/subprojects/gstreamer/meson_options.txt
+diff --git a/meson_options.txt b/meson_options.txt
+index 7363bdb..a34ba37 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
 @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
@@ -45,10 +46,10 @@ index 7363bdb7a1..a34ba37dad 100644
  
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
-diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
-index 506606684d..00a138a568 100644
---- a/subprojects/gstreamer/tests/check/meson.build
-+++ b/subprojects/gstreamer/tests/check/meson.build
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index 16caac7..f2d400f 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
 @@ -124,10 +124,16 @@ test_defines = [
    '-UG_DISABLE_ASSERT',
    '-UG_DISABLE_CAST_CHECKS',
@@ -67,16 +68,16 @@ index 506606684d..00a138a568 100644
  # sanity checking
  if get_option('check').disabled()
    if get_option('tests').enabled()
-@@ -151,6 +157,8 @@ foreach t : core_tests
+@@ -150,6 +156,8 @@ foreach t : core_tests
        include_directories : [configinc],
        link_with : link_with_libs,
-       dependencies : test_deps + glib_deps + gst_deps,
+       dependencies : gst_deps + test_deps,
 +      install_dir: installed_tests_execdir,
 +      install: installed_tests_enabled,
      )
  
      env = environment()
-@@ -162,6 +170,18 @@ foreach t : core_tests
+@@ -161,6 +169,18 @@ foreach t : core_tests
      env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-scanner')
      env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
  
@@ -95,15 +96,12 @@ index 506606684d..00a138a568 100644
      test(test_name, exe, env: env, timeout : 3 * 60)
    endif
  endforeach
-diff --git a/subprojects/gstreamer/tests/check/template.test.in b/subprojects/gstreamer/tests/check/template.test.in
+diff --git a/tests/check/template.test.in b/tests/check/template.test.in
 new file mode 100644
-index 0000000000..f701627f87
+index 0000000..f701627
 --- /dev/null
-+++ b/subprojects/gstreamer/tests/check/template.test.in
++++ b/tests/check/template.test.in
 @@ -0,0 +1,3 @@
 +[Test]
 +Type=session
 +Exec=@installed_tests_dir@/@program@
--- 
-2.33.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
deleted file mode 100644
index f1fac2df57..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
+++ /dev/null
@@ -1,300 +0,0 @@
-From e1e2d8d58c1e09e065849cdb1f6466c0537a7c51 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 21 Jun 2022 11:51:35 +0300
-Subject: [PATCH] bin: Fix race conditions in tests
-
-The latency messages are non-deterministic and can arrive before/after
-async-done or during state-changes as they are posted by e.g. sinks from
-their streaming thread but bins are finishing asynchronous state changes
-from a secondary helper thread.
-
-To solve this, expect latency messages at any time and assert that we
-receive one at some point during the test.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643]
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- .../gstreamer/tests/check/gst/gstbin.c        | 132 ++++++++++++------
- 1 file changed, 92 insertions(+), 40 deletions(-)
-
-diff --git a/subprojects/gstreamer/tests/check/gst/gstbin.c b/subprojects/gstreamer/tests/check/gst/gstbin.c
-index e366d5fe20f..88ff44db0c3 100644
---- a/subprojects/gstreamer/tests/check/gst/gstbin.c
-+++ b/subprojects/gstreamer/tests/check/gst/gstbin.c
-@@ -27,50 +27,95 @@
- #include <gst/base/gstbasesrc.h>
- 
- static void
--pop_async_done (GstBus * bus)
-+pop_async_done (GstBus * bus, gboolean * had_latency)
- {
-   GstMessage *message;
-+  GstMessageType types = GST_MESSAGE_ASYNC_DONE;
-+
-+  if (!*had_latency)
-+    types |= GST_MESSAGE_LATENCY;
- 
-   GST_DEBUG ("popping async-done message");
--  message = gst_bus_poll (bus, GST_MESSAGE_ASYNC_DONE, -1);
- 
--  fail_unless (message && GST_MESSAGE_TYPE (message)
--      == GST_MESSAGE_ASYNC_DONE, "did not get GST_MESSAGE_ASYNC_DONE");
-+  do {
-+    message = gst_bus_poll (bus, types, -1);
- 
--  gst_message_unref (message);
--  GST_DEBUG ("popped message");
-+    fail_unless (message);
-+    GST_DEBUG ("popped message %s",
-+        gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
-+
-+    if (GST_MESSAGE_TYPE (message) == GST_MESSAGE_LATENCY) {
-+      fail_unless (*had_latency == FALSE);
-+      *had_latency = TRUE;
-+      gst_clear_message (&message);
-+      types &= ~GST_MESSAGE_LATENCY;
-+      continue;
-+    }
-+
-+    fail_unless (GST_MESSAGE_TYPE (message)
-+        == GST_MESSAGE_ASYNC_DONE, "did not get GST_MESSAGE_ASYNC_DONE");
-+
-+    gst_clear_message (&message);
-+    break;
-+  } while (TRUE);
- }
- 
- static void
--pop_latency (GstBus * bus)
-+pop_latency (GstBus * bus, gboolean * had_latency)
- {
-   GstMessage *message;
- 
--  GST_DEBUG ("popping async-done message");
-+  if (*had_latency)
-+    return;
-+
-+  GST_DEBUG ("popping latency message");
-   message = gst_bus_poll (bus, GST_MESSAGE_LATENCY, -1);
- 
--  fail_unless (message && GST_MESSAGE_TYPE (message)
-+  fail_unless (message);
-+  fail_unless (GST_MESSAGE_TYPE (message)
-       == GST_MESSAGE_LATENCY, "did not get GST_MESSAGE_LATENCY");
- 
--  gst_message_unref (message);
--  GST_DEBUG ("popped message");
-+  GST_DEBUG ("popped message %s",
-+      gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
-+  gst_clear_message (&message);
-+
-+  *had_latency = TRUE;
- }
- 
- static void
--pop_state_changed (GstBus * bus, int count)
-+pop_state_changed (GstBus * bus, int count, gboolean * had_latency)
- {
-   GstMessage *message;
--
-+  GstMessageType types = GST_MESSAGE_STATE_CHANGED;
-   int i;
- 
-+  if (!*had_latency)
-+    types |= GST_MESSAGE_LATENCY;
-+
-   GST_DEBUG ("popping %d messages", count);
-   for (i = 0; i < count; ++i) {
--    message = gst_bus_poll (bus, GST_MESSAGE_STATE_CHANGED, -1);
--
--    fail_unless (message && GST_MESSAGE_TYPE (message)
--        == GST_MESSAGE_STATE_CHANGED, "did not get GST_MESSAGE_STATE_CHANGED");
--
--    gst_message_unref (message);
-+    do {
-+      message = gst_bus_poll (bus, types, -1);
-+
-+      fail_unless (message);
-+      GST_DEBUG ("popped message %s",
-+          gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
-+
-+      if (GST_MESSAGE_TYPE (message) == GST_MESSAGE_LATENCY) {
-+        fail_unless (*had_latency == FALSE);
-+        *had_latency = TRUE;
-+        gst_clear_message (&message);
-+        types &= ~GST_MESSAGE_LATENCY;
-+        continue;
-+      }
-+
-+      fail_unless (GST_MESSAGE_TYPE (message)
-+          == GST_MESSAGE_STATE_CHANGED,
-+          "did not get GST_MESSAGE_STATE_CHANGED");
-+
-+      gst_message_unref (message);
-+      break;
-+    } while (TRUE);
-   }
-   GST_DEBUG ("popped %d messages", count);
- }
-@@ -538,6 +583,7 @@ GST_START_TEST (test_message_state_changed_children)
-   GstBus *bus;
-   GstStateChangeReturn ret;
-   GstState current, pending;
-+  gboolean had_latency = FALSE;
- 
-   pipeline = GST_PIPELINE (gst_pipeline_new (NULL));
-   fail_unless (pipeline != NULL, "Could not create pipeline");
-@@ -576,7 +622,7 @@ GST_START_TEST (test_message_state_changed_children)
-   ASSERT_OBJECT_REFCOUNT (sink, "sink", 2);
-   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 2);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
-   fail_if (gst_bus_have_pending (bus), "unexpected pending messages");
- 
-   ASSERT_OBJECT_REFCOUNT (bus, "bus", 2);
-@@ -619,9 +665,9 @@ GST_START_TEST (test_message_state_changed_children)
-    * its state_change message */
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (pipeline, "pipeline", 3, 4);
- 
--  pop_state_changed (bus, 3);
--  pop_async_done (bus);
--  pop_latency (bus);
-+  pop_state_changed (bus, 3, &had_latency);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
-   fail_if ((gst_bus_pop (bus)) != NULL);
- 
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (bus, "bus", 2, 3);
-@@ -648,7 +694,7 @@ GST_START_TEST (test_message_state_changed_children)
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (sink, "sink", 2, 4);
-   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 3);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
-   fail_if ((gst_bus_pop (bus)) != NULL);
- 
-   ASSERT_OBJECT_REFCOUNT (bus, "bus", 2);
-@@ -669,7 +715,7 @@ GST_START_TEST (test_message_state_changed_children)
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (sink, "sink", 3, 4);
-   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 3);
- 
--  pop_state_changed (bus, 6);
-+  pop_state_changed (bus, 6, &had_latency);
-   fail_if ((gst_bus_pop (bus)) != NULL);
- 
-   ASSERT_OBJECT_REFCOUNT (src, "src", 1);
-@@ -696,6 +742,7 @@ GST_START_TEST (test_watch_for_state_change)
-   GstElement *src, *sink, *bin;
-   GstBus *bus;
-   GstStateChangeReturn ret;
-+  gboolean had_latency = FALSE;
- 
-   bin = gst_element_factory_make ("bin", NULL);
-   fail_unless (bin != NULL, "Could not create bin");
-@@ -722,9 +769,9 @@ GST_START_TEST (test_watch_for_state_change)
-       GST_CLOCK_TIME_NONE);
-   fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
- 
--  pop_state_changed (bus, 6);
--  pop_async_done (bus);
--  pop_latency (bus);
-+  pop_state_changed (bus, 6, &had_latency);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
- 
-   fail_unless (gst_bus_have_pending (bus) == FALSE,
-       "Unexpected messages on bus");
-@@ -732,16 +779,17 @@ GST_START_TEST (test_watch_for_state_change)
-   ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PLAYING);
-   fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
- 
-+  had_latency = FALSE;
-   /* this one might return either SUCCESS or ASYNC, likely SUCCESS */
-   ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
-   gst_element_get_state (GST_ELEMENT (bin), NULL, NULL, GST_CLOCK_TIME_NONE);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
-   if (ret == GST_STATE_CHANGE_ASYNC) {
--    pop_async_done (bus);
--    pop_latency (bus);
-+    pop_async_done (bus, &had_latency);
-+    pop_latency (bus, &had_latency);
-   }
- 
-   fail_unless (gst_bus_have_pending (bus) == FALSE,
-@@ -898,6 +946,7 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
-   GstStateChangeReturn ret;
-   GstState current, pending;
-   GstBus *bus;
-+  gboolean had_latency = FALSE;
- 
-   pipeline = gst_pipeline_new (NULL);
-   fail_unless (pipeline != NULL, "Could not create pipeline");
-@@ -951,10 +1000,11 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
-   ASSERT_STATE_CHANGE_MSG (bus, sink, GST_STATE_READY, GST_STATE_PAUSED, 107);
- #else
- 
--  pop_state_changed (bus, 2);   /* pop remaining ready => paused messages off the bus */
-+  pop_state_changed (bus, 2, &had_latency);     /* pop remaining ready => paused messages off the bus */
-   ASSERT_STATE_CHANGE_MSG (bus, pipeline, GST_STATE_READY, GST_STATE_PAUSED,
-       108);
--  pop_async_done (bus);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
- #endif
-   /* PAUSED => PLAYING */
-   GST_DEBUG ("popping PAUSED -> PLAYING messages");
-@@ -972,8 +1022,8 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
-   fail_if (ret != GST_STATE_CHANGE_SUCCESS, "State change to READY failed");
- 
-   /* TODO: do we need to check downwards state change order as well? */
--  pop_state_changed (bus, 4);   /* pop playing => paused messages off the bus */
--  pop_state_changed (bus, 4);   /* pop paused => ready messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop playing => paused messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop paused => ready messages off the bus */
- 
-   while (GST_OBJECT_REFCOUNT_VALUE (pipeline) > 1)
-     THREAD_SWITCH ();
-@@ -1002,6 +1052,7 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
-   GstStateChangeReturn ret;
-   GstState current, pending;
-   GstBus *bus;
-+  gboolean had_latency = FALSE;
- 
-   /* (2) Now again, but check other code path where we don't have
-    *     a proper sink correctly flagged as such, but a 'semi-sink' */
-@@ -1056,10 +1107,11 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
-   ASSERT_STATE_CHANGE_MSG (bus, src, GST_STATE_READY, GST_STATE_PAUSED, 206);
-   ASSERT_STATE_CHANGE_MSG (bus, sink, GST_STATE_READY, GST_STATE_PAUSED, 207);
- #else
--  pop_state_changed (bus, 2);   /* pop remaining ready => paused messages off the bus */
-+  pop_state_changed (bus, 2, &had_latency);     /* pop remaining ready => paused messages off the bus */
-   ASSERT_STATE_CHANGE_MSG (bus, pipeline, GST_STATE_READY, GST_STATE_PAUSED,
-       208);
--  pop_async_done (bus);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
- 
-   /* PAUSED => PLAYING */
-   GST_DEBUG ("popping PAUSED -> PLAYING messages");
-@@ -1076,8 +1128,8 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
-   fail_if (ret != GST_STATE_CHANGE_SUCCESS, "State change to READY failed");
- 
-   /* TODO: do we need to check downwards state change order as well? */
--  pop_state_changed (bus, 4);   /* pop playing => paused messages off the bus */
--  pop_state_changed (bus, 4);   /* pop paused => ready messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop playing => paused messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop paused => ready messages off the bus */
- 
-   GST_DEBUG ("waiting for pipeline to reach refcount 1");
-   while (GST_OBJECT_REFCOUNT_VALUE (pipeline) > 1)
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
index ce9c1c116f..2f80b9ee3e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
@@ -17,13 +17,12 @@ S = "${WORKDIR}/gstreamer-${PV}"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
            file://run-ptest \
-           file://0001-tests-respect-the-idententaion-used-in-meson.patch;striplevel=3 \
-           file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 \
+           file://0001-tests-respect-the-idententaion-used-in-meson.patch \
+           file://0002-tests-add-support-for-install-the-tests.patch \
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
-           file://0005-bin-Fix-race-conditions-in-tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
+SRC_URI[sha256sum] = "78d21b5469ac93edafc6d8ceb63bc82f6cbbee94d2f866cca6b9252157ee0a09"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.30.2


