Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 864426A5A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:37 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hq7so793510wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=yXbQVw7c+h94dprB9+gBFpVU/wsgQCpdHFZ038J7nRs=;
	b=hvHKN6KVLeRqnbRrvWb/BInXlPkbFKVgLojB5nUh/z7Q+efN5PjbY1RHJ29YWdd1br
	bFbIdBwCONlIZ3Sw7nwwpMPccpevEosRJGL11JXiqHa8+dCy/ltCm87ApihvDgPekQTW
	TEAgjj/M6laYIiYDP8gS9oMN0x6RpEOaAF9ZSMaVd29xYoxfAnhR6gpr3hFzOXztNJCa
	kE2J7kywKL2IRSuklf9nuXxUe6rwSUa11sDsdrRJJznwNNnvyXRNGxrs+efkdrrC2fvC
	RXcK+ElcPQnIXdB7xf71kMriX6uYZcxcr8Do9rantJ11QpmgH+KKciAdVJzxlPmngeg+
	CG4A==
X-Received: by 10.180.149.171 with SMTP id ub11mr3696394wib.40.1370013098291; 
	Fri, 31 May 2013 08:11:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm4609942wib.3.2013.05.31.08.11.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:11:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:08:09 +0100
Message-Id: <0b99026d90a164f45173a6a2fa2a5b49fb61e2f4.1370012830.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl4HmCqWt0uFPXKILl9lbyP/HTjrro7zlTl70ehXXjjyQzSCW13Ug5Rx43abFy3HIhIifTn
Subject: [PATCH 6/7] weston: clean up and add comments
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
X-List-Received-Date: Fri, 31 May 2013 15:11:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.0.6.bb |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.0.6.bb b/meta/recipes-graphics/wayland/weston_1.0.6.bb
index 07811f2..9d5d626 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.6.bb
@@ -17,14 +17,21 @@ inherit autotools pkgconfig useradd
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
 DEPENDS += "wayland mesa virtual/egl"
 
-EXTRA_OECONF  = "--disable-android-compositor --enable-setuid-install"
-EXTRA_OECONF += "--disable-tablet-shell --disable-xwayland"
-EXTRA_OECONF += "--enable-simple-clients --enable-clients --disable-simple-egl-clients"
+EXTRA_OECONF = "--disable-android-compositor \
+                --enable-setuid-install \
+                --disable-tablet-shell \
+                --disable-xwayland \
+                --enable-simple-clients \
+                --enable-clients \
+                --disable-simple-egl-clients"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
                   "
+#
+# Compositor choices
+#
 # Weston on KMS
 PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa libpam"
 # Weston on Wayland (nested Weston)
@@ -32,6 +39,7 @@ PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-composit
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
 
+# Use cairo-gl or cairo-glesv2
 PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
 
 do_install_append() {
-- 
1.7.10.4


