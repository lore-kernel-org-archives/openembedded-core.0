Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1Qswev-0007ZG-1Z
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:52:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 05:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; d="scan'208";a="39637299"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2011 05:47:09 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 21:05:42 +0800
Message-Id: <34d0c69915195c65e082c2575dc233716bf9ab57.1313413181.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <075afb79207fbd6b862f7821cf5077ffbf0b71c8.1313413181.git.jiajun.xu@intel.com>
References: <075afb79207fbd6b862f7821cf5077ffbf0b71c8.1313413181.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1313413181.git.jiajun.xu@intel.com>
References: <cover.1313413181.git.jiajun.xu@intel.com>
Subject: [PATCH 2/2] libsdl: enable opengl for libsdl
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
X-List-Received-Date: Mon, 15 Aug 2011 12:52:49 -0000

To enable opengl for libsdl, we need DEPENDS on virtual/libgl. Add a check for
"opengl" in DISTRO_FEATURES and when it's set, "--enable-video-opengl"
and "virtual/libgl" will be added into EXTRA_CONF and DEPENDS.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
Acked-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.11.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
index 7c1c507..f08077d 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
@@ -10,10 +10,10 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-DEPENDS = "virtual/libx11 libxext libxrandr libxrender"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender"
 DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
 	   file://acinclude.m4 \
@@ -33,7 +33,8 @@ EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-thread
                 --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
                 --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
-                --disable-video-opengl --enable-input-events --enable-pthreads \
+                --enable-input-events --enable-pthreads \
+		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
 		--disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen"
 
-- 
1.7.1



