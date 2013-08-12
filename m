Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3AA61222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 14:09:24 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so3512058eae.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 07:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7xYws1pxhhJZZbfj0MwLtVMDLf33F+oQY2XR/jQaIm8=;
	b=Ck5VzZGGACvZVKgIq20dT3GGHxneqSAOzG0dV82Ew11U0XVpZR0IwUh86yBQd8Gvjw
	VkuFzCl6V3U4VIALv/Vax5tAvU5n4P+Vw5l0/ZTe8y4AqCmoCNBnzR3gtk5EU1gCP/aS
	5Gs0RXosYDXIWDO31GYKcmd3V8v1iY0HIN/NBx7h050UBs12fv6gvElkphY2Ovz5qBmK
	QEqQgzzTJmvmP3wfasW9HjGEFB3BROa5hb3dvANrpUhBOTKZbwGqtoXEpS+4Lait6S8L
	YDzUsi2j/l9o4GNcCKlEZ7KQI/By1a8bk9D4Zwx0KRVie8tYQjBrQjvEqDGPTtP9bkE2
	gCMg==
X-Gm-Message-State: ALoCoQnbJm0iGna88pgBVagNHQzW/PMHe5iPpbkGkXdAhvqAeMwWkdwbaUJlV3aNfEZRw46Otcs+
X-Received: by 10.14.114.68 with SMTP id b44mr7148048eeh.60.1376316564304;
	Mon, 12 Aug 2013 07:09:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t6sm57617539eel.12.2013.08.12.07.09.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 07:09:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2013 15:09:20 +0100
Message-Id: <1376316560-10880-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] cogl: GL/GLX feature cleanup
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
X-List-Received-Date: Mon, 12 Aug 2013 14:09:24 -0000

Separate GL and GLX flags don't make sense, as on Linux GL means GLX and GLX
means GL.

So, default to GLESv2 and GLX if X11 is enabled.  EGL on X11 doesn't have
feature parity yet so leave it disabled by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index c0d410e..c189e95 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -28,16 +28,17 @@ EDEPENDS_WAYLAND = "wayland"
 ERDEPENDS_GL    = "libgl"
 ERDEPENDS_GLES2 = "libgles2"
 
++# GLESv1 is rarely tested, so disable it
 EXTRA_OECONF += "--disable-introspection	\
 	       	 --enable-examples-install	\
 	       	 --enable-debug		 	\
 	       	 --disable-gles1		\
 	    	"
 
-PACKAGECONFIG[cogl-pango] = "--enable-cogl-pango,--disable-cogl-pango,pango"
+# OpenGL/GLX
+PACKAGECONFIG[glx] = "--enable-gl --enable-glx,--disable-gl --disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11},${ERDEPENDS_GL}"
 
-# GL flavours
-PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,${EDEPENDS_GL},${ERDEPENDS_GL}"
+# GLESv2
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
 
 # EGL backends
@@ -46,15 +47,15 @@ PACKAGECONFIG[egl-null] = "--enable-null-egl-platform,--disable-null-egl-platfor
 PACKAGECONFIG[egl-x11] = "--enable-xlib-egl-platform,--disable-xlib-egl-platform,${EDEPENDS_X11}"
 PACKAGECONFIG[egl-wayland] = "--enable-wayland-egl-platform,--disable-wayland-egl-platform,${EDEPENDS_WAYLAND}"
 
-# GLX
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11}"
-
-# Wayland server-side
+# Wayland (server-side)
 PACKAGECONFIG[wayland-server] = "--enable-wayland-egl-server,--disable-wayland-egl-server,${EDEPENDS_WAYLAND}"
 
+# Support rendering text directly with Pango
+PACKAGECONFIG[cogl-pango] = "--enable-cogl-pango,--disable-cogl-pango,pango"
+
 # Respect the DISTRO_FEATURES to pull in GLX or Wayland as appropriate by
 # default.
-PACKAGECONFIG ??= "cogl-pango gl \
+PACKAGECONFIG ??= "cogl-pango gles2 \
                    ${@base_contains('DISTRO_FEATURES', 'wayland', 'egl-wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'glx', '', d)}"
 
-- 
1.7.10.4


