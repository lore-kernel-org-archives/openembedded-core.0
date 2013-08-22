Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEFB608A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 19:56:38 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Aug 2013 12:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="285515103"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2013 12:56:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:56:33 -0700
Message-Id: <1377201393-16778-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] pulseaudio: Fix up configure options and use gtk+3
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
X-List-Received-Date: Thu, 22 Aug 2013 19:56:40 -0000

Pulseaudio 4.0 switch from gtk+ to gtk+3, a floating dependency
had occurred during a build which made me check into this.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |   11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index f1b346c..afe8410 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -20,14 +20,7 @@ inherit autotools pkgconfig useradd gettext perlnative
 USE_NLS = "yes"
 
 EXTRA_OECONF = "\
-		--disable-lynx \
-		--disable-polkit \
-		--without-jack \
-		--with-glib \
-		--with-alsa \
-		--with-oss \
-		--without-hal \
-		--disable-hal \
+		--disable-hal-compat \
 		--disable-orc \
 		--enable-tcpwrap=no \
 		--with-access-group=audio \
@@ -44,7 +37,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '',
                    ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk x11', '', d)}"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4 sbc"
-PACKAGECONFIG[gtk] = "--enable-gtk2,--disable-gtk2,gtk+"
+PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
-- 
1.7.10.4


