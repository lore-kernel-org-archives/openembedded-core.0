Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id BC9E974738
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 320D320BA0;
	Tue, 10 Apr 2018 19:06:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JdqTl5CZvMCn; Tue, 10 Apr 2018 19:06:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 078DB203A8;
	Tue, 10 Apr 2018 19:06:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7DCD916342D;
	Tue, 10 Apr 2018 15:06:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:06:09 -0400
Message-Id: <1523387170-30191-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Tue, 10 Apr 2018 19:06:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Official announcement:
https://lists.freedesktop.org/archives/wayland-devel/2018-April/037767.html

| libwayland-egl is now part of libwayland, and will presumably be removed
| from mesa in the not too distant future.

Update mesa recipe by removing corresponding libwayland-egl entries.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/mesa/mesa.inc                                | 7 ++++---
 .../wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb}               | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.14.0.bb => wayland_1.15.0.bb} (92%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b501b7e..c3a8e76 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -119,7 +119,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
-             libwayland-egl libwayland-egl-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
             "
@@ -134,6 +133,10 @@ do_install_append () {
     # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
     rm -f ${D}${sysconfdir}/drirc
     chrpath --delete ${D}${libdir}/dri/*_dri.so || true
+
+    # libwayland-egl has been moved to wayland 1.15+
+    rm -f ${D}${libdir}/libwayland-egl.so*
+    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
@@ -204,7 +207,6 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
-FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
 FILES_libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
@@ -216,7 +218,6 @@ FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/p
 FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libgles3-mesa-dev = "${includedir}/GLES3"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
-FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
 FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.14.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.15.0.bb
index 1a9ff98..788105b 100644
--- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
@@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 	   file://fixpathinpcfiles.patch \
            "
-SRC_URI[md5sum] = "0235f6075c32c3be61cff94fa0b9f108"
-SRC_URI[sha256sum] = "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8"
+SRC_URI[md5sum] = "b7393c17fdce9a8d383edab656c92fd2"
+SRC_URI[sha256sum] = "eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


