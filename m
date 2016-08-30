Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF66731C2;
	Tue, 30 Aug 2016 08:32:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 30 Aug 2016 01:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="1049053642"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2016 01:32:15 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 11:32:09 +0300
Message-Id: <89ab2ab4cfeacea4e4df70379b63ae8ad4a5615b.1472467394.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25c4531d30a0b7fc5e629a5e57cc393a5de20b6d.1472467394.git.jussi.kukkonen@intel.com>
References: <25c4531d30a0b7fc5e629a5e57cc393a5de20b6d.1472467394.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1472467394.git.jussi.kukkonen@intel.com>
References: <cover.1472467394.git.jussi.kukkonen@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] x11-common: Remove Xserver script
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
X-List-Received-Date: Tue, 30 Aug 2016 08:32:22 -0000

X startup is now handled in xserver-nodm-init.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/x11-common/x11-common/Xserver.in | 12 ------------
 meta/recipes-graphics/x11-common/x11-common_0.1.bb     | 10 +---------
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/Xserver.in

diff --git a/meta/recipes-graphics/x11-common/x11-common/Xserver.in b/meta/recipes-graphics/x11-common/x11-common/Xserver.in
deleted file mode 100644
index b8eed76..0000000
--- a/meta/recipes-graphics/x11-common/x11-common/Xserver.in
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-#
-
-XSERVER=/usr/bin/Xorg
-
-. /etc/profile
-
-ARGS=" -br -pn @BLANK_ARGS@"
-
-DISPLAY=':0'
-
-exec xinit /etc/X11/Xsession -- $XSERVER $DISPLAY $ARGS $*
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 2bc0d33..ab9a939 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -9,22 +9,14 @@ inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "file://etc \
-           file://Xserver.in \
            file://gplv2-license.patch"
 
 S = "${WORKDIR}"
 
-PACKAGECONFIG ??= "blank"
-# dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
-PACKAGECONFIG[blank] = ""
-
 do_install() {
 	cp -R ${S}/etc ${D}${sysconfdir}
-	sed -e 's/@BLANK_ARGS@/${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}/' \
-		${S}/Xserver.in > ${D}${sysconfdir}/X11/Xserver
-
 	chmod -R 755 ${D}${sysconfdir}
 }
 
-RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xinput-calibrator xinit formfactor"
+RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xinput-calibrator formfactor"
 
-- 
2.1.4


