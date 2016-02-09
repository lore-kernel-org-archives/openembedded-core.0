Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BB82773189
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 09:19:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2016 01:20:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="880249384"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2016 01:19:59 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	nicolas.dechesne@linaro.org
Date: Tue,  9 Feb 2016 11:24:55 +0200
Message-Id: <b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
References: <aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1455008560.git.jussi.kukkonen@intel.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Tue, 09 Feb 2016 09:20:00 -0000

Default to libcrypto (openssl) as before.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6648cd3..f4c5469 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -27,7 +27,7 @@ inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto presentproto"
-LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl libgcrypt"
+LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
 # Split out some modules and extensions from the main package
@@ -117,10 +117,10 @@ EXTRA_OECONF += "--with-fop=no \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
-                 --with-sha1=libcrypto \
 "
 
-PACKAGECONFIG ??= "dri2 udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
+PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "xwayland", "", d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)} \
 "
@@ -139,6 +139,12 @@ PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xineramaproto"
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland libepoxy"
 
+# Xorg requires a SHA1 implementation, pick one
+XORG_CRYPTO ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
+PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
+PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
+
 do_install_append () {
 	# Its assumed base-files creates this for us
 	rmdir ${D}${localstatedir}/log/
-- 
2.1.4


