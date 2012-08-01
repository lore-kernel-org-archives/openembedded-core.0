Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAH-0001q3-B1
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:49 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:12 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so4667579wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=5ejrAdVmeHAk9BkcIPRmB/qJ76VOtYgLdSENlkQuOe8=;
	b=LKmyaZyDoHg7PFgtUujb+5ikKSjXxNhesjk3fJU4Ty4wXZ+F6rfueD6ssixupW0cQB
	e81kaqQx8VUVi/6dB+OgY0PgI9eVO1p9SLAWFik25L+wvOKVdFHEbcIcq93E1qbe9tNl
	UBlwzUnwhUHG93DzrKv0bvmx41Da5WH+4vC0eTaH8ZdJkT1z8eGYTK1Tg5Q5O4iX/twC
	TlcFfuqyi+V5ipBJR5fIgrAiKjx3NBlBoug/UXExzcB8xPS9S2BeVbQt9TXw4peCrRJM
	t+CSIXx/3/RLDVXg3UXBPxMLybNDFBTenKo4mZAkzPR1J/FDM49oUMFPyb36/RQG76Bj
	frnw==
Received: by 10.216.121.16 with SMTP id q16mr8162883weh.193.1343835431938;
	Wed, 01 Aug 2012 08:37:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:34 +0100
Message-Id: <3c795b7f602849169ae8ddc99dcb9172e27a37e7.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnTmgqOQNsj9V7R7ckAlFC3hfZJV0WLWxGUKGnoFl+Yn7eSLgjRu2zznjDsd++jBvGLjEAQ
Subject: [PATCH 07/11] mesa: enable GLES v1 and v2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 15:48:49 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   10 ++++++++--
 meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 01eb5b3..e1e5cb1 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r0"
+INC_PR = "r1"
 PE = "2"
 
 
@@ -21,7 +21,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 
 DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
 
-PROVIDES = "virtual/libgl"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
 
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
@@ -46,10 +46,14 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
              libgl libgl-dev \
              libglapi libglapi-dev libglapi-dbg\
              libgbm libgbm-dev libgbm-dbg \
+             libgles1 libgles1-dev \
+             libgles2 libgles2-dev \
             "
 
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgbm = "${libdir}/libgbm.so.*"
+FILES_libgles1 = "${libdir}/libGLESv1.so.*"
+FILES_libgles2 = "${libdir}/libGLESv2.so.*"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
@@ -59,6 +63,8 @@ FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
+FILES_libgles1-dev = "${libdir}/libGLESv1.* ${includedir}/GLES1 ${libdir}/pkgconfig/glesv1.pc"
+FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index f8f1fff..ab4487f 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -10,6 +10,7 @@ DRIDRIVERS_append_x86-64 = ",i915,i965"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
+EXTRA_OECONF += "--enable-gles1 --enable-gles2"
 EXTRA_OECONF += "--disable-egl --enable-gbm"
 
 python populate_packages_prepend() {
-- 
1.7.10



