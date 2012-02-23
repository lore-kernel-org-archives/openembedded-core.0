Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0alx-0003SW-PZ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:39:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2012 07:31:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="114034008"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2012 07:31:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 15:31:28 +0000
Message-Id: <07c37e2b8bfc88fe139892b28607e96363aca9ec.1330010964.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330010964.git.paul.eggleton@linux.intel.com>
References: <cover.1330010964.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330010964.git.paul.eggleton@linux.intel.com>
References: <cover.1330010964.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] qemu: enable building qemu-nativesdk without x11
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
X-List-Received-Date: Thu, 23 Feb 2012 15:39:58 -0000

Allow building for nativesdk with x11 removed from DISTRO_FEATURES
by conditionally disabling qemugl (which requires X).

Fixes [YOCTO #2020]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc       |    3 ++-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |   13 ++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 33abf96..27ce14d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -57,7 +57,8 @@ do_install () {
 }
 
 DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native"
-DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk qemugl-nativesdk glib-2.0-nativesdk"
+DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk glib-2.0-nativesdk \
+                               ${@base_contains('DISTRO_FEATURES', 'x11', 'qemugl-nativesdk', '', d)}"
 RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
 EXTRA_OECONF_virtclass-nativesdk += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls"
 
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 3a6389b..b6a2294 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r2"
+PR = "r3"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -36,10 +36,17 @@ SRC_URI_append_virtclass-native = "\
     "
 
 SRC_URI_append_virtclass-nativesdk = "\
-    ${QEMUGLPATCHES} \
-    file://glflags.patch \
+    ${@base_contains('DISTRO_FEATURES', 'x11', '${QEMUGLPATCHES} file://glflags.patch', '', d)}  \
     "
 SRC_URI[md5sum] = "34f17737baaf1b3495c89cd6d4a607ed"
 SRC_URI[sha256sum] = "7705b14d9b8e4df4a0b1790980e618084261e8daef0672a1aa7a830a0f3db5ba"
 
 S = "${WORKDIR}/qemu-${PV}"
+
+do_configure_prepend_virtclass-nativesdk() {
+	if [ "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "" ] ; then
+		# Undo the -lX11 added by linker-flags.patch
+		sed -i 's/-lX11//g' Makefile.target
+	fi
+}
+
-- 
1.7.5.4



