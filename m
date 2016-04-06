Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 62AF8770C4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 13:43:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 06 Apr 2016 06:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,447,1455004800"; d="scan'208";a="939516694"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2016 06:43:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 16:42:56 +0300
Message-Id: <1459950176-29324-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] x11-common: Add PACKAGECONFIG for screen blanking
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
X-List-Received-Date: Wed, 06 Apr 2016 13:43:18 -0000

when "blank" is not in PACKAGECONFIG, explicitly set dpms and
screensaver off. The intention here is to make it easier to
create builds that should not blank the screen (just remove
"blank" from x11-common PACKAGECONFIG).

Partly fixes [YOCTO #7278].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---


Adding a packageconfig didn't seem like particularly nice way to set
runtime configuration but it was the simplest I could think of.
I can try adding a xorg.conf snippet to xserver-xf86-config if that's
seen as better...

Jussi



 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver | 3 ++-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb          | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
index 73570df..8d5f9b8 100644
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
+++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
@@ -5,7 +5,8 @@ XSERVER=/usr/bin/Xorg
 
 . /etc/profile
 
-ARGS=" -br -pn"
+BLANK_ARGS=""
+ARGS=" -br -pn $BLANK_ARGS"
 
 DISPLAY=':0'
 
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 156b329..2da178f 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -13,10 +13,15 @@ SRC_URI = "file://etc \
 
 S = "${WORKDIR}"
 
+PACKAGECONFIG ??= "blank"
+# dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
+PACKAGECONFIG[blank] = ""
+
 do_install() {
 	cp -R ${S}/etc ${D}${sysconfdir}
 	chmod -R 755 ${D}${sysconfdir}
 	find ${D}${sysconfdir} -type f -name \*~ -exec rm -rf {} \;
+        sed -i -e 's/^BLANK_ARGS=.*/BLANK_ARGS="${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}"/' ${D}${sysconfdir}/X11/Xserver
 }
 
 RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"
-- 
2.1.4


