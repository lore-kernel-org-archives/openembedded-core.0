Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EDEC960F1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 20:30:33 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id a12so2259235wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FlDMfoSwsfWHI/9eic02Hi/0WzBEuE1EOd2/SPO1fH8=;
	b=ZTJKAumnWTl/sLx2sC+X6aJaPZXkNdSaLuRmo4EsAUYejOBK42X6kGNWGHRxgbnqlC
	BC99sjVbiLMP3/Hsc8mpQ0jXInhSdbCrjs7AIMoVnfN/77rNdYefVvtxaMwg0MlHzIJy
	qM69p6aMAYzkZnCx33iSuOIbY1BT/UfWooIQa4SkBN+V5XarV56Lfy2A3cgKl/o3m9qo
	0Zs9iF1g+HNA+e20K+MH/5XLw1neHzWGARSEixIlcbqAVbCbqZUW9kSo5pEH1iiF1Pjt
	6B+GdX2tQqokQ17B8erNur4DEjoOLBLpBxrnNRowjG0BfPN8u5D8WK6qDXPS7TnwzYFF
	nVrQ==
X-Gm-Message-State: ALoCoQnRKUNPELq4yzeoPdQgruAR8FxpOxgTIJmUAu8lltnhYRcM0JuWZCC5OTiLyv5jVIINdpdz
X-Received: by 10.194.248.130 with SMTP id ym2mr120696wjc.61.1378931435040;
	Wed, 11 Sep 2013 13:30:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm8305776wij.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 13:30:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 21:30:27 +0100
Message-Id: <1378931427-3479-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
References: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] xf86-video-intel: disable DRI2 tests if no DRI2 is available
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
X-List-Received-Date: Wed, 11 Sep 2013 20:30:34 -0000

Somehow this slipped past the initial testing and can cause build errors in
non-GL distros.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xf86-video-intel/disable-dri2-tests.patch      |   50 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.21.13.bb        |    2 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch
new file mode 100644
index 0000000..9e93ca8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-dri2-tests.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ec91cfe7e5efdd5e1b1fbb85eea8f07b50e24c4b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 11 Sep 2013 21:12:37 +0100
+Subject: [PATCH] test: only build DRI2 tests if DRI2 is enabled
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ test/Makefile.am |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/test/Makefile.am b/test/Makefile.am
+index f51967b..18528a9 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -16,9 +16,14 @@ stress_TESTS = \
+ 	render-copyarea-size \
+ 	render-copy-alphaless \
+ 	mixed-stress \
++	$(NULL)
++
++if DRI2
++stress_TESTS += \
+ 	dri2-swap \
+ 	dri2-race \
+ 	$(NULL)
++endif
+ 
+ check_PROGRAMS = $(stress_TESTS)
+ 
+@@ -34,9 +39,14 @@ libtest_la_SOURCES = \
+ 	test_image.c \
+ 	test_log.c \
+ 	test_render.c \
++	$(NULL)
++
++if DRI2
++libtest_la_SOURCES += \
+ 	dri2.c \
+ 	dri2.h \
+ 	$(NULL)
++endif
+ 
+ vsync.avi: mkvsync.sh
+ 	./mkvsync.sh $@
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
index f26544b..3e30936 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
+SRC_URI += "file://disable-dri2-tests.patch"
+
 PACKAGECONFIG ??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xf86driproto dri2proto"
-- 
1.7.10.4


