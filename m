Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0aly-0003SW-IU
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:39:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2012 07:31:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="114034016"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2012 07:31:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 15:31:29 +0000
Message-Id: <93f208b0f3dba1fd80248c4e19ae8e2453b1f6fd.1330010964.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330010964.git.paul.eggleton@linux.intel.com>
References: <cover.1330010964.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330010964.git.paul.eggleton@linux.intel.com>
References: <cover.1330010964.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] libsdl: allow building without x11
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

Disable X11 output support for target and nativesdk if x11 is not in
DISTRO_FEATURES.

Fixes [YOCTO #2020]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index 5b87f39..62a2d1f 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -12,10 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
 PROVIDES = "virtual/libsdl"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender tslib"
-DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
+           tslib"
+DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
@@ -32,11 +34,12 @@ inherit autotools lib_package binconfig pkgconfig
 EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
                 --enable-file --disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
-                --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
+                --disable-mintaudio --disable-nasm --disable-video-dga \
                 --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
                 ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
+                ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen \
                 --disable-rpath \
-- 
1.7.5.4



