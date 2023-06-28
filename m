Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8509C001DB
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:24 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.7299.1687919424080358777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=dph4rVsL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-53482b44007so2793556a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919423; x=1690511423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDr/zEj9o/kQ/+lSfVHDk8KRBGz05dn2/lbt37d8txg=;
        b=dph4rVsLEc2fkgVeVOzcyq4oDlPNAy1gy/IEyhKOYJEso2KCBbDUOF5nhqi0rUWNaq
         IqYA7TjpPs5TvpjY3Uxn98uxtT9DroHm/9fWUWdVLJWHyzQ0od9wGWmL/ONYjZQe1Mbm
         c4nMVkotbQYp7P7an7ztLIZugTINeQfAaVeuNiqQpN0f/RSEWqZ05a/wUsS0kfE+bzZy
         rT2q8EOb+5qg7B7k2WiRc70CMi7P+RCD8ES0n9YMVEcow9zwDn811inAmqUlt/hYSviJ
         NZNNUYh/9HcIVawGYMaae3es63pfvaARrpwLGih3V6keN0uGYBl75i6f2U3UtQeG7j9I
         IIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919423; x=1690511423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDr/zEj9o/kQ/+lSfVHDk8KRBGz05dn2/lbt37d8txg=;
        b=Ky7YMlFcT2f9Gm7CrWD+yWlez/ZxA7szw8KjOYBZ+NbJCFQNoDfKW0IqqWS5G/12ef
         4kQidQL+kXDURZAthsMGKrualKBH9ExcGq2pi65CSNCKT+wxaZ2gIwcP0JLuvQGhNoUw
         81uJX5XK6NQmjhTST6CixscS+4GXbyZqLutHGyFGWyfKylGe1VPoWgOc5XNO8kT51ngI
         Sg9vmsiIvYiJjCF/CpchSNMJN/ipIUzPl7X0K2nuU3NCOzn4dqEXotdrpCoQIzyHN2BB
         jndkGgDDEChehEVIXwVITtc1WqjHlGiZzTgE9tA2FNyOAV4eVB8oqbSZXIo9yL7avRp8
         kptA==
X-Gm-Message-State: AC+VfDzuNczkIpgO9D1LwRxIY9s2dodtFml66qc9vc+qjRhFZ5w83P7W
	4ZHONMS0XuWnzt4ho8gQ8vm7pGALqTQKps9MHcYLzw==
X-Google-Smtp-Source: ACHHUZ5gObw+ImWFAJzF3EzDmgjgZkaOpFWt96p8lxg4VoxiYF7us34+aqfA4oSEneXVeXglYNz7Lg==
X-Received: by 2002:a05:6a21:99a6:b0:125:b415:f7cb with SMTP id ve38-20020a056a2199a600b00125b415f7cbmr10587966pzb.58.1687919422943;
        Tue, 27 Jun 2023 19:30:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/30] gstreamer1.0: upgrade 1.22.2 -> 1.22.3
Date: Tue, 27 Jun 2023 16:29:33 -1000
Message-Id: <2bc75dea621f1d206ee43a5000d05cf959cd44e9.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183526

From: Anuj Mittal <anuj.mittal@intel.com>

The third 1.22 bug-fix release (1.22.3) was released on 19 May 2023.

This release only contains bugfixes and it should be safe to update from 1.22.x.

Highlighted bugfixes in 1.22.3

avdec: fix occasional video decoder deadlock on seeking with FFmpeg 6.0
decodebin3: fix regression handling input streams without CAPS or TIME segment such as e.g. udpsrc or `pushfilesrc
bluez: a2dpsink: fix Bluetooth SIG Certification test failures
osxvideosink: fix deadlock upon closing output window
qtdemux: fix edit list handling regression and AV1 codec box parsing
qtmux: fix extraction of CEA608 closed caption data from S334-1A packets
rtspsrc: Fix handling of * control path
splitmux: timestamp handling improvements
v4l2videodec: Rework dynamic resolution change handling (needed for IMX6 mainline codec)
videoflip: fix regression with automatically rotating video based on tags
d3d11: many d3d11videosink and d3d11compositor fixes
webrtc, rtp: numerous data race fixes and stability fixes
various bug fixes, memory leak fixes, and other stability and reliability improvements

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8ff5c4bfe46bb325535041a9127356ae425dbe5f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.22.2.bb => gst-devtools_1.22.3.bb}          | 2 +-
 ...streamer1.0-libav_1.22.2.bb => gstreamer1.0-libav_1.22.3.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.2.bb => gstreamer1.0-omx_1.22.3.bb}  | 2 +-
 ...plugins-bad_1.22.2.bb => gstreamer1.0-plugins-bad_1.22.3.bb} | 2 +-
 ...ugins-base_1.22.2.bb => gstreamer1.0-plugins-base_1.22.3.bb} | 2 +-
 ...ugins-good_1.22.2.bb => gstreamer1.0-plugins-good_1.22.3.bb} | 2 +-
 ...ugins-ugly_1.22.2.bb => gstreamer1.0-plugins-ugly_1.22.3.bb} | 2 +-
 ...reamer1.0-python_1.22.2.bb => gstreamer1.0-python_1.22.3.bb} | 2 +-
 ...rtsp-server_1.22.2.bb => gstreamer1.0-rtsp-server_1.22.3.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.2.bb => gstreamer1.0-vaapi_1.22.3.bb} | 2 +-
 .../{gstreamer1.0_1.22.2.bb => gstreamer1.0_1.22.3.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.2.bb => gst-devtools_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.2.bb => gstreamer1.0-libav_1.22.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.2.bb => gstreamer1.0-omx_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.2.bb => gstreamer1.0-plugins-bad_1.22.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.2.bb => gstreamer1.0-plugins-base_1.22.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.2.bb => gstreamer1.0-plugins-good_1.22.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.2.bb => gstreamer1.0-plugins-ugly_1.22.3.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.2.bb => gstreamer1.0-python_1.22.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.2.bb => gstreamer1.0-rtsp-server_1.22.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.2.bb => gstreamer1.0-vaapi_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.2.bb => gstreamer1.0_1.22.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
index 8b282bbb7b..fa82ef7861 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "eb62726d3e27a8782369a24fd6364a8885ed2462b3bbdab091dffc8139ee06d8"
+SRC_URI[sha256sum] = "446ac9c42d502cbfd9081737cc1b853b3c1f50db77ca7ccd01aea10f687550c1"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
index ed3dbaca22..c5af676a95 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fcaaf9878fe8f3bc82317ef13a1558824cb68df1f8968c6797f556c5e33bcffd"
+SRC_URI[sha256sum] = "2ec5c805808b4371a7e32b1da0202a1c8a6b36b6ce905080bf5c34097d12a923"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
index d2d23050d9..694a12b1c1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1b0c57f2cc4ddeec5e7f0c436e502f06665c4e93c73261855b94e04fc94337b2"
+SRC_URI[sha256sum] = "6f51c2331c334593c2c3cf12e9f22b9e3b419a3247cfb2fec0e1bd845569863a"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
index 6260f9586b..bbcbded1ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3d8faf1ce3402c8535ce3a8c4e1a6c960e4b5655dbda6b55943db9ac79022d0f"
+SRC_URI[sha256sum] = "e1798fee2d86127f0637481c607f983293bf0fd81aad70a5c7b47205af3621d8"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
index c1e5d0cd09..44056b04e9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "eb65120c4ee79b7a153c3c1972d5c0158c2151877cc51ec7725bba5749679d49"
+SRC_URI[sha256sum] = "1c596289a0d4207380233eba8c36a932c4d1aceba19932937d9b57c24cef89f3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
index a9352949b5..8de1d1c5f5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "7c8cc59425f2b232f60ca7d13e56edd615da4f711e73dd01a7cffa46e6bc0cdd"
+SRC_URI[sha256sum] = "af81154b3a2ef3f4d2feba395f25696feea6fd13ec62c92d3c7a973470710273"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
index dc81bf27f6..21102d59b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "8f30f44db0bd063709bf6fbe55138e3a98af0abcb61c360f35582bbe10e80691"
+SRC_URI[sha256sum] = "3dc98ed5c2293368b3c4e6ce55d89be834a0a62e9bf88ef17928cf03b7d5a360"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
index ab1600db41..0cf1908e76 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bef2b3d82ce4be46b775b1bb56305c1003ee01b535a53a82f9fe8924972153ad"
+SRC_URI[sha256sum] = "70bed3fabe634bc622ef6de4e6eb1c33bc9cefd64bdab200f6fa316b468c731c"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
index 02c2badc2a..0f8a89db7c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2be4aecfb88710100ea7115ed0216403e8094344ebf146094271b8d4d73828bf"
+SRC_URI[sha256sum] = "d02a39dfa9bdbf99a3dd2d378e17942b3ce42dfe36fb0c27e2d0b01722fc561d"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
index 6111720976..6e0014c090 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d2e642f9745f97d9f73a7f5085e7659a9a31fe209b774e6e45dae041b435df06"
+SRC_URI[sha256sum] = "a27867062e8b69305fca5b7d3f13ed7c318b703e7d72756c94395bd305c7b32c"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
index f6dd2c168e..ca7548758c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "b2afe73603921c608ba48969dbb7d743776744bfe5d8059ece241137b7f88e21"
+SRC_URI[sha256sum] = "9ffeab95053f9f6995eb3b3da225e88f21c129cd60da002d3f795db70d6d5974"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


