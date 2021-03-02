Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6185.1614677769743389132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 01:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: Y6MMA/FOuMc1lNXr7ehiATpyMp7vMW/qkTCd4EXnF3EdbSRuWeRdGZh3vDmjNCGE86CAlo9Zd3
 YP0S13SiyGMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="250802927"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="250802927"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2021 01:36:09 -0800
IronPort-SDR: AJbK8ojE7SH41hQ36ZxoGgf+8McGagmJ0H+MtkfPnHNIg8k3kBf+F8R91EDBvM9JcX7Zt5CGs9
 k5SCSOPnRQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="406003007"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2021 01:36:08 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][gatesgarth 2/2] libsdl2: fix CVE-2020-14409 CVE-2020-14410
Date: Tue,  2 Mar 2021 17:36:05 +0800
Message-Id: <20210302093605.40052-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302093605.40052-1-chee.yang.lee@intel.com>
References: <20210302093605.40052-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libsdl2/CVE-2020-14409-14410.patch        | 79 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch
new file mode 100644
index 0000000000..d8fa24bc65
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch
@@ -0,0 +1,79 @@
+From a7ff6e96155f550a5597621ebeddd03c98aa9294 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Wed, 17 Jun 2020 08:44:45 -0700
+Subject: [PATCH] Fixed overflow in surface pitch calculation
+
+
+Upstream-Status: Backport
+[https://github.com/libsdl-org/SDL/commit/a7ff6e96155f550a5597621ebeddd03c98aa9294]
+CVE: CVE-2020-14409 CVE-2020-14410
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ src/video/SDL_surface.c | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/src/video/SDL_surface.c b/src/video/SDL_surface.c
+index 085d9ff1e..bff826f7c 100644
+--- a/src/video/SDL_surface.c
++++ b/src/video/SDL_surface.c
+@@ -28,24 +28,23 @@
+ #include "SDL_yuv_c.h"
+ 
+ 
+-/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow size_t */
+-SDL_COMPILE_TIME_ASSERT(surface_size_assumptions,
+-    sizeof(int) == sizeof(Sint32) && sizeof(size_t) >= sizeof(Sint32));
++/* Check to make sure we can safely check multiplication of surface w and pitch and it won't overflow Sint64 */
++SDL_COMPILE_TIME_ASSERT(surface_size_assumptions, sizeof(int) == sizeof(Sint32));
+ 
+ /* Public routines */
+ 
+ /*
+  * Calculate the pad-aligned scanline width of a surface
+  */
+-static int
++static Sint64
+ SDL_CalculatePitch(Uint32 format, int width)
+ {
+-    int pitch;
++    Sint64 pitch;
+ 
+     if (SDL_ISPIXELFORMAT_FOURCC(format) || SDL_BITSPERPIXEL(format) >= 8) {
+-        pitch = (width * SDL_BYTESPERPIXEL(format));
++        pitch = ((Sint64)width * SDL_BYTESPERPIXEL(format));
+     } else {
+-        pitch = ((width * SDL_BITSPERPIXEL(format)) + 7) / 8;
++        pitch = (((Sint64)width * SDL_BITSPERPIXEL(format)) + 7) / 8;
+     }
+     pitch = (pitch + 3) & ~3;   /* 4-byte aligning for speed */
+     return pitch;
+@@ -59,11 +58,19 @@ SDL_Surface *
+ SDL_CreateRGBSurfaceWithFormat(Uint32 flags, int width, int height, int depth,
+                                Uint32 format)
+ {
++    Sint64 pitch;
+     SDL_Surface *surface;
+ 
+     /* The flags are no longer used, make the compiler happy */
+     (void)flags;
+ 
++    pitch = SDL_CalculatePitch(format, width);
++    if (pitch < 0 || pitch > SDL_MAX_SINT32) {
++        /* Overflow... */
++        SDL_OutOfMemory();
++        return NULL;
++    }
++
+     /* Allocate the surface */
+     surface = (SDL_Surface *) SDL_calloc(1, sizeof(*surface));
+     if (surface == NULL) {
+@@ -78,7 +85,7 @@ SDL_CreateRGBSurfaceWithFormat(Uint32 flags, int width, int height, int depth,
+     }
+     surface->w = width;
+     surface->h = height;
+-    surface->pitch = SDL_CalculatePitch(format, width);
++    surface->pitch = (int)pitch;
+     SDL_SetClipRect(surface, NULL);
+ 
+     if (SDL_ISPIXELFORMAT_INDEXED(surface->format->format)) {
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 1513746492..639a465567 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://directfb-spurious-curly-brace-missing-e.patch \
            file://directfb-renderfillrect-fix.patch \
+           file://CVE-2020-14409-14410.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.17.1

