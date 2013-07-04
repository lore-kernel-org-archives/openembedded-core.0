Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5626B01E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:58:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 03:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="364727532"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2013 03:58:13 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 13:58:02 +0300
Message-Id: <d470eef8b29eabfdb6ebda763cf90b0045e5a09e.1372933905.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9b803f18c25bc5b0bcab26f6bea6caacb6784d47.1372933905.git.laurentiu.palcu@intel.com>
References: <9b803f18c25bc5b0bcab26f6bea6caacb6784d47.1372933905.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372933905.git.laurentiu.palcu@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 3/5] connman: remove xuser creation, RDEPEND on xuser-account
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
X-List-Received-Date: Thu, 04 Jul 2013 10:58:13 -0000

[YOCTO #4345]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index e6584ff..6b5ea0b 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -60,14 +60,7 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
-# IMPORTANT: because xuser is shared with rootless X, please make sure the
-# USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--create-home \
-                       --groups video,tty,audio \
-                       --user-group xuser"
-
-inherit autotools gtk-doc pkgconfig systemd update-rc.d useradd
+inherit autotools gtk-doc pkgconfig systemd update-rc.d
 
 do_configure_append () {
 	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
@@ -118,6 +111,7 @@ RDEPENDS_${PN} = "\
 	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
 	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
 	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
+	xuser-account \
 	"
 
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
-- 
1.7.9.5


