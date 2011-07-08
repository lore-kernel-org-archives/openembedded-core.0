Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QfEw5-0004u6-BU
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:33:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 10:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24991329"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2011 10:29:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:29:42 -0700
Message-Id: <110ffac7f56eaf55ce13d3f35007dec4d60e1b08.1310145969.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310145969.git.sgw@linux.intel.com>
References: <cover.1310145969.git.sgw@linux.intel.com>
Subject: [PATCH v2 4/4] libx11: enable xcb support
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
X-List-Received-Date: Fri, 08 Jul 2011 17:33:53 -0000

[YOCTO #1196]

XCB support is needed in libx1l, it has been enabled in libx11-trim for
sometime and was not in full version. The usage here is for LSB testing,
which uses full libx11.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
index 3e046a1..04d4a97 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
 
 PE = "1"
-PR = "r1"
+PR = "r3"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://nodolt.patch \
@@ -16,8 +16,13 @@ SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
 SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
-            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
+            libxdmcp xf86bigfontproto kbproto inputproto xproto-native libxcb"
 
-EXTRA_OECONF += "--without-xcb"
+DEPENDS_virtclass-native += "bigreqsproto-native xproto-native xextproto-native xtrans-native libxau-native xcmiscproto-native \
+            libxdmcp-native xf86bigfontproto-native kbproto-native inputproto-native xproto-native"
+
+XCB = "--with-xcb"
+XCB_virtclass-native = "--without-xcb"
+EXTRA_OECONF += "${XCB}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



