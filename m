Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 392AD7FCB3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:36 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d7so4552248pls.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I/YF10EMHUj8TcZjRdf/iudwHhoCZBhRMb2zVDUCwDo=;
	b=AWDa0qffThNlEHQzQam+jZDZ8opdpUQvRdDxNIj+oY6MhoMMdjf3TccYLTnYe442rw
	LCc0hloLXxqTmjjOlBOxlMre0KcgjDsvawUUdrfW+/1uZBsu3n1seCF3qpj8+n9LNKpm
	C7Ju6Ax68YuQstevrDUfQTEGjgQSvLD3yjpauL180INMwfUrbMr4vsjcK7Qcs8Jp8nff
	6qcTgpQsph1Xgm7jlzp7uwiz9aXxa8p1L0bVu41jEouf8eQohhx2MnzlUK9aMvxQ+bNQ
	vphM0KmY+b3bmmkZoyn+87LxyNAmAMJuTsNwza7AeamwUlOil9ynf0UYDdIXm8n2Ps+A
	MB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I/YF10EMHUj8TcZjRdf/iudwHhoCZBhRMb2zVDUCwDo=;
	b=dI1tMXzTSmmhZUot8zNLtrcQc3sgS19NCkGG1urW8vuuiD7jPiv5kN+05FTZWwfYdp
	poE9UNcPfDmKcqaWUzJuTvxeXeyzjXxXfHMVFNyxpUKlLsuoDmDjfN5duCgoKP91bDuF
	OC8NOBM17+kdFLrDqYeDbsi8mQngERF7Aj3tXFLHg21pukXT2VbegX9Sd0xxMI6sLej8
	Cx1/ZlFdgCOZNgxZcM9jWtGsTTlAIG2KJdUv2poBGBKDJ6iOdBnRPEomz4RgYyq22/KR
	0p4gzXAts9qtRrGhf0FaE9R03BvlEdlD74hykTvCJEaymxZ47KGZYrLFGrjpbS2D3itV
	wueA==
X-Gm-Message-State: APjAAAWGLbfAgP451dmNOFsG3J983Yq201BeAnm+tkLAEwgtZoi5Ei7l
	9gsMe0q3WMmHlfB8uXryCU4mqgiX
X-Google-Smtp-Source: APXvYqwu8+51xfqyN/6CxIP2rNKXFVxyBNMDQBNvCqm2C478RCm6O6yliEtiOsWtoJ0cPWG6LjdUMA==
X-Received: by 2002:a17:902:ab87:: with SMTP id
	f7mr20270415plr.78.1574525497184; 
	Sat, 23 Nov 2019 08:11:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:25 -0800
Message-Id: <1574525485-20450-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 11/11] gstreamer: Change SRC_URI to use HTTPS access instead of HTTP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Nov 2019 16:11:37 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Some GStreamer recipes like gstreamer1.0-vaapi already use HTTPS instead
of http. Also, access to http:// is simply redirected by the freedesktop
server to https://, and using HTTPS is anyway generally recommended over
plain HTTP for security reasons. So, normalize the URLs to use HTTPS only.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb        | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb          | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb       | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb              | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
index d3918cf..10955ff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
            file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
            file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
            file://mips64_cpu_detection.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index 4c6c839..cb2f704 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -7,7 +7,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "89772e7a277fd0abfc250eaf8e4e9ce9"
 SRC_URI[sha256sum] = "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42ab24bb2"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index 4330c79..1731be8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins.inc
 
 SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+    https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
     file://configure-allow-to-disable-libssh2.patch \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
index 9df67e7..cb99fba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
 SRC_URI = " \
-            http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
+            https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://make-gio_unix_2_0-dependency-configurable.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
index 21d2b2b..0fa7b86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
@@ -1,7 +1,7 @@
 require gstreamer1.0-plugins.inc
 
 SRC_URI = " \
-            http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
+            https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
index de677c0..ecab318 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
-            http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
+            https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index 52ed150..5a950f1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
 SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
index ca360bc..45302ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
            file://gtk-doc-tweaks.patch \
            "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index d77c8aa..ff92f63 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 S = "${WORKDIR}/gstreamer-${PV}"
 
 SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+    https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
-- 
2.7.4


