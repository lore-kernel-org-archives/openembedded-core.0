Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA1072332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 21:36:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2015 13:36:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,413,1418112000"; d="scan'208";a="513479474"
Received: from localhost.jf.intel.com ([10.7.201.167])
	by orsmga003.jf.intel.com with ESMTP; 16 Jan 2015 13:30:17 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jan 2015 13:36:35 -0800
Message-Id: <1421444195-10330-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] xserver-xorg: Always disable systemd-logind.
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
X-List-Received-Date: Fri, 16 Jan 2015 21:36:45 -0000

Without a dm to handle the session management systemd-logind can make it
difficult for X to gain ownership of devices and behave properly.

Since X seems to work without enabling systemd-logind, always disable it for
now, and we can revisit it if we ever want to try to take advantage of
multi-user sessions/seats.

[Yocto # 7100]
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 5b47e34..6154295 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -114,10 +114,10 @@ EXTRA_OECONF += "--with-fop=no \
                  --with-xkb-output=/var/lib/xkb \
                  --with-sha1=libcrypto \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
+                 --disable-systemd-logind \
 "
 
-PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
 
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
@@ -128,7 +128,6 @@ PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtua
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[systemd] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,dbus-lib"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.9.3


