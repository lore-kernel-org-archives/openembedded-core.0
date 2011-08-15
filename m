Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Qswal-0007QG-Dr
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:48:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2011 05:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37873751"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2011 05:43:53 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 20:40:46 +0800
Message-Id: <edd51def7cc31eaa3d67f7cc73bf5fded2351f5f.1313411859.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313411858.git.edwin.zhai@intel.com>
References: <cover.1313411858.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1313411858.git.edwin.zhai@intel.com>
References: <cover.1313411858.git.edwin.zhai@intel.com>
Subject: [PATCH 2/2] qemu: Make qemu buildable inside qemux86/qemuppc target
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
X-List-Received-Date: Mon, 15 Aug 2011 12:48:32 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

It requires libx11 and libGL(if enabled GL) for building, which introduce extra
dependence in qemuppc target. Futhermore, qemu's GL code is x86-oriented, thus
some hacks needed for building in qemupcc. For simplicity, just make qemu GL's
code for native only, so that qemu building is okay in world build.

[YOCTO #1011] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc       |    5 ++---
 meta/recipes-devtools/qemu/qemu_0.14.0.bb |   27 ++++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 85476d6..e5414ff 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "zlib alsa-lib qemugl"
+DEPENDS = "zlib alsa-lib virtual/libx11"
 
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
@@ -40,7 +40,7 @@ do_configure_prepend_virtclass-native() {
 
 do_configure() {
     ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --disable-strip ${EXTRA_OECONF}
-    chmod a+x ${S}/target-i386/beginend_funcs.sh
+    test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
 do_install () {
@@ -50,7 +50,6 @@ do_install () {
 	install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
 }
 
-SRC_URI_append_virtclass-nativesdk = " file://glflags.patch"
 DEPENDS_virtclass-native = "zlib-native alsa-lib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk qemugl-nativesdk"
 RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index de12f62..dc9b695 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -11,22 +11,39 @@ FILESDIR = "${WORKDIR}"
 SRC_URI = "\
     http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
     file://powerpc_rom.bin \
-    file://qemu-git-qemugl-host.patch \
     file://no-strip.patch \
-    file://fix-nogl.patch \
-    file://qemugl-allow-glxcontext-release.patch \
     file://linker-flags.patch \
-    file://init-info.patch \
     file://qemu-vmware-vga-depth.patch \
-    file://enable-i386-linux-user.patch \
     file://fix-configure-checks.patch \
     file://fallback-to-safe-mmap_min_addr.patch \
     file://spice-qxl-locking-fix-for-qemu-kvm.patch \
     file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
     file://larger_default_ram_size.patch \
+    "
+
+SRC_URI_append_virtclass-native = "\
+    file://qemu-git-qemugl-host.patch \
+    file://fix-nogl.patch \
+    file://qemugl-allow-glxcontext-release.patch \
+    file://init-info.patch \
+    file://enable-i386-linux-user.patch \
     file://qemugl-fix.patch \
     file://opengl-sdl-fix.patch \
     "
+
+SRC_URI_append_virtclass-nativesdk = "\
+    file://qemu-git-qemugl-host.patch \
+    file://fix-nogl.patch \
+    file://qemugl-allow-glxcontext-release.patch \
+    file://init-info.patch \
+    file://enable-i386-linux-user.patch \
+    file://qemugl-fix.patch \
+    file://opengl-sdl-fix.patch \
+    file://glflags.patch \
+    "
+
+#SRC_URI_append_virtclass-nativesdk = " file://glflags.patch"
+
 SRC_URI[md5sum] = "f9d145d5c09de9f0984ffe9bd1229970"
 SRC_URI[sha256sum] = "ba21e84d7853217830e167dae9999cdbff481189c6a0bb600ac7fb7201453108"
 
-- 
1.7.1



