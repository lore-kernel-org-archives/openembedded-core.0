Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA356AD8F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:12:03 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id c10so2084920wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=YWkTNosKfoHD7ZyCg4z5ftcbtZAk+P087fKP4mi8nAU=;
	b=dyvvlxMj70eM9WMXLiAKVlKkEZ+W2czd4DzEk2GYHHkVt91lpHl8OMlGOm1VwMKYWA
	8RXutfBA9dR26ha0aEbgC1zkQZQMkjGeJ7dc14TP7b6vXHtA2OrecyYqokNuYUAMxcsn
	fCPdvJ33bPJ3cwiwWn606/XoCbhx+NEF4NFg3pkaD1XI26AEvYhchMzxGyPCn30zwNfB
	UTQvAncFH2Pb/yEuVGkfr4BLNg1V8qZpgFpxbNOF9qZhz02HWdEHgI2eeCRrcdZf2QnX
	jHH7qyJn5iwFtwZOvlk+Tq6benLOF83bmCiN957HiNGpF7T41IkutuJLH/e9Bvh9/+Fz
	KI5Q==
X-Received: by 10.194.122.103 with SMTP id lr7mr6252939wjb.15.1371744724885;
	Thu, 20 Jun 2013 09:12:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.12.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:12:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:27 +0100
Message-Id: <c8d59db6d047aa86dfdb322ef8180b49e5a3c8ff.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmsLlr8l40NLOgcT0l3PNbE1wuIQ0DOEPVIv7PxGS7MVPjkP/Uq0qHjydHVpaklhhOhXd8K
Subject: [PATCH 5/7] cogl: add Wayland support
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
X-List-Received-Date: Thu, 20 Jun 2013 16:12:04 -0000

Add PACKAGECONFIG stanzas for Wayland client and server, and respect the x11 and
wayland DISTRO_FEATURES to enable the relevant backends as appropriate by
default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |   24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index c9c6165..55eb003 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -13,11 +13,12 @@ PACKAGES =+ "${PN}-examples"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
 # Extra DEPENDS for PACKAGECONFIG
-EDEPENDS_GL    = "virtual/libgl libdrm"
+EDEPENDS_GL = "virtual/libgl libdrm"
 EDEPENDS_GLES2 = "virtual/libgles2"
-EDEPENDS_KMS   = "libdrm virtual/egl"
-EDEPENDS_EGL   = "virtual/egl"
-EDEPENDS_X11   = "virtual/libx11 libxcomposite libxfixes libxi libxrandr"
+EDEPENDS_KMS = "libdrm virtual/egl"
+EDEPENDS_EGL = "virtual/egl"
+EDEPENDS_X11 = "virtual/libx11 libxcomposite libxfixes libxi libxrandr"
+EDEPENDS_WAYLAND = "wayland"
 
 # Extra RDEPENDS for PACKAGECONFIG
 # This has to be explictly listed, because cogl dlopens the backends
@@ -34,15 +35,22 @@ EXTRA_OECONF += "--disable-introspection	\
 PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,${EDEPENDS_GL},${ERDEPENDS_GL}"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
 
-# egl backends
+# EGL backends
 PACKAGECONFIG[egl-kms] = "--enable-kms-egl-platform,--disable-kms-egl-platform,${EDEPENDS_KMS}"
 PACKAGECONFIG[egl-null] = "--enable-null-egl-platform,--disable-null-egl-platform"
 PACKAGECONFIG[egl-x11] = "--enable-xlib-egl-platform,--disable-xlib-egl-platform,${EDEPENDS_X11}"
+PACKAGECONFIG[egl-wayland] = "--enable-wayland-egl-platform,--disable-wayland-egl-platform,${EDEPENDS_WAYLAND}"
 
-# glx
+# GLX
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11}"
 
-# Default to GLX
-PACKAGECONFIG ??= "gl glx"
+# Wayland server-side
+PACKAGECONFIG[wayland-server] = "--enable-wayland-egl-server,--disable-wayland-egl-server,${EDEPENDS_WAYLAND}"
+
+# Respect the DISTRO_FEATURES to pull in GLX or Wayland as appropriate by
+# default.
+PACKAGECONFIG ??= "gl \
+                   ${@base_contains('DISTRO_FEATURES', 'wayland', 'egl-wayland', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'glx', '', d)}"
 
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
-- 
1.7.10.4


