Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A44317029E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:01:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2014 01:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,663,1400050800"; d="scan'208";a="569954758"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.85])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 01:01:28 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:00:47 +0300
Message-Id: <1405411250-10594-4-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
References: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH 4/9] weston-init: added systemd build logic
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
X-List-Received-Date: Tue, 15 Jul 2014 08:01:49 -0000

Handle the case when systemd is in DISTRO_FEATURES.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 38b78bc..60cdb8d 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -7,13 +7,24 @@ SRC_URI = "file://init"
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+       if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
+               install -d ${D}/${sysconfdir}/init.d
+               install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+       fi
+
+       if ${@base_contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+       fi
 }
 
 inherit allarch update-rc.d
 
-RDEPENDS_${PN} = "weston kbd"
+RDEPENDS_${PN} = "weston \
+                  ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'kbd', '', d)} \
+                  ${@base_contains('DISTRO_FEATURES', 'systemd', 'user-session-units', '', d)} \
+                  "
+
+DEPENDS += "weston \
+            ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
-INITSCRIPT_NAME = "weston"
-INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_NAME = "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'weston', '', d)}"
+INITSCRIPT_PARAMS = "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'start 9 5 2 . stop 20 0 1 6 .', '', d)}"
-- 
1.9.1


