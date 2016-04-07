Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFCA6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 11:49:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 07 Apr 2016 04:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="80824421"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2016 04:49:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 14:49:44 +0300
Message-Id: <1460029784-11035-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459950176-29324-1-git-send-email-jussi.kukkonen@intel.com>
References: <1459950176-29324-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [PATCH v2] x11-common: Add PACKAGECONFIG for screen blanking
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
X-List-Received-Date: Thu, 07 Apr 2016 11:49:56 -0000

when "blank" is not in PACKAGECONFIG, explicitly set dpms and
screensaver off. The intention here is to make it easier to
create builds that should not blank the screen (just remove
"blank" from x11-common PACKAGECONFIG).

Also remove a unneeded "find -exec rm" from do_install.

Partly fixes [YOCTO #7278].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since V1:
* use Xserver.in with @BLANK_ARGS@ as Otavio suggested
* remove a "find -exec rm" invocation that seems to be leftover from
  older changes: there are no files the find could match.


 .../x11-common/x11-common/{etc/X11/Xserver => Xserver.in}        | 2 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb               | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/x11-common/x11-common/{etc/X11/Xserver => Xserver.in} (81%)

diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver b/meta/recipes-graphics/x11-common/x11-common/Xserver.in
similarity index 81%
rename from meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
rename to meta/recipes-graphics/x11-common/x11-common/Xserver.in
index 73570df..b8eed76 100644
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
+++ b/meta/recipes-graphics/x11-common/x11-common/Xserver.in
@@ -5,7 +5,7 @@ XSERVER=/usr/bin/Xorg
 
 . /etc/profile
 
-ARGS=" -br -pn"
+ARGS=" -br -pn @BLANK_ARGS@"
 
 DISPLAY=':0'
 
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 156b329..6d7c347 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -9,14 +9,21 @@ inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "file://etc \
+           file://Xserver.in \
            file://gplv2-license.patch"
 
 S = "${WORKDIR}"
 
+PACKAGECONFIG ??= "blank"
+# dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
+PACKAGECONFIG[blank] = ""
+
 do_install() {
 	cp -R ${S}/etc ${D}${sysconfdir}
+	sed -e 's/@BLANK_ARGS@/${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}/' \
+		${S}/Xserver.in > ${D}${sysconfdir}/X11/Xserver
+
 	chmod -R 755 ${D}${sysconfdir}
-	find ${D}${sysconfdir} -type f -name \*~ -exec rm -rf {} \;
 }
 
 RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"
-- 
2.1.4


