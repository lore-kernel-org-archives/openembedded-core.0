Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PeUGCVKWBE4W+16sTLDY+7SO3OFdN5NtdE34KSfoQe1SPrfAsw8YGLS8chYp/qr7BQQ6zG/R8Y
 3SWjG6VhdpFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428890"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428890"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:50 -0800
IronPort-SDR: h8t3J8C7rHn7+/j+HH+F2MKkGj4STAZcMqgS5SbppXYQ7R23bxo6eanjQ1rNBiZw5ihKXXDYCD
 kGimB4f7pN4g==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490079"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:49 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/22] libsdl2: Fix directfb syntax error
Date: Fri,  6 Nov 2020 14:28:13 +0800
Message-Id: <8f91ad31d0e9941d0c5843905c4abc1cc0021c0c.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mark Jonas <toertel@gmail.com>

Build of libsdl2 with directfb is broken due to a spurious '}' and a
missing 'E' since version 2.0.12. The upstream is already fixed.

(From OE-Core rev: 8963daba093c3c5e2c60e1e4e057862971b84cb0)

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e9871de010d79cb93aeb48d8d56bac62c09e347)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ectfb-spurious-curly-brace-missing-e.patch | 49 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
new file mode 100644
index 0000000000..aa351a89ba
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
@@ -0,0 +1,49 @@
+# HG changeset patch
+# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
+# Date 1585069551 25200
+# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
+# Parent  63387e8920f58f608288f247824ec5f4c286691f
+src/video/directfb/SDL_DirectFB_render.c: fix build
+Build with directfb is broken due to a spurious '}' and a missing 'E'
+since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a switch statement
+  202 |         case SDL_BLENDMODE_MUL:
+      |         ^~~~
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
+  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
+      |                                                                   ^~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+--
+
+The patch was imported from the libsdl Mercurial repository
+(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+
+diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Mon Mar 23 14:10:25 2020 -0700
++++ b/src/video/directfb/SDL_DirectFB_render.c	Tue Mar 24 10:05:51 2020 -0700
+@@ -198,11 +198,10 @@
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));
+
+             break;
+-        }
+         case SDL_BLENDMODE_MUL:
+             data->blitFlags = DSBLIT_BLEND_ALPHACHANNEL;
+             data->drawFlags = DSDRAW_BLEND;
+-            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
++            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));
+
+             break;
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 83dce86801..8ecf161f69 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -18,6 +18,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://directfb-spurious-curly-brace-missing-e.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.28.0

