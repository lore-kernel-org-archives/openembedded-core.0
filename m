Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qfj26-0002bD-Mj
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jul 2011 03:42:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2011 18:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,506,1304319600"; d="scan'208";a="26044872"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2011 18:38:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2011 18:38:08 -0700
Message-Id: <c493eb28be982387fd2002e389fed7afeac45b39.1310261708.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310261708.git.sgw@linux.intel.com>
References: <cover.1310261708.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310261708.git.sgw@linux.intel.com>
References: <cover.1310261708.git.sgw@linux.intel.com>
Subject: [RC2 PATCH 1/2] libx11: ensure nativesdk uses correct DEPENDS and XCB flags
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
X-List-Received-Date: Sun, 10 Jul 2011 01:42:06 -0000

The inital patch was for native, but nativesdk also needs the
same change.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
index 04d4a97..f98bbe8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
 
 PE = "1"
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://nodolt.patch \
@@ -18,11 +18,18 @@ SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c8
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native libxcb"
 
-DEPENDS_virtclass-native += "bigreqsproto-native xproto-native xextproto-native xtrans-native libxau-native xcmiscproto-native \
-            libxdmcp-native xf86bigfontproto-native kbproto-native inputproto-native xproto-native"
+DEPENDS_virtclass-native += "bigreqsproto-native xextproto-native \
+            xtrans-native libxau-native xcmiscproto-native \
+            libxdmcp-native xf86bigfontproto-native kbproto-native \
+            inputproto-native xproto-native"
+
+DEPENDS_virtclass-nativesdk += "bigreqsproto xproto xextproto \
+            xtrans libxau xcmiscproto libxdmcp xf86bigfontproto kbproto \
+            inputproto xproto-native"
 
 XCB = "--with-xcb"
 XCB_virtclass-native = "--without-xcb"
+XCB_virtclass-nativesdk = "--without-xcb"
 EXTRA_OECONF += "${XCB}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



