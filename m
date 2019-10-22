Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 01DE47F733
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id CC362A35F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756380; bh=xzz8gH3btgsTInY
	c2MLb2QgLNppcU8bqm3VggXi5o94=; b=WiNUOS/IiVr+wAynMZPxA9np3e7vTpP
	Z+KkB4R5JfwoEGyNYkOxZ11TXI1y9aP3omvJppljaCRPdG7Ons4vnCZxLsVLrgP8
	fDbtGd9rNhYqVnMShiGs3aD/+N1GubCu8OhnORWlgYlb3TOTbGyUSweGQd10Q3tO
	kgs/E9aPsjP/SU07Io8BFrG88ZaTjzMnWatQj+eW/ekg+2LxVEw6znp8gU7ZyWq/
	8LdNZSVZUxjKfKz9uQV0cb9BYmKAv5QjHrSPVBy3wzVLCBXUsiSHDfHd2fxgvhya
	eEQiIOzIFynmm2Xni6A56OxHYZK80MIQ9Rh/pqzeBqbJhtzojO5patg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=oUwbFgiI2R+3Vz+ugnCiqrq2hZVYM+YWawIyLABzfsY=;
	b=RC0f3+MtXGvPiG4+2Jvxz+MxzoLVjSV71X9845VCXC9uAWDKNIUtXAC+zSLlmxSdxtAQ07
	99Y7cT+45fotQFfqEVrF/ih4L9cAY7I9ZSQJq8PXRycMNpnjwsyd+wUpPLGO2qmyjnZ/Xk
	MRUEPOxm+84l8u2HZS9MB6B/RMaPskaGYRG3iJaolLfTsIXIgCEvgm5J33Xie0lP20m26U
	SDYH7T3QEhaNcdj1sqEusqdW+cUCgx8lrW+BnGGAN8xJ1loL1HJ3K9P1Is/gSLn6fkP4HE
	baj+WA0pPoX66zEypoRRDta+ko8t9vPPtU5DBgy7+5cQSUpSbOFYhAS3kWcmZA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
	[80.241.56.116]) (amavisd-new, port 10030) with ESMTP id Qv1iZcoEISUw
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:40 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:27 +0200
Message-Id: <20191022145927.1241-12-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 12/12] gstreamer: Change SRC_URI to use HTTPS access instead of HTTP
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:27 -0000

Some GStreamer recipes like gstreamer1.0-vaapi already use HTTPS instead
of http. Also, access to http:// is simply redirected by the freedesktop
server to https://, and using HTTPS is anyway generally recommended over
plain HTTP for security reasons. So, normalize the URLs to use HTTPS only.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb    | 2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb                | 2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.16.1.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-good_1.16.1.bb               | 2 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb               | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb | 2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb                | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
index d3918cfcb8..10955ff161 100644
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
index 4c6c839bf8..cb2f7045a8 100644
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
index 4330c797a2..1731be8441 100644
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
index 9df67e7b88..cb99fba5ff 100644
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
index 21d2b2bb7f..0fa7b86ffe 100644
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
index de677c0fd4..ecab318899 100644
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
index 52ed150482..5a950f183c 100644
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
index ca360bc244..45302ef4f6 100644
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
index d77c8aa198..ff92f63bac 100644
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
2.17.1


