Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 43DA16C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:02:09 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so1041295wes.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JMHo9IjeNGcN2rGRXA12fxbc9Z1n4LPhtCp76gb+ZIg=;
	b=E3Xbe69/IMIUIPXYR+K+5Yw6jzV+kAgOCQR4l0aFgZVpKzSZiMxv07LfPtUfN/8gu3
	YeuPJR2T3pspSwuwBlDsPCBn7zsqLZ/eBPqyQYckVrhAGArjE5FwhrHQj+v1WXjBTmZW
	fsnmYt7n1NjKQpGQDToWb0sQBKEOQlrUwjwRQbPQczoX7n9XTTkf5uR0suG71N+jKqHa
	Vs0sFr4OA1OZEqC6YEQoTQ09cDlcCdckHplx7SCEuZGDHXGFtAlMvpvWbQ4x64+l00YC
	6zo1wwqEW0c6wD/TbJOcwr1fUkWh+qIe2YEdMdDrT6OxkTQRwDmhahbTMM2GQuN545qZ
	CzeA==
X-Gm-Message-State: ALoCoQkV3NtuVUlQBX5uue+4V2lIJ5FNAsJCum1SlT42KNW1YLOkudWPyLI2P+HIaMEAsohED1P7
X-Received: by 10.194.78.179 with SMTP id c19mr1046069wjx.84.1390478529608;
	Thu, 23 Jan 2014 04:02:09 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	ci4sm21793194wjc.21.2014.01.23.04.02.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jan 2014 04:02:08 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2014 13:02:05 +0100
Message-Id: <1390478526-12041-2-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390478526-12041-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1390478526-12041-1-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH 1/2] libsdl: add PACKAGECONFIG for opengl
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
X-List-Received-Date: Thu, 23 Jan 2014 12:02:09 -0000

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
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 4b4ff63..492e228 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 PROVIDES = "virtual/libsdl"
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
 DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
@@ -40,15 +39,22 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
                 --disable-xbios --disable-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
                 ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
                 ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
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
+# or PACKAGECONFIG_remove_pn-libdsl = "gl" in .conf
+PACKAGECONFIG[gl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
 
 PARALLEL_MAKE = ""
 
-- 
1.8.5.3


