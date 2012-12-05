Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgIrm-0003SO-BW
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 18:34:38 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 09:20:12 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so5256000fav.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 09:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=xsNVovYd8ZPjabwRcAjrYbc4Ep4PmFrvfDKPDvRYuxc=;
	b=g8aC9V+mNNkZOEqkL9FtHbWwbG8kd+2GqfQGinOqTtsRxbmYhxz7IuTl5VB7NPAvWa
	qil6PdN42GFOaRImFRQWCVqOiLEIEFzosaJtnPh0ksc9/gVsSOVoSUE+emEThzVJCsTA
	3blnkLJUgGMTBc0FFc/L3RskcMACXtglFDBJktRnIY6xR3jE5n593LNYwfwQEPnWBLwX
	+vpJmUzx8KD/GvxPsuaULjsSzaCfPbwqxPUSmaQBoI1mx1VKm3PnC0uv2M7WbBvoOuth
	E9z6pO4JKMu9uo/ZFHIpqa6S6lEvkeFFt4csuBZUSXmm32ZsqdMAn2A8c/tkeOktXwtq
	FGEg==
Received: by 10.216.203.152 with SMTP id f24mr7179006weo.61.1354728003779;
	Wed, 05 Dec 2012 09:20:03 -0800 (PST)
Received: by 10.216.203.152 with SMTP id f24mr7178998weo.61.1354728003481;
	Wed, 05 Dec 2012 09:20:03 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id b1sm7260209wix.11.2012.12.05.09.20.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 09:20:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 17:18:25 +0000
Message-Id: <1354727906-16779-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQngPd89KaYh9lftltEorinjI6+7USpk+3zyu+sMqwGpoOiG5O6rJIicDQFjTcLsz9Wno0vjdRINOEdzSH2tO/VLpAxt8fgLvAKRf+Dn11n+XdpAWKtlzr4ztpQ0teCRj91h8DoO5Wk1sFHUeM8R8eCd1X7Ho4t98Vpd4fkjlvWx1DMEsh1ClWqYaLgfCTPnvc1Gma3h
Subject: [PATCH 1/2] mesa: merge internal libraries into mesa-dri package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 17:34:38 -0000

libglapi and libgbm are specific to Mesa and it's unlikely that they'll be used
on their own.  Mesa 9 also adds another internal library, libdricore, so prepare
for that by putting these mesa-specific libraries into the mesa-dri package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index d5f83e4..9113ba8 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r5"
+INC_PR = "r6"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -37,14 +37,9 @@ PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-# Remove the mesa-dri dependency on mesa-dri-dev, as mesa-dri is empty
-RDEPENDS_${PN}-dev = ""
-
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
-             libglapi libglapi-dev \
-             libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
             "
@@ -54,6 +49,10 @@ do_install_append () {
     rm -f ${D}${includedir}/GL/glu*
 }
 
+RREPLACES_${PN} = "libgbm1 libglapi0"
+RPROVIDES_${PN} = "libgbm1 libglapi0"
+RCONFLICTS_${PN} = "libgbm1 libglapi0"
+
 # For the packages that make up the OpenGL interfaces, inject variables so that
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
@@ -76,18 +75,16 @@ python __anonymous() {
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 }
 
-FILES_libegl-mesa = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
-FILES_libgbm = "${libdir}/libgbm.so.*"
+FILES_${PN} = "${libdir}/libgbm.so.* ${libdir}/libglapi.so.*"
+FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES_libgl-mesa = "${libdir}/libGL.so.*"
-FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
+FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${libdir}/libgbm.so ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h ${libdir}/libglapi.so"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
-FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
-- 
1.7.10



