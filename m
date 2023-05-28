Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A38BC7EE2E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.33134.1685293687217273039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Da/C9XxY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso1922527b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293686; x=1687885686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GE//NTIflU9mECMu5aW+lAsmSFaLVjGf58Bwe+vYKQ=;
        b=Da/C9XxYKGotiI4KVljDJ4QzGq+SNaH+8YQ+jhPIWH5LlI1FEV9goAnYxEsUi4c32n
         o8wcDFZ0RmoaMq/VFUA3oQNFAYEZJx5ajnLe0mHYWSNDncFc7bh5YV/kOjO9RKUWB2Mz
         KWTDBDQZZ8km3Uv5lbwRNICsSbO2wAJ0Seu14M6+Ab0BSkHO67/Enb0qlBlzmSH+QXE6
         fzWuxAFZmu6Bm5mZzNqP+mN+R+fDqFOfZieh2ajLEOdGPdK1j+aJB4icVR7rrTEQsyGh
         4syMeXa7knDlfZbJc20sA9014lFtZ71GKlmr15zYMDsMiW7tTCxaaUxBALMtgejamvXU
         UkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293686; x=1687885686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GE//NTIflU9mECMu5aW+lAsmSFaLVjGf58Bwe+vYKQ=;
        b=RabBHdxekr0S/q33HqoREptH76RSBVOO49XIspgMHyPfRO+p/nz6C199DyhSP8WtZi
         XU+0zBxVCrcf4/N4Z30rGwv0yUXTwLYcaxTLmA+9Z2+uF4IYO+f9I7dNyHrIFb83QLD1
         z52vGchCI7U7Kd220i2XDPH95ZTSpRZQYcC9O2bdc5DbeSGVPvJiDbVp0K3JpA8GQy8x
         dWP59TOYnax33sAsNkM/qE9prxma7B3i192n/Y28lfI2ryUm94Uz4ZDGR//ZpLBQJvLb
         Osp0Iwlqk/4dwCdTHt/OU8s3L8tP83Y2dh/2MhpPIJ0/w4H0yS9VfSiaJrpKKK76BnSd
         2ttg==
X-Gm-Message-State: AC+VfDxIxuhtto6ckEkGrgZZRF+4hq0gmKpy4fqgl/f7oX2MyA+Cg25B
	uE82g1i6wqY9wxCF9sHsMGf4X5BqTj/Zm88326c=
X-Google-Smtp-Source: ACHHUZ73qUfClVJ35B7USw2dXzTfYCerWVFHHMpzhBBaWHW5Qx20miNbMCEn13m1GImIIi5TtGU9+w==
X-Received: by 2002:a05:6a00:cc5:b0:643:bb16:7ca6 with SMTP id b5-20020a056a000cc500b00643bb167ca6mr14184138pfv.21.1685293686076;
        Sun, 28 May 2023 10:08:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/12] gstreamer1.0: upgrade 1.22.0 -> 1.22.2
Date: Sun, 28 May 2023 07:07:45 -1000
Message-Id: <aed2b6833370b60c263afdd8beb0b1c20b9c2ec1.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181837

From: Pablo Saavedra <psaavedra@igalia.com>

Changelog:
===========

From 1.22.1:

audio channel-mix: allow up to 64 channels (instead of up to 63 channels)
avfvideosrc: Don't wait on main thread for permissions request
avvidenc: avoid generating inaccurate output timestamps, especially with variable framerate streams
AV1 video codec caps signalling improvements in various elements
codectimestamper: Fix timestamping on sequence update
d3d11overlaycompositor: fix texture width and height
d3d11videosink: Fix rendering on external handle
dashdemux2: fix seek operation taking a log time to finish for some streams
nvencoder: Fix B-frame encoding on Linux and min buffers in auto GPU mode
playbin3: fixing buffering for live pipelines
playbin: fix potential deadlock when stopping stream with subtitles visible
redenc: fix setting of extension ID for twcc
rtspsrc: improved compatibility with more broken RTSP servers
v4l2h264dec: Fix Raspberry Pi4 will not play video in application
vtdec: fix jittery playback of H.264 Level 4.1 movies in macOS
vtdec: Fix non-deterministic frame output after flushing seeks
vtenc: fix handling of interlaced ProRes on Apple M1 hardware
vtenc: don't advertise ARGB/RGBA64 input caps on M1 Pro/Max with macOS <13
wasapi2src: Fix loopback capture on Windows 10 Anniversary Update
tools: better handling of non-ASCII command line arguments on Windows
gst-libav: fix build against newer ffmpeg versions
gst-python: Use arch-specific install dir for gi overrides
cerbero: Fix setuptools site.py breakage in Python 3.11
macOS packages: Fix broken binaries on macos < 11.0
various bug fixes, memory leak fixes, and other stability and reliability improvements

From 1.22.2:

avdec_h264: fix decoder deadlocks with FFmpeg 6.0
rtspsrc: fix regression with URI protocols in OPTIONS requests for RTSP over TLS
rtspsrc: improved control url handling compatibility for broken servers
decklink: fix 10 bit RGB (r210) format auto detection for capture and fix playout if video caps are configured before audio caps
d3d11videosink: Fix tearing in case of fullscreen mode
playbin: fix deadlock when stopping stream with subtitles visible (even more)
typefinding: fix regression not detecting application/dash+xml in some corner cases
osxvideosink: fix broken aspect ratio and frame drawing region
decodebin3, parsebin: Improve elementary stream handling when decoders are not present and fix hang when removing a failing stream
urisourcebin: Propagate sticky events from parsebin, so that the STREAM_START event with the GstStream info is always available when pads get exposed
v4l2: Add support for YVU420M format; mark JPEG content as parsed
h264decoder, h265decoder: DPB bumping process and latency reporting fixes
Opus: Fix reading of extended channel config in MPEG-TS and fix missing sample rate when remuxing from RTP to Matroska
zxing: add support for building against zxing-c++ 2.0
cerbero: Fix packaging of Rust plugins on Android; fix modern Gentoo distro detection
various bug fixes, memory leak fixes, and other stability and reliability improvements

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.22.0.bb => gst-devtools_1.22.2.bb}   | 2 +-
 ...r1.0-libav_1.22.0.bb => gstreamer1.0-libav_1.22.2.bb} | 2 +-
 ...eamer1.0-omx_1.22.0.bb => gstreamer1.0-omx_1.22.2.bb} | 2 +-
 ...-bad_1.22.0.bb => gstreamer1.0-plugins-bad_1.22.2.bb} | 4 ++--
 ...ase_1.22.0.bb => gstreamer1.0-plugins-base_1.22.2.bb} | 4 ++--
 ...ood_1.22.0.bb => gstreamer1.0-plugins-good_1.22.2.bb} | 4 ++--
 ...gly_1.22.0.bb => gstreamer1.0-plugins-ugly_1.22.2.bb} | 4 ++--
 ....0-python_1.22.0.bb => gstreamer1.0-python_1.22.2.bb} | 6 ++++--
 ...rver_1.22.0.bb => gstreamer1.0-rtsp-server_1.22.2.bb} | 2 +-
 ...r1.0-vaapi_1.22.0.bb => gstreamer1.0-vaapi_1.22.2.bb} | 9 +--------
 .../{gstreamer1.0_1.22.0.bb => gstreamer1.0_1.22.2.bb}   | 2 +-
 11 files changed, 18 insertions(+), 23 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.0.bb => gst-devtools_1.22.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.0.bb => gstreamer1.0-libav_1.22.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.0.bb => gstreamer1.0-omx_1.22.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.0.bb => gstreamer1.0-plugins-bad_1.22.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.0.bb => gstreamer1.0-plugins-base_1.22.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.0.bb => gstreamer1.0-plugins-good_1.22.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.0.bb => gstreamer1.0-plugins-ugly_1.22.2.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.0.bb => gstreamer1.0-python_1.22.2.bb} (83%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.0.bb => gstreamer1.0-rtsp-server_1.22.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.0.bb => gstreamer1.0-vaapi_1.22.2.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.0.bb => gstreamer1.0_1.22.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
index 3e9a789d24..8b282bbb7b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4d21fee5c15f2877c0b1f6c2da0cdba67ce7caab2c199ab27e91a1394d5ba195"
+SRC_URI[sha256sum] = "eb62726d3e27a8782369a24fd6364a8885ed2462b3bbdab091dffc8139ee06d8"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
index 625a52ea55..ed3dbaca22 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0e48407b4905227a260213dbda84cba3812f0530fc7a75b43829102ef82810f1"
+SRC_URI[sha256sum] = "fcaaf9878fe8f3bc82317ef13a1558824cb68df1f8968c6797f556c5e33bcffd"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
index ed4c44583e..d2d23050d9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "dbc951a99af532380e599aa8acd9e1385fdb299b46b5868cd2be4230ad888341"
+SRC_URI[sha256sum] = "1b0c57f2cc4ddeec5e7f0c436e502f06665c4e93c73261855b94e04fc94337b2"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
index b9fc17f3e9..6260f9586b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins-common.inc
 require gstreamer1.0-plugins-license.inc
 
-DESCRIPTION = "'Bad' GStreamer plugins and helper libraries "
+SUMMARY = "'Bad' GStreamer plugins and helper libraries "
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues"
 
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3c9d9300f5f4fb3e3d36009379d1fb6d9ecd79c1a135df742b8a68417dd663a1"
+SRC_URI[sha256sum] = "3d8faf1ce3402c8535ce3a8c4e1a6c960e4b5655dbda6b55943db9ac79022d0f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
index 01ef63c104..c1e5d0cd09 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
@@ -1,6 +1,6 @@
 require gstreamer1.0-plugins-common.inc
 
-DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
+SUMMARY = "'Base' GStreamer plugins and helper libraries"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
 LICENSE = "LGPL-2.1-or-later"
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f53672294f3985d56355c8b1df8f6b49c8c8721106563e19f53be3507ff2229d"
+SRC_URI[sha256sum] = "eb65120c4ee79b7a153c3c1972d5c0158c2151877cc51ec7725bba5749679d49"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
index ef4d82c598..a9352949b5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
@@ -1,6 +1,6 @@
 require gstreamer1.0-plugins-common.inc
 
-DESCRIPTION = "'Good' GStreamer plugins"
+SUMMARY = "'Good' GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues"
 
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "582e617271e7f314d1a2211e3e3856ae2e4303c8c0d6114e9c4a5ea5719294b0"
+SRC_URI[sha256sum] = "7c8cc59425f2b232f60ca7d13e56edd615da4f711e73dd01a7cffa46e6bc0cdd"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
index 9c384fea5c..dc81bf27f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins-common.inc
 require gstreamer1.0-plugins-license.inc
 
-DESCRIPTION = "'Ugly GStreamer plugins"
+SUMMARY = "'Ugly GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues"
 
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "a644dc981afa2d8d3a913f763ab9523c0620ee4e65a7ec73c7721c29da3c5a0c"
+SRC_URI[sha256sum] = "8f30f44db0bd063709bf6fbe55138e3a98af0abcb61c360f35582bbe10e80691"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
similarity index 83%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
index c447f2cbe8..ab1600db41 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6c63ad364ca4617eb2cbb3975ab26c66760eb3c7a6adf5be69f99c11e21ef3a5"
+SRC_URI[sha256sum] = "bef2b3d82ce4be46b775b1bb56305c1003ee01b535a53a82f9fe8924972153ad"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
@@ -23,6 +23,8 @@ EXTRA_OEMESON += "\
     -Dlibpython-dir=${libdir} \
 "
 
-inherit meson pkgconfig setuptools3-base upstream-version-is-even
+inherit meson pkgconfig setuptools3-base upstream-version-is-even features_check
 
 FILES:${PN} += "${libdir}/gstreamer-1.0"
+
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
index f943c829c4..02c2badc2a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "aea24eeb59ee5fadfac355de2f7cecb51966c3e147e5ad7cfb4c314f1a4086ed"
+SRC_URI[sha256sum] = "2be4aecfb88710100ea7115ed0216403e8094344ebf146094271b8d4d73828bf"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
index 8a703f533e..6111720976 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "593ccad19f88e5fa29f40f98356c007806bd535828707b1406944d16a90bdff5"
+SRC_URI[sha256sum] = "d2e642f9745f97d9f73a7f5085e7659a9a31fe209b774e6e45dae041b435df06"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
@@ -51,10 +51,3 @@ FILES:${PN} += "${libdir}/gstreamer-*/*.so"
 FILES:${PN}-dbg += "${libdir}/gstreamer-*/.debug"
 FILES:${PN}-dev += "${libdir}/gstreamer-*/*.a"
 FILES:${PN}-tests = "${bindir}/*"
-
-# correct .pc install location - fixed in upstream trunk
-do_install:append() {
-    mkdir -p ${D}/${libdir}/pkgconfig
-    mv ${D}/${libdir}/gstreamer-1.0/pkgconfig/*.pc ${D}/${libdir}/pkgconfig
-    rmdir ${D}/${libdir}/gstreamer-1.0/pkgconfig/
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
index 11002e667d..f6dd2c168e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "78d21b5469ac93edafc6d8ceb63bc82f6cbbee94d2f866cca6b9252157ee0a09"
+SRC_URI[sha256sum] = "b2afe73603921c608ba48969dbb7d743776744bfe5d8059ece241137b7f88e21"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


