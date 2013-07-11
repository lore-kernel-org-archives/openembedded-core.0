Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 08D6160687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:05:15 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 03:05:13 +0200
Message-Id: <1373504713-10663-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] xserver-xorg: extend packageconfig and dependencies
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
X-List-Received-Date: Thu, 11 Jul 2013 01:05:15 -0000

- split glx into dri, dri2 and glx, to be able to select e.g. dri2 only
- update dependencies to match configure.ac

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 3d68413..ab8171c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -23,7 +23,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
+PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto"
 LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl libgcrypt"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
@@ -122,11 +122,11 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
+PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
-                      --disable-dri --disable-dri2 --disable-glx,\
-                      xf86driproto dri2proto mesa"
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto mesa xf86driproto"
+PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
+PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.8.1.2


