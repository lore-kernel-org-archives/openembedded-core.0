Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id B3DFB76D96
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:11 +0000 (UTC)
Received: by qgez77 with SMTP id z77so96999436qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8TJcBSaGSAjLIkAuNZyEdC9n3yrcDeuutDW+Qs8u9AA=;
	b=r5on4DPgCgOABBmmXgwodutLlfDEVpTE3lVS+zV9ELbmi3bmrsIpDrNv68X6VGteRE
	mHWuVC2dzYFQy2lwq+DemOgMGoyd74jUpCPVe0Yk+99aesNlN5HxJQw3kaz2mWWXGpZW
	BlNo8nGEbM4MVes9DJTQAiQx1yjgm0Sz8vwaR5TV1LujvWFTiE7beQ3sgkfGBSq0zfmY
	PyynnDS8Wcyk2X0P7tP3eeAZRKXkgvlVr4DkSUmBp7HofhkGqsLkXvbHnGobSEHp2xfV
	2r773Yq4TPLqFvHfD3QHWmaf1d2j8q6cepL37BdZxJLsGmCwZ5aauP77cSuCOaGe0miQ
	hQHw==
X-Received: by 10.140.134.21 with SMTP id 21mr42578803qhg.51.1441753691784;
	Tue, 08 Sep 2015 16:08:11 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:56 +0000
Message-Id: <aaaafc16ef9a7ff67a743f277333adc47588ad4c.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 16/16] directfb: Avoid using VLAs and printf formats
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:11 -0000

These are not portable features and are flagged by clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |  4 +-
 ...direct-Aboid-usng-VLAs-and-printf-formats.patch | 61 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 4fbca87..446aaea 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -14,7 +14,9 @@ DEPENDS = "jpeg libpng freetype zlib tslib sysfsutils"
 SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz \
            file://configurefix.patch \
            file://fusion.patch \
-           file://bashism.patch"
+           file://bashism.patch \
+           file://0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch \
+          "
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
diff --git a/meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch b/meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
new file mode 100644
index 0000000..76e0f75
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
@@ -0,0 +1,61 @@
+From f43ef44806ffb8e3b35d99070dde9b6cc1714d3d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Sep 2015 21:32:20 +0000
+Subject: [PATCH] gfx,direct: Aboid usng VLAs and printf formats
+
+VLAs are flagged by clang when using non-POD types, therefore replace
+the usage with alloca which is exact same allocation on stack
+
+ __attribute__((__format__ (__printf__))) is not portable as used here
+ therefore disable the check for clang here, we lose no functionality
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ lib/direct/util.h | 2 +-
+ src/gfx/util.cpp  | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/direct/util.h b/lib/direct/util.h
+index 72941e9..8e7fa4a 100644
+--- a/lib/direct/util.h
++++ b/lib/direct/util.h
+@@ -98,7 +98,7 @@
+ #define D_CONST_FUNC
+ #endif
+ 
+-#if __GNUC__ >= 3
++#if __GNUC__ >= 3 && !defined __clang__
+ #define D_FORMAT_PRINTF(n)         __attribute__((__format__ (__printf__, n, n+1)))
+ #define D_FORMAT_VPRINTF(n)        __attribute__((__format__ (__printf__, n, 0)))
+ #else
+diff --git a/src/gfx/util.cpp b/src/gfx/util.cpp
+index 40032bc..d1015d4 100644
+--- a/src/gfx/util.cpp
++++ b/src/gfx/util.cpp
+@@ -294,8 +294,8 @@ dfb_gfx_copy_regions_stereo( CoreSurface           *source,
+ {
+      unsigned int i, n = 0;
+      DFBRectangle rect = { 0, 0, source->config.size.w, source->config.size.h };
+-     DFBRectangle rects[num];
+-     DFBPoint     points[num];
++     DFBRectangle *rects =  (DFBRectangle*)alloca( sizeof(struct DFBRectangle) * num);
++     DFBPoint *points =  (DFBPoint*)alloca( sizeof(struct DFBPoint) * num);
+ 
+      for (i=0; i<num; i++) {
+           DFB_REGION_ASSERT( &regions[i] );
+@@ -351,8 +351,8 @@ dfb_gfx_copy_regions_client( CoreSurface             *source,
+ {
+      unsigned int             i, n = 0;
+      DFBRectangle             rect = { 0, 0, source->config.size.w, source->config.size.h };
+-     DFBRectangle             rects[num];
+-     DFBPoint                 points[num];
++     DFBRectangle            *rects =  (DFBRectangle*)alloca( sizeof(struct DFBRectangle) * num);
++     DFBPoint                *points =  (DFBPoint*)alloca( sizeof(struct DFBPoint) * num);
+      CoreGraphicsStateClient *client = _client ? _client : &StateClient::Get()->client;
+      CardState               *state  = client->state;
+      CardState                backup;
+-- 
+2.5.1
+
-- 
2.5.1


