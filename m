Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: igAR4ENlNyzkC5cncGsQv+r0O8lAaVzJxf1TIP/YIi2mtX6jLwL3dENPL71OIIjbjfYVPyWk+/
 xSz6iQieSgUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428897"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428897"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:52 -0800
IronPort-SDR: 6uGj3UBj0DWIFOjPGgZmr/uKcMO6PizqznF+oYRpZQlpnvvaaedL5jrGSJiUs9YLEur/X9Pv2p
 Hg7n16UKDt+A==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490086"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:51 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/22] libsdl2: Fix directfb SDL_RenderFillRect
Date: Fri,  6 Nov 2020 14:28:14 +0800
Message-Id: <0f1436793b0db18a77f2c4f06b85e78162441b8d.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Jonas <toertel@gmail.com>

Refactoring of SDL2 internal API has broken SDL_RenderFillRect for
DirectFB. The problem has already been fixed upstream.

(From OE-Core rev: a7c8dfc1f9beebeb9da7f61b323d85fba82ec1cb)

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9565315265d4c5a17a27317d721ce5598523efc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsdl2/directfb-renderfillrect-fix.patch | 33 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
new file mode 100644
index 0000000000..83d4f4b1ec
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
@@ -0,0 +1,33 @@
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1590793369 25200
+# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
+# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
+Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
+
+Lacky
+
+It looks like refactoring of SDL2 internal API has broken SDL_RenderFillRect for DirectFB. In new version function SDL_RenderFillRect returns 0, but rectangle is not visible.
+
+Replacing "count" with "len" in the argument list for SDL_memcpy in DirectFB_QueueFillRects fixes problem.
+
+--
+
+The patch was imported from the libsdl Mercurial repository
+(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Thu May 21 00:06:09 2020 -0400
++++ b/src/video/directfb/SDL_DirectFB_render.c	Fri May 29 16:02:49 2020 -0700
+@@ -626,7 +626,7 @@
+     }
+
+     cmd->data.draw.count = count;
+-    SDL_memcpy(verts, rects, count);
++    SDL_memcpy(verts, rects, len);
+     return 0;
+ }
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 8ecf161f69..0b75eb0c1d 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -19,6 +19,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://directfb-spurious-curly-brace-missing-e.patch \
+           file://directfb-renderfillrect-fix.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.28.0

