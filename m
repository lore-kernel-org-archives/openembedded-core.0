Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A52EE702A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:01:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2014 01:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,663,1400050800"; d="scan'208";a="569954762"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.85])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 01:01:30 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:00:48 +0300
Message-Id: <1405411250-10594-5-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
References: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH 5/9] weston-init: add xuser and enable user-sesssion-launch
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
X-List-Received-Date: Tue, 15 Jul 2014 08:01:50 -0000

(*) add xuser
(*) enable user-session-launch@.service for xuser (seat0-1000)

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 60cdb8d..6eeeab0 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -13,10 +13,12 @@ do_install() {
        fi
 
        if ${@base_contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+               install -d ${D}/${sysconfdir}/systemd/system/graphical.target.wants
+               ln -sf ${systemd_unitdir}/system/user-session-launch@.service ${D}/${sysconfdir}/systemd/system/graphical.target.wants/user-session-launch@seat0-1000.service
        fi
 }
 
-inherit allarch update-rc.d
+inherit allarch update-rc.d useradd
 
 RDEPENDS_${PN} = "weston \
                   ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'kbd', '', d)} \
@@ -28,3 +30,8 @@ DEPENDS += "weston \
 
 INITSCRIPT_NAME = "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'weston', '', d)}"
 INITSCRIPT_PARAMS = "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'start 9 5 2 . stop 20 0 1 6 .', '', d)}"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--create-home \
+ --groups video,tty,audio,input,weston-launch \
+ --user-group xuser"
-- 
1.9.1


