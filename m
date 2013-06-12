Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id D9C866AAF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:45 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so4816430eek.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WN4npj8bo+rqZg7EXQE4I2zSooQzzPO7f0vn/rtbvYI=;
	b=Wmqzv1dUyyyJypp/qjaMQpYE2ulULyzqGIZZcmb/rYYO6L01dJaldBLyZgF+urL76Y
	uEswcAvHeP5r0tZixldplyRFC2thD8Nu/TEzMSpchcoURnR+/WhFeuoVWHDXFKyA0q49
	Tm0w3Bmov3wywSkCOnIEMTyDQz56YmUr7SXmj6DAdNS8W2fEj+Q0e8+XOin9edaNyzen
	UHLDYND0rAG01N6U0Wq85ApF+TUXKO/oHc2RbJzqsOWP7x5s2TNP7Jhu9/IggrbRFPSS
	iniMFK5TyHvFQWf33MCe46yeecEfDWc8emGhWqBmRl1hwN3ROdmyY3pZyB1BJpJUiqwu
	+EPg==
X-Received: by 10.14.198.136 with SMTP id v8mr23270614een.68.1371079186637;
	Wed, 12 Jun 2013 16:19:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id a4sm6210243eez.0.2013.06.12.16.19.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:19:58 +0200
Message-Id: <6e9c021605231d98915a46f7c0b0dde624ea5c3f.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/10] mesa: introduce PACKAGECONFIG for dri
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:46 -0000

* move DEPENDS which were originally applied only for mesa-dri to
  dri PACKAGECONFIG

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index dd91981..9d59166 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555
 INC_PR = "r9"
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libdrm expat udev"
+DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
@@ -23,21 +23,21 @@ inherit autotools pkgconfig pythonnative
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
-PACKAGECONFIG ??= "egl gles \
+PACKAGECONFIG ??= "egl gles dri \
 		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
 		${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
 		"
 
-X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes dri2proto"
+X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[wayland] = ",,wayland"
 
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
+PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm udev"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
-EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
 EXTRA_OECONF += "--enable-gbm"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
-- 
1.8.2.1


