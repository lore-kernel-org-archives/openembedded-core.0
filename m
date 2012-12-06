Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tgajs-0006PX-CX
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 13:39:40 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 04:25:12 -0800
Received: by mail-we0-f197.google.com with SMTP id t11so5018519wey.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 04:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=SP5cMapEDU7gG0UbsUyNHeiKCford5bYX3IXaCibtAk=;
	b=RyAZMAIQmM5v9CnJk6ppuFAJeb30aBK9RLzmtZ2uKRp9WYPQD/HNjswF4NB1pKNGEl
	D70v3Sy9xv0s11GDDeXv0E2t0E1Rgh9gy4YUlNtfjNR59Pf7k+IDOrTzNyOZe1mGt7ki
	ce2DJBp54O9eMxKTiU5NJEvr+uiEylnQlOOBKszpGWKhkbdAT41EPG6RgMrGEicPzlZq
	PlRjgo0K+/5nY63c+ATF+FGbYdaGZocxYA01wBsXJrlkKNLWKkD8Wd/HYEuwx4xYYDMW
	THKYZjUzgynALssTG4t2lpAH4ZgH5vBLweVZLa/bDS7WRPd57k908sBes2UEbziPb5Si
	RALw==
Received: by 10.180.92.166 with SMTP id cn6mr2322101wib.19.1354796710134;
	Thu, 06 Dec 2012 04:25:10 -0800 (PST)
Received: by 10.180.92.166 with SMTP id cn6mr2322093wib.19.1354796710034;
	Thu, 06 Dec 2012 04:25:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm22921211wib.4.2012.12.06.04.25.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 04:25:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 12:23:31 +0000
Message-Id: <00c93976db485ebbff0096fe35a57c641ce876c9.1354796499.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1354796499.git.ross.burton@intel.com>
References: <cover.1354796499.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkDZur0xe7nPlq+Wx8HmeXCiwM0nTVAUtrRWQJ6btjexZ8hSd/auwWIXbvhDk0DRY/BjT7JOHkkkpZE+nSxdj9Y3IFZ46hi6DaVrqLOETCjhERpHDpSUmc7MyLr499PjGhoYzkEyNjDqDN+vpHS2ASy+SK8q6E63c812I4b0qDuMILfkiTdpbPPmaAuiH4ggy/WYq0C
Subject: [PATCH 1/3] mesa: common packaging cleanup
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
X-List-Received-Date: Thu, 06 Dec 2012 12:39:40 -0000

mesa-dri ships the configuration file in mesa 9, so ship that and don't claim
it's empty.   Clean up libegl and libgbm packaging.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index d5f83e4..e661eee 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r5"
+INC_PR = "r6"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -37,9 +37,6 @@ PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-# Remove the mesa-dri dependency on mesa-dri-dev, as mesa-dri is empty
-RDEPENDS_${PN}-dev = ""
-
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
@@ -76,7 +73,8 @@ python __anonymous() {
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 }
 
-FILES_libegl-mesa = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+FILES_${PN} = "${sysconfdir}/drirc"
+FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
@@ -84,8 +82,9 @@ FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
+FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
-FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
+FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
-- 
1.7.10



