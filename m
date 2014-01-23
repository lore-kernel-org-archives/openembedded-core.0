Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id ACEE36CE09
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:02:10 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id m15so1369556wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=82cRAWoObvqOitMcFLsUc049CnIa9gDWfWcaAhX98f0=;
	b=SuXeszv13wN2/IANMnDduOJKt+WHayKbJZvASU/AJFsHtSsDX8LDAgWIJ8GECjWmjS
	nWagTwlgDYHDniv+kkWlMOxYyiB2w5px3sd/WSK9SF+0jRG2kH4TcKzvYpXS2WqfEthv
	sHBoHIjCEjAm+w9mmxO/bRcycy7hLofeoxkgQuSB9Ze7gMtaqnLsD+s8PR7+0rNokw6N
	QeHdS5D+2kbt47N2tAQXqjgK+LIbJqmsVkX+x0JXWdm0NND7uRUq5mSAuBnQ5WRjGYAQ
	uYQJ5N8TQuPEk0812Ap7Igj1wMqtDd0+COXAP2946yhH2ZYLjINwMvTmWAmaAr63lT6l
	Yoeg==
X-Gm-Message-State: ALoCoQlrPjfV9OMQSWWRYOFPN3MUvGuNNEyIIi9OvQKqZ1wt0Dbj9ntPWkdbKe0Jwh6zJ0g346lR
X-Received: by 10.194.83.9 with SMTP id m9mr3303285wjy.39.1390478531133;
	Thu, 23 Jan 2014 04:02:11 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	ci4sm21793194wjc.21.2014.01.23.04.02.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jan 2014 04:02:10 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2014 13:02:06 +0100
Message-Id: <1390478526-12041-3-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390478526-12041-2-git-send-email-nicolas.dechesne@linaro.org>
References: <1390478526-12041-1-git-send-email-nicolas.dechesne@linaro.org>
	<1390478526-12041-2-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH 2/2] libsdl2: add PACKAGECONFIG for opengl
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
X-List-Received-Date: Thu, 23 Jan 2014 12:02:11 -0000

As discussed in [1], SDL recipe makes the wrong assumption that
'opengl' in DISTRO_FEATURES implies GL/GLX. However 'opengl' could
also mean GLES/EGL, and the recipe fails to build in such
situations. So we add a PACKAGECONFIG option for opengl so that the
build can be made to work on gles/egl with a simple .bbappend.

The default PACKAGECONFIG is set to the same value as previously,
e.g. 'gl' is enabled if 'opengl' is found in DISTRO_FEATURES.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2014-January/088735.html

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
index 7958f7b..57d1bd1 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0605ca7e995ab1217e0bb988731a87fe"
 PROVIDES = "virtual/libsdl2"
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
 DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
@@ -33,14 +32,21 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-video-dummy \
                 --enable-input-tslib --enable-pthreads \
                 ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
                 ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-pulseaudio"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= " \
+    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
+"
+
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+# SDL wrongly assumes that opengl means GL/GLX, when using GLES/EGL, do:
+# PACKAGECONFIG_remove = "gl" in .bbappend
+# or PACKAGECONFIG_remove_pn-libdsl2 = "gl" in .conf
+PACKAGECONFIG[gl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
 
 PARALLEL_MAKE = ""
 
-- 
1.8.5.3


