Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 56D1776651
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 14:59:32 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p63so117438512wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=oeE0Sn+j8jKiO8VTKXnkUVV6n8q1lQPQ2zNkYU08lvY=;
	b=jgAmCXORL3qEOzzhvRODPHCxvSBwl1QcVXr6SLgr/hjR1W9Twk0cLJKPwcMcnbq3nH
	hbP5G59jYymhg0uZwraG13L1zww1jsDgLKvfqTcHxkIHLQg21pFTKBurhARAV/MGt1Lr
	5bDCYmTQrWNx1UGGpeFMjYSg6pfduNEZ+rm6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oeE0Sn+j8jKiO8VTKXnkUVV6n8q1lQPQ2zNkYU08lvY=;
	b=hd9T80ltt8kL8z6/WjCCD+Za+VyWnEnt/M2YbAo+EeTRzO8ftdO65aXLJOv9ka9nQL
	ma3KnefU+Cya8BTis/qQIYgMbu437Yj6B/+l9EZeIg0WCXFDduuGQawQP0Ib/mp5YqKf
	TWwtztV4QzF2+v5n/I36XXcNf4tRrpI0UgLziqot41Z1xEGDRsLxazLbZHP6QkKfPod8
	oZk0YzoyegMhnoWvWtdy+kFwPqVOvzPnkST3hHUzNM5c9aLzID9/9BPAh38S1vXnaG5m
	9zrTHf11fyliedffvs5Umc0gqAx7YP2IWTVkIdt/FcYnPnALAsfcwYufRKMrCOoNMtl9
	/92A==
X-Gm-Message-State: AG10YOQ3n7y6C1mdVO6ziFtjQpeQHZAaA70ZU/lhzExlgOUCnuyEaOWdkrshT2fhxgRXexgA
X-Received: by 10.194.82.36 with SMTP id f4mr30375226wjy.87.1454943572286;
	Mon, 08 Feb 2016 06:59:32 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	js8sm30077237wjc.37.2016.02.08.06.59.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 06:59:31 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	jussi.kukkonen@intel.com
Date: Mon,  8 Feb 2016 14:59:08 +0000
Message-Id: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Mon, 08 Feb 2016 14:59:34 -0000

* update SRC_URI and checksum.
* add PACKAGECONFIG to offer choice of crypto implementation (for sha1 functions)
* use libcrypto by default. In upstream commit a24bdce4, support for
  SHA-1 was copied from xserver repo, so let's use the same default for
  --with-sha1 option that we use in xserver recipe in OE core.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---

Changes in v2:
 * added PACKAGECONFIG to offer choice of crypto implementation
 * Tested openssl on Dragonboard 410c, but build tested other options 
   (and inspected build and configure logs)

 .../mesa/{mesa-gl_10.6.3.bb => mesa-gl_11.1.1.bb}                 | 0
 meta/recipes-graphics/mesa/mesa.inc                               | 8 +++++++-
 meta/recipes-graphics/mesa/{mesa_10.6.3.bb => mesa_11.1.1.bb}     | 6 +++---
 3 files changed, 10 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.6.3.bb => mesa-gl_11.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.6.3.bb => mesa_11.1.1.bb} (66%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb b/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9b316e1..5ce96dd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
-PACKAGECONFIG ??= "egl gles dri \
+PACKAGECONFIG ??= "egl gles dri ${MESA_CRYPTO} \
 		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
 		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
 		"
@@ -62,6 +62,12 @@ PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs,
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
 
+# Mesa requires one of the following crypto implementation, pick one of them
+MESA_CRYPTO ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
+PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
+PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
diff --git a/meta/recipes-graphics/mesa/mesa_10.6.3.bb b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
similarity index 66%
rename from meta/recipes-graphics/mesa/mesa_10.6.3.bb
rename to meta/recipes-graphics/mesa/mesa_11.1.1.bb
index 5da56ad..5d73feb 100644
--- a/meta/recipes-graphics/mesa/mesa_10.6.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
@@ -1,9 +1,9 @@
 require ${BPN}.inc
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/older-versions/10.x/${PV}/mesa-${PV}.tar.xz"
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "553e525d2f20ed48fca8f1ec3176fd83"
-SRC_URI[sha256sum] = "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88f5e5818fe2e4676d"
+SRC_URI[md5sum] = "1043dfb907beecb2a761272455960427"
+SRC_URI[sha256sum] = "64db074fc514136b5fb3890111f0d50604db52f0b1e94ba3fcb0fe8668a7fd20"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.7.0


