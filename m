Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AC2F96FF04
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 10:17:15 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tB3AHGFm032659 for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Dec 2015 04:17:16 -0600
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015120304171577-699399 ;
	Thu, 3 Dec 2015 04:17:15 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 3 Dec 2015 12:17:14 +0200
Message-Id: <1449137834-20165-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/03/2015 04:17:15 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/03/2015 04:17:16 AM,
	Serialize complete at 12/03/2015 04:17:16 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-03_01:, , signatures=0
Subject: [RESEND PATCH] x11vnc: move recipe to meta-oe
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
X-List-Received-Date: Thu, 03 Dec 2015 10:17:15 -0000

x11vnc can be configured with --use-system-libvncserver to use an
external libvncserver which will be added to meta-oe. Since oe-core
should not depend on meta-oe, we move x11vnc there.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-graphics/x11vnc/files/endian-fix.patch | 24 ---------------------
 .../x11vnc/files/starting-fix.patch                | 25 ----------------------
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      | 25 ----------------------
 3 files changed, 74 deletions(-)
 delete mode 100644 meta/recipes-graphics/x11vnc/files/endian-fix.patch
 delete mode 100644 meta/recipes-graphics/x11vnc/files/starting-fix.patch
 delete mode 100644 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb

diff --git a/meta/recipes-graphics/x11vnc/files/endian-fix.patch b/meta/recipes-graphics/x11vnc/files/endian-fix.patch
deleted file mode 100644
index f2a538b..0000000
--- a/meta/recipes-graphics/x11vnc/files/endian-fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-libvncserver: replace LIBVNCSERVER_WORDS_BIGENDIAN with WORDS_BIGENDIAN
-
-since macro AC_C_BIGENDIAN is used in autoconf and WORDS_BIGENDIAN is
-automatically set for different arch, it is better to use WORDS_BIGENDIAN
-instead of LIBVNCSERVER_WORDS_BIGENDIAN, which cuase issue in mips.
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-Upstream-Status: Pending
-
-diff --git a/libvncserver/main.c b/libvncserver/main.c
-index b6bd930..8bbb7bf 100644
---- a/libvncserver/main.c
-+++ b/libvncserver/main.c
-@@ -47,7 +47,7 @@ static MUTEX(extMutex);
- 
- static int rfbEnableLogging=1;
- 
--#ifdef LIBVNCSERVER_WORDS_BIGENDIAN
-+#ifdef WORDS_BIGENDIAN
- char rfbEndianTest = (1==0);
- #else
- char rfbEndianTest = (1==1);
-
diff --git a/meta/recipes-graphics/x11vnc/files/starting-fix.patch b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
deleted file mode 100644
index f62e405..0000000
--- a/meta/recipes-graphics/x11vnc/files/starting-fix.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-"-gui" & "-rfbport" require "wish" installed, or else x11vnc fails to start.
-Removing these 2 parameters makes x11vnc works well on poky sato image.
-
-Add also -skip_lockkeys option to ignore all Caps_Lock, Shift_Lock, Num_Lock,
-Scroll_Lock keysyms received from viewers, in order to leave the lock state on
-the server side unchanged. Yet, the keys will appear correctly.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: x11vnc-0.9.12/x11vnc/x11vnc.desktop
-===================================================================
---- x11vnc-0.9.12.orig/x11vnc/x11vnc.desktop	2011-03-03 10:33:18.000000000 +0800
-+++ x11vnc-0.9.12/x11vnc/x11vnc.desktop	2011-03-03 10:35:20.000000000 +0800
-@@ -1,7 +1,7 @@
- [Desktop Entry]
- Name=X11VNC Server
- Comment=Share this desktop by VNC
--Exec=x11vnc -gui tray=setpass -rfbport PROMPT -bg -o %%HOME/.x11vnc.log.%%VNCDISPLAY
-+Exec=x11vnc -bg -rfbport 5900 -skip_lockkeys -o %%HOME/.x11vnc.log.%%VNCDISPLAY
- Icon=computer
- Terminal=false
- Type=Application
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
deleted file mode 100644
index ec0241f..0000000
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Exports your X session on-the-fly via VNC"
-HOMEPAGE = "http://www.karlrunge.com/x11vnc/"
-
-SECTION = "x11/utils"
-AUTHOR = "Karl Runge"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
-                    file://x11vnc/x11vnc.h;endline=33;md5=6f95dc6535467d7ee1563fd434fb372e"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
-           file://starting-fix.patch \
-           file://endian-fix.patch "
-
-SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
-SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
-
-DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
-
-inherit autotools-brokensep distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
-PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
-PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
-- 
2.1.4


