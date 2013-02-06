Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1U347A-0005Zg-D1
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 13:28:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2013 04:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,615,1355126400"; d="scan'208";a="283519679"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.38])
	by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2013 04:11:38 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 14:12:14 +0200
Message-Id: <1360152734-15731-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Wed, 06 Feb 2013 12:28:38 -0000

- enables qemu to run images with video output without the need for vncviewer.
- SDLPACKAGECONFIG is used because there is no need for the native-libsdl
package when building the qemu-native package.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2b60347..4633f47 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,8 +3,7 @@ HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman"
 DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native"
-DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman"
-RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
+DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-glib-2.0 nativesdk-pixman"
 
 require qemu-targets.inc
 inherit autotools
@@ -13,10 +12,6 @@ BBCLASSEXTEND = "native nativesdk"
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
-SDL ?= "--disable-sdl"
-SDL_class-native ?= ""
-SDL_class-nativesdk ?= ""
-
 SRC_URI = "\
     file://powerpc_rom.bin \
     file://no-strip.patch \
@@ -32,7 +27,7 @@ SRC_URI_append_class-nativesdk = "\
     file://relocatable_sdk.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
 				--disable-curl \
@@ -83,7 +78,15 @@ do_install_append() {
 }
 # END of qemu-mips workaround
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "sdl"
+PACKAGECONFIG_class-native ??= "sdl"
+PACKAGECONFIG_class-nativesdk ??= "sdl"
+
+PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,${SDLPACKAGECONFIG},${SDLPACKAGECONFIG}"
+
+SDLPACKAGECONFIG = "libsdl"
+SDLPACKAGECONFIG_class-native = ""
+SDLPACKAGECONFIG_class-nativesdk = "nativesdk-libsdl"
 
 # Qemu target will not build in world build for ARM or Mips
 BROKEN_qemuarm = "1"
-- 
1.7.9.5



