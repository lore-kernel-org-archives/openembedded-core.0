Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgBoO-0005Rn-Pa
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 11:02:40 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 01:48:15 -0800
Received: by mail-we0-f197.google.com with SMTP id t11so4016134wey.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 01:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=xsNVovYd8ZPjabwRcAjrYbc4Ep4PmFrvfDKPDvRYuxc=;
	b=M3D3ybt4ByhdKRYqhvIiudPn5J7bEls5bJoICMJFGVBhWy2a9XkgLyay5MofvMKt0R
	eIqeCvOWuNIhiJDhwp7Tgfv+6h2syWe7rpQVwb3ydk+0wczO0iLZGP/a/Wz46XA9BprD
	fi92c67GmGUDl7N63qRFRKeH7fGRbTnpRBKSZnf8bcYMoC/Ckzki5jDTIlL4jYcg3Vec
	mrHpPbYOR/6rA6OonuYMBzUTELtt+sGIRUxn3B6uLtGMEo79YUIcI1aQOyg7VqdPM6kX
	oWVO6bCW9y8TZyCCeRetpmylM2/SMQksSv50W5T0wRPxKOTHoHdS+HEIWG+Z/UcoKdqV
	NBIA==
Received: by 10.216.73.195 with SMTP id v45mr5545460wed.161.1354700893376;
	Wed, 05 Dec 2012 01:48:13 -0800 (PST)
Received: by 10.216.73.195 with SMTP id v45mr5545453wed.161.1354700893210;
	Wed, 05 Dec 2012 01:48:13 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bz12sm5640331wib.5.2012.12.05.01.48.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 01:48:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 09:46:35 +0000
Message-Id: <1354700795-17864-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmxxIa0Ry+EC85EYnZikMqLfcGrdqgIyEGr+3IL3VtqfccBxXLigkHyEuJiMucKj2+8pUx6yEq+bHRxMkjff2lOcxPhy9cQidoKs+tezx6EthQ+OxqzYXnpVvGrm3GjSQx12foqUZoVT0aZ+e1h9YvHBP6EyPwA3RMShEKcaBMU+E3ra8j7FjnXnogJyKjYdKmr2vAL
Subject: [PATCH] mesa: merge internal libraries into mesa-dri package
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
X-List-Received-Date: Wed, 05 Dec 2012 10:02:41 -0000

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



