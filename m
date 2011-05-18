Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMc01-0000eN-8j
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 May 2011 01:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; d="scan'208";a="438114115"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2011 01:18:01 -0700
Message-Id: <7b345b51e1769461514c0e211ca3cc4923fee780.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 18:44:36 -0700
Date: Wed, 18 May 2011  1:18:00 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 14/15] qemu: Fix Dependency and compatible machines
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
X-List-Received-Date: Wed, 18 May 2011 08:20:58 -0000

From: Saul Wold <sgw@linux.intel.com>

add DEFAULT_PREFERENCE = "-1" to disable git recipe
Added libx11 for GL support to DEPENDS
Use BROKEN to disable qemuarm and qemumips world build of qemu target

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc       |   10 +++++++---
 meta/recipes-devtools/qemu/qemu_0.14.0.bb |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb    |    7 +++++--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 49bcf8e..18073eb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "zlib alsa-lib"
+DEPENDS = "zlib alsa-lib qemugl"
 
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
@@ -16,7 +16,6 @@ EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --di
 
 #EXTRA_OECONF += "--disable-sdl"
 
-COMPATIBLE_MACHINES = "qemux86 qemuppc"
 
 inherit autotools
 
@@ -43,9 +42,14 @@ do_configure() {
     chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
-SRC_URI_append_virtclass-nativesdk = " file://glflags.patch;patch=1"
+SRC_URI_append_virtclass-nativesdk = " file://glflags.patch"
+DEPENDS_virtclass-native = "zlib-native alsa-lib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk qemugl-nativesdk"
 RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
 EXTRA_OECONF_virtclass-nativesdk += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Qemu target will not build in world build for ARM or Mips
+BROKEN_qemuarm = "1"
+BROKEN_qemumips = "1"
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index f0a4bea..ccf5ee4 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r1"
+PR = "r2"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index 2d6a8bd..59fc7f1 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -5,8 +5,8 @@ SRCREV = "56a60dd6d619877e9957ba06b92d2f276e3c229d"
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PV = "0.14"
-PR = "r0"
+PV = "0.14.0"
+PR = "r1"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-git/"
 FILESDIR = "${WORKDIR}"
@@ -23,3 +23,6 @@ SRC_URI = "\
 
 S = "${WORKDIR}/git"
 
+DEFAULT_PREFERENCE = "-1"
+
+
-- 
1.7.3.4



