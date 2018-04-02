Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 31DCF74819
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 20:39:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x4so29816639wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2018 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+Qd5beJPpviOfbkz9RrW9lDyfn6G1uO3e3WKoELSjSQ=;
	b=g837/shfGNFOX4erfIvqURFCOu8HyFSQ4ql6ZUNMaVtV81xkqf1GvteMcH6yofEI4r
	ZLXD4RPrAfXYiE1AvZRmfGNcjsPu+5OGaAuPJvEMJSlwXuc+RKw2nkhl9ZNeOvrmkRFB
	brMR3SKJuQ4fhjUPGoo/hoFu2vvKA0TxTOkGyRdpiSNWf0YPHsELTIt75pFy9Zo6OyfQ
	itwjFQwwgbLWa95KtOqsAUKxOUA3pR1KHk/0B9SbAiDyqV+L1E3u5dvts7QSQ5crblQ4
	rOL48CbRKh7GnspMcdUBFgrJ8mju9JsjpBtZMwwIAGNnLA+eh5MDcpi8+J6jEN3OR/ex
	zGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+Qd5beJPpviOfbkz9RrW9lDyfn6G1uO3e3WKoELSjSQ=;
	b=UedvGfkzOzWnnvciH2RyfW1a+XZiFF+3d1PgiZfcv2KErYDVIBe/NnuTd+B9ov06px
	qCAtPYlk4OwrBbW9YNGNtpEK1riS3LNrZSw+c0QGBCKjGfqRxqjuFKTtG9uUGTBmhv+t
	ysY9Tv4zE6s8oOJboMXoNSV+2GKP57eCu0MtT/JqcsxalG6VrSLS40YvSvKzj/13xhbL
	PkqwA9SIdaGizD1jLWZo4RKUgfEpV5QGSG/2Gk2xDZgyzzEhDMvBpADkdJiM9Xqxbo/b
	AyXz/MqhN44tUGqeVSGpVG5wxbyldoZnz3BAW2hAlqsymvmyjWObr3l4O6dy3adsGlF7
	zTRg==
X-Gm-Message-State: ALQs6tB6MvyZI1VVy0jWx6Z3Y21At9hkZ9hQssbfJ44/YIHQm4coYGAy
	Ekw5CyPfkYRWhIMhotNwqmomeQ==
X-Google-Smtp-Source: AIpwx49B5zTc2w9+dncwzDKV9r8MGLE3+3iFcnRLnTADbndFbbYVA/ZfdKhVKP5LD/SIcB/J2u6JyQ==
X-Received: by 10.28.194.85 with SMTP id s82mr1848484wmf.20.1522701588469;
	Mon, 02 Apr 2018 13:39:48 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC1FD051E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:fd05:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 33sm849693wrs.74.2018.04.02.13.39.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Apr 2018 13:39:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2018 22:39:33 +0200
Message-Id: <20180402203934.8813-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH V2 1/2] mesa: fix unitialized modifier for DRI2
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
X-List-Received-Date: Mon, 02 Apr 2018 20:39:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This came up whith disabled DRI3 on Raspi/VC4 [1] but might be important for other
drivers: It fixes an improper initialization.

[1] https://lists.freedesktop.org/archives/mesa-dev/2018-March/190562.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...i-Initialise-modifier-to-INVALID-for-DRI2.patch | 43 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.3.7.bb          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch b/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
new file mode 100644
index 0000000000..6aba7859ee
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
@@ -0,0 +1,43 @@
+From 4cbecb61682a0ee426faaa03d824fc8fd7aef826 Mon Sep 17 00:00:00 2001
+From: Daniel Stone <daniels@collabora.com>
+Date: Mon, 2 Apr 2018 13:20:34 +0100
+Subject: [PATCH] st/dri: Initialise modifier to INVALID for DRI2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When allocating a buffer for DRI2, set the modifier to INVALID to inform
+the backend that we have no supplied modifiers and it should do its own
+thing. The missed initialisation forced linear, even if the
+implementation had made other decisions.
+
+This resulted in VC4 DRI2 clients failing with:
+  Modifier 0x0 vs. tiling (0x700000000000001) mismatch
+
+Signed-off-by: Daniel Stone <daniels@collabora.com>
+Reported-by: Andreas Müller <schnitzeltony@gmail.com>
+Reviewed-by: Eric Anholt <eric@anholt.net>
+Fixes: 3f8513172ff6 ("gallium/winsys/drm: introduce modifier field to winsys_handle")
+
+Upstream-Status: Backport [1]
+
+[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=4cbecb61682a0ee426faaa03d824fc8fd7aef826
+---
+ src/gallium/state_trackers/dri/dri2.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gallium/state_trackers/dri/dri2.c b/src/gallium/state_trackers/dri/dri2.c
+index 31d17d46c2..58a6757f03 100644
+--- a/src/gallium/state_trackers/dri/dri2.c
++++ b/src/gallium/state_trackers/dri/dri2.c
+@@ -806,6 +806,7 @@ dri2_allocate_textures(struct dri_context *ctx,
+          whandle.handle = buf->name;
+          whandle.stride = buf->pitch;
+          whandle.offset = 0;
++         whandle.modifier = DRM_FORMAT_MOD_INVALID;
+          if (screen->can_share_buffer)
+             whandle.type = DRM_API_HANDLE_TYPE_SHARED;
+          else
+-- 
+2.14.3
+
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.7.bb b/meta/recipes-graphics/mesa/mesa_17.3.7.bb
index fe09a2988d..9c75d6c693 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.7.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
+           file://0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch \
            "
 
 SRC_URI[md5sum] = "769137f2538562c300c4b76bcb097377"
-- 
2.14.3


