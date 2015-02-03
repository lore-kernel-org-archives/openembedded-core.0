Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 880186E5DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CJWX022770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:19 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:18 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:11:58 -0800
Message-ID: <c41b9e632644a9d557ebf1e3dd987cd4750baae2.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/21] xf86-video-intel 2.21.15: remove it
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:17 -0000
Content-Type: text/plain

It doesn't work:
| checking whether to include DRI1 support... no
| configure: error: DRI1 requested but prerequisites not found

And there is a xf86-video-intel_2.99.917.bb which is MIT-X.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...Map-changes-of-DamageUnregister-API-in-1..patch |   29 ------------
 .../xf86-video-intel/disable-dri2-tests.patch      |   50 --------------------
 .../xorg-driver/xf86-video-intel_2.21.15.bb        |   32 -------------
 3 files changed, 111 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
deleted file mode 100644
index 3a42d13..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-
-From 524a45da56e2a052ffafa3887891caa90ba39f76 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Sat, 5 Oct 2013 18:42:24 +0100
-Subject: [PATCH] compat-api: Map changes of DamageUnregister API in 1.14.99.2
-
-Reported-by: Emmanuel Benisty <benisty.e@gmail.com>
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
----
- src/compat-api.h |    4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/compat-api.h b/src/compat-api.h
-index 8eb46ef..244a486 100644
---- a/src/compat-api.h
-+++ b/src/compat-api.h
-@@ -162,4 +162,8 @@ static inline void FreePixmap(PixmapPtr pixmap)
- 	if ((d)->pScreen->SourceValidate) (d)->pScreen->SourceValidate(d, x, y, w, h)
- #endif
- 
-+#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,14,99,2,0)
-+#define DamageUnregister(d, dd) DamageUnregister(dd)
-+#endif
-+
- #endif
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch
deleted file mode 100644
index 9e93ca8..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ec91cfe7e5efdd5e1b1fbb85eea8f07b50e24c4b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 11 Sep 2013 21:12:37 +0100
-Subject: [PATCH] test: only build DRI2 tests if DRI2 is enabled
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- test/Makefile.am |   10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/test/Makefile.am b/test/Makefile.am
-index f51967b..18528a9 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -16,9 +16,14 @@ stress_TESTS = \
- 	render-copyarea-size \
- 	render-copy-alphaless \
- 	mixed-stress \
-+	$(NULL)
-+
-+if DRI2
-+stress_TESTS += \
- 	dri2-swap \
- 	dri2-race \
- 	$(NULL)
-+endif
- 
- check_PROGRAMS = $(stress_TESTS)
- 
-@@ -34,9 +39,14 @@ libtest_la_SOURCES = \
- 	test_image.c \
- 	test_log.c \
- 	test_render.c \
-+	$(NULL)
-+
-+if DRI2
-+libtest_la_SOURCES += \
- 	dri2.c \
- 	dri2.h \
- 	$(NULL)
-+endif
- 
- vsync.avi: mkvsync.sh
- 	./mkvsync.sh $@
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
deleted file mode 100644
index cd8fd63..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-require xorg-driver-video.inc
-
-SUMMARY = "X.Org X server -- Intel integrated graphics chipsets driver"
-
-DESCRIPTION = "intel is an Xorg driver for Intel integrated graphics \
-chipsets. The driver supports depths 8, 15, 16 and 24. On some chipsets, \
-the driver supports hardware accelerated 3D via the Direct Rendering \
-Infrastructure (DRI)."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
-
-DEPENDS += "virtual/libx11 drm libpciaccess pixman"
-
-SRC_URI += "file://disable-dri2-tests.patch \
-            file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
-           "
-
-PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
-
-PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xf86driproto dri2proto"
-PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
-PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
-PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
-PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
-
-# --enable-kms-only option is required by ROOTLESS_X
-EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
-
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-
-SRC_URI[md5sum] = "8b646d257ace8197d6ab4e5ddeb8efb2"
-SRC_URI[sha256sum] = "7d5a140f82a72fd1cbc8a664d66c3d4eca47ee240ca4927b8a98d7af6f65d6fc"
-- 
1.7.9.5


