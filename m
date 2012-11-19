Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaU5K-0006Bp-IP
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 17:20:34 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Nov 2012 08:05:47 -0800
Received: by mail-la0-f69.google.com with SMTP id w12so3621732lag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 08:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=RjWC9JDmRA51rAbCUeB4kA6zhvuzFd/JT4K3Cnkjbio=;
	b=cUZXYrwJ2ZXKDipfwgMr85qaXAeC/9r9QENSqUX7ZtCGNiTuY+cC39ERQj9ZhAXY87
	oFeOeinvsIacOmQ1Egw09Z7vcbntaTmaRO+uE4cUkeclNjKwzwbq5V+ABFutnEcb5yAw
	5XC4XD5P/lr6e7RtrrnGF68xygSjGXpiM07gxlJAsTWw8SMl+tm2YypgXWUKCy+yXLoQ
	l0uXGTOMq/Ctc9K2xl7GrVyEP0lqAfnWzXcSGLeTSWE71T9l3ajgyWtwJJKAQkEwAbOt
	qKYt1yjvjdI5WTJIWTIv/Oz8udd8afBzj469vs4mX5I/c8exDQMc+z9zScnvJgeYlEEm
	J5Nw==
Received: by 10.216.193.29 with SMTP id j29mr1581346wen.143.1353341183854;
	Mon, 19 Nov 2012 08:06:23 -0800 (PST)
Received: by 10.216.193.29 with SMTP id j29mr1581341wen.143.1353341183662;
	Mon, 19 Nov 2012 08:06:23 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id i6sm13924680wix.5.2012.11.19.08.06.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 08:06:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 16:04:54 +0000
Message-Id: <1353341095-11669-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlfRccBHtqOJ+9xilrbbvTf+hsUCQ7+b9LMzdxiJkUG7ztIM4wPfmZDKJLkXoFMpTwCWfA6fKfDjRVl3GAefraPpjFZ1M60mDVBYsBIODcN58VIHMIV5rmHijsU+mJG0wSSQYBTsIyynPcLam9ItC1WmBeIKIecM9Vy6fSz3PxdnZ+VTTNbVQz/mhhUuPU5idJevhJs
Subject: [PATCH 1/2] mesa: add -mesa suffix to GL packages, RPROVIDE their generic names
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
X-List-Received-Date: Mon, 19 Nov 2012 16:20:35 -0000

When Debian-renaming, all packages that provide GL libraries get renamed to the
same name, and it's entirley possible for a feed to have multiple GL libraries
in.  This obviously creates conflicts.

Resolve this for Mesa by forcing the package names to be of the form libgl-mesa,
and RPROVIDE libgl.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc   |   46 +++++++++++++++++++-------
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb   |    2 +-
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 460877c..8e71378 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -41,13 +41,13 @@ EXCLUDE_FROM_WORLD = "1"
 # Remove the mesa-dri dependency on mesa-dri-dev, as mesa-dri is empty
 RDEPENDS_${PN}-dev = ""
 
-PACKAGES =+ "libegl libegl-dev \
+PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
-             libgl libgl-dev \
+             libgl-mesa libgl-mesa-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
-             libgles1 libgles1-dev \
-             libgles2 libgles2-dev \
+             libgles1-mesa libgles1-mesa-dev \
+             libgles2-mesa libgles2-mesa-dev \
             "
 
 do_install_append () {
@@ -55,20 +55,42 @@ do_install_append () {
     rm -f ${D}${includedir}/GL/glu*
 }
 
-FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+# For the packages that make up the OpenGL interfaces, inject variables so that
+# they don't get Debian-renamed (which would remove the -mesa suffix), and
+# RPROVIDEs/RCONFLICTs on the generic libgl name.
+python __anonymous() {
+    for p in (("libegl", "libegl1"), ("libgl", "libgl1"),
+              ("libgles1", "libglesv1-cm1"), ("libgles2", "libglesv2-2")):
+        fullp = p[0] + "-mesa"
+        pkgs = " ".join(p)
+        d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
+        d.appendVar("RREPLACES_" + fullp, pkgs)
+        d.appendVar("RPROVIDES_" + fullp, pkgs)
+        d.appendVar("RCONFLICTS_" + fullp, pkgs)
+        
+        # For -dev, the first element is both the Debian and original name
+        fullp += "-dev"
+        pkgs = p[0]
+        d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
+        d.appendVar("RREPLACES_" + fullp, pkgs)
+        d.appendVar("RPROVIDES_" + fullp, pkgs)
+        d.appendVar("RCONFLICTS_" + fullp, pkgs)
+}
+
+FILES_libegl-mesa = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgbm = "${libdir}/libgbm.so.*"
-FILES_libgles1 = "${libdir}/libGLESv1*.so.*"
-FILES_libgles2 = "${libdir}/libGLESv2.so.*"
-FILES_libgl = "${libdir}/libGL.so.*"
+FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
+FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
+FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
-FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
-FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
 FILES_libglapi-dev = "${libdir}/libglapi.*"
-FILES_libgles1-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
-FILES_libgles2-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
+FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
+FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
index fb35676..fabb99d 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
@@ -1,4 +1,4 @@
 require mesa-common.inc
 require mesa-${PV}.inc
 require mesa-dri.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index de1aa14..5f8697a 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -5,4 +5,4 @@ require mesa-dri.inc
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
-- 
1.7.10



