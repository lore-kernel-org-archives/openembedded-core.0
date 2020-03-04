Return-Path: <nhartman@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60861611E1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 22:05:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 024M5wEv025405
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 4 Mar 2020 14:05:58 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 4 Mar 2020 14:05:57 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 8B691900983;
	Wed,  4 Mar 2020 14:05:57 -0800 (PST)
From: Nathan Hartman <hnathan918@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2020 14:05:55 -0800
Message-ID: <20200304220555.30563-1-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Nathan Hartman <hnathan918@gmail.com>
Subject: [PATCH] mesa: updated to 20.0 release
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
X-List-Received-Date: Wed, 04 Mar 2020 22:05:59 -0000
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>

Uprev'd mesa and mesa-gl recipes to 20.0 release.

As glx-tls was updated to elf-tls in the 20.0 release, the mesa.inc file
was updated to reflect this change.


---
 .../mesa/{mesa-gl_19.1.6.bb => mesa-gl_20.0.0.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc                 | 12 ++++++------
 .../mesa/{mesa_19.1.6.bb => mesa_20.0.0.bb}         | 13 +++++++------
 3 files changed, 13 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_20.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_20.0.0.bb} (54%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e5808ee27..a678ceae00 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=c1843d93c460bbf778d6037ce324f9f7"
 
 PE = "2"
 
@@ -57,12 +57,12 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-                   glx-tls \
+                   elf-tls \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls"
 
-PACKAGECONFIG_remove_libc-musl = "glx-tls"
+PACKAGECONFIG_remove_libc-musl = "elf-tls"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
@@ -70,7 +70,7 @@ PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
-PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
+PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
 PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_20.0.0.bb
similarity index 54%
rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_20.0.0.bb
index 19221e9e25..d38754e852 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.0.bb
@@ -1,13 +1,14 @@
 require ${BPN}.inc
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-           file://0002-meson.build-make-TLS-GLX-optional-again.patch \
-           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
+	   file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+	   file://0002-meson.build-make-TLS-ELF-optional.patch \
+	   file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
+	   file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
+	   file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            "
-
-SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
-SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
+SRC_URI[md5sum] = "681229d992bbd6250a5be4f308708795"
+SRC_URI[sha256sum] = "bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1


