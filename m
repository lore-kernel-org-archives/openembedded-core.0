Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5406B6AFBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:58:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 03:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="364727543"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2013 03:58:14 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 13:58:03 +0300
Message-Id: <14f6b30d582dc297c92c0a8a630cfe7f4cd88e56.1372933905.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9b803f18c25bc5b0bcab26f6bea6caacb6784d47.1372933905.git.laurentiu.palcu@intel.com>
References: <9b803f18c25bc5b0bcab26f6bea6caacb6784d47.1372933905.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372933905.git.laurentiu.palcu@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 4/5] xserver-nodm-init: remove xuser creation, RDEPEND on xuser-account
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
X-List-Received-Date: Thu, 04 Jul 2013 10:58:14 -0000

[YOCTO #4345]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../x11-common/xserver-nodm-init.bb                |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index d2797a9..8490c81 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 PR = "r31"
-RDEPENDS_${PN} = "sudo"
+RDEPENDS_${PN} = "sudo xuser-account"
 
 SRC_URI = "file://xserver-nodm \
            file://Xusername \
@@ -23,17 +23,8 @@ do_install() {
     fi
 }
 
-inherit update-rc.d useradd
+inherit update-rc.d
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
-# Use fixed Xusername of xuser for now, this will need to be
-# fixed if the Xusername changes from xuser
-# IMPORTANT: because xuser is shared with connman, please make sure the
-# USERADD_PARAM is in sync with the one in connman.inc
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--create-home \
-                       --groups video,tty,audio,input \
-                       --user-group xuser"
-
-- 
1.7.9.5


