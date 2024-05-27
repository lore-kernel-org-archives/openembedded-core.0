Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ED3C25B78
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:36 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.3637.1716833546970287289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MlJt+saF;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6267778b3aso4530166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833545; x=1717438345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjxPAWRKT6dOEnmpBYTF8IhWYbkLDzaR0sQzWY0lM3M=;
        b=MlJt+saFK1VkdGz5uwWb8YbpWiahKhnSbx1jYrrkz7sL+ZrFx1nFSkt3lirUQvVyRK
         y1RNV6upG3rpEzjBf4isVM/OKLcJLtkIzSBOlzSeQ8NJmaozLgmqu2kdm+2xjrhUsesk
         KJ1PQ2DeCy3LkvzhY/Wb1ZD3UAxkq4vsdcgqCLI+re2PSmiGX6EnZ3QZy4TRxZYCSlFs
         0BbfSdKDkeYZKHCvTWGJje67gJSvhbirNLHl/5gzYso/I1kmGaTg0xOq9JNZZu55tR3+
         U9Ea6UzTHwrjJ5I7cE2qCl6wpA6FOO1vHQIeGQED3Sn/eceNy/qn6mXHVOXtXmn01zFs
         fHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833545; x=1717438345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjxPAWRKT6dOEnmpBYTF8IhWYbkLDzaR0sQzWY0lM3M=;
        b=I8laqoyXCkH+7ADzd/hwniPLQolNc0ikULHQ3pwlV/eHuDnTjSZN1EAyqT366HEN43
         HuNNa/r6VcHDGJB2C7dmOrRRk6WLWE7TDd+MdIF3irlBXlywk19kgChYeqFi5zpDXMej
         SF4KJ7PVI6B9ErjRkBFyaV197drQHUYQe9Z5n9f8YOANSMQtTWd8Ny2jzYD/upULd2Po
         sGq2caBRQpvaPbGOtduDgIJJ13qEHaNV6ZcZFjq3UZTp8hMxzfZlZo7Zs143gFlaIjL+
         Q+qzBlzh+fEFApRYF9+NOSVGaL3T4H4sUKlsjBYrS7l9Kp3snSTfUr+HxVOaFb3irAkT
         DZ3w==
X-Gm-Message-State: AOJu0YwptB0UQXHqyaZ3kSaHGsBoeniznZYdiMdl5+uazZQ7G7VebZkb
	HDYbAq71vR/LCzvdgG5VzJbkU3qh8d9g7h/E7ASMWQNzc11L0ZYc8/3wJg==
X-Google-Smtp-Source: AGHT+IEDNXtjhoivw+U2zm2efA2gk5M8FrCkqVDkyyGzU2OA1WgPNTcjPXkOwxWi1OmcJDfYxAvBJA==
X-Received: by 2002:a17:907:7637:b0:a5a:3c65:ccc7 with SMTP id a640c23a62f3a-a626525e028mr579188666b.75.1716833544897;
        Mon, 27 May 2024 11:12:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/13] gstreamer1.0: update 1.22.11 -> 1.24.3
Date: Mon, 27 May 2024 20:12:13 +0200
Message-Id: <20240527181214.1778037-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199929

From: Alexander Kanavin <alex@linutronix.de>

Drop gstreamer1.0-omx recipe as upstream has removed it:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/4976

kate plugin dropped from bad.

amrnb/amrwb moved from ugly to good.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...ct-has-a-different-signature-on-musl.patch |  3 +-
 ...ools_1.22.11.bb => gst-devtools_1.24.3.bb} |  2 +-
 ....22.11.bb => gstreamer1.0-libav_1.24.3.bb} |  2 +-
 .../gstreamer/gstreamer1.0-omx_1.22.11.bb     | 47 -------------------
 ...ialized-warnings-when-compiling-with.patch |  5 +-
 ...-avoid-including-sys-poll.h-directly.patch |  5 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch | 19 ++++----
 ....bb => gstreamer1.0-plugins-bad_1.24.3.bb} |  3 +-
 ...et-caps-from-src-pad-when-query-caps.patch |  5 +-
 ...parse-enhance-SSA-text-lines-parsing.patch |  5 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |  3 +-
 ...bb => gstreamer1.0-plugins-base_1.24.3.bb} |  2 +-
 ...ine-ioctl_req_t-for-posix-linux-case.patch | 38 ---------------
 ...bb => gstreamer1.0-plugins-good_1.24.3.bb} |  7 +--
 ...bb => gstreamer1.0-plugins-ugly_1.24.3.bb} |  4 +-
 ...22.11.bb => gstreamer1.0-python_1.24.3.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.24.3.bb} |  2 +-
 ....22.11.bb => gstreamer1.0-vaapi_1.24.3.bb} |  2 +-
 ...spect-the-idententaion-used-in-meson.patch |  7 ++-
 ...ts-add-support-for-install-the-tests.patch | 21 ++++-----
 ...s-use-a-dictionaries-for-environment.patch |  7 ++-
 ...er-script-to-run-the-installed_tests.patch |  7 ++-
 ...r1.0_1.22.11.bb => gstreamer1.0_1.24.3.bb} |  2 +-
 24 files changed, 51 insertions(+), 150 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.11.bb => gst-devtools_1.24.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.24.3.bb} (91%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.11.bb => gstreamer1.0-plugins-bad_1.24.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.11.bb => gstreamer1.0-plugins-base_1.24.3.bb} (98%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.11.bb => gstreamer1.0-plugins-good_1.24.3.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.24.3.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.11.bb => gstreamer1.0-python_1.24.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.24.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.24.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.11.bb => gstreamer1.0_1.24.3.bb} (97%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1cb2f708faa..2951277b7f9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -244,7 +244,6 @@ RECIPE_MAINTAINER:pn-gst-devtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-gst-examples = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-gstreamer1.0 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-libav = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-gstreamer1.0-omx = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-meta-base = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-bad = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-base = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 21e30d6d464..8520567f177 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 0c73b8131efba63c5cd37ea8c7551434c3b57304 Mon Sep 17 00:00:00 2001
+From c20894a5e6f52aa9fe3437e733a228b1a0eb6428 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
@@ -11,7 +11,6 @@ typcasted to struct sockaddr_in* type inside the function before use
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  validate/plugins/fault_injection/socket_interposer.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
index 2be406192fa..9df802afe99 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "07766425ecb5bf857ab5ad3962321c55cd89f9386b720843f9df71c0a455eb9b"
+SRC_URI[sha256sum] = "b91114a2fd958f42acf441186e87e2bec93538ef35a9f8248111197360ffb237"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
index f3287efa960..d468f2983c8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6b13dcc9332ef27a7c1e7005c0196883874f91622f8aa6e52f218b05b15d2bf5"
+SRC_URI[sha256sum] = "d9c5b152468a45c1fa8351410422090a7192707ad74d2e1a4367f5254e188d91"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
deleted file mode 100644
index 97348fb398d..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "OpenMAX IL plugins for GStreamer"
-DESCRIPTION = "Wraps available OpenMAX IL components and makes them available as standard GStreamer elements."
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-SECTION = "multimedia"
-
-LICENSE = "LGPL-2.1-or-later"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
-
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
-
-SRC_URI[sha256sum] = "18dfdf5f6b773d67e62a315c6cf6247da320b83603a5819493f53c69ed2eeef6"
-
-S = "${WORKDIR}/gst-omx-${PV}"
-
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad virtual/libomxil"
-
-inherit meson pkgconfig upstream-version-is-even
-
-GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
-GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
-
-EXTRA_OEMESON += "-Dtarget=${GSTREAMER_1_0_OMX_TARGET}"
-
-python __anonymous () {
-    omx_target = d.getVar("GSTREAMER_1_0_OMX_TARGET")
-    if omx_target in ['generic', 'bellagio']:
-        # Bellagio headers are incomplete (they are missing the OMX_VERSION_MAJOR,#
-        # OMX_VERSION_MINOR, OMX_VERSION_REVISION, and OMX_VERSION_STEP macros);
-        # appending a directory path to gst-omx' internal OpenMAX IL headers fixes this
-        d.appendVar("CFLAGS", " -I${S}/omx/openmax")
-    elif omx_target == "rpi":
-        # Dedicated Raspberry Pi OpenMAX IL support makes this package machine specific
-        d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH"))
-}
-
-set_omx_core_name() {
-	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}${sysconfdir}/xdg/gstomx.conf"
-}
-do_install[postfuncs] += " set_omx_core_name "
-
-FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES:${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-
-VIRTUAL-RUNTIME_libomxil ?= "libomxil"
-RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_libomxil}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index a57fcd7d21a..13a481485ae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From 8be0c6ac60c96e87d8aa443be9c431844dc3d92a Mon Sep 17 00:00:00 2001
+From bb7f964d51de6b888b3b7a6d0c3d260fcad24008 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -6,13 +6,12 @@ Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
 ---
  gst-libs/gst/codecparsers/gstvc1parser.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
-index 2c60ced..e8226d8 100644
+index f9af175..6661e2e 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
 @@ -1730,7 +1730,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 6509a293b75..298337cb0a0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 426ee79adeecc24605426030a486d7c5a755048c Mon Sep 17 00:00:00 2001
+From 25efc5b2d22aed4527470ef93970664b210bf8c5 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
@@ -8,13 +8,12 @@ musl libc generates warnings if <sys/poll.h> is included directly.
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
 ---
  sys/dvb/gstdvbsrc.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index b8e5b1a..5bca6e5 100644
+index 33ee3ff..b8ddea9 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
 @@ -98,7 +98,7 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 50a3143eca1..965053348fd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From e6eb7536fcfc2c75f7831f67b1f16f3f36ef2545 Mon Sep 17 00:00:00 2001
+From 39fbcdfc5383bdae95293a3109c847f64d193b54 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -12,18 +12,17 @@ Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
- ext/opencv/meson.build | 3 +++
+ gst-libs/gst/opencv/meson.build | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/ext/opencv/meson.build b/ext/opencv/meson.build
-index 37e2015..326f737 100644
---- a/ext/opencv/meson.build
-+++ b/ext/opencv/meson.build
-@@ -87,6 +87,9 @@ if opencv_found
-   opencv_prefix = opencv_dep.get_variable('prefix')
-   gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
+diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
+index 1d337f1..f47939a 100644
+--- a/gst-libs/gst/opencv/meson.build
++++ b/gst-libs/gst/opencv/meson.build
+@@ -52,6 +52,9 @@ if opencv_found
+   # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
+   gstopencv_cargs += cxx.get_supported_arguments(['-Wno-missing-include-dirs', '-Wno-format-nonliteral'])
  
 +  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
 +  opencv_prefix = pkgconf_sysroot + opencv_prefix
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
index 523ee7a5aec..b2a42fd7bdc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "808d3b33fc4c71aeb2561c364a87c2e8a3e2343319a83244c8391be4b09499c8"
+SRC_URI[sha256sum] = "e90f26c7dc9c76f4aa599b758cfd6d8c10d6a0b9cb265ba2c3c9bdf3888558f8"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
@@ -124,7 +124,6 @@ EXTRA_OEMESON += " \
     -Dgs=disabled \
     -Dgsm=disabled \
     -Diqa=disabled \
-    -Dkate=disabled \
     -Dladspa=disabled \
     -Dldac=disabled \
     -Dlv2=disabled \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 34c99ded429..38d0fbf6bfb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 63fe5a7b4ef70e2c490bad3b0838329935a8d77c Mon Sep 17 00:00:00 2001
+From 5a4d65e13a326103ac02f156c01b6fcbb0269902 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -8,7 +8,6 @@ https://bugzilla.gnome.org/show_bug.cgi?id=728312
 Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
-
 ---
  gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)
@@ -17,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 173da37..2b7f34c
+index ef0ff90..53f05c8
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 2adeae93d67..4090b77c8d4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 7bf9525528c8f4a47413d7f82214d76f95f0c5f6 Mon Sep 17 00:00:00 2001
+From 21b8339077f52ec9220e0d3d1f3872e23c7c2e88 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -9,7 +9,6 @@ and there's are maybe multiple Dialog lines in one input buffer.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/178]
 
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
-
 ---
  gst/subparse/gstssaparse.c | 150 +++++++++++++++++++++++++++++++++----
  1 file changed, 134 insertions(+), 16 deletions(-)
@@ -18,7 +17,7 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index d6fdb9c..5ebe678
+index 42fbb42..2dab51c
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
 @@ -270,6 +270,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index a605533be83..ab46ecee5df 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 2b07840122bc2e83bd23dad59aa80d9479f2e1e4 Mon Sep 17 00:00:00 2001
+From 246e6f5ed75696b2e9d9a9ee8cd59252724e1334 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
@@ -8,7 +8,6 @@ This prevents build errors due to missing GST_API_* symbols
 Upstream-Status: Pending
 
 Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
-
 ---
  gst-libs/gst/gl/gl-prelude.h | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb
index 7aa10eb6464..8a967cf6eb6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "65eaf72296cc5edc985695a4d80affc931e64a79f4879d05615854f7a2cf5bd1"
+SRC_URI[sha256sum] = "f1094397eaa7932f06e57ebbb075aa33aa2c76e4b75630a16b02c8d4af46832e"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
deleted file mode 100644
index 33bd4200f6f..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b77d4806fd5de50d0b017a3e6a19c5bfdef7b3e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Feb 2023 12:47:31 -0800
-Subject: [PATCH] v4l2: Define ioctl_req_t for posix/linux case
-
-this is an issue seen with musl based linux distros e.g. alpine [1]
-musl is not going to change this since it breaks ABI/API interfaces
-Newer compilers are stringent ( e.g. clang16 ) which can now detect
-signature mismatches in function pointers too, existing code warned but
-did not error with older clang
-
-Fixes
-gstv4l2object.c:544:23: error: incompatible function pointer types assigning to 'gint (*)(gint, ioctl_req_t, ...)' (aka 'int (*)(int, unsigned long, ...)') from 'int (int, int, ...)' [-Wincompatible-function-pointer-types]
-    v4l2object->ioctl = ioctl;
-                      ^ ~~~~~
-
-[1] https://gitlab.alpinelinux.org/alpine/aports/-/issues/7580
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3950]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- sys/v4l2/gstv4l2object.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sys/v4l2/gstv4l2object.h b/sys/v4l2/gstv4l2object.h
-index d95b375..5223cbb 100644
---- a/sys/v4l2/gstv4l2object.h
-+++ b/sys/v4l2/gstv4l2object.h
-@@ -76,6 +76,8 @@ typedef gboolean  (*GstV4l2UpdateFpsFunction) (GstV4l2Object * v4l2object);
-  * 'unsigned long' for the 2nd parameter */
- #ifdef __ANDROID__
- typedef unsigned ioctl_req_t;
-+#elif defined(__linux__) && !defined(__GLIBC__) /* musl/linux */
-+typedef int ioctl_req_t;
- #else
- typedef gulong ioctl_req_t;
- #endif
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
index 9ce3f73f7ce..41a93e85a41 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
@@ -4,10 +4,9 @@ SUMMARY = "'Good' GStreamer plugins"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-           file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22faad52e2"
+SRC_URI[sha256sum] = "150f914e61dc05600b68b88ca103c7cc227130158e389ea9ea159f4050a2ebb0"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
@@ -36,6 +35,8 @@ X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfi
 
 QT5WAYLANDDEPENDS = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "qtwayland", "", d)}"
 
+PACKAGECONFIG[amrnb]      = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
+PACKAGECONFIG[amrwb]      = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
 PACKAGECONFIG[asm]        = "-Dasm=enabled,-Dasm=disabled,nasm-native"
 PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
 PACKAGECONFIG[cairo]      = "-Dcairo=enabled,-Dcairo=disabled,cairo"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
index 99f41d4f3dc..533de0234fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "7758b7decfd20c00cae5700822bcbbf03f98c723e33e17634db2e07ca1da60bf"
+SRC_URI[sha256sum] = "4c951341c4c648630b6fe1234ec113d81dd2d248529bf2b5478e0ad077c80ed3"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
@@ -27,8 +27,6 @@ PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
 "
 
-PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
-PACKAGECONFIG[amrwb]    = "-Damrwbdec=enabled,-Damrwbdec=disabled,opencore-amr"
 PACKAGECONFIG[a52dec]   = "-Da52dec=enabled,-Da52dec=disabled,liba52"
 PACKAGECONFIG[cdio]     = "-Dcdio=enabled,-Dcdio=disabled,libcdio"
 PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
index 0fbb03f7571..5fbf8607415 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f7a5450d93fd81bf46060dca7f4a048d095b6717961fec211731a11a994c99a7"
+SRC_URI[sha256sum] = "ecdb3e2ba94ea2c82b93a8c715d5a7e04f9726a8838c0a6b17694928fd1e8595"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb
index 554ed9ec8f4..f63d61b2c93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ec49d474750a6ff6729c85b448abc607fb6840b21717ad7abc967e2adbf07a24"
+SRC_URI[sha256sum] = "62628ecca78b8f5b51c59a4d602c65e9205ffc50c3c83cd61fab1f6348b63565"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb
index 87eb8484a10..8ddfe15de92 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6eae1360658302b9b512fa46b4d06f5b818dfce5f2f43d7d710ca8142719d8ad"
+SRC_URI[sha256sum] = "845f2efe0dca8dab234dde8fb091da2cd06a9d2a683422b56dcb688954f9070e"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 0d839bd6c88..a190370c161 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 5372cd5bf2a9dd247b9c5fc6e4fe248046dbb085 Mon Sep 17 00:00:00 2001
+From 381f50a27766c425af36a7203061716497e6603f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
@@ -6,16 +6,15 @@ Subject: [PATCH] tests: respect the idententaion used in meson
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  tests/check/meson.build | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 9787b0a..16caac7 100644
+index 6540279..e9501fe 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -145,11 +145,11 @@ foreach t : core_tests
+@@ -146,11 +146,11 @@ foreach t : core_tests
  
    if not skip_test
      exe = executable(test_name, fname,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 64717e66c36..a990940cc68 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 27e977d03b0f7c1d0bf19621ef0cec0585410e7b Mon Sep 17 00:00:00 2001
+From 31dea17a1d5de0003719a875a1089df43a50219a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -10,7 +10,6 @@ This will provide to run the tests using the gnome-desktop-testing [1]
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  meson.build                  |  4 ++++
  meson_options.txt            |  1 +
@@ -20,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index 60c7bec..f7650b1 100644
+index efcf189..c97d9a8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -606,6 +606,10 @@ if bashcomp_dep.found()
+@@ -624,6 +624,10 @@ if bashcomp_dep.found()
    endif
  endif
  
@@ -35,10 +34,10 @@ index 60c7bec..f7650b1 100644
  
  pkgconfig = import('pkgconfig')
 diff --git a/meson_options.txt b/meson_options.txt
-index 7363bdb..a34ba37 100644
+index 340fb58..5b87f68 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
+@@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
         value: 'malloc')
@@ -47,14 +46,14 @@ index 7363bdb..a34ba37 100644
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 16caac7..f2d400f 100644
+index e9501fe..08f8fd8 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -124,10 +124,16 @@ test_defines = [
+@@ -125,10 +125,16 @@ test_defines = [
    '-UG_DISABLE_ASSERT',
    '-UG_DISABLE_CAST_CHECKS',
    '-DGST_CHECK_TEST_ENVIRONMENT_BEACON="GST_STATE_IGNORE_ELEMENTS"',
--  '-DTESTFILE="' + meson.current_source_dir() + '/meson.build"',
+-  '-DTESTFILE="' + fsmod.as_posix(meson.current_source_dir()) + '/meson.build"',
    '-DGST_DISABLE_DEPRECATED',
  ]
  
@@ -68,7 +67,7 @@ index 16caac7..f2d400f 100644
  # sanity checking
  if get_option('check').disabled()
    if get_option('tests').enabled()
-@@ -150,6 +156,8 @@ foreach t : core_tests
+@@ -151,6 +157,8 @@ foreach t : core_tests
        include_directories : [configinc],
        link_with : link_with_libs,
        dependencies : gst_deps + test_deps,
@@ -77,7 +76,7 @@ index 16caac7..f2d400f 100644
      )
  
      env = environment()
-@@ -161,6 +169,18 @@ foreach t : core_tests
+@@ -162,6 +170,18 @@ foreach t : core_tests
      env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-scanner')
      env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 0fd830f1504..27623bf96bd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From 7041bc5adf9501beb1428d8bbae6b351a6bf07f9 Mon Sep 17 00:00:00 2001
+From 453865e8938c5f50f14409b67246bbbd801fa44d Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
@@ -9,16 +9,15 @@ use a dictionary as this is simplest solution to install the environment.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  tests/check/meson.build | 21 +++++++++++++--------
  1 file changed, 13 insertions(+), 8 deletions(-)
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index f2d400f..50dff7f 100644
+index 08f8fd8..330abaa 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -160,14 +160,19 @@ foreach t : core_tests
+@@ -161,14 +161,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 5689dc9fbbc..97b056072d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From 1b1d1ce4227b6bea7c7def5dac4a663486e070c2 Mon Sep 17 00:00:00 2001
+From 506ff13a044439a170f770b6663a64c942ae0a05 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
@@ -10,7 +10,6 @@ testing framework.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
 ---
  tests/check/meson.build      | 17 +++++++++++++++++
  tests/check/template.sh.in   |  9 +++++++++
@@ -19,10 +18,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100755 tests/check/template.sh.in
 
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 50dff7f..2b9e979 100644
+index 330abaa..5d383b1 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -184,6 +184,23 @@ foreach t : core_tests
+@@ -185,6 +185,23 @@ foreach t : core_tests
          install_dir: installed_tests_metadir,
          configuration: test_conf
        )
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb
index 8965497d01e..cd04ade6029 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "3d16259e9dab8b002c57ce208a09b350d8282f5b0197306c0cdba9a0d0799744"
+SRC_URI[sha256sum] = "1225ef4a329fae1cadc5ec727dab249ad567e8072879493561ceb91ed34aa414"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.39.2


