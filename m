Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC456FFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:44:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 05:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="960442786"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 05:44:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 15:44:08 +0300
Message-Id: <5dbd238f28ac08a748bbdcd549286a8d48da9c2c.1464004128.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
References: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464004128.git.jussi.kukkonen@intel.com>
References: <cover.1464004128.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/5] matchbox-keyboard: Upgrade
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
X-List-Received-Date: Mon, 23 May 2016 12:44:17 -0000

This version includes:
* french keyboard and the Caps improvements it requires
* Gtk+3 input method is now included (not enabled by default yet)

Define some additional PACKAGECONFIGs: the default configuration does
not change.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index eba1970..fb4c6e9 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/matchbox-keyboard.h;endline=17;md5=9d6586c69e4a926f3cb0b4425f24ba3c \
                     file://applet/applet.c;endline=18;md5=4a0f721724746b14d95b51ddd42b95e7"
 
-DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
+DEPENDS = "libfakekey expat libxft"
 
-SRCREV = "ebc330eac8b9d38e9aef9f01e7241c904bd01073"
+SRCREV = "69d03e2aceb79cf7a616c07f8e0be4e1f9f7976b"
 PV = "0.0+git${SRCPV}"
-PR = "r4"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
@@ -25,7 +24,12 @@ inherit autotools pkgconfig gettext gtk-immodules-cache distro_features_check
 # The libxft, libfakekey and matchbox-panel-2 requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = "--disable-cairo --enable-gtk-im --enable-applet"
+EXTRA_OECONF = "--disable-cairo"
+
+PACKAGECONFIG ??= "gtk2-im applet"
+PACKAGECONFIG[applet] = "--enable-applet,--disable-applet,matchbox-panel-2"
+PACKAGECONFIG[gtk2-im] = "--enable-gtk-im,--disable-gtk-im,gtk+"
+PACKAGECONFIG[gtk3-im] = "--enable-gtk3-im,--disable-gtk3-im,gtk+3"
 
 PACKAGES += "${PN}-im ${PN}-applet"
 
-- 
2.1.4


