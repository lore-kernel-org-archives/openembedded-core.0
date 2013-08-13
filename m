Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6225560664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:45:22 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so4013574ead.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 02:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pXIjSTdUdLlXHxjsRODdCqXaT+RHhv8MV3DQx1adM2Y=;
	b=lylhbCC3ARvZAtZyWqyYjBtjqULVzVE0OugNmoiYJlwDBEcPR1mRrl9UKTABFoX8LB
	CcQ+82+vvMD7g7u00Q0R3aROdbnBhSLMOL84gxBF3D0kQWUHGuOaGXtFvkShE14hl3iX
	YyU0hUQmP8ebPKH5Oj9lYBwb5zbPjXEZHKseDmMqLSAqQjf+sXtPCpdJEmf2J6a5xczf
	Ctq5MCz7kJHl/md2gyZ9Y7PtTbU9z3vGYVoXFih7CVYgKupb/XwdU5xOgehIzqU3RGgP
	qi5uiAvswgyuIqTnCv8DElUJk/uJOJ81ROzHU2jYMBw9Mys6HThdyj6x91rCc7IIuOam
	uztA==
X-Gm-Message-State: ALoCoQm6KFtFttLfgiUWxpMHRrHu1SPpv1Wp1dvhmpkKkJCxdRWChW0YKggCO5eze7HMd7uh3k1K
X-Received: by 10.14.225.199 with SMTP id z47mr5640252eep.24.1376387122025;
	Tue, 13 Aug 2013 02:45:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a1sm64939434eem.1.2013.08.13.02.45.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 02:45:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 10:45:16 +0100
Message-Id: <1376387116-8721-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] cogl: GL/GLX feature cleanup
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
X-List-Received-Date: Tue, 13 Aug 2013 09:45:22 -0000

Separate GL and GLX flags don't make sense, as on Linux GL means GLX and GLX
means GL.

So, default to GLESv2 and GLX if X11 is enabled.  EGL on X11 doesn't have
feature parity yet so leave it disabled by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index c0d410e..59ff66e 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -28,16 +28,17 @@ EDEPENDS_WAYLAND = "wayland"
 ERDEPENDS_GL    = "libgl"
 ERDEPENDS_GLES2 = "libgles2"
 
+# GLESv1 is rarely tested, so disable it
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


