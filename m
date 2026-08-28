Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6AFC61DD6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2985.1787945902769425091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wSU6br5j;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso16805915e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945901; x=1788550701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kqs7nn8knDR/c+hm4C80l4Gk1Kfgu/Kg9l1UVtN2w7k=;
        b=wSU6br5j15zjNGRhVn8AoUEYo9BtNeJInBnu6Usv+/1FJfONKuA+Ky95UbcoWGijEp
         wpKAnVbeE/X0bu8li+HyK94Eg6U8U0ixHWH7irbRjYMwacu+LGp/fVHwqa2GrjDbaRUN
         JSmxLQss5RzPm+j05rMGKdWVrnqKsuIjg3Lyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945901; x=1788550701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kqs7nn8knDR/c+hm4C80l4Gk1Kfgu/Kg9l1UVtN2w7k=;
        b=K5Nf2lAANhEAWuUmWf/JkWhnU6wfrefwFCRPU8dXNNqRDZyQxuRGXQrI4LOHGKmK3D
         xN2ROO7XjCpUeAVd91Rc0KGFqCpIanHDWFAg90FoWS0jrz8RQnaeU78F0L6f3qwwzljT
         SAQT/Oz1Ii8xHO59SobVAqFZaUJUMWBdCucuh5ZtwJ6rJPaZDFFV+50lEBOsW543sefh
         0ltwPwdgfw+MP1NfSZc2pbmvTrHO3lLg89PiotZlBU9/E/wQPfOPoJsd93l5nIJfEebB
         B2TIt47yMYKreGcYagFneSoZYbNHNzksYzZOoxqV8hF30ZPUa+bsJVREyobhyWifTErr
         iyEA==
X-Gm-Message-State: AFuF++m29bJ1t+ALaZEeOtcBJCdeMe9KSWwqnvC5CXWe70WqqaC/8kZ0
	e6UHw0ZBDxHADkp8AAweoSBvGRlz8UkVW2pWdnY0mSk6VBwkFn2Imq6d+9Q2zsF+WAhecgtE4FI
	HEecC6QA=
X-Gm-Gg: AR+sD11hxAFPW2VGCxnW6WbyWVkQSWhrXz+Wyq9TPGjVmwtcxucsHs5KS6NKamIXXwX
	3bZ8ayKHuRq2B8z+P9nXoh6tB0yNJkOrvZHW+VInC7ZmuStv7Ay0MhH2GCywhTOyHKYHrxdYrqp
	MzUvlnO4fi9vgiQ6C3hNcz4XC0/68ZuFDXXNaCnfr5qUbGt3bK9euSivbUvgOU0bh1nvo4FWjfJ
	apf4Citg8ybRil22NenfY+bDXldEd2+lbQZZNr4sydkNudJqtYZwrv5wXn0EitWotDf35tiqQn9
	aFUoDwwYaY8GNpkMXPsRMsEprPVYqsHrfRiAi04WkAvHMA12H7YvHhKENNdcqFYo3lvpgIhQ/hp
	RmQIuL73K00noGs5o32zIyRIa18P2q6I4ybYaLlp5D2iY6zXmZALDy75b06Ex7mBJQT9itGEfIX
	NgsXl0KHXxDY09xGlfBZ2BbLAv8zTcmz1Hk24F5JGJ439IyDbuppMsqnYsSyxbdcckw2WZRjNxI
	uaAzAQW/D9Lu8J/3SYpDomoaSZjGX9cMV8ZRVjiNQ86JZJ1ookBbcN9DaRI/fCU
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr118453955e9.13.1787945900878;
        Fri, 28 Aug 2026 12:38:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/56] gstreamer1.0*: upgrade 1.28.4 -> 1.28.5
Date: Fri, 28 Aug 2026 21:35:39 +0200
Message-ID: <f21461ec3c62d8bd1de46f4c462a38cb56b105f2.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244590

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2026-12891 and CVE-2026-12892.

Set their status explicitly as they are RedHat version-less CVEs.
Fix references are in Debian reports [1] and [2].

Refresh patches.

[1] https://security-tracker.debian.org/tracker/CVE-2026-12891
[2] https://security-tracker.debian.org/tracker/CVE-2026-12892

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8aed1d9b14d77d98adde2f6e345b690ab123b72b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{gst-devtools_1.28.4.bb => gst-devtools_1.28.5.bb}        | 2 +-
 .../{gst-examples_1.28.4.bb => gst-examples_1.28.5.bb}        | 2 +-
 ...reamer1.0-libav_1.28.4.bb => gstreamer1.0-libav_1.28.5.bb} | 2 +-
 ...ugins-bad_1.28.4.bb => gstreamer1.0-plugins-bad_1.28.5.bb} | 2 +-
 ...ins-base_1.28.4.bb => gstreamer1.0-plugins-base_1.28.5.bb} | 2 +-
 ...ins-good_1.28.4.bb => gstreamer1.0-plugins-good_1.28.5.bb} | 2 +-
 ...ins-ugly_1.28.4.bb => gstreamer1.0-plugins-ugly_1.28.5.bb} | 2 +-
 ...amer1.0-python_1.28.4.bb => gstreamer1.0-python_1.28.5.bb} | 2 +-
 ...sp-server_1.28.4.bb => gstreamer1.0-rtsp-server_1.28.5.bb} | 2 +-
 .../0002-tests-add-support-for-install-the-tests.patch        | 2 +-
 .../{gstreamer1.0_1.28.4.bb => gstreamer1.0_1.28.5.bb}        | 4 +++-
 11 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.4.bb => gst-devtools_1.28.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.4.bb => gst-examples_1.28.5.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.4.bb => gstreamer1.0-libav_1.28.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.4.bb => gstreamer1.0-plugins-bad_1.28.5.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.4.bb => gstreamer1.0-plugins-base_1.28.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.4.bb => gstreamer1.0-plugins-good_1.28.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.4.bb => gstreamer1.0-plugins-ugly_1.28.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.4.bb => gstreamer1.0-python_1.28.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.4.bb => gstreamer1.0-rtsp-server_1.28.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.4.bb => gstreamer1.0_1.28.5.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
index 9641e42d386..a0775e94add 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.28.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "11d4f1188639d3a9762039065bbb7b2c309b7a8ecc6fa4aed12245568bf00db3"
+SRC_URI[sha256sum] = "7459045db31d6e44600bcbe011dc925750268870e7b90f7e7a0a3af4a21c09e5"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
index ad6374d3fb3..dcdf7fd4331 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "b46f881eaa8126eddfd21b5ae5512f8d4ff36255"
+SRCREV = "727ceb91886862d200f423baf36cde2bb7ce5b4d"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
index 4898c421905..bda9b213a37 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bd17a5df2874a7a58bcbaf7b940223379ad9613624db8ead783db03e74bb904b"
+SRC_URI[sha256sum] = "452854656056f0b16511a1d9ad4f2679ff5e5a87c89f90cf7ee5dec005ddb1e4"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
index e224112d34c..17e49ebbda2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "332b7320f30c60f2d5941446d03b9d05e3781f2c2561befbe88718bd777f0e47"
+SRC_URI[sha256sum] = "d8af55faef2958c1a8663751475ee46f5164877cf4d8c5913ea906ef180aeb71"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
index d9f85417cd8..813d1108fff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "a898afd5766172b0049e6781558e0689098bf87b9d82b846c652e571c01d60d8"
+SRC_URI[sha256sum] = "776f19228f91fd25bbf54d9850597e158507f594872a52b9b6814e2429b43eaa"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
index 9194cae297e..7b8087eecfd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.5.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c825ea737c59cea0e4a0c41da2388045ff5dd32d162220ac93a7a82ee4a04e61"
+SRC_URI[sha256sum] = "58b45d24a1d77b39d7bb7d9ccc6e2d76bbf28618998c335c163f18e6f94a9324"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
index 4c0811a0561..451378cf72a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "5486cd145c5af43259fd37caca59d048e2a67ddb07082ea8f50ef0f02a85f8a5"
+SRC_URI[sha256sum] = "0ef4cf9c3c9a5e776a6ca8d190a31863391b681980252143b822b29aa831e120"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
index 555b3105942..d9179286a38 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c4eb382720b4443fb801a53418dff0bd4cd7478716d5ced493504a675b4d09fd"
+SRC_URI[sha256sum] = "0ac461b5700b9766998aa686439064caf58ca4fdaf848dfd477b5a7700b176cc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
index 338cf85e5e9..0b6672c3a6f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bfb6780542bf0d402736232aeae6c5a1b943c445775bf40305bcb86ca70705a0"
+SRC_URI[sha256sum] = "7e19fddeb1261bebc3ec397857fedd5c77129b66ab52788fdadad05117566225"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 957356c2ba6..5b52d66190d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -22,7 +22,7 @@ diff --git a/meson.build b/meson.build
 index abd0ad6..93cd692 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -661,6 +661,10 @@ if bashcomp_dep.found()
+@@ -662,6 +662,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
index d1f06a52338..2bdb1dc8025 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "f5adc7e8f448c10260b3b25aa101c9d540674c8d9a54c2b77a86d04f2b3b50dd"
+SRC_URI[sha256sum] = "a5a9f783809b17a8eb774f4a7695b2cb8cba6b15520129906f87eaf30e7f8469"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
@@ -72,5 +72,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 CVE_PRODUCT = "gstreamer"
 
 CVE_STATUS[CVE-2026-5056] = "cpe-stable-backport: Fixed since 1.28.2"
+CVE_STATUS[CVE-2026-12891] = "cpe-stable-backport: Fixed since 1.28.5"
+CVE_STATUS[CVE-2026-12892] = "cpe-stable-backport: Fixed since 1.28.5"
 
 PTEST_BUILD_HOST_FILES = ""

