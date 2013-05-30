Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 346D66041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:24 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hr14so4585712wib.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=TpT/PZvSYe95FQ+/v0Y6NofzW8NPeNu8jG3rbFMff94=;
	b=AYN3hsJr4PIZ40YehZySNVCsVjrf0Ps7PFB/pFuwbZpzEwNaoumKMEfxI7YAoNto/r
	4IMwVlXA8xBMFMrQW/cokP6lHs96IYDVXdSutN9A85ABkmR+G+LGxsSx/rIBBjndYXVq
	SIWb5NThuVTk5QtI5VQJHnlUgKqB2JIUqZx7M7hf3+/R+XCymmjbB6sqnqkOqUYY1cWq
	rbMmTTujt8wzMbCWkNKVqw7iiaVQlwpJr9DTi0VTj61ROoPJZiezOQfr3b+1V40HB752
	nZGDzQnNosyjspvsGV350WttAWyI38HHACk7FU0fDo6sLCw3qVLLgwTSHTaM6nqIWm+5
	OYbw==
X-Received: by 10.194.219.228 with SMTP id pr4mr266573wjc.56.1369922184507;
	Thu, 30 May 2013 06:56:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:43 +0100
Message-Id: <bb2b294de2289e89d1014f9bb1e1f9b5d9686456.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnUHhOH0MRGIm79mVRHaXl+PodGO4vxsOhY3VOtuPUksO+PBkMf0oprqkao8+f47DRk2vIA
Subject: [PATCH 09/14] gtk+3: respect x11 and wayland DISTRO_FEATURES
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
X-List-Received-Date: Thu, 30 May 2013 13:56:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gtk+/gtk+3/no-x11-in-wayland.patch             |   32 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |   15 ++++++---
 2 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch b/meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
new file mode 100644
index 0000000..df0921a
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
@@ -0,0 +1,32 @@
+The Wayland backend was including X11 headers, which won't work in a no-X11
+distro.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 875b1d07ded377b20acbf1a10cae847f56de05b4 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Thu, 23 May 2013 12:26:26 -0400
+Subject: [PATCH] Don't include X11 headers in wayland
+
+The include of X11/keysyms.h in gdkdevice-wayland.c was just
+a leftover.
+---
+ gdk/wayland/gdkdevice-wayland.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gdk/wayland/gdkdevice-wayland.c b/gdk/wayland/gdkdevice-wayland.c
+index c258be3..cd4a695 100644
+--- a/gdk/wayland/gdkdevice-wayland.c
++++ b/gdk/wayland/gdkdevice-wayland.c
+@@ -32,7 +32,6 @@
+ #include "gdkdevicemanagerprivate.h"
+ 
+ #include <xkbcommon/xkbcommon.h>
+-#include <X11/keysym.h>
+ 
+ #include <sys/time.h>
+ #include <sys/mman.h>
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 9bd5b9d..1e0fed2 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -5,9 +5,8 @@ HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
-           docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite libxi cairo gdk-pixbuf gdk-pixbuf-native"
+DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf libgcrypt \
+           docbook-utils-native gdk-pixbuf-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
@@ -18,7 +17,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz"
+SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
+           file://no-x11-in-wayland.patch"
+
 SRC_URI[md5sum] = "8e878e18fc385f2b813419dc7b40a968"
 SRC_URI[sha256sum] = "1ca80c9c15a1df95d74cefb8c2afe4682ba272a4b489106f04877be2a7aff297"
 
@@ -46,6 +47,12 @@ EXTRA_OECONF += " \
                  --disable-introspection \
 "
 
+PACKAGECONFIG ??= "${@base_contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
+                   ${@base_contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
+
+PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
+PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon"
+
 do_install_append() {
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
 }
-- 
1.7.10.4


