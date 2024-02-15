Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E62BC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.17939.1708013918305100832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uqgJDfy9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d746ce7d13so10010835ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013917; x=1708618717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57KPadf2M6lZzgYObYCVlnNIStxkpSt0xWe7SnP8GNQ=;
        b=uqgJDfy982Xx91KCPeCWyv/6JXSg8lpX7+K34Wh2a3jRGiBX9sv11Gmo5OQzzMBSs/
         cxO/81RMyhmnopgeDeSP60zs6gbFUl9s2CSPnD5rnpP3A5MNPRWJbW9PCioosjN6HKNw
         8dNEFPcm1px44eHMBR4iyH/wb88SO6x6QaXdsq6i1MOftnUtvWZqsdcQzoEKkQ2WWv7Q
         oCCEu0pnmPdsaulgKcdb8vkQJvarcioNZTN4mF4kvo9r1PMqStP5NSY3w08R4UIYgB3/
         063O7l83RwZwbNKb7VCJWz2XKb11Yq9tQdr5cCQnGLzIk8qvjVXwAUlTgzm3Q9zYBzUY
         26cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013917; x=1708618717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57KPadf2M6lZzgYObYCVlnNIStxkpSt0xWe7SnP8GNQ=;
        b=QzQaTmiSj/IiXlfH8I6u4YhHJiENQ0cnIF/ytfUgCQgNp7/x/ywdgmAQ9taIzkrPGw
         ciPkbxkHdhjH9qYgBX1Sri399BtKyBwS2rwJBP+2kB73jY0GOruDFKKENjnBWz2BkGno
         Q5fLxVrxMZf9VGuM14eMq6A7TOXMep9+b/bat9K5U0La1VckPJ0uC+ya6RAT8q/FwsBl
         a+OrCR52kp3GqrTmacK/1Q6nEZfS1QS69Txfm+LgyYN+Fz3yx8E0AFOKFwyAsBORw7ZQ
         4FgjiDyVSnAimPFq0QMngLjoZ+1fOFLgsVC6TTHQCLBpgOrTtfp0xO4iVjJfXUNSieq1
         tlyw==
X-Gm-Message-State: AOJu0Yz9Xjizc0Q/ZjVq5WzuMte1C2FnjsG69I/2S29ZLIfWb1cNOK5W
	0TQSHXS+Mim3Z6mF4t48Qwt/w5Nr9yc8e1Xp9n2ma9NksZ0qID1r2kIRp2UGyyRTq6w656BYlZu
	0i4Y=
X-Google-Smtp-Source: AGHT+IEyiacasu8YLP+HEUiTXSlER+K4xKlyCIfH/NwvMeRwu1CLISB8w2lo56Lc/83kfZDBY2ITiw==
X-Received: by 2002:a17:902:6b4b:b0:1da:933:fb15 with SMTP id g11-20020a1709026b4b00b001da0933fb15mr2136912plt.0.1708013917485;
        Thu, 15 Feb 2024 08:18:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/21] gstreamer: upgrade 1.22.8 -> 1.22.9
Date: Thu, 15 Feb 2024 06:17:57 -1000
Message-Id: <cc21356c4147f47bc6879826bf2e801cb3acd695.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195534

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://gstreamer.freedesktop.org/releases/1.22

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30b3835c367ff1de00d24cddf3bd920ea29f15c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.22.8.bb => gst-devtools_1.22.9.bb}         | 2 +-
 ...treamer1.0-libav_1.22.8.bb => gstreamer1.0-libav_1.22.9.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.8.bb => gstreamer1.0-omx_1.22.9.bb} | 2 +-
 ...lugins-bad_1.22.8.bb => gstreamer1.0-plugins-bad_1.22.9.bb} | 2 +-
 ...gins-base_1.22.8.bb => gstreamer1.0-plugins-base_1.22.9.bb} | 2 +-
 ...gins-good_1.22.8.bb => gstreamer1.0-plugins-good_1.22.9.bb} | 2 +-
 ...gins-ugly_1.22.8.bb => gstreamer1.0-plugins-ugly_1.22.9.bb} | 3 ++-
 ...eamer1.0-python_1.22.8.bb => gstreamer1.0-python_1.22.9.bb} | 2 +-
 ...tsp-server_1.22.8.bb => gstreamer1.0-rtsp-server_1.22.9.bb} | 2 +-
 ...treamer1.0-vaapi_1.22.8.bb => gstreamer1.0-vaapi_1.22.9.bb} | 2 +-
 .../{gstreamer1.0_1.22.8.bb => gstreamer1.0_1.22.9.bb}         | 2 +-
 11 files changed, 12 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.8.bb => gst-devtools_1.22.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.8.bb => gstreamer1.0-libav_1.22.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.8.bb => gstreamer1.0-omx_1.22.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.8.bb => gstreamer1.0-plugins-bad_1.22.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.8.bb => gstreamer1.0-plugins-base_1.22.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.8.bb => gstreamer1.0-plugins-good_1.22.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.8.bb => gstreamer1.0-plugins-ugly_1.22.9.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.8.bb => gstreamer1.0-python_1.22.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.8.bb => gstreamer1.0-rtsp-server_1.22.9.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.8.bb => gstreamer1.0-vaapi_1.22.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.8.bb => gstreamer1.0_1.22.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
index 16a2dd85ce..f60234b528 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "cd634056fcb16d035b3df5953ec85ae8bd56c68f29920b720ef920ca71ea76a7"
+SRC_URI[sha256sum] = "02e29400b44e9cc603aa6444dee5726b57edabef6455e6d0921ffed6f13840ee"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
index 7c75173989..10536acc87 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "be39349bc07ab4cdbd9a5fd6ea9848c601c7560ba5a0577ad5200b83bd424981"
+SRC_URI[sha256sum] = "192f7d27d21c1e7c72c339a2647a9b0c247fedc62ea5029115f8c3e22ebb87d8"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
index 5aa9c9cc41..05d64748bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "94df10e7713618f0c8a4223f6e047f2d8f0ccecba1d585618e791f13037762df"
+SRC_URI[sha256sum] = "9362d6117985d09dcf6e27bdaef377dc08efb7df01d00101d04fb644addac61e"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.9.bb
index a14a4efce9..6e5aa2f206 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.9.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "458783f8236068991e3e296edd671c8eddb8be6fac933c1c2e1503462864ea0f"
+SRC_URI[sha256sum] = "1bc65d0fd5f53a3636564efd3fcf318c3edcdec39c4109a503c1fc8203840a1d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb
index df5eab0464..980766c74b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "eb6792e5c73c6defb9159c36ea6e4b78a2f8af6512678b4bd3b02c8d2d492acf"
+SRC_URI[sha256sum] = "fac3e0dd2d8e9370388b34bf8c21b89d5f63bc3cfc12cd7fdc8fc6c1cba03334"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.9.bb
index dd309fc6fe..052ba1801b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.9.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "e305b9f07f52743ca481da0a4e0c76c35efd60adaf1b0694eb3bb021e2137e39"
+SRC_URI[sha256sum] = "26959fcfebfff637d4ea08ef40316baf31b61bb7729820b0684e800c3a1478b6"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb
index 478fa8f318..722f8e9fe3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.9.bb
@@ -14,7 +14,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "0761d96ba508e01c0271881b26828c2bffd7d8afd50872219f088f755b252ca7"
+
+SRC_URI[sha256sum] = "0bf685d66015a01dd3fc1671b64a1c8acb321dd9d4ab9e05a29ab19782aa6236"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
index fc182af976..e086fa6866 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d5cb8f144054a2a110e6672bd512e4b15d5b1b8d9879c192b9723535efb70b8f"
+SRC_URI[sha256sum] = "3f9d5c6ffefda268703744b592a6b3983aa6723273b1220ecbcb62c2a5800009"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.9.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.9.bb
index 97fa86b533..e232263a46 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.9.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "705177051c229976f171adcd7ab9762ae6bcc4bb77dc308a0bd80a63da6c337f"
+SRC_URI[sha256sum] = "808af148f89404ff74850f8ca5272bed4bfe67f9620231dc4514fd07eb26d0a4"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.9.bb
index 52ac7cd2a5..c53ee29051 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1298ba347a70c42b88cdebf91b659fea02b1bb7269eabf8e29e3c0bd58278928"
+SRC_URI[sha256sum] = "8ba20da8c4cbf5b2953dba904672c4275d0053e1528f97fdf8e59942c7883ca8"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
index 374a32ef96..b4ab6ad10c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "ad4e3db1771139b1db17b1afa7c05db083ae0100bd4da244b71f162dcce41bfc"
+SRC_URI[sha256sum] = "1e7124d347e8cdc80f08ec1d370c201be513002af1102bb20e83c5279cb48ebd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


