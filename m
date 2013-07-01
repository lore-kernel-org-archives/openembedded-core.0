Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6310D6AF9E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 19:36:27 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id o10so2282181eaj.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Uj0dyP7oaYSOizVLBfCRNPfJxXjGwqm/DFHwgYAjeG8=;
	b=COsGs7WR9dk1SKPS+O5BEMckePXAcDOYGiPqMJsMU2RkCKg10xZCXwnccR37SKIGF/
	4OXS9pWsiLOuQKLbnO/y7XLWr+SxrGEyk7FdVQJh8J03azalVF8Kseoclvgaqm0kRwg5
	N+61OEV4UWNngSukoD9jddu5v+O4kqmMAiNqXn8zw5ClFoTZp4+Mx33jJ9CcE4gfdN5c
	9bMjyAs1Vxf68Z7buEw/uGamT3t8jh6EmJ2+aW5FO962zD0mszu7B9ILgEdmgYEpOXvI
	0jnQPSvywmcblefMe+f6yLRGKnTmaNXCmu3RRErW8Gelgzr4XEAql7Ttlbara1I6Txc9
	iv3Q==
X-Received: by 10.14.1.70 with SMTP id 46mr22759874eec.82.1372707387897;
	Mon, 01 Jul 2013 12:36:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm31712591eeb.8.2013.07.01.12.36.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 12:36:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 21:36:24 +0200
Message-Id: <814d1612d36ac296ec0e5b522722b4a10f57ea16.1372707180.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1372707180.git.Martin.Jansa@gmail.com>
References: <cover.1372707180.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/4] mesa: Improve gallium PACKAGECONFIG options
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
X-List-Received-Date: Mon, 01 Jul 2013 19:36:27 -0000

* rename llvmpipe to llvm to match configure option
* add MESA_LLVM_RELEASE to allow switching to 3.3 easier
* --enable-gallium isn't recognized option, split it to 2 more
  PACKAGECONFIGs for gbm and egl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 01dbbad..599ec7e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,10 +49,13 @@ PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disa
 PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
 
 GALLIUMDRIVERS = "swrast"
-PACKAGECONFIG[gallium] = "--enable-gallium --with-gallium-drivers=${GALLIUMDRIVERS}, --disable-gallium --without-gallium-drivers"
-
-export WANT_LLVM_RELEASE = "3.2"
-PACKAGECONFIG[gallium-llvmpipe] = "--enable-gallium-llvm --enable-gallium-egl --enable-gallium-gbm --with-llvm-shared-libs --with-gallium-drivers=${GALLIUMDRIVERS}, --disable-gallium --without-gallium-drivers, llvm3.2"
+# keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
+PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
+PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
+PACKAGECONFIG[gallium-gbm]  = "--enable-gallium-gbm, --disable-gallium-gbm"
+MESA_LLVM_RELEASE ?= "3.2"
+PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE}"
+export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
-- 
1.8.2.1


